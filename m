Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7802ACCA490
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452430.1667263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4j-0006AE-Qu; Fri, 16 Oct 2026 16:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452430.1667263; Fri, 16 Oct 2026 16:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4j-0006A7-Ln; Fri, 16 Oct 2026 16:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1452430;
 Fri, 16 Oct 2026 16:46:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xHl4i-00068m-Jy
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:46:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHl4i-00BCOx-0r
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:46:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254cb-2eae-0a2a0a5409dd-0a2a4502a668-34
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:32 +0200
Received: from [52.101.61.1]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254e6-6ca4-0a2a45020019-34653d019999-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:31 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN4PR03MB989476.namprd03.prod.outlook.com (2603:10b6:806:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:46:20 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 16:46:20 +0000
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
 b=QsmNXOTsRFgGScYpquzDQqBEi9ewNRy6vagNB4/ZEB6vQJYynWvR0iPjoR+lpG07R4U05RXkBLOnfC/g7mbyzoUV3p7mfOI+PPk+9tFWftdims0pgvsWyOMFMizhu3D8/APoffb6vaHHBq7k88lV4oDCjAp16h7KAiLJcUzoQE5IeI5Vcr9SO8SWEg5oxKOCSNkEC76lMtCqBb8w/83fY/hTevcSITnWK0lMWXKJobJri98cgxDPQ3ZHITz8sceZbRCWbg8N2hHRhXsaBy1KYCzgGdxbAeSs0vVLSCAphAx5rl+/3a9zKuhGJ/QpBADudca/wUlwPQXfHihPN75eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVqOtSOUy2pB6e59N44Js2UK5JmQmOee60/HkofDur4=;
 b=Y3XwR6LCZby3CQyqiYPpIvHyq5KEU/Tohptm1CaqGZXrwWyJxt1ClYL2/Lq0sSIl1U4RnmfKzXkTkM6++nemmivPV6G3jCCUmgyEWHNgptNnw7lDZtcwTVbFXhIAF4ntbysiGWnq+K4/hgYX5GBnYpzQPGEjdpGzmNFMjKQGZR3kx+sr6NNsaVA+gfQXF0K6XE3xN9lYr0/7mRtJAPmdPxPT4v0DmgnzNQBLIztgwyucngaiYXleOxRxz2SEgtB6OafUTj04JqbuLD7YZgYj1beyZRVF3vCdJAOlOhIH/frT1aMtDK5jXZmEOkJz5sUZUqZrNY6Q25btqGTd+YQYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVqOtSOUy2pB6e59N44Js2UK5JmQmOee60/HkofDur4=;
 b=lqyEXew8uPvdavnn52fq5L0TFRNxpit09shEZxZykHxhW+sW2X91GeqylckSfZTwfZULw2x0f4B4Bnva/9wzxm21Kwu7LP7dACWKnM6OS17ET+5LSnyhTaTmfyYaiS1hnrwtSPYHBbz1AeSIUKnsfoDUdLVxQDk2bF0ockHLRl4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v4 4/5] x86: New feature flag XENFEAT_mmu_pt_update_swap.
