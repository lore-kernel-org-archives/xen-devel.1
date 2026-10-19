Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57D1CCF2D8
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 01:58:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1453942.1667433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIcds-0001Te-W5; Mon, 19 Oct 2026 01:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1453942.1667433; Mon, 19 Oct 2026 01:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIcds-0001TX-TI; Mon, 19 Oct 2026 01:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1453942;
 Mon, 19 Oct 2026 01:58:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xIcdr-0001TD-CW
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 01:58:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIcdq-00Ex5m-Pp
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 03:58:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ad578fd-2eae-0a2a0a5409dd-0a2a4508d660-20
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 03:58:22 +0200
Received: from [40.107.74.87]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ad5793b-f659-0a2a45080019-286b4a578961-4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 03:58:21 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB5868.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 01:58:17 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 01:58:17 +0000
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
 b=BohFSxLMmIPhVKTSnVGQzMYR66+aVTb1dMrD7oZz1tJgALUO/8onj/pCl+oY7vYRmVX1p5g6LimHSs38bvpqltxgX0y1Msf4zkBM293+TUpu08Z1rD/i2l5Z4S/cANGykXa6zvVr0pzK/kY15P5x9DD5Vo2bkGUwzzpInKEieWdrF5rUJw79lwZ+sL/LhpdXYsWuoGqUJiQa2i7XAkb3G33EFQT3Dy+lZtn2audl+u6S0yvK3JNBgQksmOI4rwp4QoOagGTP1BGkdC7OKUpK63qnd1DjhURF36vGzwqs/Bzi+P4PoYPY8i9jOXX3D8pxoD8Wqo07ArHupgVSdY4iKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbLUHTCtbG54S4hRAg40hOyRncnRDqZtY0qv7P1x+pQ=;
 b=yUhKSeyCC4Mu1z1I+z83NZh8Fc7+eDa3QzuszISnp32DsN335WKaNqnG2rI4UAOPvd126V4yVynhMOM529piOxrsMoE57uvZmkiZ/SBS4Zat+aT1did2yUirfYupAvs4lYuIjYw9SL/l8XUNc5rOu8RuH6opspAdS6OjiH4h2taOG/71cxYD4lR/JS3BROyHGrgpbBhjoaARtKQIXAfaYLV/N3YMZSQ05DzpFi+Uk8gPCUOLqzg+CMUcpnKVQmbUlLSps97EEZdJT8gPRKu0fk6GCDu8jRPbiNnJQnZf6dPlInevs2nApRL4jbTtY/O6O62S0AbYWvXZKaKi4oj7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbLUHTCtbG54S4hRAg40hOyRncnRDqZtY0qv7P1x+pQ=;
 b=no5W1r/AGKbJ3ErxiIxp/swJ6fbxg/7DlBNEn+kL2MrdaXlZJW7Yprm5W32Vzc46ZFip61bmJHBeBIQ0gkxRS8Qq2AI9Oy1pdzgD+yXkJq17dUIwOzb+KPjHKvA1cLab6WqrfHOjYrMhVoNTayzyZdjQHhTFT+e610OCzZXYWEw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	jbeulich@suse.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v12 1/4] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Mon, 19 Oct 2026 10:57:46 +0900
