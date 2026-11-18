Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D4E606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 02:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=uFh2r3xM
Received: from list by lists.xenproject.org with outflank-mailman.1493579.1693489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTV2n-0004uL-O6; Wed, 18 Nov 2026 02:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493579.1693489; Wed, 18 Nov 2026 02:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTV2n-0004uE-LW; Wed, 18 Nov 2026 02:05:05 +0000
Received: by outflank-mailman (input) for mailman id 1493579;
 Wed, 18 Nov 2026 02:05:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xTV2l-0004u7-Hx
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 02:05:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTV2k-000YLf-Qi
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 03:05:02 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6afd07ba-e002-0a2a0a5209dd-0a2a450cbdde-10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:05:02 +0100
Received: from [52.101.83.138]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6afd07ce-f479-0a2a450c0019-3465538a762e-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:05:02 +0100
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 (2603:10a6:150:805::10) by AS8PR03MB8467.eurprd03.prod.outlook.com
 (2603:10a6:20b:529::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 02:04:56 +0000
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544]) by GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 02:04:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2J92/mUE/bSIKo/XWjp1K6NfFM0k+naC5wjTlmPu7UiO1xAgNd8AlUFpsmHmde4Q1qF5JhGyaw5tSZZgrm+cfeuLyW4Mjdnf4bqM6nlDM0kCfMtba7+TRiA/3qftvWS2sk8PlZlZLDA2MLynNsncMW1ZU8gN5A5QpqxjEGnMudq887kDYoUJx4OimRHc2nxQu/hQUzsVGOttoDQ0QVDSI2gnv+jIcuZYP6fLBuLJPhgcgoIXlmlN2RgWdN7kinpS8LjbSt3OhnGJkxKl587NO91d5FIvJ0SKqDkgVtD0azSJ+eofEuw527u+H6vL7KPuQdpfVbbIyMgCF0+Ah3iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHcjllk6KTl6GJgoRWYZw9oDjzvNxyt2oYgVCpo1e/w=;
 b=p432CJBTAtfYS1e02WFgyIEs4l/j8oZnK1pEagQu3D1y+izjHkoZpgFnZ/BpIaZ+gmHa/+dDrHlYfjWEOAUbO5RmGUYuDe2Pbc/OtEhS+D1XgXH6gr/ooU4saE6HZ7vRC+XbNIB0OZt+VGFHKTrMfz5aTZiIY4rs3XfQZ/sm+VMVBkRuQnIw5MqV63Deu0oZ79c7EOAs/VrY/xLZOu4i4EYKHF5V46FzehMegOHnmZg8/H1K7z7UYBWv7Jb3rmJMKTrMcC/vzT6G8czA33QVMRANSMFIYaWPiUJeVyJu/yLllqp5A87+oe4DCFLOhhAg4CoXnyu5MVsxSHPBp+cMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHcjllk6KTl6GJgoRWYZw9oDjzvNxyt2oYgVCpo1e/w=;
 b=uFh2r3xM9cezkTxbGtZnuCGvjygp86IHco8BG/9a1hipWCXMvwELR0cEIh8ek5rbBFDhQkCk9D4+5K99MIQEh7b1RtvOlfY3Pvw8W7zaIR4LCZJWhf9X1l+hEX/cft8XQ7bDPhGlOykfvmMvAYNOIBJHZDzuhXLKYGT5rE3sTcu3qBX8zsbCG0OrFvk1yimQcHrsDX6LIdWfWUyOotQzW0ZXg2JIP3zpvj5q9EGWIBisXNwJSTV1A3Bur6tT01GMTj8Jr2tl73r8D8wCcG4OQg606WOMN7qWIw4FDaqZAwIeEGNXqpsuc6wRHHDqfuYjweuxsPvk/m2yrR17juwxEg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/4] xen/arm: guest_walk: refuse a block descriptor
 where the granule has none
