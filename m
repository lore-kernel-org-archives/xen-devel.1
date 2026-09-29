Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDACA5FB1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:55:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436601.1655264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6C-00034w-EO; Tue, 29 Sep 2026 16:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436601.1655264; Tue, 29 Sep 2026 16:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6C-00034p-Bd; Tue, 29 Sep 2026 16:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1436601;
 Tue, 29 Sep 2026 16:54:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBb6B-00034j-4q
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:54:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBb6A-003jmL-I1
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:54:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed42-2eae-0a2a0a5409dd-0a2a4503d2f0-10
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:34 +0200
Received: from [52.101.84.132]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed49-fae8-0a2a45030019-34655484bc1b-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:34 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB4PR03MB8683.eurprd03.prod.outlook.com
 (2603:10a6:10:383::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:54:29 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:54:27 +0000
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
 b=dup6rLrF4jzqgoccWLVQZVBEuK8td3JejHaLyqZHG7smNut0dgK6Yh9ztDMy28/qM/6uFTP/ooaw20yHynqtaPV5cJ+DkMVUXvCLjoDtXs/lR8NC5VTHED9LIT5Vq85pb4vTcE1uRausJRLf8nVLeJQvidGByjai/Imr4JD6Id7XBihMmX6pGXOiRn2NuqY8lTtw0oplvUO5IcpAyazW2SRdjUd1gzpiSG1xnMmvkvVOKW+fgtYsMJ6oLvvtmRaSqJu3Jj+Noq60yM8aBUoMIfOFaVT/mtM0aqUmybDd6T96x+z/VtupI8L/6b+uZ6Y1p+GRgsFcZyA9MusOAFDIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZf8yTe9T+IPkQ9EPsC9sk+v2wd3I6l3F6lIvrh6qbw=;
 b=qaIH6yNPG7E02PLKuK3Qj6fQ/0/ptCF+j6lU/mwdzuYJ1QyAKRf+UIY2f5nZt5FV8Km0IN9W6unJGwtY2WK7DGJUJmlMbIkTrxy5BUv1ktUuTVk9GBc6n00Q4wcBd38K73SXg/Rs3svTxp3fRHDe1tghaOobGhLUmiUgJ3JWL90e3MWZGfc8s6RvBb8wTTwCb3OoUKZd/T+EQeU+JobTZg/+qgze9d19hbpvqTXlQv6PgMq+p2icyCJMOq6oHGLyWSRImIff8+fpRmtRugoFOJl0tZ8RW113Zyjt/s8li4cF2B4xoTZ/l4j98KRHlkOOQiAk/+MmQXLsIOoHofCdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZf8yTe9T+IPkQ9EPsC9sk+v2wd3I6l3F6lIvrh6qbw=;
 b=HH5zPXQ+Ctex/q9rXCecyafZvdXh9GYiqNjIypeYTrwCcjmL3qtYvltGeqINcJVhHTfF/0y81gV/4ni0qWbwTmrAJxnJ+KxD7KlYRdPiH5D87VUHgQb+pwcOd39eSCNZJT3C96sK7/STIsrgCq6ay0XgxFLWvW97h7VNlQkxXC/6z4M9XH+ON3V6eZWnGTjhEIy0E94oQJ+3ehqNJCcKimeJBhayDhLCNMshv/uDQo5W+4Wof/qe38GqQ15+lVaoW6RPOb8LtoKINLc3to/gIKLsL2I39UwG5ijFE//i8/L1OeMNVMzb7gUWfd5utIWXeNwsFuAo8m1Pdke6McZO5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Wiklander <jenswi@kernel.org>
Subject: [PATCH v6 0/4] xen/arm: Fix eSPI IRQ handling
Date: Tue, 29 Sep 2026 19:54:08 +0300
Message-ID: <cover.1790699282.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0096.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::10) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|DB4PR03MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: be2a5ff1-1893-47f6-4a6f-08df1e4a52bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kVuINk0Ops1AupZRNhKeaIlObZPgG0jSH8CsdCKmBfiT7UTz6t4qtWpYtxSN8/YKGUx6BAMetfwYIJrR112w+eUxlNxbPsLG1znaqE31+jWcaoisPUj0rV9i3P+DePQhyyiSP4PIFsxFoy8KL9p0u/fFK37ZS9HozUrDHnwJ/EXBD7UovYZlkt2g7jD8DTAigEff43fP+Nzgq4UggjMuz9BOVOfFV/4f2R4oRX+PGYztNhzCAGSOtg2FcgnkFAW/epG1ZaYCvwQsZONo7uV0/hVxqlCGYIyazo6D4SvQhvBtvC6ISS8i5+uB5P1awygXbHO8dwwibIhCnYn1IiLEtGri0kKp/pDLGJHmZ/Q/kupx80dIaM6JPvG39Up7QMiyEEtakJfFzC/zi7bOZZVa/L/9BxDLis3wZNA52RA+dqsVtZz/ShHVmXVQn4jPuUFdI+0Bw/XkYvTTUoXCXbKz0PSysWC+6jHoc/vTF1VVvC3w0z7wcuS7qgAbBqbEaPyFyV4zVUpuzqjQ3tE+XeGT8M7f4NXeAYdslB919MOGdXlSpeulQu/oAMSpBXt+ou+nICs6xmiO624HkDRGDhmRNbJ2tbLtelYuImjgujIvvIdgBDYns3GMR6Vu7IghfqG3lWB3LrYfLYOVdPPVwaFot2OTikj3xhpuXQXWjAxOS88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R4rj4osAuXLROoSHH7eejH89LZ1PVmn+1IMZ1apel4DIZ5j2PxtA5DPRcxpV?=
 =?us-ascii?Q?ORLpZUoRJW6InaCCfvQUdjxbeAROQTi88e0CU4j7GEbl2xvKon46WUNiOj6C?=
 =?us-ascii?Q?jaCTMpq69PXkCHjgww+K0buNm79uefVURQwPACYtvqnUNJVOXLDetm7H7R1g?=
 =?us-ascii?Q?Vp+v9ZVCVQ2csReuhdiuzlE+a1ULGYGKOegbYAO3Wmv7m1sQIxFeOqJKvWyE?=
 =?us-ascii?Q?5UaDEQneW++wtIRh7CXsrf80P5c8Op0lt5/pbEbpuiUr7Zh3jtEI5q6Gv2EY?=
 =?us-ascii?Q?Gv1qSe60CUUamPXhF+81JhezCvumRIymLYA0Cssk2IkVgSQ/tZpePHeTt+1k?=
 =?us-ascii?Q?/rX8Un+9YTeHCOrvUw6Qd9pPKrpcQ23KFdrrz5uabIj786+UcHT8jozftTjZ?=
 =?us-ascii?Q?masZsvhd1hGjCdMOvUjre+nLYOVZQVxEPSQe5qHWpULsJmLftT+sRLiv2rzI?=
 =?us-ascii?Q?5Mb3+uoF3M12lcQtS9ybERsn1cbKOZ6n+yW23Vv4S3NmDiYIC4rs3z5WTb1d?=
 =?us-ascii?Q?gob8WEhpDZSyZX+ytxcPIsBdY/k6QN1AoEYsD4WMqOLbCJhqVWJRndCqS4Z4?=
 =?us-ascii?Q?t080qVtyXKJPj5efmi7CUuAHvuYraliXGIQHAeNHwaQXGl6ZwrU0BZw+cEn1?=
 =?us-ascii?Q?REMKA/oFLw8k1x/ON4dYXB+Bx3szlM1WxyfPCfAEDXHggpj3iieb+6WaUn6W?=
 =?us-ascii?Q?wzWn0/+dBf9wD8AFUkSJlM5z+0fhw6G4883TYuAN1ZOkpkPfiNLk1WMWKtDA?=
 =?us-ascii?Q?VSJQfXFbRPpS48ImYEcWnTydjRO0OdQQ7AxDVkYMrPO5higAh7D0S/2yIorH?=
 =?us-ascii?Q?KrOdCiycsWSWXtVa7XkTjcQerSQ/lhXmN9h2vqcuFPPj2dfBDyQFbBavkrEV?=
 =?us-ascii?Q?o9+/f467PIgZv9vg8oihMKP46iIUmZt7Xws08ox0ABoMGMiUrXVqiez9/zFC?=
 =?us-ascii?Q?ldG1Xc5p5Xrg1Kvud3i6ZrPYSxEetrtXabmyEfULyFU+qyPlPNJ3i8e/n1n9?=
 =?us-ascii?Q?Zjisp4Z2pMU5+dNxK45gAxodeo6DA5D33ii2YY8KFRwFJSVTza67p1JWC8Zj?=
 =?us-ascii?Q?ZM9udK2z1wmTtf1BM5V2QHC/G9vDFU9rfZQLMz6q5MnyXvBREJnLYuhluXlx?=
 =?us-ascii?Q?z6eB7ZFH294xebEXbImJdF1ITUoJ/Qy5FoEo+P/GlCiA+l4oKyddIf90+RfN?=
 =?us-ascii?Q?mYktld6wjvoDkkhB1KWPY4kiqvLj+KQLqHFPQKgqeKe5aeVsajf4B2Zo2OnZ?=
 =?us-ascii?Q?6nlkELg5he9lvuzqjpTfpITbOAejM6/fUK49s1Pxp8GpqK3sk7V6qaEUfFxk?=
 =?us-ascii?Q?2KsjLhOykKqutwxAEu7qzprkHyVy31d+cgV+yfxCXpG3hg01O3mpXWYhFA18?=
 =?us-ascii?Q?y0DHUyKjuEffJXnEPWV7sSzegHDEcal2S+v+QIPH+uedFnzuk9GQA55mUKsg?=
 =?us-ascii?Q?hx6GV0cf/MpLepFUpDvfC+JreiY3JPyBpi/uWcIAiBzBQNblwI9YVOvWmswg?=
 =?us-ascii?Q?N4wY2tO3C2xx8SDF2Atf/Kf0mAiJ4/+ywkTiHO9DM0VXnzkd6uTKrD3TfIeN?=
 =?us-ascii?Q?ur+pic4rULn1yKA6N+e2AxyUEJ0rcasNPpk+lEJmep+Fy+O6MQa4yWBBtr34?=
 =?us-ascii?Q?Qx1ThReQeOGB/MbhphgWlZA+Ah0Q9GIOVNmAn/pivMU9Z//o8atvsKcHWxty?=
 =?us-ascii?Q?xj/GFpPzxVlkzzXFktEAHhJwNbVM10Yx/gUnIvarO8Cqp26lCczwejlmAV5/?=
 =?us-ascii?Q?0M/munmMlw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2a5ff1-1893-47f6-4a6f-08df1e4a52bf
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:54:27.5995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCX/mDYXxri24bwDvzGzOJ3r5iNjhuyWKqo6NYzuH9B2JIuUejkC8qGrhN01CiXQNHS90VN3dbHsdPsxYs/STQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8683
X-purgate-ID: tlsNG-33051d/1790700874-74A894E9-64B949C2/0/0
X-purgate-type: clean
X-purgate-size: 5927

