Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC3606A31F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=QFy0A/VM
Received: from list by lists.xenproject.org with outflank-mailman.1462577.1673584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNI-0005v8-3D; Tue, 27 Oct 2026 21:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462577.1673584; Tue, 27 Oct 2026 21:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNH-0005uR-NM; Tue, 27 Oct 2026 21:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1462577;
 Tue, 27 Oct 2026 21:06:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNH-0005kg-0z
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNG-005OFk-78
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:26 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11235-bab6-0a2a0a5309dd-0a2a4509d276-24
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:26 +0100
Received: from [52.101.65.101]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11251-be1a-0a2a45090019-3465416568af-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:26 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:24 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbK5Y/2C5iQLFH3EjE4cvHao+pRjdqApFKuqr9VbvsdXQPIqhEP2g8+wk5iyIz+l9VkdnUjX+MSohxlSiDUN/IjxssuKe3G5R8kMKCK1GbX9grbPqODuWzrCj4mnVb6ysnrpmMZrpeiSaUH6AXlXhKFH5gbSW8vPqvzL74dOt4t0TuKC02USbXMiI8clBAC1xV6v9cZ9w5AFfVQ/8VM/oL307YWuEHizvByeQwDqPoTnkU8Bl1+SMwHC79L7miYAZMHQF+wxGv8Bwbj36DAptwDZznQRUP9q6VS2z9bQTVo+mezo7WaWAsBqd3TWkF2iVnoabCjiPLctzjqurOjR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcYFN5ETNzqH2h22XKFCQYA6dn1VHCIQVqzHW6lS7TQ=;
 b=h/8kyb7uJl/QQvEjtzFSctGD+CwmLAig91Y0lYZ+cRnx25zcf7oWoHPUu3WjjyWSZXPT85KpCfrF2F/PgiZei+VC6H/G3Ln7534V/AUmnA2T6T2JJ3VNvsjsNKc14Zr0NwDX6VbOCWm98Qfe2h6tiG7Ob97m1Ghg1KVBZCYFNKs3HMfAV9UAXTaVa/kN3mt7qNegCDLbX6BMa1qZ8GQd3XfNarqEW7MrifiiJDSyCDls8YbKZg5FH7piprFG50vwqHO3EdurEdjG1oPpXJ4OoI0PHHKEJB8eQ2hY2++n1KD1X5sGgXjLb7Emw1QJ4RisBmeXlLdPwswTp2kk3fUjFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcYFN5ETNzqH2h22XKFCQYA6dn1VHCIQVqzHW6lS7TQ=;
 b=QFy0A/VMU2pHHvWPaB/MZjmpoW7bxBDpF2SGdgeaiB9AtpPB69QUalM/x1qBsHO9nnxhS/tAPEvxoLdp7k++eJcz3M/yJGBuGfDL+O9WpCpNxdKMsbT4lg2mikT9OiTeIJQCBshr7ab4RsDotma/7Z3KVQHuOQLHo6KS6d/9lJgOHQCllFkV0lvRx2o0tEAQdOGNkhnUP+f9igAbwlhEwrMR9Qs7BqCfVnOL/3G5T/KxyycQTxjKo3Qddhd6dDgYYHsygTs6hH5DQ4068OJfgQCK9wgT9oGSwK3FCGWeDiK6bp4POgn8WcEC3+4BWfLabBjVHdtuEG7qB8oB2Jw/tA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 07/14] xen/arm: tee: keep init_tee_secondary() for hotplug and resume
