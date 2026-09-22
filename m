Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1929C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 23:57:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429554.1652359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9ALc-0006Kz-UL; Tue, 22 Sep 2026 23:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429554.1652359; Tue, 22 Sep 2026 23:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9ALc-0006Ks-Rh; Tue, 22 Sep 2026 23:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1429554;
 Tue, 22 Sep 2026 23:56:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9ALb-0006Km-Ke
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 23:56:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9ALa-005qKB-BK
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 01:56:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab31538-2eae-0a2a0a5409dd-0a2a450ac9a4-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 01:56:26 +0200
Received: from [40.107.159.130]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab315a9-f2d2-0a2a450a0019-286b9f823685-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 01:56:26 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by BESPR03MB11843.eurprd03.prod.outlook.com (2603:10a6:b10:fd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 23:56:23 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 23:56:23 +0000
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
 b=uyZO44RDIa8+W8Prmn2wOsuMeRmDuK6P1Q/krv/qhyTGG9VBtCUs33WA1vwTxyDY6BAovuVh/39F+zMnfVKkcqfh8Pp7Ou6ZN2y5yRV3LcUOOomeQfQKL3cioV8yq2tB2N3Oi0X9oNFMHc9tphbO448/mKJl9CT8ryk9+sZcfb06lA3wFwPSgAQsMhqQgnrJ2R6bb8E3309dmFxOdfIyUi58x/WLo22cJ0gtklhq76ochbyFSrn/VdoJDVrvZmda/F1KmviPZVBYLze+IW1lN67jgusqs8F5y24jHuRo9wscdDMrIwo37Xv06KVAposBE4TUyK5/9wEySlabFbBlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Adt5AFFvngQlvhyNHuOWpyMqXZ3eaYAQIevhb8B0XYg=;
 b=UMySzeOYXcwO4P+Y62DLWljqAxj5dtdHuRCAAdb837cnRLnWH7lnZCsPptSpUi53RCmuHZZFGf6qEXuLsyYaUoWO+MPoRHszKE3HRVRnDA0eQOjtN5/rF7gO8O4sOlvU2Ua42KI5EN2fkGWOKR5xLj4a8DmWCE7CfJucBGoLDL+ZjRxt2VAe/CIN/MSelmxB9D6rKGEveB2FpCaOnIRvxfPHWkrx0UjIb8zyUUmtfDIY9GcIJONKmMi9gQyEPE4wlqCCvzONM56AUiywC5a8HyQLN8+l4tI7bmQraEXqmpj5+kQzZZ7Bz2VOtqym4hxWoqUKeizDacwWyn8jQXBXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Adt5AFFvngQlvhyNHuOWpyMqXZ3eaYAQIevhb8B0XYg=;
 b=H9b8Nfq82Umad38BJF21E2vagaCW2u/08SVcX9bCfaRssJAdDTiRIzhSkWMcuYf+mj5FmOzvV3TRJUEh3Sh5HdNENx/KY9Tmi9snV/rFxa4rlWujsxjLDsMLUus6pG9SH5q6ZDdQxUoNi4SQca1B2BhBQvCNpW47FqsqMd5qyHxsx80CQD+PZFxNf7U1QaFTsVpEtYHR/tPziWFsavuiGUNYf+YqeIFwTMFYW99Qt0FSFZ+VGjjM/TzZ6GVQot8piQl3jHgXnurm/PADyPYedYxMFIZdhcxckbANTkV/GFW+bdjPp3LWG/zuxJ56wDz2BRLlMsB/CsBDHMz7Nq+86g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
Thread-Topic: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
Thread-Index: AQHdSqtHErIjikKEzUu28tenN1pYhA==
Date: Tue, 22 Sep 2026 23:56:22 +0000
Message-ID: <8733v06dsq.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<e93b497d55dbfeb2aaaa9ff4b55b8925f902d395.1790089161.git.mykola_kvach@epam.com>
In-Reply-To:
 <e93b497d55dbfeb2aaaa9ff4b55b8925f902d395.1790089161.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 22 Sep 2026 18:58:39 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|BESPR03MB11843:EE_
x-ms-office365-filtering-correlation-id: 4e5b101d-c4e2-456f-c2b8-08df19051b0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|42112799006|366016|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 IAaXdv39pbSw4slbLyuyrrQCDg7DH1oO2q6Np87ia6Yxc7cXbglTOqxYpLQkhiEX/Y/vk+NAnqIAWti2iY1V5VmP+/7/rXUXOPzJqy18vB5mh4JXyH1VZoqpFByhwEFtmLfGl4C10ZlOQeWvYKur52nucn0J5sDuTBdRgkLVOJ2z/j/oWaQdSuZEuPTewjYA5Hjmo1SYtC5GV3sQ3xqnTGbIU0Ns5j1Z3GgVe3J/M67JTecMnjFwq0xs7Wq5/hrL2t7ysmXF+N7PLfohmpYoH/B/KEQdiqh9PxXvzPr4CuwOqEcC5wb/6boaAn5wbqN5QDK3b+nzJJlQ77DsxkIMQYgKMB5+BI9Z1eBqrWMc/8Dal+80HTzGL+E6hxumoEJ+8nj/l7AgkSdxPdz6fg7r2RPGMOH30uCFvpCwJgdldtk3zsStzqBJ+SALh0/IY5ADrzzDl+6hS1Egg78QzKnf2we7YFGDAaRMywmqUkGWEqyMxk9juzShHpFexExzi82W7OMfMoG0HBlbFEpBktCB8srckDCDLRwRm4zhMdNqpBjhjtIseobjCj7Z13yB6HaFtOnfXytiDfRZSqQHlH7wXEfBfNXlnptLXMq8TgfKgZLAtRwTem+xpU5gtWNgDHioBsjqpyFa6gXmn8I72LgJjRdukYXnFF+Zo/trGNoztV6C9XOYK+HxWrTfrhZ9fTUw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(42112799006)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zR8uU7eDJxoVp/r7f2u7vSFwe0PgFsK6qprJdgdcgEV2qnIlwPlJYT76mr?=
 =?iso-8859-1?Q?BHVTi1knEJM6tvwP+RRBndYb9d5rZCUczw+8nMqhubTDEhaDD3agi861Vo?=
 =?iso-8859-1?Q?wKeZY7sPJozWwtaF8ktECi5DS2S32oy0C4bbTJIbX8iqpvFL5f46jrsgCg?=
 =?iso-8859-1?Q?u0ztDQEsJm/c2uaNTjQDowrW7+KWEz5c4UNc+Tw9VOQZDXbnGT6yC9eA6Y?=
 =?iso-8859-1?Q?UMWVW3Onn0aOkcfXF3oqKN/bK81SSRxD2+BiPpPqrfcer8crlbfgdrm7tQ?=
 =?iso-8859-1?Q?qvd01P+3RcjxrVFIgvE9rVZxEBQwwkdc9EE03sg35Xr7iXsrCZZ4m/qO3w?=
 =?iso-8859-1?Q?nPSpSUtHiJnP7jEbqoIlOMFML2Yb6LSeEnvmBiOA33nUg+y/d4n0iMSpfa?=
 =?iso-8859-1?Q?PCf2iJU5WmGWZZesT/+hdXdOfPMxhfj578UxMBJNMSqO5txN3NhfYUCTuO?=
 =?iso-8859-1?Q?HIohwd0SGT1ehDnkTDLj1MipAIyfMNaE/0Va8hiVKQwKDlFdhw4p7N3Gma?=
 =?iso-8859-1?Q?dd5mdVabciteYEuFT0cyqlb0lmyK3qWjJnP/OzWy2ILmPh9ElFHwof/0Of?=
 =?iso-8859-1?Q?2CEXMHDxZZs04RpBVMoOpba1eSto1avsS+ELwO4fl5hBPLhrgaOo3Y1zwA?=
 =?iso-8859-1?Q?O/qjI/UQwg97P7yl3BvwxEliLcjFhTyzENVmjG0elzJMdeC+QI4MN4Nh6U?=
 =?iso-8859-1?Q?cAsd87UK6e+FSQ1y9kVQ4zqjtvqhWqko5TRFNAVP0MpMqTWzk9e0ZQgx1K?=
 =?iso-8859-1?Q?7TIKG6VLCxQjZirGv89a7pUErmtFlqHb9gmZupCNF16tGfRrmXgAD7viZz?=
 =?iso-8859-1?Q?DtNbvzbjrIhzZ9EZyNKMNnoQQ755OzQhkVyye5ifszMduyEOXYH/Jgp3LG?=
 =?iso-8859-1?Q?F5dwctA2eK4IKkrAiKigGzW+CWs/O0SPlFIbT5PKISNQ5NcGD7Xpd9wEzV?=
 =?iso-8859-1?Q?IH14ZX1lDIwUyuFkWbdZp3KXqdTg0oMPrjGPmz5DBUK0hv43H14zhCzzpz?=
 =?iso-8859-1?Q?JcXXkHba1QFHCWyOykvuKsBDsWIJfA7UvWXT2MvxZq21nud/EJ0Repn9nm?=
 =?iso-8859-1?Q?9J+tgafLlxvfZl8KNMx6nHUbNBCBSwX6ymWPgEIG5Sus4fjQlSu4SweVUs?=
 =?iso-8859-1?Q?6k9lb37695NBnF7j0cfbMYWMaEGCmlJghEi9kRFsjhgMIRR6g8+50RhRuv?=
 =?iso-8859-1?Q?F+3K+uhxt+XjHYSc20mUf+abykyfdIXx7nE5cBMNwbhbUrMqv1JKBcF0fm?=
 =?iso-8859-1?Q?ch0f3PW/tCzFBbwrQ8cikZffg51OyI+psCyX9UE4+GnIfT4TIbPV+OKWdG?=
 =?iso-8859-1?Q?eKiKUn3qeq9fxDx4QQissF/p6MVWUMZOLr5mn9X5HqbyfZP2dJ0EnJdhWg?=
 =?iso-8859-1?Q?CzVx2I/I9H8lDHzKsi7Z+TFQ/ansaqIdodBgS9WXgUKgdkJPHZf0j/ETAq?=
 =?iso-8859-1?Q?2odvx5BAKd1QZA+xrFnTPfRXZ1zadr11Z6kpWDXZF3YXSdBlX71q5rED1X?=
 =?iso-8859-1?Q?TBtcdzvAtNUiqjhOUr5dvkbefDnpMJoerc2v900oiqC55xz2HHoU1JsRjY?=
 =?iso-8859-1?Q?/be0Rl2QBspleETaFH5Y+f+VT8TD2thLvbLRChH+pZclrLRYGraDZEDfMX?=
 =?iso-8859-1?Q?X66TvQY8MnPr8DL+9cEO3iB5KAP7vUsQJ6FCJgSvZ9/O6SMuDq4Bs6JPgJ?=
 =?iso-8859-1?Q?F7cekagHF8Vk2DVdPY158LsezWSt90gC83tucRSlBYCOUuKog2Yi+EZKn/?=
 =?iso-8859-1?Q?K6dp59aWkzKXVDnPwBF+ncD1arVSevi3ytocugl5/ggbEgQkeFZL3g2k5+?=
 =?iso-8859-1?Q?M1oIdtUgjwh1S7orb4aHZZHuvf0/DUY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5b101d-c4e2-456f-c2b8-08df19051b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 23:56:22.9048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRPBds/5d0BRuLI+s/FbKqd+3SwIu9436CR0LtkQ/XhpxFpQhX2IGfz86CfyAodXKSjeB47sErcX68jPvoYZcmN+KVlAIjycp4R5gZZ/f8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB11843
X-purgate-ID: tlsNG-4011c0/1790121386-51CC3CFC-46DFCBA0/0/0
X-purgate-type: clean
X-purgate-size: 3932

Hi Mykola,

Mykola Kvach <mykola_kvach@epam.com> writes:

> The boot CPU pending table must use the memory attributes selected by
> ITS quirks. gicv3_lpi_init_host_lpis() is therefore called after
> gicv3_its_init(). However, gicv3_its_init() also programs and enables
> each ITS before host LPI state is allocated. No ITS commands are
> submitted at that point, but this ordering relies on that implementation
> detail.
>
> Split per-ITS initialization into preparation and activation phases.
> First map and disable every ITS and collect its quirks. Then initialize
> host LPI state. Only after that, allocate and program the ITS tables and
> command queue, and enable each ITS.
>
> The subsequent gicv3_cpu_init() sequence remains unchanged: it programs
> the Redistributor LPI tables, enables LPIs, and then submits the first
> MAPC and SYNC commands.
>
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - New patch implementing the post-4.22 initialization order discussed
>   during review of the ordering fix.
>
> Link: https://patchew.org/Xen/341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.17=
81847061.git.mykola._5Fkvach@epam.com/
> ---
>  xen/arch/arm/gic-v3-its.c             | 32 ++++++++++++++++++++++-----
>  xen/arch/arm/gic-v3.c                 | 15 ++-----------
>  xen/arch/arm/include/asm/gic_v3_its.h |  4 ++--
>  3 files changed, 31 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 325835b0ad..972825bf06 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -11,6 +11,7 @@
>  #include <xen/lib.h>
>  #include <xen/delay.h>
>  #include <xen/iocap.h>
> +#include <xen/init.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
>  #include <xen/rbtree.h>
> @@ -549,10 +550,9 @@ static int gicv3_disable_its(struct host_its *hw_its=
)
>      return -ETIMEDOUT;
>  }
> =20
> -static int gicv3_its_init_single_its(struct host_its *hw_its)
> +static int __init gicv3_its_prepare_single_its(struct host_its *hw_its)
>  {
> -    uint64_t reg;
> -    int i, ret;
> +    int ret;
> =20
>      hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size);
>      if ( !hw_its->its_base )
> @@ -564,6 +564,14 @@ static int gicv3_its_init_single_its(struct host_its=
 *hw_its)
