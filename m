Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65E8C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 00:21:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429569.1652377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Aji-00032Q-5I; Wed, 23 Sep 2026 00:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429569.1652377; Wed, 23 Sep 2026 00:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Aji-00032J-1v; Wed, 23 Sep 2026 00:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1429569;
 Wed, 23 Sep 2026 00:21:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x9Ajg-000318-Ti
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 00:21:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Ajg-00BMpc-6n
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 02:21:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab31b41-2eae-0a2a0a5409dd-0a2a450b9d06-46
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:21:20 +0200
Received: from [40.107.159.119]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab31b7f-b7e8-0a2a450b0019-286b9f77a1a4-4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 02:21:19 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by PAWPR03MB10167.eurprd03.prod.outlook.com (2603:10a6:102:363::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 00:21:18 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 00:21:17 +0000
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
 b=l3HQcR7wZo76gZ2fEggulvLJ/DBUNz2WGczgGCfLpFAEN/xmJvaiYCDaNxR9ApaF4L0PF52oe10Xqo28KkrlDkFi5vMssF34DX0fr7Wy2drf4YZywDPAdfN6VsfQ7Xq5iuj5wNR5vszpPw0TvD/wvLZnwmYopTNXE1lpHu/eG+UqCsiYnDqaCwJBOw1O1zCUADsu4ZFyHPKebZdDfjAS2LuhBrfw3ZWzW85vTEEl8X6kYUOZevdJ8sr+9jJBlmcUs/8K6pCjOkV1qN0YmeoFSFKldZO+UvmsuM9XP9HgcrcYPxGUfpkUdBtyEDtIawCJd485H/E5TuI3hULXkn+sXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfoGumbEuAkIDCu2v8ZkaLiloepCzdiLRBPfmJh5mC8=;
 b=MhnMjwLVX+r/0BT833Fj9Zo/l19X1DIVq4X6oQXFj7+G20Lg0jrrbxCHSgEckxLhF64YRfwqmYuUNMpn5+/rgrxFa2GCKpC3AW8hK7zUYix2iK7Q7Oxyc8CCTKBcNoGiqLcMwYvu2Zw70K37tMIoHxDPkyVFz1Z9SwQP4c2geEwmAvPTRboaWJoCUZA+XkS6IhHXAGJjkys7FTNZoYOu963IH9RHNFrlTF+r9mCfeRu9hy805HS/jiTDF0QqelqpTdoiwGmf5C+gyTjxiksyHX8g5iP9g0gifaicClK5jplQCZCPq/timU1ZCEVIwJfxJG9zWAXMYadC5mLbti/ajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfoGumbEuAkIDCu2v8ZkaLiloepCzdiLRBPfmJh5mC8=;
 b=d0njgTNkeaJOODWu30j6+CTPfkuk5tUEEe/8YzNyKXF1A29WU3lim2VOqhGvDcGUEmb+BFZwXjrfw+4VRHSqyhx8OzdJ3pkCWwzYROQ/buDQer7AcO3DnnubEU8Ef1rWjCBO281wdocXxW2uGWx2pfN+tOJqqHM56zLG98n8/DHzHWBlKMOKb8cgpwn68r5W0CNU6oEQ/+jCFEGsWpfhclCSJBTutFNQwJW1Ppd9//SXvcqRY6W/GUKLe46Zgpz1hV2sY8gWOkgtv7V6x2JrU8nj8A2MvNdcFHu37DGK77t3L9wXtjBYkcM4jjfHlw1fTFAGdhuwwBf3ObXMIGP87g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 3/4] xen/arm: its: refactor ITS quirk matching
Thread-Topic: [PATCH v3 3/4] xen/arm: its: refactor ITS quirk matching
Thread-Index: AQHdSqtNwidRcqNdj0yo3wTLZbOD6Q==
Date: Wed, 23 Sep 2026 00:21:17 +0000
Message-ID: <87cxu44y2q.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<a9bccc7d8054244cdbe754fd16b8d2faba01af3f.1790089161.git.mykola_kvach@epam.com>
In-Reply-To:
 <a9bccc7d8054244cdbe754fd16b8d2faba01af3f.1790089161.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 22 Sep 2026 18:58:41 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|PAWPR03MB10167:EE_
x-ms-office365-filtering-correlation-id: 0f60d11a-1ec8-452a-7fe7-08df19089602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|42112799006|1800799024|38070700021|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 bFg72p4Qg83RIFs358bq0LgF1TssGennVh5lGj9v7vwH4FWysXNn28HHiQxNZcg3kiAeQ39rzBR2/ZY/531A/tY8/A9lmWl13JO5s+C1GFgv1nKQSsIXFNVjcEvMftLv68N2zWiUVFQk7AolGfU5/mbLBesYqXAxFnL0jzoDPTJDEEVQjHJGi7vF3X2AmW4nMa8LNbnhNYLE1Q5V5RER39n8OE7o1wG1BE4Kc7H6NYXO+K0cdX0Kl1bFHoL52M1FsJ42DEoiuPBEl8Eu+5lz5QPjG2znye01FW3zvcRCu9nSbR/9YonaLEcBiFJRwIQvD+LgRJ7TaxRLan+3KtiULNxUGXZ2wzAAit2fnbCJtTHuC3meFWGYLUQr5zDfKMsiD8tlTjjwHJrkWVM5M9dsB4KbpNJIAe1+NTysGR6J21arqLxlaRCdPhzUbon4ixs6xyIPX4ihE938gPjJiB8qhGdyBdJ3Z8NT8bhKcH/RyyrPXwUrygR55IXPNXihi995aeI+j5f3ouapVRKMjZtp/TuPn69GO2PnOUxlPAAn+KJi6VW07yJ1zqGc/hL9+CsxpGrDq0IG2vUdU/hnU+cJaBZMguY9EkKaJ+uNal3fTNIbiI0PZn+z8we1On3sj9ypmCoOw2fAaHE4rMzT7qRYWk1DaImBqZaXvta0qzZLQS2iy2TyEeA1C/bxjQwzoOI+ADiXvcITdMD0juCEEQB9YppYbJzJ5ANv7MAkW+5WuqY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(42112799006)(1800799024)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uw605W2Cn5bBPv1S/nyTxS3A0JbnKPnI0xt3o1R147AuRKAucsPKDvpfgK?=
 =?iso-8859-1?Q?cJRuNSMpYXeVI5epTNMn8nkjFTm4bHf7sZXRTVcam8Ig2M45OOmtfSb5us?=
 =?iso-8859-1?Q?KI+CZvZRAlZAbvpMVuFN36rfemtPOpDXfV6753kCnUdlXpNvQRBx1rAz/Z?=
 =?iso-8859-1?Q?15RNmuJFC7Lq9RVWEU1Yuy9lE6uH/ncH2PfRUvvDPOf5NA92Aq+MbU+Syk?=
 =?iso-8859-1?Q?/QHx6fGdjyr1KG1EekHmJ4nWRmn5tLo3YJz31rcseGn0wCu4H1447VavZ1?=
 =?iso-8859-1?Q?ANeqi2r+rrBjJNL109NUYkfhDm1OBtdL1Ex/QHkROS0JM3xAgXSz9tq0gw?=
 =?iso-8859-1?Q?adYUzieFXBt/4cMcnSz5VAPP7LaqrdORlkHU835hfo7oUucs5eR03BA576?=
 =?iso-8859-1?Q?yAcu1//atsWyRj/nWwHXCYYHeFewLGNZVo16jj/nLfICzJ3UfAEBT+DVus?=
 =?iso-8859-1?Q?EUwz/IhbyfKv3tIs4DnPwVSSbZGxHGhUSpSW/6OUaeF9lNDOLv2aCkrtnR?=
 =?iso-8859-1?Q?v+fYo1sba0clrJnjdZ0yD34DaR7IwGgR6eMadzMOh1nCblDbwoK6IZjRfS?=
 =?iso-8859-1?Q?VQJYFQ14/lwMBnwx7w9gMmxj7+fgzLjetMeuBhvYOgq5VwDEwS9WK443fU?=
 =?iso-8859-1?Q?MbJ5Hd89ZqEi/iROUX8hN4xnyiosW8OJOB8CHl3cf99RPRir5KpVQvxXDi?=
 =?iso-8859-1?Q?wal4tnaXRgWypSzQtrn8z075zJTsv8abW/qptG/xM6H6G/osmUzWPr/ovZ?=
 =?iso-8859-1?Q?iUbfgVBikaS4fxn9lK5FOQlk6q0EkwPhwXwvBd0Mq8izFatAxkp4UeRgaA?=
 =?iso-8859-1?Q?y18pZrzo+qMMEwXBNHQILkt1k+/dr66eVnLcVDYLsJaHi65uEDNPJwZ5Xo?=
 =?iso-8859-1?Q?4qxNyW65e3WrTPgVA/vsSj7xGn1P+dHtjCqR+mlRGy0bsOnNLn9Fs572KC?=
 =?iso-8859-1?Q?wjWj8QIolWJoIthndMelkza9BZekcSoEcT7k1NiP26YmwCWsmfw+w7wdRl?=
 =?iso-8859-1?Q?5MRfqfYKesqk2+cuzWDV2oDOS09oGJYYoEsrDjDKH+7ou/+TJOMjuZkF9z?=
 =?iso-8859-1?Q?PNqykB/tdKH6/8P9WYv6VRzgfAZy2g8u2g45AhIyL9BUu45x7VLLcsRWmj?=
 =?iso-8859-1?Q?ToQfX6rXeqr58Tlg+jwG2Tqe6ShYPXhZtdRMNgITB1mmWbfQiTF0g8Zzza?=
 =?iso-8859-1?Q?G4gG68D9K9gDQ34bBH8YoRFq+Z1C41B+LUUReK0D2l57rSmwttF8wDVQNC?=
 =?iso-8859-1?Q?1e6Wg+5oBbGXS1UAqxMt9pGqHoifWY9yaFq1U4AyezH73RO1vU3X0SubyK?=
 =?iso-8859-1?Q?qG1hWPAW62HpCvj6ALavxVz9czdSBOpj7G23pO9BkBjrzqn8uOxA4mR2fn?=
 =?iso-8859-1?Q?1xvDaowTIxF95sZuUwEEi0w2bVJisHCA+XsApDYOvi61JJUGUYcPkPoAGt?=
 =?iso-8859-1?Q?NXwWHupp0psGnbEZUZtC9SNpp+4PfyGcMrIGNzqUXr3I3imfGOfd5Ze2zy?=
 =?iso-8859-1?Q?nk8Qj4U/T4hLdkJBiNT4PKwzpH/qatujOWRTsCRi4JJohtKpsTveJ/kzhj?=
 =?iso-8859-1?Q?xQOprkJH1RgswmtmbdweWjSvKtz1oWauQ7QwYV0D1bWngdZ6POTzQGWLES?=
 =?iso-8859-1?Q?RyiAm3b/SsbR0F21qI185WFlPlJeY7fwD/A0+33mRWErR485Rn4D+5c0jC?=
 =?iso-8859-1?Q?2OIhCoypVNN6usg15RF6H0DZwMSPed0f8dRt5vWEzMHu5q7dhTqhz9lZnu?=
 =?iso-8859-1?Q?EFI5huNQC+rJc20o/nacPjQIvPIcSjxjstPwgUNgawe/phMcJT/BVmI8n8?=
 =?iso-8859-1?Q?QjYwwfZgV4qWwAJsOoS6KxFADIRHVhg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f60d11a-1ec8-452a-7fe7-08df19089602
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:21:17.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6cHct4bt31QbqGEs7TEalAlU6E7+FsyEOAARKVJ6S4bxWlMKcADISyO3AD2kgMPdVB/4R/4jP8TPXAR29eUfUx6D8z6yDQLia6q5bLa+V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10167
X-purgate-ID: tlsNG-42698a/1790122880-1A6DA9EA-EE277EBE/0/0
X-purgate-type: clean
X-purgate-size: 6323

Hi,

Mykola Kvach <mykola_kvach@epam.com> writes:

> ITS quirks are matched only by IIDR and mask fields stored in each table
> entry. That is too coarse when the same GIC IP block appears on several
> platforms but a workaround is valid only for some of them.
>
> Replace the fixed IIDR fields with a generic match(hw_its, data)
> callback and an opaque data pointer. Add an IIDR matcher as a reusable
> building block and use it from the R-Car Gen4 matcher after checking the
> Renesas machine compatibles.
>
> This intentionally narrows the R-Car Gen4 quirk. Previously every ITS
> with IIDR 0x0201743b matched. Now it matches only a DT-discovered ITS on
> an r8a779f0 or r8a779g0 machine. ACPI-discovered ITSes and the same IIDR
> on other platforms no longer match.
>
> Keep first-match semantics explicit. Assert that non-sentinel entries
> provide a matcher and that IIDR matching receives match data. Retain
> runtime guards so malformed entries cannot cause a NULL function call
> or data dereference in non-debug builds. Place the matcher data and
> table in init-only read-only sections.
>
> The matched entry still supplies separate ITS and LPI flags; this patch
> only changes how the entry is selected.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - Document the intentional narrowing of the R-Car Gen4 match.
> - Add the non-debug NULL-data guard.
> - Put the matcher data and table in init-only read-only sections.
>
> Changes in v2:
> - Replace v1's optional platform callback plus fixed IIDR/mask fields
>   with a single generic match(hw_its, data) selector.
> - Add a reusable IIDR matcher and use it after the R-Car Gen4
>   machine-compatible checks.
> - Document that the R-Car Gen4 quirk remains DT-only.
> - Keep the split ITS and host LPI quirk scopes when applying the matched
>   entry.
> - Document first-match ordering in the lookup path and guard against
>   entries without a match callback or IIDR match data.
> ---
>  xen/arch/arm/gic-v3-its.c | 73 +++++++++++++++++++++++++++++++--------
>  1 file changed, 58 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 454fd0e0ef..f52232ca40 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -54,8 +54,8 @@ struct its_device {
> =20
>  struct its_quirk {
>      const char *desc;
> -    uint32_t iidr;
> -    uint32_t mask;
> +    bool (*match)(const struct host_its *hw_its, const void *data);
> +    const void *data;
>      uint32_t its_flags;
>      /*
>       * lpi_flags are ORed into the global host LPI policy and must only
> @@ -65,11 +65,52 @@ struct its_quirk {
>      uint32_t lpi_flags;
>  };
> =20
> -static const struct its_quirk its_quirks[] =3D {
> +struct its_quirk_match_iidr {
> +    uint32_t iidr;
> +    uint32_t mask;
> +};
> +
> +static bool __init gicv3_its_match_iidr(const struct host_its *hw_its,
> +                                        const void *data)
> +{
> +    const struct its_quirk_match_iidr *match;
> +    uint32_t iidr;
> +
> +    ASSERT(data);
> +
> +    if ( !data )
> +        return false;

It looks strange to have both ASSERT and then this check.

Maybe it is worth to remove ASSERT and print a warning in a debug build ins=
tead?

> +
> +    match =3D data;
> +    iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> +
> +    return (iidr & match->mask) =3D=3D match->iidr;
> +}
> +
> +static bool __init gicv3_its_match_quirk_gen4(const struct host_its *hw_=
its,
> +                                              const void *data)
> +{
> +    if ( !hw_its->dt_node )
> +        return false;
> +
> +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> +         !dt_machine_is_compatible("renesas,r8a779g0") )
> +        return false;
> +
> +    return gicv3_its_match_iidr(hw_its, data);

Do you really need to match IIDR in this case? You already know that
platform requires the quirk.

> +}
> +
> +static const struct its_quirk_match_iidr rcar_gen4_iidr __initconst =3D =
{
> +    /* Implementer 0x43b identifies Arm Ltd. */
> +    .iidr =3D 0x0201743b,
> +    .mask =3D 0xffffffffU,
> +};
> +
> +static const struct its_quirk its_quirks[] __initconstrel =3D {
>      {
> -        .desc	=3D "R-Car Gen4",
> -        .iidr	=3D 0x0201743b,
> -        .mask	=3D 0xffffffffU,
> +        .desc =3D "R-Car Gen4",
> +        .match =3D gicv3_its_match_quirk_gen4,
> +        .data =3D &rcar_gen4_iidr,
>          .its_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADD=
R,
>          .lpi_flags =3D GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADD=
R,
>      },
> @@ -78,18 +119,21 @@ static const struct its_quirk its_quirks[] =3D {
>      }
>  };
> =20
> -static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr=
)
> +static const struct its_quirk *__init gicv3_its_find_quirk(
> +    const struct host_its *hw_its)
>  {
> -    const struct its_quirk *quirks =3D its_quirks;
> +    const struct its_quirk *quirk;

Is this change really required?

> =20
>      /*
> -     * The first matching quirk wins. More specific quirks must be liste=
d
> -     * before broader IIDR-only entries.
> +     * The first matching quirk wins. Entries that match a specific plat=
form
> +     * must be listed before broader IIDR-only entries.
>       */
> -    for ( ; quirks->desc; quirks++ )
> +    for ( quirk =3D its_quirks; quirk->desc; quirk++ )
>      {
> -        if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> -            return quirks;
> +        ASSERT(quirk->match);
> +
> +        if ( quirk->match && quirk->match(hw_its, quirk->data) )
> +            return quirk;
>      }
> =20
>      return NULL;
> @@ -97,8 +141,7 @@ static const struct its_quirk *__init gicv3_its_find_q=
uirk(uint32_t iidr)
> =20
>  static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>  {
> -    uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> -    const struct its_quirk *quirk =3D gicv3_its_find_quirk(iidr);
> +    const struct its_quirk *quirk =3D gicv3_its_find_quirk(hw_its);
> =20
>      if ( quirk )
>      {

--=20
WBR, Volodymyr=

