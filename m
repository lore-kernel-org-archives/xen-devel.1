Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AEEC9831E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 22:45:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433134.1653952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sBt-0007PD-LC; Thu, 24 Sep 2026 22:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433134.1653952; Thu, 24 Sep 2026 22:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sBt-0007P6-Gp; Thu, 24 Sep 2026 22:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1433134;
 Thu, 24 Sep 2026 22:45:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9sBr-0007P0-LU
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:45:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9sBl-00B1xH-VI
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 00:45:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab5a7c1-e002-0a2a0a5209dd-0a2a4509cd48-34
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:45:13 +0200
Received: from [52.101.69.143]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab5a7f9-be1a-0a2a45090019-3465458faff5-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:45:13 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB7585.eurprd03.prod.outlook.com (2603:10a6:20b:34a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 22:45:12 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 22:45:11 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1/ts9r+I1ihrBPr8mgW3lTAec6v9ovQTOjCHq7YtbdVVA73FHoobp+/Ol1Du7nyLJc+4anBkoDDeaiJpwNA40WGwsmDu7AOpHHfwhDBYxU2veLkOa6LboBLYbb+8bWKC7dd9KAcI8KCU1DOoyEDHNHRcteuC5kCGDt5J0TXcpfBhoMcch82O7mXkGvJD1De+oWxTvacttcbL91BAhmkgVN+dbe9IZEXxRWMoMGRt2vmc2GXuW1mLqLzGLShE1H1fYJeLZXDc7kwie1j8V548csn440yQZKdBdObAjhi7np8QlwyqSxa95g/Aj2u0mS4XrdoimuoBAeFfIO9cRC6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxkIYplUMAx3k6PdnftzQLJ2p5om4DNTocWlyGYQx6E=;
 b=i02L5hWZ6EY6HgGEy8e2tZyKNMY/yJjdxJQt3jAxzBjT4CrWNDphfIkOZeLD3F51HBwLoByxBx7GihHs6AkiU0t0PiYi721CrOXM0h6xen6n53zNBebHtUn0m8Z3H7c9s2qoXmpaaW8zF4cuiSd/XOsywbhP9wEPmsBkP8YvJpbdoqqlZzvLkINM895HN4gusOUZJcAuitSZgjDiwZwfJx2mYkOYSoE1vl9UWKdVYNHjo2O5AOzkY4ffPI8M6BkqpRZCAC58ZHbBu/HOknKkvjWg3PXi1FTl+9CQl3nZKb88ZbA2vdBGLyxdjtbIeK/D6L6disEHs1xZ6QxFNaWXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxkIYplUMAx3k6PdnftzQLJ2p5om4DNTocWlyGYQx6E=;
 b=mAXHf2t/7LqHmHsPwy/AMyjFKoU6pFFFSR5eBk8WR4UdUZcadhKuu5UnmC7mBxLToQAA6Mwj9eN/ru6+sLSt+nnPnL9WBPuPmLZeDFWFhXfteSpi1MrhVNFB3TPkpRUb1Mtj4cFRgEekXeAIz9B+beCt7RhJjosM3dDAEbVxEsaqASQwCAQqnaOk+3+7RooRX4IsReeauD15vJkVkFOktJkoa4Z9AvCUsHiIMkEfVtW+vI8j+ZXVkn+t41BvAzPKoeHiQ0CB3aCGcH7PpuOgB7BwKXgkGVuQ8KnY4h4ohkP1SZgkoTxLa2TwNJMYcQm8AbxGDHe9B0KmX0ZMPaKhMg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
Thread-Topic: [PATCH v5] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
Thread-Index: AQHdTGflNHaw2bFG60qtE8E+9DIq7Q==
Date: Thu, 24 Sep 2026 22:45:11 +0000
Message-ID: <87o6dm1d6x.fsf@epam.com>
References:
 <4f24dd8cd9fc76e8c3f93bca44bb58056cbcc51a.1790147101.git.mykola_kvach@epam.com>
In-Reply-To:
 <4f24dd8cd9fc76e8c3f93bca44bb58056cbcc51a.1790147101.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Fri, 25 Sep 2026 00:01:29 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS8PR03MB7585:EE_
x-ms-office365-filtering-correlation-id: d465b5ca-c8ca-44cc-efab-08df1a8d7e15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|42112799006|10067099003|5023799004|56012099006|11063799006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ve6F7/jyRXzfaEmqoWm1rDTTk0wuXNr24JA4Wp7Q1jSBUEcWkAAWVNwP9NFA5986qZyOiAH6Vn5fzNPRBQ9WxhR+9mfTcjB/gv/D3IP+HB7VfKDwO3FUul7nmt0CalGt86LGMG1FzEr6aajL54lV8cIk9cO+o0UyjU/Qm+ygfchGf1wklbAli30gaODhnXyXGIeRqZK+xEnTOhoGOgSKJT606Av34jyqhsYs9oyv9gZCWGOGnwbHU+OPdYy4Xc+I1YHoAcRJWIecyK3KtRfFimAvAxXG004dE4+L5IVMk65yFogZuUAtplgXsQCC+Z2sC5fzcb0T+O1Oe7oW5T/X9GseDu5DMOn69kknskSlwpmfTsTnnYIxBYgvd/r7/6qIjfK8IOyfUzG2V5oMgtJsFhUoc1T/hw2krmU0ibkoPto52hGRrkpyIK8prtA60FY2VwyiwBgjL0sQ7mXstYkR8qfCFtPa4MFezF8A4Vg4v3xafN28wmr/ycoCTM2n5bAyn+H/mivSGIIVlG/HVT4yb8Bc/CnAONVjbIQnj6cKnzUqazuKWp94XObaHKo0EHDk+PxmwvL+D2sY9G3HkUbOvWf2j9X+BCj9fplDNfstPLxW0MMRisCFHYVrUFB6LoN9Aqdxz7c+hhmQigK+zilSeUBd3LXTiqCZg0EFppaQC3g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(42112799006)(10067099003)(5023799004)(56012099006)(11063799006)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1an/1QaO8dMZE45xm3pKEU/RUmu7oF601MofDGZL+XhJnsaawYCAKsfAB7?=
 =?iso-8859-1?Q?uG/fWSazqDNBi5nFRaBRZgIVF3IgqQRiC5pwIklfPgxNIaeNmVDumU7C7g?=
 =?iso-8859-1?Q?73ye0vvDbaunMhc+15H9cq6aIjgaPmE2aGPxDQwcdIQf/PPBNCup5oUQ2A?=
 =?iso-8859-1?Q?UcfzfvOJM/ZFRxUS0K7BA2WTIi3ATLly6zHvbTbKWxOfgEboOjyMotFBv/?=
 =?iso-8859-1?Q?SSBIWns8iqPHxjKWyUWUuRivvKlVJuUf0WFJSs+R26C6/rqvWBkkepdkDt?=
 =?iso-8859-1?Q?IM9ixKv+kA2oyWMdsrjlgBVJQv7KbeXtr7o/9bJhIclljML6mvHifODTso?=
 =?iso-8859-1?Q?1OmgnEAAY3Woemo1O9wW1bQyCPJNUCoZp0BWnWQ7drPmLm7D9QlGBcmSRU?=
 =?iso-8859-1?Q?lx98CisNQOexCLs/tLdPDHw5VZYZvqBzUrCHjnHukDOGipE5f9iBU5eOqS?=
 =?iso-8859-1?Q?yJoBDdFEulxYhWOluXUKaZ+aI1d3B3NmXe8nk5sCpVbw9WOKovuNParwqj?=
 =?iso-8859-1?Q?4Ff+PV53uMUqysTItW3tnJghz/XuTnTpC/65igMmfgEH9ojV+6YllJ2hdA?=
 =?iso-8859-1?Q?HCjPDzsG49qCNN1MCmwUatGsQxBpAz9f7+4ZO+wz5r7RBCXkzUkZ74WE05?=
 =?iso-8859-1?Q?ZalgybkC4TbjpTZHxW5Siaul4/BXF9Y61ppUjEq6GlJI/cmifm+7/uiQgb?=
 =?iso-8859-1?Q?OQ1kecmGZMdOSge8RL8m/NO91bhVFRTKsKysA35u7x5/GcH6j5hX4Q/aHY?=
 =?iso-8859-1?Q?61diXGVpnX6xqMt2UaBczhJWSEdYpbgOvwqG2kLrASH1WSyRhP2eT7pXQ1?=
 =?iso-8859-1?Q?M5Ke1UqeVm+IqQ2id6PRaXkNhSDxYgwX/lCA2wq9wk6fgI89HhxTl4Xvl/?=
 =?iso-8859-1?Q?X2Y6psoqHJR7zFNjmHSSj8gf+8I9I4qURAOeqmfmuk6sCrthlD5jaatF4k?=
 =?iso-8859-1?Q?7m9oOwglNU0HC0cd3NfP5KMG8EBywoCgooEJaQRshKktG7ArCAigTClPo8?=
 =?iso-8859-1?Q?RQ1OCoR9nTzwcqdOH7z3v99wdQeoEybbso2rhU9gJd1h+eVRUy9zv6Cbyv?=
 =?iso-8859-1?Q?aSuaOhPPkWMidqH3fKKHU/SQiznnpTLJLJeOZ454o3a5+UiGRJPyXUED98?=
 =?iso-8859-1?Q?Odz1Jio+i7p/tOAnum4ugkUsiGhvqesLVAZCbT7nNpUDf0DE5wFkMb/uEP?=
 =?iso-8859-1?Q?Dwr3U8EFCrZopzwdKxCrZodcb1/bt9FfozlVbALe7NKAE8gGudcPtVV1nS?=
 =?iso-8859-1?Q?d31YbLwUP7ci+Mu3hislKRx4idM3yPvbdOpucLUovIcH1fNJntNRvfpPUr?=
 =?iso-8859-1?Q?zVXr/2bKjywDTKCLp4UeNBPIPhiLAxI5c7Ze8QK7ShOIgChhwn0zQlqjFH?=
 =?iso-8859-1?Q?pcxWLHW1X7pVCrwoIyNLXQe4//VSBbNfrBwTjRdPbShPMhgJgloUEOu/zX?=
 =?iso-8859-1?Q?JhJX9gluGnj0InGhcdrEvID5B4H9ualtF+YoDHylaM0rSMZq5gwVKnMi4b?=
 =?iso-8859-1?Q?mL5i+GEcrpa+px7T5tIuXPI0flxBcoy/TQOsCmAodJI16gXbLJC0MKiLzW?=
 =?iso-8859-1?Q?hVrRt98GGrusbsaQd4K3n2E9TfzoXv+ZAaf1SvpA0i50+3tUdeAxQvIBvz?=
 =?iso-8859-1?Q?1cfwG7CpZAHdZqXLwuoA4Gx5k4ZtouC0aN5GjhFfzTfocXzqb79KXS98N4?=
 =?iso-8859-1?Q?TGXuS3gQ7aIqfpL+65FO6f1G1ws7N2DzYlngQE5KchFeUFrQoxBvc/IKOH?=
 =?iso-8859-1?Q?UIpg0bm0i+d1F3uaaieUOTl9FgBdgOGa6vYYCT5HKNnBUkzkSbdjEKOfNb?=
 =?iso-8859-1?Q?cjilCwQdo9GYeSQBI5CjyVj7CUyX+H8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d465b5ca-c8ca-44cc-efab-08df1a8d7e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 22:45:11.7504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jG9Lql+fsiyOWE0ff/Jnhw4m7suFPOMSVw0QSRwClFz9Ns0VE1E3n/YguiXbizxjOEcB0ca5g6P5BDtCUw6tWdJCzj79zsjJCfJFKl7VDEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7585
X-purgate-ID: tlsNG-bad1c0/1790289913-BFAD0034-761D6A59/0/0
X-purgate-type: clean
X-purgate-size: 8588

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
> which is initialized from the sanitized host CPU feature state. This
> does not necessarily match the virtual interrupt controller configured
> for a domain.
>
> A vGICv2 domain can therefore observe a nonzero GIC field when the host
> supports the GIC system register interface, even though Xen disables that
> interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
> observe encoding 0b0011, although Xen exposes only its vGICv3 model.
>
> Derive the fields from the domain's vGIC version instead. Expose 0b0000
> for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
> ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
> CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
> unavailable.
>
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v5:
> - Fold the vGIC version mapping into the shared ID register helper.
> - Use the vreg_ and VREG_ prefixes for the helper and field width.
> - Cosmetic changes after review
>
> Changes in v4:
> - Explain why ID_PFR1_EL1 is left unchanged without AArch32 EL0 support.
> - Move all ID_PFR1_*_SHIFT definitions to the common asm/sysregs.h and
>   remove the unused cpregs.h includes from the ARM64 files.
> - Return explicit unsigned GIC field values to avoid MISRA C Rule 10.3.
>
> Changes in v3:
> - Add direct dependencies for the shared ID register helpers.
> - Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
> - Apply cosmetic fixes from review.
>
> Changes in v2:
> - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
> - Parenthesize the individual ASSERT conditions.
> - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
> - Target master instead of the 4.22 release.
>
> v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783=
675708.git.mykola._5Fkvach@epam.com/
> ---
>  xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  9 ---------
>  xen/arch/arm/include/asm/sysregs.h       |  9 +++++++++
>  xen/arch/arm/include/asm/vreg.h          | 20 ++++++++++++++++++++
>  xen/arch/arm/vcpreg.c                    | 12 +++++++++++-
>  5 files changed, 60 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 66f4f23bb3..d8f380ccb7 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -299,7 +299,22 @@ void do_sysreg(struct cpu_user_regs *regs,
>       * to identify the processor features
>       */
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> +    case HSR_SYSREG_ID_PFR1_EL1:
> +    {
> +        register_t guest_reg_value =3D domain_cpuinfo.pfr32.bits[1];
> +
> +        /*
> +         * Preserve the sanitized ID_PFR1_EL1 value when AArch32 EL0
> +         * is not supported, as for the other AArch32 ID registers.
> +         */
> +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
> +            guest_reg_value =3D vreg_id_reg_set_gic_field(guest_reg_valu=
e,
> +                                                        ID_PFR1_GIC_SHIF=
T,
> +                                                        v->domain);
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> =20
>      case HSR_SYSREG_ID_DFR0_EL1:
> @@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
>              guest_reg_value |=3D (sysval << ID_AA64PFR0_SVE_SHIFT) & mas=
k;
>          }
> =20
> +        guest_reg_value =3D vreg_id_reg_set_gic_field(guest_reg_value,
> +                                                    ID_AA64PFR0_GIC_SHIF=
T,
> +                                                    v->domain);
> +
>          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>                                    guest_reg_value);
>      }
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/incl=
ude/asm/arm64/sysregs.h
> index f3c11d871e..f6ece8f972 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -438,15 +438,6 @@
>  #define MVFR1_FPDNAN_SHIFT           4
>  #define MVFR1_FPFTZ_SHIFT            0
> =20
> -#define ID_PFR1_GIC_SHIFT            28
> -#define ID_PFR1_VIRT_FRAC_SHIFT      24
> -#define ID_PFR1_SEC_FRAC_SHIFT       20
> -#define ID_PFR1_GENTIMER_SHIFT       16
> -#define ID_PFR1_VIRTUALIZATION_SHIFT 12
> -#define ID_PFR1_MPROGMOD_SHIFT       8
> -#define ID_PFR1_SECURITY_SHIFT       4
> -#define ID_PFR1_PROGMOD_SHIFT        0
> -
>  #define MVFR2_FPMISC_SHIFT           4
>  #define MVFR2_SIMDMISC_SHIFT         0
> =20
> diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/as=
m/sysregs.h
> index f6af987ef5..8dcf82a694 100644
> --- a/xen/arch/arm/include/asm/sysregs.h
> +++ b/xen/arch/arm/include/asm/sysregs.h
> @@ -9,6 +9,15 @@
>  # error "unknown ARM variant"
>  #endif
> =20
> +#define ID_PFR1_GIC_SHIFT            28
> +#define ID_PFR1_VIRT_FRAC_SHIFT      24
> +#define ID_PFR1_SEC_FRAC_SHIFT       20
> +#define ID_PFR1_GENTIMER_SHIFT       16
> +#define ID_PFR1_VIRTUALIZATION_SHIFT 12
> +#define ID_PFR1_MPROGMOD_SHIFT       8
> +#define ID_PFR1_SECURITY_SHIFT       4
> +#define ID_PFR1_PROGMOD_SHIFT        0
> +
>  #ifndef __ASSEMBLER__
> =20
>  #include <asm/alternative.h>
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/v=
reg.h
> index 387ce76e7e..a85fefcc3e 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -4,11 +4,31 @@
>  #ifndef __ASM_ARM_VREG__
>  #define __ASM_ARM_VREG__
> =20
> +#include <xen/bitops.h>
> +#include <xen/bug.h>
> +#include <xen/sched.h>
> +
> +#include <asm/gic.h>
> +
>  typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
>                                     bool read);
>  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>                                     bool read);
> =20
> +#define VREG_ID_REG_GIC_WIDTH 4

