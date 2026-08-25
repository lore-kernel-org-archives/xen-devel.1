Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9ACC5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 00:31:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398989.1635224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyf3w-0001KC-7U; Tue, 25 Aug 2026 00:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398989.1635224; Tue, 25 Aug 2026 00:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyf3w-0001K5-4I; Tue, 25 Aug 2026 00:30:48 +0000
Received: by outflank-mailman (input) for mailman id 1398989;
 Tue, 25 Aug 2026 00:30:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wyf3v-0001Jz-6F
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 00:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyf3u-00GAKc-FX
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 02:30:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce13d-e002-0a2a0a5209dd-0a2a4502aaf0-36
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:30:46 +0200
Received: from [40.107.130.98]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6a8ce235-6ca4-0a2a45020019-286b82623749-4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 02:30:46 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AMCPR03MB911348.eurprd03.prod.outlook.com (2603:10a6:20b:783::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Tue, 25 Aug
 2026 00:30:43 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:30:43 +0000
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
 b=Jeb+vW8+y21E+EzLtXzaK2afTib5c5WOI2VhA+rzkS9lubnyqPT7EiBtx1fWwtY+DiWkNwLiTbqSirmJucp49lv/nvULcOFfbbNyt/FAyc+6dAdtcsG8iQbamR9t4uTanEzG7S2b9idFc90lVESsH1pOyMD36aD+XO5hCafpfF/f6cJABr4ROLgvIOvospr88i81E4OjrrZ6oFKM+JeO+puNVv5LKWYIi+mB51ifHM2vdBPjsDAdcZdIW6D45IbfxQfSLArPAUxs52HlVdXEdr1Ta0lKratZ98k8N0THcaN6dNLIu0cpYl4XU3hG+QwEBaejeGJ2Jr3omc2L0Ins9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ocv7winbKFqyZnOpLmAxx/gJ5F+ljN7dUelB4N7SnH8=;
 b=Evl2CVT8yRL9xcIECKfnWYFedPxj2reFqQ+yQK1EEIo4fNIS0eZUT7caF82jEr2gxCgOmGXuOK1OonkeK4l0MSwFJoJZCGb78sow3clF4gs8iS++4tDrbxSz4gN2MLCy6K8w0IqpMs+FblK8Pg245Nv8IcyQU6mYdKUVwpmF5ZWp2eWLZ3JQtYkgqPcwMxoSn/t5TwVQaFA5pkU6SoQsmW/U1WW2/TT+Tg6PwA4Cq+uvEA9E269bxaEOhn/PHO5amVLa0sGW+Dkp0qI3il3cSgNO8QUmEXTbN4ejxIzqzX8cKLursyjpVeKNkoXS2gPRqAW6s4TbiBmvvqyC7W+rfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ocv7winbKFqyZnOpLmAxx/gJ5F+ljN7dUelB4N7SnH8=;
 b=rwG99uOuCjmPoAUVsyPiYVvRNGqFj81h8bvV6nLP8bCWiFWDIAXgpEcEvouL+3MSJfTs+2z28Cja2nmrB4Ia/tgW3jXGEEWVK5OSo6jYJVzM/+q3ZR49PhePzS8YJeCj8XGCEAOeQRn3q1sOIkueVs+bFMQ97i1wLOhxRGXNVtWcG22lzljX3N8sN2dDfTNwsikIyE6/31MERM9TfYS1LuzF/6T5mJgNDVUsxvss5k6Ryw+KUR6BoDf3dGqoBuBvbj/AAcdI8QAobm6ueb9tKpuum50hr4pwVT6pUiAt3D9GVorpGWn9BDeDbMiiyg/mM5pOl8dESbWT9y5bJ7Y5VA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 2/4] xen/arm: validate IRQs before descriptor lookup
Thread-Topic: [PATCH v3 2/4] xen/arm: validate IRQs before descriptor lookup
Thread-Index: AQHdLwVdAIZJNP04UUyt5fXJ8PQg0A==
Date: Tue, 25 Aug 2026 00:30:43 +0000
Message-ID: <87fr03xcr1.fsf@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
	<355ff5a0aab671894a527ccb7b5999db6b168de3.1787050437.git.mykola_kvach@epam.com>
