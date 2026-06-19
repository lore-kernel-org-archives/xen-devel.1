Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC36DCD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 07:50:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341730.1601990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTze-0003w9-4I; Fri, 19 Jun 2026 07:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341730.1601990; Fri, 19 Jun 2026 07:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTze-0003w2-1V; Fri, 19 Jun 2026 07:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1341730;
 Fri, 19 Jun 2026 07:50:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTza-0003vq-VZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzZ-001qMv-L2
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-24
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:20 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:20 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prjpCAtF2OY40ryy6Z8I4Bvzmqt3ctMWN4JlfLcaEhmb0rLy92TMr1yDsfzef/c3qdXMCD1CY+xhMGkvN/da4p+2cfl9aJ1GI0q+0vqhfzJsr4S5h5XvxRBSHU3G4z4JDt+6WxoISFBjqnZ8yaXIlnpXIkcvySysRfyqdhNlyqrMl8S/0HzjGY8aK3cAMRY3fJWlfgnBoOCfF0AK1WLM3T6gaT4do/H5EpcwLu/plcrSZqI60XpmbDr6zPFo8cRL3PLP4mtJhg5B+fwPCPACYLZ5XGRdSVMe1t5BTPK4cL+CG1GXzM6TqdyEpoA/oAKhO7Y70+Mwi9zl4kZQ0pYktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqzPDWwCk81V+4XPneDM8qTwAhjlrgmLc9YUkmpu6Y4=;
 b=f9HHOLVFvacg56EevAz5BvTXlngxQwiEOkFIJ02NNzfouyV9JD1A8ct2E2AKCQKlkgkugXAODkBLPcR7f6RJvRkgyF72SGl0/3OiEXN1NrVbNM3vEMXUkzic/KfXb206c9sVqiZz6Gf9mDxH64h3DVnWwMw65BTfJvz9UfHLRdIllSI9bq2iWhFrfU1JJwS6WTKXCrDo59kxJHkuuadkVLRPxh6lKjE60kbm2cnZoopBX6Wk8lWZBFtUVcca8CceF2XcTqrm9QDjIWl/1QtEh+Tq+zbxykFvpp8WvyE30VTgJkP50sMjZnvwga8SMSEVzgyMkjLUOTEDuPtQqM6Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqzPDWwCk81V+4XPneDM8qTwAhjlrgmLc9YUkmpu6Y4=;
 b=syZSFCww3OQFdWEUQTAORSX6eurxfwZRVxXVn5erDNcWKZfavHScpm8kG2Q4XyLSYPBNlogOKtPcTL2acix/XyI8pzcCmyQumXZtzAi7mf3vJPkxuAfw1mZSvBSeMBUDAgIpNX3bhClHQprmfHRvqaWK37hARU1Z/ipAIINymOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 01/22] xen/device-tree: Initial framework for Device Tree NUMA support
