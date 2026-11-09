Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21659606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=RiGTyZmi
Received: from list by lists.xenproject.org with outflank-mailman.1479520.1683444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQICH-0005MP-HG; Mon, 09 Nov 2026 05:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479520.1683444; Mon, 09 Nov 2026 05:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQICH-0005MI-EM; Mon, 09 Nov 2026 05:45:37 +0000
Received: by outflank-mailman (input) for mailman id 1479520;
 Mon, 09 Nov 2026 05:45:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xQICE-0005MC-FE
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 05:45:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQICD-0069KX-Hm
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 06:45:33 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6af15db8-8faa-0a2a0a5109dd-0a2a45038248-48
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 06:45:29 +0100
Received: from [52.101.228.82]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6af15df6-fae8-0a2a45030019-3465e452cb30-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 06:45:28 +0100
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB4498.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 05:45:22 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:45:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6tnxWaj8DBeshthxXLJuO8C/yI0B7JBS1BM5vxMAxR5GnslVgz0ONV3TwTBQ/0u5hUa3nQvENbe1ykvI3NDcNSdgkUNLGi6LtHTlTa9f4PJHnmICAyAnVIkKO5/apxl6wZkskdy19FTMG6Nu/CqYT71GIAoF0/fxq+1BGDXIwGT7W2hvJPESzsklgpTtZDyGi9hP+C9yfMzg88BQt9u2RvDCOQmsOfYTbnsty88gcH1aLVvk+uwDI3LzN1Df2w1Yfc8pO+8jL3ihskQoUJQRDchbJsxNTLW7RLfWDzfEZ/Uqmul4jZLDo0U80xB0e6ahebNa1Ww6oGp+FkoYSm8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnE39xUZrPfDkklWamkjids0YN1Zvuf20sqU3WH0JY0=;
 b=UYEkcxUJxNxekk8NpNNR8Fm/pli8XGIte6BOsXHuK1nu5gFiiaZKe80MRoNcTfTlqRqDAppHBw3Ld27qDyfoRDT3pZ6OVp+HfnY8nXWDoccMHHD7Iqj49W0ExKwZbWrawmb2C1j2bYKUWB4Ie9re2rHyx/bfYgFxiMs5hc6ghEwZF2QGvvEXKzPnHcuKtZrsE9Q+EEAbQtYbFKv1zlbRmQBrPeiUmVIC2amM1cE1zICFdcK1d6mRghnAL7SHZ4q34ea5wXv7srdmlRfVkmBjni3E5qbAoEtgjl+6QPU5eeibsKJhfcm5k94viL+5UPu4DOwc3I+jLEIHqle6MliSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnE39xUZrPfDkklWamkjids0YN1Zvuf20sqU3WH0JY0=;
 b=RiGTyZmiFuv2a9+a/xH9pWrffY2zo17fU9Jy3znopLYS8ml6TtJ7QKBDlBK6MpX/YxgqOo4iJO/h5XG1gGo8Kxc5Bc0xvH8GE5Mr6wsIxaL82X3Mz4eeI4nCVrRlvWd8cXNtw+3sX91Xs+/Ms2k+QI3o65j0Xth1va/X5fzOg7c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	jbeulich@suse.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Fix sibling mask setup to only include online CPUs