This series fixes sparse eSPI INTID handling and checks errors returned by
irq_set_type().

Patch 1 checks irq_set_type() failures in the GTDT, MADT, SPCR, and FF-A
paths. GTDT and MADT could retain rejected timer or maintenance INTIDs
and later use them in direct descriptor lookups. This patch also fixes
MISRA C Rule 17.7 violations. It is now first in the series, as requested
during review, so callers handle errors before stricter IRQ validation
is introduced.

Patch 2 makes is_espi() check the architectural INTID range regardless of
CONFIG_GICV3_ESPI. If the GIC reports an eSPI without compiled-in support,
Xen stops with BUG_ON(), as there is no descriptor or pending_irq storage
for it. Virtual eSPI pending lookups without support are treated as
unreachable: the stub asserts in debug builds and retains a NULL return.

Xen has IRQ descriptors for INTIDs below NR_IRQS and, with eSPI support,
for eSPIs starting at 4096. It has no descriptors for INTIDs 1024 through
4095. Patch 3 checks INTIDs in setup_irq() and irq_set_spi_type() before
descriptor lookup. irq_set_spi_type() checks descriptor-backed ranges
because it can run before the GIC line counts are known. setup_irq()
checks implemented lines using those counts.

Patch 4 fixes the vGIC allocation bitmap. Reserving an eSPI used a compact
bitmap index, but freeing it used the raw virtual INTID. This could write
past the bitmap and leave the eSPI reserved. Both vGIC implementations now
use vgic_is_valid_line() when reserving and freeing vIRQs.