Date: Fri, 19 Jun 2026 16:49:49 +0900
Message-ID: <20260619075011.377116-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::11) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 5deba6c4-399f-4cbd-7442-08decdd766a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gcxbe9lTwOwgBA0E5iXJzX0LyojYsihTk+yfDKKJIsO43doYTK+3+KltFOs6cWNURwVVZ0YcFx0gIYXVhHf+8AGuk9FzEzwqDrAx4eBI7L9/nm9wkOOisKlhfDHOGMtzW+aW3axhMUxbs9TXdxu2X9BRAdaN+erMEKCAQKKvi7o5EPFjc4k1unNuRAGBLEQ5seyWQMr179ALP4h9GfGDBXBgzw3NcUEt85D7lFc/NdZ/rv9Uc1my/0NWg+KuDisWcdbG3xSc2mGnQvKQPyCO/CguOh+uO4K1QBI/QiB+W0EEgrHePpWAqXyH8IRB8phKpL2c4Y5LQXg8fOJD4Vpdw+wNlEAiUhXykUA3coQVKk3Lb4HyK3zgVAHs+NXnXfoR1lRqCUIBQz03KhaHi/rW/S1zUdpfCwXyusMjqvBi3hQOFymOsv8Zic4Rvnuy1Y56Wgj7zjSXCqrgI01yPiDLszgGcm3kM8rU0dkN8TuVOFq54sKZ2lbB3SvNjkgTr3SJsAVJOYlrH3vwmMEAdRZIoNHzyZxPvLMTpmQpMaFfczdqHD++5+NkrLj8NkhHTzrueX2nsiMHVmz4ET+XXGEcPzJjJzeL8e+T4BhxHhR/XMq9qudLvvfDB3VqOJ7vVgdLHuLGueESMqjZzWjoRwTC4LumDqvKrVzZe+XQJblt6SQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oauMwS1NhPcc7fG9hPmo1AVW7zToMNLsjBXolO9wfGkvTu6r3QOqL9PKTsn2?=
 =?us-ascii?Q?PIQOBJRvE8EceIf1gtmblATJEZh3HIE1GxdWA7PhXGtHUQBqdPSj08IV+mtj?=
 =?us-ascii?Q?S2YNPb0uZe3pl6VyDwUIq29af8QD7jk/YkcxFpCqWH3Vb3n5ygiEjYmRDXFD?=
 =?us-ascii?Q?1R1tgEpDaXOpBb8ReHtQJjHzW62wGmxINw/6qhBfiE1QRurATgll9mwavq7j?=
 =?us-ascii?Q?bU5/ccpevFF54KW2iLn0giKoZEDZCJxUlH14fN42FWjMjLEyuL0dxjj0kejV?=
 =?us-ascii?Q?J4h6KjFvGTLqeEgW+Tyei4/N+urR1rg6UzkWNk15dK/tqSSvyhSb3EahD5Os?=
 =?us-ascii?Q?Hv1t64buD+QDqGMrchy7nySImkFiOsO4E7nGIqg/D9dA04z86su/Ppfkv7QC?=
 =?us-ascii?Q?VKrqpO2PApYoBzC/fVFqX2PH+V7Ki00saf75uaIZl8hos7yUGv+wBanyvBKP?=
 =?us-ascii?Q?CrF1yQ6khmYOmOLIPWfLLHyni3GAKCG4i0xe0PvICIDA4hBei+9hkZ46L12a?=
 =?us-ascii?Q?vlt2jRUBHm+iNwVyYDSmF7thDyK/JON2umTb6pyEU8PrEVwg5wejcig3RgrG?=
 =?us-ascii?Q?6SpXCDVZ+UprqQA5MmDsgiKgdOgu0y6JK1/lkp+fuzHGiBT7gu7gM0dXhyzy?=
 =?us-ascii?Q?XdjUYmqxC3Sq+AO61QIZYHxlIMBYjHQPeMJyxiTK28awJAsmnBDT0FzSo2ul?=
 =?us-ascii?Q?ebm26vq+oDlGTKheFH44g+87MfF3asNLI2zs7CYU9+32f0aaD0/XMShiBCdr?=
 =?us-ascii?Q?mk710dy8VK25DMG+uI8VBK0cOb+AaKFD8mOZ12HxfxW5ruEjB6qj7qLYQf0U?=
 =?us-ascii?Q?LYMl2hKtA00e7qYEgU9sn8enMzZ+zAMVNAnVsOU8e0h7220oTf9Mw11X06wI?=
 =?us-ascii?Q?mikhPmXUx9YiQf8a2AmdnWcVD/iqHrBiNP14jKkl+RxsMxZurACFwSYUSjZm?=
 =?us-ascii?Q?qVwEI9YMXKkXoVg5G3MNAUt0diI4yEtG25OgJkYNE8yREfPPvf/9hPTlNLa1?=
 =?us-ascii?Q?r66rOg5NhpLBgT8xjPeWLAX3ZuCGN39cEChaLAkpBHJMJVUI+cy3RZ2TmpFD?=
 =?us-ascii?Q?sGssP9vpZo2xcfv4i/WMdYA3Aq4PI7yoRApEOmjlF1gDwu3MXySEIxNzD9oo?=
 =?us-ascii?Q?YZCNOcDVaEiu5eAWf7929hzOCjVfDHk0oS7KLPS5p0WoughhdP286icNkhn9?=
 =?us-ascii?Q?2h84CPziaYINW/cAJLnIVPAfButtW42hzhTR6078noYrJstqErxa9CaJYJci?=
 =?us-ascii?Q?RYVb2fZ3ti37pp30wPykvTBit3ZWq4uLc5ISioB/Hc1CgQFPq4jgvYO9w4L6?=
 =?us-ascii?Q?+emqcqYTi0WXtE3Yr9eVcp5VzJ2Slg3vcxkidDpHMp+MijO3eWlEkoyA3G4b?=
 =?us-ascii?Q?ESLKP7FTkDaKZBl58xd9iBdicvM37Adwf8YX5KrdLWlbon0KQdOHb/uxtRZq?=
 =?us-ascii?Q?JY8WGDTj52faNyBFjALhsb0cc8g6GWv3B9sLkqXHlyhYr0oOx1P0i4X/6+EU?=
 =?us-ascii?Q?Dsu5IZ8aBCB6F5GySF9406ZUOTCztObGf9iSDSCKRuKpJQWJySWelb25SD5x?=
 =?us-ascii?Q?o4uaYeYsw51z+PxxDSEV7Q3OPfTAY1lz51AcqVXF5sfLZv08uBtMNijEe0s+?=
 =?us-ascii?Q?vn6/3dWD7zcoeZZr+c3lM6Un3ocFrxwJMf99JodK2EbGIzCznYRZQ5iG1OJ1?=
 =?us-ascii?Q?d0X93z+VvEK9EMLxETvF1dGZd8Np+onwmj5LqBwnSRiTG2WWTbrJyqj2VFgX?=
 =?us-ascii?Q?nwXHtPDHs+ERMd48/nZFZhy6Gt5g4iYzyyVzU1Hj16qz4TsPxGHX1DwAZdKm?=