In-Reply-To:
 <355ff5a0aab671894a527ccb7b5999db6b168de3.1787050437.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 18 Aug 2026 14:33:00 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AMCPR03MB911348:EE_
x-ms-office365-filtering-correlation-id: 95c00883-5875-460f-0249-08df02401946
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|23010399003|38070700021|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 9jQ4qY+p0tUvctpHVLj17GjRdYDecHVRZwu0Ng+fMVAHQPEa0Sm6KBntcmBaJJKemNqUrYKpPzeZQMKJB4k63IP8fLvAaIyyBSayOQaMaDpiyf/iXo6a49Mdm/3hz0r+zt7hNR8VgMh/xDIO5Jvv4k26sxhkGV6qOz1qJEW1om1vBe8mCv0gnFzj5ToZXbBP1T01Nk93ZKYEd4Bv8pLc69KUKi+yxk+BoRn4fw5devBEtPMeI+MsoB8ByYmAtyBTo7FJGtd9eBIgOoNyWG+Pbvb4ezEFzYaIEDIJguDFJSl6D2muD7Ho25oE95TpsKHl+CXBeOjJOfr4HwdAxDK1F0Wa4jdfdqG+ayfydBntB9otOQuTRzC079Cb7t+NqGrBpIqFXHcDwKYsLTqH1lRZtwkGFO9snYeyyWZl+8LCfWpAHcn5Wwzn8F3g9KUe37jYBsnuyuJFxdDdK9FjpukAt2IQhmqHWkp5wLUSBlv9pGLNYlCj4OnaiSc5Pxfbx/TFbdzLdH35Lvg377hUSOvTtM8TJyVxi0XBdyQ3ciaEa2HFdL79VreFNEKP9qw4fp3rVBBv7k2rAyUdDbuMlCHxOGzqYyr/4cIkyp2lPvjdAm8GglS52oZiSdrIaiUx3Zjhgeu3dRbA5gaF7IqgGVk/Gt2MwGEcz672JEErcz2f2cwhZmeGz2n43Zsn7MT0mLbS1d62EfbVv3D601kZAe4uOX9MkHD6vfoSgMzAUzo3Pe4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VSyhJ2XxCN/BQJOISB0UWwtHZ3MuGjzavkbIiIRf+tJNpKih8M0cTqqFmu?=
 =?iso-8859-1?Q?eQ4L9yqmOfy3YaPKittLSGKvTcgOxWoA5xWNn+Y+1TTua1R0nyc9f+rhg0?=
 =?iso-8859-1?Q?m+cUjB8zdZt8+SPKs6XA2EuwaZyHnK/QrTB08k4/fYpu4t9Oy/qpyIKoxy?=
 =?iso-8859-1?Q?1jSuDe4aTK9dJZUHauVU8Zum5iLDBKw2ADK7pbU9bVkOvBUe5al1H85h7m?=
 =?iso-8859-1?Q?KJ6ShQgAUumPrEelMCEwX+hDEPHARvgNbqBaWVAAtmN72coz/fZFuMbRB8?=
 =?iso-8859-1?Q?Gm9/2DlXzmD3VXhyOOx4aZl1hjHRwkcaUXmILZHpJs2l+3v6AtX17Qd/16?=
 =?iso-8859-1?Q?Ie/XGoxsM4FGy3JbQd57DB6+JavEmrLhIHBkRm2ihIAZZSgRONL5ZQ/EC9?=
 =?iso-8859-1?Q?PENlKPytp+oTyEF7gVxexz80pCwc10EtaAyOKezC4+VBl90Zn7tTuHOkaR?=
 =?iso-8859-1?Q?yr5RdAjptr/PAH0wa4Y00EbvGkbigJvW6BPc8T9wMguN9RFfDnc8Rmk9YX?=
 =?iso-8859-1?Q?kIcwZQtyea9N5KieQs+OJENZXrhOn7Ewm19Cs2CGOcyNwWc57rNiTf7Sy/?=
 =?iso-8859-1?Q?J6kXSgZu3s6EtwKc4SCEGJ8apds2v6W1H/Py1dsv1n5mtIJk4BKLIcMGk2?=
 =?iso-8859-1?Q?s/XX6lYgaaj3biFK/AcgNTd5TjfHwE1RH3Dbqqx0toVztctKn3WJXPh6Od?=
 =?iso-8859-1?Q?f0R+iQN7lowVIx9s6ZKOvfOg5St0p+MkVdkRUAbULrMBEdk05BNLWu+xUL?=
 =?iso-8859-1?Q?YTtkicUw+RwHTkBaUfbhVv4N3fWrlSY4hZCP2jh/eOyAxOL74k6e2fvUk5?=
 =?iso-8859-1?Q?L2rjNDcozJe15zWZY1vBmGvHEbS9mzyMGSWjIdN6bZf686LfXoncWO/Mpf?=
 =?iso-8859-1?Q?sfeEjOw7QsFpSxi1OV8FCUE490oRHNt+Q/9gzIzD2i+dGIt27LigWOIPWt?=
 =?iso-8859-1?Q?eN06GKxmVXJYja+Plg7OOBkk1QowYThVfzrTuZE78Myknn9ZOTNOsXCgj9?=
 =?iso-8859-1?Q?AXZAAVWSxY5g6y5p7Cf9RMwxaiOgEzAsXFFtUacyrmicZXFMVrVgppmZ5j?=
 =?iso-8859-1?Q?ynRzewLjmZuHaA6A6iEMAdngp3jQoUNuEqM060YW8vEl0LbbBMnLBoEKPC?=
 =?iso-8859-1?Q?8/OI+0lR9aIhtKFGb53YiadA5c/Igv4SCTAXMAy/3LLiTE86nZMr1NeG/2?=
 =?iso-8859-1?Q?z+dypV6LUgULuSiwutr5bBAHo2fIyV2a15UkJrOajxqKK8BwN0LMI9phiD?=
 =?iso-8859-1?Q?4K9cMslgrJpqvIQlxzvtvacwXU2CFsHtm4RVa1TxRqgtSATs331eyZub9x?=
 =?iso-8859-1?Q?ZqY9gnTfjpcgqpZOOQiCzM1UbXOwwy0BsFVMIcVhritX369qNpyLSof1S4?=
 =?iso-8859-1?Q?vf2UOGrjQEcy8BDiM9naG6zchUFIWdvZvVMLYYQFRO/SEXnmq+5Rcsbj+y?=
 =?iso-8859-1?Q?qeeOjX1Fy2ZXIuwC823Lyx7tDgqiksKfqa47W7HJRyj+JSur+UZFF1UDAT?=
 =?iso-8859-1?Q?J7AfJFAQA12JzxWJ5d2CnWZ6yaulV2TUmNfDbh9RHCf5SPUGAk30fP+zzN?=
 =?iso-8859-1?Q?T1XaV3nWO8a5MYz0zzOlQbZKC7F5PKNyLWLH3tr8pNAIm6nHB9gg4NyuSH?=
 =?iso-8859-1?Q?rT/JoPb7YGXiWoZrbekeoKSZpNVGsof4h9oUnRIxIvsTdX+vhisyV5cJdw?=
 =?iso-8859-1?Q?5guGsVjiJB+wMJb5le2HNHCZ6i3kZSozwapS3oRPlOmjTpO2NJrNfKkPLL?=
 =?iso-8859-1?Q?xENrZC2vzpPNQ3kVmXCBrRmumLneLkAI8REcnY27yhgmdDz7q67Pmi7uOq?=
 =?iso-8859-1?Q?4TmYokkoAx9Tr3TnEYKIYaI5vzXsCIc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c00883-5875-460f-0249-08df02401946
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 00:30:43.4634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9TI86cA/sYIoelrTKEYdybIoe/zaUPjexhqbqoZ7bxB2IhgUAbUbCremLgVJYSfGrVEqOBAEIJpHEpC58aWZVtebyKYKSrH1EU0wdMBbCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR03MB911348
X-purgate-ID: tlsNG-720697/1787617846-30FCE2AC-2738744E/0/0
X-purgate-type: clean
X-purgate-size: 4115

