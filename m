Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E75C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400676.1636243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9Y-0004rw-FQ; Thu, 27 Aug 2026 14:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400676.1636243; Thu, 27 Aug 2026 14:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9Y-0004pr-B7; Thu, 27 Aug 2026 14:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1400676;
 Thu, 27 Aug 2026 14:32:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9W-0004Xw-Gr
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9V-009cNd-Th
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a71-bab6-0a2a0a5309dd-0a2a4505841a-22
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:25 +0200
Received: from [52.101.83.137]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a78-4cb1-0a2a45050019-34655389bf6c-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:25 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GVXPR03MB10457.eurprd03.prod.outlook.com (2603:10a6:150:156::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:17 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:17 +0000
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
 b=B0qJQLC5kH64Shf1cUH+loy+VcNLh+ENSvIMlXDT0cqQewjk7folOh1O95n1brQofFkgeAje/hL/zPjjh+Fri7g+qqJqWstr1AU/yXAnIaFCJDsfoBNnkYgnyUApGgzXgbYy8kl56pRCyrZD/Yvcnd+KLvWoulMhpzgMl0X6Z8wM5C4zEXQFptrXoxog1597ZAuAkglaVIZa24GPGeddwndDFshoyw2McMPU5JDD5MoMjQhewQAbg0+83SCJaz3wKjAQJPCTCFVfp6FU7JvhICIFGT7OMVKcA/lGJSAjRJXhO/dBcU/Ou5rG6TAaYkrOOJB8IRA5AmlkBBrK/FG1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EettckwyIzU3fk0kj65Ks0GzBorqIrbtyNKzklvpFMA=;
 b=PKfLcVDs65nQGZtftWMxoUXr/b5gU2edUcolyfqZsVU2Z+yrhjvRAUA+7KwHbuVry2M0wjzjk+AydEpPMLEbKo1eQ7Q6GNTGjhSjutnvSIRRQdIilQSU26aGZ0IthGh/UJPqcJWlbWD/s3OFqYIzW/yU5AMO3c81tCUBDeJ7cpp1mnaIKvjWTucbyXmkywEi8/GCM7bvlWp9RRduF3UtSxvPtjHuzlmFW32zgUwX+BGbCechykGtFujxSQyPAopz3xEdflXl1tXWuoq6fopRRyUSNgsFmEBmHJb/2Ctar0+mvtL5e9E/XmQnywmvftU6thDmAbaWCzoarg6ORcDl1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EettckwyIzU3fk0kj65Ks0GzBorqIrbtyNKzklvpFMA=;
 b=dopVucxC5lKvZGyFD8dao3IgvNs10gdgsA/twNY48TtfhUl4ltitApR5UJ42CUvUfgeMLPim6nwBYG6zU5D7hMKf6KJ6mFOAOKrE9ncwr/DZOG9vmSnLTxWolYr6D/na4k7lRCMh3McmXHj2B9dHkaW7OIP4ITypCrP58c8nYziPJDOFJ6HOdSm/zyZXLNSMyEgNSw0AUqIdpJvBGB56RlvFoOxiRIA1CrQwFawfXGX1XA5vpnKlKgoB4cfoaSowCuEMr8r5vy6j0c7MTiY1GUKmycUjSPQ7Avohyg7rYpGVx3/hJFjqp1iYU5w10lpc5e+i7DkI3tkZeHl7ekH35Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 01/13] xen/arm: Add suspend and resume timer helpers
