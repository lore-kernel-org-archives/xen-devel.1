Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC9EC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 05:07:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372051.1619469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1t-0001Br-5n; Tue, 28 Jul 2026 05:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372051.1619469; Tue, 28 Jul 2026 05:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1t-0001Bk-1p; Tue, 28 Jul 2026 05:07:01 +0000
Received: by outflank-mailman (input) for mailman id 1372051;
 Tue, 28 Jul 2026 05:06:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1woa1r-0000dK-HK
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 05:06:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woa1q-00Fj7M-Tz
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:06:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ed-bab6-0a2a0a5309dd-0a2a4504d6a2-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:58 +0200
Received: from [52.101.125.79]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ea-b57f-0a2a45040019-34657d4f8021-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:58 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3277.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:06:55 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:06:55 +0000
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
 b=x78fsjhVdsZMdnHk3L9mANNjqkf5m0eA7enKDB1Cx+C3KVvSUuqbBdjNrn8DDKoOHuz6pke/1DWyZM+bGH8nXKhorGwFX2BF9OBkoES3v6pgZnpdRbu+E1jO99wcDpq3MNlHvPNeUCmdERS7WtS5oFxHXLCMoDPEwEBNYunnj9PCF+FlpuAwy/AJXnuPWHyGm8ze1CLKh1elFa72CFtu6m4VQl0G8AUq3Bfam2bRvRMI0Tq/QT5foXWG6bAzajfvdmxOzbuzKgqghvona69Fdgb1dQ4vbi5IhP7/Eoxnu6QPzPVw7l45ZGTvKQMar8HQjfcvok6Xarq3yen4XMkA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK1cLDx6Xq4Pa7KAEXAzG6KDMbfPkr/rPHIGR/XkH3U=;
 b=IQuuhZdMD1610CZTOw7rRPkadOVzrwmoYZeeA55NsDhsA9YGJXzwEuj8C3Y6XjigD8V0KXgXfFDe0bjhOrfaa1X1NBetSOZtTaTg52TkrcIsTJYynb4J+dW6/Ig4E9lp1IEKMxskVyvJv9hPdxZo4UWHkxB1NjT4oRrOKrAE8qgrLF7+9dY3jjtBDw47sM4AlJXGh10UjvYubIc+NzNChFTBd+4M7aKYWrPTYTIQKxlZEXDOcULUB2tjziAiTN2oBHHKyFWc7Rho0+CjzBP7vFNSWQkRyMK840CqNg6C0+moGk/gSkG8cYOIBlH6R/v13bNpR+STe3oVA7bhaadE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK1cLDx6Xq4Pa7KAEXAzG6KDMbfPkr/rPHIGR/XkH3U=;
 b=XDJlo7jePH0TGyg+xqt8lhBrEiJGC4Pdeuyt+DJ09b+IjchgcNuxABEgxntlgdhweMLa+24W9plNN9ZPv6XWx+RWWw8p/16VVZvP6lErhnf9YrNsTHjZdI7ISc0wykNQKm+q9K2I7LuLmvCBwcMd2OSeDbQwjxSBi4zsrSzawOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v9 3/4] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Tue, 28 Jul 2026 14:06:41 +0900
