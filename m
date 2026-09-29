Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B384CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 19:02:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436701.1655386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd5z-0001T9-7f; Tue, 29 Sep 2026 19:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436701.1655386; Tue, 29 Sep 2026 19:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd5z-0001Se-4I; Tue, 29 Sep 2026 19:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1436701;
 Tue, 29 Sep 2026 19:02:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBd5x-0001QS-Qr
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:02:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBd5w-008g6y-TL
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 21:02:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b41-8faa-0a2a0a5109dd-0a2a450cc434-6
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:28 +0200
Received: from [52.101.83.141]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b43-f479-0a2a450c0019-3465538da00d-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:28 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AM9PR03MB8053.eurprd03.prod.outlook.com
 (2603:10a6:20b:3df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:02:26 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:02:26 +0000
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
 b=FS7YrrTLMwtSI+WfeutaqM4zfJF5X76nX9LyGIbAXTK3DAHRXSkxKuAhbKCnFZXcxiNwM7raYUC9eZlL0B0FnuR6PwqKG2eWaVhSNPeLNvF9YV5Io9RpKIlvbUGkcqJCzJCPoftbbYgMAs64bnAcDd+7OO+HRGhJKSolDgmIN81dCXotVMqBkSDFgH06q/uSRIqg7RIot2EmXIod3ArUcYbu3B1N1j/Uowx+27ZdGUhbrYjticuFp83RJ3omYXUgsDWO5j17XYLfZTwO+54L8W6j5bhB9xFbzjYEvi1yEgbiljp9v6v2LIKoNkGL1vBAIxsTJBNzpnoEdBDT1mTkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2HroqjEQXa8onlzti7/N45vTONp5vJUUwe52l1zMgU=;
 b=NybgxJGHowd5GGontu3178WvbrUcm++2lHxXWuPfrRRGuyWUSyH55ymRlwV6ZpxB7iQ9ez0Vw9qKqwrH1w6AExPFeJqz1DfUB7xqwoufGk3KXaDrYol3JA4WadTae/auPQJFd7Ql15RgzogFLZSBtRbSWwnYnOA9kdJfAqX3igzA2HPQxnMYTgsih+SMR3YtGeBguTZ5MMV2gX6yeFBnbjKfg6PDk292XNbUVsHtbYSN4wTMh9LvEok3yyQH2Q4MyD0rkIj2vnrO+4ae94cteoWzwxyfl+67DmPFNij1Rfw4J7Hw9Tfft7xDR6u1WJpNFl/8g9u0HOO5TvlKGBSWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2HroqjEQXa8onlzti7/N45vTONp5vJUUwe52l1zMgU=;
 b=hReVKIsH5cvXEqKYUmNDlAfz8cAf5yoErHGWtaUCbUTBLhbcEvyY+dpeC29GKw5+5Ngk+jsUXMP7iKlOYeXkIIq+G7aLYmj8iWMxZYHQXQii+T0Xe3BdzsPdF3RVZhREEGvFW7gXPeRHSLtt0uVY5fJu7CV0nZBa73wAtuS3aovY5CHPink2InyJH0pdikCkDXqRapcTqQNvkd1pYhQnj5I670AQ1qbDZVfmPSt6EBAvqv2EPBJmJ/BNycXpedsmW7JaqrL0fBrVlXUkilNRhKxm+tgik3rnRdzUMYr9B3tEDn5s2IB3CEoGXeFYkUos+g6FEB89USWLKSblJtbN9A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/4] xen/arm: its: initialize host LPI state before activating ITSes
