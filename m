Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030D9C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:30:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367305.1617131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsi-0007jg-0o; Mon, 20 Jul 2026 16:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367305.1617131; Mon, 20 Jul 2026 16:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsh-0007jY-Tc; Mon, 20 Jul 2026 16:30:15 +0000
Received: by outflank-mailman (input) for mailman id 1367305;
 Mon, 20 Jul 2026 16:30:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlqsg-0007To-OS
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:30:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqsg-007jXT-53
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:30:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d09-e002-0a2a0a5209dd-0a2a450187c2-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:13 +0200
Received: from [52.101.229.80]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d0f-5984-0a2a45010019-3465e5506d27-5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:12 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6790.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:30:10 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:30:10 +0000
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
 b=lrfEpqbuGEVcbeby4HWHCuVJB2grqcNK0hm+WtB6P9z5yON1QRBo5wdiVQe9VpbFhmYDxE2PuTryE7V9JRBSjSf3r+N5WVHComU3EdJuP09NGgpgMDUpG7vLgTVvbI05Kmj8VF7QlxexezY9DovT8KuCGTc0eAdOU3b6BYvT5a/xUVC34SGWu7oUeqF3v5C5eL3h0TsKPS19UJ0SSdbPGD0nq1+xenMaQsxUDfM9GU5hIaYmUXflEiiKilOvT0Z75vd8FwzpIKk4wEQfhX2NDdWgfMghuG/hHQMHUl4mTgQPkyWmQQneAS0n0bPbkLjzA3T6X47bFNrapBRi6hf/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te1S5GfewIHDdtuLoq1qpch20NJ4D433OHueLW4276E=;
 b=UeA4S25f6VSzSnbxjNuO4eJGXyFcDm3LEPVNzKfr5zqffTfXjd7Nwf6RYq7ngEw5aWkYTq9UKNYBXxhuE6fyrkfnZDfq8XC5vYsmOCf9yeiQQqWQkCVXeIKA8C0Rt2MVA22AKOGiJL6ynmNh9t8cwxKRvo8yfV+Dqn/+JIBXQ0p5TjoeKmT7WtiW3d5MJVIRROVVvqxA5DjKyFHPMgX+GkUeI9cYrz7dee0S1PMbrrWemKhiAejwyVhPwMSYfX263GnBp+kaCHjHCVUykqu2CP+dnEYwi+m/TwxAvVDc2XN/NZ0TxMnYVHxvGthq12fLhpZVizeoWm/7q7vnvYe7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te1S5GfewIHDdtuLoq1qpch20NJ4D433OHueLW4276E=;
 b=Jyt7ma+DIhevnQDB9TRAvhuhJezdQTvMD4Tweg+pFBrybjPAAbf61opgLjF0RgSTK0rozLQOS6u8tfS7VhKwku1Vc+e2fKKnrBa0VQlHoOsNdCLuhNQdA1Y17o+L5c6J1gDCRVdgDJ7WBKJpK8WN3/uF/OI8vuC4lfHxy/+Ku1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 4/5] xen/acpi: Import PPTT definitions from Linux
