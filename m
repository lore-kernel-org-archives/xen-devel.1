Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9A606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=MhhnKAvK
Received: from list by lists.xenproject.org with outflank-mailman.1491853.1692556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9hG-0006Dc-T7; Tue, 17 Nov 2026 03:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491853.1692556; Tue, 17 Nov 2026 03:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT9hG-0006DV-Pd; Tue, 17 Nov 2026 03:17:26 +0000
Received: by outflank-mailman (input) for mailman id 1491853;
 Tue, 17 Nov 2026 03:17:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xT9hD-0006DP-PX
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 03:17:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT9hB-00GNe7-Uv
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 04:17:21 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afbc732-bab6-0a2a0a5309dd-0a2a450cd1a6-8
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 04:17:21 +0100
Received: from [52.101.228.123]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afbc73e-f479-0a2a450c0019-3465e47b3da6-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 04:17:20 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by TYYP286MB4908.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 03:17:16 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 03:17:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7NHVOaO9rNS4YpBEskSzbi7y5e2ZOSc6rpQcfbVr5BKGV25WHBCz1lcrfe6dRK1NwaRt9ER5YocOjN8Wx4QmPZr6ayM0ve0HNwKxJmDpTTRmSru8S0nCNiWN9pF0Isr8rh82+0lpppzQUVagN1mL9zWOMWCAC/3cqo127ybeg6lEn5k3k/+G8CJ5PQje+oVqHxx55FIYGBWYHNTMtQgwaRmQYL5j4OG+fyi6IuxdFW97YFu+YGVdUflFpgtPwC5dXQyEydK1dVvxNlsIdLGuMNapD/x1wJFlYj2YPWy8uR17AqOxQOR7fQSRvWiXJInck9igg5vzwpPPWtYfFLGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zlkmLdY3M3bWlaq1QszMq7fXTtpTXrxqGZZbIGJ7Uo=;
 b=Pdml0BbmWO+38jDu463d9YU0EyKj48ejTorTNiBQH8TqCoP6WaeefnJ2b+DwEr4xGllo3ldLuNbhCSObV0OfN+JUOwWIoFQCOCmnHrx6nZGmZoN22SPbEkocN1tT2tbNNjjp98mLBd9QJJhFPQbCPmXvrLoExzVwDXZ5LXq3IxGfEtaOK+NQtgBzvnki4/e+R/kJyzKQqWBCcciPkCP64RWRbO48YSYR6xRtpvCd64Op0v+tvJXCzL8kDxV04LeZheEZkegiGihTt3wRMZp+9ET4Z/ctwOpMrbiYqYGswxi48E9f3LXm7bIDBX0IJuBE2vv6fvQSQll1C/gymIdNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zlkmLdY3M3bWlaq1QszMq7fXTtpTXrxqGZZbIGJ7Uo=;
 b=MhhnKAvK0TnPAiqHu2EC5G08b7DxX4K3UHbh/BT6Gj2Wpcckhl1Xi3cFsmOOxBNXEYagP32HI5Ml3inElJoAOvixxyJPquEJd65/Aa+Tp6MuoccDukqjmMBdQKdAVhnoZma1vZiXrNx8uhgyNQHbf3iKl+t+zNPeBaqe3jHKmsQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Tue, 17 Nov 2026 12:17:12 +0900
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: its: only clean cache when sending ITS command
Message-ID: <20261117121712.00001e3b@valinux.co.jp>
In-Reply-To: <20261117024519.183260-1-nishimura@valinux.co.jp>
References: <20261117024519.183260-1-nishimura@valinux.co.jp>
Organization: VA Linux Systems Japan K.K.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|TYYP286MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ea8982-a442-4372-7326-08df4459475a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|261009223027099003|22082099003|56012099006|261028144727099003|261026121527099003|261026130827099003|261021133027099003|261021121427099003|261022075727099003|261021130227099003|261026140227099003|261022105027099003|261021135927099003|261022115727099003|261021123027099003|261022113327099003|261026135527099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ubEhdW2JfdN8Iq3JezuJmcUUH86M0rn6Cw++WloKU9iImGXhCJQXr/VdwKV+J4bMfvUUlhdKXFFxuEAQdXTx35OHIHI1jG5e9XN45od4RVuSUbW3cu9m58QvmvvwVTBh1olNXn0dheACOGLosNc9gSrpTKE7e3CifPDy1xZLaXwrV1k5zRZGcykpwxlzZntQ1OSTj04HAWBm67ct+PifWdZCoQVHk1Wh1JyKW6Ke2IFD86hIm+ytS9g4WIOoJntyP/RiYVvZ/b+uXxsNWD/0lm0r+F6OVUSyUFcj88u7f9RN7UW8TUjfiB1juDfT0yBzuabu8gNtT1HeHdaS3gxnsxRBxdQpkYyzun5WEewB4/1ILzUWHXNLn6EBALGm6xme19niJEL2eVaCw1mYP3goC3YoHVePWl/+1KIXcBlMq5Os9obkinga8ozc2xi8NwBxjHFb032bUpZNcDRHSZFXpB+mB3NrIuZDXkPnzjEx5YGO4n80HL2XKrFP+rf+Fwd8SKmOOc9Ji57q7LcTD8cET4Cthu7nZTfz04cTOUsrnM9nl0aCBMGPlXGbDJQshN6jvs8kFGuAPKjio2o7NA8GGST/OlrfP9qszOz1rdNajs2za25Uj4e0t3gq+Tlxojz/jLjaiA3N6F8lwVvAwIuH6jUETAzWM7hIKX3INgM7JrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(261009223027099003)(22082099003)(56012099006)(261028144727099003)(261026121527099003)(261026130827099003)(261021133027099003)(261021121427099003)(261022075727099003)(261021130227099003)(261026140227099003)(261022105027099003)(261021135927099003)(261022115727099003)(261021123027099003)(261022113327099003)(261026135527099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bgibcLr+FmlPA0EpSyo8cw7Ba+nxTMNtnYbkSaBKZF26ooCJgtFziHm0c8I6?=
 =?us-ascii?Q?3pfJwemHINXYQH5dJpaCa4E9V/ASCoTeLwr2go6LtA0qyZUW+aWwNzdj0GrD?=
 =?us-ascii?Q?FMCe6sVKErsE3NwoBv7u2X8N2IUxqOksUfbzYW8r4AGGrjwbgc9+lplxRB3k?=
 =?us-ascii?Q?CE7cfNy0OB8HS8bXiiAB3mxwIm2aWbBuj0xKR3/YvpQRl96CIkhSwL5c5O99?=
 =?us-ascii?Q?zx9TWALoy35QRo6zDRAT95bP29rj/zkHUjCw5RRUvz4nQNDW3O3Z9ynlq1Da?=
 =?us-ascii?Q?slGQZdLtz5PTUhk0GrHnbgkshdaeAfhV4WL2nwaqVdtMQNuzF9dbQISMozg4?=
 =?us-ascii?Q?dUEgwFFeM1UpOYJSOHPJUljCXrplO8wNw6ggVYBqU9z3OXyyFLmqCIBUI48G?=
 =?us-ascii?Q?5/F2kpQ2FLJ1ELl8661/vfwcALJ+TKxgYQeCurneK/f+Ng6bL67LISZXg0B0?=
 =?us-ascii?Q?VfBmc80h5Q1XQz+NyVXasN7QZBkP+d5GcrJH9exYUIaVDQIw2fRYlun1mRoL?=
 =?us-ascii?Q?S3lqbY3wBG8ZnSxgIxYFGBW6yJvsxbcGd8+hbAfzFb87BLz2mTyYjn3LONVr?=
 =?us-ascii?Q?MH80/eKtunQhMPtBbpuHTnvNVQ9iOoQsHfL4Kqf3VFjKWZLFZ5/yMyOcazTm?=
 =?us-ascii?Q?nNjxUIKxe3fvi7+7TCIYplMB0ywjYnQg+OPGMzAUZ3C3DkAE/w7Py1vEqFYA?=
 =?us-ascii?Q?f0pDTxemCLSxL1iceFdEDi/wzs+Qyq0gaIYsD8OcVTguvQ6bpIkIh759nJLt?=
 =?us-ascii?Q?cGviF0AAcGouWi9waPnToIe/hr9tIKZVl/ygWn0hOKyKV8GJBkNXN7zU0WMZ?=
 =?us-ascii?Q?XfML4WYHqByM0oElf3PtYTE5XBtXSqWxHaPT5uOqycCjPxQronRtbTumr7Tn?=
 =?us-ascii?Q?FP/Bj6bDgmGlyPhY+dpRRJaxpW5hN6NJQ31breZ0/Sm0q/Sg8JyIB4VYca3M?=
 =?us-ascii?Q?KdmzLxSOHR3NejtyctRTnngKsLoHlFIlW7vXhjYh6eB/2rzn7m0+crWBzGKQ?=
 =?us-ascii?Q?QzP6dPOCDphlD0HRGiUUEyIhMccCh/olXfGvP7XbE6Li8xCS9vZpoNyNPhxo?=
 =?us-ascii?Q?e5mCHTiYfJ3qrxw5uxUZZGEc7893EJ0cWxpIwAFj8uWrf5342T+nXcX97sLO?=
 =?us-ascii?Q?Rj0gOqMdrzRVKfKa1Pi+GRcBNE5OE9UGlsRjeJ1BzIUg4o2t131S3F2rc1+k?=
 =?us-ascii?Q?fr5gWfvJrYPd6oGTx9qc00gwDi/eTO18U+Yu8hgSFtT3fvi0pANaGP3b3fbh?=
 =?us-ascii?Q?/Retft2vHx/T98LZa4Ykd3LSP81AbELk9dBHnJu9I8dZF1t0efItnVLA3Kxb?=
 =?us-ascii?Q?fmJrdviW9Ah/435JowWtglbS5cbWfEyyMqvBrWi5OTGKXwQMdu3IHXjHp7c8?=
 =?us-ascii?Q?g5rGbWVeT9dHRjrENfjX+t8QYpPBrGI2UauYl7gefFuYlSbOAJnTrm8M+aB7?=
 =?us-ascii?Q?YMEzEBVicWmFjB0yQfmz4IhbO1es0hSuRkZ2pG9dSzGD5b/hJNM31JvRxxn3?=
 =?us-ascii?Q?wmCr83n2KJdBEBRpA9FZDH94SVT1DM/c88eD8AzVD7AMM/It0VvebuWqkbH4?=
 =?us-ascii?Q?kltPZDJA4skRUXlFFrMNQTuaqtuUKaGdmQCil9C/7yYaEts22cEJijAOCmGV?=
 =?us-ascii?Q?wT7OKJAgjaor9/i9CrD/EU1vQtKCGgs1Hdnrdly6nzqcxRkT85fOmYWLhA6w?=
 =?us-ascii?Q?Lt+DBELWcLVQOb/+7WdmAL+l+l0IsqOGuxL5HhEBrVqVAt07/HaxOyFWVQ94?=
 =?us-ascii?Q?p6GrhMgerg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ea8982-a442-4372-7326-08df4459475a
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 03:17:15.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPj31Hds1C739RaTqiElskdLe1DztrvCfkBrCXGVfiWXfKXr2T/CvLpBBoYi3tjN6ofe9UaaLUkc5U9sCWsWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4908
X-purgate-ID: tlsNG-d25034/1794885441-01EC2A5B-0AF57A6C/0/0
X-purgate-type: clean
X-purgate-size: 1516
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I'm sorry that the 'From:' lines are duplicate.
I will resend a correct patch later.

On Tue, 17 Nov 2026 11:45:18 +0900
Daisuke Nishimura <nishimura@valinux.co.jp> wrote:

> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> There is no need to invalidate cache entry because we just wrote that
> memory. So it is guaranteed that cache entry is valid.
> 
> But we need to clean (flush) cache line to be sure that ITS sees
> command written into the memory.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
> ---
> (cherry picked from commit fe7142bca56b5c8c8109f581444f89ae09b7544f
> xen-troops) ---
>  xen/arch/arm/gic-v3-its.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 325835b0ad..dc44666233 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -207,8 +207,7 @@ static int its_send_command(struct host_its
> *hw_its, const void *its_cmd) 
>      memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
>      if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
> -        clean_and_invalidate_dcache_va_range(hw_its->cmd_buf +
> writep,
> -                                             ITS_CMD_SIZE);
> +        clean_dcache_va_range(hw_its->cmd_buf + writep,
> ITS_CMD_SIZE); else
>          dsb(ishst);
>  


