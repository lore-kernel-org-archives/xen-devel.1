Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33966606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=y3V/5MHz
Received: from list by lists.xenproject.org with outflank-mailman.1485384.1688644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc3-0007Vd-8D; Thu, 12 Nov 2026 10:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485384.1688644; Thu, 12 Nov 2026 10:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc3-0007T8-37; Thu, 12 Nov 2026 10:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1485384;
 Thu, 12 Nov 2026 10:00:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRc1-0007DB-Bx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRc0-00Gm3C-OM
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e55-8faa-0a2a0a5109dd-0a2a4505b1cc-20
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:56 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-9
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:56 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:44 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6Nvtp1lYplDFGSXfjv882NaZ9HNwDLhmvZKzrvi4gsDI+x0rt6KzIuQGs4lntlfWrGd3CsNKRA9UYgLfUNfPijC9gEFsjBrGApSCNgmvRTng5nbvJ6MZRa5b6ZgsQwiWys0TfSwYQtEzkVYAwtV+mCGmZ2Rq5p/udhUoiFfYyqCBtn5Nw5XEVkkdFqJ4+xPew++Zt7avb0KFDslghqLLC+2P2UdjFuiCkGpNQaCc1uVOIeMfjDxZ1Jqrr2ipSQeIbAhnshxEjBXkxNBuYQCSAHY+nC9Eko8eTdWtwi6AP5OAN3B7QmwIZBXxsiE1JAD0aU6A6aLUag95vssGWzU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WENd0E22XD9Go2PbAvzQt+Aa3h6x7D9Dlx+/ss54nAc=;
 b=C/e9zDi8p4SRuIdQvf2UTCxi9/oHAmw5Wrwwuu5dpYpAX6QUBYSs98oSSHdag7mPvFnhOYhpPozBQNZJsu1FybeIGW+OhP6gdZR3XAaOWqQza5dujbm12hYadK4quO9S5/bDNdVuyU+hfkBvabFsUSbF82ROkBFV9V4ZxlAKoeGlGfI6nu+TujhqR2FzjWxb6QmHBysdo6g/cQLaPeQ8S0gS1Hv2wEEf75g5DGevK8gYTBTl8ec1xtIe9aakVAzsubAodOAgLZWUYa05NzNMJj5z9+EOpWuqtNzI63OZ3okxroiENIpI6wZU9FQC37wOuXWt7Y//BF2eYpulBvVedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WENd0E22XD9Go2PbAvzQt+Aa3h6x7D9Dlx+/ss54nAc=;
 b=y3V/5MHzRnl7o4a5ulTSB8z5Wl+nVeU1CCGAExGPMng4JKU0LRTO2cnRjz36bvFAP9kdEL/l4Bdocsm+7G7P2hNXuq1ZfZ/+hgbHkwHJYqfaT/le8FFw+NzYRMsT4HBuFv3qnZkG+6pZdIMOvEK+3gb2Sw4eAVNYe9wRI3H4NEI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH XTF 6/6] Add test mmu-pt-update-swap
