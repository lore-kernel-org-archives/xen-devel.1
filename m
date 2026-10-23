Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65581606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=wdJAOQYz
Received: from list by lists.xenproject.org with outflank-mailman.1459153.1671220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKDAK-0007jT-8d; Fri, 23 Oct 2026 11:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459153.1671220; Fri, 23 Oct 2026 11:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKDAK-0007jM-5s; Fri, 23 Oct 2026 11:10:28 +0000
Received: by outflank-mailman (input) for mailman id 1459153;
 Fri, 23 Oct 2026 11:10:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xKDAI-0007jG-Dv
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 11:10:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKDAH-00854m-JS
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:10:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6adb4099-bab6-0a2a0a5309dd-0a2a4502a36e-18
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 13:10:24 +0200
Received: from [52.101.228.116]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6adb409d-6ca4-0a2a45020019-3465e4747673-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 13:10:23 +0200
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:363::12)
 by TY6P286MB7599.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:10:19 +0000
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f]) by TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 11:10:19 +0000
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
 b=Ouy8gZoMoYaVI+w2+QmZJoNjN+2LC7/EaSo/cZcS/jFYTZJmU3dY2VA6O4dxXaVIxGzzHdXTrScMQ23dh2YaRdcGZpjq7V+icw1EYGrVBT99a7cS9VLNQfoexs7Ao4kJ3hX1DaoVDre5uK6J1bdzISyuiJ7ijW0vtEyoJ6y6TjQDAofhaHHq9+3QgCz5pckFrVdNdQBPewKXqsE3VMHl85May8kP1sCWmTpcKruHIJZp0OUmdYC2WqP4D37ZQ3t7qZ+gAr9HiuFaVGwFEBsnbuaPkIMoDQxzPuvTj7Rk8C8rbbWe2Qf8FSqXqIAnQoTQISQtZtK9bCRqVkUH/M2m0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2AP9Dkl/sAM7dAAKIN7a5X8tS4AK4BR1ofX0yvkCAU=;
 b=yDyylg13LnYBitBQkT9j3eE5T9OmR4k0NS55K9A6l60CFPdC7vodOSbKp+INKErUnGBjogloZku3y8Gj2wp4M8vZUkeE0oPKQkV7JZMatgZKhJszEvA2nmDvhat9LpUoms4eLvI+PQWNKHOx7IfBsOu2NZYsR0aEbQIWso8T3lnvT6dBn/uGleWsjyz4+sz4cyVou9+puFCmsOi/NSCr84lE6yiOs2HJ6fPH/xBHnYUQC9lm64mbtiV2q3dmd0P2biyI+FyikcYAupfgtmEtOUwhWRMFcTddTBKUXbBEhd0HxLC+ABzH14c385nzsq5CfgDC366pBLrKzO9G4jnlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2AP9Dkl/sAM7dAAKIN7a5X8tS4AK4BR1ofX0yvkCAU=;
 b=wdJAOQYzcEsZXCiEc5jHUkmCb/rfsIsZLUapzH7U1zRWDN6OtBXTpGGdPqL0TrMH2JLD79UTNPmmWxsuO+K/aVB4S4uibFJYmnTm6c5w5/1u0J2+ZF3MDjZl8lpX3xMg4SKcSEunkbw+jVVrneVZKTlMcd9hA6S9mKG6uiD5mZw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Fix sibling mask setup to only include online CPUs