Date: Thu, 27 Aug 2026 17:31:49 +0300
Message-ID: <12bf671ae959fa2266cce3681855c658b117db99.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|GVXPR03MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa413e7-6285-40ec-a6b8-08df0447feb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	R2KezgcpjoUINpvfnDM1am5vYmjrGHTxqlpTFlMnzjhxkQM2bvc7YdiOigBuWon99ZQLwWn0M3L3ILJjgRQ+9XINC+JIi29NEgON5zvzvntvTmSrwbAE16t9IJckllnsxsmw5RTvbnzOUcLoic/4w4t99RnVuG/GdjNhALq1U0TsHlfw9PCV7J+8DeHYPLCl6V2ny8q18W9zT7LUevn6QL2ptvjBBOblQ+Mkt4l6LaH60a/QWoePQ9RdcJqQZxwmgy5mydp/mdZLrqoSRim+h+kaEohUva6AC8BOVq3BstP3EyOvvBfaK22z7xA2DcPGfNHEqBqrLBnms98iDub+svBCkccL1oWCIjFH2KkyWBL7vL75TIsmzOL0l7tUhcr/MzJOxD2VGg6PehceXPpl2xUU2HL6g2X7s5nvV9rsYuAP57PvMjcRA8BXlm5VULgNERmM4KHWkRHXH4op0Wr3KKue5gl7Up7fjgE1t6M4n7DfNLr6o5MyzLlmmt9QGJVUKThQmitJV8kqyc9YBe5T7tnCtc1ZEH8G2Un3iD2eu+FGTKE62CWm/0buZEstVNeWi0AYEX5JeH5Jumdlu3w2q4FaxUrOY6S4/Vu94CuRP0LQB3JcjqTtzOcLAg7KtFp/XV1lETnIpsIZ3srtDvNR2dwFBuYYup9JQPQC8r+xFyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?il11xafZToRmJaotdqIrZVrLthrE/o917JydXxFElpZ/bXgTF+wj13+eppeq?=
 =?us-ascii?Q?TCfCcLSGkD92bxN7v6GDnAa/mXlQ556Age8yC6dKZ1l8/L/0U1s54qgmjOcS?=
 =?us-ascii?Q?2M6A3NJdiF4wxRHPAJ3notQLgiJfYJtj/ZFSekoUKyOBz70l3j94UvpSdmA3?=
 =?us-ascii?Q?WgRpujojVfHezrlohWi2gBgduWFjFfBRYQPtjGsaChG0AqxElV1NcQpZQwwE?=
 =?us-ascii?Q?6Y8TtGS5Jk5kuDwcYCkz+wwcAksBAqGtXVgXMxt83RaNWiuyJotoSColfNft?=
 =?us-ascii?Q?DZ+j8MQ1HOi1udtTt/JFdvgN7Y0yrVCR+j1BUjJkhyV+uOZp/8HcsykpzDIA?=
 =?us-ascii?Q?NZdxtobszL0hob+OTaV/4oLBGsnkScXFG1BomWYqfn0cuOGE7ZoaghIxIZTq?=
 =?us-ascii?Q?Toh2cFwM97YoxzsFt0H3iKcUJZQksxGVWiM3yKlLO2krXutBXoeeuuWAZjr7?=
 =?us-ascii?Q?nIoAggySZo9hkpwCIQC75Uyi99grGwuTkCFKqpGvOnae7JpFzB3wzIPxl8Nt?=
 =?us-ascii?Q?SA0XwTM881kpWDyuyN1T32Oy4F4nq4tPmLN25C3fTnbbM6G5YrfO3ulex0Dw?=
 =?us-ascii?Q?iOyUDojzln/YTG24UxLifiiPTi0vk3ZY6weqsoQtsp/OhNwDCdFBeZ2Xgfq7?=
 =?us-ascii?Q?Tn3Dpmf4ZZO7gnKnrajvLVmLcgqYeKAIcPtcahJnjvBGq/BGs8xa1hfAoJvO?=
 =?us-ascii?Q?sQE8PZx9g9QEI20y/ZMsVaTbtB0FPxbxTSYoulzTIYP8fcTPUKSnFIpHffr6?=
 =?us-ascii?Q?dDB+IdVLi7xutz2b6MFcbcCczNjuWzhIOM0/jdvp1mMtbaQ13CUaZtCfOL0B?=
 =?us-ascii?Q?/ZOmlwW3ukuqmzZhawfS0SKCz82BPT+4gOzm2Rm70E3cOoMBnp8YNL3pbKVC?=
 =?us-ascii?Q?wqV8w3zF0yLJ29Qcr1ElLMxcIVSTX+/yX4+tHOAWPbg/ojjiw0M9fOQSbjVv?=
 =?us-ascii?Q?T+qT+Q2nbc/RXIDzzgLLA8IP18k1YiOGUl5h8yaYHopIekD0PErfFL6JG3XH?=
 =?us-ascii?Q?1JjolKf6YT6g5T9stB+cWAWrMltHwiJRpLHmhLrabBichig3yBOQUA/cVQ41?=
 =?us-ascii?Q?EEqZVEy46kGOYH3fce14IYjAZ/WUagbsFGftV4kxBCNawDzxA7W2SwEZo5Yh?=
 =?us-ascii?Q?oEzck916MGYUFJYRwUvvBOPzLVFhJx5ehqaXIQ/F5AQE58QO3HFoNVSyZ2De?=
 =?us-ascii?Q?yKJaui7qG4YR7RvkQU5SK7CGDhaLgkMD+ri0UUW4amTNCj0vUUy9Id8K+Rxt?=
 =?us-ascii?Q?8C1e4ByZxxlIaKLUaoClRnN1j9s6BLdSsxsiLnGe5xOlehnJmE4mSEHXe7KQ?=
 =?us-ascii?Q?8MMnogkjFDPi4BmZNTyvhUPVjFRXE8dj/RuFGnGjBJADKmh3Zxh2dXOOvr2U?=
 =?us-ascii?Q?cxoH1UbLQjPCESSHKMiVPEUsvUjHjNh7VE3PnFDqRK+SL4hBOq2UcA6dCasQ?=
 =?us-ascii?Q?cyWVCUlP0Fdgg8IjASKMTNMpelT6RY3mwtKuqkZeeQjvLv6ySi5zhH2+g4Li?=
 =?us-ascii?Q?AoPMbc7jDBLMb8WRVkm3JFVGQMAWaiLpr83lWtHyvf10Csu9GUraocHJ2kBb?=
 =?us-ascii?Q?JbUWWZXixKqD0bxonHnVfiCXyFzDSq3HtJrFWVwACT+JCE2tysIpCMFgsbEw?=
 =?us-ascii?Q?11lLZQxmWEOsX5VURXXOsUsQmofo2Txg7Qld62HQEPxSg9KEJQnwTbuKWqXx?=
 =?us-ascii?Q?TclASfixOO7tMeCl6wvAnib6BlV4hNlJGnGLUZfJcOLmLKZ6uTTHviGz0N1f?=
 =?us-ascii?Q?WA907MTMBA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa413e7-6285-40ec-a6b8-08df0447feb8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:17.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEjYJmZX+sNApIZrfByAvcCK4lZgpgUtV3wOva6q+Fx33Pv5TZJGT0cDESe3JMKRV9HbNRFqWrBcXRP28Z7pAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10457
