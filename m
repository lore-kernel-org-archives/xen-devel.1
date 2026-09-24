Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B2C98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 22:49:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433140.1653960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sFE-00084X-3r; Thu, 24 Sep 2026 22:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433140.1653960; Thu, 24 Sep 2026 22:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9sFE-00084Q-0A; Thu, 24 Sep 2026 22:48:48 +0000
Received: by outflank-mailman (input) for mailman id 1433140;
 Thu, 24 Sep 2026 22:48:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9sFC-00084K-LL
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:48:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9sFB-00B2KS-Ut
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 00:48:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab5a80c-bab6-0a2a0a5309dd-0a2a4509b660-48
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:48:45 +0200
Received: from [40.107.130.104]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab5a8cd-be1a-0a2a45090019-286b8268754f-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:48:45 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB7585.eurprd03.prod.outlook.com (2603:10a6:20b:34a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 22:48:41 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 22:48:41 +0000
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
 b=P+M+Q3bQMKJpbPypgNg9FHuGkBt/rWxhhvVhecPYaOPAQyIKkIiw1Yb2DSOKYxYrvDHTxfWap6LNjUt1bSwJiMUGxou7tcOgQr0OaO1ftxgnDtMA7i0OsUrHp37FLK3pIAeualykt5mcTMuziBapmMmxxAP7G0zXpyZGke4o6LcKkjW2+Y2bmmNbMZ9u76tUgbkGa2XOk5qkFc1VddDYxliZa3tuqFyWimeOqirAjKUDIUsXJJW61pBwecvpfyjZaX7Xhc8cTTvlk3B8hUI/09UGVnCSLjNDVmOuVewcd+76G8JWD/cprOX5W/NGYfoN/F6HHQrvH2QfsHWC5oxS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeUp7Wi6wcAtU37QGNRs8t5yutaUO6GvLIt5JZ7ErkE=;
 b=RQIIuQjzwyoQsJB/Q3nEkPErOjNATkb23kAkSWtkUj/Bu65otm2o3I1TijqjEBGqR7afrcpMla0UrwsMJxkyDYW94okROVrl976I7GWIR9kKIfbnPgY6mjwCmw+//TknOjCLmyfmC4Hfi/ptVr03rywITHWfnKbg1BgegYXIkWzw30Zd0yztK77KXhtt7HL8Ytef5cWG5jdji31BsRxihppKa8+CDkshgGt60+kSy02IQEKZZujATkBzvQnlCVnGgjit/wFmkKI9KhTYcDs0+nTUN4KXrMKADJph6k+3BSJefjb/L3DnMu92qLFFAwbyJd8NULJkZHVMwOJuIt25nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeUp7Wi6wcAtU37QGNRs8t5yutaUO6GvLIt5JZ7ErkE=;
 b=SRdWSKSG664xkPwkpUh9XCLgwgJrym6lNd38GIegjc5LJ4h/Oe/21fkbvgXoz+df9WXIDq3nnxusucz5VDMi3NfFB27mvbNyqqcHS2Ptc+tMgHCCUeUG9B1t6knNnFbg8e8elimF4JoSucygVSj+mFfdY+I7eVSU/CCDlrH0xdYNLZRBsSNdWM1CKL80jBMYAZy4sgf7hYMpLFwhGfFud9nCcwDeO+Xq7u2Sb/A98YOxIPIABSgsGKzU3+llHmJXrIRw5hFX228AZ2U35sS2ZfPtZ8Kk40LRr7Dt1JK+GWtusASOP3LHn+zZF297OrH1u5JG9Bs1jiz/v4gjYHRfVw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 2/4] xen/arm: make is_espi() a pure range predicate
Thread-Topic: [PATCH v5 2/4] xen/arm: make is_espi() a pure range predicate
Thread-Index: AQHdTGdtuoJ+YRti9EqfLG1rI3nQEw==
Date: Thu, 24 Sep 2026 22:48:41 +0000
Message-ID: <87fqyy1d13.fsf@epam.com>
References: <cover.1790160605.git.mykola_kvach@epam.com>
	<8aa55bb41ec944bd249a77959e7702e001a8329d.1790160605.git.mykola_kvach@epam.com>
In-Reply-To:
 <8aa55bb41ec944bd249a77959e7702e001a8329d.1790160605.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 24 Sep 2026 23:57:54 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS8PR03MB7585:EE_
