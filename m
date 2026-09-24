Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E648CC9831D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 11:05:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432075.1653629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9hFi-0002qr-Am; Thu, 24 Sep 2026 11:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432075.1653629; Thu, 24 Sep 2026 11:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9hFi-0002qj-7x; Thu, 24 Sep 2026 11:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1432075;
 Thu, 24 Sep 2026 11:04:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x9hFg-0002qd-OD
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:04:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9hFg-0066Q8-58
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:04:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab503bb-2eae-0a2a0a5409dd-0a2a4509a6ee-8
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:04:31 +0200
Received: from [52.101.201.64]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab503bb-be1a-0a2a45090019-3465c940ba58-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:04:31 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA6PR03MB7662.namprd03.prod.outlook.com (2603:10b6:806:440::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 11:04:25 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 11:04:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOmgZoXdcNCLlJwCzRrjcPkWLATw5zT2hs1nEv9/KbNpeD3mbvrUG8QQffEAQRTQ9/ItMxzGNont7vSyf+9137H+s9IpWo+kBhw5Dgi+BXXIJ4iIahLxMFRPexU3zkg2f68ay0TuOk/azI/bH8Ezj5UWJhBYOydU0Y7UIsZqVc+ftGCTvBzo1kv+t5vaI/zxb6eDvNMeyYH9ocA41ywzg8bpO6INkxCqFFtqEFeb9VxYrv3Ap1FOEi5Qp3rdKz0MAaXl+xTraF6thceTdNWh7GXlkjX+qLHm0dEdd7an0cTypgY3v0nnPcyLraY6evJKN5rFZDanhDyuOS/q037uIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjnJp/V8OCyTrgEon0AYzsgSNPl/j1SefIzFcC4Nmpo=;
 b=WoRcCOc4tzp/PTVrEQ1u5P5kpbtJLHlISLF3ULHDQC8PJnodFRHp+xiDenxZe6ZLHhVoPCjPhZrPRWJO3J13JrJ88JtKgnpOPwLey1P93pEo9HFwnSrTuFMS40lZiV0yf4FM7OL7RNIgNLKm0tT53faf6AVvvLMEW5Nk+Cq6mCxhreScys1TWjkl0jcNU3FWdYQNRw6Mu5FXURrVxkC1ivInslglieonEaWsW+7WQdrPXn2jlsS8GYgwNTkX6EfYSGTq6lJMPQEAaC3eYmAqxRIH7QNulu7qRJZZ/yszc5n+Tz6SiOn04Q9C8Vrb3f6vjS1Q2qL9iW91WLOZmKsMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjnJp/V8OCyTrgEon0AYzsgSNPl/j1SefIzFcC4Nmpo=;
 b=ktHPEYLBg5acH6EmlDo0C4eDti+v/3Dc0wP6+G0tZExrMxFd3t6GtY/GSXQMwb9cHQY4OLWAs+n9nOAtJDltfpQvo/jL9VEhzGlxm0AsgdX/O/hmrPmaCZMIngAYyrar9PRGbmjm3Rd0GHsHzmuXLIaHMtObaMib13FFxrNZ0S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/hvm: Clamp Viridian features to known set
Date: Thu, 24 Sep 2026 12:03:42 +0100
Message-ID: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0330.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::26) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA6PR03MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f98f0bd-e29a-417b-699e-08df1a2b9887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Gi9P1GNK2XTgS2ROdcVvdH/NKfHnNeZmeClYajDGs13bxFN/HmIicn03S/Hvqj+khSionZnqwkMvbO5Zpn95CpwgyzCnWHNa4hxJCLbFVv/H5lQbS1eFM87WNNfQVN3LQ7Irzxq7maXWLvS7JJLgiRiQRcD0hfD7Pu/IzhTFNp9qavQA7X2CxKBeJj1H477MDNDz4Z1o0ZRwZUVZqtcDhflwMXBiz5Lv2tfmuweTi3Rpz/oQxhxSIh2D5pEOYnjxPIaN17KrIXSLfvpXBW0Ak1LVaJzaOcRgo27NzoDTm91vNe9cUDHSr4kiuRp19comb3ZxVeDuouy2UA4pJgCkDNcIV14shQOO7ip83Lq1kmclj0zy89cgFeTOLsjjvirjYRyv6l8kEEPCgxXNlZlnTUrfhOuzZ9RaCU4rWB8OEymLRCgt9E+/zfHFJgHNgGT0yZGPJ6lMfwqNfUB4sxY9WQI5ue3oj4qiDsfIVuCHdtzp/hSdG4szpsGjkAv63oNiXKs2IHh6PmSjU4Hvu1Dmaewlp9a4LyHAxgGTp0AvpvEUNqijqLSIwkYZUf4zom8mjUufs7WWMJxFZzuDxlr7Eo6bVuAF2qkOjTI36UCza6OsNJAmkYjUSaarhgBOxgy/dkgimcIWUYyXOF7yDmg1GUGSv3RJorL9UB46oVHtonc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uhRK/qIfqNHfdWt98CfW7toc1iVLdD2gUF04hdB4DVNZ/9v3weqMm4J9aZFY?=
 =?us-ascii?Q?LXeMYZ8LkjNKXl1xtDVQ57Hh3GXb1n/MjCRhLLGHJ8gzHgrcWnVngjTbB6+w?=
 =?us-ascii?Q?/o6RMVSKwzoAcuCX1MfHnMWlzLyXdQQ3sNn38Ze+jMfOn2EDKSafSwHsw/Ce?=
 =?us-ascii?Q?pP28US2agWK6C/OXfCIHUn4zQc/bxSu8cpk2QguF1qAC4rrbtbxUH7HF2bgb?=
 =?us-ascii?Q?znv/sFWJg7xfpJGMJaCfMX++vnoTJlOv8wKY6xa2Rg5TxP4ZYKRs1aTuZgSx?=
 =?us-ascii?Q?nBgPuaTwx7L98B94HTdVfrE/CBxVjnSfB8F8bVJEkjXD4obzdnp5yTqCMByd?=
 =?us-ascii?Q?9viSng0YzoZWna9J5th4eI3NIwYjhMgq34UQ0lI+Ix1Kb/vIL51IFsnvyn2L?=
 =?us-ascii?Q?cehluRSHzOYkz9Tv0yLpO2d19hNL0wdxZQdRPS8EMo9CUSxv87c1yFtNcpJN?=
 =?us-ascii?Q?jjDk0p4XwjJ+i1s75nFPagqiiU4aSdBmZqWHmjvRR6eA/3MaoabIYaOkPadR?=
 =?us-ascii?Q?0S8OpEnZFvPCKNcVAeNmStX+ZwdOrREW7U80XktDqp+fTvNbuBI+WaHvxY+/?=
 =?us-ascii?Q?uUITnGn9HtMTDCxcXG9aWRDUZ8A5Yeda2N7GfUIZVJCjxkXoh8sAhFo6e+a+?=
 =?us-ascii?Q?VC139Y8f8FXhIlQjpf1jbqWPK4y1tf+MhrsYNSWIDn2/556mUMMfYiCSwOJu?=
 =?us-ascii?Q?JrzqNQoKm1w0Ba4pBQ1QToPnCL9rEPjsQuLA9q7cyfxdegvzMkyvIqW2zej0?=
 =?us-ascii?Q?zgIQs11CT9GXpPuok0CdLRIVaaSESEfDtRNABg0o91mgSb4jqm69Y9ZORtZP?=
 =?us-ascii?Q?723yvh8daSOJjYs976ptS+NS5Ax1mrz7OdP14j3ex/m6/8WJ1gBn8pExGJFO?=
 =?us-ascii?Q?iOgd9onxCwAToGUUubw2CKiwBBjks1Zdz5tm4E5CxWwjwFndgA/55XijcCQp?=
 =?us-ascii?Q?H1VKT6/Itb3sSgwHMYudtlUmYEmqtlYmh69ZRXt0FF2UhrBtILV/ZeSWvETw?=
 =?us-ascii?Q?9F5pV221jSx3VZJTSbb/8/AmHBtIP5y9pxEkMMJM9NipAaGzsb/7IxZZpM4s?=
 =?us-ascii?Q?Xu2Ie8dREhUDjDn5kYWOMdLrity0SYqdj9XzhbommNVIiTVkOd86+3xLHxB0?=
 =?us-ascii?Q?YDwkmLkbLkvByPIsXWa7C+gjxJEzQSwKCbeynf5CzbnBByfsvaWZPtUbGQKR?=
 =?us-ascii?Q?cCBemrF7ylBeYie2jly94+AZBtBp2PoPnsjoGcgfleO+pFAeWRXUOBnY4ONY?=
 =?us-ascii?Q?frvDQw6zbDFyxuC7PyUk70Tp4ti/OKqjvNHIT+HLPCH+QzrS1/RDwSzOomly?=
 =?us-ascii?Q?TotN42VNLA6RBoXwk6AxKmEojqZyH8JTBm8izCjrxEqZAXuL7aETZu4e5KYG?=
 =?us-ascii?Q?z9y1Vzd1BY9jVFB0F0KVKaS9VavER9R0tgIOHZ0NQONbjlOJ+P/5gGAyUIam?=
 =?us-ascii?Q?6HBIwbmNuEiGAZSg/L6chIOhhO3J3R6S43GcwwJbixnjRrLsnvPZ3xO27yIo?=
 =?us-ascii?Q?/XhX6tUixE6aBnd/49BtnHG+8svOteQZscmGTqYI1BYym6XWRBGVbYiDaV02?=
 =?us-ascii?Q?VdST1WS/rX2MxLUlb1FzFJwmFm0CODz/Ag7Gr4Zxx88x3xhYp12SefWUkjlL?=
 =?us-ascii?Q?0QKdParKVAbcU9j58t2L0Xpt2LplBtWa1A4A/7bZNOkNEFoBPQAoZRd4nERj?=
 =?us-ascii?Q?TWWHPY5pGBqrBUjfZvQjaJe/In6tB4zagz4uYHZCUvb6UVCniJk7V15lWML1?=
 =?us-ascii?Q?ns1xU36CS/dwDXiPU7PY33dWPQQfxq0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f98f0bd-e29a-417b-699e-08df1a2b9887
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 11:04:25.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8r0TpUTZj3fn9xx9Vwun3f2q74UijAp/zE7mvI8OqKNgG75zVhprS7itJoltOcle63jOBBufoUfxixx12VxnlmiYgKwmpE79i9JSnl9Iajs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7662
X-purgate-ID: tlsNG-bad1c0/1790247871-BFCD7034-FDCBC06C/0/0
X-purgate-type: clean
X-purgate-size: 1115

Instead of returning EINVAL on an unknown feature bit, clamp to the
known feature set. This simplifies upgrades since when the hypervisor
and toolstack are updated without an immediate reboot, the toolstack may
set unknown feature bits and the existing behaviour leaves the VM
without any Virdian features enabled.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 192309c2fccc..67afa00a0f13 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4234,8 +4234,10 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     case HVM_PARAM_VIRIDIAN:
         if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
             rc = -ENODEV;
-        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
+        else if ( !(value & HVMPV_base_freq) )
             rc = -EINVAL;
+
+        value &= HVMPV_feature_mask;
         break;
     case HVM_PARAM_IDENT_PT:
         /*
-- 
2.55.0