Date: Mon,  9 Nov 2026 14:45:15 +0900
Message-ID: <20261109054515.1690-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB4498:EE_
X-MS-Office365-Filtering-Correlation-Id: 713c5648-a80c-460c-4a73-08df3e24a569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|23010399003|1800799024|260925021311599003|260925022911599003|260925021911599003|56012099006|261021135927099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O9y8YHv8pOT9Si83uNFvgRm3sHbsG4GkpIw1V6EHsjqPQq4X3gh08wYVNyOTKtH8wJ7hW0xXtnRE2TwUfuk5D0skZQhYK8lfGb4sScixi7lqeY+pZkc+InXwOhPeKpsqHJcmjjceLPssGhuwXkBRueCgXt0r7pzpWKno7gNNSjYdHMm5EtPm+6RBjm3ZRBZ48FiQSBEbUXtekxvuMiFj+B/crvdmFb1mQyXpUNfozoP1NazOOUffOu5vqv0kYrIqj2hVlOevr8lIOe/dHVSEJES/MA025FSBR3HEg67q4CXLktqrLLMIKcGx1Q+Eq0QLFpqgH8VUDYR1hKbZ6mkLm101dCSsoaft9N721rSpLsInIwu3XcqEAniMh6LCSV6v4cRuCPBSRoBEAkgUaclTGKtZOiOGEF6wzdVGP0Yb2nBjKnEp0mhV+s9hoOXzsTFduEiahDB54HGqPWs1N/u4PTtQ2/DmQHWiqwqkW9oW3EA2JCapooxGFWtmnLsP2JZEZRXa6HcouWMkVPPHZfzcg5AgKydhqpWjUxDm9yk8BQUUyAxdqAPyx58z/A5LwftQsRQZ3PLLt7T8hPNeDuPjq2bgBtuR6ydSjLAe8A70QV6v9hGLIOflQshOPPBwBjBK9U0Y0HEUWQQBdSJBERgy2gr+ZCE8QvQFpCFmbAW/l+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(23010399003)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261021135927099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mPZ58SjkJt/2Tz2AFePlAz444Qir9RlxJYn5ubyEvVnGTyAtMsStHw03youN?=
 =?us-ascii?Q?z91/VDO/JFBgyJxTMiruFaGbCjuUeUNeiRhLnfpmCbG1VfpE66OStiPItEpb?=
 =?us-ascii?Q?2kcN7Pgsb6AuVXZudImB+yujKW8O4kzfhe5dtRAxQo4tcDupp14Bpw6l5h1r?=
 =?us-ascii?Q?vnTjU5gbJ6lrH0jrv1x2nwPUpDH8rNvifkRYQTv+hSUhf3cNJKg+aBjCxwvG?=
 =?us-ascii?Q?revDf1R9FsqDQ1cy9TjfHmVGkSvZOcfjK1D/hPXJFYTrXXxVGsyQ97LbMIbJ?=
 =?us-ascii?Q?t7VY6b4YQpAZD/G9fVcTAiTMx5d0DuuOrLrAStOGnB6dVSvOXuU6l+oxbsYZ?=
 =?us-ascii?Q?xVlz4xLah2aYfs0WvNlCnMNAdZnfEtb9vHyv2ozLTIqHsRl2j0706Bn+PXvR?=
 =?us-ascii?Q?H0k897EbLOi46ImyAybSA8/5GoEm2GTAB4sbEIyZY1VUOdbGgkRPGkNs9aU+?=
 =?us-ascii?Q?AuUeLt7cPH0XkCHM4GJ2qMZNXkZhjE4DP27Fm4/EAqHXfwpUc0QqxCF2zcD9?=
 =?us-ascii?Q?CZnHaxsj30KW0wKI0GPQvFkzdXRslBQ9Pxe315fxeFEsA+uGe9a1SZHrOoW6?=
 =?us-ascii?Q?Cej/cqFqtterMOEUmNQUtjCUJgCLq/vSsAt6jIVxMjWZsFr/u59b7YcSyfOU?=
 =?us-ascii?Q?M64yfECKNrkuPEZ7lpy057NWDCBdJFOPBdiodjvAhRV2P+UR3Dnr6KcU4whv?=
 =?us-ascii?Q?UkSYEuumTYUpP/ZCHhUY4+476aoWHBDeX20StkbVlt++Q46pRbMT0JwkIswd?=
 =?us-ascii?Q?YTZ6IGtU+fgICqw3d6l9Zce17le60PDIevrtQiQ7w933gZCRjU28nED9UkzK?=
 =?us-ascii?Q?mOx7CYfV9/NhnP98/ZxOdCGdHOg7/327NadhJdMsU+UMIwTUMC7vvbaPSt3R?=
 =?us-ascii?Q?NXOTtw6/esgnKnPsavzZj7e5oLrJU9qMApqSXSwmrKngvYJT826EsetDtjES?=
 =?us-ascii?Q?z0jD+SecqtsBRxRlkXxMM2D7QLwts2o9FvUw8nAw9DJyH1kSCGhnjRrINmhL?=
 =?us-ascii?Q?B5VGmUy/GmAdTkTZIaxixwhAAWzersVi3oAN64YvOM3XeTqipsMDo805CE+J?=
 =?us-ascii?Q?pvJNk0A3yateiL9i4s6nzD+oGgCJ+ZWiCKWejOnHLESkyfdpLQ324CiDMvqO?=
 =?us-ascii?Q?Ih27g74vgQy5sWzVi/jj4ShAIPuAncTb2fDMDceHlzefbYR1xkg/inWpXtFD?=
 =?us-ascii?Q?FYAVGlMbCH9Ng0Bmz9PKTwBW9jk/FbN6Da1svVq6pzMl1R+RS3FRmZWT1Jeq?=
 =?us-ascii?Q?IGmUG5KSqmvB4X1Z37e6En/nHypkzVek3wO1ia9l1XmSc+sZnVHCpI4bAiYd?=
 =?us-ascii?Q?WeYwU98Lm/zD8wmvhMH+NQgKMPnr+GHVnhCqiADRgm2nPe8u20POqzZYQbMs?=
 =?us-ascii?Q?+SP1P32m+0XJb/0vjumaw4oVDvDe7DcsMcACgvaJwnsEXoLVUbw+TuMgnCpb?=
 =?us-ascii?Q?FJqaf+48C+22rx4vNallavF5pTREAExnwDJZUFmRetHu5b7AbqmLbADw6tUS?=
 =?us-ascii?Q?R4KA1LOSE03AQNp3UYL7ftEpr4Q9cx51mzP2wlhiLiHnfhmOFlKYJ46vefZs?=
 =?us-ascii?Q?XDX3O+IV97ZOy+KO9Zt7k1Zna+LVAcAmbGHMRb1x3Euvu46PX5WXTLXo8iP4?=
 =?us-ascii?Q?BvS2eegankTGMhd1GX2326xQhjmVO1noPEHFMMTnPLz6Jaq7okMBR8dwksYw?=
 =?us-ascii?Q?SfAKPiC/fPszG8IwCq5TO9JxWHxenQFm4B1gbn81obZ1tBqC82AtKbiOPzq6?=
 =?us-ascii?Q?fUwdkmIS3Y4Y51QiSedf46EIqhGu7oM9S9qCkRxBoAlW/rjzZzdUT0eOw0B6?=