Date: Tue, 29 Sep 2026 22:02:10 +0300
Message-ID: <0afac276107d8b2a170489950d75e611c69a599b.1790707009.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790707009.git.mykola_kvach@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::11) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|AM9PR03MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fc56e7-b963-4398-1993-08df1e5c33a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|260925021911599003|260925022911599003|56012099006|11063799006|10067099003|6133799003|260925021311599003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wOF4XHuTWJT6uK6bXShqaf3EW5i8RtQF+A4ojMz2xESXkEyQgU3sgiJ2omrl/4M/sl885Lp8Vs+9GL66s3vOGkIREDq0cMfAKI6h59As9v/1QneCLUnieoBnnbmYYWONa4sGIVuMbgohuENYs4U0JYwshHZQmREkmNG6z3MeTTaL78aHNnhTwRz16+EW0XUP9yG3V1tKb/Tr9mvpfVyT3ZyxvCwXIUATQybv5Z78lw/B7XoGJnomzIHtSU9csnk5vsZ5tsVjP7I+kTsDOSIF1NpYUYuhiVurS6AaZadtwWl7wvF23Tl3sqHPq7cPZFu4opBuawGoUaKFuuR4wcBbwHIA7HPuN2gPnpA+Q5BlmvWMdWwv53riFytXIWwrdX0WiPb7flBdw9+Dyi189i/X4ih+dsZ9xDNB2b8OYrJIi5rI2Alb9iQRbRFbWzs8w4lZHcRPXeY+Gq9SP8pmHW23TwCd9TEyI/yZJqyOa+riXyOxSP+vwfqLQJ4rybEAR9bkMoTLvndLNN2ca4h4g6EQ8M5SZ0E/UWnnA4a78HzTeAgFqw9833zYe539kqyj3nhTp1p4DeBClcM1tdd2gHjty3dN9aRk+1IWKea0F2w/kxL/5jfww4T8T6zeeaAzudt/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(260925021911599003)(260925022911599003)(56012099006)(11063799006)(10067099003)(6133799003)(260925021311599003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kWnc96ohrCxVgep6g0lCNFS3bnEWbbCbt2wAGe5vDvqYwZfK87DOB3oZS09/?=
 =?us-ascii?Q?zL6ezaeaqGkvVUC+HYPyeF7QWgicdgGepkJ6eJ0AqKut4sV8iGsLsp+h+4YK?=
 =?us-ascii?Q?J5rhUN1K/Spng/Uo3rc86hgy7yNef7TwQzTO/08i7NeQsJHDeYgqdo6YJ8F6?=
 =?us-ascii?Q?wge+Jdn447mkOR1Xcw0AjwPyvQ4yWF0yrbWjxxUKdLElK0IxlLfjxUlqnSx2?=
 =?us-ascii?Q?kuuAmd6hFHyn58BmxGEJb1NBQviMZsVwwZOokXscX3/PIt/4OBq0JMugT7R3?=
 =?us-ascii?Q?5W9hdTO1EAsKgxI5Cz4EbGfmcx014GbiQIzhIDWfAoAE327/Px3+NffZNU49?=
 =?us-ascii?Q?DJG8g/6H/OsJkQI0NTti6ur01w90/TKc2p4Ix68yIoRUr8vVCOUixg5rKhOX?=
 =?us-ascii?Q?y9b7Z/KvfcbLRQeUV3DxQZjAmwcYFBB24vfAM82FY/5m5LZkUlaGUlYV6ggm?=
 =?us-ascii?Q?thrsIsdjhLotAgBh6A1Iey7vf0K68Dk0q0Pm78jY8sONO9DLTkXeQuBpjv82?=
 =?us-ascii?Q?vJOkWwzAM/lI8Ch4hcYELxXZvgSql2q8lyVyaReeKkTVW75UJ/kpL6AbjDMp?=
 =?us-ascii?Q?p+GdKUNiVRpz2MzU+whWceqW+DaiDSkS/ni25yM/SaCN9L9sPzoKqy4VS1+G?=
 =?us-ascii?Q?sjBzT+HPgumW6/WkMCYZ41EDq+nQh99qTNmd6xvt80U9I4RzjnTuS8XHQzUb?=
 =?us-ascii?Q?GYk1yIbV4Kcw3ESjFjXoB7KyTS3RvzAqSyUjj+2yIVVJg5evEILp+UG8yeK5?=
 =?us-ascii?Q?4+brROfh8Zjp4Q0COMTgoVSt8GitWa9cgfE4lOs+EaGPpKQ1CQ1j7vm+ruDY?=
 =?us-ascii?Q?DwZa4g93Xpk4pqr61cn5cSlb/cka2+8MH5Dvcm80s5m45CQd3mzskEcDPXgB?=
 =?us-ascii?Q?czo572YgDxFZ1B0/dZT3JPKtIBX90H5iUM1eaoIdLxxgoJt2cmkv4r7SkAkN?=
 =?us-ascii?Q?YSOgWNZjz5Ovvgf0O5Sr5Z5SYvDfXsKMgi0emnIW1Zwgz7cfzPT68j4+zoif?=
 =?us-ascii?Q?YoFZsHrII/vZZpW0wLXwKNgDcW9Dq6oERrprvcM261cv+aZAVus/Weku2Omi?=
 =?us-ascii?Q?AGXjTDXd2LINh/z8RhlALSjqVOsrWaAsiqNl+NUqbF79J78uyUQKjuZIBVRl?=
 =?us-ascii?Q?bJ8+i9Qz3tuaXaNCdzwTMFpXeJ6yFwykZ0kTnW5iBIjscuhLdLDhhOHrGK3x?=
 =?us-ascii?Q?PPKRl3iyYc+30Ekx0eVnYJAx7oW9fwpHNEUyF9Vulbsh6CLRImXtmBN8Kb9M?=
 =?us-ascii?Q?PQr6IABeEYJNAtGxJRLiXUoorNensDnKWMdW3d1GM19OVRdi5tRbI6ez/3Yw?=
 =?us-ascii?Q?h1XTYu9rxU+gfkvjCHf/ANNOBiOLNSG4m7UBOjQRhyWRzw4lB4woFLi+kMbZ?=
 =?us-ascii?Q?GwE0hw0+bMUXgLvBPeqJkda6xWak8JWK8U2pdWeWyGggjp0f0pFy2vM7KqU4?=
 =?us-ascii?Q?qYeZyaIyye1fepnOfg1t8UQLqc8ZlFADnPKbXhBPuyNQrAUmJOJfX8jzDrK1?=
 =?us-ascii?Q?zYwAEr/KxqMDf0pcppesIJjbLXfxemm2NmVfJGqlraSO6Gs4P5IiThycU6do?=
 =?us-ascii?Q?kuq5ub1F9vqGefQsBIk8Qk96VSwuj1oFQHxuMH6u1Vd/5ixUAxyzKoElN+ny?=
 =?us-ascii?Q?q8pKVvvrUaFf6BWAOUQRKCujyzq0fjtbag5i1bjU11Q84KmnrHpU1WL+nHWQ?=
 =?us-ascii?Q?ABGZ4DRdSgXfL9EmzXL2G6TqFFOLxpwfFop7NH8G7AIHSz/tQ4q53yYSqLSn?=
 =?us-ascii?Q?MReqQ9cb9A=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fc56e7-b963-4398-1993-08df1e5c33a3
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:02:26.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6m7sglqGyWOd3swDGSjGFYU8IoUf4gzA8rzoAGq7eAU7joSdFu0baAMcc+IrjCqhJFffCW2VNsokEd+FIaZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8053
X-purgate-ID: tlsNG-d25034/1790708548-02EDAA5B-D60FB9B4/0/0
X-purgate-type: clean
X-purgate-size: 5465

The boot CPU pending table must use the memory attributes selected by
ITS quirks. gicv3_lpi_init_host_lpis() is therefore called after
gicv3_its_init(). However, gicv3_its_init() also programs and enables
each ITS before host LPI state is allocated. No ITS commands are
submitted at that point, but this ordering relies on that implementation
detail.

Split per-ITS initialization into preparation and activation phases.
First map and disable every ITS and collect its quirks. Then initialize
host LPI state. Only after that, allocate and program the ITS tables and
command queue, and enable each ITS.

The subsequent gicv3_cpu_init() sequence remains unchanged: it programs
the Redistributor LPI tables, enables LPIs, and then submits the first
MAPC and SYNC commands.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Move the empty ITS list check before the preparation loop.

Changes in v3:
- New patch implementing the post-4.22 initialization order discussed
  during review of the ordering fix.

Link: https://patchew.org/Xen/341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola._5Fkvach@epam.com/
---
 xen/arch/arm/gic-v3-its.c             | 32 ++++++++++++++++++++++-----
 xen/arch/arm/gic-v3.c                 | 15 ++-----------
 xen/arch/arm/include/asm/gic_v3_its.h |  4 ++--
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 325835b0ad..511e49a116 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/delay.h>
 #include <xen/iocap.h>
+#include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/rbtree.h>
@@ -549,10 +550,9 @@ static int gicv3_disable_its(struct host_its *hw_its)
     return -ETIMEDOUT;
 }
 
