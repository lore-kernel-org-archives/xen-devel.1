Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F31C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:30:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367302.1617113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsf-0007GG-Dt; Mon, 20 Jul 2026 16:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367302.1617113; Mon, 20 Jul 2026 16:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsf-0007G2-9m; Mon, 20 Jul 2026 16:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1367302;
 Mon, 20 Jul 2026 16:30:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlqsd-0007EE-D4
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:30:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqsc-007jXT-Py
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:30:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d09-e002-0a2a0a5209dd-0a2a450187c2-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:10 +0200
Received: from [52.101.229.80]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d0f-5984-0a2a45010019-3465e5506d27-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:09 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6790.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:30:05 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:30:05 +0000
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
 b=j/jxnySjlWSVeSpB5iaDAtlsQvHV+A9F7sCDhwc/Go86/f0Fin9MjqQ1NM7zN9qVJjWhuMRBqgcaXExjrsIecrHR1Zc2vS6WZ4klZFRC6XUDg+Sb3k6ptocyO5yCRS+z/Tm3zoVjXlyE/qr7d98Xwd1LAYXDIp+snAP2n8H4TGhsqoWptPFsp83kiBzx1891WORniwPUL1QkmuBwpsfZUwt5BlD3KADcIVbmdoEDJNdXEmRPuI8Ez+xpTDD9VtZ+bEZOM1yRESdn4NkyJe7qvWyckFPLXqwZnwwZBdwk2fO/7jpoOeAGzuoFeGBuWjrVTm/PD13Y4jTuGkD/xEdBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCCcHwj5j73NphvC+8hyMO1PCrHZUjrJVgvBh+/mJyc=;
 b=U56kOPLO4zA0dinzvCD9AZ/bTYSAnpbgym0X2Iqx1p/tzELxZkSGsI65SXFGwk81T5fIhoCezPbaCpiqo7fmaHlWD1VdHmCOoApJvgI5BbxEVLEjHvCek1Mg2ueJ8d3mgRlVtpKv3NeFIbmfnvkjY3fLTjVLEu15aiLwyerMXBK+EKIul9Z1+HtMEQC07S/7DAMI9bPKzSD996nXic+Byo5odUB0VS7/anIvRMVy46tx1Ym5qdi/T07XkKQLEArq11LyWvoV+nOYzEVA/G5uInm40ah1afs462MztXhrDv7IDBe2iGeFgx/rWWoyymljj6m6s0azVvkYwjLHJNAvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCCcHwj5j73NphvC+8hyMO1PCrHZUjrJVgvBh+/mJyc=;
 b=jucDGp/Cj4Mzx1x6QT3rainBPVCnnT8mEg1XlvHqzthXhOh5phW4Fl2SvA6yP2boIMxk3kXvgHakvAHyja9aB2b3NWawj38u+Aq8qaUIyPhbUZN/KIhZr1ORVW4OPWci5VGZb4U01gLyju+Z5pn+90mwyW7Wr7qM76qvX8142No=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v7 2/5] xen/sched: Link CPU topology to scheduler