Testing of the v6 UART changes, before the last FF-A formatting change:

- Arm64 debug build passed with CONFIG_ACPI=y, CONFIG_FFA=y,
  CONFIG_GICV3_ESPI=y, CONFIG_HAS_NS16550=y and CONFIG_HAS_PL011=y.
- Tested PL011 and NS16550 on QEMU with GICv3 and UEFI/ACPI.
  Tested each driver with a valid IRQ and with IRQ 1024 in SPCR.
- All four tests passed. With IRQ 1024, irq_set_type() returned
  -EINVAL, the driver used IRQ 0 and printed a warning.
  Console output kept working through Dom0 startup.

Testing of the v5 review changes, before the latest rebase and reordering:

- Arm64 build with CONFIG_NEW_VGIC=y, CONFIG_GICV2=y, and CONFIG_DEBUG=y.
- QEMU GICv2 guest tests: 10 checks passed, covering SPI delivery,
  enable/disable behavior, affinity changes, SGIs, and the virtual timer.

Testing from earlier revisions, before the final v5 edits:

- QEMU and FVP tests with CONFIG_GICV3_ESPI, CONFIG_HAS_ITS, and
  CONFIG_DEBUG enabled and disabled.
- Physical and virtual eSPI delivery on FVP, including delivery to both
  vCPUs and retriggering an active eSPI.
