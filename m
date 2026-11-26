Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434C606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 04:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=RF5uhB+M
Received: from list by lists.xenproject.org with outflank-mailman.1503042.1698925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWRLf-0005Lv-TR; Thu, 26 Nov 2026 04:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503042.1698925; Thu, 26 Nov 2026 04:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWRLf-0005Lo-Q2; Thu, 26 Nov 2026 04:44:43 +0000
Received: by outflank-mailman (input) for mailman id 1503042;
 Thu, 26 Nov 2026 04:44:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xWRLe-0005Le-Gx
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 04:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWRLd-006M49-Pg
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 05:44:41 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b07b914-2eae-0a2a0a5409dd-0a2a45039378-28
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:44:40 +0100
Received: from [52.101.228.90]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b07b936-fae8-0a2a45030019-3465e45a45d0-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:44:40 +0100
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYRP286MB5265.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 04:44:35 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 04:44:35 +0000
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
 b=LS5H2RVudEJ5Ga2Q3sIaZF4VFbAHd1u1ENiic6XezMgm6BXNXNloosZUQDU+lqHvfL5s4ODrhu7F+j5TOyzxoHHauxk4hWpmmAXnq9liwrkeGwWsr0CtU02g4C8IDg+A12mSlTQe/DWwCimn2JgMfaHRlrTRuWHmdRU9bXbIuq3nkULvzB2wnIDHJR62lSawBVhyKeZey75CUbDh1dpUtAxIukubN2G55XxxXJ4sv71hPx1WOBLC11l1Y+AN4xSM7lq1E6Lbs6L14Dk5tBJAarDRBlDaFkWNpGQ2bpMlnhkyM2Y4G5gGrJIGE9ilYG54dJOTDyPBDE+1abgk6uNS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EY/xPu9BHTFirjCN8BQ/7xXpDdD575oLiFsMJTyZdw=;
 b=SqB9JcxKV8lpr5NZbX6q3a1AQQLj8/eozgmtokBJ0UZS10zhbqOJEezlt9NRm0lKEg6M+hSSBxUcixtZ5nI/t+f6f/sOcA/gIowUCKBB8JGACycccU7gxDgtMrf4t3IZovqRPoc5AwbPBX7KZr/fu+Vrsri2MSJcWpGXxf4Nt4AHd1B+DzK6WoHl0kZLb7dyTTbIxg7t0znonR8Z8vrB5a6CxsjOr0jS+CzbcL2r9UKWF25yrUx0/DZ98IM1B1ASI4vj5HuN0QzbX1RCWoPbdiLjNY85J2b3dwFiQIZBRT0Rc/jRvbJ0Fe2ZFO2GZIWmx0/GrQiadApPD4CJT57EdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EY/xPu9BHTFirjCN8BQ/7xXpDdD575oLiFsMJTyZdw=;
 b=RF5uhB+MHmUdYcvEh5QuH41VF++1bJzn2fQ7XNc4yJz9hZAx2FZljuPp42hJ1iBdFg0c8dvhowITO0X3pBUjsS5pg7aZxdN6hFXye8g07Yp6u+JLea9Bh3V15He8aBa7x0AkU2k67HNrRZZvLW5tKftovFW9YeUoZ3whUzVTL1o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	jbeulich@suse.com,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3] xen/arm: Fix sibling mask setup to only include online CPUs
