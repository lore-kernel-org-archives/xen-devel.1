Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969E606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=j181K18E
Received: from list by lists.xenproject.org with outflank-mailman.1502761.1698739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5z-0004Jr-Mp; Wed, 25 Nov 2026 18:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502761.1698739; Wed, 25 Nov 2026 18:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5z-0004Jg-G2; Wed, 25 Nov 2026 18:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1502761;
 Wed, 25 Nov 2026 18:51:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xWI5y-0004Hl-Jl
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:51:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWI5y-003jWh-0B
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 19:51:54 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e40-2eae-0a2a0a5409dd-0a2a450c815e-12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:53 +0100
Received: from [40.93.201.65]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e48-f479-0a2a450c0019-285dc9412033-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:53 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 18:51:51 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:51:50 +0000
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
 b=shThx5LucqmHNEWJ84wap0WAvMH5e2ROlnLJ5hszBWYIpMmPBS4nyCpa/DX84vrOrcpA/zESWSLoCW+pgK4uLNPbUS6HmOYm3DpFVngftLtWvt3hksmbtq5dDBOLNTrgBFIBO518m8czkCtr+59QdItac/ZLph1unxGaFuA/6RRBCU/ErrXQyuM+3GPpxvh4SXZuIf9gRUQUep5vuRlZwIL3nWigOp7gU7gBIC3GwQAgjChHtZM2R8lfGjpZQ18R4bAVO6vkrHNHVkPqgCV/mgR7DIQExh/w3WtyGgLw6Qa0fTOF2lZC/Amv3HVmYmlZ9Vjr5eVKs0nsoylzD535rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIBmh0eBlbV0CDPbydZMobYz46Y0Lb+udaqKzq8qCYY=;
 b=MaTipCy9YaY/pmOsKPCzHk4hn0id796qSSru4aCRxAVpXoANurCn4h6ne1478PHrlob8NxMGt94Q9cMrH/7vMFmJ/tFsuW0ZqQIUjBNKHgaLNzuq+Ay7r7uvEM2KqKephdtXNPWQ9HsXJ22v8gLjyprDh00k4trUQXjqHPRiePN5y/Y31LupyZfz0Bn0kTHkULEekVCSCJ5xvUIstNK3kt2Rp04oIi7Bm6T8L9svIh9Qx1T1uz1R2QIh3Igf0dCkNpdDutzZKNzmS4BIurxqbt+ubmDWJhKHpb7E3orN0wTpiOgqz2EnN1AVG/652T1VAO7zZsJwH24O08jLGt6s/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIBmh0eBlbV0CDPbydZMobYz46Y0Lb+udaqKzq8qCYY=;
 b=j181K18EvFXZ7m8c2sMH7VS6p62W6qv5dsLnOGEdVWndaxfQ1vQlLR9jOcJEiCp6dvXs0j8z/9DWtsFcbiwOip8ykxmYawYxu5V4gE1zppV/kRyKYG0RIfGZs7/SpONzIAfiS8YCn67f4FcjU9N4LTtWXDBDSrOJ1LuZ6I39rcI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH XTF 4/4] Add test mmu-pt-update-swap