X-purgate-ID: tlsNG-c201ff/1787841145-F6CB02A1-473AB062/0/0
X-purgate-type: clean
X-purgate-size: 5064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts must be disabled while the system is suspended to prevent
spurious wake-ups. Suspending timers in Xen consists of disabling the
physical timer and the hypervisor timer on the current CPU. The virtual
timer does not need explicit handling here, as it is already disabled on
vCPU context switch and its state is restored per-vCPU on the next context
restore.

Resuming consists of raising TIMER_SOFTIRQ, which prompts the generic
timer code to reprogram the hypervisor timer with the correct timeout.

Xen does not use or expose the physical timer, so it remains disabled
across suspend/resume.

Introduce a new helper, disable_phys_hyp_timers(), to encapsulate disabling
of the physical and hypervisor timers.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V7:
  - Dropped EL1/EL2 wording; use "physical timer" and "hypervisor timer"
  - Renamed helper to disable_phys_hyp_timers() to reflect its actual scope
  - Clarified virtual timer handling (disabled on vCPU switch-out, restored
    on context restore) and added comments in suspend/resume paths
  - Added resume comment explaining which timers are restored by
    TIMER_SOFTIRQ
---
 xen/arch/arm/include/asm/time.h |  5 ++++
 xen/arch/arm/time.c             | 44 ++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index c194dbb9f5..9313b157ea 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -105,6 +105,11 @@ void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+void time_suspend(void);
+void time_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index be54b87438..680535a2ca 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -298,6 +298,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
 
+/* Disable physical and hypervisor timers on the current CPU */
+static inline void disable_phys_hyp_timers(void)
+{
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    isb();
+}
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
@@ -308,9 +316,7 @@ void init_timer_interrupt(void)
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
-    isb();
+    disable_phys_hyp_timers();
 
     hyp_action->name = "hyptimer";
     hyp_action->handler = htimer_interrupt;
@@ -335,9 +341,7 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
-    isb();
+    disable_phys_hyp_timers();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
@@ -377,6 +381,34 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void time_suspend(void)
+{
+    /* CNTV already disabled by virt_timer_save() during vcpu context switch. */
+    disable_phys_hyp_timers();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising TIMER_SOFTIRQ triggers generic timer code to reprogram the
+     * hypervisor timer with the correct timeout (not known here).
+     *
+     * Xen doesn't use or expose the physical timer, so it remains disabled
+     * across suspend/resume.
+     *
+     * The virtual timer state is restored per-vCPU on the next context switch.
+     *
+     * No further action is needed to restore timekeeping after power down,
+     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12.1.2
+     * "The system counter must be implemented in an always-on power domain."
+     */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
                              void *hcpu)
-- 
2.43.0