Date: Thu, 12 Nov 2026 10:00:05 +0000
Message-ID: <20261112100005.324440-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112100005.324440-1-kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c9cb00-886c-46c3-c066-08df40a3d105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	x2+WF1vpXMjvlbGXSlcphXw+G/+c30laTHf8XUrjlupaKNg9ofmvVGiN3cAa55dWaaePXLZT7pWKpHVQA2AaYuUEBvxdLect09UTrqB/caZxjUYUr8yeXgVjgNQocAk5w+StD8XWEFG/xz5fg0Dbo9jPJe5n1cCQ7C+t7pwCBm3thcOoA8GL45aIB4UFs4/FZ3GL1MC43S/fNGOeAxZr6JHq0zPP3Q479utMQpMfB+F852IlBAWxrw0yienL5IrYWozi8ep3MxAQaLyT1a/730XVSPK7wMH4Cr6u5C/Ca4V6UOm4zrGAoHlV/Zo6l+03Nxlv94bCxZVPM12fai4DzI5Jp0F7pjo83A10CEM4/v0E4FXPz3JGJiqqD50/1SdFBcztEnSZUBlfZWUldk3tsH8kwoRTuuka2WSBLtGz5C0aN+DmfkREMhkVm35Axd3vk03+izeWaXmA2j3SW2FDKxE16H4AyWz880v0XV1ccCEviYJoDnwW0NKQS7zG1FcqEVdeofj4fO/oV+RjrjDga0QNDbNDTZGYFRh28+4UpI+Jr4npMO4hPb4pT/Agzg4cM+kQNpXMv8ExjfZNbXo07dv5dgTQfuUXPwq0aC3GonHv4XFYPhuMQRazbp3ocpxb6eXmtt8GxLhCZRUNK70RVk9tPSKe7E3obcYbFDiuxhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qo4CYkUYvbDhvhwWF1WHIKOlDvQVeulk8GvKg/pJlE11k+bJ2ScTb6rA7nIk?=
 =?us-ascii?Q?mWnacsDb82p1mr/q5cbbFBYfRKcx07UT+Fqvvc0V2dcgmn6+d81IgQSi7ocs?=
 =?us-ascii?Q?tISsPMeIVwALmT7FLWqGHrRc+uxyhjHJ1+riFvlw1mEL6+BIGa2jK5/ycDiD?=
 =?us-ascii?Q?+GrMmgeO+1pdiAmKUmjhQTrrIpOollZYeRjfMO0MOCKGOJSaw0TlxMuo7JKT?=
 =?us-ascii?Q?yM14wFc9sE8dU3BOlhfOGM36CYFemQL3t884OKJXSBsnwvsSihFPi/sAaDTP?=
 =?us-ascii?Q?nBFkxMDkGuJ/ssc338yEHZzfbO8GMnd6DnqgBonE29wxyvS5mRDnddutbygY?=
 =?us-ascii?Q?5fSW/PbZ8MIknWbt0OLa2N/QJnJ9YcEYcE8XojBwdWPoSzOov1HelSIAEh98?=
 =?us-ascii?Q?bCGDY2cW5Drs7Szy5K7xRho+oz46Hi6SnEDH8p1bcHs/UuJEYiAxjoUdYTTe?=
 =?us-ascii?Q?md2qrAFOz2k6WOyfToo4w8jI57EUBYF4n0gIHj0bDgjx1I4mgKb4nYNWMBCx?=
 =?us-ascii?Q?GP1Hrdh0vU4aHf/1w2QoUYWx7Tv7XXy6vhvKNXvwXh+z5EpzDJku+xaBYSE0?=
 =?us-ascii?Q?8xKb25v8mWSzupcjlWQ8+IJUFpNmHWYxySpUA/pAdiCWxV6G+Ff5sAkD00Ix?=
 =?us-ascii?Q?Q/RyRSqIKXvafZ7/DBHMXdQ5NiTeScjpkUBMaGpy2NebcpKLlBofsfasc8Df?=
 =?us-ascii?Q?EtlZLWi6fDvzwpBsTh1MwdBffLvJEVWsoPDrxXUT6WFWtQhQMsGeMUU1p4xh?=
 =?us-ascii?Q?tyDwG7KqadjxNfWVtgZ5cchbN5cDOMvW7312/OqO0xKe8tdGdXfY7AxZLtVV?=
 =?us-ascii?Q?dSZazJV6f3ie236AiWUYbrpzzY6xNWX62iZb5MypNBs4llzuoh9ygQ8WWyH/?=
 =?us-ascii?Q?WYvS42q5qYLrrQsJiDf6hUc78hF0RS+21z2s6puhrSZlpNPfT1srt7NxgBK1?=
 =?us-ascii?Q?AECRjtbcFkuZT2RhGIxxDh+2Dcd1QlO6JsPutz37wtx7TAsNMZrlcBA5WYPd?=
 =?us-ascii?Q?2rJ5iW2bGdRsP5oiQHHtj/ljF4RLdcyKue5FLcO6jK3lNfsWI2rw/wOYCjHj?=
 =?us-ascii?Q?1lCu0Z9UCTBeazD1Ivj0Xwn+3ohWQuPu2PH3d5X3frZ22SbWpfA2JabCbng+?=
 =?us-ascii?Q?LGOBgaqT6g5JS+eJ4TdciysAxcrlTmsLTmDqn2fSnQz+YIJbVAEvw6JmK5FN?=
 =?us-ascii?Q?tsfmJwm7DyhBE68eaf98aul2zEiqihFfskUt2ng0eEukIOJBfL3S6fPgHXt/?=
 =?us-ascii?Q?45Hue4Yns/zc0O801HF336kgceMbgfwLnZH/ZQGUjagShx93ucBwxbZtg0K2?=
 =?us-ascii?Q?pg3jA9d7pkC1ukp6XvvHL4Za7Zvtyc19p7sE/Wt4+6nDP/kWXiwoguxq7E+e?=
 =?us-ascii?Q?56LWJ3BASfGJyeoIlL1f3T2a7mv9Lr2mfsiw18KeQZKvVrw5YOw7BxtiGY1h?=
 =?us-ascii?Q?YCiPNtnN9Tj6tO2nYx945PJ6fL6Qs/HjoVx4gMNBC8E5fPyf4YZr98yoABQ0?=
 =?us-ascii?Q?JhllBQuffEGBkrud1ZAhMJLWmpCw1Z6l2Q8TR9tbMFbramezf/uzLLMrfSoW?=
 =?us-ascii?Q?lEGvb+Y0TINbI08TcGM0cFMzJJW551MKqc8YXP3I6YXjXStHwCHT4hmCljE4?=
 =?us-ascii?Q?Jyk9kYkDONmXLvLfJc2XGNV4ffId8FOlzzYcJ3z94IiTiRpXTfxgvmAx58Xo?=
 =?us-ascii?Q?AmhqlCfh9EblFh0MJ4WEOQgq/ZhXvv8dETaTuYy5A0lIrbzQIxbgnM7jw9du?=
 =?us-ascii?Q?0CASXHIsjQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c9cb00-886c-46c3-c066-08df40a3d105
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:44.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQ+8ggNPCHVrKmMvYLdNyJl/XWQ4z1F7JAsg5L2I9txej5dmb0OhFeB88ArcdXg1IXtXCSJZhys175uBVWKTSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477656-738BE2A1-0E249951/0/0
X-purgate-type: clean
X-purgate-size: 6073
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Test for new mmu_update subop MMU_PT_UPDATE_SWAP

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v5:
- New patch
---
 include/xen/version.h             |   8 +++
 include/xen/xen.h                 |   1 +
 tests/mmu-pt-update-swap/Makefile |   9 +++
 tests/mmu-pt-update-swap/main.c   | 114 ++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 tests/mmu-pt-update-swap/Makefile
 create mode 100644 tests/mmu-pt-update-swap/main.c