Date: Thu, 26 Nov 2026 13:43:40 +0900
Message-ID: <20261126044340.14779-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYRP286MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: eb35d884-6899-4442-2ea1-08df4b77f884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261021135927099003|261021123027099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VqOEgVfWae2YCoSTGCFasllOvndMBIDl6Gu+pUvcQI/BlkL7tEV6G9qYv8/ZGlJ5+ri6mUQ3uxDzgHf871DTJHmYRJzN5fZRlVGB85bVdOm3FCTOnpqKcpnBJmSCLqCD5NN1G2TefmRUMWWSqHYwXX3pWM/5DGJeEbayU7MmvAj8i9RCnYWtCyOGMSX5RbyA2JpUp7WE/bkrQFkbI0sb+JELQDWmcFrvKyWOTO9f9o5o5wuKynJBSCIRnIazqB3nNcgJ8O7nJV7USBZ36EYK1Hm3C0tYLcZm9657p+ceX3+Bq9mdvf7eSonQ8GjVm/0mQgR4NAzlXmp1mWiUxJHhqj/NnyE2ynSmCcsS6m0JbhDdNVvj91yuTwW0pVaBwGpKtbG3wNAjM2wOGDufQtaprQlD/MyMHqR77zXmDllmfWluTjoS5/zgKzWz/bASQKnplrNRdSZCkrc59Y8tZeJFJcwLx95oLZv+xlRQsRrLpfjDTPuXoIR0ceAEA5NOOTVxwalB49N6hfITfBu7dSB4TgiJKTPJg7gAUIJ9rIMaYZfY0DTBFvocBIQEsY43F9X9OlVzflVBfdWVUPkUoaOct4SzX72xNPmXI4rV19RYrI4Cr4E4ylxLl8Aae3dF6AEe+o0eOmTbdfHO8wPXze7WelP73VV5sOwC0ZF2uLVHGU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QqXIOJ8NmT/hCp1arbb0FXDFHhfrJVW4TrgWOV8xdxt6M1SsOjlpdaBky3o+?=
 =?us-ascii?Q?jxfMwJZpgbREaBzqD8fU4jxITSjrEsDP990nlAfPORwfnrKm2PnUWDEPqCRP?=
 =?us-ascii?Q?nidlxI3MZ9NnefXWmv4mL3OCWKb14G8b+xki0DMBCKjkjZvTX3JfsTucRAWd?=
 =?us-ascii?Q?8YWEYTc9Ci7Rwo6tNRAvxxZcdyoshj8Dk2PYozr3qlOgOLf0PhFsU5XQbqWQ?=
 =?us-ascii?Q?nQFBt34XRpcd3HaIljIG7hxWfsuE9N4UJGvqa4Zuc6NDgoWUQRfDav9i8P8n?=
 =?us-ascii?Q?dTv+8cgCb5jS7MI8bMQ2QNg97C9AEQdBLgMuDKy21rtp2ndGTgj85nx17NUN?=
 =?us-ascii?Q?joM0mKFKHKzLSK83lJPEeF8IutRlIF8CDlrB9hb6/21eNWMyWLrecfX0IZF3?=
 =?us-ascii?Q?2EDaYRLODwZ8RlOigm7i3lQgmDVxZrx60Dv+G4stA8JGmHO5N0JDmcCUzksS?=
 =?us-ascii?Q?nZ/z118ShyytcsXY7hBbkGLvbS4Ow5347mpMc+8KVMK1Q0nP5lqoTs5ZZmHx?=
 =?us-ascii?Q?U7SQhVmVkRt4I/vdw++qaGpPkqDz20QPwL7dlijphgopUE1oOHLia/De3zm1?=
 =?us-ascii?Q?xokLj+VslngmjRpc+n4QxiZlCYaLsewDO7utfYf0r99H0lHN3sWFaociL0m7?=
 =?us-ascii?Q?cwQce9QWjIbuT4HI4kycVwnZMOaSv+bSXZt3zPQ2gkIlsDOMVpwByIn93wNe?=
 =?us-ascii?Q?gapohT+SKhRzzBpm31DGOxKq4CBh69LrE3LqwndeJ2rFKa5kBmnCMrWFqDeR?=
 =?us-ascii?Q?dNWBypg7hPIosCx/CCo29RBeTxxD0O88sbxPp55bPIlMI1zo1yBRLvAa1DWZ?=
 =?us-ascii?Q?fr2A1QyMWyEuOyRRq7xaULTrf+jLJIerrs4OH6nShicoYauNxGsnEwP9WrZb?=
 =?us-ascii?Q?yY9p4unB3syYGE8zyI35jUGL7Rlo3gV3aW+i6DFZu08ABNwtWTsrLlHdOWmM?=
 =?us-ascii?Q?W2MQgUO2KQY5J1OfI/zWQIGD4U7ijqnmceRhIGin/XPGe0ZrFhnunyLhwPJh?=
 =?us-ascii?Q?q80lVXJbxOoe6oRylMXWM2E+1hfpb21HpfWKwcXShf71Nn3ZGWkv7y7JCZZN?=
 =?us-ascii?Q?LC/vW4nDZG7o+Mun4r7VsjtCwQnlmgikYHsSlX7kV/sDAkQJaVxoBx8p8S5z?=
 =?us-ascii?Q?mk0O2gRdl8+rmyYHkXi/li3YfwZw2feQ5Fky5HX2CnQnLJocVTHndcwRr67z?=
 =?us-ascii?Q?oKdEE3AYjayDHSBhbdstVnFzcsyGUiRc54Avzq0i0lmYAT58fDd2+/EPp2A6?=
 =?us-ascii?Q?M9fn/Zk66kWC6l0uyDlnTBSF91Kg4ijtI4yp9ns9PEoPFiV/NZW7wgHzy/PW?=
 =?us-ascii?Q?guy+4sXh0ZsNhbVWUlIDMduZZtjgSIXDXyo7i/xmom6wGiJfWbAGqR3Rp1rw?=
 =?us-ascii?Q?OzzUUbF/30r+fWNAQ4ljwisdEkvjoQhKrKbYnZNnSGUfpheW0bBU4fl1S7b5?=
 =?us-ascii?Q?tohGo3yCrcid9Jwe2YVaQNcvsYduWLznU/wCmBqZ8VKhowAlV/1w5NaSIog3?=
 =?us-ascii?Q?3NYBrTger0YOO+l5vhOG3PWdWRHXWik2k5Z0JvNGnnHfcjBPzt26QY9/KYev?=
 =?us-ascii?Q?z/HOCNkWXfaFLtQazUXme5bVb/w7BFef4NwYs5H99tNEETN5L4Ts5sYQZXMu?=
 =?us-ascii?Q?ZTCP2NxCPmKYRYikdhUeoXXR0TUIHZ8h5Zcg7nv8Phj8kgeULyV8ijY4Y0Ql?=
 =?us-ascii?Q?lxjXTX6v/LW3sVXTnsqVJEMsFPU//rmQG1epOBrHODZwvbMLBz36+z2DkmHV?=
 =?us-ascii?Q?axP0mkydEW2V9URPy2xpDjPkt2vEblzaYPicqZZiS7NBwm6achcfnwkDfgVV?=