Date: Tue, 21 Jul 2026 01:28:18 +0900
Message-ID: <20260720162819.308326-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720162819.308326-1-taka@valinux.co.jp>
References: <20260720162819.308326-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ac8116-919e-4b9a-e783-08dee67c2af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|376014|3023799007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5zE6mXXwA4Q53wu7xZ6WqHsWbkc8/jz8PfP2tZejgyLY+LoKJPUFhACbVPiKJqYiY9WigKtfrB2NNtZ8Vbc09lK/93ssGJqrtwWJ32z64oCnimCWjHailNNApLgrKV8ELGEgqb3W4WvFZl8jHn0GwEr3qDDOlCSzVff52x3pNNVfl93xV+ujEPcXNsavU/NcWp8Fsbb3dq6EnyE0i+MRRD9Xw3d31W683fewtDSL6ddCQV/ZJAS4/dpIGJ74wrWWgKhYXyouxLYJDM3Edg7PyHyFO4i34QPL6WLY3g96CyXgNLe9/7uV1j9IJilZIf4CONwDB+8GwA2+wQCodoF4XCq0csvs4spd/X2y508A2BvEkFjEKYcp4Z7YSgAeB18VsO12kM5MEUm0Yl1yGyu0CATIABJ1sV87ep4Hzvbk7QXbyMqJTkb9Oxtipt4LhwEwGMkj7N7iFp7n/U6tQughOlwsrfbKLen1kXXlEadmjuH71uSSE50VbvWTNauSVgXLmnYzRUUAx6zr6gjU/vy10IpvGUC0wGRjFfD+oPwpfPrtnMX+FwDlexDx/18Xr2+KHTByOVWKewvLoOuG6N9MJ55g3t3cRIUGxG9d0LdZ2jQd5v32ZjXo3eBHAtUDKpGcKoY4C2MUf++7Vw9z6VwY+A6epFwUeUhw6lnjYZYkrrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(376014)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XVIcvudajV7egtiTkGuz/A9LoAvT8Y9K18bgGffVKueTa/nHWz491+y7/bxg?=
 =?us-ascii?Q?ubPVVPX47ABokw8bCbYQxfTGkA/BN+Yuwl3aBXFHWflR02t2MPFNXSPt6I9q?=
 =?us-ascii?Q?ukOhTHjHlIs4JUGTLI4JSvxASj0MuGy975NAP6K12c0b34k121fk3JUPS/6W?=
 =?us-ascii?Q?wjKQCXcXW2XkHb2bAD4ArUWNRJe6XTrQuyIMguOfzRa7Wzcq+EorlQj4raxj?=
 =?us-ascii?Q?2ue4MgraYT+Q1N/IHCJbPRxQAWxnm74ae0cUK/2pq9/rEgOd0x/4cmmy7Qy9?=
 =?us-ascii?Q?Grfg+YNNdR9xA+iI8+qB7Xf4hwEqxyS6lr+u9w/0nmlU6IyiMQQq8Vzm/WBa?=
 =?us-ascii?Q?RbOcRCAEqin6clJ5g94uqn0Aa3qZkEpvzzS3YruJV3aIoVNYm3lRYM4RI906?=
 =?us-ascii?Q?hh5u0XjSwKCMRitv2FXA1eIRE0zbWN57c98jH7K36bOCwU864OETxyEXbGVU?=
 =?us-ascii?Q?cxFNqpzIDZ/mhzrfPdkBic2vpnQFRWOkjm2JAfTlg7Ixbft1+HejbegM1TDC?=
 =?us-ascii?Q?kbr9Z4sbPc9RW32sayLSKD7VUqGtI71iKgaz1QnrouMUSm4J9SMj0iRgTraI?=
 =?us-ascii?Q?YmiOFjJvON+uULbqxOHs9HSTAl98i5VEmORmi0RIfAbxwcd18T1Cj6QFdl8H?=
 =?us-ascii?Q?BXHrRWPdxsT2dJsxPqluoEpsIoawCKhshRaYVR9mnF4zgVnPegLjPhqhn9Og?=
 =?us-ascii?Q?jn7i4vjObahtw1i8TVhPvffm9eZlJjp5IHKn27N8MLnXc0AouYNa+sEr1wCm?=
 =?us-ascii?Q?bDemp3ZChj3nDY7fJEwfj+X9CUpzNIiMWMxGmsvcE8c3j45e6lxeYEin3Lom?=
 =?us-ascii?Q?Lff58SZjKSkU6HI4ah8d0BYxD+6bV4NENehWOA3qQSyBd43IyQPhQI7LSIBB?=
 =?us-ascii?Q?N8qeCEjU+L6mB41VVPB3YDd/S2J19yfqMT8KjSFaMJTctaSUnHn55CHwQ73v?=
 =?us-ascii?Q?urq7H6i5DpAgO85LhScKgHYZhcNYnk4/UiJ+jGyPHlioScdzZgX6/T61Q7f2?=
 =?us-ascii?Q?T/3qf7H7AnNviD2R3ABfnW6kmg8G3CnVbabuRGgajCeWWaOUKjICG8HIVDi2?=
 =?us-ascii?Q?GDxNSz5KUuxM42pwNcjkYwdr636aPiGZR3/h7iVRSypofSQKh6P+9de4YVWM?=
 =?us-ascii?Q?e1+a5k53xZwrCZ57iL+cnPUyhU51NTJ2MpRpmS6zN0uQSdRGgZSIGDQQ2VtL?=
 =?us-ascii?Q?w/aftGo32qxxCBiMD+rrb/t2hBSOrvENRFEw0A2GaKo5h0Ml3p7LVnQEKyuB?=
 =?us-ascii?Q?1c7rfg+yiKy5VeCZDGUxSo/R8LV1cy+R2s0MfezOPFAgehvH1UI224QxwA+q?=
 =?us-ascii?Q?7km1BlaF7UhewHWtR/a5VxsJQX0gIYDsctjDFxz1iKoqOlaI+BlRAVOQeCBw?=
 =?us-ascii?Q?hewU50vS1J3cS2CQlukAzg5Pbq9VcK67TueYMxEqLaRexE2fHZ4q8N4E3rWj?=
 =?us-ascii?Q?Y41pClBRxQ9ThnY+Rn/+wf+qX6S54hpdu6B73tqCKt3zdkmKOKktcSzf668u?=
 =?us-ascii?Q?Ctc+fkwTZ33y4o3XbZTsSkXbqyQhvaYbvKgYYSD+k2ky/w4TsLZ96mNhSnPA?=
 =?us-ascii?Q?Uouk8QJswC1/PzkB+VWk+qEupxyQgrCteA5CI8d7zqcHdSKjzz2r5XP5YOwb?=
 =?us-ascii?Q?DHrlhQBjHpPHz+Of1Dxg9F25HtOjfiWVz0PDoBkE0h2SxPRCkXjRmIy43xKe?=
 =?us-ascii?Q?PQin2pUVQ/ISLjaSGR4ugJ87qOh4KTn4kxwWTQ2yhwd7SShDtHkasqp3SOKm?=
 =?us-ascii?Q?woATt+kGrQkX0nR+ScglDQp/6re04wntNOOTbclhNLdJ2j3nwGZ2wO19nAl3?=
