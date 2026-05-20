# Project Context

## One Screen Summary

`fulai-boot` 是一个 `Maven 多模块单体后端项目`。

先记住这几个核心变量：

- `Java`
- `17`
- `com.fulai.plan`
- `fulai-framework, fulai-boot-api, fulai-boot-system, fulai-boot-new, fulai-server`
- `Spring Boot 3.5.8, Spring Security, MyBatis-Plus 3.5.14, PostgreSQL, Redis/Redisson, Lombok, MapStruct`
- `当前未发现前端工程目录；若后续补充，默认按 React 18 + TypeScript 5 + Vite 建模`

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

- `{{PROJECT_NAME}} = fulai-boot`
- `{{PROJECT_TYPE}} = Maven 多模块单体后端项目`
- `{{PROJECT_SUMMARY}} = 基于 Spring Boot 3.5.x 的后端脚手架/业务系统，提供系统管理、认证授权、日志审计、文件存储、短信邮件和业务扩展能力`
- `{{PRIMARY_LANGUAGE}} = Java`
- `{{RUNTIME_VERSION}} = 17`
- `{{PACKAGE_BASE}} = com.fulai.plan`
- `{{BACKEND_STACK}} = Spring Boot 3.5.8, Spring Security, MyBatis-Plus 3.5.14, PostgreSQL, Redis/Redisson, MapStruct, Lombok`
- `{{FRONTEND_STACK}} = 当前未发现前端工程目录；若后续补充，默认按 React 18 + TypeScript 5 + Vite 建模`
- `{{MODULE_LIST}} = fulai-framework, fulai-boot-api, fulai-boot-system, fulai-boot-new, fulai-server`
- `{{DOMAIN_LIST}} = 认证授权, 系统管理, 审计日志, 文件存储, 消息通知`

## Module Map

- `fulai-framework`：基础框架层，负责统一响应、异常处理、缓存、通用配置、安全认证、数据权限、日志切面与基础工具
- `fulai-boot-system`：系统管理业务层，包含用户、角色、菜单、字典、参数、日志、认证、上传、短信、邮件、第三方登录等能力
- `fulai-server`：启动与聚合入口，负责聚合依赖与运行配置
- `openspec/`：仓库级 OpenSpec 规范、变更和稳定规格

## Engineering Baseline

### Backend

- 采用标准分层，优先与现有目录组织保持一致
- 统一响应、统一异常处理、统一鉴权链路优先复用已有实现
- 复杂查询、聚合统计、多表联查放在既有数据访问层
- 新增行为尽量沿用现有错误码、日志、校验和审计机制

### Frontend

- 默认按 `React 18 + TypeScript 5 + Vite` 建模
- 按业务域组织页面、组件、状态、路由和 API 封装
- 共享组件、hooks、样式变量、请求封装优先复用
- 路由、代理、网关前缀和环境变量必须与后端契约一致
- 默认不持久化敏感明文

## Living Facts

如果后续出现新的稳定背景事实，也可以持续追加到这里。
原则是：只有稳定事实进 `project.md`，一次性任务细节不进。

## Validation Baseline

- 后端默认执行：`mvn test`
- 前端默认执行：`npm run lint && npm run build`
- OpenSpec 默认执行：`openspec validate <change-id> --strict`