Should this go into sysregs.h?

Something like ID_AArchx_PFR_GIC_SHIFT? I am open to alternatives in naming=
.

> +
> +static inline register_t vreg_id_reg_set_gic_field(register_t val,
> +                                                   unsigned int shift,
> +                                                   const struct domain *=
d)
> +{
> +    register_t mask =3D GENMASK(shift + VREG_ID_REG_GIC_WIDTH - 1, shift=
);
> +    enum gic_version vgic_ver =3D d->arch.vgic.version;
> +
> +    ASSERT((vgic_ver =3D=3D GIC_V2) || (vgic_ver =3D=3D GIC_V3));
> +
> +    return (val & ~mask) | ((vgic_ver =3D=3D GIC_V3 ? 1U : 0U) << shift)=
;

Probably better to use constants?

Something like ID_AArchx_PFR_GIC_V3 and ID_AArchx_PFR_GIC_NO_CPU_INTF.

> +}
> +
>  static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union h=
sr hsr,
>                                       vreg_reg_fn_t fn)
>  {
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 3c315be9fd..15ccde71da 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -316,7 +316,17 @@ void do_cp15_32(struct cpu_user_regs *regs, const un=
ion hsr hsr)
>       * to identify the processor features
>       */
>      GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
> -    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
> +    case HSR_CPREG32(ID_PFR1):
> +    {
> +        register_t guest_reg_value =3D domain_cpuinfo.pfr32.bits[1];
> +
> +        guest_reg_value =3D vreg_id_reg_set_gic_field(guest_reg_value,
> +                                                    ID_PFR1_GIC_SHIFT,
> +                                                    v->domain);
> +
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>      GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
> =20
>      case HSR_CPREG32(ID_DFR0):

--=20
WBR, Volodymyr=

