Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E91606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=iF9kdxiv
Received: from list by lists.xenproject.org with outflank-mailman.1462589.1673650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNT-0008AM-I3; Tue, 27 Oct 2026 21:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462589.1673650; Tue, 27 Oct 2026 21:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNT-00089E-8r; Tue, 27 Oct 2026 21:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1462589;
 Tue, 27 Oct 2026 21:06:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNR-0007oW-2f
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNQ-0005yu-FU
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:36 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11248-e002-0a2a0a5209dd-0a2a450bd092-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:36 +0100
Received: from [40.107.130.126]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1125c-b7e8-0a2a450b0019-286b827eab37-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:36 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:34 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:34 +0000
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
 b=eHj/4o0jIJHUP83QMO5YQoUb73DuULqnMNi8QgG7o2VQEzkbQe25S7N7gTByztKNCiFBdCTD+t+FYVWaSpBj7qi5fxI9XBXnU7lbO6IxZwm7wxjiBy5HnmasEkkwp5AMvFXnO7iFBQiqhGiX/3Z0FN9jw5ks9TSjlrx54TjQvbqSRH6UYQ2FfNxXeZRNPz/4hGnrxVCs/uzfsxRT4xGF0VUVWJEyJeiLwqOPgj5IsnKncI0YSm3w4d+L/gqruKEtKavFQpOVZwu7iM03ZpAonLtWGYQmqoFATIpOfn8Wa8v0ip1l+iKlx55ZgzWy1SqA7ejVddzSOc1uiiRImQ+/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT5GCqDmrl768f5ZphGBuN37AxCJCJjQBQVm+/ort/M=;
 b=Y2+A/K0iaOtDoNOh2O4n7+J/2brIAhZwAWxNjF3yWX8360rxzZBAjU12O9Io0V6D2gXlTFFpnSTOqb1cAsa8c/pK2KoPsMH6OIAs/Jh+3vT+07JqLPiry8ggTJPeSjTLL75pcTD9PTwPwU55sWxivSVDoFjhHjA8nhemT0D3yLnv6vjKH/eTmVSZIDCaYdQAoemCPcnoElTOlLhEjoHOCqQFYE0CIzseyEj2mHllFhEpJDbEVPW6phFVqNmv8d9nJw1dGV+zZKo2SLCUnzJReswRUoRwnMR9SlOqHvtHiedAljNnwIUgwBmWq8Sdghx9OCIEqwNAHCHMwMQBSqEIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT5GCqDmrl768f5ZphGBuN37AxCJCJjQBQVm+/ort/M=;
 b=iF9kdxivMThtNANNQuRz8hOzR5J2h1siffzzdprb7YztVrzvBfBpyTlC0Y231JSGoUdVp2ujiMftB9U9Mn8p+7W/7VmWWlp4908nbLK+BU2UJTpqj9CjRuaaGu86bmYzO75Vs5dDH2ae48h0oY/hJemTOwTDeBIX/SBLb4Da3cKFMDzw2u0AQszj+DkwrUBjS5C0DW9du9G+jop5JnWFCI2yXUtr9/Ko1wd8uUIOO/PZUxs7VAjOmDoLtdoIqpsYOV0HqWup+BcsUSMwlCCcM4fBvZ9QjttTBdiJg79cvEYBTUPzX314NhCcAB682MDlZdwVRXvmRh9PkS20VQoUNQ==
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
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v13 13/14] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Date: Tue, 27 Oct 2026 23:06:02 +0200
Message-ID: <815a067a28bdc1db079cc3ad068e3ef74b7afe5c.1793129971.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e55ede5-0b4d-429d-7a5f-08df346e2eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261026121527099003|261022075727099003|11063799006|56012099006|261009223027099003|261009220027099003|261009221727099003|261021123027099003|261009221227099003|261021121427099003|261009223327099003|261022105027099003|22082099003|18002099003|6133799003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	ygahDFycbQFybVG1kS25H67pKEM/YjVxg5i8zFz1XvYu1A0e9PDWWyd6NKR9HYWgXXufrZ5vgkK20wWBQJ1rmWz1aDnvUNHS6Yv3w5C6XyX1Hw2EU1kLh9pt6H8eN+VAvFWMKL2B6OXn9JGSp0PdfpWdBq98jKedVM7N5A76DNvsTg19xylbnDqFj1yYRID87WF+l2X1KoWowJdU9+KJO2jCR911vIGHr1rS4wwNBkyePY5rFeJCJC57Ax4psJyOdjKYkK3Uzqj29NThkaGGld7IquJHhyX5AiGwQvFONmk2mZLfLrS6crZn+wmTk0M6QidTeuNiI/Nxts5CTA9PSjIEkYsQ/1zIxuMy/o5V7u3cFR0MDI89gcnsQHO01VueSqR+vgYbfP30REql/GdtwPCRnIChUY49SbrDMAUZx3IspTfor/S5Xx7xCL5VW5hbELpDXpa1lOasf2XzJFuH3jcDwq/E2DUbJvTcJe7v2yt792JOoLiXL0+Sc5JKPjJiQpcMr6ZOc+pwPF9G5vm3/Hi6g2F58IidBLlT8dzyoye34G5hhiRDukstPaPGcrAWEFInB0PX3lUaNq+/G3m5tYUmi7cYh3Xzsv7lwdTANWi73ZYY9MRKAJR/lkS55lm31gSbOyTiU0kRMoOOPwJLJCX9v9SNu+kBlhjSfh8GqfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261026121527099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261009220027099003)(261009221727099003)(261021123027099003)(261009221227099003)(261021121427099003)(261009223327099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yD/406x+/2FaDzjzHES+MirkmpirrMpHkBe33T8xIQ2fhMlYV/q7t5LeZbvC?=
 =?us-ascii?Q?UXZh9CoAzxoRTfRuzY5oDDMop3o7NcDyIz89k8/V8F4dEa0U7sys2nXa/ANa?=
 =?us-ascii?Q?yUfPaoJOGl8EtR5H3OsyNmEVhJArofOtw9TNPPu+tgnd34ojmVnh0pDhkH2D?=
 =?us-ascii?Q?VErEMLIxVRvqyw3fJmUMpXvxai7GHPURVNgDue08nJNa3HeoJTPu5umHwRCp?=
 =?us-ascii?Q?yCxAR7Wtj2SjCXBBqa5DZT+VkycRievxi18TaCRej6c/pwJwsgnhlsmzW6Kl?=
 =?us-ascii?Q?D6CQ/JzU6K57l3/Iw4V+k2yeXVgjRAwK1dnzHYUBMmRv37iYenEhTng0w8Vh?=
 =?us-ascii?Q?gdtD1uAKpFqFDk33KC6AEbQT7i4OjS4Il9hIdNG5k9BUQmhq0L8Xc/AczFP/?=
 =?us-ascii?Q?9pGe5MgMAA3y+Un+8nkYdiYlynIjRzpmsA0JtWYr7akYsD222xz38/vBM15c?=
 =?us-ascii?Q?V1Eh2+W7Xl1/aJxGIE0yznBjZYdCMTio7UOtwhA6bB4TLDiSA1qV3qoYPEPM?=
 =?us-ascii?Q?ezORP6vimaZJYYs/sJthMXJ296MGkmROU7Mhq445AxgHVIaShx5nDr7vxQkp?=
 =?us-ascii?Q?GG/XEQcasJ8Rogoni5Td25X2f3fmjcEw+vtaM2nHnFv4TxYBz0WLRlK4wfnE?=
 =?us-ascii?Q?WgtlXX36mkaAtllsO8OdH+hY64FZyCPBRU3wlVL+1jsNxVM5CO99VNnz5yXG?=
 =?us-ascii?Q?zEDkf0CpoQkwmZeJyaHGNyNvOykbVnSXj6eqEwXstX+NYFZNGYiezdMTb79S?=
 =?us-ascii?Q?8zs+ebb8VgQOznUo4N3qd/9Pym/KNBBADT7N9CPsfey9D2uKPuytBHYmdv+4?=
 =?us-ascii?Q?LTuOHSy95p3Ms1SbBPg3dmv6v99GeVmWCHr/MVNMioB3C8YVbkyxZZcrgwGp?=
 =?us-ascii?Q?zkSHE5zvqZEXkDxdPLyMoTdxUecKB7HlKUwqx5PgC1Agyq6Sby+djq5NH4Re?=
 =?us-ascii?Q?JLjC9FFrLrv+BQQvj6oSP0pWkauj4eOT+o8Nr9KD4k2FSkKDnRVWLQAp1QNY?=
 =?us-ascii?Q?o9UbrYeL9YLHVyYvxVf/Jvgja6i9IgC6q8BuGcLf71WCulOkHjT3t5CWF1Lq?=
 =?us-ascii?Q?F+8SgyFXoWYxpd87XAWINfh3EO4j+J7/kLVpYKo8xBGDMtW6jxHY4eHgN8uu?=
 =?us-ascii?Q?5YGCqebwvX6RtiwfwK2vUmVuyv+OqDTJPla1F0mKz/SZL5m3s76bUT2+/1zh?=
 =?us-ascii?Q?D8i2w3g2Fv6i5ReNP+I2h5A4Hprt8ldHFw425LlGbzIuub6SEeUK0jJnfENY?=
 =?us-ascii?Q?2JTU+tG3Por2YBwwYq8ul3ojoS0WXbusfxM8kur4JDWBXFcJRedomBeR7nwY?=
 =?us-ascii?Q?gOSVgjy2H3H6KR/BRhqHfZ8FxqRfZ2/8FwzsI6jgnjdze7DSYUlB/PvSjl0d?=
 =?us-ascii?Q?RzisT7ob2zA1958WYlfaMmlq11LYUWwqoX5mfEL6ZKY5GJRQE241e7dRNmct?=
 =?us-ascii?Q?FqJ38H8DbgeWGccn4c7gXVnV1tC21YFCt5+nNrf9JH21Oxr8bwC65GQbyyTf?=
 =?us-ascii?Q?8aujvLpCnvAZXeFW3qjZEbfegQxQTlVjoiksKglJCBi6xx6BCZE4eLsdw6+1?=
 =?us-ascii?Q?gxlGCDu1RaH17rPL9CYVhnlJEC/XT0ghHKzORzpyFYlNCaji/QsQL2vjPjxy?=
 =?us-ascii?Q?UthNZW5CMYnDmHr8boZnaT28QwBlew9u1TgcY7CDJwdtTuO0QWc/bYRrBSJF?=
 =?us-ascii?Q?nZZmo1J6mssDpLPc0hnUDOSMLce4ahKdBGhCgb6lNlo0NjicevpbL3/5pRnW?=
 =?us-ascii?Q?DM6oHsrGwQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e55ede5-0b4d-429d-7a5f-08df346e2eb1
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:34.5407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovWMaKePMFejyf9be3rdGAW2uTsFnUOUB18VVcHTjEQRtl22r/KEus+tSvAflW3fw5CnEmwWEyZPmMoMBC/48Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-42698a/1793135196-19EC69EA-9E446406/0/0
X-purgate-type: clean
X-purgate-size: 19873
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
capability for platforms where the hardware domain can be parked with
SHUTDOWN_suspend without calling hwdom_shutdown().

Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
non-control domains, including the hardware domain when it is not acting
as a control domain, the call is handled as a guest/domain suspend request
and parks the domain in SHUTDOWN_suspend.

A non-control domain can suspend only while a control domain exists to
resume it using XEN_DOMCTL_resumedomain. Return PSCI_DENIED otherwise,
including in a dom0less setup with no control domain.

Control domains need additional sequencing because their SYSTEM_SUSPEND
request is used to coordinate host-wide suspend. A non-last awake control
domain may be parked in SHUTDOWN_suspend without requiring the host
suspend path to be available. The last awake control domain is treated as
the point where the request becomes a host-suspend request, and it may
only proceed when all non-control domains are already in SHUTDOWN_suspend
and the host suspend path is available.

Keep the control-domain sequencing and domain-readiness checks out of
PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
vPSCI and report attempt-time policy failures as PSCI_DENIED.

Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
so that SHUTDOWN_suspend from the hardware domain can be treated as a
domain suspend state rather than as a hardware-domain initiated host
shutdown. This does not by itself imply that host-wide suspend is
available.

Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
capability with runtime blockers reported by Xen-owned subsystems. Add
runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
paths lacking suspend/resume support. These blockers are runtime based,
so they only apply to drivers or paths that Xen actually uses on the
platform. For SMMUv3, the blocker applies only when Xen actually uses the
MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
registers yet.

Block host suspend when Xen uses an R-Car Gen4 PCIe controller. The
PCIe BDF-to-OSID registers are not saved and restored yet. This does
not affect normal IPMMU use or guest-only suspend.

Add a struct domain forward declaration to xen/suspend.h so the generic
header can expose arch_domain_resume() without requiring a full domain.h
include.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V13:
- Block host suspend when Xen uses an R-Car Gen4 PCIe controller, since
  PCIe OSID state is not restored.
- Deny guest SYSTEM_SUSPEND when no control domain exists to resume it.
- Split the long suspend-state check across two lines.

Changes in V12:
- handle missing is_shut_down, change checking to call of
  domain_shutdown_completed

Changes in V11:
- Mark host_system_suspend_runtime_allowed as __ro_after_init.
- Avoid printing the SMMUv3 MSI IRQ host suspend blocker more than once
  when multiple SMMUv3 instances use MSIs.
- Wrap the Arm IOMMU host suspend blocker in CONFIG_SYSTEM_SUSPEND to make
  its policy-only use explicit.

Changes in V10:
- Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
  stable once SYSTEM_SUSPEND is advertised.
- Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
  control domain.
- Mark serial_suspend_available as __ro_after_init.
- Mention the struct domain forward declaration added to xen/suspend.h.

Changes in V9:
- Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
  so that hardware-domain SHUTDOWN_suspend support is not tied to
  host-wide system suspend availability.
- Add runtime host suspend blockers for Xen-owned subsystems lacking
  suspend/resume support.
- Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
  control-domain sequencing in the call handler.
---
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/gic.c                    |   6 ++
 xen/arch/arm/include/asm/psci.h       |   3 +
 xen/arch/arm/include/asm/suspend.h    |  10 ++-
 xen/arch/arm/pci/pci-host-rcar4.c     |   4 +
 xen/arch/arm/psci.c                   |   7 ++
 xen/arch/arm/suspend.c                |  40 +++++++++
 xen/arch/arm/vpsci.c                  | 119 +++++++++++++++++++++++---
 xen/common/Kconfig                    |   3 +
 xen/common/domain.c                   |   7 +-
 xen/drivers/char/serial.c             |  12 +++
 xen/drivers/passthrough/arm/iommu.c   |   6 ++
 xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
 xen/include/xen/serial.h              |   1 +
 xen/include/xen/suspend.h             |   2 +
 15 files changed, 217 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b9c5c40678..fd5f0ddb17 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_SHARED_INFO
 	select HAS_STACK_PROTECTOR
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 30087b5938..3fb0a56d94 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -26,6 +26,7 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/gic.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/acpi.h>
 
@@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(void)
 void register_gic_ops(const struct gic_hw_operations *ops)
 {
     gic_hw_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("GIC driver lacks suspend support");
+#endif
 }
 
 static void clear_cpu_lr_mask(void)
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index bb3c73496e..142fa1bfe5 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
 int call_psci_system_suspend(void);
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void);
+#endif
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index c848fc6340..50dc6e9fdf 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
 
 int prepare_resume_ctx(void);
 void hyp_resume(void);
