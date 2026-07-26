Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA8C531D0
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 00:56:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370881.1618757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9U-0006qF-8B; Sun, 26 Jul 2026 00:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370881.1618757; Sun, 26 Jul 2026 00:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9U-0006oo-4Z; Sun, 26 Jul 2026 00:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1370881;
 Sun, 26 Jul 2026 00:55:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wnn9S-0006gB-D4
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 00:55:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnn9R-0081V3-8b
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 02:55:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655b05-5cb7-0a2a0a5109dd-0a2a4509e00a-0
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:33 +0200
Received: from [52.101.228.97]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655aff-be1a-0a2a45090019-3465e461c552-5
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:32 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB5490.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:397::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 00:55:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 00:55:31 +0000
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
 b=hLM5z8Zbrhf64HEbJlll29O8EnKGutztpwg+Si9DC/LMEOJh4/xd/HTJzOQekl2N2pWZNF6MA7Mn3/V7wZReZWV69j6CrP4UgBNc7CnZ7M/cYzG++rIRdmPfiunFwnIKPrceKPAHI/SEh93OZUQzrJKTFxQIsAxv3VxzSO4i3+wUYxK/ynP/PaaJSQOX7C1eiA/GVtIHbWO14QgSQt7bq8ALPiMI7C28F/mmQzNt0IJXYpdojY+NnGND5jModGzd7wL397mPhY1JuCkEQ7cXHPCuFUrxxwPSYQyqpCYX9Bv8Uciq8doG1mfP0U1lhGsIIbQLMEFUw7D2bGT4oCKvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMShCBGc4W5KYknagjI2BL0mNG7v+HoatGWhYaSmHkc=;
 b=jtI7TW2RRF9BliD1aZkQljgMmWaL0t0ZAynv2kBkJ49GuqCDzCtsWuK4CcUUUWuadMlRL6XpZZ2D8vahMV1Gim4FzSLWwrmtKAO7UjWyvvYbQhmfyaBeo4tU0Sh85PEJmaZeCa/9sTPd6XoMJjJ0/IoUXgWycO1UN74zIvZjyKEmsPjW9WM2nCvjZg7WE3KK83gyS0nZV8PdhsIOR4t5MOVJzZwmh/Jyr6rfZ2kUtQPBo/nOVjaRlw8+PbQLiYOd+sQ36rgM0X8U3PjW+2he8F1ojiEbAXzHf5CiPqOtbB4dIJX6b55KTtg1aelkoLX3i8WN1eOk3QN3LqrnO9lRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMShCBGc4W5KYknagjI2BL0mNG7v+HoatGWhYaSmHkc=;
 b=WPJXinkHugLwRhQpcmiBOy723OXL2cVNtHbY/bn8lKN1aqAJkgmNPMw72xGde6jgagBQbi+gLfXKnXzwlyR3JpT32oSL7KSW7HhLkvYEv5aezspvkMSjxp5uNYmnlGC40bEjZev5XP6Xcp0JfNtW88BQopAr8By1lNhs76JQHk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v8 2/4] xen/sched: Link CPU topology to scheduler