Thread-Topic: [PATCH v2 1/4] xen/arm: guest_walk: refuse a block descriptor
 where the granule has none
Thread-Index: AQHddvgMeyG0orwvkUSe3KGMpYyQdbczFHiA
Date: Wed, 18 Nov 2026 02:04:56 +0000
Message-ID: <87v75unbco.fsf@epam.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
	<b29ceab6082cae0336e56c6695e661b0c8e12813.1794962603.git.stefano.stabellini@amd.com>
In-Reply-To:
 <b29ceab6082cae0336e56c6695e661b0c8e12813.1794962603.git.stefano.stabellini@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.4; emacs 31.1
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB788477:EE_|AS8PR03MB8467:EE_
x-ms-office365-filtering-correlation-id: 6a5ad4ab-3642-4077-ee09-08df451857ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|366016|376014|1800799024|18002099003|22082099003|261009223027099003|3023799007|11063799006|4143699003|56012099006|261028144727099003|261022105027099003|261021123027099003|261026121527099003|261026140227099003|261021121427099003|38070700021|261102123227099003|10067099003;
x-microsoft-antispam-message-info:
 ttP7IjVUdlB0xBFxOjaixkhz/f4cWp4reQvTDroKxhm6yEcA4ASQCMbaDoDDnukRY2IGPqE7FlfrySbOVzfRhWIJesnG+/mGOfmQnnqTGMt8wmBI4Wgqht3WXBp6H32Cze0v8GnKR4LQBajuvSqp2SMv5kd9SNxrQJY9DtHr105+vyxck/FrUvLWGxMCXtA1UjAcoIIXQZr36TPBp7tUex2u2gNaLqu7KxU6qBzNMNF7J1VwEMF82lf/jn3u6KZjtKyK5VNR+kDm2HY4j62JPUuAIZgPyr7ot1JRZFO54hMdkhdOxCdOqi/l6wt6Pf44WSIiV0tHzFCEZZ/gfIHsgncrg0GNhZODrJRCFiq1i1k/DEKVxV5SCpwVyj027SnoMnDRCtVTgcLzIIvLiAXt1dVyXSPwbrgWq0LXzaX8d/dh+3qTmsU66pyrW+DYiJomiYHaH22iG2E0K8Wnkrb895MU/n2DuG/8FpMLpcepRJaABuo3AjFLzgUjyfNgoVDPyGy75HmI9+oDD+i012VxKMcnrUv/hH1wA/M6S5rzx5CYtLLRK1FLWM1pUULZmpfljDp2J1aKJ3+eajUQVNtbIP863bODaBDBCtM/E+kLMPubdvsCUhItmKtWKPZzgXDoAU0VGAmLLwQCzQfPiYbX4cFs0JA7nfy7V/9iOVB6taIqyVZTubK/Ru2ODaowN3LKrh6nBfuUixCWtxVC70sHym1lQ/QKrVkt3V1mA2FRgxo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB788477.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261021123027099003)(261026121527099003)(261026140227099003)(261021121427099003)(38070700021)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9iSXC+CFc6yYkHPu1H6GJAAWNxROxhqW2nvb8Rr9rpH/lN0tgE51XrrhDt?=
 =?iso-8859-1?Q?APRq27eHEzcXKq1MxIR53sR72vQgWzK65N1vKw20MjA49QXJzkKvI/iBEh?=
 =?iso-8859-1?Q?8+rG17Fmba6JgXMDkaKmsUwdrGkXsBua52uv8ZBxQzVracgX8htTtmlLiJ?=
 =?iso-8859-1?Q?wfB3zdmkozGG5JvWE1KFQZpY0ot/zl7f43a1AJUCTy4UARKohcG6lFqNCn?=
 =?iso-8859-1?Q?L6mj8gq3K1uL8mznNZ0dqXFqpXqD0+O+Ua0wi5ZG+9oZ0KYCSMNOHeIsVe?=
 =?iso-8859-1?Q?7JX3qpKshYtYdtVIWdQ7ZfUunbL08sDiJCbcxtae5hSUJRY/Ojku7PXE8Z?=
 =?iso-8859-1?Q?RLSLFjTDtmH55mKh7A/g5NuojTSskf7DMHo15ZXfroYUTyJXTAOUPKzlAg?=
 =?iso-8859-1?Q?GZYZf2qDotcy/u4Le6q/E3thRvN2figK+QuVFvRhkEnv06HsM9/2A6jGCD?=
 =?iso-8859-1?Q?5YJS8BHgbTOLYagbIVYMmBQVaPC7q6BEWsfb7HAab6FDvfw8FCs/OiJDUf?=
 =?iso-8859-1?Q?RfrUTf+Vz4jGlzVVN2bWQMS2wEF779eglGsD7om+bMjj/bHsjMQVk7zfvh?=
 =?iso-8859-1?Q?7u5j7Ttu7vPOACboyaa5IIiAjiRXuOd1ptPlg6QY8g1eQM8uakN/BZ8R/B?=
 =?iso-8859-1?Q?Un4iNNi0T0qdKruSY3mgPAOuE/S74buzgfWEDEPXdkBKonlnHSButFEjyh?=
 =?iso-8859-1?Q?vT9vLXqdZuRHMMQVDKyqzl5paAC7xM0pBPXdLnzWjFw6sbP7doNbhmBQC+?=
 =?iso-8859-1?Q?RU0xJc7pKVGSFvWITyY985mIw51QTRjRFVii9rHYl5AJdw8YaI/hH952b/?=
 =?iso-8859-1?Q?6r1gcTVr7fxAJDVwNe1ztOpPvNy/le35po6+cZMa5txYSS2SjPr1hRnw2+?=
 =?iso-8859-1?Q?WobeMpVOYDZgIihrzXToLX5M3KKUR2I5rbMQzZquK5YGHzj+/+mZDozDic?=
 =?iso-8859-1?Q?1RP3ddIuW7bzRaPcid6wI/vhke8Vgo9CR5jeiGDRDImJ30Dvx+9aNXV9Ke?=
 =?iso-8859-1?Q?o9kQ96IrQzxcRa0ZIbz+6xCiH2jbdX9tqJC5c1EPtFEyMqbY2HltND9Y/N?=
 =?iso-8859-1?Q?BHRfFDIqao4sfIJPputtrmbnAZaTDVFjvYoCaId7NJJqmRU8JtEeLYzfGc?=
 =?iso-8859-1?Q?sqBLkyRirB1gyDMSAWMXvgd3s7D12Gp0b6ppLpmQEjrOdkbYsXTU3SL/Yc?=
 =?iso-8859-1?Q?AHmpDBWH124tzT48S78QJ01tyQ+xMmxHmahp16/jAuQPfIoqYh+Ob3NldC?=
 =?iso-8859-1?Q?cZfGuwu9sPf1mTSHmmeszaXauf9m2dEFyBcapAY0WJ/wlQVqoZPYsGBFpu?=
 =?iso-8859-1?Q?Zsuc4leMkL2Z0AS07ERC0/lutFBXCD0VdCuRkzQBcuR2i5ukW3/lDdRWKS?=
 =?iso-8859-1?Q?1Z40YjJsl5fVUxWh7wJNI5aDh6dROFekdfoL1u2NjeCR7uKCByk8mzOIZ5?=
 =?iso-8859-1?Q?0eE/LV9l3sVBhhJbQ/SqpaQNnQnGQ41lH3jgkK90EH/FeVLnTWM4uJfOuU?=
 =?iso-8859-1?Q?3JO3BqDFo9QJflNMV2kemAV9Ytb7ps3H2TPftTAkn6xX6OjzEKBnTVHsLx?=
 =?iso-8859-1?Q?b3zbKTdjEtl62Iasj+8m6cbl1nxLB5RVRfY+odedr3rcj2KlEnp9JpBI3R?=
 =?iso-8859-1?Q?+OKrYCBZXWkX7Y4jh2VnUTfJLrNlxk0xCRuFbrhl2F48U/3+ORPKEwOxqu?=
 =?iso-8859-1?Q?e+uYda4RpjyS+pVtcbsIpK7ki9zr0gx6yLPAmRPPu1eSpKJr++5tRc4p20?=
 =?iso-8859-1?Q?x7weBZ/VmCFEc1YKk7XNt4cHuRDjDGHapJuwFQTVygtr4zlXWry82MAtPG?=
 =?iso-8859-1?Q?r9A0gcTypmLpFYYzGQjpJ0Hfs67gsv4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB788477.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5ad4ab-3642-4077-ee09-08df451857ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 02:04:56.1911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0IHHYn9X8iyEbOeEGrXGqmV0CJODPdswVYCEI8DAhkDtr27IJOuIrRlcZVhImjyLQzBOhcmDQPc7ya/NpuuCNz28cmR0PyyXjW80Hny0v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8467
