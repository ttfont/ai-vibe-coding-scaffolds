# Project Context

## One Screen Summary

`{{PROJECT_NAME}}` 是一个 `{{PROJECT_TYPE}}`。

先记住这几个核心变量：

- `{{PRIMARY_LANGUAGE}}`
- `{{RUNTIME_VERSION}}`
- `{{PACKAGE_BASE}}`
- `{{MODULE_LIST}}`
- `{{BACKEND_STACK}}`
- `{{FRONTEND_STACK}}`

## Template Variables

- `{{PROJECT_NAME}}`
- `{{PROJECT_TYPE}}`
- `{{PROJECT_SUMMARY}}`
- `{{PRIMARY_LANGUAGE}}`
- `{{RUNTIME_VERSION}}`
- `{{PACKAGE_BASE}}`
- `{{BACKEND_STACK}}`
- `{{FRONTEND_STACK}}`
- `{{MODULE_LIST}}`
- `{{DOMAIN_LIST}}`
- `{{LOCAL_ENV_BASELINE}}`
- `{{REPOSITORY_CONSTRAINTS}}`

## Current Repository Instantiation

- `{{PROJECT_NAME}} = {{PROJECT_NAME_VALUE}}`
- `{{PROJECT_TYPE}} = {{PROJECT_TYPE_VALUE}}`
- `{{PROJECT_SUMMARY}} = {{PROJECT_SUMMARY_VALUE}}`
- `{{PRIMARY_LANGUAGE}} = {{PRIMARY_LANGUAGE_VALUE}}`
- `{{RUNTIME_VERSION}} = {{RUNTIME_VERSION_VALUE}}`
- `{{PACKAGE_BASE}} = {{PACKAGE_BASE_VALUE}}`
- `{{BACKEND_STACK}} = {{BACKEND_STACK_VALUE}}`
- `{{FRONTEND_STACK}} = {{FRONTEND_STACK_VALUE}}`
- `{{MODULE_LIST}} = {{MODULE_LIST_VALUE}}`
- `{{DOMAIN_LIST}} = {{DOMAIN_LIST_VALUE}}`

## Module Map

- `{{MODULE_A}}`：{{MODULE_A_DESC}}
- `{{MODULE_B}}`：{{MODULE_B_DESC}}
- `{{MODULE_C}}`：{{MODULE_C_DESC}}
- `openspec/`：仓库级 OpenSpec 规范、变更和稳定规格

## Engineering Baseline

### Backend

- 采用标准分层，优先与现有目录组织保持一致
- 统一响应、统一异常处理、统一鉴权链路优先复用已有实现
- 复杂查询、聚合统计、多表联查放在既有数据访问层
- 新增行为尽量沿用现有错误码、日志、校验和审计机制

### Frontend

- 默认按 `{{FRONTEND_STACK_BASELINE}}` 建模
- 按业务域组织页面、组件、状态、路由和 API 封装
- 共享组件、hooks、样式变量、请求封装优先复用
- 路由、代理、网关前缀和环境变量必须与后端契约一致
- 默认不持久化敏感明文

## Living Facts

如果后续出现新的稳定背景事实，也可以持续追加到这里。
原则是：只有稳定事实进 `project.md`，一次性任务细节不进。

## Validation Baseline

- 后端默认执行：`{{BACKEND_VALIDATION_COMMAND}}`
- 前端默认执行：`{{FRONTEND_VALIDATION_COMMAND}}`
- OpenSpec 默认执行：`{{OPENSPEC_VALIDATION_COMMAND}}`
