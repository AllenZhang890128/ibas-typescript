/**
 * @license
 * Copyright Color-Coding Studio. All Rights Reserved.
 *
 * Use of this source code is governed by an Apache License, Version 2.0
 * that can be found in the LICENSE file at http://www.apache.org/licenses/LICENSE-2.0
 */
/// <reference path="../../ibas/index.d.ts" />
/// <reference path="./bo/System.ts" />

namespace shell {
    export namespace bo {
        /**
         * 登录调用者
         */
        export interface ConnectCaller extends ibas.MethodCaller<IUser> {
        }
        /**
         * 用户密码登录调用者
         */
        export interface UserConnectCaller extends ConnectCaller {
            /** 用户 */
            user: string;
            /** 密码 */
            password: string;
        }
        /**
         * 用户口令登录调用者
         */
        export interface TokenConnectCaller extends ConnectCaller {
            /** 口令 */
            token: string;
        }
        /**
         * 用户相关调用者
         */
        export interface UserMethodCaller<P> extends ibas.MethodCaller<P> {
            /** 用户 */
            user: string;
            /** 平台 */
            platform?: string;
        }
        /**
         * 用户查询调用者
         */
        export interface UserQueriesCaller extends UserMethodCaller<IUserQuery> {
            /** 查询标识 */
            queryId: string;
        }
        /**
         * 业务对象信息调用者
         */
        export interface BOInfoCaller extends ibas.MethodCaller<IBOInfo> {
            /** 业务对象名称 */
            boName: string;
            /** 业务对象编码 */
            boCode: string;
            /**
             * 调用完成
             * @param opRslt 结果
             */
            onCompleted(opRslt: ibas.IOperationResult<IBOInfo>);
        }
        /** 登录仓库 */
        export interface IBORepositoryConnect {
            /**
             * 远程服务地址
             */
            address: string;
            /**
             * 用户密码登录
             * @param caller 调用者
             */
            userConnect(caller: UserConnectCaller): void;
            /**
             * 用户口令登录
             * @param caller 调用者
             */
            tokenConnect(caller: TokenConnectCaller): void;
        }
        /** 系统仓库 */
        export interface IBORepositoryShell extends IBORepositoryConnect {

            /**
             * 查询用户模块
             * @param caller 调用者
             */
            fetchUserModules(caller: UserMethodCaller<IUserModule>): void;

            /**
             * 查询用户权限
             * @param caller 调用者
             */
            fetchUserPrivileges(caller: UserMethodCaller<IUserPrivilege>): void;

            /**
             * 查询用户查询
             * @param caller 调用者
             */
            fetchUserQueries(caller: UserQueriesCaller): void;

            /**
             * 保存用户查询
             * 当被保存的查询没有条件时则认为是删除
             * @param caller 调用者
             */
            saveUserQuery(caller: ibas.SaveCaller<IUserQuery>): void;

            /**
             * 业务对象信息查询
             * @param caller 调用者
             */
            fetchBOInfos(caller: BOInfoCaller): void;
        }
    }
}