X-MS-Exchange-AntiSpam-MessageData-1: Z1VCIUbBoDhi4w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ac8116-919e-4b9a-e783-08dee67c2af5
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:30:10.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61sunm5PSwaN/IipvRInU5un9UDrH8nItwNfaAiQiomrWcJ7XPMrDHL0b7wxiRbt8CM/zUIx5e8BhPS2zGGPpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6790
X-purgate-ID: tlsNG-d62444/1784565013-1F66C757-A1437612/0/0
X-purgate-type: clean
X-purgate-size: 5333

Import the Processor Properties Topology Table (PPTT) definitions
from the Linux kernel header (include/acpi/actbl2.h) into Xen.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git b8355bcac253
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git e62f8227851d
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git 091c4af3562d
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/include/acpi/actbl2.h | 113 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/xen/include/acpi/actbl2.h b/xen/include/acpi/actbl2.h
index ee96e990d6..4398d98e00 100644
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -72,6 +72,7 @@
 #define ACPI_SIG_IVRS           "IVRS"	/* I/O Virtualization Reporting Structure */
 #define ACPI_SIG_MCFG           "MCFG"	/* PCI Memory Mapped Configuration table */
 #define ACPI_SIG_MCHI           "MCHI"	/* Management Controller Host Interface table */
+#define ACPI_SIG_PPTT           "PPTT"	/* Processor Properties Topology Table */
 #define ACPI_SIG_SLIC           "SLIC"	/* Software Licensing Description Table */
 #define ACPI_SIG_SPCR           "SPCR"	/* Serial Port Console Redirection table */
 #define ACPI_SIG_SPMI           "SPMI"	/* Server Platform Management Interface table */
@@ -937,6 +938,118 @@ struct acpi_table_mchi {
 	u8 pci_function;
 };
 