-static int gicv3_its_init_single_its(struct host_its *hw_its)
+static int __init gicv3_its_prepare_single_its(struct host_its *hw_its)
 {
-    uint64_t reg;
-    int i, ret;
+    int ret;
 
     hw_its->its_base = ioremap_nocache(hw_its->addr, hw_its->size);
     if ( !hw_its->its_base )
@@ -564,6 +564,14 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
 
     gicv3_its_enable_quirks(hw_its);
 
+    return 0;
+}
+
+static int __init gicv3_its_init_single_its(struct host_its *hw_its)
+{
+    uint64_t reg;
+    int i, ret;
+
     reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
     hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
     hw_its->evid_bits = GITS_TYPER_EVENT_ID_BITS(reg);
@@ -1189,7 +1197,7 @@ static void gicv3_its_acpi_init(void)
 
 #endif
 
-int gicv3_its_init(void)
+int __init gicv3_its_init(unsigned int host_lpi_bits)
 {
     struct host_its *hw_its;
     int ret;
@@ -1199,15 +1207,29 @@ int gicv3_its_init(void)
     else
         gicv3_its_acpi_init();
 
+    if ( list_empty(&host_its_list) )
+        return 0;
+
     list_for_each_entry(hw_its, &host_its_list, entry)
     {
-        ret = gicv3_its_init_single_its(hw_its);
+        ret = gicv3_its_prepare_single_its(hw_its);
         if ( ret )
             return ret;
     }
 
     gicv3_its_validate_quirks();
 
+    ret = gicv3_lpi_init_host_lpis(host_lpi_bits);
+    if ( ret )
+        return ret;
+
+    list_for_each_entry(hw_its, &host_its_list, entry)
+    {
+        ret = gicv3_its_init_single_its(hw_its);
+        if ( ret )
+            return ret;
+    }
+
     return 0;
 }
 
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..6bc3e313be 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1984,20 +1984,9 @@ static int __init gicv3_init(void)
 
     if ( gic_dist_supports_lpis() )
     {
-        res = gicv3_its_init();
+        res = gicv3_its_init(intid_bits);
         if ( res )
-            panic("GICv3: ITS: initialization failed: %d\n", res);
-
-        /*
-         * Host LPI allocation uses ITS-derived memory attributes, so defer it
-         * until after gicv3_its_init() has discovered ITS workarounds.
-         */
-        if ( gicv3_its_host_has_its() )
-        {
-            res = gicv3_lpi_init_host_lpis(intid_bits);
-            if ( res )
-                panic("GICv3: LPI initialization failed: %d\n", res);
-        }
+            panic("GICv3: ITS/LPI initialization failed: %d\n", res);
     }
 
     res = gicv3_cpu_init();
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index 02c083f210..e1322b94f8 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -156,7 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
 
 /* Initialize the host structures for LPIs and the host ITSes. */
 int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
-int gicv3_its_init(void);
+int gicv3_its_init(unsigned int host_lpi_bits);
 
 /* Store the physical address and ID for each redistributor as read from DT. */
 void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
@@ -245,7 +245,7 @@ static inline int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
     return 0;
 }
 
-static inline int gicv3_its_init(void)
+static inline int gicv3_its_init(unsigned int host_lpi_bits)
 {
     return 0;
 }
-- 
2.53.0