Date: Fri, 23 Oct 2026 20:09:25 +0900
Message-ID: <20261023110925.128195-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:363::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7234:EE_|TY6P286MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: d45a9d6d-1c0a-4bbe-6339-08df30f63936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|376014|366016|56012099006|261021135927099003|261021123027099003|10067099003|261021121427099003|18002099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	naIB461FeClNNO+6dYewrmwv51WQ2ThfCpzWQfXKitxOYqsP1trcrHVRTt4qef5ywslLCx7IyqxUDzzoW9YG+6R9UH3k7zjyxKn1Av8H+4YF4r/ez+K+ANhtYVTHh3lu1EQQimWMbdPb8oNzBlyGhu6YGgiFlwGAdy0BZPhTST1IObnqxTEUfoJFVsNg6n7hHleaftkBV9unj1MDSK8qmTcsuOaESJYd3+jl6SK/9GgFdYUPuegsCIh7lQ/CvIWc66D6iWUiTZkOlcDFv8ySVE6SmXFgKzMFf92l+myNZFyTKpsix99rGVx5fo1kZNK71FZg9cuYsiyTvzN1/O7AV9P5S9zuXJXg29ohrtWA49/D1ny+xilYC5gMEUFg8A2GIp9divm1ygqnDwzXBgRZzkQY5Inx6mpiDQu2igefOLScM8emdKQi/dA/uhpjOzhmXHRHNMI4IdXKRlW//pwIV+yWz6YWd0DOOpG5HeaKK59iRQywT+A4Li4Q9wzzn6THcfHeyNrjPqyRlTZiQ03m4ga/gMLoPBr3zNIEfWVaCffvOpLQmIDZLbCpMf/GyvRz/AYrh0exl5lMhSf599HrtfzFpsokZj2LNRTSBxa+j/WhSE4X4seY/y/yfs93c0P5MSyEwfuY/7BqJk87yxNXk1iIiNCgsuNlenEIDpPEr7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(56012099006)(261021135927099003)(261021123027099003)(10067099003)(261021121427099003)(18002099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?20dXwNvZXgaj4lKGlue6sDT1yulTUHxQN3mO6IwT/d+m9CoGGpmEph1Kk7dx?=
 =?us-ascii?Q?V/mh+/zumjPlQlZbvh5nRSBtYjdDn5wh4KCsP8gPwBWB7X5NDOdvXTcGec86?=
 =?us-ascii?Q?Kqy3huVOMr1UTdOqI6JtFaPNoaR1Yj9PsFZvmxzxVjtkPMEue7I6WkpmZ55+?=
 =?us-ascii?Q?E2vMbQ073C3rCCh5GqEDPOJWMGr7yj4ms2v0Ud8cw2g9mjY6L7AGeJw6dgJ7?=
 =?us-ascii?Q?Sd5Hd/7MCdfyHKHjmRpZrSGONtAxSznmFZVRdQ0pJNdqcZwGiwn/1AifBU3Q?=
 =?us-ascii?Q?9XABSK6FJG0X81qMeVQuQ7ps8yuRr0xfMNyoulxWuXLxIWzdZDYeidLp/N4v?=
 =?us-ascii?Q?YTURZHi3NokscfLkQA4uKVbyVSYwq/CRdDRQaLZ64XxNz9VMEUS4Sxd7ZyZR?=
 =?us-ascii?Q?HfhCEGPa0skSXdbss6iDkvXoNe11XIreK9T5PvcY9Ksp6wYCceJ/9vYx2rP8?=
 =?us-ascii?Q?/whz95ml+U0dZP2Ed9HcdUNL3a1P8e+uezQeA65P09hCSQ90wTPWy248Q3Rv?=
 =?us-ascii?Q?eRGCTjNUuXlbEg0f8TNEyCCd7Y5cZPF44hYORZwQhbQs3GHPx3vyTGL+9Pra?=
 =?us-ascii?Q?ImfqEs0/bvAeqAq862cbQnMnvNJJOxIWdvb8STKms2VF58IaKt2FwCQLJ6kl?=
 =?us-ascii?Q?0TK1ki/zUzuMARP6tLq6nTemCQlVEyRe1nqrCZdkzTlOjDT4Bwo/2OTDyhG6?=
 =?us-ascii?Q?1hypI48XjwsF++bHzOVRsPRZyo19C/B4di3ZQxc3JRsTKWQt1R716utfHQ6/?=
 =?us-ascii?Q?9eom42ApFvkX/7097N37VkP/DyHQ3qls+N7g9lJ9QVHEmAzpCxxcKXmN0uIk?=
 =?us-ascii?Q?P9KaPyenUsZQBVvLlPsq8nxZJnsBI/w4zWTk0LXuNZZo26FunI1NDp6/jnkB?=
 =?us-ascii?Q?5kfSbZsiMNlunOL9QBiF5+vSl9PUa6jm2nqEMtxUCCFMGsed/TJdGGaOtZNT?=
 =?us-ascii?Q?JPN8i/6Bx3li/3tv1jERZg6cmXqxxRkG/MHUgPpJ22+2f/Du1YO/r7MCIjcg?=
 =?us-ascii?Q?BDAutsZIDb+sGPy5G6cbIuZEOb/ZKIgpXqzKcLpbwPibzSsOR/CU1fY/dhBf?=
 =?us-ascii?Q?PKIzedfkZwEQ4Lo3OAMZoLsfeFSvUciH3+v3YIq377OTKANpUHzRvkqJ4W5s?=
 =?us-ascii?Q?XFunjpf8AeZl1QpU0PNc37LVz4IIUoe/P6W/dO47UyrZbIZo34xC1vdUXrEq?=
 =?us-ascii?Q?++dF5LAy13/7HpqLbEE3qocNLO0iQQHWEJotVshvV682EM2zUAK9LQBcLNAF?=
 =?us-ascii?Q?58r35BRRPtzyrO9TutqQBjW+kkjZJ7fAyF2FCRevYRUD+1nKyB8n+dsUihtd?=
 =?us-ascii?Q?ayH1WcTISP52PvO8/ol/35YdEeQn0Ct3pphIYYo9yS+X0xosslt3hgCoUdz0?=
 =?us-ascii?Q?/I1gH+8+AyIIP0sXUTNjAbKYj+Jh48RD2br8eMCtJOgDzkugmzroILbXd+1n?=
 =?us-ascii?Q?Yvz8gayKp2MX4rFSocMY8WXpbAY7iZHkikC/ONqqs7kOgthpMuytcdBKs4wd?=
 =?us-ascii?Q?qMfIS2rSnxZFv8aEgRsOxldXlEXMq1/dm28emni89FO0i285jSfbfxNhl9/E?=
 =?us-ascii?Q?T4IS7x7B17tCQjg/UdmalRX9Y+4QOcnXLB6m0Ef4YMsaWFLQCg/h9X+V4JFD?=
 =?us-ascii?Q?rzb3TwCmMg1PuWYIQRLgSxMU0tHKgu/1G/dF9LF9+1RCpKKQaH8gXsse4JFY?=
 =?us-ascii?Q?sl/ixXC76Rx8XIzBXYZB0WmchQ7VbmLm4jEs4gStqnAAzwGMqb2/wIus56bm?=
 =?us-ascii?Q?GItD3gay22M7kwoY2pVscJl2yLj/fNb4Ydvc1Xj2kPeJB2isObqMo5bhp8an?=
