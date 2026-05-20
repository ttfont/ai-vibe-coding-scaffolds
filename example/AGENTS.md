# AGENTS.md

## Fast Start

先读三样东西，再开始：

1. `AGENTS.md`
2. `project.md`
3. `openspec/config.yaml`

默认只记这五条：

- 全部使用简体中文
- 先契约后实现
- 优先最小改动
- 禁止无关重构
- 用户当前指令优先

## Template Variables

- `{{PROJECT_NAME}}`
- `{{PROJECT_TYPE}}`
- `{{PRIMARY_LANGUAGE}}`
- `{{RUNTIME_VERSION}}`
- `{{PACKAGE_BASE}}`
- `{{MODULE_LIST}}`
- `{{BACKEND_STACK}}`
- `{{FRONTEND_STACK}}`
- `{{VALIDATION_COMMANDS}}`
- `{{GATEWAY_RULES}}`

## Progressive Disclosure

阅读顺序固定为：

1. Fast Start
2. Project Overrides
3. 只有任务真的需要时，再读后面的规则细节

只有在下面场景，才继续往后看：

- 要做新功能、行为变更、breaking change
- 要改鉴权、安全、缓存、网关、前后端联动
- 要写 OpenSpec proposal / design / tasks
- 需要判断规则优先级、目录分层或验证口径

## Work Rules

- 需求含糊、涉及架构/鉴权/性能/安全/跨前后端联动时，先进入 OpenSpec，再编码
- 进入 `apply` 前必须先读对应 `proposal.md`、`design.md`、`tasks.md`
- `tasks.md` 必须真实反映完成状态，不能提前打勾
- 涉及接口路径、字段语义、鉴权、错误码、数据模型变化时，必须说明兼容性、迁移方式和回滚方式
- 不因为“以后可能会用到”主动扩范围

## Project Overrides

当前仓库实例化如下：

- `{{PROJECT_NAME}} = fulai-boot`
- `{{PROJECT_TYPE}} = Maven 多模块单体后端项目`
- `{{PRIMARY_LANGUAGE}} = Java`
- `{{RUNTIME_VERSION}} = 17`
- `{{PACKAGE_BASE}} = com.fulai.plan`
- `{{MODULE_LIST}} = fulai-framework, fulai-boot-api, fulai-boot-system, fulai-boot-new, fulai-server`
- `{{FRONTEND_STACK}} = 当前未发现前端工程目录；若后续补充，默认按 React 18 + TypeScript 5 + Vite 建模`

## Living Conventions

开发过程中如果聊到了新的开发规范、排障套路、目录约定、接口约束、前端基线、命名偏好，可以按下面规则沉淀：

- 稳定、会反复用到、跨多个需求都适用：追加到 `AGENTS.md`
- 稳定背景、模块职责、技术栈、领域事实：追加到 `project.md`
- 面向 AI 生成、需要高密度约束、适合在 propose/apply 时反复消费：追加到 `openspec/config.yaml`
- 只属于某次需求或某个变更：写到 `openspec/changes/<change-id>/`

## Backend Rules

- 保持项目既有分层，如 `controller -> service -> dao -> entity/model`
- Controller 只接参、校验、鉴权、调用 Service、返回统一响应
- Service 承载事务、规则、编排，不在 Controller 堆业务逻辑
- 复杂 SQL 放到项目既有查询层或 Mapper XML
- 不吞异常；日志保留完整堆栈与关键上下文
- 日志不得泄露敏感信息

## Frontend Rules

如果仓库存在前端，再应用这部分：

- 默认按 `React 18 + TypeScript 5 + Vite` 理解；若项目实际不同，以真实依赖和构建配置为准
- 页面、组件、状态、路由、API 封装按业务域组织
- 优先复用共享组件、hooks、样式变量、布局容器和请求封装
- UI 改动默认只动表现层，不顺手改业务逻辑和文案语义
- 新增接口路径时，同步检查代理、网关、环境变量和构建配置
- 不在前端持久化敏感明文

## Validation

默认验证命令：

- 后端：`mvn test`
- 前端：`npm run lint && npm run build`
- OpenSpec：`openspec validate <change-id> --strict`

## Rule Priority

1. 用户当前指令
2. 对应变更的 OpenSpec 契约
3. 根目录 `AGENTS.md`
4. 根目录 `project.md`
5. 子目录文档
6. 通用工程实践