diff --git a/include/xen/version.h b/include/xen/version.h
index 45ce490b4b8f..73719a358c9a 100644
--- a/include/xen/version.h
+++ b/include/xen/version.h
@@ -24,6 +24,14 @@ typedef struct xen_compile_info xen_compile_info_t;
 #define XENVER_changeset 4
 typedef char xen_changeset_info_t[64];
 
+#define XENVER_get_features 6
+struct xen_feature_info {
+    uint32_t     submap_idx;    /* IN: which 32-bit submap to return */
+    uint32_t     submap;        /* OUT: 32-bit submap */
+};
+typedef struct xen_feature_info xen_feature_info_t;
+#define XENFEAT_mmu_pt_update_swap        21
+
 #endif /* __XEN_PUBLIC_VERSION_H__ */
 
 /*
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 11af167702cd..8a239ea2b046 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -246,6 +246,7 @@ struct mmu_update {
 #define MMU_NORMAL_PT_UPDATE      0 /* checked '*ptr = val'. ptr is MA.      */
 #define MMU_MACHPHYS_UPDATE       1 /* ptr = MA of frame to modify entry for */
 #define MMU_PT_UPDATE_PRESERVE_AD 2 /* atomically: *ptr = val | (*ptr&(A|D)) */
+#define MMU_PT_UPDATE_SWAP        4 /* Update and return the old value. */
     uint64_t ptr;       /* Machine address of PTE. */
     uint64_t val;       /* New contents of PTE.    */
 };