- Injected an unsupported physical eSPI and confirmed BUG_ON() in both
  debug and release builds.
- Arm64 builds with CONFIG_GICV3_ESPI and CONFIG_DEBUG enabled and disabled.
- Arm64 debug builds with CONFIG_ACPI=y and CONFIG_FFA=y, both with and
  without CONFIG_GICV3_ESPI.
- FVP Device Tree boot with 64 eSPIs; Linux dom0 started.
- QEMU virt UEFI/ACPI boot to a dom0 initramfs shell, covering the GTDT,
  GICv3 MADT, and PL011 SPCR paths.

Changes in v6:

- Keep the NS16550 and PL011 ACPI consoles available when
  irq_set_type() fails: emit a warning and fall back to polling.
- Adjust the FF-A error message formatting.

Changes in v5:

- Move the irq_set_type() error-handling patch to the beginning.
- Explain why an eSPI cannot be handled without compiled-in support.
- Make both espi_to_pending() helpers static inline and constify d.
- Add ASSERT_UNREACHABLE() to the disabled-eSPI stub.
- Preserve the unmapped LPI comment and clarify that eSPI lookup without
  support must not occur.
- Add the vgic_is_valid_line() guard to vgic_free_virq() in the new vGIC
  implementation and use the same helper in vgic_reserve_virq().

Changes in v4:

- Use BUG_ON() when the GIC reports an eSPI without compiled-in support.
- Return NULL for virtual eSPI pending lookups when support is disabled.
- Remove the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
- Share irq_has_desc() with the assertion in __irq_to_desc().
- Log invalid IRQs rejected by setup_irq().
- Document the compressed vIRQ allocation bitmap above the conversion
  helpers, with an ASCII diagram and a reference to struct vgic_dist.
- Clarify the is_espi() commit message and drop unrelated blank-line
  removals.
- Add Reviewed-by tags.

Changes in v3:

- Add a preparatory patch making is_espi() a pure range predicate and move
  configuration policy and debug checks to callers.
- Add the requested assertion before regular descriptor lookup.
- Avoid partial MADT and UART state updates after irq_set_type() failures.
- Apply cosmetic cleanups from review.

Changes in v2:

- Check descriptor ranges in irq_set_spi_type() and implemented GIC lines
  in setup_irq().
- Keep the is_espi() debug check when CONFIG_GICV3_ESPI is disabled.
- Remove a redundant CONFIG_GICV3_ESPI guard from the vGIC code.
- Add a patch checking irq_set_type() errors in the GTDT, MADT, SPCR, and
  FF-A paths.
- Target master instead of the 4.22 release.

Mykola Kvach (4):
  xen/arm: handle irq_set_type() failures
  xen/arm: make is_espi() a pure range predicate
  xen/arm: validate IRQs before descriptor lookup
  xen/arm: vgic: free eSPIs using the bitmap index

 xen/arch/arm/gic-v2.c          | 15 ++++---
 xen/arch/arm/gic-v3.c          | 15 ++++---
 xen/arch/arm/gic.c             |  6 +++
 xen/arch/arm/include/asm/irq.h | 11 ------
 xen/arch/arm/irq.c             | 28 +++++++++++--
 xen/arch/arm/tee/ffa_notif.c   | 10 ++++-
 xen/arch/arm/time.c            | 18 +++++++--
 xen/arch/arm/vgic.c            | 72 +++++++++++++++++++++++-----------
 xen/arch/arm/vgic/vgic.c       |  5 ++-
 xen/drivers/char/ns16550.c     |  8 +++-
 xen/drivers/char/pl011.c       | 12 +++++-
 11 files changed, 142 insertions(+), 58 deletions(-)

-- 
2.53.0


