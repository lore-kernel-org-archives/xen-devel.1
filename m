Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB647C61DD7
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400679.1636274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9b-0005hG-R0; Thu, 27 Aug 2026 14:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400679.1636274; Thu, 27 Aug 2026 14:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9b-0005g4-N4; Thu, 27 Aug 2026 14:32:31 +0000
Received: by outflank-mailman (input) for mailman id 1400679;
 Thu, 27 Aug 2026 14:32:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9a-0005YV-Fj
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9Z-00Bhds-SO
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a76-2eae-0a2a0a5409dd-0a2a450a9b26-24
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:29 +0200
Received: from [52.101.70.104]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a7d-f2d2-0a2a450a0019-34654668eba3-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:29 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:28 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyO7YBXf/CCLnB4/bAL3/np3ta4q4f42hpaL7eOPNtohc4aATut9taoWd1Eh/H8hekQhtxqhExpWH/HVP4w88E1ob8HhiqPUUNKbumrrB7kTNIewrDM+r4d/JsE2g6UpPFEIIOZbuqh1HpT7tCR7RirHPwKFNmo/yN9GdnfSd5Z3k4Xc663/ZN2a7nElSbcWwSeJVrWdZQnajFIkfO+8GIfHqeEOjxkYySiEJY6i75kHmljsG+BZsF5Z3sSCJQMWwOCHEXucu1rHHUBHcR8j4VFrPXV1tX1M+0J3J5mDf/sv2Bt9LlBrKp/vNIeRentkyVoAp50QOLoNsRKqRJbyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRVpxeM0gaRhUjO9d6z4tc/MJuoIRCJQUNdQDfFlEeE=;
 b=VARt32hi3xGVmuyyUU5x3u/RsUw7+pghpFU44XsOunP/yrTVlXCT+iJiRAKKNy1RKVGiqNYAu/+tKIZUXZifDIi0V897aOsa6AsbcCm3ncDiAoap4kRey+UltKjvdzmBkT7iIasvPQOyLIO7jE+8xrglEOGzcro+efZVsndVagolYE4C9bWFXmh/jFQJ7lswStYjI/mxv+Bi1DEo3m5pU23UaabmUsGoQKzLC9I5ybTIQY8OgIH+xKeo9TiyNUiD60Hs/H+w17IkoxgxRl4eehmO8SO61a6E9vT4XGglrxrU8uyFbL+jCxhuwJ4+GtCKh5i6ixOBRs7W0dbqrr7slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRVpxeM0gaRhUjO9d6z4tc/MJuoIRCJQUNdQDfFlEeE=;
 b=uHpcEn935f7ZYnv/Te7agOeRpdO+oxjkDHZJzFHNTD8lLUICFu7sWgutQArn0ExR2PV1/Rp0wzcDBqjQ4GbZh+hgucy4+9Tv56Pu6iAUmlqYEwNFMFo+vijglJJmHjifsumcipVGEfwQBeatEi8eguEhXm3EN0CWrak6v6Wz6NybKvl4upF/EjqhX1ia+uLVcnAn40nCcMbWRgCM5f8XpfVPrlMVapNC7IxjTQPknxzVgrMPOLc2ARCMBs8/USZVaREcHGSUJk1Ui5+cMI/g2XJbzNCresbPkv1kqvyeL0qzLe03lyjrrq2sWv9sJ/xbLRdeQbhOLDG0UfYR4YjMRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 06/13] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Thu, 27 Aug 2026 17:31:54 +0300
