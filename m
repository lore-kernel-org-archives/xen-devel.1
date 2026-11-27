Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A78606A324
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=mzWGHGGZ
Received: from list by lists.xenproject.org with outflank-mailman.1504515.1699788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWom1-0001GF-RQ; Fri, 27 Nov 2026 05:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504515.1699788; Fri, 27 Nov 2026 05:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWom1-0001G8-Ok; Fri, 27 Nov 2026 05:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1504515;
 Fri, 27 Nov 2026 05:45:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xWolz-0001Ew-4M
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 05:45:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWoly-0000kf-1H
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 06:45:26 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b0918d2-8faa-0a2a0a5109dd-0a2a4507ad76-48
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 06:45:24 +0100
Received: from [52.101.125.91]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6b0918f1-b4ea-0a2a45070019-34657d5bfee0-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 06:45:23 +0100
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB974424.JPNP286.PROD.OUTLOOK.COM (2603:1096:403:402::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 05:45:18 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 05:45:18 +0000
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
 b=b2dT0mUCGA5pjlmOY7RFa/aqqfF5KAnhl+yH6uvnXDKJnJG3tWEm8Pnod4zOhAQAn46elGVM7aVzvfD0pfhtCsDQwWfr+sm6LcAp9fQIDHkjhJkusmuegc5cTMEkC2u4Gr1T6tYFopFd3NEqG3BLkDMwjVlz3IcBu7w54Pi48JtDxgdOC66x2K2VXymyO9HoA0/WDpstMnON4DDe/wUWRKjlmTOor1JsfXQooBIcfPteR+DXM26bmNOLSvNubjfXaY3ttsRFllmQ57ZhdDk+Kp2Pw4JeOU1ucQGzDwkBbouCa5rob0kQgkifz3THoZCymNPlCrov7pbpFxG6l7WEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3hEr2P3d/ANgcTLWGUYZ6u0HlpuEh537h7YkvXwAxk=;
 b=sntzJbxB8jMmoWpzKzvtgsUBqIwMjvIQwWZUX0I+BJQpcAZ9u1D9PSKi1hrAjQC9iVKuhT3nhmy9K5dfAT1BGQPHWdtnRtAdIEa/jJJJqpY9t+Tt2R5CDHprg+Bi/mAKFCRpp6NuYcnkl9TZo6CBAXWd1/hJ4XjNu17/EIeuYCTRbFFd1YTpLz4TLBcORR0n1a77URmwLs39CSKEVm0W1O81p8Ui+ivN5BMH5pCY3lM6rQAdjngzGijeS3LfHtRqRGbWbvtj3hTtkuf9CfJ+6scbCfd4PW4KTfnT9moYi7Ti84Zmvx1JTPZVjN+2i9fIabgCOpZJPBbnF2ggn/VHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3hEr2P3d/ANgcTLWGUYZ6u0HlpuEh537h7YkvXwAxk=;
 b=mzWGHGGZiGUOXxRGa83wGi4cuvaqZaMQL9hc4MCg6fdbohaWZXU3gS8E1v5gd1DErQ4mOqj4rOASKryApgojFFQAiXGRSS6DCGtaj7l1eUuQzLYs9MtA1JxUI3UH+I42iAA3OUpSlI5WhaHDkY/16taVzu1hDeRdkby3WVpFdTU=
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
Subject: [PATCH v4] xen/arm: Fix sibling mask setup to only include online CPUs
Date: Fri, 27 Nov 2026 14:45:05 +0900
Message-ID: <20261127054505.27222-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:370::11) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY7P286MB974424:EE_
X-MS-Office365-Filtering-Correlation-Id: 882e4dd4-ea83-467c-b3f6-08df4c499e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|261009223027099003|18002099003|3023799007|10067099003|56012099006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021135927099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	V0n+/95UlBOFEOpmCQJ5LywapEEH2PINtSbJwTTVmdNJCKoU3/SvlTB2UYb818fsgVzgHY7NbczhZtkQKRRo3yKQSwZQfA2+uqY0ECcxqXl8Howctl2OKzM/xUo4mZEeYa0Inpp36LkSTRBC5Gq+bBn9gfORQaueJv10axzbVRo9Lq+7TbVggAIGjMaj1u153WnFy+HV9Zgr7+hMzeGXiDmaQB/zvdRQoNwhOR76Z3RnzaVCXOypfC8+JMygI6wI8Gz/ATqBJ6GKFRCqVspl8EaV/POHrOERpyzin4/vBC3Y/MitKvERgJWz9VpKwyYx9VzokgjsyLxRnFhQ2k5HTOJ1iZo2sHrlFnLzSPs3VFyhmEPDAI7ksH4xtzSwGYBQuL/+XtHoqmLlR5g3LfMyGGhFGNCWuSNV8kxCQfptgngSp0vUt+aPfN9MJQ6qsBRbURNhTTaFDk2FIr2P4JDXJa3skAwCwexQEEzoRXCd2I7KO3IIYePCbqbK7W1kxVDdoQd1GcrR3nz2Mr/uvsyJy9FTRJuFFKYSIVx9DQaIExC2s9e145CBvZjJhnOt+tBUsGhtYXJkDMLZ9MIp5IuSlh/whRHkNi8JLPwYK8TzuYsxhwRVQ74O/nvzBWLsGsssGwmNwJx6tFSHtdBmDg9rbAG2GYNqHN471BBrikvERT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KzDsouXKCwDjoOlO57DJetPky2/u64rJdua7e+6bkm4ff3CJCC8mSJ4YnUzb?=
 =?us-ascii?Q?F2G7kxk9+c5cjSr6Ry11DSZ2H1GZQ1NgIqCaAm86OibSYPteO94wJbmXTZ3L?=
 =?us-ascii?Q?3DkiIb1VMf2B5RbMc+gQHP7xWq/2z7z2VuDcUwUNw2hpnXxosdv2z7Olj+LR?=
 =?us-ascii?Q?Fc3yUwxlCUXd2suzza+R0D8QJMXrTNiuNDffqaTlngpLVen4wCTJsc6ELnv4?=
 =?us-ascii?Q?4SXsD/SX0Rlk6/XkjrszLPTDhUaoh4zYZrYe8iwy6WcHzALL9Xq5SQkYEBou?=
 =?us-ascii?Q?0nJAXBCEt9zSx+6UWpbTf1Uh/vKWayFQnLIXuwnREoCe3Dzz7UMSmKg88H4e?=
 =?us-ascii?Q?z0ObUULqNLUse/CyEUPJ1h2y48hksp5/AKkR+qDohv2xrxDX3lbnspR/m9fM?=
 =?us-ascii?Q?LZsEedvhvttCNSGVvldkFoc9qtIjdma1OfQJ/OGfY08h1iB0km3X3koDzgWc?=
 =?us-ascii?Q?TLuRaQDBjA6h22TzYOcQOehjx95LmOUz72aOm6iNL/2ifYDYojEFqa8QNu/c?=
 =?us-ascii?Q?MxhGgh8qCbN3X+ojIIDcus3m7TXkiuYJSbEsMtWbrlmDEpyXuvlXnjpjhUFN?=
 =?us-ascii?Q?t+Wd2zBsDa7XGgmiVIzIs063KpCKriPIbODVw87/1bFLN2oM/nb/jinF+zpt?=
 =?us-ascii?Q?wsSXgnYVy8w+Bv3YsXY2WMT45KbqCZR2hSTenhs6br5ufXXG2nken77Q3WQZ?=
 =?us-ascii?Q?vk55Phs850gSHnUV0j6W8GSV51FRMOlGFZ4Spi2HBE4DrOXS5CcanY27TAi3?=
 =?us-ascii?Q?Img7Ehmc8d8zVtP1R1004UXo13C078AzvMWgZ+LxaczfaXrM01pn5EVxnxe4?=
 =?us-ascii?Q?kdvmx3f7BYeR2u98K6qnQWlSYPfX+mt/c2lj6ZFSYeQc0oGRnpFG15Zkqi4t?=
 =?us-ascii?Q?5SgYX35MTEZBc2MkK9vQD1qL1OzAtMDkTzeLLoUV4fDNn0B9fLqzJqRymFn1?=
 =?us-ascii?Q?qVKcsvjKTDMHk0F7EAMar0dwvLRbD7yAax8VXGpASIm38oZf+5gTFAC92SK7?=
 =?us-ascii?Q?OB+AUrLIpY/MZsDuJwTQElz2rNigP6ee7ktcsLUQoE7QshbKkVvOLamS8njc?=
 =?us-ascii?Q?iVYH8OLDj8RstZWBay1Nn803pDCfDbNda0YGqFXGOa+rUmX3xKs2z5CUARTd?=
 =?us-ascii?Q?c5TCAajwn7akSVItXEFyyfZaGiGhR/YMZ7SQJReeiq8bOl80xr91xAgJo6+H?=
 =?us-ascii?Q?pbFF88cOwNY7ivRvdQ/LZLQ2R6GmgfkaSy/GpFAsLY2lE7d+/iVENBeaCM2e?=
 =?us-ascii?Q?oAWK53slpxq8OrbsGwf5uGDE2qOoiAx8uyGVneCKprOd6ezIqarbeVVs+EMC?=
 =?us-ascii?Q?T7qGikwA0ZtGSjGhjWpTiPlaRobfkpn3lZgSb7YddKMbSj4+D/pEsv1a23uP?=
 =?us-ascii?Q?DrNn8xht+ZJZ16rkh/I+m/f7sMJQ6UtOp7oPeZLzk2S2aEZdgEn+OJQuWqmI?=
 =?us-ascii?Q?xT0AY4ayyjv17S3LiAmLEZs3Kzey1F7CqJeaL8D93WqB79ny6Fw+QI4Ipg8D?=
 =?us-ascii?Q?ZEkRuNvArTk8cOU7vbVBugD85DUU6CV3aq0m8z5tSmU/y+5siEpkHFOixq9D?=
 =?us-ascii?Q?JGQI/UOkazRtGprpqn5TILtBdd9sfOpgqqMPgyQK3BNlYlVjlXj7rc5TmUtC?=
 =?us-ascii?Q?SipR5qn8DypwBAv+P+RWwawKwxJUPrBPk9bJLUmbCeLiJHG1bCV7t6rIwOOz?=
 =?us-ascii?Q?UX8mpliKmVyEKvWDpwaii4wZPVYmwaHguw849QktY63XvNJ3Dwo2EjDRRKHE?=
 =?us-ascii?Q?Of1oKuX5CPjOq7vJz6s/xCuPkGiauAKiCpsbT9oJqKkAVy6zxbBT4aqYGEPa?=