Date: Sun, 26 Jul 2026 09:55:15 +0900
Message-ID: <20260726005517.379267-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726005517.379267-1-taka@valinux.co.jp>
References: <20260726005517.379267-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: efbe40ab-6bd3-466d-a1fd-08deeab097a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10070799003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ue4m0+C+frD0jlEpTY9KDMhqLu8nHI5qWfHvVBKhm+aKxSk3PJoj/oaebeXl66T//GmZi7uYfdRIR3JvGcjYhaOpEFje5wp9hpjCHVRJScpcJlgQSZhFAtV/qhOChAnI5cvcOss7zHmohwt+HO0CTPymKyTGUkBAzv5UvA0lAQ6L/0yP+xOk1ncYwy6ch9uCu+AlfWK4OZYwceSeq1vEmmu+Ssiyuqfb+utVzxffjpevLTRdmn1SjL4HHnYhX2WFXIEGTn5tePOH1qzq+8MF74vQDXyarPCzbb7AsEiLqaCsG8sdCOblRDT1ozY3V/PiZ94AdzI76IF0xEhYOLSgrONIDtBx5Bea7r79TiZcXdfPc/OZgq6H1ujeY+lI/EDvfXj/0pHRV5ICyjVBFhKLI6WH6m5MQvdSDloAkMC65Uchh5HKusYcW3ICbUUZ2AxNMriyUTkmzNNtNwXRLp1l4NU7XtZZZUN6+722JkHI2WfLoZwKxRX3sOmudfaYzWaPMl3jTNWt9InxNWXTt5OTQhpaC71ze8Y64rT6jSoM9Mr8GVrh5n1CbfEjtKWEUfKa2gdw2TS4KTyeLDJimt/IL2YamHGnkGkqi3WJMJq+CYGRsLxaT8Kmufo8ERepjubNnQHHrRax0DULAp4jrKFdBIzEP/G3TwveXDXz4STtgrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10070799003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LRtZNQT3YdLLM8fgG/ggJnKOZMAQO9R5U2syct/IB+BCJdzvYEFP9cJ8gi6Z?=
 =?us-ascii?Q?OAV45j0oTw4ykf0JKo6L1WoF3Ls8ftzpAn5O3ih2o5ICrc3TeSmfQyZih9iU?=
 =?us-ascii?Q?CHXdY8kVIJJA9qXVehHqNb2zsorf4ph8ZDVG/HXEjvWzu9aMjnAjixfCET5d?=
 =?us-ascii?Q?deZOnR7qjcrlLPfzfQb7pRglnLeGPNd1thmcRkOsqr+HDG04AmuV58eNtNZx?=
 =?us-ascii?Q?dcGdlz4Z3RldkcC816t4mxgluXoZA4MiDLDhJzqR+30jEBi8NpOQ2aM/r7DH?=
 =?us-ascii?Q?1axLhjuZ7KeNsa2866JeCRq0cd/h6WHGyQiRnGsl6sulI9IsQKzoy5DcvcNa?=
 =?us-ascii?Q?OMgEU0aZP6IAmV4PuBCK2V3XLjnQ1PV9vtBhwUclJsaFA4qY/3h0p5JT/yRI?=
 =?us-ascii?Q?Q+4wbQd8WDwUpbh4FFVBjzFF3O0ybL00a9yrPNHGMFrOPeoBHVT8Bk7ZWByi?=
 =?us-ascii?Q?QG3FNHWo1EP0nyGSBdFjSfRdy+Wu5B355o5pa01RSd60wSY37OIgqqyZjb4N?=
 =?us-ascii?Q?fpnhP8QN6Y7F7fK5QuANqhK+p6Gbtkd4n3a45GciVzHO07ZskiDlyye2T9OU?=
 =?us-ascii?Q?mUA0sp8OfKlc6btgaOoYedWiP+g2EVzl7MhKbrgGU28BrUvbIqwDGKAC+L+B?=
 =?us-ascii?Q?KQqld8CVKxrTqDsefoqEFsLim4Uu7xFg94TX8lp/R4rvQY2PGXSQramIC0hh?=
 =?us-ascii?Q?SoUBq5oCGiWuJqzXmRq2+nA5EfRzYUBWmkrmq8vZBQulDTqHFlqjnI2fWFcC?=
 =?us-ascii?Q?HF2esEelwoKEmYksNrVwRcN81kKkZjgDSVbonKEh1X090Nw+FXm6tpXdrzjx?=
 =?us-ascii?Q?9UggLo5gMmCyrQ0A1R/ftmwLfigNmZ3ADhGoKAQtPBl03K8lCHxZjFB4zukc?=
 =?us-ascii?Q?R/hzCBY1x5TEqwZiVMxUgAKPVAF4z4DHtP289aWFELvXo67S2Gx1MYiY5Y6t?=
 =?us-ascii?Q?9bc8U072xOlO8LmqSxBcxj3G4KyOVcIjvpx7TnIpLNLg6w/j8jBV1iTpsUlu?=
 =?us-ascii?Q?2jGMjsfW66UQGfg3tnpi3Vndwb7peC1lGJx0CZ9/eACYtsb0vVRJsU6Kjue7?=
 =?us-ascii?Q?p7Mi9HjZx5WslIOuvu7m4OtdisoFF0Pj9U4knHcn9hFW9V4VChBoU7AFUKeF?=
 =?us-ascii?Q?wq7Asq6xF9oO7xAFbks2aFN2bqxsphAxPQXbj3dqVwoEGS4Y79fS63kOex+x?=
 =?us-ascii?Q?Qg/h+MMIkMko/ebIxvFlL0FyREMuio/A5zQ8zni1ydnDkacSxDsVmsuxd2NP?=
 =?us-ascii?Q?19hS7VJG/6u5Mh+iha97KV+Hja6GCTCPrOW7MjX5tlfpIHY0TU4P9UwiYC/N?=
 =?us-ascii?Q?Ec/2sCToBYFJulaMXQ+h7EHPjvoMXGAOh2zwbekA4AIM60pO11/JmdDux+uQ?=
 =?us-ascii?Q?LZlnFJnsahZteTZ3v8CWKdpvU0n8ypkbosWE3UOX6mGT/3YkJ6Cwctj/37e0?=
 =?us-ascii?Q?23aRoBLKGeAk0nZn6SAK28YtlGNHa0U7CPT4zl2hp2W6rdLPcub4/ioB4zy2?=
 =?us-ascii?Q?y7AGPiko71kqhW4gM8BsH0mvhDO2K6mulGEHSTgrnsUS9NWBTUpLgrERLcyD?=
 =?us-ascii?Q?aPZxaRJyVvT5cmgDn5KGxJ0Umd8nhHeMCG4zl57vyvykAnZzM+6u5IRXAaaG?=
 =?us-ascii?Q?nTMBi7pL2mkAekG3D1VTKayD5e6Cq8iPwu1DjGUWKaNNOT68jGVjDPmx49Yd?=
 =?us-ascii?Q?dqql3qDH+CacuEoDjCFOVGbxWTC7N5xgjbAu2LK5MpQzwzw4KefCzqHt8kX2?=
 =?us-ascii?Q?XtA39FbvIl6pO8er5csJc99dRmFE+uCQPo/bmRA+BRf3cndLPAsDjTpGIngU?=