Hi,

Mykola Kvach <mykola_kvach@epam.com> writes:

> GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
> through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[=
]
> and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs=
.
> INTIDs 1024 through 4095 have no backing descriptors.
>
> Validation based only on nr_irqs accepts an INTID in this gap.
> __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
> update unrelated Xen memory.
>
> Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
> looking up a descriptor. irq_set_spi_type() can run before the implemente=
d
> GIC line counts are available, so validate descriptor-backed ranges there
> before looking up a descriptor.
>
> Assert the regular descriptor bound in __irq_to_desc() so direct callers
> cannot silently index the sparse gap in debug builds.
>
> Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI rang=
e")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - Add the requested bound assertion and retain the SPI-only comment.
>
> Changes in v2:
> - Validate descriptor-backed ranges in irq_set_spi_type().
> - Validate implemented GIC lines in setup_irq().
> - Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
> ---
>  xen/arch/arm/irq.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..bf14180f97 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -23,6 +23,12 @@ const unsigned int nr_irqs =3D IS_ENABLED(CONFIG_GICV3=
_ESPI) ?
>                                          (ESPI_MAX_INTID + 1) :
>                                          NR_IRQS;
> =20
> +static bool irq_has_desc(unsigned int irq)

You are using this function only in one place, where you are actually
testing for SPI. So, maybe introduce irq_is_spi() helper instead? And
use it below?