Message-ID: <20261019015749.48492-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019015749.48492-1-taka@valinux.co.jp>
References: <20261019015749.48492-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS7PR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:604:24e::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY7P286MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: c598b847-7bba-4158-5d35-08df2d84713e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|23010399003|366016|56012099006|260925021311599003|260925021911599003|260925022911599003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	QjV2aNNbGx9ZPBpQaemSCa1Fcx7cf1siFAsaM/fZOaPOmZ/BY6iqh4qwJHVy1c0vjdzlycxSUnpGyGgGmUJK2Q6Orf0XsnzMF3YqCciWEFeIuMGegUTl5EIyVSuccCqFrotO7U+cV8Jvio3gRhwahDoxhiZQO7pOVKZ+8EREArnUrgQ3NSre3jpOHpD9N/SoYkV6MwM6c/U9RV7rt/j7YAtqFaQXG/aXvca2PLyu0yd46+xEBIGmsKyPZP48H+goH2z9WaS+T8Pk/9mvoqTqqO7lTScOIRpQL07Uhd9I+R+QwHYCXE1YwYztrUfzJHPopM/NkhVBo0SDST7oIWpzGiCqyPNKo+7D6vDhcBHJmOrLi9jnd7Dm4RUYZza3CcV3morkhvLTAddkkjVvjYmvr0nL+e9n+eAEL4zu4kSayKNm+1fo++R2YDllRqdjdl/OtAgIHlu3PsH1s5Vn8TXsFzHGVqgxVPftOP6Dz4/lVotjD2FfG+BjGlRAzECb6FcGt3VQyuS9N6b5SjmfPH0wRVRDnpXcPSo0zl30uzKTmiUlG13LpJRd9PckJAlInpl1bfsCuj2Az+gd+2PxgCRb0DKKiJKtMaHHbXstjeUEMpCgsOUtdzJk1y5Lt/6ypebVpE49D9ipsS/WXidSt2Rtc0kF1I1drKs+2fp0z4n6DUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(23010399003)(366016)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?px7u8aGUqmSTqwmeijjbUmL6cY7FF5N28EMSc4sfqUiLr31V5yszVeq4nAAJ?=
 =?us-ascii?Q?SMJresBPxWDqUxNYjvjKXCHkjVo6829bbEau5l8g3bTpCTtwvrleSYK4eH6P?=
 =?us-ascii?Q?9zfgcOe7Tz3bzOQ6Cmua+zOUTN/fh54DsIFzK3SH9eTgUo5UhXTMR4SCQw3j?=
 =?us-ascii?Q?SwUrUZAfyBrIwCVBV92WcZ65lEKfU3DqtNsTkhqaQhwvXfx4e7SmOSzrnr6k?=
 =?us-ascii?Q?qjptX0SS4/UxwEjVBse6U9OZ8rS5uAHVnKdWyQJq/8NMseo8JwdAV5SzuAd/?=
 =?us-ascii?Q?G9dYdSymE2G0FEB+Djgib48gkt8r1WZz+7BN8cn8sPCDfEVJvm1XVhxYirrg?=
 =?us-ascii?Q?LsdWCz6NF9IGPpgiYC4FPKoBOryTaY9rQXzwpCNUwLeU6c7mg8BEECRc939u?=
 =?us-ascii?Q?CW4TO8UQRuEPmtFS1TjcIE9TxciLNV+LcNI5Gy48l0EqPjJJ4JIkw04+nnHs?=
 =?us-ascii?Q?Q5gCqzdn4AZCQ6ZYRoP0KPvsGMbFavCEHmk17TOp9pvnEeyzaHrLMROlfm2A?=
 =?us-ascii?Q?9KyVvEMCE263alXgWoa/vGgoEhuIP8wzDinnEQuts/uBURCsw+FlcUGj7VBl?=
 =?us-ascii?Q?1yGwFd5kGjaWYoSwX3OmzYsQZKB7TrQCKweyLD4NawHn9OLLNvFtLFUt0bvO?=
 =?us-ascii?Q?f+uy5tL8GDfYcEsUEu5khwg38m3brqnaHlpVoRcHzb36/S4myxifYAKGypuf?=
 =?us-ascii?Q?BcNrkeU2sIY2O//A2coRaV3wOQl3r5f4QTEQKY9uCURTeQn5xC7g+2gyem0f?=
 =?us-ascii?Q?51gx35EqYpyHvHUguf+qL5Nkvp6IzExUJjLsXy7C2Vp9F8bNeYvBXwZBunej?=
 =?us-ascii?Q?XfOB5aIJC6rP68KDeiwciPLCIGqYt2PiUWvpAOTDpZUlzsm9q+LTC24NwJD1?=
 =?us-ascii?Q?Sy5XsEMQX97Ilc4tTBB86HjKR+wjC82QUKm4IrDPIVDKSFCP2b9t1FQ0Q9Ht?=
 =?us-ascii?Q?jrsRLyIMf3ri28YFD0SBRWsH4COWZRbufFhFBVn0x0d5+GakXOcgYuP0g587?=
 =?us-ascii?Q?Rvfa36sHAjjEcg3Vt2nHylhBPc2jDY8Aj1411qXUuXkUq8XbuzOE5SfEeFV5?=
 =?us-ascii?Q?r5mqkUZafI0FGezKODezrIjKdYcaLI89hRt0cW7tZTXYnOzMrZOspS0u4aze?=
 =?us-ascii?Q?YYNoJt/vRnpxWozNIbhrvyl5SVVAn+tJlA8xZujesleYNMiRnH9WiKXaMY6Z?=
 =?us-ascii?Q?rFSRf5D6NI+TIGbd8Xlt94mLSVjw3S71xIFTF0cgFHZIpb2HHM7tYARwIz7l?=
 =?us-ascii?Q?jYcGdfLl0KoXonNvaOXCaJllrLnGhiW2NMo68O94tabzoi5wdJlfj+SGQAG9?=
 =?us-ascii?Q?lHwgdrRHC1yhYCPWhEZHbP6AUmc7+roOM9Jf48aID7JNERK+mBQWzoEtxmlU?=
 =?us-ascii?Q?SwvRuajYbRp8deJLuK6mWKv32dRjtxr1d759PsJc4mf51HHDFfgNwRXLcnqD?=
 =?us-ascii?Q?vIVl33CiHg2MAuH/xHbvEWsfr/ixIKHmLu0SNzf6JlAcfMpqMezRsYbexPWs?=
 =?us-ascii?Q?ljxubZfVVSqiJcywa2y+L+w2ril1BRkoOeOEpuEr4Q0GrAV5DFb2GmOI3fFA?=
 =?us-ascii?Q?sC+W11YtvQDbJUOrp6Fj75mRXgcUxMJy4zVkvs6KFHvMqdnAfUG8eV8sHTuZ?=
 =?us-ascii?Q?JXTqNWp6dssAKVyFzvwJ+j8QYcTEqTibXaMjVRqoHIA5MuOSwo367ZyFz07p?=
 =?us-ascii?Q?N2k7yhRUmSer4qZMvdeEafzf/GlyPiqsCjAHgLvE1Ud8zhyoD5Z5fceFZxxK?=
 =?us-ascii?Q?ODP/bLvbGNtMLwUibIjU29ub+w8sO8uvBlv2s6LWDJKqs6C2v2mR?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c598b847-7bba-4158-5d35-08df2d84713e
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 01:58:17.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjKG9j/cM2jydhUFRI96hojL646URkgLX/AsnK2ERAzKmq5WzIDO7+AftV7esSXCbOqkurM1P2WXFhA9gnun7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB5868
X-purgate-ID: tlsNG-c1860d/1792375102-DF8D587B-E872EE4F/0/0
X-purgate-type: clean
X-purgate-size: 23664

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, simply ignore it.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v12:
 - Error reporting for memory allocation failures in init_cpu_topology()
   into a single error path.
 - Emit an error message from init_cpu_topology() when
   dt_init_cpu_topology() or acpi_init_cpu_topology() returns an error,
   explicitly indicating that CPU topology initialization has failed.
 - Drop the Reviewed-by tag from patch 0001 due to changes in
   common/cpu-topology.c.
 - In dt_smp_init_cpus(), add a comment explaining that the boot core
   remains valid even if arch_cpu_init() fails.
 - dt_init_cpu_topology() returns -EINVAL if a leaf node lacks the cpu
   phandle property or if the target node is not a valid CPU node.
 - dt_init_cpu_topology() continues parsing subsequent threads instead
   of returning early when a referenced CPU is not tracked by Xen.
 - Update the log message when skipping an unmapped CPU to reflect
   that secondary CPUs have not yet been brought up at this stage.
 - Remove trailing periods from log messages.
 - Drop the Reviewed-by tag from patch 0001 due to changes in
   common/cpu-topology.c.

 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/setup.c                  |   3 +
 xen/arch/arm/smpboot.c                |  10 +
 xen/common/Kconfig                    |  22 ++
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  73 +++++
 xen/common/cpu.c                      |   5 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 370 ++++++++++++++++++++++++++
 xen/drivers/acpi/Makefile             |   1 +
 xen/drivers/acpi/topology.c           |  43 +++
 xen/include/xen/acpi.h                |  13 +
 xen/include/xen/cpu-topology.h        |  34 +++
 xen/include/xen/dt-cpu-topology.h     |  35 +++
 14 files changed, 612 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b9c5c40678..3d0f689220 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_GENERIC_CPU_TOPOLOGY
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_SHARED_INFO
 	select HAS_STACK_PROTECTOR
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2cd1c021b5..c1aa06bd31 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -10,6 +10,7 @@
 
 #include <xen/bootinfo.h>
 #include <xen/compile.h>