+/*******************************************************************************
+ *
+ * PPTT - Processor Properties Topology Table (ACPI 6.2)
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_pptt {
+	struct acpi_table_header header;	/* Common ACPI table header */
+};
+
+/* Values for Type field above */
+
+enum acpi_pptt_type {
+	ACPI_PPTT_TYPE_PROCESSOR = 0,
+	ACPI_PPTT_TYPE_CACHE = 1,
+	ACPI_PPTT_TYPE_ID = 2,
+	ACPI_PPTT_TYPE_RESERVED = 3
+};
+
+/* 0: Processor Hierarchy Node Structure */
+
+struct acpi_pptt_processor {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 flags;
+	u32 parent;
+	u32 acpi_processor_id;
+	u32 number_of_priv_resources;
+};
+
+/* Flags */
+
+#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
+#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1<<1)
+#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1<<2)	/* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_LEAF_NODE            (1<<3)	/* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_IDENTICAL            (1<<4)	/* ACPI 6.3 */
+
+/* 1: Cache Type Structure */
+
+struct acpi_pptt_cache {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 flags;
+	u32 next_level_of_cache;
+	u32 size;
+	u32 number_of_sets;
+	u8 associativity;
+	u8 attributes;
+	u16 line_size;
+};
+
+/* 1: Cache Type Structure for PPTT version 3 */
+
+struct acpi_pptt_cache_v1 {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 flags;
+	u32 next_level_of_cache;
+	u32 size;
+	u32 number_of_sets;
+	u8 associativity;
+	u8 attributes;
+	u16 line_size;
+	u32 cache_id;
+};
+
+/* Flags */
+
+#define ACPI_PPTT_SIZE_PROPERTY_VALID       (1)	/* Physical property valid */
+#define ACPI_PPTT_NUMBER_OF_SETS_VALID      (1<<1)	/* Number of sets valid */
+#define ACPI_PPTT_ASSOCIATIVITY_VALID       (1<<2)	/* Associativity valid */
+#define ACPI_PPTT_ALLOCATION_TYPE_VALID     (1<<3)	/* Allocation type valid */
+#define ACPI_PPTT_CACHE_TYPE_VALID          (1<<4)	/* Cache type valid */
+#define ACPI_PPTT_WRITE_POLICY_VALID        (1<<5)	/* Write policy valid */
+#define ACPI_PPTT_LINE_SIZE_VALID           (1<<6)	/* Line size valid */
+#define ACPI_PPTT_CACHE_ID_VALID            (1<<7)	/* Cache ID valid */
+
+/* Masks for Attributes */
+
+#define ACPI_PPTT_MASK_ALLOCATION_TYPE      (0x03)	/* Allocation type */
+#define ACPI_PPTT_MASK_CACHE_TYPE           (0x0C)	/* Cache type */
+#define ACPI_PPTT_MASK_WRITE_POLICY         (0x10)	/* Write policy */
+
+/* Attributes describing cache */
+#define ACPI_PPTT_CACHE_READ_ALLOCATE       (0x0)	/* Cache line is allocated on read */
+#define ACPI_PPTT_CACHE_WRITE_ALLOCATE      (0x01)	/* Cache line is allocated on write */
+#define ACPI_PPTT_CACHE_RW_ALLOCATE         (0x02)	/* Cache line is allocated on read and write */
+#define ACPI_PPTT_CACHE_RW_ALLOCATE_ALT     (0x03)	/* Alternate representation of above */
+
+#define ACPI_PPTT_CACHE_TYPE_DATA           (0x0)	/* Data cache */
+#define ACPI_PPTT_CACHE_TYPE_INSTR          (1<<2)	/* Instruction cache */
+#define ACPI_PPTT_CACHE_TYPE_UNIFIED        (2<<2)	/* Unified I & D cache */
+#define ACPI_PPTT_CACHE_TYPE_UNIFIED_ALT    (3<<2)	/* Alternate representation of above */
+
+#define ACPI_PPTT_CACHE_POLICY_WB           (0x0)	/* Cache is write back */
+#define ACPI_PPTT_CACHE_POLICY_WT           (1<<4)	/* Cache is write through */
+
+/* 2: ID Structure */
+
+struct acpi_pptt_id {
+	struct acpi_subtable_header header;
+	u16 reserved;
+	u32 vendor_id;
+	u64 level1_id;
+	u64 level2_id;
+	u16 major_rev;
+	u16 minor_rev;
+	u16 spin_rev;
+};
+
 /*******************************************************************************
  *
  * SLIC - Software Licensing Description Table
-- 
2.43.0