Date: Wed, 25 Nov 2026 18:51:20 +0000
Message-ID: <20261125185120.1766552-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125185120.1766552-1-kevin.lampis@citrix.com>
References: <20261125185120.1766552-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: feaab20c-799b-48b2-df95-08df4b252a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|10067099003|261009223027099003|261102123227099003|11063799006|56012099006|261021121427099003|261026121527099003|261028144727099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H/adzmBBt7ly3hm9Fa3b7OsY0uUfcVhTiAKiVsgL13/wtv5J1b6nhd/gto3BKmv5PZ+ftGbQ3iFYvkhDy3zf7Pyt43b/JvnIqMTfd56YA/6Z1Jd+pDUaTqO7Ax8e3AXK9QQnTwg7g6CxkZi7Ra7Sm+AGrRUBPcM/2/KDc8g84mN9zdh998hSlZ25Bz68K2Wv2k+un/hLSU3MR8axjFznuSG4TQ6aJWepYobkqDY6cjlHTzCHBxxKtdkMJnUFTUPSLr/rmUoVk4znTwRoI+P/annK9pST+r8mprtYYaZgxyzwA5d28R3+QZQgIfQ8+gGM859KNs55/+DukXIGqQfAugSIRBJn1m8oJnioexXnLYiykl5xd0eCGaTnbT+LKwNRh3V/6+sXEVM6Bu/4HCzc+8sBwgkfuFxtGf1j4njr9JlbiskP8xAvCfcpAY3PE+5NE6KD1RjyEsvAzFKPqOD3QV9LiV8xAPZKpHCQMtrmiPm90Q6Og0E8hZHOyb0jhUb92wAkyOdjNVG/Tm35cuVaIVcEAlifXrM0TBCp61u/HKzbpTRlDIS4AovAuUpUQp6RPCUDjMW1bZGc4QQUjv221MgODAHjf3KFC4Eac8KZEL3dGb4Tqi69Lzm1VzICyv8dfqRaPl4RfcjTRbGm3cEjizpnVIU8hBI1ORt9SH53poc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(10067099003)(261009223027099003)(261102123227099003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7dyR1WZ9IacbP9kTEY3Z3MDpVyGuQBwjzZT/+O7c+NNh80gESGRWagirRiQc?=
 =?us-ascii?Q?6YF9+yIMJmVFUvO4r3oE92mJc5uQG7dIqDaVyu1m8oTujXv7gyVugVmWO3VS?=
 =?us-ascii?Q?7g5R4ABUrTFX9HwftCAtYu+ThsWxL7XyvODwNu8j8kdcneizVbyIhAu0/M3a?=
 =?us-ascii?Q?1M7dyGS400YcVGIhPQlMwyQeQFKBIxQoMeu784w4w63mfZ9ElNkWiRxMqvJy?=
 =?us-ascii?Q?HoTIk6lyLsjCKWGfL0DSMURb2eUHCl5qxgNO0G7ebqR7Q5tm/jAMcaqsNe/t?=
 =?us-ascii?Q?S3ukazRP6GZPAd/PzGFnqu7KNgisstWz+UMlfXS/9pfk9aGZqOPxGL8DcU7E?=
 =?us-ascii?Q?oN4W6iBtIKO3gYqJ/cfc7E+7VA0vjMp+XbkUH/yKP1OK4T9sCkPP06/C2WTf?=
 =?us-ascii?Q?93PrYCj8TXuFchhuKq9d8O16ubo/FaQWaF/JwpWiuYWa6/PUvm/etoENKs35?=
 =?us-ascii?Q?N1cGvZU753mZehqQPXoVWq0GQtjWbw6PvmSGe5EQAipPzorcA2I/dgDN8IDx?=
 =?us-ascii?Q?q5rWNAHNTyT/tiBL6XmqeDmzJqq6wsEQSDVVC0hf4gkUqyW/UJ2stQmZ27N8?=
 =?us-ascii?Q?Jx0F3fRRt1RSPlmMR51qwZHrfX4qZO9LEXwzimbsJ61binQmywBA36QQUfeK?=
 =?us-ascii?Q?PpGCX7blAw1q5wh/ppo3D5GuPOSxPp3/IIPS9chsh92043WWN6I0BO39Ekpq?=
 =?us-ascii?Q?u+6PvqBbXogDRBYv0kpkLyoARrXm75GdY1MI7etPs0kx8rJAoqhiTFS+dyTS?=
 =?us-ascii?Q?2HX834dUxPg6hK2vGH6jmw0Cn03yjBJWvbQQhISg2TM6ot1zgkKEhE6CmRRA?=
 =?us-ascii?Q?NiCCwlJjEmKnp17Uo/wv7O/LrVm14hxSVfU7XPYFnthOUcNBz29XoIFk+50i?=
 =?us-ascii?Q?4xr3V/XtShVGLYPefbQWTyOX98dxqLCy4/PJOIsOn14KgBN4RPOmUailMAhW?=
 =?us-ascii?Q?1Rolekb7fAZkSIyFGO7klF7G2iyqyflQVU4aEkcICwADUuw9ovCrE4xQVS96?=
 =?us-ascii?Q?TIYsHVjxr7fAFhAvkQ0sDNwPhYeZY8Ea+tWMoq+5dlSgBfKKzq/gzZmBgnCR?=
 =?us-ascii?Q?3V1Y+cocCJeGfM6lv2SFrhcAb+LSgtLTjQMtINJXatXkd6kFbtUTlF0Sa7hU?=
 =?us-ascii?Q?RTh7JrXo+SNnMsNaDMUCjB9aM/K0DmpwLFX2fvi+VAGFs1WMuA+Umo4rzR8r?=
 =?us-ascii?Q?F9kbeRSTaEyema08PT9kQdNL7DXtXO0yRfUfTwx7TM71xaN/NtI8OuIxA4Ym?=
 =?us-ascii?Q?Swd4Lrz2h8fY39nzpqIgolmV2U1ix6VAIOZfcMlCY2gzjeZAADvtrCQpsA/M?=
 =?us-ascii?Q?SMK/vENWKbV4hqyq7wbtZ4a1xWJB03d8WseEJLzLz6/dKtuzL0Dlx9Ax0rlS?=
 =?us-ascii?Q?RMOC6lCDiON4XtAqkZUnalT2Sqq2X9TwePvR/uVgDnf3fJV3Uinn/2UCLh7A?=
 =?us-ascii?Q?01HYQvzIdJX+KPh2MJLyTexWGJ8ASo5/PZIxEIKxZVLSVcRHF4gCopyV+FQh?=
 =?us-ascii?Q?3oQ0FBog7afcOAGEzTyowO0zunlSWT0nDvmX0Ho+/dUxqrrmzU2Im2igPlvo?=
 =?us-ascii?Q?paNTbrw109X5zPeugbgz7EQuJXTrnehLtECcSqimyJRQ9QedRkXRkBlUACz2?=
 =?us-ascii?Q?s9bfQSlY4zIIOJNTVDOFYID7sYm1upL630V/Z3QTfEwRtf2rdP/7fr2wJytp?=
 =?us-ascii?Q?Cn46f2aCBvvwXmbBui8c9m74/eiyrAiKGDs8fq6HgW3d5LmWZh0OMdVVSmKZ?=
 =?us-ascii?Q?G+SHwiVZug=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feaab20c-799b-48b2-df95-08df4b252a69
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:51:50.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kuYrD/n3xIJF8jV0eyILnI4c8dWJnnCcKu7TYYiNzgx1ME8RKegUkRXU0BCu+PeLuRI1KZzjjAIc5KdurFe2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920
X-purgate-ID: tlsNG-d25034/1795632713-030D9A5B-6E7CC17F/0/0
X-purgate-type: clean
X-purgate-size: 6105
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
Changes in v6:
- No changes

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