Message-ID: <20260728050642.411240-4-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728050642.411240-1-taka@valinux.co.jp>
References: <20260728050642.411240-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7c126e-1313-4afe-dc2d-08deec660b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TPRtjHYC1GTZsY4lQm9j4z/JDNXmW9PFPEEAxFl9wT1EUM1daE/npQsXQG1eD7Ig/CaOMUYF9dDlpOJQiaVNZshzhLYglY0PD7mOl4EmAjkmZYz4aYagmJ7sPIOQ7t8I/SCfJt+jX0ZBLPVFvjf1up78IG8/jIRfLKTIM4qSJ0nnFXjMrwxkX3g8gwfJ+Sio6htGvyEAbBaZelTSolo+mVGK96OPySNJ+RRQBapOeGX5/JhUEPb5M8c+nIH8TKlhyFYChKkZ1+ayMLGf2HJ7d6qvLH6zeeKZaiOX4IC1ZCl8gRr9Z3+jMbjKU4HGzLTJYQLGR/RN3476IuxnNXjEpSjLiZdejp/7yrIyXqLr6ox7UbwU4VvrSCUHPos2mtcLpb96HKajpsPa45n0d7fU3MwdYDPwOL070zA+oO9NaUrFpvJvnIQ5JZfLhqKKJa32x4t+g3p3e59iNnAM/nBpDXq2867SYEIp68wJGynHsLAXITco6J7B95jHy2i+2lLnkrEinN79fzzwzuLD3+kawjJn4RgWAK7J+esbDhmqHjWohSqObKJLvbRuucqoeUxmiCwBQGkom9b1NPDMhgbY+tjxjQUNjx94sws5Jg9BwHoufMEB9HA/tuPSyvYvnIedEok49Vd9QRnA3bR64b+3DurcIS+qMW0x74/fN53htFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cYh1gK/pMn7o1cdw2unT64+1yCbLU+4E3i/ht4InSqs+c0O0xhnPcActiAwC?=
 =?us-ascii?Q?ZAr0g+mjQOlhIKFrJSUXfTU9bdqluL+Uw09cft+OCopglvz25j7/eLBqtkfK?=
 =?us-ascii?Q?Fnk+ARFCs+7wxoElsREep5D7OjR30nw2rKgtHOQPnZtE+kcf05VVaihj9VVV?=
 =?us-ascii?Q?5hvi0uvLSjaNO3Q++6i+/ei1yxZw2GQ/0O1UQmwqYMD3yUXkszfJyvkX08vN?=
 =?us-ascii?Q?qFJpvqKCqlKdMZ6pF6x3B2StmNbQdxUJFHKQ4obXr3M8XSQPnP96goYtvdbd?=
 =?us-ascii?Q?MwATle5ybDLNTQ8fZG+VF0CeXkvl93G01oJ29YDXOulJdzSmAWwGtpoK4NtR?=
 =?us-ascii?Q?zPcCrqk7aknCowdSTK2P80p+DwifZxyeuOn6cdITeY2SfhaTdSw2gjgdsAVl?=
 =?us-ascii?Q?4y97auH+6/DEsru7AXkpMb+6QGTZMujFtQk8gf65PHXS8q7ygbgriVWkurx/?=
 =?us-ascii?Q?WiUdLR68Dz8w4qkxttuHIeMgelwYiZtPsGUPtlmt/luiPZeCvTj9+bIubD22?=
 =?us-ascii?Q?Yt1X6CweNbjSAyhd4E8SYRU9uBCWlYNdMOvNPfYSPYw29UprFwTRXY0++wFq?=
 =?us-ascii?Q?h4ErxVwXjJq3J6f6AAomdPodWhnh/f0v/YduOmFIBroY0fwIvp82f+ayx0GE?=
 =?us-ascii?Q?YyKkFr+9nnx9k7nb5n4bN/bmvNnJwI732+hrw9nErW1cjLGFT8qeufosqsTI?=
 =?us-ascii?Q?ERxYNM21HWRz50k119o3bGtevTrnOQDibrVWWv6nOHboEGCoVefqEBgfbkV7?=
 =?us-ascii?Q?Zy+CMCH66fVVtAaideHMXKCUKqRukllnVi1vF+T4bYGYzBHQThFq+HLIignH?=
 =?us-ascii?Q?GD3YM/1s6FsjAdOoouSwD+AYBWJ43pzbSiVm6RxBK3zrdZY5ZSC+jupW7rTU?=
 =?us-ascii?Q?JiuSsH6CoLdqsC1WrPXQ9a1hcKZQUF2DKolfNbtwjDTnm9MWMP/NDbcBnZ8H?=
 =?us-ascii?Q?QUt42unCMYNJ4G4U8WR40wAz1Jc1OWRNA8z6Ct9VDfAOu4jZd7mfMFnG+2FI?=
 =?us-ascii?Q?1YMwoxYitA1dRN+FtgXAfnXZeOz0VV8zePPnhGZJpiaZyOqrSUZWRnygvn1Z?=
 =?us-ascii?Q?4AcvuRgWDXdvd5KOskq5PG/X85hyhkWfnJeSkHCRpwaZRZ5ricQg/e4dUhOl?=
 =?us-ascii?Q?rhoCYzAr4mtiumY4emllHpgtzxkyaVrBnfTjx6yFd5UZ9VNiaGOXFuxqCMb/?=
 =?us-ascii?Q?jG7dSYdreTyHhOP3dMhILrm5BhbHhVmxcVY6ukHcUFbcyv/JTrLv/Tk+S60M?=
 =?us-ascii?Q?PUPQ69KYm0kHWV/i3HTYHDHdBqM+tCuGtRSum1mJwYH3jUd8y2revZCj/MUH?=
 =?us-ascii?Q?doN2VttkvfZzMfq6QnWuzv8lWbAhmFQK1tZ2/JyGy4F+yMM/RRUEu9GvTHcD?=
 =?us-ascii?Q?/MWh8E733NYIwOvRUbBuPFS+dlIP5MMKSt/AK8q8F4Pop0pV3968UdhiXtD2?=
 =?us-ascii?Q?ZqtN4nK7fzkFxPFze5V6DEWKsP3tIbNB9av5MZ2J7BxtZd1zAwLreyUuRSS1?=
 =?us-ascii?Q?Z729Psxjozn6EGZejUTQXIm6FIOVT2MmepThzhu4jgBJOGK1voOoETF+A0Qa?=
 =?us-ascii?Q?bqT0IrXIaVDnPD923WPQUivKKX7vwFsNq1rZjPhnQ5J4njvldif4CHwjX1z0?=
 =?us-ascii?Q?hJTybDr9PiNMdtVmPPYCBVFT9obep+WNeAe+2PKeezlAR0DcbUpySYPf3SAS?=
 =?us-ascii?Q?5oyAN33591saC3yaFllcbJYIpVp4TBo9HIuN+NVpxkP6qMJ9qi7V2KsBr9kN?=
 =?us-ascii?Q?w/G0s/01ZO7R2SB6CULxrqdwbnEbavd53b/N9ejXHKiYOaVJ4+fMa4CQFzhJ?=
X-MS-Exchange-AntiSpam-MessageData-1: gwVQwGOQP5tFoQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7c126e-1313-4afe-dc2d-08deec660b38
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:06:55.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7keh0eK+w+7Apfn3mo3EcWzeW3NVtBZWUs5kNXbKOS3kmUjwNwTnBeBt5SFDdtvn2uvMMZC1p572Kqmc2FBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3277
X-purgate-ID: tlsNG-ebf023/1785215218-520D5B50-05A66480/0/0
X-purgate-type: clean
X-purgate-size: 3435

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com> # scheduler part
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


