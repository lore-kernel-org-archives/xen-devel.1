Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD13CA9ED0
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 02:36:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446647.1662738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGSNO-0004Id-Sn; Tue, 13 Oct 2026 02:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446647.1662738; Tue, 13 Oct 2026 02:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGSNO-0004IW-Q9; Tue, 13 Oct 2026 02:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1446647;
 Tue, 13 Oct 2026 02:36:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xGSNN-0004IQ-TJ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 02:36:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGSNM-000IbZ-NR
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 04:36:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd9907-2eae-0a2a0a5409dd-0a2a4501829e-26
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:36:24 +0200
Received: from [52.101.69.127]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd9928-5984-0a2a45010019-3465457f80ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:36:24 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DBBPR03MB7131.eurprd03.prod.outlook.com (2603:10a6:10:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 02:36:22 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 02:36:22 +0000
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
 b=omz/JBFtzmN3q6/kwgewMiiGI2qmlGAKpa6h0IfC43SwTm8mGsGBesQiXLSxIM7c0y4TwVoANV+9nRG5O5LUUBhkr5h3WFtchMen2HKEyM0wkYpJ5CWItQ7CCNOCopWQGB8788iZj1DeSDVHKOqkJm/kTJR8m0oINR9dNhl64RGqxyIf47SNEtk/ZFfEAxZZZYflMYpESH9H8h1vX4U8NRW5OLzCQPx00MfmFcT51A6l/6CnC7AyZylSBQIt6E7slHUQJgpN7k5p9UIqhJDK2YwZF87oe9SXqKyWFqO9Zpo8ILZWPLOeIvsmA92t8CA9xTodhjPEPNKRKC5xWqaS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPUAuZ0kYTtEPwG/2/FzO313L0dzqENwj5fDeJV7Wj4=;
 b=JvwbUi2LX1M2MFGKOmOkKPL5lNAr0LfmFNpNSmh15gSfGbBUgZKj7iYIYjZWEDGdxdHTp9CHYg1ds40I87acQf9jo8rMbhWibcHgmje/Tq8YDvRhgPnc+kIMlQkYbQ7dkqaiymJBKXk1SQl6Xz0VhlcOg72xCn17/IkySoXk6Fz8xtcBGIs14Vk4VBlkI5/Bn8M6q2JRuc7eGic9EsUMyuV9JC5RwYL8/QabQduoEIT9PcB2j8VfECcu7oX1EUYm+ztfUdPuGBoi+cCbxb13kYvz7rIA0L1QKcnviraN9mOxGIxyqFM0YnIXRPujIGksZWWoPU8VzORWUn2MSUQSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPUAuZ0kYTtEPwG/2/FzO313L0dzqENwj5fDeJV7Wj4=;
 b=d9fSGrDe6+scQCeB+gaoCFUSXvwS/dYUToa9WXNtsPm0RUWykOJPfViOGLOK65QqcCPMG/181HpgMunlUftsibPSVozIWg4p3vesPeCAyTqhBFzhxaEfAH/AzuNj2dd9+myOmMzYseFfvS6syDcaKDBEG/vq8pyQzdD1eoIXS2WhG5IZ0bLR/Poow/jQ+BiXRdjhJNx1XFa9cOjJPYflcNE0pOBp3wd9YsU6ngAr9kf2PAYHS83YCbwlqiQ6lmendAgIuBvvic4tj9NfcOl0lnpTeTQKLiKLOERBg7x3Sqo/0H16x0U1Ki+NyTfmAaChoUwRVTMdD3QsgTIDPNlx4A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
Thread-Topic: [PATCH v4 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
Thread-Index: AQHdUEUSTD/ibdik3UGXPUfUToT1lQ==
Date: Tue, 13 Oct 2026 02:36:22 +0000
Message-ID: <87jynmwcm2.fsf@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
	<0afac276107d8b2a170489950d75e611c69a599b.1790707009.git.mykola_kvach@epam.com>
In-Reply-To:
 <0afac276107d8b2a170489950d75e611c69a599b.1790707009.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 29 Sep 2026 22:02:10 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DBBPR03MB7131:EE_
x-ms-office365-filtering-correlation-id: 8df07605-0243-4fd4-3cba-08df28d2c52d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|260925021311599003|260925022911599003|260925021911599003|10067099003|3023799007|38070700021|11063799006|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 P7U03EB38TNOTboi5mEA1qx1wLMnFxoXsolsRC+EvG80ZrWBqNf8QVEfdPhG2D33TPGofXr6+kzckFwj4dLCDorSDdawZrzR0qSgiZ5iHsE4KoiMQpsLmjV63DEd+yqiJ4GtgGy9ijlZTrN7uQnshdi6YI16eTLKaaDCmhZXTnkWh7QCS0RP6DhEcBpMEVKnVu/dAruF0+iE8YD373MWAn/A68JYVekr4+9R78/M5LZv7J9hzOJV8TGypr3F/N3/c+T3BDWb3sh2x3ldz9BdBQmhpuGuAeFw69Pv5qCW4ZqwD/l7k9HvaPArUCrDp8BV55i6SJjnhGDllzkDVWLMeJMeqaMw/f2pi9RYiU18V2sYOlpsOtmJbcsfIA/ZHTfc6ZgPvmQRJR9/3xolnrAg7ewd4+3PH6pIsw+6xuETEXWoiaY6VwxBKd9ZjoAv/KyMQ/2BMaE6g+dHel5rbhXPrgwtSURkvvXz2EBnI59OYeEetGusVSMOQct8QeubObr6QqSEIQ0hKQ/1xNkHHumn1kksvh89eCv3KIKjwRpt03yq9myE6d1zbnbw1/0MgPclL4ZhR/QgPN2SJaS4RMYUUIbXN0sygscvkJwX5oBSUCKFPsHLo1b180dIOvK+zJ4zNK5oRE+1OrwuomA+evStkxCYYbQsKgfb+5ElKlkxgZQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(3023799007)(38070700021)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0mYyeq9Q250oNr8b8cH6HPjbRHFORWCRgwLfuBR5kOzUmrVQ3Kl2sBQPV6?=
 =?iso-8859-1?Q?7a9DURUyemcGLEUB7+XWYUX/ju3Ga99BxKaHH84kUK6DKWB9G3t8Qb/8uX?=
 =?iso-8859-1?Q?1Zh69sLDxDSOJESkFW8PKtKvVV2LD1lV5JzVq5znnXbXGn39SRX3Gb65W1?=
 =?iso-8859-1?Q?h1KeKrpxiKzgPx4qycSX19M4+4mJHCH1MzU1k8LhqDJkTOFmA2fN7sOf5D?=
 =?iso-8859-1?Q?Z154WtHTs/3SNSyiOsNx0x5i+QW+nKzNo+6FIHEhiq+RSVHt22zY1RS2KR?=
 =?iso-8859-1?Q?yQ0gEWbccca7jzfslJj5AGkVkWqBb+i2zPAOebv8A1HUFEr1r9NgOPgwwT?=
 =?iso-8859-1?Q?t/NtOv2Glva4K5V3grwC0ROC7FeKdThL0MuM14YjxRfsAeLCuWgTegwfEj?=
 =?iso-8859-1?Q?C/gUOCYPDEFQhfRaHYxCqQFTOU6ab0hKKdxhEIzdksiIAhWGCK41C6j4tP?=
 =?iso-8859-1?Q?ZpCW6tZygdIm2oBj87DOECoS5gsL4akWrZ59QgiuyOugMiv3TC8ltx3s2O?=
 =?iso-8859-1?Q?xB9I1y+ikNybn9jrn88H7rmmOEu6lg6dNW7kNsZty5yESotECGChioTgYY?=
 =?iso-8859-1?Q?4y4KEFuuz2rJBar/OHWHwAUh+RnTpHBTn8qPD/Za44hS5kueySeyD885Cb?=
 =?iso-8859-1?Q?uhFcrYC5eH81GNlbGP5gLGJl4vGM4OWSy/WeHEQJHeyWXfp9SzuwSvedJ5?=
 =?iso-8859-1?Q?8WQ7EgEZhDBQ57JG3QhBqmBbrumuTYE/7S3+WwTi4bSB6Cz5acm4h54fuT?=
 =?iso-8859-1?Q?ihjIo2BRsxtJttGxZ0QgDaaG3ii1U9JDFpw54owSHd/YsSvzcdqw9CPQ/H?=
 =?iso-8859-1?Q?TLNYgdQA/5P1Wl8umiffmECCM3hTpIoHWTZ6B10TyXrHmT35FP28aHxT5D?=
 =?iso-8859-1?Q?VBukskSyPQ6UOQboJSdPkfA0jIPcc1MzaoSOJKZRPBHv8ZCBpN6hhaUn2K?=
 =?iso-8859-1?Q?k0xi3uvLckhV6oKXU5jo1hdqlLo2fTYvfjIFKzbnMpByJPb6LbqmH6ksy8?=
 =?iso-8859-1?Q?x4RHZ8HQ1paBYH+142w5L8qVLUNexnxn58d+CTa4mGEoQVz47RW3WKvV7p?=
 =?iso-8859-1?Q?P0ozgpkVvL6kEVK1Wh4znoy6e1N3rEUeDvmxnLsKOnbLLHC1HFyDozs1Pq?=
 =?iso-8859-1?Q?cqPeWSZ0fTOBIQvAU19vV3SMDipSaDN7IO/t2ZaS/CArXImu8BEZnpDLQH?=
 =?iso-8859-1?Q?x7BXstPSU1wScARe21k9WWddorkJ369vPJ8kny22fb2mOATLAYCkx7BV9t?=
 =?iso-8859-1?Q?Tdq1y1m8i5xPu+q4dMVeICu7UVUVGhHZhTxQWPpjRxU+4UDLCo75tH5l/L?=
 =?iso-8859-1?Q?cYLwmxs7Ujnelr0OB5EPLL+QxzXIhBJK/wyjEQL6QvI3HQMG7jHg98eSSH?=
 =?iso-8859-1?Q?SFVeqT8vnL38oLzZzmFUFLk/FtdnyRHjj/FRkKhZDtGXR9aGO9NbLJqotK?=
 =?iso-8859-1?Q?6tfEBpjuujcZvZtEHn5dG35yQEZlu7qL9mbb6tKb2g4O2n5ChTc8Qf/KuF?=
 =?iso-8859-1?Q?sUhXsDrwMbegqyGvV48umDO2k1pZds/zO2v6BBLo/h2FkVTI79CzorvOL/?=
 =?iso-8859-1?Q?+LhXV6+2f1DO5kt7UJeW24d7xZX2BScz6D+itYUMA+14/qJE2bUUOshuDZ?=
 =?iso-8859-1?Q?1Xx2+2HQ871zekTe4u8nBfmliwr6ZguhRflm3KFgL6Net8NEzymqiy3c7f?=
 =?iso-8859-1?Q?Q1okihLIq88pO4Gtjx+pB+f2hiqyid5mpNzr6XlLCzGJ8IpILNQnNk7BIw?=
 =?iso-8859-1?Q?+2GAflXUoBdH3iMP7nejMyqupmFesUaytquzhTl9djnrZ16o7Ks2H1Pw22?=
 =?iso-8859-1?Q?5AEbFjZ3p3J9M/SqBefjiqC6VCSeczk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df07605-0243-4fd4-3cba-08df28d2c52d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 02:36:22.5800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yj8pPNqwZTYZukBK8IAuKDnfuyQl0n5bkaIZrn6FDf3UBlp1igYe4AgYKuYafN9TrXEy0gXdOaBYQ0GIXlQyI9iWaVu1B35OkZXH1YULY6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7131
X-purgate-ID: tlsNG-d62444/1791858984-1F66C757-83BAEC3F/0/0
X-purgate-type: clean
X-purgate-size: 5996

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

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Changes in v4:
> - Move the empty ITS list check before the preparation loop.
>
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
> index 325835b0ad..511e49a116 100644
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
> @@ -1199,15 +1207,29 @@ int gicv3_its_init(void)
>      else
>          gicv3_its_acpi_init();
> =20
> +    if ( list_empty(&host_its_list) )
> +        return 0;
> +
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
> =20
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index acdac22953..6bc3e313be 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1984,20 +1984,9 @@ static int __init gicv3_init(void)
> =20
>      if ( gic_dist_supports_lpis() )
>      {
> -        res =3D gicv3_its_init();
> +        res =3D gicv3_its_init(intid_bits);
>          if ( res )
> -            panic("GICv3: ITS: initialization failed: %d\n", res);
> -
> -        /*
> -         * Host LPI allocation uses ITS-derived memory attributes, so de=
fer it
> -         * until after gicv3_its_init() has discovered ITS workarounds.
> -         */
> -        if ( gicv3_its_host_has_its() )
> -        {
> -            res =3D gicv3_lpi_init_host_lpis(intid_bits);
> -            if ( res )
> -                panic("GICv3: LPI initialization failed: %d\n", res);
> -        }
> +            panic("GICv3: ITS/LPI initialization failed: %d\n", res);
>      }
> =20
>      res =3D gicv3_cpu_init();
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index 02c083f210..e1322b94f8 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -156,7 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
> =20
>  /* Initialize the host structures for LPIs and the host ITSes. */
>  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
> -int gicv3_its_init(void);
> +int gicv3_its_init(unsigned int host_lpi_bits);
> =20
>  /* Store the physical address and ID for each redistributor as read from=
 DT. */
>  void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
> @@ -245,7 +245,7 @@ static inline int gicv3_lpi_init_host_lpis(unsigned i=
nt host_lpi_bits)
>      return 0;
>  }
> =20
> -static inline int gicv3_its_init(void)
> +static inline int gicv3_its_init(unsigned int host_lpi_bits)
>  {
>      return 0;
>  }

--=20
WBR, Volodymyr=

