Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC945C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:30:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367303.1617122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsg-0007Tu-KM; Mon, 20 Jul 2026 16:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367303.1617122; Mon, 20 Jul 2026 16:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsg-0007Te-He; Mon, 20 Jul 2026 16:30:14 +0000
Received: by outflank-mailman (input) for mailman id 1367303;
 Mon, 20 Jul 2026 16:30:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlqse-0007Eg-Gz
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:30:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqsd-007jXT-Ty
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:30:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d09-e002-0a2a0a5209dd-0a2a450187c2-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:11 +0200
Received: from [52.101.229.80]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d0f-5984-0a2a45010019-3465e5506d27-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:11 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6790.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:30:08 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:30:08 +0000
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
 b=x7by7hG821LZdoFxWp7lSGwtv5Tu6hdmj0jeR/18c9Oi5/7zW+TJW6bFlFa37vwfi3FmPPCP85Yb2FKn7Rs/jPG6ArBDflNrLZcydx4uEjvMxbnquuUogsh+snpU3spyVVtUEuHcuUofoQWIXrkrOw3jEVqPqYEvnu9ZXvBEluSj2JpppirSp8CHelAnUqrauPFdShfQ/aRy5njX4dqADkibH1/VYkxRCVSW5NSEeUmwCBvk2P46YPDp6frS6oVSdTq3C4mmzbGo9KcoAOl50H4qAem4CrPje9stgu4/v6ewwIIytM61PEwasZ9M3EfBz+RQxM2F3ihbruNNTIvFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhLfULqhN+7J3MRM6JeOSJ5q6A5QUJlf3TY/hwzabv0=;
 b=rVm1LL4Et5gVEr+621lPve/v80uP8XhbVALG2bDKzv8aAH0Jt2V47iWnqwqtPCQc6CES7OPRVCMmPR4RsZkbu0lDem3RnvbtdR8k3oRsVJFM2fyjHd5mgHvJStN16WX2mphzxRghVvEE2j+S1mbxnIS4TQ/k1DzUf75gkd1oBgNaV2r52sKmuqZJCzGkZv2+PdxNjClmgHScWMVMzcpeyom3EEVjKF1ZGReLTdVGNBL3XWZ539wGasNjbs+OcU6BAL7x8fBMOUAierqchgcaAV0NFSxuD0mllzGMf/KRGV/5UUnYeND5PKlRhKZ6oaj68ivxyrBh+gh5TA/m5BmrHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhLfULqhN+7J3MRM6JeOSJ5q6A5QUJlf3TY/hwzabv0=;
 b=UCBPuoKm+AWEOnGAAQW9qkF6Wcap1sJdCICdZXlkdM8iNFKiSItjLnXqa/Eh78TpuyCuGJKW9YRvstWfSwsCYiVsL6cMWyZS/jTRxVAxReBYWmlryPWgCgKlrIc4hDePmEQ62XUoJhgvbgq7ciYTavxlf/NefvzVvaDrMlOe7zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v7 3/5] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Tue, 21 Jul 2026 01:28:17 +0900