Date: Tue, 21 Jul 2026 01:28:16 +0900
Message-ID: <20260720162819.308326-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720162819.308326-1-taka@valinux.co.jp>
References: <20260720162819.308326-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c77247-d7d6-45aa-189e-08dee67c27bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|7416014|376014|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IWLdo8J4YZStqd1gGDGBLLsyqAg/WRzlGXPExeUiaUcPm/w1fJb+pjg11MBNUrTfZgyTSTFKQ8HtjMSxRGwlRgojYMDcYWkuBjn9AYzFg4yzVIU2GhFrREU/B3Fbhr3uvo7N0VkO4yAmqx1RDMY1ykudjoe5vMMFuLWcNMKR58Oaph+Y9GnfIcX5YRhGHWJx3ncKqv3tGSuD0xA5pcLcRnfM1tXzxxiQGekYcattqEOMbpXdsPcXhqQDpIvIjsDxsRJoyGDokDY3WfSapGiC161NZLy1dd/qETO6k2e31KpMUrJijf37D9ieHzRfY34sANr76WwlSQVEjVlFTApRHy8puPT1HDK+151ir/3D2MwyqaI6cL5zRm7eZGNh/k9FVj1Jpuwp2fPMoTWds8tky38pxsPQZmkCWR4iHDe7HSWrEQgMIhxtHwWiByHJgqiK8ddldJJarOx00lLHYED+cEkSu7w2ssI6Gg5j9H6GTjRA365cCcRuAWm4UjO0rL/r1wiTAn7jpwxv9O4dXKAvC4KS0RrFC0DPXpjNCssBsn2MlOBCSlrYW4vUxLyGhBQkvTqdHkn7FNy4r8F6GpBl7sWqx0PVni0DoyXJCzO4JYn3hOrqMqoNYfblwGe/P6ymsUU23OZu2YCXWJ8VgFaWu91uzJK8ABJxSeTRM+gp/Aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(7416014)(376014)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+NUYJpMLbHzCQ6xdww29U+amPLyy5uWacYPZ/43SLY5SG1wbDKpy38jOyoP?=
 =?us-ascii?Q?pAQl2Xu9cAjBnht/jI0JwrXWd0leWHzHrPqPzSacVP55hvzyXug4Y3/JHlzm?=
 =?us-ascii?Q?tOjSnhiVv9dnYnHfPBgjhdNvffUN9g/DqwSy73zFi/3KtuvSGGb3KxebU9hZ?=
 =?us-ascii?Q?hJjrdccAwJ5iZ649QHqfxdRMkA4q1JUyR94heJUNJ1LvHrYrqwEcTnXpClCU?=
 =?us-ascii?Q?jMLX03C+IVwI4ZsfkZ0y61gxIGkreQUbg4uDv2VbZec/XNuGp/jM/lvvkjQg?=
 =?us-ascii?Q?RQDnY+D4CvosXw8bZUJwdHAYm92grYnKtB2r8mpnSBJuaU6yhf9Q1Xaxnhk+?=
 =?us-ascii?Q?M/YQzdHGjnXExskP5BLCSAiUD3bfdv/J9P/E48m7FR0BuqfK+LQPIBhaznKh?=
 =?us-ascii?Q?q7VMpGUrm28iEaWnPSCE7/3aHGflDZsTYQ30UIHAkQHU5qcYrxIHgHPmukAD?=
 =?us-ascii?Q?Fc06neqrblhgg11RzZTkUMGZkJ0wwj1AL2bgNDrxvcNVbpLjjt6tT5eUGj1F?=
 =?us-ascii?Q?NZm/JS3rMEzfRgpzoTp1QysBfajhYIl5se2df2xjkvjSUgqsxL3+cpo+nz6p?=
 =?us-ascii?Q?bLw0x6RNBXyCC4uyHnW1lMEqKsuKEu9fV07JGsHlkiyTw7eNdsS+G4pojrld?=
 =?us-ascii?Q?AgZrePFHJ6uoVnyveyEKFVbuOvuYaMDSyak8BS6VyC0w+Y67ov3uI8rVld2p?=
 =?us-ascii?Q?K9KI0EYG5gNG6j3d01n5eHKASz4+iUeGK6Wgj51n2rWUvSKFh9eaeL23qN5K?=
 =?us-ascii?Q?qL3yGZMxXb5Lagku0fpXBWZtZSoSZNrXXkIYRLiB0sadPbHJm+4GauF5sd9a?=
 =?us-ascii?Q?6WkEoPXDkYjmyXmij6o7SkhKRuYdpKYUH8FAaeJYV8dhYlwCP8MZnTzEs8jf?=
 =?us-ascii?Q?coCweQe0uZGkS3fVXn3V6ydyA/882ASNzaifXEhogM4IOaU53aIrIF2NE3Do?=
 =?us-ascii?Q?kpX/D+YzPQ22ApOnLsdMuvc5vEZh/0embus3cBwFaOB0s7XGd5/fwpYbOzeB?=
 =?us-ascii?Q?VUfUwPv+hIqogXtCnJZ83qbtC218FfpaeWhrxxgsDSWrvGhFtr8zMEcuBl/o?=
 =?us-ascii?Q?kGAD1yKaX6EPfspjeGgs6EeynFPxIdbHioJlhVxksBYG3bG5pva31rfLqozT?=
 =?us-ascii?Q?isko4Nwae+WH8SCfJA0e+N03qDLUdrWjBJJ1pmsBGxxXuD5F0mqtVKsmMsnU?=
 =?us-ascii?Q?Ye+rZTWkK/uqTtsbxOqsO/B3yz+a57FyubwMuKYR7YRPBM8Qo3Phl/fLNhcO?=
 =?us-ascii?Q?VRPFsPXcQPUKXgbUvgoPY4bedU9oX8HzyF8yWDSUsPWREcs9ryG5gc4C0AL/?=
 =?us-ascii?Q?1rVlLgZJgbHGFEH2ZbeCIYiQ2cGoaDagN8wHvHHNBIskPAATOfSzCd95bsh6?=
 =?us-ascii?Q?ZVDn9npQYdvcMEbTe99GbLmObaSgGF3zhOoBSocPrXdukqoW4tkcGX8g575w?=
 =?us-ascii?Q?AEW8//QzgWiQHLu19r4R7yAT7/E9l9JaaToe/+igAR+GkJFtHkZaIKyC38By?=
 =?us-ascii?Q?ifnh7suC6h394dssgyRaWntOyKzI5RqjUJ6cuzdi2qZqdQ/UUEqLSqJU9T8P?=
 =?us-ascii?Q?o4npkg4ox71stmCc85hfdQizbHbfyYgGCdxNvXgB2+GIm6HqNAiHp+2BFIPa?=
 =?us-ascii?Q?Ouv5fy7PUNhavYEZxI/BXgk/0HMFZ+fpwuH61f0OaBNg8C/Nrjwswh5bhqiV?=
 =?us-ascii?Q?fNxYSdregF+Y5o1KvJIutA8YScdI8UrGb1A7yyQ2lmUKvCi9H9uaIXuccsI6?=
 =?us-ascii?Q?ieigLxl2DHS7BojlqAPk/aqagV1ZKSh3nyh63YIVvyTQDywLsnt4IIWrTU8G?=
X-MS-Exchange-AntiSpam-MessageData-1: Fu9vze8lAAKMig==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c77247-d7d6-45aa-189e-08dee67c27bb
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:30:05.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOQ0yqd7d2eBAScEZDYhnMvclQYsR1GhGejBM1cL1Qjns7MQqmstq68P99sFj5BF2pMsYxVDbqWJPGLUIrIQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6790
X-purgate-ID: tlsNG-d62444/1784565010-1DA7E757-EE4CDF83/0/0
X-purgate-type: clean
X-purgate-size: 9052

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---

Changes in v7:
- Code Cleanups & Style Conformance:
  * Consolidated topology helpers with IS_ENABLED().

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