x-ms-office365-filtering-correlation-id: 41ecfdf5-9e6f-4d53-6cb5-08df1a8dfadb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|42112799006|10067099003|56012099006|11063799006|4143699003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 TtDWeVyNal0NW1eWi/cc3adkye7fVAXqTrJ5vYrcxSKLz8qJWNfAVhEOb/GzvvLI24aFI3DcK0DaTkdbTn7XcfOQyVA6cB+UuZrKnGlbb82pFNbA++kkcrd4VQrJAW5ED0oIxRDlpHzeVs5ZmqEUG++A84oj6OsRisY431P97CdmFhJXI/iPl9pd0D9vFzRi5vGkOZywju/Jof2r5vxe68pTsU2WxegLoHyoOBkB8KUQt2MERuQfbt0DNoWfL7FxM5On3Q/ng/tfiyZ8cna415n+zo4feJmvGeqHMffO/kxv7Rfpns+Xgmr2QJOyIYWaHn/i+OYm/+ZB7KWFN6vCkJWsWksNAqQwVGET07A/Xw3dR4bvNlUWfU1mfveXQ4B1iQAnCYKyGxyp+MKgj4eA9qlsRvXX1f5B+G2jjwif68wINPWOC1abCIRI7o7adQ+U1WqyYUOog2Aqlu6wcOWRFcj0JtAAYJXKzYljSL3H5YvuIUlUqxdf5kEYnBX7q/a837c3hy/ZP5uohw3o9TKZz8jxbz8aDhRJhkkGrOIzEN1/folTmo0woWxyRK/DCPtTfL7ZASf8hnOQtgRNoQkAkuF5yivTb5qLhFbCIvacJvCKMwOWLEAF7eRAjCbJ1pyxsNwyn3MhR2nAHd9/Uph1JlF+KUowfPTUZgLduogsO5UujiS3iH74Q9rpnps0lSgjSE6uLCQRGcimiwyWEyP2Acb72h6kCNNohsglQpMyZRc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(42112799006)(10067099003)(56012099006)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iTur7EmhhZY0qfwUGhj1/kwzBkTR9k1/QbwZXTNdWi/AA7fzu1JOgPH5O+?=
 =?iso-8859-1?Q?Hc/dxISt4RsL46VcN9Ldhix9lFws99dWrVM9twH+DIg19cQfe7fJD0U7Dv?=
 =?iso-8859-1?Q?MPqKY7qSLIb9oOh4zOiZ2ShB8hCE17xjD5yX8m0hvxELhHHMV/dgzwfK+R?=
 =?iso-8859-1?Q?x0HXQlA8X6dJeBfHmDmWBXUb3YQr/Xh2neYS+4FGS52Qgnusr0bl/h3nEj?=
 =?iso-8859-1?Q?l3XfgzDfFh2j8I7Ho4n4qZXjNSEGEFd/2SoTSOjuxglH8HsT+f2N/d1Irs?=
 =?iso-8859-1?Q?dlatNodKhBskWSA3jLtzE3jmfm26tVjQExS83ik/5oH4phvfQyfyfI1aXY?=
 =?iso-8859-1?Q?6NzRY1xHJ37of79tBC5wj5nX2xcZxnKzMYq9YNm5yp7zCdM0aDUCFMfWfj?=
 =?iso-8859-1?Q?LuykEmNa2vYiUA1z3sIO+xxP7lR2KwIcSBGBpmxB0DMlvBTK5qFqN6Zrls?=
 =?iso-8859-1?Q?ti7zLkDyA0KEYiOBMWB5ekBsd/fanf2cPPhfJGH44fwGV9TrToU/0AmELe?=
 =?iso-8859-1?Q?OHMLkWpwlBv/LX6nt94tAG7GmOUzzpWzV56mwhRkIbxc6aADRjh7/W0qiZ?=
 =?iso-8859-1?Q?oduAZAHo23GGejPO4BKwyCsVR12E/+hiUG0OcBkFfNnew9W0KkR+OIBSDC?=
 =?iso-8859-1?Q?C+YmY3SbvUBDTvPyhRclAgbxQVPQE9forfk+rRXQu6jerW6YoBqz7dENr4?=
 =?iso-8859-1?Q?ZW00Op7uTKEbNbjlNDNejtzOYRUSFayt9qbTc+GdvhWr0kGAouUhf/NydD?=
 =?iso-8859-1?Q?3KS0V9/Dlp6J3IBy4eALOtlhH3FBZKVoxyz//ZS+TUZMBCDCbkr5crzOQ9?=
 =?iso-8859-1?Q?Z+vbK2SXD2TLzXBNU+AfdJBkKK7vkwekXBHldXIFaELfVUgSkfWxp2MJCL?=
 =?iso-8859-1?Q?FROTleZFesYxN7jZMRAkiBtScAizj8NjOzAiUzpe7bilnjrlgR1NVRu4l3?=
 =?iso-8859-1?Q?UrRcjqeZ7aC3WXJYFQHSDG0iqGosD0uD8Wd7vm+r/Cr24rTWws4f6Xdw80?=
 =?iso-8859-1?Q?WvFiAYIQ/TnkL7Kaj8gTGBZCbEEyJ8B5zJdSyS2xN84LE2m8+udgMnRIlX?=
 =?iso-8859-1?Q?jthmswlqLFVjs/VDbPxd/O2vBq5jkpC/eB7ToAwfQXFl5pHFvoP9uLtL7x?=
 =?iso-8859-1?Q?mZOdfgvPy3xVHRriMRYpzhR+gNDgPyvvVtfMWDoXyxOxmQrf0WvLbBIKHP?=
 =?iso-8859-1?Q?WLltxdMQDkH2E0fpBJ04moy1E8xXIvBufCKWYfvoKAYx3YK/SSHRRurfBM?=
 =?iso-8859-1?Q?CkXnF5hl35iwa1EGPgl7Iqm8uh8iqKJfr7AlvskMBN+LQxE3lO0o+NZD2d?=
 =?iso-8859-1?Q?y923l0TVPerxl07FeFBNcAHHJ4ui4GyRtu4mnzfjO6TkJ4CdkMc4tuVnwk?=
 =?iso-8859-1?Q?hshk/Y4EAdA0BZ3vKrA0Zyez2Pf7jkfYXW73eXZjQ7JSuYWEaCYpOIyfKo?=
 =?iso-8859-1?Q?FI0kys+1wSZZspUtt2nWJ2T9l9VtNbprJWHQz0VmPTaCYfhRFQpq29+AVr?=
 =?iso-8859-1?Q?4rI7R4jNCUhA093J8jaMptyZFR8qcJJyyAh114RjnnPjEQFDyv7n8pso1V?=
 =?iso-8859-1?Q?UK6ZrTaUoIggJoAUe6hXOTxLUWVvo6c91WcOoA8mXc0DYx5Yd5joWPx0MU?=
 =?iso-8859-1?Q?x/JQFHqEziiD3A8FUqh0MUCR7pm0d+UZjeK4Mzs4+PuIvUf4oSsFrgonmR?=
 =?iso-8859-1?Q?EU+C36I8DAzfYoI40/fQmtDw/iMClSfRkct5A0cQkk9MNQDacA9FEEJUrw?=
 =?iso-8859-1?Q?BzsuZRdCgROPTB6v4KX6PNnKrGBTt3uDTK6nw2NZ3ig5MGgTT3RzkDiD+C?=
 =?iso-8859-1?Q?NJ19DqbZcrTk9eMjhBi17LD7WJJFETI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ecfdf5-9e6f-4d53-6cb5-08df1a8dfadb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 22:48:41.1188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/9T+8jGOpITAsYtoQKKFnqw23Zg3tmWDixEz8aNj58uMyUQeUS2jiLiExAEzk9KlAl5Cz5gL5wjJ0USFLali/cOihgH7BzLrVIj0E31N0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7585