Date: Fri, 16 Oct 2026 17:48:14 +0100
Message-ID: <20261016164815.3109065-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261016164815.3109065-1-kevin.lampis@citrix.com>
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::9) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN4PR03MB989476:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e34282-88a9-4b98-6946-08df2ba5014d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	o9kC48xBTSySPm8LskyqlQt2qh8myWbyppis3MG1EuwuXz3P0+Y6scGxhP40CC3nam4SqqjenAgy9uuJGo7l57bmpwn1RWEusSNC/jcetkqT5cTz8FDDz9gw49Bt6i6vxAA7iM0MDE9lj1XkvqiS35cNCfjyI8t8bEw9nzNsbORqxT2RFVijvuPTD5yZpuizVnRXAe91/UNhjezB6WQT62obSrrhe84bC0Rc+l1BtsBYz3vI0r8Q4WL7THy88h+HIPJjKp6eNiKysZIieP94VYwjVKJWc38hwJ/0zld6oOHzgqjtlAnf9dzT/74XLRMuYoKoGrpP5YLcVszTE0xwW75ZZIEAkQmfFkwd135YkdFtpfYSgmcSl/gQqMjeeLUmpOylZGWrnIgFhQFMtsKFKYxdMRKfLtLJY9cdPexVgihkY8flwpzfMVdwIgvwupSo4NaJJwQ/iOdtRTfsePeU6vgLTinWZPu4Hs8/pSUsJANzzDvNlkZP1yAkELAcnzDKX8AAY1APrATuoKIZAG8voRXaUcOyUCXkwSltUbKyhixOtbkECMFgtctOwmnBhixvgCY2YLbr/bCi3YaECc7Z1e1WZ3pFMw6dg2ZGXJ+ctHVoEbfOfvHIZhr1z5ZT2vDC2l9jBCH9QGY1asJg/U7Lom5vX7qnnB/Muc2w0Mqkcco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q0vv8Y9Zn2PcB5hmS4ElsbWqGOOTnDrmZTNi2XWyYJEGNYnwVQoIdmZzuG96?=
 =?us-ascii?Q?4uMG2T/Jk8yb+YWnUAJAy1OgD2wsgvHgzg9/QeKmtF/g7FvOtHQ6gLPrMWGu?=
 =?us-ascii?Q?YXSlRneQZLgn2jj2xnh6Tsjn9ZxnS9R8EFZ4PidE6j5BO+8ccen2GIh/aG1Z?=
 =?us-ascii?Q?SyPfCAqXDP2+A/0orbp0eQD8zATCrhF/bBN757ACddKyXNfFT29FiyCNtnoa?=
 =?us-ascii?Q?jFqhkoYsNJ1jE4qyTME6QAiOvF93/ugxCwFCyOSCFRA+yPueGCr34Uxw3au5?=
 =?us-ascii?Q?+nzqhIJ8ElCAyt6a+kF0zge/CuO1k6+x4MJyPj5Qo+YMINvsMnWnL3vvyDvx?=
 =?us-ascii?Q?/62YtrebTJZnmU+kn1Ap3Klmb20pfXhWDdHKq6qW26wlvGJ/kqNdoTB3P2N6?=
 =?us-ascii?Q?Iysk0Efeioq2vEZYU5yHfhu2GOI1kgqYC/1cmNcaOVrwuKh5U05+nJgU7vNh?=
 =?us-ascii?Q?EP9kOzdZUfZlVtbsNaGEbJ9dO/LiY92jb79CLA7YJmOCB+mzG8pI+VlQxIX1?=
 =?us-ascii?Q?njboFRRSZHKxjkBXjw2l8RiDoj7vNcbncSoAVxlbvQFT4du3hjWMXO8StnAK?=
 =?us-ascii?Q?opjYr5ciASG3e5W+LVZB42es85DeNTtyHPoM4iQmhw7b7vwx662Ej4kfGrBU?=
 =?us-ascii?Q?JFHUlN5q/PEMthanjSqj4hppzEOUasJTF4xy/Ks6BHmia0J0lujlq73gIxAe?=
 =?us-ascii?Q?eGAUpOfdIDdy0GErnj6ME51AzGOfu5zYoI77JVBmiUiiZDAVI8zRpgZku+9d?=
 =?us-ascii?Q?TX8d/3O5PonneH/1BVluZnRAT605bFosp97Il1o03NBR8FXzOT3+FUIIG92e?=
 =?us-ascii?Q?SsT+PgwtA2JFXgfhYaxnTwT8vBzuB9dy16ttskOMtKTsuXfkFyydviueXFQ+?=
 =?us-ascii?Q?UGBzorTD8Z+C2DZOjZ0rueTQI9JbDp7RYYykvd9jY8bthuJFptI0UMQGqy94?=
 =?us-ascii?Q?NLMi60Yj7GDG5Q2UiSOI3aYxmzNJEHWvCbk4sxm0Ic7CdLvIJ6OEcdVHXvIl?=
 =?us-ascii?Q?jhwhdVb05xM5YcMEmSjekPKHDoLERknhZpA3fgtbn2p8uhQLvXBXTr1BU4z2?=
 =?us-ascii?Q?/ZpvKyR5rUN3WMgBEMPwFbUM2HIPuWl3YLy2lkfzJ6lniAEKvJjudPbSJFxT?=
 =?us-ascii?Q?Lx41rw5gs2QZGbaG8D4fq4v6UMiY9hWavE2sjK+BvZFg1AEH1YMg2EThvtGd?=
 =?us-ascii?Q?qDhtnwr1aMD0kDgTrrNUicFlhBm5XU5GTCq/6xXkeUwxkc3vDPQW6nXHGiIA?=
 =?us-ascii?Q?tFT3JtbnnaRS5OOosmoz5Y3rdsnzMVW80NzZfc+Rpf+KazaS29SUcwaWJ0V2?=
 =?us-ascii?Q?/JMrvXu4NzmPk6e2gjZEr9NATDdy50jK+Fh+EI9g5W2KEjnZtzPz3Nrumz4L?=
 =?us-ascii?Q?5ySRe0B7xGPmIJWp3CdyPe3uNqjEpI9vmJscUfHr65Euh3FznehdfmiRIk/4?=
 =?us-ascii?Q?WmFXMSbTYs+ckr6Mj6bW4Ae6EwvbB+JeT2mz/LauL4eoMOozaAWRnqbCJYXb?=
 =?us-ascii?Q?b/BctAT9moEXJUg2DekPpSQZ71AtO48PTszDINZuP+Ns9jgapq3QXaAJu1QJ?=
 =?us-ascii?Q?yZ16RoLW11FdYqPoHwjdMHGoVEZRH8Hgtq1+sqdjS5k648wYrWF1xeE7TTGj?=
 =?us-ascii?Q?o5PZ2wOFHsFbwQabuUL3jsqQceM+i5uR8Q3Xzd6rwhmCLRGyE/O/eatKVBcE?=
 =?us-ascii?Q?e/YcdHl7XhZXMzTVYPUgSuCkVGppjF4DPbf7INn2InhBI3V5l4zcnAsaeg5U?=
 =?us-ascii?Q?x4mUBWq1Eg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e34282-88a9-4b98-6946-08df2ba5014d
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:46:20.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caZrALoDwRrtjvspL6MTscRuubzJFcu6Fe1H8JPbwvdcGHherm/7khr6gHU58elxYn34fDvvgA3xWvGc5pjV3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989476
X-purgate-ID: tlsNG-720697/1792169191-F08A42AC-EF9B9C7B/0/0
X-purgate-type: clean
X-purgate-size: 1305

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/common/kernel.c           | 1 +
 xen/include/public/features.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 499023fae6fd..dc3cd9c3321b 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -690,6 +690,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( is_pv_domain(d) )
             {
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                             (1U << XENFEAT_mmu_pt_update_swap) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
                 if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 880193094713..227f1e408e41 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,9 @@
  */
 #define XENFEAT_dm_msix_all_writes        20
 
+/* x86: Does this Xen host support the MMU_PT_UPDATE_SWAP hypercall? */
+#define XENFEAT_mmu_pt_update_swap        21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.52.0