-#endif /* CONFIG_SYSTEM_SUSPEND */
+bool host_system_suspend_allowed(void);
+void host_system_suspend_disable(const char *reason);
+
+#else /* !CONFIG_SYSTEM_SUSPEND */
+
+static inline bool host_system_suspend_allowed(void) { return false; }
+static inline void host_system_suspend_disable(const char *reason) {}
+
+#endif
 
 #endif /* ARM_SUSPEND_H */
 
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-rcar4.c
index e1e8eb0ee1..0d85ccf4f5 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -11,6 +11,7 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/pci.h>
+#include <asm/suspend.h>
 
 #include "pci-designware.h"
 #include "pci-host-rcar4.h"
@@ -221,6 +222,9 @@ static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
     dw_pcie_set_priv(bridge, priv);
     dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
 
+    host_system_suspend_disable(
+        "R-Car Gen4 PCIe OSID state is not restored");
+
     return 0;
 err:
     xfree(priv);
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 4d502216ce..187cad44d5 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void)
+{
+    return has_psci_system_suspend;
+}
+#endif
+
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 6ea4a0f9cc..c7c26bcf03 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,49 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/lib.h>
+#include <xen/serial.h>
+
 struct resume_cpu_context resume_cpu_context;
 
+/*
+ * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
+ * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
+ * suspend/resume path.
+ *
+ * This gate is checked only when the last awake control domain attempts to
+ * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
+ */
+static bool __ro_after_init host_system_suspend_runtime_allowed = true;
+
+static bool host_serial_suspend_allowed(void)
+{
+    if ( serial_suspend_supported() )
+        return true;
+
+    printk_once(XENLOG_INFO
+                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
+
+    return false;
+}
+
+bool host_system_suspend_allowed(void)
+{
+    return psci_system_suspend_allowed() &&
+           host_serial_suspend_allowed() &&
+           host_system_suspend_runtime_allowed;
+}
+
+void host_system_suspend_disable(const char *reason)
+{
+    host_system_suspend_runtime_allowed = false;
+
+    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
+           reason ? reason : "unsupported suspend/resume path");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index ac6af6118f..0131c297dd 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -5,6 +5,7 @@
 
 #include <asm/current.h>
 #include <asm/domain.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -219,6 +220,94 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+/*
+ * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend transition,
+ * so multiple control domains cannot all observe each other as still awake.
+ */
+static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
+
+static bool domain_in_suspend_state(struct domain *d)
+{
+    bool suspended;
+
+    spin_lock(&d->shutdown_lock);
+    suspended = domain_shutdown_completed(d) &&
+                (d->shutdown_code == SHUTDOWN_suspend);
+    spin_unlock(&d->shutdown_lock);
+
+    return suspended;
+}
+
+static int32_t domain_psci_system_suspend_policy(struct domain *d)
+{
+    struct domain *other;
+    bool last_awake_control_domain = true;
+    bool awake_non_control_domain = false;
+    bool has_control_domain = is_control_domain(d);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( other )
+    {
+        bool suspended;
+
+        if ( other == d )
+            continue;
+
+        if ( is_control_domain(other) )
+            has_control_domain = true;
+
+        suspended = domain_in_suspend_state(other);
+        if ( suspended )
+            continue;
+
+        if ( is_control_domain(other) )
+        {
+            last_awake_control_domain = false;
+            break;
+        }
+
+        awake_non_control_domain = true;
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    /* Non-control domains need a control domain to resume them. */
+    if ( !is_control_domain(d) )
+        return has_control_domain ? 0 : PSCI_DENIED;
+
+    /*
+     * Another control domain is still awake. This request is only the first
+     * phase of the sequencing: park this control domain and leave the host
+     * running. Host-wide suspend gates must not block this intermediate state.
+     */
+    if ( !last_awake_control_domain )
+        return 0;
+
+    /*
+     * This is the last awake control domain. It must not be parked unless the
+     * request can proceed as a host-suspend request; otherwise Xen would lose
+     * the last domain that can coordinate the system suspend.
+     */
+    if ( awake_non_control_domain )
+    {
+        printk(XENLOG_DEBUG
+               "SYSTEM_SUSPEND denied for %pd: non-control domains awake\n",
+               d);
+        return PSCI_DENIED;
+    }
+
+    /*
+     * Host-wide gates are relevant only for the last-control-domain case. They
+     * must not block parking of a non-last control domain, but they must deny
+     * the last control domain when host suspend is not currently available.
+     */
+    if ( !host_system_suspend_allowed() )
+        return PSCI_DENIED;
+
+    return 0;
+}
+
 static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 {
     int32_t rc;
@@ -232,10 +321,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
-    if ( is_hardware_domain(d) )
-        return PSCI_NOT_SUPPORTED;
-
     /* Ensure that all CPUs other than the calling one are offline */
     domain_lock(d);
     for_each_vcpu ( d, v )
@@ -252,16 +337,29 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( rc )
         return PSCI_DENIED;
 
-    rc = domain_shutdown(d, SHUTDOWN_suspend);
+    spin_lock(&vpsci_system_suspend_lock);
+
+    rc = domain_psci_system_suspend_policy(d);
+    if ( !rc )
+    {
+        rc = domain_shutdown(d, SHUTDOWN_suspend);
+        if ( rc )
+            rc = PSCI_DENIED;
+        else
+        {
+            rctx->ctxt = ctxt;
+            rctx->wake_cpu = current;
+        }
+    }
+
+    spin_unlock(&vpsci_system_suspend_lock);
+
     if ( rc )
     {
         free_vcpu_guest_context(ctxt);
-        return PSCI_DENIED;
+        return rc;
     }
 
-    rctx->ctxt = ctxt;
-    rctx->wake_cpu = current;
-
     gprintk(XENLOG_DEBUG,
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
@@ -287,10 +385,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
     case ARM_SMCCC_VERSION_FID:
-        return 0;
     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
-        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
+        return 0;
     default:
         return PSCI_NOT_SUPPORTED;
     }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f..0a3e5d8a93 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_HWDOM_SYSTEM_SUSPEND
+	bool
+
 config HAS_IOPORTS
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index b41be89cd0..eac94cb888 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1377,6 +1377,11 @@ void __domain_crash(struct domain *d)
     domain_shutdown(d, SHUTDOWN_crash);
 }
 
+static inline bool want_hwdom_shutdown(uint8_t reason)
+{
+    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
+           reason != SHUTDOWN_suspend;
+}
 
 int domain_shutdown(struct domain *d, u8 reason)
 {
@@ -1393,7 +1398,7 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
         hwdom_shutdown(reason);
 
     if ( domain_shutting_down(d) )
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index cf0abf1893..1cdf4968ac 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
 
 #ifdef CONFIG_SYSTEM_SUSPEND
 
+static bool __ro_after_init serial_suspend_available = true;
+
 void serial_suspend(void)
 {
     int i;
@@ -506,6 +508,11 @@ void serial_resume(void)
             com[i].driver->resume(&com[i]);
 }
 
+bool serial_suspend_supported(void)
+{
+    return serial_suspend_available;
+}
+
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
 void __init serial_register_uart(int idx, struct uart_driver *driver,
@@ -514,6 +521,11 @@ void __init serial_register_uart(int idx, struct uart_driver *driver,
     /* Store UART-specific info. */
     com[idx].driver = driver;
     com[idx].uart   = uart;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !driver->suspend || !driver->resume )
+        serial_suspend_available = false;
+#endif
 }
 
 void __init serial_async_transmit(struct serial_port *port)
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index 100545e23f..461e01703e 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/suspend.h>
 
 #include <asm/device.h>
 
@@ -46,6 +47,11 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
     }
 
     iommu_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("IOMMU driver lacks suspend support");
+#endif
 }
 
 int __init iommu_hardware_setup(void)
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 58530ef2d1..247c6156cc 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -91,6 +91,7 @@
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
+#include <asm/suspend.h>
 
 #include "smmu-v3.h"
 
@@ -1888,6 +1889,7 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
+	static bool __ro_after_init host_suspend_blocked_by_msi;
 	struct msi_desc *desc;
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
 	struct device *dev = smmu->dev;
@@ -1926,6 +1928,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 		}
 	}
 
+	if ( !host_suspend_blocked_by_msi )
+	{
+		host_suspend_blocked_by_msi = true;
+		host_system_suspend_disable(
+			"SMMUv3 MSI IRQ path is unsupported for host suspend");
+	}
+
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, arm_smmu_free_msis, dev);
 }
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 3a71da767d..4c6f891221 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
 /* Serial suspend/resume. */
 void serial_suspend(void);
 void serial_resume(void);
+bool serial_suspend_supported(void);
 #endif
 
 /*
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
index 6f94fd53b0..a941331035 100644
--- a/xen/include/xen/suspend.h
+++ b/xen/include/xen/suspend.h
@@ -6,6 +6,8 @@
 #if __has_include(<asm/suspend.h>)
 #include <asm/suspend.h>
 #else
+struct domain;
+
 static inline void arch_domain_resume(struct domain *d) {}
 #endif
 
-- 
2.53.0