X-MS-Exchange-AntiSpam-MessageData-1: pNmSAjxFN6K+hA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: efbe40ab-6bd3-466d-a1fd-08deeab097a9
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 00:55:31.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI8E3YBnEo6mKfku5d/ZIorhmVaoQZ6b1ji9f+qttpuNu4wK/1iJLirwD7hR9cd6BDfoByvecGJbIebpNRsV+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5490
X-purgate-ID: tlsNG-bad1c0/1785027333-BF4D3034-091A738E/0/0
X-purgate-type: clean
X-purgate-size: 9046

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com> # scheduler part
---
 xen/arch/arm/include/asm/processor.h   |  4 --
 xen/arch/arm/smpboot.c                 |  8 +---
 xen/arch/ppc/include/asm/processor.h   |  4 --
 xen/arch/riscv/include/asm/processor.h |  4 --
 xen/common/device-tree/cpu-topology.c  | 65 ++++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  6 +++
 xen/common/sysctl.c                    |  1 +
 xen/drivers/acpi/topology.c            |  3 ++
 xen/include/xen/cpu-topology.h         | 39 +++++++++++++++-
 9 files changed, 114 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317f..41fa73cfc4 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index d957553a44..88b01bcfd2 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -92,13 +92,7 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
-    /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
-     */
-    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    init_cpu_sibling_map(cpu);
 
     return 0;
 }
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index 242346cab9..1bf6f6c66c 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -141,10 +141,6 @@
 /* Macro to adjust thread priority for hardware multithreading */
 #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
 
