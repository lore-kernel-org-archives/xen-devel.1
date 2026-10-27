Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BE606A327
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ME89FqHf
Received: from list by lists.xenproject.org with outflank-mailman.1462571.1673533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoN9-0004lW-Ts; Tue, 27 Oct 2026 21:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462571.1673533; Tue, 27 Oct 2026 21:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoN9-0004lP-Qz; Tue, 27 Oct 2026 21:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1462571;
 Tue, 27 Oct 2026 21:06:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoN7-0004lE-OW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoN7-000vfm-1n
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:17 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11248-8faa-0a2a0a5109dd-0a2a450ab3f8-2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:17 +0100
Received: from [52.101.84.103]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11248-f2d2-0a2a450a0019-346554675b98-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:16 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:06:14 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:14 +0000
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
 b=kOUicMGSUJZ2X7IYPTVE2EAGf9sr0epv7UoBFKrjqWAWR88kn6/8k3kjxhjeXlfjuwGSPTsphdV4CVrCZupolAd3vzqkkwUv323iF5hVcIINBUuLUwD6o1k220Y1rYs755ddYsPsIKi+mOONe0seYHVX4od9lKUu9wnomrNwLfxBAfLOXT1xs/FOxpT9xDAMVafHmFGl33QpkVUtHXnikdP3dvnwKVk5Tf5oBXMUQ6OIVkJXg0Gta+5xbHg0wF/dJDGJWMvf2L1DRQT+Ut9hrOUnXzjBpSpfNtopMOtpN4s+ARhkg1SAUCDuYrUtq3PUAU4NMvcqHZJraD+YlZN+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cyfaumX1w4tjPFbwgfNutCF5GcE99xOV7lTNRVbeK8=;
 b=is9ls//issebgEZSLq01G1ovEaHv8vUhqtnze1k2KZjkwSM3teODgtLbzYW87nvsOcQxbfUYQSxx0pCLFYiexMUpKChO55waCDlBOFsyQ1Cu0JdRWpLAfSoDLtBJMP6PMy0ypIQtWrrxaEG8bWvqEbxvnlHJNN2+an0kisIbzLomiEy3I15DZfsh1fuCwT0w23o9dz6YO7ZWHUiep8CBoEonHRydsv9Mcpl4dC/XXF1S1fybcR8q9imXL3ije3k88AMbAtAxsVJQw+89nqAnJlL9j3jocD5YyRzZg/UGrnm2FLr/Cc5DkZ5ty6ZJIDi7MfGCCvtJciTV6+QAlwVpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cyfaumX1w4tjPFbwgfNutCF5GcE99xOV7lTNRVbeK8=;
 b=ME89FqHftpUq/LL7qVjrgjKt1GW21uh6bR/GutXjP3+5pmHVFFSbpiYFBtwEhxZ/BLV71MaE8TVD+qkOCIwtIg7D6d8yyg6PSRde2ZCrFeuiKOiZEQZNp1tQMp8a5/kxv1b/zBkVH8mEeyWTq9IRxVXyKBafORyqLZ9avdg18VImNmnZ3hcuCG7xYVM3Kh5y4I+Lyn8s1+AQ0+/8jNz3EEbOWGIMw+4Q8Tuq62ccJ4xvHOp5J9wBTv5myQ9IDF0TBEqyGq4j8QlqvzYd03a472DgYjf+x2f8NYNy3y0UASOV1rjA6QROfND6SAsR7bMO0Sn5oH4ttVkIjNGTppyICQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Julien Grall <jgrall@amazon.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 01/14] xen/arm: Add suspend and resume timer helpers
