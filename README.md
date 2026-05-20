# Project Template

AI 编程规范最强模板，Vibe Coding 最佳伴侣。

这是一套可直接复制到新项目的模板包，包含：

- `AGENTS.template.md`
- `project.template.md`
- `openspec/config.template.yaml`
- `variables.example.yaml`
- `bootstrap-checklist.md`
- `render.sh`
- `example/`
- `reference/`
- `universal-openspec-rules.md`

## 推荐阅读顺序

如果你第一次进入这个模板目录，建议按这个顺序看：

1. `README.md`
2. `universal-openspec-rules.md`
3. `variables.example.yaml`
4. `example/`
5. `reference/fulai-boot-openspec-full.yaml`

对应目的：

- `README.md`：知道这个模板包怎么用
- `universal-openspec-rules.md`：知道哪些规则值得跨项目复用
- `variables.example.yaml`：知道变量怎么填
- `example/`：看渲染后的成品长什么样
- `reference/fulai-boot-openspec-full.yaml`：看强约束真文档如何写细

## 使用方式

1. 复制整个 `ai-vibe-coding-scaffolds/` 到新项目临时目录
2. 参考 `variables.example.yaml` 填写项目变量
3. 运行渲染脚本，或手工替换模板中的占位符
4. 将生成结果放到新项目根目录：
   - `AGENTS.md`
   - `project.md`
   - `openspec/config.yaml`
5. 按 `bootstrap-checklist.md` 做首轮校验

### 脚本渲染

```bash
./render.sh ./variables.example.yaml ./out
```

渲染后会生成：

- `./out/AGENTS.md`
- `./out/project.md`
- `./out/openspec/config.yaml`

### 一键渲染样例

```bash
./render-example.sh
```

会基于 `variables.example.yaml` 渲染到 `./out/`。

## 样例说明

- `variables.example.yaml` 是一份填写完成的样例变量文件，当前使用 `fulai-boot` 作为示例。
- `example/` 是按样例变量渲染后的成品效果，可直接对照最终落地形式。
- `reference/fulai-boot-openspec-full.yaml` 是一份强约束版真实 OpenSpec 配置，适合查看“提示词写满后”的配置形态。
- 真正迁移到新项目时，优先复制模板文件，再按你的项目替换变量。

## 变量替换建议

- 先替换项目事实：项目名、语言、运行时、模块、技术栈
- 再删掉不适用段落，例如没有前端时保留“当前未使用”即可
- 不要一开始就把一次性需求写进模板

## 持续维护建议

- 稳定工作规则沉淀到 `AGENTS.md`
- 稳定项目事实沉淀到 `project.md`
- AI 高频生成约束沉淀到 `openspec/config.yaml`
- 单次需求细节写进 `openspec/changes/<change-id>/`

## 通用化建议

从 `reference/fulai-boot-openspec-full.yaml` 这类强约束配置里，最值得上升到通用模板的通常是：

- 文档分层与 OpenSpec 工作流
- 普通业务与 framework_exceptions 的分流规则
- URI、分页、统一响应、兼容性、范围控制
- 日志、异常、敏感信息、联调可观测性
- 前端代理/网关/入口一致性要求

不建议直接模板化的通常是：

- 项目专属模块名、包名、表前缀
- 业务域专有名词
- 具体类名、具体白名单文件名、具体库版本

## 脚本说明

- `render.sh` 依赖系统自带 Ruby 和标准库 `yaml`
- `render-example.sh` 是 `render.sh` 的便捷封装
- 会自动把变量文件里的叶子节点展开为占位符值
- 会自动生成 `{{KEY}}` 和 `{{KEY_VALUE}}` 两种替换形式
- 会递归渲染所有 `*.template.md` 和 `*.template.yaml` 文件
