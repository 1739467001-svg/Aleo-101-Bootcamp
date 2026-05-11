import React, { useState } from 'react';
import { AleoWorker } from './workers/AleoWorker'; // 模拟 Aleo SDK 交互

function App() {
  const [account, setAccount] = useState(null);
  const [isVoting, setIsVoting] = useState(false);
  const [voteStatus, setVoteStatus] = useState('');

  const connectWallet = async () => {
    // 模拟连接 Leo Wallet
    setAccount('aleo1...xxxx');
    setVoteStatus('钱包已连接');
  };

  const handleVote = async (candidateId) => {
    if (!account) return alert('请先连接钱包');
    
    setIsVoting(true);
    setVoteStatus(`正在为候选人 ${candidateId} 生成隐私投票证明...`);
    
    try {
      // 模拟调用 Aleo SDK 发起 vote_private 交易
      // const tx = await aleo.execute('private_vote.aleo', 'vote_private', [candidateId]);
      await new Promise(resolve => setTimeout(resolve, 2000)); // 模拟 ZK 证明生成
      
      setVoteStatus('投票成功！隐私证明已生成并发送至网络。');
    } catch (e) {
      setVoteStatus('投票失败');
    } finally {
      setIsVoting(false);
    }
  };

  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      <h1>🛡️ Private Shield Vote</h1>
      <p>基于 Aleo 的隐私投票应用</p>
      
      {!account ? (
        <button onClick={connectWallet}>连接 Leo 钱包</button>
      ) : (
        <div>
          <p>当前账号: {account}</p>
          <div style={{ display: 'flex', gap: '10px' }}>
            <button disabled={isVoting} onClick={() => handleVote(1)}>投给 候选人 A</button>
            <button disabled={isVoting} onClick={() => handleVote(2)}>投给 候选人 B</button>
          </div>
          <p style={{ marginTop: '20px', color: 'blue' }}>{voteStatus}</p>
        </div>
      )}
      
      <div style={{ marginTop: '40px', borderTop: '1px solid #ccc' }}>
        <h3>实时计票（公开统计）</h3>
        <p>候选人 A: 12 票</p>
        <p>候选人 B: 8 票</p>
      </div>
    </div>
  );
}

export default App;
