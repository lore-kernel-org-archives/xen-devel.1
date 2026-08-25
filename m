Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99FDC5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 00:25:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398980.1635215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyeyA-0008BL-JH; Tue, 25 Aug 2026 00:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398980.1635215; Tue, 25 Aug 2026 00:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyeyA-0008BD-Dl; Tue, 25 Aug 2026 00:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1398980;
 Tue, 25 Aug 2026 00:24:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wyey8-0008B7-UQ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 00:24:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyey7-003LED-Iy
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 02:24:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce09d-bab6-0a2a0a5309dd-0a2a450580c8-20
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:24:47 +0200
Received: from [52.101.84.73]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce0cf-4cb1-0a2a45050019-34655449d18f-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:24:47 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS8PR03MB7829.eurprd03.prod.outlook.com (2603:10a6:20b:34d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:24:44 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:24:44 +0000
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
 b=VUBt18oZA8MyWNlF+gon1rAmBrSjY1RVo47o6P+Ecekp8Nnrw8hqF2EqhrE8+MGUF5mkmuoe+YRLqMOQCAt0DCYQoI9uMRS3HSgX8iCR1yFdPgYzWO5ESweJ5lh3eUKnE6no9KEVsz6TiTELJib66/lfK4blTVzHb93UETmR3ZlXUUsPypkqCF3DzqC4sNJ2KF+x2DYP2jk9y5dyqO0aH6omnelbte7AW5SeTq6BwjqglAZKMlboDPWSm8qnhgFROmVIfCPz5Se3JEZ4X8OCdhx+9dLaK35blJ1auuoxet+ZCw83q+3DuAODtjBSLW5YXkcdffSMrBYVc7qZcA0YXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKQxHODn3PTiP7tFxDfDWbkpNzL//blYLstN+umUeH0=;
 b=HEe7HYKQ99GpQeQqP7X6ZmI6TlH++HqKo+1feMv/UxesLdcQWa17evlw7z6OWaLRJvex+qVKtSMXFGhje4xM7ijEe9qeKzfm4T3DIccV/mc95IUpyo1WaBEnLW7ZMBy1MT2sIBJRPnMBuUssuGAY5cKQ7trw5/sQmYv2LEnOk/ulae34Hc8lxBMYWkm/Z15W4/fRRW8FCaj/GFY2QrZW1mCWUBtc5m6AD0v3xDBDX+C+gQ4cRPRyBZso+I15X40dTXx5WXjt0DFEp7f2r0YcWNSok4Fe2KtJRjbvXLCaqViZ7kls9UE3aMWYSAwj/C+ny6DUWgDbubVfNWUNQTZMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKQxHODn3PTiP7tFxDfDWbkpNzL//blYLstN+umUeH0=;
 b=L8jzjIcbQBj0KAsaSzgunR2qKTHRXvBDHR1ozcSNFOzamdfYdNaT6O1OYM/6puE0GJWq27kU8O1oaG6t3erEaAa/0RCljitEFay0GxgYY+2cdJmb4ti4d9BVui5yUusPRI4jn+8h8tV2slHiN4WQSbtQIhc7Gk9TShpKvq2gEl8LGJZIzoecrDD876zPrDuX5IpJxJaf5HRDZA7TDrQrpal5USRRIQE7JQbshZipxmcL2JLSoaw82Dyr6q3HxmGAlltxL2Y/6YNL96Eab2Bnzep70wlxorjMEg35Lj8NETDO3PMIdf3bTL/wAhuDwRWUoMopjDATaJcaCgVxqS/7+w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 1/4] xen/arm: make is_espi() a pure range predicate
Thread-Topic: [PATCH v3 1/4] xen/arm: make is_espi() a pure range predicate
Thread-Index: AQHdLwVdfsi6UdltJkiqddovOzt6jQ==
Date: Tue, 25 Aug 2026 00:24:44 +0000
Message-ID: <87o6erxd1a.fsf@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
	<8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
In-Reply-To:
 <8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 18 Aug 2026 14:32:59 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS8PR03MB7829:EE_