X-MS-Exchange-AntiSpam-MessageData-1: WYDlmoPwmqSksg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 713c5648-a80c-460c-4a73-08df3e24a569
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:45:22.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP5NtzVZAbT2zycTdyGkON9sZ9KHKMMXZnk0ODCmAHyOYdViVPQ1tF0Uwtad+hpH3p1otNwvEmvoea9GjJ6BVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4498
X-purgate-ID: tlsNG-33051d/1794203129-6C6DE4E9-F7CB0548/0/0
X-purgate-type: clean
X-purgate-size: 2268
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Populate the CPU sibling map only with CPUs that are brought
online. Currently, all CPUs in cpu_possible_map are added,
which leaves CPUs that failed to boot in the sibling masks and
may lead the scheduler to make incorrect decisions.

Changes in v2:
- Rename init_cpu_sibling_map() to set_cpu_sibling_map() to align
  with x86.
- Use BUG_ON() in set_cpu_sibling_map() to verify that per-cpu
  cpu_sibling_mask and cpu_core_mask are allocated.

Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/smpboot.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8c9072f3c1..9237576440 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,15 +91,27 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+    return 0;
+}
+
+static void set_cpu_sibling_map(int cpu)
+{
+    unsigned int sibling;
+
+    BUG_ON (!per_cpu(cpu_sibling_mask, cpu));
+    BUG_ON (!per_cpu(cpu_core_mask, cpu));
+
     /*
      * Currently we assume there is no multithread and NUMA, so
      * a CPU is a sibling with itself, and the all possible CPUs
      * are supposed to belong to the same socket (NUMA node).
      */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
-    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_online_map);
+    cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
 
-    return 0;
+    for_each_online_cpu(sibling)
+        cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, sibling));
 }
 
 static void remove_cpu_sibling_map(int cpu)
@@ -314,6 +326,7 @@ smp_prepare_cpus(void)
     if ( rc )
         panic("Unable to allocate CPU sibling/core maps\n");
 
+    set_cpu_sibling_map(0);
 }
 
 /* Boot the current CPU */
@@ -385,6 +398,8 @@ void asmlinkage noreturn start_secondary(void)
 
     set_current(idle_vcpu[cpuid]);
 
+    set_cpu_sibling_map(cpuid);
+
     /* Run local notifiers */
     notify_cpu_starting(cpuid);
     /*
-- 
2.43.0