X-MS-Exchange-AntiSpam-MessageData-1: lKQ1PE/JMybjrQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 882e4dd4-ea83-467c-b3f6-08df4c499e74
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:45:18.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGKV0RFR5bFQj8o7pjJono6uViUChmksNoWD3QUwssi0ayL4L66MeTzL19Om8x6vLHtObOkQc2LAOy9/9kmC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB974424
X-purgate-ID: tlsNG-ef75cf/1795758324-35CC7AE4-DDDEBFFE/0/0
X-purgate-type: clean
X-purgate-size: 3619
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Populate the CPU sibling masks only with CPUs that are brought
up, and remove a CPU from the masks when it goes down.
Currently, all CPUs in cpu_possible_map are added to the masks
at boot time, which leaves CPUs that failed to boot in the sibling
masks and may lead the scheduler to make incorrect decisions.

Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
- Mention removing the CPU from sibling masks on CPU down in the commit message.
- Remove the redundant loop in remove_siblinginfo().
- Avoid including changes unrelated to this commit.

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

 xen/arch/arm/smpboot.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8c9072f3c1..2fc6c36ca1 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,15 +91,38 @@ static int setup_cpu_sibling_map(int cpu)
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
+}
+
+static void remove_siblinginfo(unsigned int cpu)
+{
+    unsigned int sibling;
+
+    for_each_cpu(sibling, per_cpu(cpu_core_mask, cpu))
+        cpumask_clear_cpu(cpu, per_cpu(cpu_core_mask, sibling));
+
+    cpumask_clear(per_cpu(cpu_sibling_mask, cpu));
+    cpumask_clear(per_cpu(cpu_core_mask, cpu));
 }
 
 static void remove_cpu_sibling_map(int cpu)
@@ -314,6 +337,7 @@ smp_prepare_cpus(void)
     if ( rc )
         panic("Unable to allocate CPU sibling/core maps\n");
 
+    set_cpu_sibling_map(0);
 }
 
 /* Boot the current CPU */
@@ -385,6 +409,8 @@ void asmlinkage noreturn start_secondary(void)
 
     set_current(idle_vcpu[cpuid]);
 
+    set_cpu_sibling_map(cpuid);
+
     /* Run local notifiers */
     notify_cpu_starting(cpuid);
     /*
@@ -431,6 +457,8 @@ void __cpu_disable(void)
     mdelay(1);
     local_irq_disable();
 
+    remove_siblinginfo(cpu);
+
     /* It's now safe to remove this processor from the online map */
     cpumask_clear_cpu(cpu, &cpu_online_map);
 
-- 
2.43.0