X-purgate-ID: tlsNG-d25034/1794967502-020C1A5B-C1608927/0/0
X-purgate-type: clean
X-purgate-size: 2988
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Stefano,

Stefano Stabellini <stefano.stabellini@amd.com> writes:

> guest_walk_ld() accepted a block descriptor at any level. No granule has
> level 0 blocks, and the 16KB and 64KB granules have no level 1 blocks
> (ARM DDI 0487 M.d D8.3.1.2): the translation table walk makes such an
> entry a Translation fault (AArch64.BlockDescSupported()). Refuse it.
>
> The check is only valid without 52-bit support (FEAT_LPA, FEAT_LPA2).
> Note in get_ipa_output_size() that 52-bit support requires updating it.
>
> Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>
> Changes in v2:
> - Cite ARM DDI 0487 M.d instead of A.k.
> - Say in the commit message and the comment that the check is only
>   valid without 52-bit support (FEAT_LPA, FEAT_LPA2), and note in
>   get_ipa_output_size() that 52-bit support requires updating it.
> - Move the Cc list after ---.
> ---
>  xen/arch/arm/guest_walk.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 09fe486598..151b837541 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -201,7 +201,8 @@ static int get_ipa_output_size(struct domain *d, regi=
ster_t tcr,
>           * Return an error on reserved IPA output-sizes and if the IPA
>           * output-size is 52bit.
>           *
> -         * XXX: 52 bit output-size is not supported yet.
> +         * XXX: 52 bit output-size is not supported yet. Supporting it a=
lso
> +         * requires updating the block descriptor check in guest_walk_ld=
().
>           */
>          if ( ips > TCR_EL1_IPS_48_BIT )
>              return -EFAULT;
> @@ -533,6 +534,17 @@ static bool guest_walk_ld(const struct vcpu *v,
>      if ( !lpae_is_valid(pte) || !lpae_is_mapping(pte, level) )
>          return false;
> =20
> +    /*
> +     * A block descriptor is only supported at level 1 and level 2 with =
the
> +     * 4KB granule, and only at level 2 with the 16KB and 64KB granules =
(ARM
> +     * DDI 0487 M.d D8.3.1.2). The block encoding at any other level gen=
erates
> +     * a Translation fault (AArch64.BlockDescSupported()).
> +     *
> +     * This is only valid without 52-bit support (FEAT_LPA, FEAT_LPA2).
> +     */
> +    if ( level =3D=3D 0 || (level =3D=3D 1 && gran !=3D GRANULE_SIZE_IND=
EX_4K) )
> +        return false;
> +
>      /* Make sure that the lower bits of the PTE's base address are zero.=
 */
>      mask =3D GENMASK_ULL(47, grainsizes[gran]);
>      *ipa =3D (pfn_to_paddr(pte.walk.base) & mask) |

--=20
WBR, Volodymyr=