Message-ID: <20260720162819.308326-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720162819.308326-1-taka@valinux.co.jp>
References: <20260720162819.308326-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: d86b5ac2-1559-495e-c332-08dee67c298b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|7416014|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J2LHrutS6Bx2S7nJ6o/IoNQ7flo+j+JjPpMXrb72ht+fW83pahgzGngkfarcvkZwm5ilafvPKhIot4XqUdyA/cjTUp36YWS9UWryEnzsvkWwyx8arGmBwZbiWtpWjqf6nHbSB/HfbgX9wKi63s/InWupzqyNg1gajzRQBvc1IOCnVu/SK4/dQbr0a8ZdP2MH8vo3fJeEAbFkgaBqmf2YL+RXwauv2JG8yUrPJ1K7e60p6wTt8QPPSwYX7SmTbhUvsWySKN2gvaOfXsUXjRYW8HipEJOE9rZw6I4AEnjliNJiVos1uONUgMp3FWmDWS7zBaHSpRTEZJWWY1Hg6NowHhXXly3Q6DU0p7KYGhCmx1xmfs5mL6yHOtxnW1zNULti/syv63YNssoL8qgeTg93fzmiHHJJMz7tMVtNGtvhnqZX0zN8l4Nfwa07SO3mKRBER41nxfhDXNKhO26JOBrGHl3+S/39Fn+mJeH/MM0IbXJ3xS8ucfMrRSNESt/iHzN1doKIrNpxMNIFrYcOY2B58boElR6pzWWdR9Lu1QT8Vksm/6E4mMtt0DD/2trVRpMz+sT1aAmJlYqb4jQyCz0wefEZ9WTksHQWUzEziEzPLfwbhIZeHJ6AfyawnUo4DyBWX5GyKDEFTxxXGiovb/HoCaKR0t5YisBSNpxkWmYzSzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(7416014)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LpenT2uHFJQzqMrosZjrucl5rBJ+ItyQ92E88jYqc5oZ01grRvG3yUBfvypq?=
 =?us-ascii?Q?aW83e5YiZE14Tky1l9BRTXxrnE6d1wZcK38OfodYW1KyUY8aN5jBMdprfhO4?=
 =?us-ascii?Q?o7EHiN4uL/GpPFoa2aF8t1E/dbpQ+4+TJ3zu+WkFg2fPWMCByaEFPQzjIUJO?=
 =?us-ascii?Q?CcdT+9fCPqCpDe9Xm9LPR40jW0wf6D3bDhfSO1nHnqFwVEHmDvMCOW7+Sy99?=
 =?us-ascii?Q?n5/VuqwZkR7PIEFkulNyJofSddNyFYF10UsuyYLPD+edwoPBx9141Y0tG/2o?=
 =?us-ascii?Q?Cp8JkvPMq6Agsug6evXn0ZzqdakFSueOIB7w6alXhRRRfrQqtG7l4fJgizCT?=
 =?us-ascii?Q?4ghCuvdX5XvoZxbezzBrr3//d0qncFEz7YFLUO5b65wB/3extC8+Zc0TfssP?=
 =?us-ascii?Q?1XWZEauv5o7pK3Gr6nCGgw073/yAphowdYkJUhp2X/BEGnBQehzTFeq1hjQ6?=
 =?us-ascii?Q?MgAjvYwxuS8OM7DVHQXytUdFKTkczERRPBZtp4iQ+sDhqcgSFW4jwmMIhcn6?=
 =?us-ascii?Q?Hf7z8O2hXGruEPzhpMpptrO4fvVMr9y/mfWOtPFGU+SYsA7dfkDc/0W1rdVG?=
 =?us-ascii?Q?AbT6Q4XEQaCe4DPr20N8iyzBxpLMFuoprFrzVmjxScnG+Hfyk/h8fPZkC7MA?=
 =?us-ascii?Q?/Lke3oaL66uziD00oAnmjvqXKNyPlbTKRdmvPUP0Ybhk1c3b7wcqX6bfLZCh?=
 =?us-ascii?Q?/b40w/gEyyOhiuI2y4/V/s3QEQx1AAvAlM0Xxoe/B3jqKf+bsm1z66qB0y00?=
 =?us-ascii?Q?afeoCQAu6JVW3oYgDloJQ2cWUWTfbZz1KIKCwW5yuOz5+44J4oE88FRZpfeb?=
 =?us-ascii?Q?x3aiFLScjRZHoAlZtj2kU4ZbygTjac97k0/b/RLUOidjxukXdT/s0ueOjw+s?=
 =?us-ascii?Q?7xzlFIVQzrA9Npln0MAvHeTSr2V7ioGwnRzQKPV26Kmzud+IhayXLOXvw1QU?=
 =?us-ascii?Q?IyyLw5QzLOGyv83DpgudUvN+tK6rQdfxAbeFd11fshi04Bmm3wUaA8o/pb16?=
 =?us-ascii?Q?8Byixxb73HaYOzQnSXc0TbNNMXk6BNJh9XuTX6A2HaDBmpNu59vL1I47cLjl?=
 =?us-ascii?Q?x5SM9Tyz0woRB1RNx5ieBnLMxJhkPQOO6tECltTCpNQGwvkaX3Fq2gVOm2pe?=
 =?us-ascii?Q?XzPNda8Uovj7IcOKAhKGhg80M1AeF1ow31//vtiS2DdLEJuXPcr+0q9fEV7v?=
 =?us-ascii?Q?JX0ZqgLlOYBooxz0VZMucRBy3urEaG6kPIxKQUsnwceI4xnxycK8wqEM1+Ue?=
 =?us-ascii?Q?jc9WDy6S+zC8PuCuaOJ6ASoy3YQkcTaY3aRNjkZxUbnTaj5uBChM+2FSJbml?=
 =?us-ascii?Q?8eF0oYaQ2peia4kEl8wh8C8NJwdmNcraZfms93/wpbL4C1PTOH9elqfkRyST?=
 =?us-ascii?Q?/HBC0G7spTbAe+S1QcCIxj++A2npRyPsD8MvXBYnrEWNAkLq539O0m25Hkgx?=
 =?us-ascii?Q?HaJB9+QkW93LBGarC2QIb6l04EDVEcuWjqHk/rl7viC3bWCO23aAJGbCMI9s?=
 =?us-ascii?Q?dvc7HY2gh5jogWuIi54tlX5wXafWs7idkoDW6WPNm345dJ/18ehMulqSB1TR?=
 =?us-ascii?Q?6CmjUWnvHIGxRIJft8RFv2fU47xA/mS1qpvmgbySY42RgYW+Do0QAfdOyL43?=
 =?us-ascii?Q?O6TZ2PAToULeClcFHDxehpsR9+53DocLf4IXmJMCoJJm2aQf5kLoHSccfb45?=
 =?us-ascii?Q?eVudlPUZsNmA/QrV6iqn8BeklniY552NkP79AvW0HdSrTbZcvLZgYl1xZaMt?=
 =?us-ascii?Q?LWFCauCrPqV1c68YboDyQW+ptpgmz8il+gn84HTv7ei5VDl0LVr8CnliDRlZ?=