-/* TODO: This isn't correct */
-#define cpu_to_core(cpu)   (0)
-#define cpu_to_socket(cpu) (0)
-
 /*
  * User-accessible registers: most of these need to be saved/restored
  * for every nested Xen invocation.
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6b89df4a2d..d478ffb76b 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -54,10 +54,6 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
-/* TODO: need to implement */
-#define cpu_to_core(cpu)   0
-#define cpu_to_socket(cpu) 0
-
 static inline void cpu_relax(void)
 {
 #ifdef __riscv_zihintpause
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index 9259be73bc..36560dc228 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -317,6 +317,67 @@ static int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_cpu_topology_ids(void)
+{
+    unsigned int cpu;
+    unsigned int next_core_id = 0;
+    unsigned int next_cluster_id = 0;
+    unsigned int next_socket_id = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        unsigned int first_cpu;
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        first_cpu = cpumask_first(topo->thread_sibling);
+        ASSERT(first_cpu < nr_cpu_ids);
+
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+        {
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+        }
+
+        first_cpu = cpumask_first(topo->cluster_sibling);
+        if ( first_cpu >= nr_cpu_ids )
+        {
+            /* Clustering is not supported */
+            topo->phys_cluster_id = 0;
+        }
+        else
+        {
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+            {
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+            }
+        }
+
+        first_cpu = cpumask_first(topo->core_sibling);
+        ASSERT(first_cpu < nr_cpu_ids);
+
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+        {
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+        }
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
+    }
+}
+
 int __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -327,9 +388,13 @@ int __init dt_init_cpu_topology(void)
 
     ret = parse_dt_topology();
     if ( ret == 0 )
+    {
         for_each_possible_cpu(cpu)
             setup_siblings_masks(cpu);
 
+        setup_cpu_topology_ids();
+    }
+
     return ret;
 }
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..b4a3b59601 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -9,6 +9,7 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -35,6 +36,11 @@
  */
 static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+    if ( cpu_topology )
+        return cpu_topology[cpu].num_siblings;
+#endif
+
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
 #else
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..81a68fe24c 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu-topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 45d1f2c5be..56fcfa4945 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ int __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1;
+
         cpumask_set_cpu(cpu, topo->thread_sibling);
         cpumask_copy(topo->core_sibling, &cpu_possible_map);
         cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 7cfe3752cd..52ee93d4d0 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -4,22 +4,59 @@
 #define XEN_CPU_TOPOLOGY_H
 
 #include <xen/cpumask.h>
+#include <xen/percpu.h>
 
-#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+#include <asm/processor.h>
+#include <asm/smp.h>
 
 struct cpu_topology {
     cpumask_var_t thread_sibling;
     cpumask_var_t core_sibling;
     cpumask_var_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_cluster_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 extern struct cpu_topology *cpu_topology;
+
+static inline void init_cpu_sibling_map(unsigned int cpu)
+{
+    if ( IS_ENABLED(CONFIG_GENERIC_CPU_TOPOLOGY) && cpu_topology )
+    {
+        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
+                     cpu_topology[cpu].thread_sibling);
+        cpumask_copy(per_cpu(cpu_core_mask, cpu),
+                     cpu_topology[cpu].core_sibling);
+    }
+    else
+    {
+        /* Assume all CPUs reside in the same socket and no threading. */
+        cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
+        cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    }
+}
+
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+
 void init_cpu_topology(void);
 
+#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
+#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
+
 #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 static inline void init_cpu_topology(void) {}
 
+#ifndef cpu_to_core
+#define cpu_to_core(cpu)   (0)
+#endif
+
+#ifndef cpu_to_socket
+#define cpu_to_socket(cpu) (0)
+#endif
+
 #endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