X-MS-Exchange-AntiSpam-MessageData-1: gZomEPZ1V5Rxlg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eb35d884-6899-4442-2ea1-08df4b77f884
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 04:44:35.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bYV8UMIJNeM9K5xtcnzqXBLwz9sBZy6uq2bhH15fTK+ZWGkdj2FJY12VDUhXPY7XVrjjIOLZkGOAaPEof/dzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5265
X-purgate-ID: tlsNG-33051d/1795668280-6F2C84E9-0FEBE5BA/0/0
X-purgate-type: clean
X-purgate-size: 3592
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

Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v3:
- Remove the CPU from sibling maps when it goes down, introducing
  remove_siblinginfo() to match x86 Xen.
- Change the cpu parameter type of set_cpu_sibling_map() to
  'unsigned int' to align with x86 Xen. Also use 'unsigned int'
  for the cpu parameters of remove_siblinginfo() and
  remove_cpu_sibling_map().
- Minor code cleanups.

Changes in v2:
- Rename init_cpu_sibling_map() to set_cpu_sibling_map() to align
  with x86.
- Use BUG_ON() in set_cpu_sibling_map() to verify that per-cpu
  cpu_sibling_mask and cpu_core_mask are allocated.

 xen/arch/arm/smpboot.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8c9072f3c1..c4c9f535e3 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,18 +91,44 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+    return 0;
+}
+
+static void set_cpu_sibling_map(unsigned int cpu)
+{
+    unsigned int sibling;
+
+    BUG_ON(!per_cpu(cpu_sibling_mask, cpu));
+    BUG_ON(!per_cpu(cpu_core_mask, cpu));
+
     /*
      * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
+     * a CPU is a sibling with itself, and the all online CPUs
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
 
-static void remove_cpu_sibling_map(int cpu)
+static void remove_siblinginfo(unsigned int cpu)
+{
+    unsigned int sibling;
+
+    for_each_cpu(sibling, per_cpu(cpu_core_mask, cpu))
+        cpumask_clear_cpu(cpu, per_cpu(cpu_core_mask, sibling));
+
+    for_each_cpu(sibling, per_cpu(cpu_sibling_mask, cpu))
+        cpumask_clear_cpu(cpu, per_cpu(cpu_sibling_mask, sibling));
+
+    cpumask_clear(per_cpu(cpu_sibling_mask, cpu));
+    cpumask_clear(per_cpu(cpu_core_mask, cpu));
+}
+
+static void remove_cpu_sibling_map(unsigned int cpu)
 {
     free_cpumask_var(per_cpu(cpu_sibling_mask, cpu));
     free_cpumask_var(per_cpu(cpu_core_mask, cpu));
@@ -314,6 +340,7 @@ smp_prepare_cpus(void)
     if ( rc )
         panic("Unable to allocate CPU sibling/core maps\n");
 
+    set_cpu_sibling_map(0);
 }
 
 /* Boot the current CPU */
@@ -385,6 +412,8 @@ void asmlinkage noreturn start_secondary(void)
 
     set_current(idle_vcpu[cpuid]);
 
+    set_cpu_sibling_map(cpuid);
+
     /* Run local notifiers */
     notify_cpu_starting(cpuid);
     /*
@@ -431,6 +460,8 @@ void __cpu_disable(void)
     mdelay(1);
     local_irq_disable();
 
+    remove_siblinginfo(cpu);
+
     /* It's now safe to remove this processor from the online map */
     cpumask_clear_cpu(cpu, &cpu_online_map);
 
-- 
2.43.0


