program private_voting.aleo {
    // 定义投票记录 Record
    // 每个投票者持有一个 Ticket，包含他们的地址和投票选择
    record Ticket {
        owner: address,
        candidate: u32,
    }

    // 公开的投票计数 Mapping
    // 存储每个候选人的投票数
    mapping vote_count: u32 => u64;

    // 初始化投票系统
    // 在部署时调用，初始化候选人的票数为 0
    transition init_voting() {
        return then finalize();
    }

    finalize init_voting() {
        // 初始化两个候选人的票数
        Mapping::set(vote_count, 1u32, 0u64);
        Mapping::set(vote_count, 2u32, 0u64);
    }

    // 发起投票 - 生成隐私投票凭证
    // 用户调用此函数生成一个包含其投票选择的隐私 Ticket
    // 参数：candidate - 候选人编号（1 或 2）
    // 返回：Ticket - 包含投票人地址和选择的隐私记录
    transition cast_vote(candidate: u32) -> Ticket {
        assert(candidate == 1u32 || candidate == 2u32);
        return Ticket {
            owner: self.caller,
            candidate: candidate,
        };
    }

    // 计票 - 将隐私投票转换为公开统计
    // 投票者通过提交他们的 Ticket 来完成投票
    // 这个函数验证投票的有效性，并更新公开的投票计数
    transition tally_vote(ticket: Ticket) {
        assert(ticket.candidate == 1u32 || ticket.candidate == 2u32);
        return then finalize(ticket.candidate);
    }

    finalize tally_vote(candidate: u32) {
        // 获取该候选人当前的票数
        let current_votes: u64 = Mapping::get_or_use(vote_count, candidate, 0u64);
        // 票数加 1
        Mapping::set(vote_count, candidate, current_votes + 1u64);
    }

    // 查询投票结果 - 获取特定候选人的票数
    // 参数：candidate - 候选人编号
    // 返回：该候选人的总票数
    transition get_vote_count(candidate: u32) -> u64 {
        assert(candidate == 1u32 || candidate == 2u32);
        return Mapping::get(vote_count, candidate);
    }

    // 获取所有候选人的票数
    // 返回：候选人 1 和候选人 2 的票数
    transition get_all_votes() -> (u64, u64) {
        let votes_1: u64 = Mapping::get(vote_count, 1u32);
        let votes_2: u64 = Mapping::get(vote_count, 2u32);
        return (votes_1, votes_2);
    }
}