+#include <xen/cpu-topology.h>
 #include <xen/device_tree.h>
 #include <xen/dom0less-build.h>
 #include <xen/domain_page.h>
@@ -375,6 +376,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     nr_cpu_ids = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
 
+    init_cpu_topology();
+
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
      * (called from smp_init_cpus()).
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 8c9072f3c1..d34396f9b1 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -9,10 +9,12 @@
 
 #include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/dt-cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/mm.h>
@@ -245,6 +247,14 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        /*
+         * Because the boot CPU (i == 0) is already running, treat it as valid
+         * even if arch_cpu_init() fails (e.g. due to a missing enable-method).
+         */
+        if ( (rc >= 0) || (i == 0) )
+            /* Pass the info to dt_init_cpu_topology() */
+            map_cpu_to_dt_node(i, cpu);
     }
 
     if ( !bootcpu_valid )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f..fb42f0aa8b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_GENERIC_CPU_TOPOLOGY
+	bool
+
 config HAS_IOPORTS
 	bool
 
@@ -194,6 +197,25 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config GENERIC_CPU_TOPOLOGY
+	bool
+
+config DT_CPU_TOPOLOGY
+	bool "Device tree based CPU topology support"
+	depends on HAS_GENERIC_CPU_TOPOLOGY && DEVICE_TREE_PARSE
+	select GENERIC_CPU_TOPOLOGY
+	help
+	  Retrieve CPU topology information from the device tree to optimize
+	  vCPU scheduling.
+
+config ACPI_CPU_TOPOLOGY
+	bool "ACPI based CPU topology support"
+	depends on HAS_GENERIC_CPU_TOPOLOGY && ACPI
+	select GENERIC_CPU_TOPOLOGY
+	help
+	  Retrieve CPU topology information from the ACPI PPTT to optimize
+	  vCPU scheduling.
+
 config NUMA
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index f69d47d189..d0eb39a633 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
+obj-$(CONFIG_GENERIC_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
diff --git a/xen/common/cpu-topology.c b/xen/common/cpu-topology.c
new file mode 100644
index 0000000000..8c64532e28
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/dt-cpu-topology.h>
+#include <xen/init.h>
+#include <xen/xvmalloc.h>
+
+static void __init free_topology_table(void)
+{
+    unsigned int cpu;
+
+    if ( !cpu_topology )
+        return;
+
+    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+    {
+        free_cpumask_var(cpu_topology[cpu].thread_sibling);
+        free_cpumask_var(cpu_topology[cpu].core_sibling);
+        free_cpumask_var(cpu_topology[cpu].cluster_sibling);
+    }
+
+    XVFREE(cpu_topology);
+}
+
+void __init init_cpu_topology(void)
+{
+    unsigned int cpu;
+    int ret = 0;
+
+    if ( num_possible_cpus() == 1 )
+        return;
+
+    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
+
+    if ( cpu_topology )
+    {
+        for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+        {
+            if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
+                 !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
+                 !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
+                ret = -ENOMEM;
+        }
+    }
+    else
+        ret = -ENOMEM;
+
+    if ( ret != 0 )
+        printk(XENLOG_WARNING "CPU topology table allocation failed\n");
+    else if ( acpi_disabled )
+        ret = dt_init_cpu_topology();
+    else
+        ret = acpi_init_cpu_topology();
+
+    /* Free the CPU topology table if initialization fails. */
+    if ( ret != 0 )
+    {
+        printk("Failed to initialize cpu topology (error %d)\n", ret);
+        free_topology_table();
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index f09af0444b..9591ada60a 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -1,5 +1,6 @@
 #include <xen/cpumask.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/event.h>
 #include <xen/init.h>
 #include <xen/sched.h>
@@ -46,6 +47,10 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
 #undef MASK_DECLARE_2
 #undef MASK_DECLARE_1
 
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+struct cpu_topology *__ro_after_init cpu_topology;
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
 static DEFINE_RWLOCK(cpu_add_remove_lock);
 
 bool get_cpu_maps(void)
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 730d202349..b15b3382d2 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..bfcf153cc4
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,370 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+
+#define INVALID_TOPO_ID (~0U)
+
+struct cpu_map {
+    unsigned int thread_id;
+    unsigned int core_id;
+    unsigned int cluster_id;
+    unsigned int socket_id;
+};
+
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = {
+        .thread_id = INVALID_TOPO_ID,
+        .core_id = INVALID_TOPO_ID,
+        .cluster_id = INVALID_TOPO_ID,
+        .socket_id = INVALID_TOPO_ID,
+    },
+};
+static struct dt_device_node *__initdata dt_cpu_table[NR_CPUS];
+
+static void __init setup_siblings_masks(unsigned int target_cpu)
+{
+    struct cpu_topology *target_topo = &cpu_topology[target_cpu];
+    const struct cpu_map *target_map = &cpu_map[target_cpu];
+    unsigned int cpu;
+
+    /* Update cluster, core and thread sibling masks */
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+        const struct cpu_map *map = &cpu_map[cpu];
+
+        if ( target_cpu > cpu )
+            continue;
+
+        if ( target_map->socket_id != map->socket_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, target_topo->core_sibling);
+
+        if ( target_map->cluster_id != map->cluster_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
+        cpumask_set_cpu(cpu, target_topo->cluster_sibling);
+
+        if ( target_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, target_topo->thread_sibling);
+    }
+}
+
+static const struct dt_device_node *__init dt_find_child_node_by_name(
+    const struct dt_device_node *dt,
+    const char *name)
+{
+    const struct dt_device_node *np;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && dt_node_name_is_equal(np, name) )
+            return np;
+
+    return NULL;
+}
+
+void __init map_cpu_to_dt_node(unsigned int cpu,
+                               struct dt_device_node *cpu_node)
+{
+    if ( cpu < ARRAY_SIZE(dt_cpu_table) )
+        dt_cpu_table[cpu] = cpu_node;
+    else
+        printk(XENLOG_WARNING
+               "cpu %u exceeds the max cpus %zu\n",
+               cpu, ARRAY_SIZE(dt_cpu_table));
+}
+
+static unsigned int __init cpu_node_to_id(
+    const struct dt_device_node *cpu_node)
+{
+    unsigned int cpu;
+
+    for_each_possible_cpu(cpu)
+        if ( cpu_node == dt_cpu_table[cpu] )
+            return cpu;
+
+    return INVALID_TOPO_ID;
+}
+
+/*
+ * This function returns the Xen cpu number of the DT node.
+ */
+static int __init get_cpu_for_node(
+    const struct dt_device_node *dt_node, unsigned int *cpu)
+{
+    const struct dt_device_node *cpu_node =
+        dt_parse_phandle(dt_node, "cpu", 0);
+
+    if ( !cpu_node || !dt_device_type_is_equal(cpu_node, "cpu") )
+    {
+        *cpu = INVALID_TOPO_ID;
+        return -EINVAL;
+    }
+
+    *cpu = cpu_node_to_id(cpu_node);
+
+    return 0;
+}
+
+static bool __init is_cpu_map_empty(unsigned int cpu)
+{
+    return (cpu_map[cpu].socket_id == INVALID_TOPO_ID) &&
+           (cpu_map[cpu].cluster_id == INVALID_TOPO_ID) &&
+           (cpu_map[cpu].core_id == INVALID_TOPO_ID) &&
+           (cpu_map[cpu].thread_id == INVALID_TOPO_ID);
+}
+
+static int __init parse_core(const struct dt_device_node *core,
+                             unsigned int socket_id,
+                             unsigned int cluster_id,
+                             unsigned int core_id)
+{
+    bool leaf = true;
+    unsigned int thread_id;
+    unsigned int cpu;
+    int ret;
+
+    for ( thread_id = 0; ; thread_id++ )
+    {
+        const struct dt_device_node *thread;
+        char name[20];
+
+        snprintf(name, sizeof(name), "thread%u", thread_id);
+        thread = dt_find_child_node_by_name(core, name);
+
+        if ( !thread )
+            break;
+
+        leaf = false;
+        ret = get_cpu_for_node(thread, &cpu);
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "%s: No CPU found for thread\n", dt_node_name(thread));
+            return ret;
+        }
+
+        if ( cpu == INVALID_TOPO_ID )
+        {
+            /*
+             * Ignore this CPU node definition as the corresponding physical
+             * CPU failed to boot.
+             */
+            printk(XENLOG_INFO
+                   "%s: CPU for thread is unavailable\n", dt_node_name(thread));
+            continue;
+        }
+
+        if ( !is_cpu_map_empty(cpu) )
+        {
+            printk(XENLOG_ERR
+                   "Duplicate CPU definition for CPU%u\n", cpu);
+            return -EINVAL;
+        }
+
+        cpu_map[cpu].socket_id = socket_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = thread_id;
+    }
+
+    ret = get_cpu_for_node(core, &cpu);
+
+    if ( cpu != INVALID_TOPO_ID )
+    {
+        if ( !leaf )
+        {
+            printk(XENLOG_ERR "%s: Core has both threads and CPU\n",
+                   dt_node_name(core));
+            return -EINVAL;
+        }
+
+        if ( !is_cpu_map_empty(cpu) )
+        {
+            printk(XENLOG_ERR "Duplicate CPU definition for CPU%u\n", cpu);
+            return -EINVAL;
+        }
+
+        cpu_map[cpu].socket_id = socket_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = 0;
+    }
+    else if ( leaf )
+    {
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "%s: No CPU found for leaf core\n", dt_node_name(core));
+            return ret;
+        }
+
+        /*
+         * Ignore this CPU node definition as the corresponding physical
+         * CPU failed to boot.
+         */
+        printk(XENLOG_INFO
+               "%s: CPU for leaf core is unavailable\n", dt_node_name(core));
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(const struct dt_device_node *cluster,
+                                unsigned int socket_id,
+                                unsigned int cluster_id)
+{
+    bool has_cores = false;
+    int ret = 0;
+
+    if ( dt_find_child_node_by_name(cluster, "cluster0") )
+    {
+        printk(XENLOG_ERR
+               "Topology for clusters of clusters not yet supported\n");
+        return -EINVAL;
+    }
+
+    for ( unsigned int core_id = 0; ; core_id++ )
+    {
+        const struct dt_device_node *core;
+        char name[20];
+
+        snprintf(name, sizeof(name), "core%u", core_id);
+        core = dt_find_child_node_by_name(cluster, name);
+
+        if ( !core )
+            break;
+
+        has_cores = true;
+
+        ret = parse_core(core, socket_id, cluster_id, core_id);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    if ( !has_cores )
+        printk(XENLOG_WARNING "%s: empty cluster\n", dt_node_name(cluster));
+
+    return ret;
+}
+
+static int __init parse_socket(const struct dt_device_node *socket,
+                               unsigned int socket_id)
+{
+    bool has_cluster = false;
+    int ret = 0;
+
+    for ( unsigned int cluster_id = 0; ; cluster_id++ )
+    {
+        const struct dt_device_node *cluster;
+        char name[20];
+
+        snprintf(name, sizeof(name), "cluster%u", cluster_id);
+        cluster = dt_find_child_node_by_name(socket, name);
+
+        if ( !cluster )
+            break;
+
+        has_cluster = true;
+        ret = parse_cluster(cluster, socket_id, cluster_id);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    /*
+     * If no cluster node is defined, assume the socket has
+     * a single cluster.
+     */
+    if ( !has_cluster )
+        ret = parse_cluster(socket, socket_id, 0);
+
+    return ret;
+}
+
+static int __init parse_package(const struct dt_device_node *package)
+{
+    bool has_socket = false;
+    int ret = 0;
+
+    for ( unsigned int socket_id = 0; ; socket_id++ )
+    {
+        const struct dt_device_node *socket;
+        char name[20];
+
+        snprintf(name, sizeof(name), "socket%u", socket_id);
+        socket = dt_find_child_node_by_name(package, name);
+
+        if ( !socket )
+            break;
+
+        has_socket = true;
+        ret = parse_socket(socket, socket_id);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    /*
+     * If no socket node is defined, assume all clusters reside under
+     * a single socket.
+     */
+    if ( !has_socket )
+        ret = parse_socket(package, 0);
+
+    return ret;
+}
+
+static int __init parse_dt_topology(void)
+{
+    const struct dt_device_node *cpus;
+    const struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+    if ( !cpus )
+        return -ENOENT;
+
+    map = dt_find_child_node_by_name(cpus, "cpu-map");
+    if ( !map )
+        return -ENOENT;
+
+    return parse_package(map);
+}
+
+int __init dt_init_cpu_topology(void)
+{
+    unsigned int cpu;
+    int ret;
+
+    ASSERT(cpu_topology);
+
+    ret = parse_dt_topology();
+    if ( ret == 0 )
+        for_each_possible_cpu(cpu)
+            setup_siblings_masks(cpu);
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 477408afbe..6d676e91d4 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_PM_STATS) += pmstat.o
 obj-$(CONFIG_PM_OP) += pm-op.o
+obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.init.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
new file mode 100644
index 0000000000..f9836447b2
--- /dev/null
+++ b/xen/drivers/acpi/topology.c
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/init.h>
+
+/*
+ * TODO: Populate the topology information by scanning the ACPI
+ *       PPTT (Processor Properties Topology Table).
+ */
+int __init acpi_init_cpu_topology(void)
+{
+    unsigned int cpu;
+
+    ASSERT(cpu_topology);
+
+    /*
+     * Generate temporary cpu topology information for now.
+     * It assumes that the cpu doesn't have SMT and all CPUs
+     * belong to the same socket.
+     */
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        cpumask_set_cpu(cpu, topo->thread_sibling);
+        cpumask_copy(topo->core_sibling, &cpu_possible_map);
+        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 2fdf38cf74..cbb02e0f35 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -135,6 +135,19 @@ static inline int acpi_boot_table_init(void)
 
 #endif 	/*!CONFIG_ACPI*/
 
+#ifdef CONFIG_ACPI_CPU_TOPOLOGY
+
+int acpi_init_cpu_topology(void);
+
+#else /* CONFIG_ACPI_CPU_TOPOLOGY */
+
+static inline int acpi_init_cpu_topology(void)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_ACPI_CPU_TOPOLOGY */
+
 int get_cpu_id(u32 acpi_id);
 
 unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..27b9bd443e
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+
+#include <xen/cpumask.h>
+
+struct cpu_topology {
+    cpumask_var_t thread_sibling;
+    cpumask_var_t core_sibling;
+    cpumask_var_t cluster_sibling;
+};
+
+extern struct cpu_topology *cpu_topology;
+void init_cpu_topology(void);
+
+#else /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+static inline void init_cpu_topology(void) {}
+
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+#endif /* XEN_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/dt-cpu-topology.h b/xen/include/xen/dt-cpu-topology.h
new file mode 100644
index 0000000000..43f7b31bf6
--- /dev/null
+++ b/xen/include/xen/dt-cpu-topology.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_CPU_TOPOLOGY_H
+#define XEN_DT_CPU_TOPOLOGY_H
+
+struct dt_device_node;
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+void map_cpu_to_dt_node(unsigned int cpu, struct dt_device_node *cpu_node);
+int dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+#include <xen/errno.h>
+
+static inline void map_cpu_to_dt_node(unsigned int cpu,
+                                      struct dt_device_node *cpu_node) {}
+static inline int dt_init_cpu_topology(void)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
+
+#endif /* XEN_DT_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


