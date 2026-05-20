# Bootstrap Checklist

## 1. 放置文件

- 将 `AGENTS.template.md` 渲染后放到项目根目录为 `AGENTS.md`
- 将 `project.template.md` 渲染后放到项目根目录为 `project.md`
- 将 `openspec.config.template.yaml` 渲染后放到 `openspec/config.yaml`

## 2. 替换变量

- 已替换全部 `{{...}}` 占位符
- 不适用变量已明确写成“当前未使用”而不是留空
- 模块名、技术栈、验证命令都已替换成真实值

## 3. 检查渐近披露

- `AGENTS.md` 开头是快速入口，不是一大段细节
- `project.md` 开头是一屏摘要，不是全量背景
- `openspec/config.yaml` 开头是 quick start，不是冗长规范全集

## 4. 检查文档分层

- 工作规则在 `AGENTS.md`
- 稳定项目事实在 `project.md`
- AI 高频约束在 `openspec/config.yaml`
- 单次需求细节不写进根文档

## 5. 检查前端设定

- 若项目有前端，已确认真实框架与模板基线是否一致
- 已确认代理、网关、环境变量和 API 入口约束
- 已确认是否允许前端持久化某些状态与敏感信息

## 6. 首轮维护约定

- 新增稳定规则写到 `AGENTS.md`
- 新增稳定背景写到 `project.md`
- 新增 AI 生成约束写到 `openspec/config.yaml`
- 一次性需求写到 `openspec/changes/<change-id>/`