Message-ID: <623be9a0a5603073f25d009979ab49b611e7dddc.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ff1a46-1f41-46da-6b64-08df04480543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	D5cQCBHHoVMToy8zwI4ulCHMSEYvtc9+Eea/ui+1R2/EXREk+380EhvJEqY+g+Ci/Qp4bzDIfq6DUQbYbqpifUVD3HnLdPJf2ZuG7gKBjgdInHv6tKRziI2oanyxKRG7mECOCMh9Y9Uaf+a3MNXKWV23E6FXLhDljZGuW3KYmzY4ewFBZvISfDik6WLBM5pDzflbJT6EUahieIYY2Fh81EEbK5AG5KopDugiKpryjydmCDdrN42TBheEhYhobe5wsmlF4jiOLXRFJO874ZNVTlGICN8ZPyzNZ1TTUavs183glTcvMCCWzPHABOQeiPI/kTKUJVfKP6ejdpDUx5MGm2a9eGZYh2wZgBRzVCnOCfwqNbHkxa6P40ABBqNZ2SJ3jU1F/Cja54LAqfEm+zwPJ4eRirYnYKAbXR/AXI/wvymGjlqXuvBPHEG3vNAl9U7DKKbsAi4bKAWT7bKvempk/mAxwQHEIJZYhg4yCw7cQ82E555a4nzJc56vPJh/K6xCDXX0htXSmzBw9RgJ9kDdFLRzcLW3fpqX+WvzkLN+JncP3zWiM4YjfnQKB9bYA1J4HYOMHkUlrr0NM4CqdabNmrOolxHpEUEqFUecp8Rc5wnjFDzp4FcO2urTUsfaopdI/Sm4aBvCXwVyjeYDXpFq1ZqnrPjV4VRB03ZzPeOO9eM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IKgKNA/cuMOeSX82C8B2ONGfykqmLJIQ/HQxpHQgTEdWiDN8z6aaG6SP9Bdl?=
 =?us-ascii?Q?a77sf6zgy0O6VR5zEmnr3jzE3LZEJ/yu+Nqj/Ile8nR7Q+BVDXAudGDwvClf?=
 =?us-ascii?Q?QFsVnrWliZ0nMn2KMvixRs2n4rpMVtHxEXhoIFty4dnh8+jSEjX1Nha2Jt0y?=
 =?us-ascii?Q?0urE3b6Iv62f8LxXELfgEDjR8aOha7ggeFe10y0+q1tR+LhFjFglZ1O1WZMp?=
 =?us-ascii?Q?FiOoROXDZF4THYgJZ3L/443gIdmPjAgNPRvZ1RqzAsd3/7i7PlCSJk8W1UzV?=
 =?us-ascii?Q?9O+RFA8mRA8SFlvwYlcNL2lvUn+xJDbzYWxOf5b5Bby52PhiPH0VijmtmyaJ?=
 =?us-ascii?Q?h1012ZZuNdgZosPiUcMp5FBEMvHx9MfBha/vlQiMOgJeCpNvJx5E1qeFvczt?=
 =?us-ascii?Q?MG19COlF9jx8qDKSQBrEgAs3YU6EkwXkaRs55FUKkxP6zfpLX+kz3XuOoX02?=
 =?us-ascii?Q?JDHutVF2C8SAyKnmp3d+fuga2lbaDOOlPVj5vPpIXRLY4810SuGGdM6tsMvj?=
 =?us-ascii?Q?kf8hszE6oH9aJLjE3TIkvi5/la+8OqydM+5IZv2jAxjL2WfJawGK/yYCKiwX?=
 =?us-ascii?Q?YekJswpgHtxm4xyVnGmce4VoM3StidKhqk2UYyJpgKL+Q4NVFa1Nc2JIXE0c?=
 =?us-ascii?Q?0Z4RofZm4F0bjRjQYMBsyNqj4TvggTvBwZzMJ70CFLhmqBDcqaTGPpYigOQ8?=
 =?us-ascii?Q?59nIHrj+/vVXoJ2Keg3G11XipWEJvPFRED4U3NGE5WHQ3Mxshyhyd4Eqruu4?=
 =?us-ascii?Q?D0mRrEYq+CI+WytMih5Rh2Qj8xqA75/gDIfPthr4RXfgXwbP3EpWeJ5jHg5M?=
 =?us-ascii?Q?agPBl22N3GUD52blrfxAYiC8/hhjABCHuyKIthBkwbkYlm885SwavGkz8T0D?=
 =?us-ascii?Q?BHwGM7bllkt4nohsgNlPAuvPOE4m/0oM5nPvhEFdtVBVDNcrxv/Ll3wPvsIn?=
 =?us-ascii?Q?f/c9fdKnuifEgs7dfEHgxa9fgo13ZIbblWRwAgoxuBLJjsBSih6HMXDc/y/P?=
 =?us-ascii?Q?eAtPXLegPqjWxBH33kXv2WeHfGXEFC0dWbn7/0ZT6h3Hqqbz1dqWuQrsjGVv?=
 =?us-ascii?Q?fvdgJ0G+vyH7illgrZcXhiC+WPUUyd6arBH4Ltqz2wfxs/O1bkKyjMB3eWgF?=
 =?us-ascii?Q?LAJy5foLv96/UUJYv18VyyMG+VmKI6vsktqiBUc2OgN3oDXS8PBvO5XTv23y?=
 =?us-ascii?Q?9P+oFg7YiWHuqghoJgvcfpvKGcRUvrOynj8Ls1Y5aMPStLTTl3AQKzFE9afq?=
 =?us-ascii?Q?t8W97xvRJqXrmDphXaTscIoiJ4i4bLFUPft8bWsWMfU3HotLyhiOE4y0QAAS?=
 =?us-ascii?Q?nsh5eakFFIPZ9ZqlMfha5STH+paev/GPovqRBHE7bhtxk52iVpUEUuKK+B5v?=
 =?us-ascii?Q?Z4c20roz9VTgBkhDxvNCoFtO6V+hl27sE4dG5MPyKiWRq2ik3CW7VYRawD54?=
 =?us-ascii?Q?UF/1UDxf0d47gu5xXoBBlyE/V1UgZJjExXNLzyfZPswDwAJeCI4dqE2NCEq7?=
 =?us-ascii?Q?yx1XgBGiHZ1HIk//JL9CfjF8+f7Dyxylpb32WAc0NJMxfoIynTzhXJL4qwzw?=
 =?us-ascii?Q?fwFyTe1xP67I9kEs7qKNj3uTbLqhXxXXbPBQhFr75t62nsp/DFdSb8qyKFuH?=
 =?us-ascii?Q?QkgOFQVTAr6KqFCh6s6ucOUh+L9RiyQXPIUD1jpSWFqT9eZev2lqUOIVog6N?=
 =?us-ascii?Q?l+4AhbccHNmKZilFNj27VNA1eWlLhx/npOT1hkoxd7bbKXXPhV/2uM2QxLAV?=
 =?us-ascii?Q?odGtKVvbzw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ff1a46-1f41-46da-6b64-08df04480543
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:28.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7uvZyByX5GadplGM3a0mXEi1cjFccTEMTw0z2rUU3f6NGaoAOQ7LC+rgCtMdrVjxXT3pn2XNJJTOSSAim+YXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-4011c0/1787841149-595C3CFC-2A7B50F7/0/0
X-purgate-type: clean
X-purgate-size: 1017

init_tee_secondary() was marked __init and freed after boot. Calling it
from the CPU hotplug/resume path then executed discarded code, which
could crash Xen. Drop __init so the TEE mediator secondary init can run
safely on hotplugged and resumed CPUs.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/tee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 8501443c8e..00e561fc78 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -128,7 +128,7 @@ static int __init tee_init(void)
 
 presmp_initcall(tee_init);
 
-void __init init_tee_secondary(void)
+void init_tee_secondary(void)
 {
     if ( cur_mediator && cur_mediator->ops->init_secondary )
         cur_mediator->ops->init_secondary();
-- 
2.43.0


