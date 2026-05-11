# Task 2 - Leo 入门：学会这门语言 

请将本文件复制到 `learn/YourName/` 文件夹中，填写你的答案后提交 PR。
 

## 问题

**Q1. Leo 中的 "Private by Default"（默认隐私）语义是什么？**

A: "Private by Default" 意味着在 Leo 程序中，除非明确指定为 `public`，否则所有的变量、输入、输出和状态更新默认都是加密和私有的。这意味着只有参与交易的用户能够看到实际的数据，而区块链上的其他所有人只能看到一个证明该计算正确的零知识证明。

---

**Q2. Tuple 包含 array structs 的示例，以及如何访问 struct 中的元素。**

A: 
```leo
struct Point {
    x: u32,
    y: u32,
}

program test.aleo {
    transition main() {
        // 定义一个包含 array of structs 的 Tuple
        let my_tuple: ([Point; 2], u32) = ([
            Point { x: 1u32, y: 2u32 },
            Point { x: 3u32, y: 4u32 }
        ], 10u32);

        // 访问方式：
        // 1. 先访问 Tuple 的第一个元素（数组）
        let points: [Point; 2] = my_tuple.0;
        // 2. 访问数组中的第一个 struct
        let first_point: Point = points[0u32];
        // 3. 访问 struct 中的元素
        let x_val: u32 = first_point.x;
    }
}
```

---

**Q3. Aleo record 中 owner 字段的作用是什么？**

A: `owner` 字段定义了该记录（Record）的所有者地址。在 Aleo 的模型中，只有拥有该地址对应私钥的用户才能解密并花费（使用）该记录。它是实现资产所有权和访问控制的核心字段。

---

**Q4. 程序中的 final 是什么？**

A: 在 Leo 中，`final` 关键字用于定义在链上执行的逻辑。通常在 `transition`（链下计算并生成证明）之后，如果需要更新链上的全局状态（如 Mappings），则需要使用 `final` 代码块。这部分代码是在共识节点上实际运行以更新账本状态的。

---

**Q5. 如何创建 helper functions（辅助函数）？**

A: 辅助函数使用 `fn` 关键字在 `program` 块之外或之内定义，但它们不能被外部直接调用（不是 entry points）。它们用于封装重复的逻辑。
```leo
fn my_helper(a: u32, b: u32) -> u32 {
    return a + b;
}
```

---

**Q6. helper functions 能否创建 records？**

A: **不能**。在 Leo 中，只有 `transition` 函数可以创建或销毁（花费）Records。辅助函数只能处理普通的数据类型（如 Structs, Integers 等），不能直接操作 Record 的生命周期。

---

**Q7. constructor 的目的是什么？**

A: 在 Leo 中，`constructor` 用于初始化程序的初始状态。它通常在程序部署时运行一次，用于设置初始的 Mapping 值或其他存储变量。

---

**Q8. 如何组合多个 interfaces（接口）？**

A: 在 Leo 中，可以通过在一个程序中导入并实现多个接口来组合它们。虽然 Leo 的接口系统相对简单，但开发者可以通过定义多个接口并在程序逻辑中分别引用它们来实现功能的组合。

---

**Q9. record interface 中 `..` 的含义是什么？**

A: 在 Record 的模式匹配或初始化中，`..` 符号（通常称为 "spread operator" 或 "etc"）表示包含该 Record 中所有剩余的字段。这在处理包含多个字段的 Record 时非常有用，可以避免逐个列出所有字段。

---

**Q10. 何时使用 dyn record（动态 record）？**

A: `dyn record`（动态记录）通常用于处理类型在编译时可能不完全确定的数据，或者在需要更灵活的数据结构来处理不同版本的记录时使用。它允许程序以更通用的方式处理符合某种基本结构的记录。

---

**Q11. storage vector 支持的核心操作有哪些？**

A: `storage vector` 支持的核心操作包括：
1. `push()`：向向量末尾添加元素。
2. `pop()`：移除并返回末尾元素。
3. `get()`：通过索引访问元素。
4. `set()`：更新特定索引处的元素。
5. `len()`：获取向量的当前长度。
