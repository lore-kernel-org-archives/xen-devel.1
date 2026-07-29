Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC9C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 17:48:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376528.1623208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp8Ng-000645-RD; Wed, 29 Jul 2026 17:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376528.1623208; Wed, 29 Jul 2026 17:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp8Ng-00063y-OF; Wed, 29 Jul 2026 17:47:48 +0000
Received: by outflank-mailman (input) for mailman id 1376528;
 Wed, 29 Jul 2026 17:47:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wp8Nd-00063q-5N
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 17:47:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp8Nc-000wuL-IN
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 19:47:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6a3ca3-e002-0a2a0a5209dd-0a2a4503edbc-10
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 19:47:44 +0200
Received: from [52.101.125.133]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6a3cbd-fae8-0a2a45030019-34657d8569ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 19:47:43 +0200
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:363::12)
 by OS7P286MB8085.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:4c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 17:47:38 +0000
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f]) by TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f%3]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 17:47:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNINvfTuqy31CPS2l+oKCnEPmxyyod8AQKNsBD/hH0rzvP/LuSqzcG7gMZg/FgcqghRyNUXqdKE/qklg/iFbWcBfT3CJRoxt4D4eZ1guGPPfD4lipOqnmZzQm2eBGL4whuYRSP/quTv+15YiWl0FA5GOQCBtrdSBu4CwVM+TP27Jx6PEhm4j/ct9MEpLtr8/bO7CF8nqfWwL4lJZONBnYMfIpxLjXUiPgc4UTfhae3QcS0405poY4F4a38ZTgyoFlthfWyANbHAZ/5U9uRFNf2JIF1+0hnEkKyzjs0u14plllt5GeBcd1mGAPBHmADB+aQbqAsTjULx+qyBL2xk1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaqtcshLVbhaD1dcz/UCxo6ZgW22nISirEcg/cTrN4M=;
 b=fOgaNcVfvKXOGsG1B/+wKV+07nq0yDWj251uvP1KfEJnEW7SQ78isxmYcyNPovaEc4qvoJUdrhBMpHIX7JOUeiBDPbaZIWrmLNkQo2i/iggBa1fVaywr1CcxE+9B6iJ//muAiiU7GCiyaExGfhnA3epGtz8B+Zo/U/lnIQWZvCEBWXIcA2i0R26cB6UwpFKTcFoeipUtkhGZnjtpJYBHVIty8cS1XpX8HcDegnKQPeRldjEIMkTYJFBl6HtM5+5gwOBKWuF1uvGGNGwa7Vfr7hzbsHrrsTkKRlo2SU9YaabKiDpKpUEvy81edjdtD3fDY3Jv/efbpdsGHNq/XsoRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaqtcshLVbhaD1dcz/UCxo6ZgW22nISirEcg/cTrN4M=;
 b=VAcCY21E5q6qYXkUO1zNZne22q4qUd6o6VRuUtGINyEjQax/Kj4WVhsYXsAS5Gdcc4QuOlv5cRBHWIyc1AHGYCwBAvIodDhX7a1cvSUaCQk+SgkIiOcrTTvB9HMY1njocYu11qKOSTWsxm455R3VWaQrHOnd41ltFllvg2jO7+I=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU
 topology support for ACPI and DT
Thread-Topic: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU
 topology support for ACPI and DT
Thread-Index: AQHdHk7kiFOoxTQzWEaKzsYc0MFEnraExJPg
Date: Wed, 29 Jul 2026 17:47:38 +0000
Message-ID:
 <TY7P286MB72344CE250A2232A4E3C06AE82CA2@TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM>