Date: Tue, 27 Oct 2026 23:05:56 +0200
Message-ID: <e389ad0f029497f32061558916c8ee6c27ea20c4.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 025b9ab8-5c0a-4ba0-4ff1-08df346e289e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|261021123027099003|261021121427099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	c3WXQMkXxXNnXXHQz2Bb+gLC+EzYOmHtym9Q7h7Zfg0EgcWhVKE4jgwnR3ESeLm8oYRWgd2BT2XC7oHizwMtWlB2lu3Tc3GG4eepyYlzETEbsfGiq3QGVWl1ALwcfzrivpdosEWAq0hx5KICDTYv5YT19n90zG8eR1PYD+nDQ9LapcuFrtOjx/wxFVRNZSfTlxtXGtwvKfxBqntGu11Azxbz59VuoUh2jxT70bs9ar+tnxeWqj/9YWcz0ZJUJk/SbpvzN3Z7RUx1emHR2kcbPQVIB63eiccR6+qkUNnI0lwsELa0gfp8O/fQQXu8jNoOPUo0i1lnzSgOSzn9xOyvw7Z1VniCQ9R5bZDHg3WwAeeNh58lChE7uousADmBR6VvEVlnKYU9HNPmNrrERO/dbVssJpWZz9QeKCaIyoqdYTI6JJloCCxST3E3PyTu4UnGOfPSViccjp6SYBlbqWGeKJnHsVuincabGPYJElphV3AVSGB3OsIzToBvnpef/mtMd5Xm2XsIXCdrrQbBg92MXrEhF2S3pqwsDK9OyB8NbPGr9etifFIJzoZBesQoJvd6Sg5yhpz1zkQTAr1nlKOZ/UNyjQQlbTHDSKFhieX9or9LsFqE2NBZCXKQ4FICniz84ASowUp8LkyHDa1kTR/91J5k+YYRTRR4DBXywN2yXk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4aThXRUYOB5pUEKZt9DpY++xLBoED9mXNMedksBDl75kSZDtuvf6f4z4yKpE?=
 =?us-ascii?Q?NjBgwjwHT3qSp5sNP1oFsGYvm/Jz21iaeaRgVF4W1B68RG5fHvjKNtEbNIbv?=
 =?us-ascii?Q?hoxQopGb9Qm7w9Ob7lSgTZDdh1vUzj36p5uTe3tTTCwg18KDhkyNlBFxRFDG?=
 =?us-ascii?Q?nB3UYNuocC6QWKWWtmpDxUEiTI3UoGPNCBkZ91P8Jd30IH2ALQYG8wLA/3Xv?=
 =?us-ascii?Q?AmSAw/TmXKNh1J2xmrFhKWcYYhzbq31vrUDCBhRSAG7kXDlN8F/whaylTVOk?=
 =?us-ascii?Q?SROxH7EDxH+IB4PpMkp5idu+s43l81GOvgleI6POjXega/5OkZe82bYiSBis?=
 =?us-ascii?Q?WzXkfnIRO5np/HiXohomPuNu7ca4EZHKzs27ctBlqqSEq24jb1pm1X8wm1t6?=
 =?us-ascii?Q?dgtaZT2DxH4xVhyBTfkJSFYN07siWWAezGTm+ogHqgseFUV2mELAUbVodLFL?=
 =?us-ascii?Q?EOQbvLOpLWX4OMwjft2EeVDjn1S+NqYFJbZ5Ho4nuwmC91CHZANWjr4mj17I?=
 =?us-ascii?Q?9nSxKGmSDxrsIEn4lcpmrftOxDn7lNlgQ3HFiPL4fVRQY2rpsRl90MrKDbzm?=
 =?us-ascii?Q?ndr5NsK8m3FtKdujcUdoKyYrQrwwynw2R+cvdzjTlL7hfxi3947BKr5XjZry?=
 =?us-ascii?Q?ii9UZN5AW6pCddKPEdSjbG0MgnfvJvh7HXqe2BObU34l46h0XihWP3dM0n+8?=
 =?us-ascii?Q?2Nk+DnZps4vWgk/aywOXWON5JtZN36mVXkFZHLYeFDNcuJ3D4cvZQflTv9lY?=
 =?us-ascii?Q?8um2qJ0Xiq2rUzeIiO8kpZaq+PN/ekyedIfjB5fMkmWLwqPE9/V149rWfXS0?=
 =?us-ascii?Q?vQkbw1HyZ+p9JZyjt40wiQHwm/B4wpWJUa7pDjGA0tBThzXXrapY09xo9pUu?=
 =?us-ascii?Q?MERy/MXPNrZBkVidHv+vUR3g2xhgldK9LGfR2ph/gB4u4rOnK1sjyqknU0L+?=
 =?us-ascii?Q?nMZ6AL59AyeZ/BjT0KOdCL7rwzUc3wcjSE86bfgS+l8BdvNGfNz1FOuWRhWQ?=
 =?us-ascii?Q?AGrghMm4yQJUxkseqPX+MKBUJVZj+pQHrIU6EmBS3mxlllNwnz8QxB/Riq6F?=
 =?us-ascii?Q?dC3vVZ7NPeAqx9R4z1OM/yKu2mvXR1V2InRgYhT8CNI2XLe8JdFWLBI9AaSQ?=
 =?us-ascii?Q?XhJiNAYL5Z9jjJRFBT0leBZZBqhdD3AVLT5iDljte1Nw4oPOJRojkY1TbnFn?=
 =?us-ascii?Q?XF9LknDhb0fM4bX5tAHwREv1k2gKVCkpU1jCW36CxJdRgkJAizIdozYuctUw?=
 =?us-ascii?Q?3/DJ3bQKXv6JFY/330FEAT+1odYTLyxn0+LWelAmmx8MyeEI46A83XJehiPY?=
 =?us-ascii?Q?uvywHhmdxhtnuiR+tlixs++ZQwQ4tgTZMbDsy6ZFYGAKexgy8IVYpwd6kipt?=
 =?us-ascii?Q?9czrLg5097wIZZTqVTp/kOD/0BfbajaBwq5WaNz9D3Hb2l5UaBTghZQxAqYv?=
 =?us-ascii?Q?kIor+MZhaH5X9X0sW1ar/wsVrUglCUAKbrEsvxzjI1GtKfeJ6VZic3oU8Hxb?=
 =?us-ascii?Q?HuCXJjKGpHiVdRqYLj1tKDc429UMuiFi64o251eHQLEgsvJVQPhqC5UXlzER?=
 =?us-ascii?Q?Y4h4Ft2s48YRufgSOOsLoZZCK87HqThOyvtvGlnvTsuHcftiUVRNhLravM5z?=
 =?us-ascii?Q?q+FOZQrzzPiU1TSv136VSRDGgkrvjRCjjeP3x1+HMp5R+mfXb9sCOXKCV4CD?=
 =?us-ascii?Q?SlCnbADkgEw/NG1FBMcDXoHLWJ3v/xIvNafJt3V/jwcz75Pdz7tfevVbKqmr?=
 =?us-ascii?Q?V0eNOp1ooQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025b9ab8-5c0a-4ba0-4ff1-08df346e289e
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:24.3739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPN+u+0kwvZ7Qa2nWCmNAJwuxY/rBCnfwp4WHI66VgX3SWBfQBl5oZxkxlgoJUedIuqdp6bugiQ2HVqQ3bbX8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-bad1c0/1793135186-3A2C4034-69D3D118/0/0
X-purgate-type: clean
X-purgate-size: 1017
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.53.0