X-MS-Exchange-AntiSpam-MessageData-1: 6dAAD4uF5qlB2Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d86b5ac2-1559-495e-c332-08dee67c298b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:30:08.1303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpfTfm6nZJvMZsypvAYO+gOipArVHrZ3c5zwdZW5G1Or1N/UKfa3rIYBzmxSFBgIfL5jcvBzy5AmJtGAldgyZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6790
X-purgate-ID: tlsNG-d62444/1784565011-BF46D757-60D9F055/0/0
X-purgate-type: clean
X-purgate-size: 3372

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 25 +++----------------------
 xen/include/xen/cpu-topology.h       |  5 +++++
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 8ca6799a81..9758060129 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index b4a3b59601..6c645f0e21 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,25 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
-    if ( cpu_topology )
-        return cpu_topology[cpu].num_siblings;
-#endif
-
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -885,9 +866,9 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
 
 /*
  * Additional checks, to avoid separating siblings in different runqueues.
- * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
- * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * This deals with Intel's HTs, AMD's CUs and ARM's SMT. An arch that
+ * does not have similar concept will just have cpu_nr_siblings() always
+ * return 1, and setup the cpu_sibling_mask-s accordingly, and things
  * will just work as well.
  */
 static bool
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 52ee93d4d0..fccc9cd316 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -44,6 +44,7 @@ void init_cpu_topology(void);
 
 #define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
 #define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+#define cpu_nr_siblings(cpu) (cpu_topology ? cpu_topology[cpu].num_siblings : 1)
 
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
@@ -57,6 +58,10 @@ static inline void init_cpu_topology(void) {}
 #define cpu_to_socket(cpu) (0)
 #endif
 
+#ifndef cpu_nr_siblings
+#define cpu_nr_siblings(cpu) (1)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