References: <20260728050642.411240-1-taka@valinux.co.jp>
In-Reply-To: <20260728050642.411240-1-taka@valinux.co.jp>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P286MB7234:EE_|OS7P286MB8085:EE_
x-ms-office365-filtering-correlation-id: f3a8df4e-d591-4142-06e5-08deed997b01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|29003799003|6133799003|11146099003|25016099003|56012099006|10067099003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info:
 84eITXfIYjEu+rESgODDHRQeGZsdKHDM1vl1tckRiN4csep0TxJFaHhxJrkajQkeBURu3iQ+0FdA4qA0RNHEJo9xdIAzQHDtHBR00wYx5dsqpY+prt9QkjX1eSUxDUGyy/q6hRmpfd+oz60Wr6rZw24nbx9khL4lEn4q8P4+MWYxNLRzDtPG1Hmn710+aspapTSj8nGaMaopLt0awjuyrZsOCiqIPDUbTBUYZr/N8+020KQu2BpGZgMOip/SpDBARGA1WowWt8CAW90+F3lu0eP8k+ynznVxtw4l9TkQ35iS4jOMF6XmYVKJcVTXAG9igRBbVwN2IqAg1z1DARMLLs5RtzFgwCuP9OkNGXoAVkJHfS+pvyeGhNne0bABybwnFpRY7VpY7IXkfV4BkCN8VmCwo6yxe/LtPJRkTXgnTPkqw1K+C/JTnFCKLEdhu4YZGGneaIolNl+APKqH0taIlGpihOGbo4Ks/XFsdTlhL1d2jMOBx2in7ZRlovUajXaZA0PHY80k7xNrWoF1YGsyDyztR0rX4vZKHDLty+9poJY+kE5B9fv+nzAlyzElj6HXQGu0ecMq/xHdE3duBI7ykCW5E9SJ2Gwk94vSEGqNQ45PJaAsh0GWX1EbafpcbZW4Cwhiv+D/j7RfDxUyxkTmJUR7YMdMcS2pReKVQZvk/Xc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(29003799003)(6133799003)(11146099003)(25016099003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QjdYoyg74jMcb/m9J1YUcA6/K/iWDndKH5MvTQHP2lJ57GP3hGiMmhpO43bR?=
 =?us-ascii?Q?4Hkc46UhP8/uADjjUBNKhwthUZgRsJCtexin07I9vPdoPkQ7YWJfMgJDA9zO?=
 =?us-ascii?Q?gYJTYGPdVzvsMe2BQG/EckBA3bLVXyQgjHnnPI3XPX3g7okcwfVkRl0Par3A?=
 =?us-ascii?Q?00zLy3wkjLPmZGPtfQBYXzQNkotpaALkoZ3mlqlYTcYHoDjC255CwJ7owG2K?=
 =?us-ascii?Q?n7Qg5n8N1vzIBpwNHKNAzmoMvMwqe+sK96/sKq62NyeA8SvP0iVVFCT1I3Zt?=
 =?us-ascii?Q?Qy8Po0xtaLnIln4IY3Z3q2vPP+ZBZ85oRLsyQQeURjvZ1tbOTpbcD/i3+LVo?=
 =?us-ascii?Q?Mi+mlK2DX1gqBR4YJPCerNl45U7uUeU2Nzr7GrthWRRVwmIOQ2PEEEMN2deX?=
 =?us-ascii?Q?a9iWmnQduAP3oxVX8JBFq3lokiElWWIcth6Hs4u9QvwQVTaR7i3GyZuEzLQa?=
 =?us-ascii?Q?pAN+D6Bbyazff+b5rV47OtGHx8cljo06MAT/GgrJ699Qq4mtndx7CYC5lDcA?=
 =?us-ascii?Q?KI67JVypTh2iYiQ/xXquHGUfdPXrDXGjjyqEWDushnm/mJ3mBYO33eKi3EFy?=
 =?us-ascii?Q?rc+/uLVD3b0xugezyvBBqAsdKN1Vgnfxs4IQ5osteXL1aRrvPbh5jMiFzWKb?=
 =?us-ascii?Q?H3i2eqTslyMNsItJKiwsmID2F/6dDYQmuP8rDIJggrWqMCAHZfMq9bRZQnRb?=
 =?us-ascii?Q?0U07zssL0PG1PpmKa8qgcht+ja5znF0D+O5k1vLID6gXLRbqpTf6WrqQGj/T?=
 =?us-ascii?Q?CYyrbW5OhTJ21DyjGz0jSEcSg35R3vvIpIs9GMGKNYasp9BnfqFgWYS+oBQ+?=
 =?us-ascii?Q?v2xP5mI9QissTbUfGQhYjWuWkSi5/RfJkCkcdEIR56WaOu4WUVqR/VPjZxL4?=
 =?us-ascii?Q?e8QC9QGHUk3d1C9v20uyLPLj71pk9mdLL+s1bvmPejr6DtceoK6p4jYiVaXI?=
 =?us-ascii?Q?fh/cM3HzXWrNrXuO78J7gelHauadh0iiupss+50vM9vI2HJ4RrNMY6KBnhjn?=
 =?us-ascii?Q?zIzy9Q3zHiswuPX+OCbUDNnf+c3RRMsqbiEQbHU/RbmFmj+6/lEjZA4FWeWK?=
 =?us-ascii?Q?+CSDcNV6fOYAINIpx37K2tV2xeQZC4k1QwsyRArGL1Ohm+1rXHi9CAgcVpPB?=
 =?us-ascii?Q?F2BxuJ4XQO1xorJ2/Qak3OBP+lHZKmPXRmiZhTM+i6aQmVkUy1kz2zZs2vQU?=
 =?us-ascii?Q?n53mqQCSRwG9LA6zFF3Dah5Xtu2H0pMF8pT3bfuRVjR3+NEl8L6IvJmDmgCk?=
 =?us-ascii?Q?QwgtUZ/WkWNeHhThDYtzGcbk0uWyjKM5704bFtK21MuZHwySj0yP3R44yrRm?=
 =?us-ascii?Q?kgOj177sQtrKQbFvgNwsCdPlwSgHZgsQtsCo3ZTywuKoHkMGVdQPbm58L1j4?=
 =?us-ascii?Q?XRkjPdgCmQAgoD3h2N06q8d2M3pAbgmgtvOV331aYiU5sYNl8HkZwNxKfVrc?=
 =?us-ascii?Q?ATXB16u+TR9UkZiPORri76D4jsl41brYl4iuM1YaVfmadq6Pj0shkoi9bALw?=
 =?us-ascii?Q?ISdYMAPH9wtVHFTmGU5EgyFg2RlwvU15mtG21Mvhu2w/25nOMXOxubQqybHX?=
 =?us-ascii?Q?ZWQefU7Kf4V7muRAkvrAheyBiBeV49u58lh3v0U8/K+qowGUgs062uuhZMHB?=
 =?us-ascii?Q?v/+1mbdfAdtqKaZhz3brj4N2VodndUSAJXf0fgsHZngCX1PXNLpAgfC/mREv?=
 =?us-ascii?Q?Bhz+wjBFiCGlRcYKBjN+JGkbUJYHGwLKPyvsBy8jKfZ5F3sM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a8df4e-d591-4142-06e5-08deed997b01
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 17:47:38.2105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9vQ2SLIdXJaTf3TaS2k84EARQuSO3GhmkDy7iXsdCuHSijhlmhUf1kjP9NVFKifu0/mUpw7kaW+vaC2tAyzniA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB8085
X-purgate-ID: tlsNG-33051d/1785347264-7448C4E9-A1EE3AC3/0/0
X-purgate-type: clean
X-purgate-size: 12767

Hi Stefano, Julien, Bertrand and Michal,

When you have a moment, could you please taka a look at the following
series and give me your feedbak.

Link to v9 series: https://old-list-archives.xenproject.org/archives/html/x=
en-devel/2026-07/msg01208.html

Thanks,
Hirokazu Takahashi.

> -----Original Message-----
> From: Hirokazu Takahashi <taka@valinux.co.jp>
> Sent: Tuesday, July 28, 2026 2:07 PM
> To: xen-devel@lists.xenproject.org
> Cc: Mykyta_Poturai@epam.com; Hirokazu Takahashi <taka@valinux.co.jp>
> Subject: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU topol=
ogy
> support for ACPI and DT
>=20
> Hello,
>=20
> This patch series integrates CPU topology discovery into the Xen hypervis=
or
> for both ACPI and Device Tree platforms.
>=20
> Changes in v9:
>  - Add bounds checking for the number of private resources in the PPTT
>    processor table.
>  - Verify the validity of entries when indexing into the map_cpu_acpiid t=
able.
>  - Coding style adjustments (following Xen standards):
>    * Place logical operators ('||', '&&') at the end of lines when splitt=
ing
>      multi-line conditions.
>    * Place arithmetic operators ('+', '-') at the end of lines when wrapp=
ing
>      long assignment statements.
>    * Enclose bitwise operations in parentheses within conditional express=
ions
>      that combine logical operators.
>    * Combine variable declaration and initialization where applicable.
>=20
> Changes in v8:
> - PPTT Table Validation & Hardening:
>   * Relaxed processor node length check to allow
>     proc->header.length >=3D table_size.
>   * Treated root nodes (nodes with parent =3D=3D 0) as equivalent to
>     ACPI_PPTT_PHYSICAL_PACKAGE nodes.
>=20
> - Build & Kconfig Adjustments:
>   * Removed leftovers of ACPI_CPU_TOPOLOGY definition from
>     xen/drivers/acpi/Kconfig.
>=20
> - Code Cleanups & Style Conformance:
>   * Moved INVALID_ACPIID definition to xen/acpi.h to make it available
>     cross-architecture.
>   * Removed ARM-specific references from comments in
>     architecture-agnostic code.
>   * Added explicit parentheses around bitwise operations in logical
>     expressions.
>   * Placed binary logical operators (||, &&) at the end of lines when
>     splitting conditional statements.
>   * Combined variable declarations and initializations where appropriate.
>   * Removed trailing full stops ('.') from printk log messages.
>   * Fixed printk format specifier mix-up.
>   * Explicitly included <xen/cpu-topology.h> in xen/common/cpu.c.
>=20
> Changes in v7:
> - PPTT Table Validation & Hardening:
>   * find_pptt_node(): Added leaf node verification (ACPI 6.3+).
>   * acpi_init_cpu_topology(): Added bounds checks to ensure proc->parent
>     validly references memory strictly inside the PPTT table bounds.
>   * Factored out shared table checking helper functions used by both
>     find_pptt_node() and acpi_init_cpu_topology().
>   * Added subtable alignment checks and strengthened processor structure
>     size validation.
>=20
> - Graceful Fallback & Allocation:
>   * Treated missing topology definitions as benign conditions.
>   * Used xvzalloc_array() for temporary memory allocations during
>     initialization.
>=20
> - Build & Kconfig Adjustments:
>   * Updated Kconfig to use "depends on UNSUPPORTED" instead of "if  UNSUP=
PORTED".
>=20
> - Code Cleanups & Style Conformance:
>   * Used designated initializers for structure data initializations.
>   * Consolidated topology helpers with IS_ENABLED().
>   * Removed redundant error checks and reduced unnecessary pointer casts.
>   * Switched type-based sizeof(type) to variable-based sizeof(*var).
>   * Added leading spaces before labels ( out:)
>=20
> Changes in v6:
>  - Renamed the series subject from "xen/arm: Device Tree based CPU topolo=
gy
>    support" to reflect the inclusion of generic ACPI PPTT topology parsin=
g.
>=20
>  - Infrastructure & Kconfig:
>    * Updated Kconfig to make both DT_CPU_TOPOLOGY and ACPI_CPU_TOPOLOGY
>      select GENERIC_CPU_TOPOLOGY.
>    * Ensured that if topology parsing from either DT or ACPI PPTT fails, =
the
>      CPU topology table is freed to fall back to the non-topology behavio=
r.
>    * Moved the `cpu_topology` definition to `cpu.c` so that variables and
>      functions in `cpu-topology.c` can be completely freed after Xen init=
.
>=20
>  - Topology Logic (DT / ACPI):
>    * Set the cluster ID to 0 when the cluster definition is missing from =
the
>      Device Tree `cpu-map` node.
>    * Handled cases where cluster info is missing upon reaching a physical
>      package in the PPTT parser by assuming one cluster per socket.
>    * Split out the import of ACPI PPTT definitions from the Linux kernel
>      (including unused definitions) into a separate standalone patch.
>=20
>  - Robustness & Safety:
>    * Avoided assuming `np` becomes NULL after exiting `dt_for_each_child_=
node()`;
>      explicitly return NULL instead.
>    * Added bounds-checking `ASSERT`s for values returned by `cpumask_firs=
t()`.
>    * Added explicit braces `{}` to nested `if` statements to clarify `els=
e`
>      scoping and maintain style symmetry.
>    * Enforced an upper limit on the PPTT parsing loop iterations to preve=
nt
>      infinite loops on corrupted tables.
>    * Treat the absence of a physical package node definition in PPTT as a
>      parsing error.
>=20
>  - Optimization & Efficiency:
>    * Optimized `setup_siblings_masks()` to eliminate redundant loop itera=
tions.
>    * Dynamically allocate the temporary data storage used during ACPI PPT=
T
>      parsing.
>=20
>  - Code Cleanup & Refactoring:
>    * Replaced the `invalid_topo_id` constant with the `INVALID_TOPO_ID` m=
acro.
>    * Initialized all members of the `cpu_map` array with `INVALID_TOPO_ID=
`.
>    * Added a blank line between `<xen/...>` and `<asm/...>` header groups=
.
>    * Reordered `#ifdef` blocks to prioritize generic logic over architect=
ure-
>      specific ones.
>    * Corrected code indentation.
>    * Applied the `static` specifier to file-local data structures and fun=
ctions.
>    * Minimized the use of fixed-width `uint32_t` types, restricting its u=
se only
>      where strictly required by the 32-bit ACPI ID specification.
>    * Declared `map_cpu_acpiid[]` as static and introduced the helper func=
tion
>      `acpi_map_cpu_acpiid()` for managed access.
>    * Renamed local variables to more intuitive names.
>    * Simplified the implementation of `get_logical_id()`.
>    * Refactored PPTT parsing to reduce type casting by using `container_o=
f()`
>      and switching from `char *` to `void *` pointers.
>    * Removed redundant error checks.
>    * Cleaned up unused variables and eliminated debug print statements.
>=20
> Changes in v5:
>  - Extracted CPU topology information from the ACPI PPTT.
>  - Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
>    CONFIG_GENERIC_CPU_TOPOLOGY.
>=20
> Changes in v4:
>  - Only display the CPU topology configuration prompt in common/Kconfig
>    if the architecture defines HAS_GENERIC_CPU_TOPOLOGY.
>  - Move the definition of the global 'cpu_topology' pointer to
>    common/cpu-topology.c.
>  - Update the Makefile to explicitly build objects as .init.o when all
>    functions and data within a file are annotated with __init/__initdata,
>    ensuring their memory is reclaimed after system initialization.
>  - Add an error log in the CPU-to-node mapping function for out-of-bounds
>    cases.
>  - Use ARRAY_SIZE() instead of raw macros when guarding array accesses.
>  - Rename variables and functions to avoid ambiguous or misleading terms:
>    - Avoid 'cpuid' to prevent confusion with x86 CPUID features/instructi=
ons.
>    - Avoid 'node' where it could be confused with a NUMA node, explicitly
>      renaming them to clarify they refer to a Device Tree node.
>  - Move local variable declarations into the narrowest possible scope.
>  - Replace the unsupported "%pOF" printk format specifier with "%s" and
>    explicit node name retrieval.
>  - Remove #include <dt-cpu-topology.h> from cpu-topology.h, and ensure
>    the header directly includes only what its definitions require.
>  - Remove #include <xen/device_tree.h> from dt-cpu-topology.h, replacing
>    it with a forward declaration of 'struct dt_device_node'.
>  - Use 'const' qualifiers for pointer declarations where the pointed-to
>    structure is not modified.
>  - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
>    that arch-specific definitions of cpu_to_core() and cpu_to_socket()
>    take precedence over the generic fallbacks.
>  - Introduce inline initialization functions for cpu_sibling_mask and
>    cpu_core_mask in cpu-topology.h, providing separate variants for both
>    when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.
>=20
> Changes in v3:
>  - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the spars=
e
>    map mismatch issue on ARM Xen has been split out into a separate patch=
.
>  - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
>  - Allow the system to keep running with a degraded fallback even if
>    the topology table allocation fails.
>  - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
>    from RISC-V and PPC processor.h.
>  - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
>    Elimination (DCE) where possible.
>  - Clean up the code to follow the Xen coding style. Please let me know
>    if I missed any style nits!
>  - Verify successful builds across x86, RISC-V, and PPC environments.
>=20
> Changes in v2:
>  - Generate topology information even when ACPI is enabled. Note that
>    this is a temporary implementation and doesn't yet parse the PPTT
>    (Processor Properties Topology Table).
>  - Added support for cpu-map node in Device Tree that doesn't contain
>    explicit cluster node definitions.
>=20
> Changes in v1 from the previous series "Introduce Device Tree based NUMA
> support for ARM Xen":
>=20
> 1. Optimized Memory Allocation:
>    The series now allocates only the minimum required memory area to mana=
ge
>    the essential data for the CPUs.
>=20
> 2. Flexible Device Tree Parsing:
>    The parsing logic no longer depends on the definition order of the 'cp=
u'
>    nodes and 'cpu-map' nodes in the Device Tree. They can now be read
>    correctly even if their orders do not match.
>=20
> 3. CPU Hotplug Readiness:
>    To support future CPU hotplug, the system assumes that inactive CPUs a=
re
>    also described in the Device Tree. Xen will pre-load and generate the
>    topology information for these inactive CPUs during the boot phase so
>    it stays available in memory.
>=20
> Thank you,
> Hirokazu Takahashi
>=20
> Hirokazu Takahashi (4):
>   xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
>   xen/sched: Link CPU topology to scheduler
>   xen/sched: Make cpu_nr_siblings() architecture-specific
>   xen/acpi: Parse PPTT to initialize CPU topology
>=20
>  xen/arch/arm/Kconfig                   |   1 +
>  xen/arch/arm/acpi/boot.c               |   2 +
>  xen/arch/arm/include/asm/processor.h   |   4 -
>  xen/arch/arm/smpboot.c                 |  15 +-
>  xen/arch/ppc/include/asm/processor.h   |   4 -
>  xen/arch/riscv/include/asm/processor.h |   4 -
>  xen/arch/x86/include/asm/acpi.h        |   2 -
>  xen/arch/x86/include/asm/processor.h   |   1 +
>  xen/common/Kconfig                     |  22 ++
>  xen/common/Makefile                    |   1 +
>  xen/common/cpu-topology.c              |  62 ++++
>  xen/common/cpu.c                       |   5 +
>  xen/common/device-tree/Makefile        |   1 +
>  xen/common/device-tree/cpu-topology.c  | 409
> +++++++++++++++++++++++++
>  xen/common/sched/credit2.c             |  21 +-
>  xen/common/sysctl.c                    |   1 +
>  xen/drivers/acpi/Makefile              |   1 +
>  xen/drivers/acpi/topology.c            | 341
> +++++++++++++++++++++
>  xen/include/xen/acpi.h                 |  17 +
>  xen/include/xen/cpu-topology.h         |  76 +++++
>  xen/include/xen/dt-cpu-topology.h      |  35 +++
>  21 files changed, 987 insertions(+), 38 deletions(-)
>  create mode 100644 xen/common/cpu-topology.c
>  create mode 100644 xen/common/device-tree/cpu-topology.c
>  create mode 100644 xen/drivers/acpi/topology.c
>  create mode 100644 xen/include/xen/cpu-topology.h
>  create mode 100644 xen/include/xen/dt-cpu-topology.h
>=20
> --
> 2.43.0