x-ms-office365-filtering-correlation-id: 344abb91-afec-446e-0dcf-08df023f4333
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|366016|1800799024|376014|56012099006|10067099003|6133799003|11063799006|18002099003|22082099003|4143699003|5023799004|38070700021;
x-microsoft-antispam-message-info:
 NErrj9KypNNbINjQWvHfkA0ymBt0B0r4ESun+6E4H/5vo6WLUvGZTIED0ilgjkA/USRfNI8942ikI2oqd0X837sffk4hel/AyizjGqKP0M4qaFXqG0hxbCKvn70+RbqlGo6u6thRBvhTyIa0lqbpfU5X6iEaPHo5kYJJ8pD+5Ixj8D0v+CgYl48e/u3AA9ayBV/p7pn2DD1HvEdn1BW64tA9WqXcF50PGMgCn66VJCc+rzvqZ5txgzPVVxa9lPK9GahMG9VXaUnlRg6wfSh/cJTCukHXWg1aT1b6s9NaFiDHkX6g2JyzsJxHt+3vHEAFypLyw7TeTOhAvBeQyVlERkRbSJRcmHROn9fvWFHSM2s9SuCpZDN78JmPpjpS8M5XXM5XDt5iIXpvPWPkSIeEv6XTTcc90EDWRNhUQDgJFyuYGHrXTBxUcl489H3+xQZzZXjGDqCr1baZz7/Vaq/iHp01q1ynKf7O/1gYIh/oQqO4vlcoMfQLduh+XcZbX+KsKuk8fcaTIia4GzPO6TNYfGbxJTINOV68/f5iETgtb3PAwp5BpsJTnt+2vOwRp9QhkPbgmyCBZvDnmGcXOTANCSLR8YA1HWPuMEsBn365uwO3nT87gvJ8hVRxUdwniVaUq3MZ+emH73qscdg4GG4KaK/yB0rOaUMTwZZTduOW9JmOrDkD1fyKRQe9WKUkiCziZ1zjJFjPqh3XihntMF6THVJ8NlQHL17au9nVbfITrgc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(6133799003)(11063799006)(18002099003)(22082099003)(4143699003)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?82fuhx8tm2Z4xGsyD2WdGnp2TDf1tGsEWKUG7uANbTFs+KYyI1Qi5udnFu?=
 =?iso-8859-1?Q?hZjH+DPPLGoIyoEQ02smKhV/x/Ss/gFK85YLs1l2tXj07gvdS7Ar+YS0Pj?=
 =?iso-8859-1?Q?CgClCtzejqbEVz3p5DP07sfvHPyr8huqqByHzYcqlVoAemzk367wWvF+5j?=
 =?iso-8859-1?Q?Uj07iyarEJ1c//ORxKa+/h+MIwJ2nE9MV2rH8At9EYR1UcRbSHFj/pFfuH?=
 =?iso-8859-1?Q?Jrou0OaGZVeXpWXznqVRh6zGzzjadW9q8zaSBOPa1ZOkj84MjDCQzuUi9M?=
 =?iso-8859-1?Q?cLUpW6OqApJz+tWGl1ML3TY71TJ5HG2dVzXZej4KeB7f/9PP03F2ySyCr8?=
 =?iso-8859-1?Q?uhi4zVYrQ2rRFVA9TeEJd1qfbMrODVVXnHmakBeNp1oUYaMQk1Csk7F+Zq?=
 =?iso-8859-1?Q?wkMkiE6CKNxBzBPCxhvRm/02OhaXvVCF4SotYHou0L4sjxBXosdb9adIYJ?=
 =?iso-8859-1?Q?S0/OFY+nrzPXsjNGN5MX/Fr4oybW7pEMLS6qnmZndWi9kfCahWs0be5gxm?=
 =?iso-8859-1?Q?q2ULU9M4nq1d9STJ0LXnCVS7hgpDnyubaMf0tym93Kbo2jeS9SUl9+KPGT?=
 =?iso-8859-1?Q?iG1IX9I05boH+nZM8pYFqtcwtTU9XZgq9Ay+ALSrSKqH8cJRQ6buOI5vMl?=
 =?iso-8859-1?Q?OjyyWXAxSB4fT++KU1cH3JSm03F/zTtuiQ5rjm//7865WwJK+Jwcet2OHB?=
 =?iso-8859-1?Q?KvFLAO6w8XiMHzFbPXBEk4weRJt4dB8DGg8VD6uZNK7ytC3FC5zIPUPWEb?=
 =?iso-8859-1?Q?nds4RWXZagirSEG3gFYYQd4N1t6yNz4cMy/Z8tXcwIeWwInf8vLVw/F2ll?=
 =?iso-8859-1?Q?b/Su+RPlps8xjMwsnNNDjV8jAZbljRxJkDfCKDt3wZeOx+o49UN6qJfSrm?=
 =?iso-8859-1?Q?KAuxgcVbVND/OVnZbbMUjs0ZXX42ZYULmS/ZOYLBSmNxZywIp9Zi84Dk0V?=
 =?iso-8859-1?Q?2+jQkjFXulfr59XVfHIFKg4XphBcD/5nGuafcOdUE/jAfAay559PkQujFN?=
 =?iso-8859-1?Q?Xx+iXT58hWJtmtobAO7LQd1rAeQ60p6NkB901TTB78DOdRWGer/6hFTI9/?=
 =?iso-8859-1?Q?6vUNnWML1LGN4iK/zCisn6JOgwTVhvJbJSjVhkyNYbC6bHPjW1E5Y7Pwbo?=
 =?iso-8859-1?Q?KgKwMTC+DDWkTxGHzP0NwNAcR2kiIgHT7dAE5B8bcqeqMDuGIDUhMx0E8s?=
 =?iso-8859-1?Q?PJFCPIPveYy5N5V88WEIKPKcLepeGke4BF1EgtspHDlhin/UWZ/3T5n4pq?=
 =?iso-8859-1?Q?v/hnzMnsXQM9ZZ2GZs1CmuB41f1P4xpQnA6arC6n9MUOBE44+2fgdhZYXv?=
 =?iso-8859-1?Q?iaXBmSqcXG25S/vrb+1/AlVH7vdMr60qzykzon9G6qXX8e4sSY/s486DBd?=
 =?iso-8859-1?Q?aN0K04k2OhKJeZ5VmPR/H53b9FCWFuJHHKJ/0ZDrdvqsfjcjfqN6ow7SAv?=
 =?iso-8859-1?Q?sY1/TRo1fruDMWQ1BVNX5fXQo7IPg+gJICSf7Vj0J0hnHhI9BHmPoY35Rw?=
 =?iso-8859-1?Q?7ywjP8RnEVjQjUsRNf+mf06nbqKMhnhkF7OtENpwTaq6TuFJzaBXUwJojl?=
 =?iso-8859-1?Q?2lrgphpdWTXkT5zAGLSQVzHv12n/esgvIBvkcAMuHCqnAVKgxXAXGotXQm?=
 =?iso-8859-1?Q?TnDuqi4bbulwrh2swS0yBI/K7M/gMj9K0n+AcTFYqa0b6h4oOmzeFRmj68?=
 =?iso-8859-1?Q?/n7n8qJVpuJ/kjaLkVgui/6yyeVAjGHRxkpPEn07uKQWWFx0T3Y3ad7AMS?=
 =?iso-8859-1?Q?KlIdGyF/h3xvUkJwGqS0DThRHq+Ly755AHH+MSuf5UI53oCDjT2C6x0l4E?=
 =?iso-8859-1?Q?ITBpDI7o6n4o5V5IrEk+EQi5V7g7zWI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344abb91-afec-446e-0dcf-08df023f4333
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 00:24:44.3063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMDXvpPPpbh17dTFaA82SY0tYpLhvRrhi+Bxz5MRi948ew32v8jRyUiKbFD/cD0LkaTPEICsE2+tCoZaBii3cPFv3Cna/jqj4io0vrtrKM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7829
X-purgate-ID: tlsNG-c201ff/1787617487-724B42A1-915D65EC/0/0
X-purgate-type: clean
X-purgate-size: 3753

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> is_espi() currently changes its result according to CONFIG_GICV3_ESPI
> and asserts when an eSPI INTID is passed to a build without eSPI
> support.