diff --git a/tests/mmu-pt-update-swap/Makefile b/tests/mmu-pt-update-swap/Makefile
new file mode 100644
index 000000000000..9e01c6bace63
--- /dev/null
+++ b/tests/mmu-pt-update-swap/Makefile
@@ -0,0 +1,9 @@
+include $(ROOT)/build/common.mk
+
+NAME      := mmu-pt-update-swap
+CATEGORY  := functional
+TEST-ENVS := $(PV_ENVIRONMENTS)
+
+obj-perenv += main.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/mmu-pt-update-swap/main.c b/tests/mmu-pt-update-swap/main.c
new file mode 100644
index 000000000000..b43fcef57ed1
--- /dev/null
+++ b/tests/mmu-pt-update-swap/main.c
@@ -0,0 +1,114 @@
+/**
+ * @file tests/mmu-pt-update-swap/main.c
+ * @ref mmu-pt-update-swap
+ *
+ * Test new mmu_update subop MMU_PT_UPDATE_SWAP
+ * - Create a minimal l1 page table
+ * - Create a page table entry for a test page
+ * - Swap the page table entry with 0 using the new subop
+ * - If the feature is supported by Xen then
+ *   - Test the new page table entry is zero
+ *   - Test the old page table entry was returned by the hypercall
+ * - If the feature is not supported by Xen then
+ *   - Test the hypercall failed
+ *
+ * @see tests/mmu-pt-update-swap/main.c
+ */
+#include <xtf.h>
+
+const char test_title[] = "mmu-pt-update-swap";
+
+static intpte_t nl1t[L1_PT_ENTRIES] __page_aligned_bss;
+static uint8_t target_page[PAGE_SIZE] __page_aligned_bss;
+
+static bool check_pte(intpte_t value, intpte_t expected)
+{
+    const intpte_t v = value & PADDR_MASK & PAGE_MASK;
+    const intpte_t e = expected & PADDR_MASK & PAGE_MASK;
+    if ( v != e )
+    {
+        xtf_failure("Fail: PTE mismatch got %"PRIpte" expected %"PRIpte"\n", v, e);
+        return false;
+    }
+
+    return true;
+}
+
+void test_main(void)
+{
+    long rc = 0;
+
+    rc = hypercall_update_va_mapping(_u(nl1t),
+                                     pte_from_virt(nl1t, PF_SYM(AD, P)),
+                                     UVMF_INVLPG | UVMF_LOCAL);
+    if ( rc )
+        return xtf_failure("Failed to remap nl1t as readonly: %ld\n", rc);
+
+    /* Turn nl1t into a L1 page table page */
+    mmuext_op_t pin = {
+        .cmd       = MMUEXT_PIN_L1_TABLE,
+        .arg1.mfn  = virt_to_mfn(nl1t),
+    };
+    rc = hypercall_mmuext_op(&pin, 1, NULL, DOMID_SELF);
+    if ( rc )
+        return xtf_failure("Failed to pin nl1t: %ld\n", rc);
+
+    /* Add target_page into our new nl1t */
+    intpte_t test_pte = pte_from_virt(target_page, PF_SYM(AD, RW, P));
+    mmu_update_t req = {
+        .ptr = virt_to_maddr(&nl1t[0]),
+        .val = test_pte,
+    };
+    unsigned int done = 0;
+    rc = hypercall_mmu_update(&req, 1, &done, DOMID_SELF);
+    if ( rc || done != 1 )
+        return xtf_failure("Failed mmu_update: rc %ld, done %u\n", rc, done);
+
+    /* Confirm target_page was added correctly */
+    if ( !check_pte(nl1t[0], test_pte) )
+        return;
+
+    /* Try to swap the target_page PTE with 0 using the new subop */
+    req.ptr = virt_to_maddr(&nl1t[0]) | MMU_PT_UPDATE_SWAP;
+    req.val = 0;
+    rc = hypercall_mmu_update(&req, 1, &done, DOMID_SELF);
+
+    /* Check if Xen supports the new subop */
+    xen_feature_info_t fi = { .submap_idx = 0 };
+    if ( hypercall_xen_version(XENVER_get_features, &fi) )
+        return xtf_failure("Failed to run hypercall_xen_version\n");
+
+    if ( fi.submap & (1 << XENFEAT_mmu_pt_update_swap) )
+    {
+        if ( rc )
+            return xtf_failure("Fail: MMU_PT_UPDATE_SWAP rc=%ld expected %d\n", rc, 0);
+
+        if ( done != 1 )
+            return xtf_failure("Fail: MMU_PT_UPDATE_SWAP done=%d expected %d\n", done, 1);
+
+        /* Check the new PTE value is 0 */
+        if ( !check_pte(nl1t[0], 0) )
+            return;
+
+        /* Check the old PTE value was returned by the hypercall */
+        if ( !check_pte(req.val, test_pte) )
+            return;
+    }
+    else
+    {
+        if ( !rc )
+            return xtf_failure("Fail: MMU_PT_UPDATE_SWAP unsupported but didn't fail rc=%ld\n", rc);
+    }
+
+    xtf_success(NULL);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.52.0