> +{
> +    return irq < NR_IRQS ||
> +           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
> +}
> +
>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>  static DEFINE_SPINLOCK(local_irqs_type_lock);
> =20
> @@ -76,7 +82,6 @@ static int __init init_espi_data(void)
>      return 0;
>  }
>  #else
> -

Please, no unnecessary changes

>  static int __init init_espi_data(void)
>  {
>      return 0;
> @@ -95,6 +100,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>          return espi_to_desc(irq);
>  #endif
> =20
> +    ASSERT(irq < NR_IRQS);
> +
>      return &irq_desc[irq-NR_LOCAL_IRQS];
>  }
> =20
> @@ -416,6 +423,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags=
, struct irqaction *new)
>      struct irq_desc *desc;
>      bool disabled;
> =20
> +    if ( !gic_is_valid_line(irq) )
> +        return -EINVAL;
> +
>      desc =3D irq_to_desc(irq);
> =20
>      spin_lock_irqsave(&desc->lock, flags);
> @@ -647,13 +657,21 @@ static bool irq_validate_new_type(unsigned int curr=
, unsigned int new)
>  int irq_set_spi_type(unsigned int spi, unsigned int type)
>  {
>      unsigned long flags;
> -    struct irq_desc *desc =3D irq_to_desc(spi);
> +    struct irq_desc *desc;
>      int ret =3D -EBUSY;
> =20
> -    /* This function should not be used for other than SPIs */
> -    if ( spi < NR_LOCAL_IRQS )
> +    /*
> +     * This function should not be used for other than SPIs.
> +     *
> +     * The implemented GIC line counts are not available when early
> +     * callers configure IRQ types. Check descriptor storage here; setup=
_irq()
> +     * validates the implemented line before the interrupt is used.
> +     */
> +    if ( spi < NR_LOCAL_IRQS || !irq_has_desc(spi) )

So here you can just call if ( !irq_is_spi(spi) )

>          return -EINVAL;
> =20
> +    desc =3D irq_to_desc(spi);
> +
>      spin_lock_irqsave(&desc->lock, flags);
> =20
>      if ( !irq_validate_new_type(desc->arch.type, type) )

--=20
WBR, Volodymyr=