> =20
>      gicv3_its_enable_quirks(hw_its);
> =20
> +    return 0;
> +}
> +
> +static int __init gicv3_its_init_single_its(struct host_its *hw_its)
> +{
> +    uint64_t reg;
> +    int i, ret;
> +
>      reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
>      hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
>      hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
> @@ -1189,7 +1197,7 @@ static void gicv3_its_acpi_init(void)
> =20
>  #endif
> =20
> -int gicv3_its_init(void)
> +int __init gicv3_its_init(unsigned int host_lpi_bits)
>  {
>      struct host_its *hw_its;
>      int ret;
> @@ -1201,13 +1209,27 @@ int gicv3_its_init(void)
> =20
>      list_for_each_entry(hw_its, &host_its_list, entry)
>      {
> -        ret =3D gicv3_its_init_single_its(hw_its);
> +        ret =3D gicv3_its_prepare_single_its(hw_its);
>          if ( ret )
>              return ret;
>      }
> =20
>      gicv3_its_validate_quirks();
> =20
> +    if ( list_empty(&host_its_list) )
> +        return 0;

What is the purpose of this check here? I'd expect to see it before the
first list_for_each_entry() loop.

> +
> +    ret =3D gicv3_lpi_init_host_lpis(host_lpi_bits);
> +    if ( ret )
> +        return ret;
> +
> +    list_for_each_entry(hw_its, &host_its_list, entry)
> +    {
> +        ret =3D gicv3_its_init_single_its(hw_its);
> +        if ( ret )
> +            return ret;
> +    }
> +
>      return 0;
>  }

[...]


--=20
WBR, Volodymyr=