X-purgate-ID: tlsNG-bad1c0/1790290125-BF6D2034-F6AC4382/0/0
X-purgate-type: clean
X-purgate-size: 5810

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
> Without eSPI support, it returns false, and its assertion fails if
> an eSPI INTID is passed. Callers therefore use it both to identify
> eSPIs and to exclude eSPI handling when support is disabled.
>
> Make is_espi() report only whether an INTID is in the architectural
> eSPI range. Check for eSPI support at the call sites.
>
> Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
> matching the handling of unsupported LPIs. Treat virtual eSPI lookup
> without support as unreachable, with a NULL return from the
> espi_to_pending() stub.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v5:
> - Explain why an eSPI cannot be handled without compiled-in support.
> - Make both espi_to_pending() helpers static inline and constify d.
> - Add ASSERT_UNREACHABLE() to the espi_to_pending() stub.
> - Preserve the unmapped LPI comment and clarify that an eSPI lookup
>   without support must not occur.
>
> Changes in v4:
> - Clarify the existing is_espi() behavior in the commit message.
> - Drop the unrelated blank-line removal in vgic.c.
> - Use BUG_ON() if the GIC reports an eSPI without eSPI support.
> - Drop the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
> - Return NULL for virtual eSPI lookup when eSPI support is disabled.
>
> Changes in v3:
> - New preparatory cleanup requested during review.
> ---
>  xen/arch/arm/gic.c             |  6 ++++++
>  xen/arch/arm/include/asm/irq.h | 11 -----------
>  xen/arch/arm/vgic.c            | 30 ++++++++++++++++++------------
>  3 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..cdae6afb07 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -348,6 +348,12 @@ void gic_interrupt(struct cpu_user_regs *regs, int i=
s_fiq)
>          /* Reading IRQ will ACK it */
>          irq =3D gic_hw_ops->read_irq();
> =20
> +        /*
> +         * Without CONFIG_GICV3_ESPI, there is no IRQ descriptor or
> +         * pending_irq storage for eSPIs, so we cannot handle them.
> +         */
> +        BUG_ON(!IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
> +
>          if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_esp=
i(irq) )
>          {
>              isb();
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 09788dbfeb..c29f3d04a3 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
> =20
>  static inline bool is_espi(unsigned int irq)
>  {
> -#ifdef CONFIG_GICV3_ESPI
>      return irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID;
> -#else
> -    /*
> -     * The function should not be called for eSPIs when CONFIG_GICV3_ESP=
I is
> -     * disabled. Returning false allows the compiler to optimize the cod=
e
> -     * when the config is disabled, while the assert ensures that out-of=
-range
> -     * array resources are not accessed.
> -     */
> -    ASSERT(!(irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID));
> -    return false;
> -#endif
>  }
> =20
>  static inline unsigned int espi_intid_to_idx(unsigned int intid)
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index e5aca17dcb..0ba13e18da 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -62,6 +62,14 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank=
(struct vcpu *v,
>      return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)]=
;
>  }
> =20
> +static inline struct pending_irq *espi_to_pending(const struct domain *d=
,
> +                                                  unsigned int irq)
> +{
> +    unsigned int idx =3D espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
> +
> +    return &d->arch.vgic.pending_irqs[idx];
> +}
> +
>  #else
>  static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
>  {
> @@ -78,6 +86,13 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank=
(struct vcpu *v,
>      ASSERT_UNREACHABLE();
>      return NULL;
>  }
> +
> +static inline struct pending_irq *espi_to_pending(const struct domain *d=
,
> +                                                  unsigned int irq)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
>  #endif
> =20
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
> @@ -698,6 +713,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enu=
m gic_sgi_mode irqmode,
>   * interrupt.
>   * This can return NULL if called for an LPI which has been unmapped
>   * meanwhile.
> + * This must not be called for an eSPI when CONFIG_GICV3_ESPI is disable=
d.
>   */
>  struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
>  {
> @@ -715,22 +731,12 @@ struct pending_irq *irq_to_pending(struct vcpu *v, =
unsigned int irq)
> =20
>  struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
>  {
> -    unsigned int idx;
> -
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
>      if ( is_espi(irq) )
> -    {
> -        unsigned int nr_spis =3D d->arch.vgic.nr_spis;
> +        return espi_to_pending(d, irq);
> =20
> -        idx =3D espi_intid_to_idx(irq) + nr_spis;
> -    }
> -    else
> -    {
> -        idx =3D irq - NR_LOCAL_IRQS;
> -    }
> -
> -    return &d->arch.vgic.pending_irqs[idx];
> +    return &d->arch.vgic.pending_irqs[irq - NR_LOCAL_IRQS];
>  }
> =20
>  void vgic_clear_pending_irqs(struct vcpu *v)

--=20
WBR, Volodymyr=