Probably you want to reword this part of the commit message. I think you
wanted to say that "assertion fails when an eSPI INTID is passed to a
build without eSPI support".

> This makes a range predicate carry configuration policy and
> causes callers to depend on its hidden side effects.

I'm not sure that I got this.

>
> Make is_espi() report only whether an INTID is in the architectural
> eSPI range. Gate eSPI handling explicitly at call sites and preserve
> the debug checks on paths where an eSPI is invalid without compiled-in
> support.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - New preparatory cleanup requested during review.
> ---
>  xen/arch/arm/gic.c             |  5 ++++-
>  xen/arch/arm/include/asm/irq.h | 11 -----------
>  xen/arch/arm/vgic.c            |  4 ++--
>  3 files changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..075e1d2c50 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -348,7 +348,10 @@ void gic_interrupt(struct cpu_user_regs *regs, int i=
s_fiq)
>          /* Reading IRQ will ACK it */
>          irq =3D gic_hw_ops->read_irq();
> =20
> -        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_esp=
i(irq) )
> +        ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));

I am not sure that it is a good idea to put ASSERT on value that we got
from external source. What if Xen is build without CONFIG_GICV3_ESPI but
hardware really reports an eSPI?

> +
> +        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) ||
> +             (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq)) )
>          {
>              isb();
>              do_IRQ(regs, irq, is_fiq);
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
> index e5aca17dcb..e14123a30a 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -718,8 +718,9 @@ struct pending_irq *spi_to_pending(struct domain *d, =
unsigned int irq)
>      unsigned int idx;
> =20
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> +    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
> =20
> -    if ( is_espi(irq) )
> +    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq) )
>      {
>          unsigned int nr_spis =3D d->arch.vgic.nr_spis;
> =20
> @@ -949,4 +950,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v,=
 unsigned int rank, uint32_
>   * indent-tabs-mode: nil
>   * End:
>   */
> -

Please refrain from unneeded changes.



--=20
WBR, Volodymyr=