X-MS-Exchange-AntiSpam-MessageData-1: K8EICsTHgnmjzw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d45a9d6d-1c0a-4bbe-6339-08df30f63936
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:10:19.0840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCUEdpRNXDFX/vxn24z1qVFVdF/Cb1+V5Cn/8tfN9AJvC8RhPpwxJABAhllIvpTulGOwZJf0eZlvbqAVxqoOaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7599
X-purgate-ID: tlsNG-720697/1792753824-F20A82AC-B92E8ADB/0/0
X-purgate-type: clean
X-purgate-size: 2011
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
 xen/arch/arm/smpboot.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8c9072f3c1..2d01896cf0 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,15 +91,24 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+    return 0;
+}
+
+static void init_cpu_sibling_map(int cpu)
+{
+    unsigned int sibling;
+
     /*
      * Currently we assume there is no multithread and NUMA, so
      * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
+     * are supposed to belong to the same socket.
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
@@ -314,6 +323,7 @@ smp_prepare_cpus(void)
     if ( rc )
         panic("Unable to allocate CPU sibling/core maps\n");
 
+    init_cpu_sibling_map(0);
 }
 
 /* Boot the current CPU */
@@ -385,6 +395,8 @@ void asmlinkage noreturn start_secondary(void)
 
     set_current(idle_vcpu[cpuid]);
 
+    init_cpu_sibling_map(cpuid);
+
     /* Run local notifiers */
     notify_cpu_starting(cpuid);
     /*
-- 
2.43.0


