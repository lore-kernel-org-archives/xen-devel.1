Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B92C88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:47:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416167.1645333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xqP-0000Ct-CC; Fri, 11 Sep 2026 09:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416167.1645333; Fri, 11 Sep 2026 09:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xqP-0000Cm-9R; Fri, 11 Sep 2026 09:46:53 +0000
Received: by outflank-mailman (input) for mailman id 1416167;
 Fri, 11 Sep 2026 09:46:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1x4xqO-0000CM-Cp
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:46:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xqN-008kpW-Pt
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:46:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3ce04-e002-0a2a0a5209dd-0a2a45038ef0-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:46:51 +0200
Received: from [52.101.125.103]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3ce07-fae8-0a2a45030019-34657d6718d2-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:46:51 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB5003.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:46:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:46:46 +0000
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
 b=W43TliTQ83uKMN08ts8bDVN/bTPBh77H2G7tHV5yRK1ioZJQuMz56j96I630bY/CiQD96LAr7F2MS6Fmlhv0gV6z4OBY+oWgUwJsvlAU81AQeuVwMxOqfrveHJo9KcGqdrrG8DjrCPcvD8x19NUQNR7rgAxeql11VFB+JdI/MdZAsJWQo2FcD4FGIvne+Dg4kUXBkYZDBQUHqLkWj0x0K9r2p4haAh283gwSaIkVpONjsdAMm1UG4CkQswJ9uFCScXcfEHd9WFB/hFOnLgMzZIQYA7RtEml3Zx/2Nl3f6mhm0Snc5DthnX+Gm0/YPcE0ZvqqKg1u2x6fl8DOClYCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QN3BFSCAU2olLZdlHOeG7dSiGX9Gpgc5FnOC6U5PE4=;
 b=y//mHE5pqcnGSKlMp2Ku1roDo8ghasJ+WdM11D8FbNtZeudIxHY+HnuqMuu+g9zgn8neekwPurunS/UV8yk29qVlcQrg3Gac6Fy3r0IduR90k1Trgf1nkGQInoLd5sg3rC01hq+Xm6I0UCt4oVDG56d5VVXvrIGTSnhrvK78f1KdaVgSCWKthN+lmeONgvhdDe4yRx6oLAQrvv767D5P4/U252eJQizCR4+MbSAirC19shHcwrV3Gz949ZitU62Trv6IaoYFAMyIelPbAyLEXRQNxH+ilCtdXPDbGXo300qhqZj2sMhuxqlN5PbusBKNruw+3AYrrpX2oEqxGRjEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QN3BFSCAU2olLZdlHOeG7dSiGX9Gpgc5FnOC6U5PE4=;
 b=pR9LDkBYyxWeRwzj34MLGZUp6sZpueUtbtEWXZ8XieFXJm5fU5r2zNYqjS9jB+y0Fcnz0Cuk5+5KLLc2fHT2QrfOtpdmQs4pu32TvD7Qf43KVdQxQGvGZA87ukdXOo/at4GV1YprDngWrjNZWYMJu8faKRbQcVZGiIk25Xz5wak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
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
Subject: [PATCH v10 2/4] xen/sched: Link CPU topology to scheduler
Date: Fri, 11 Sep 2026 18:42:11 +0900
Message-ID: <20260911094213.79936-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911094213.79936-1-taka@valinux.co.jp>
References: <20260911094213.79936-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9fc6f7-9583-495d-1e65-08df0fe997f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|56012099006|22082099003|18002099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ikOYjXdQsqM9cEr2YU5AkRucjrM0KU/bi99Qkm+Fvi4lvtQPc5EVioUt85lk9YzXl+ceROKlN6Ngs7PDRKhDEqF6s9oXJnPzG8spwplrLlOYpPbOO2zHWuLkBf+MB4NdCjV0E60NQ+Q6UmH67mdfRPjyEwhO42V6z1++ART9vGHCZ962ovaZCFHJt80KrmLm3/XZRMcpz8WpcWk1wpSXW1PywAN8bYth4lSssGfQ7Upw1nwG+QvbqLR+N1hMYsTbAEEOxb0xXewcjO5rNNE50fEE4P+RlKQ/pi6t4d3t9Hfnc6EmsmwPsDIIjDwdEUzRInebqhINpidFyqpu8NV/pkYh6Y+a/tigoDiVSp06u21dItURzb7FO4mTxWOaLWU5AW7sHYDtJJjLg9tNqWwBaAClCvAt4nol4sJqfgxenDbtiIuUr6UyhFDH6AKRnHLlXnN4B/ULNzQGRyN/BfSELPgPRT0BsrcF58j6c3uPMX/E8mNsPUA3Q2x5o7KZ/VjYLEz8Tkaim30cMUXoSp4JdbNkKLadcK28+D19rwgq3wpGQneGlp75GnuZ0UY9HUHARn1pp/68eSiacsk9exYfQbqAPCKptsusimsK8dI37zM+SfihynHLJrgAjgjDyqXegPqULY6aTr0Ih/ux7iVdmrO29d7jzGlX98NJVGVDM90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(22082099003)(18002099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U50WlrxmWVAD5M20nORZbW7P0IcFoFitABq23i0CKNwvr9dTAp2GkXtjBXOi?=
 =?us-ascii?Q?MpaHYlunrYCvXB7va0pZ+DrSgM//r1AgGh5cMSKZgn8KEDd1xsu7JKUUn3y0?=
 =?us-ascii?Q?eqbyfYJF8HcxX7D+uDPR7XavjTeSpZaE0EA4miQMVjAeKjG2mNwG1fDlT1O3?=
 =?us-ascii?Q?E8Dv+ruTlrkCLsWHHp5bpJjY4xT5zt1YeV9LNtOqXacdJ/aKiH7NBJ37lhOe?=
 =?us-ascii?Q?rA474+MF3PKjcI6lD8reVfI93gW7qeBoEAyUCz1NRDWK/UJCCAmC5uii4uy+?=
 =?us-ascii?Q?E/6Zpe7hrWfnzbmp4ytU1dt0i5ECOSqzreaNp/ZruDPa8Xeqlo5KXOGlOQor?=
 =?us-ascii?Q?XnR/4ACW5nPxv5DOdfuMqJrc35GwIQVfpyhmytAsZf+92j7Li6jWjftpUyPs?=
 =?us-ascii?Q?QaemvfBMjcekqVNfvvOTSVmdvN2awNGH9U58G7rDcxnvDG0/YdS5LbxuV8wA?=
 =?us-ascii?Q?uV4neJiY5JuKQTexgjo2GIaMyX1H6lpTvXrZ69m7EoGlWj130ul2WsEU9pSE?=
 =?us-ascii?Q?PHEXIHemW4XVkMYARChW/iRiJekqJE7NsLmq+Apm8BGE4gmw2gYBeu0B9PqZ?=
 =?us-ascii?Q?DQhGsFhmRrpxj2LnPbK5yytcyx9v7c3Va4ZTlwkGhS4wNjkE3eqJlgkrebL6?=
 =?us-ascii?Q?suIJL0/035tZV77RNiwjYPsnTAnQ20wyQW8ACobeIpuNH0KVG66DHRVorrvR?=
 =?us-ascii?Q?OUG6FnMX2s7o36jra+09r7DUn7TPKGjCUApBnsfUUDO0iK2Co/RCqBaX4qlR?=
 =?us-ascii?Q?Hqr2/BBJaaR9C66cGi7v+dQwhts4qhZnluka025BEvZto8agni+qfh/GbiOf?=
 =?us-ascii?Q?3BHGAE2Ry2GJJ8HHOrT7xejwL3l1mPEJZFqOlgU5R7gCoHsmmj5OhM7YZaBG?=
 =?us-ascii?Q?T6Yf1KzSe6pKEn8CMRmFx8xpfKc+DANN49v/fe3UdLibkylmLRbhKdKSfKd7?=
 =?us-ascii?Q?s/nzVfrouawx/JLxbcKqTn2JlnzRvaLKy7AS8sbVl7ubviaHv/++WpWUMfS8?=
 =?us-ascii?Q?+DHtBCL8huOfqoZdOwfoxfGt9YDr3UNOSSfly0FjXa4Ym/7dNzwD7b6HHzpA?=
 =?us-ascii?Q?M3jYpAh2mg27teAPpRHcy/2BKia38QXFaZMp9g1iIMZsNPps65neQEAhMl4E?=
 =?us-ascii?Q?X5Rq46s3xwzEYX4ZIalbZSHwLXYwo1ZXOYrR1YnFDL+OB3QmddYfV/HIMR2m?=
 =?us-ascii?Q?hz2FG7QD7nMQNeFWe/ZoL/tsyEIdPp+dvb3LeBz4umIWJ4suuCPKU7oCACFr?=
 =?us-ascii?Q?dcxwUF2VqKsyFhgEkcYKpkbcFHbR+r0/+cTmd7dm+49eWBOl7MgKeJw8rBGv?=
 =?us-ascii?Q?xyybtT5Hm96VZDl3y6sfsvJt+JudnIXM+zXoiqfjjG1tnyjgpCIYGee9yQDI?=
 =?us-ascii?Q?Z4qqB3Fqp6TwIkpKmNqH2QgmgqLTHp/9iDeyxNU0PUMFpcYOY8TVY4VCx6uO?=
 =?us-ascii?Q?Uuzv9jjTZnnUtAxXbJjE4goB9ZfZQHZhx95MpvFLXFlr7BpPeCiiAu9S0snl?=
 =?us-ascii?Q?UZdnLhYdQNqZTlpdhhNqFKGxcVyTY+CJjHdH7Awi+J2mGiCtHgtvU3iT6OdK?=
 =?us-ascii?Q?s+edKrxuOHPh2/XZhNUV9DBPcb+gR69SiCA2Oic2PiAJMWH7O/gIdN+SoFEa?=
 =?us-ascii?Q?Sef2hQ2eWn6Wc6yTO2Mb+ovf8Amws0EIZd+Tu3itgJcrdL5IExZFIwzfczke?=
 =?us-ascii?Q?6qbheO60dulgR+rvJHDldr1BhEKnwR+6AIr+T4PdHEsf3O3q5RiOJWDPdfrf?=
 =?us-ascii?Q?KxE0svh0AYoI3aP8q+5v0yVfhCI60NYVwPi1SLK9ultknZjs0nzb+IoK+RJN?=
X-MS-Exchange-AntiSpam-MessageData-1: Ew8np2R8P3OD9w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9fc6f7-9583-495d-1e65-08df0fe997f8
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:46:46.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtzAk5ctjnq0Lb4vxr9UtdhYDDChInON0aEKTYn1s5/Nv709OwGKL2qVe6LawJ+3cwyUFWfw7i7SdOsEPmw7fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5003
X-purgate-ID: tlsNG-33051d/1789120011-6DAD44E9-FEE310CD/0/0
X-purgate-type: clean
X-purgate-size: 9049

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
index 8ee8f88fb4..fe4125cd75 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -614,10 +614,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 904130efdf..da57137a1b 100644
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
index b1745c1071..c5340a924f 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -52,10 +52,6 @@ struct cpu_user_regs
     unsigned long hstatus;
 };
 
-/* TODO: need to implement */
-#define cpu_to_core(cpu)   0
-#define cpu_to_socket(cpu) 0
-
 static inline void cpu_relax(void)
 {
 #ifdef __riscv_zihintpause
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index ce9da0bb36..b070774cbb 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -320,6 +320,67 @@ static int __init parse_dt_topology(void)
     return parse_package(map);
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
@@ -330,9 +391,13 @@ int __init dt_init_cpu_topology(void)
 
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
index 4949606881..eef94528ad 100644
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
index 8fb5ff0af3..6f1839b359 100644
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
index 090c793f33..d6fe4ffa67 100644
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