X-MS-Exchange-AntiSpam-MessageData-1: VDTMCgBFo6213w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deba6c4-399f-4cbd-7442-08decdd766a5
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:15.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFeMZ0cW3VjEjHPC6jV9QWRj0ScS8O5xmqlW1TcK+N+xOvWvaofiedcmntZR/vmgTbIGBPl1V4tWoU8cq4CJyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855420-4C1CA00E-A956EE7A/0/0
X-purgate-type: clean
X-purgate-size: 2006

Introduce the initial framework for Device Tree-based NUMA support
on ARM Xen. This patch adds the required Device Tree-dependent
helper functions needed for NUMA configuration. Note that some
functions currently contain stub implementations.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/include/xen/bootinfo.h | 14 ++++++++++++++
 xen/include/xen/dt-numa.h  | 23 +++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 xen/include/xen/dt-numa.h

diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index dbf492c2e3..ca675db5ce 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -6,6 +6,7 @@
 #include <xen/kernel.h>
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
+#include <xen/errno.h>
 
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
@@ -214,4 +215,17 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);
 
+static inline int bootinfo_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    struct membanks *mem = bootinfo_get_mem();
+
+    if ( idx >= mem->nr_banks )
+        return -ENOENT;
+
+    *start = mem->bank[idx].start;
+    *end = *start + mem->bank[idx].size;
+
+    return 0;
+}
+
 #endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
new file mode 100644
index 0000000000..c4a229bf9b
--- /dev/null
+++ b/xen/include/xen/dt-numa.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_NUMA_H
+#define XEN_DT_NUMA_H
+
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+static inline unsigned int numa_node_to_dt_nid(unsigned int n)
+{
+    return n;
+}
+
+#endif /* XEN_DT_NUMA_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