Date: Tue, 27 Oct 2026 23:05:50 +0200
Message-ID: <8f526c4c563a61ee4d4700b545dfafb3530d108d.1793129971.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|VI2PR03MB10907:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d97da9-4649-4e66-235c-08df346e22eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|10067099003|56012099006|261026121527099003|3023799007|6133799003|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	wTSvFWBtkHVJZ4BJ5EgHXToENkLmw9rJmu4bHCRDZ/2MFD7/TQPO6IhZXxudCFo6qfOVynNP958vBe//fgSLSTXk/tg2wWSGKWCOOhRNBoyBON73ycSjWoAYt/T3lqrsZksFg7L+yxw7y52j480Us1GjtsvATNdaOJVJhFllbQgW27GNmghS4LrpUgaH+IPUxi3jPJVQAgq54rCspJguFcnI+JCESe8MzI6AEhF+KzxMzNX/Q3ETFHVt280xcbEk5G/Xr5u3BmOIp60NTekUI8Zw6u8lWFAk3mgOSzkvd3EwZOqQ/mvVdqmpaX/JD9oInLlZSXrkzf1e9/hvNoF5IZ7aSsmS6eRo1MwbRkFr6JgSVni2hRGTWj3/tbHBClHZjxbcNFcjZxnQ9W24FaWSAlqhTZwcu9JpqimmpglHdMlqL0rShKIhGtLz594vDknS8WdhVb17pvspIJwY7bspEzw3/OiL2r+8pnsPHu84672JE9XhmRO67d4qODTghC3mzfUr1ilF6DVgxS04Vk6uUuiem+cg8IuDDWr9q2UremMd/2rAUB9YqrKC1skL9MdBcX+VAMCuLIVAXV1FN7MVXbB+GoLNXNaGfaQ98uFX8va35jxEL1um5BHayOQaVlUrb0gdlK0IXVwwr750Utb11opijr3DmEMRNrV8md45WkE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003)(56012099006)(261026121527099003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7VHLSPprJSf5vq2MrsaBx4iOhOiz/mpoN3tMa2W9rGK+hGj6feygbxrdjpDp?=
 =?us-ascii?Q?/pbwo1DF9l0PWZYGS2XJrzgdIUnTy4K4AuW5x3ekLCIFRC9E4lRJwmryQrhs?=
 =?us-ascii?Q?Ph3x9uegMSjaYM5ZokX63F1Z3fINrBc+a3yIv7wI3wrTpSjOVBt3hdrNYmOg?=
 =?us-ascii?Q?SwutfMxIMRqAEUn+jb6nsDn2/hRm7j4A0ZKpMXssSQ4ZaUKqNq6rlAeF9h5C?=
 =?us-ascii?Q?MIgrGQyqUcgzmCF1KPECd5cIQptEAnOtxP+/Fdy+NEle3W7fdAFa1K52hn6I?=
 =?us-ascii?Q?TMVcdIyC6ML4pODfkMrO7rEnkgBq0V2pB3B39eCD+2bajX+CYW8j3qd9Hdo8?=
 =?us-ascii?Q?lwp1VEwHEKhL8e3VewjkUpHmOGy3v576kjgBYQW9j4gjmC5lUNlEDbXyAIDN?=
 =?us-ascii?Q?V+WGBGqiZV/TDnLwlX/5BmEbCpc7UGPi02H8BQErAp1wi7RY7iUe5RJ/QiCG?=
 =?us-ascii?Q?UzZ2P1V30x3xEf2Ui4DXOCqnhp3dK4vs3K0zCx4lVr202LrpkXAMPvCnZoNA?=
 =?us-ascii?Q?s7jdLNZjYtgwrIH0I6yOcFKnA/f4J0OpcmLx8hTuHOEvUKoB5qXUdtwXbOb2?=
 =?us-ascii?Q?v/3RW59P6iaxhA4nFN0DWv2voZWfwri4+abkLwvV0yiMkDj2p56NLlGK2Mao?=
 =?us-ascii?Q?uwX9Y9e1aqHccZhD/OECe6xl8jYz3SltP+2Z6ubKTvSKiteldjd2sJ2rPhk6?=
 =?us-ascii?Q?PLP/mhBAebR8OYsNm04P94YBda5fy0HXLkK8qf19Hx6Xs2AMh8EFT/9tV0SS?=
 =?us-ascii?Q?d/3fnasZIRJslduPB3WZQzPnALV3W4dNTaaJjS6c0Gox/iB7pcuTmSbz64kD?=
 =?us-ascii?Q?zd3kZQ9E7y3ICpZJJfoP+ob+BdWcL1v6LxdiWov1vVn/p/XOfd20WD+l1Ta/?=
 =?us-ascii?Q?zPzdZQNKpozsY2Nk2V+y8UZIGAC2DUD2x4kSw756IMVjGBQaq/IOJwznvKr7?=
 =?us-ascii?Q?mnqKbNWCbpY/4imjc+DNxm+D1S+sAge+qpT1baUSL6QK+2MWZfAAoaKPBc1A?=
 =?us-ascii?Q?HbUfh0G7kfqLsUSLAR3F28Pru+1+Dm5ebVuBl7fKQQg0dTb7hEpvuuN9gzHF?=
 =?us-ascii?Q?2kS+dT4M+IJT2DB3+BqukRunTcv75/1UFAmqJZSvRUxrZKYvDLWiSCtWEjg3?=
 =?us-ascii?Q?XABGW2vMPuPpH1+vKzdw7k5og3yHDgGTUQGG0yER07ddXV6TV5avm4SrgAZ+?=
 =?us-ascii?Q?J11Zda+UHozfToE2OiNxcw4mHqJ0tNnsjURCUY7k7pc0UJm3NuBYhyxWcnsa?=
 =?us-ascii?Q?6HKs876t2US1h2biD0XBNwQbG/VfV//Mdo7q3g6/j5pmh0IIUxoLW2FZC9RZ?=
 =?us-ascii?Q?bnpPdCbjdJPe3U7FF+Y+aurNx9N2CuT+cBkeIa9NiHE7amVQCIr1lcbyIWsx?=
 =?us-ascii?Q?sJS7j/S6O5CQWbkE2cmbc7sWdpa4ukmYX001qfALug3y5rK0G1wGITSL0pBq?=
 =?us-ascii?Q?WUUIiwMX1eJAdPGmDx/27hY9z+pL+jVYnC6Nh9hBuQsBMC0AJJLhas2iA7pX?=
 =?us-ascii?Q?w5gpVBf1OZMf/dN37dTH0FTFZfjMbbB9ho3YewG1R4qvYK1H83G/BeSngMw0?=
 =?us-ascii?Q?knNiJ1zNHLVvjyMmuUqE8nGeIO9LseKNMicOdXvAGC7ZGnlAQ5KYz1kqdOdu?=
 =?us-ascii?Q?AGzuByGtR/RhJtmpN9QfaeXc59nE6AaXvUcNfff0wsZzjJjupYMnoJ+X0Yl3?=
 =?us-ascii?Q?i+yAjqUFNxAGLYwEFLxT7f0yV+ZiQ2/niEk7oJ2e0nH3BmHfNeqN3hVjNEio?=
 =?us-ascii?Q?mqlYgB/1MQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d97da9-4649-4e66-235c-08df346e22eb
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:14.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nN/DSVu9bfFy8hoKcjj8nEEViYRYJ0+EfeQhXSkuYUrCuM5b9Z+9zqtNGNI3IQAdgERSJaGWFC2wlxWQMGL0UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907
X-purgate-ID: tlsNG-4011c0/1793135177-59FDECFC-7B2CC868/0/0
X-purgate-type: clean
X-purgate-size: 5064
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index fd79dd31eb..7ffa0b5ac9 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -106,6 +106,11 @@ void preinit_xen_time(void);
 
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
index 295afa685a..edd41b6e31 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -311,6 +311,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
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
@@ -321,9 +329,7 @@ void init_timer_interrupt(void)
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
-    isb();
+    disable_phys_hyp_timers();
 
     hyp_action->name = "hyptimer";
     hyp_action->handler = htimer_interrupt;
@@ -348,9 +354,7 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
-    isb();
+    disable_phys_hyp_timers();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
@@ -390,6 +394,34 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
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
2.53.0


