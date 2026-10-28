Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F48606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 01:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=FctvqYyb
Received: from list by lists.xenproject.org with outflank-mailman.1462788.1673779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLslS-0002L4-SK; Wed, 28 Oct 2026 01:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462788.1673779; Wed, 28 Oct 2026 01:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLslS-0002Kx-PO; Wed, 28 Oct 2026 01:47:42 +0000
Received: by outflank-mailman (input) for mailman id 1462788;
 Wed, 28 Oct 2026 01:47:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xLslR-0002KO-VY
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 01:47:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLslP-005qe3-LN
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 02:47:39 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ae15408-e002-0a2a0a5209dd-0a2a45098b68-38
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 02:47:39 +0100
Received: from [40.107.130.97]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ae1543b-be1a-0a2a45090019-286b8261471d-4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 02:47:39 +0100
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AM7PR03MB6184.eurprd03.prod.outlook.com (2603:10a6:20b:141::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 01:47:36 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 01:47:35 +0000
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
 b=nuUtx4Tfr7MLivac/HrHZ9vpOJuF48scTT27Vsp/uZNrBbW9hn0hnXDJwhLKecQXwyhMj4vzR7NFBu4aXc0EillaBogJOhQyDTKI5WJ/4wDOCNAUoDIlzsphtAkZbKSWlr9XZpRE8hxMwhyneL6TawTdBe3hnqvQA98XAgTpjH+byczi1EpcRrh+Tx3KZv0ZIK0UbEjxJDAH01rgLZCHdq/xR6nD/WIQif7kzDsAp3LHeYZVPvG40ZdJh0MCQOn7U7Qvs2q/tmwgpTw9ZMirLlUKe6IY4wk57yS7edU9pGfWMEO2688dSdAryikMv+J8zmwdcGs9aimLncMCgnZV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85YPMKrBC63s6/qgqB6Dulnbc52kOP52kXYUse+nWW0=;
 b=Ws40C5nWRVgAIp/BFU7hrYIoP8aqVZBFjMAQ0GHVblGsx1uWiCvEOB9W+bI+WJrp1EQ3RMt2USkHmCT5uQdDm+vvLN55y13rYyRQ4+4XbkUj6i8DbXxrMJt5Wn9avAg+gGn6Nr6ECuCGUTgcj6+xubwEluBr9aoyAodqzNYaAw8XwH6DDCYDEgEhXoFPKT50EEJqQ47osWAE52UxrWBRLszNYXfhlvGj1KzSW+guPNd2Kx2Q/FGZanQKhffU4uTKZxWT9kusdOQTzZBlzn9wnuiL8xJiNYSZlmVsGq0NffJpMV/fNEnfJV6/DFvGMqF4ZZ6NmbRoPQ/o0WusRk5Rqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85YPMKrBC63s6/qgqB6Dulnbc52kOP52kXYUse+nWW0=;
 b=FctvqYybPNN/s90nNQBItCL3o9b/IfnVYW+oEdNL5EyDsXJozMIKaGQyor3A8MUCbcQWbMBU0VJpW0Pq3/fzVABTmw7plREWr4AC+4aCuwzglA4lAUlAN/5qhKzuEWEZ718jHKhPnC5QWanPKA6CDzxOHbW6gRF3YqHJw8HPhj2TVvXDkcC5jQkQBw4XCKVfIs7od+GYqnr5KiSGYefz4HqlcY88hiHuyfbhhepQU9QwW0py+8OdzJsp0CJN5oXYpcVL8keqVnmgRBeLP8RU5wzOAgGvOpdaa0UZlQbT07r5jBS8kJrFpXaEwIoQY8Kv0vRBxOJYlSRuJcyqeRC0Fw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/smmuv3: clean stream tables for non-coherent hardware
Thread-Topic: [PATCH] arm/smmuv3: clean stream tables for non-coherent
 hardware
Thread-Index: AQHdZm5ov4pfl/+ZtUafpoJaRxUN7g==
Date: Wed, 28 Oct 2026 01:47:35 +0000
Message-ID: <87fqxqsiix.fsf@epam.com>
References:
 <d54203457d68a3c6f8f311035a8e66468bb3a96b.1793138347.git.mykola_kvach@epam.com>
In-Reply-To:
 <d54203457d68a3c6f8f311035a8e66468bb3a96b.1793138347.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Wed, 28 Oct 2026 01:53:35 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AM7PR03MB6184:EE_
x-ms-office365-filtering-correlation-id: 1129e523-87fe-4e9e-a7a1-08df349570d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|42112799006|366016|1800799024|261026140227099003|38070700021|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 R9NX0MgxnjUrrlPbKiODsgqzJuxRGuZrHcqjmVDMXWQivnv9KR1q8PwJroqF+zpcV0EPVRo1PtX2re73OCPNotHB1O/bNCykfQQGu4o/Vy2p5YLO/jSGtAlshT0SIedUgw8MrvOJVQhpa8HinwLYEjEOXBjWTvcU7vAGUY5Yct1XHwu+adhsFpyqgYbUP0ags/omoy8btrwKKVWCx26sjNO/laIFCXCZwBQZL4JnZcJcTvHNySp6e0QYqh2CP89xaJzzZtPtGNJ9kMH3ozVia0PQRHH+V1NpYA3GRC7SgMLeuvz0BwId5yl0RkqkK0WxnWmeLW4Yvayne4nXrXpIV7DK8CGhhuialvlQsqUJGtHMAMZFLbOHOgn64cNMlXk3e+87j8MwF5G8wMoWnhcAx5wfaVZR8AeDrMfCw8ZkqSiqfgUr0T9zcB8sdTqFGAhRNyh9tWwa7J6nLxmf4SkCspFVz8jd4f4IVENZlsTlLYgBa8r57J56bW5wWYBRuQ3O+slzUk2AYFpVvvtTAO47ZYilzYG3e110WzYiPYjGofA2J3mWvXMJDVg2k/RACRfIzMQZyaJoDGossyg5ofj2kd/Ug8FxQbiZyFMJHIQX3tyDpQfBirTiRlBtYQTQIl82rVZDH8CFEKe/XR9gBG9tP/8Yu2QumugD3D4SGU3wBby+XyRbSYqzDwC/q5ByHDuY44SEo9KqtMehkssgB6OESLvSNY2jtiBsVFiXXwWIPz4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(42112799006)(366016)(1800799024)(261026140227099003)(38070700021)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yfb8Y2YAyTgHA5wqKEJ8GBy9wSnnXhO+RFK39cZPsr3C/9VHb5OSUV+mJ9?=
 =?iso-8859-1?Q?qCU6oftL9bcdFFca0R3vw95jYg29DvQrpeDv0LSzIF3KfmM1q82RehbCsx?=
 =?iso-8859-1?Q?OyTDLEcjZT8cFXtoJLnLR3B7ef57eQxGO4Q2eJ09BytfjsYAK6qxhtVQxe?=
 =?iso-8859-1?Q?IOfValQpiu9i8WVlTsiMpkjh6ZJkvuidnTWuTy0OlxHFWiNiHjkG8jBcN7?=
 =?iso-8859-1?Q?GrRqa7HvB8evhkRh9M8MuHI11X7MP5dLe0AqPNdzL33vDoiKc3zbNVr4oX?=
 =?iso-8859-1?Q?m7zJIkJNAlmFgEtFcPfbQWK0kwifrB1QA0Pc5Jw9gScyEWhhkFLPc/DsPC?=
 =?iso-8859-1?Q?Am2yQH5MVyB8xYasdiGHgHoBqzXzv3Km6RDkmdhgaiPspHYDxRt0uiOjCh?=
 =?iso-8859-1?Q?jDD2q7Kiw3R73hzjTocUWerbJ6yKhtfGKlBbld5Yh6tdOBFBAR8uk1HVXp?=
 =?iso-8859-1?Q?6Z2jFioAZSeDGFtPxddJvnrWndVcmluIkMq4EA87zhDNMzv6+5pXqQ23id?=
 =?iso-8859-1?Q?efxCKnh4a6uH1rHj2KIYH9pxh9X5UaBq/J+xh8tDRWgTSqGId8/+l+Yvws?=
 =?iso-8859-1?Q?v9Toi2XEm0GxjuGR3IBVhhJZ5EaC3+sx4tOKqucAAjBsHzWMLf0QCfGCwf?=
 =?iso-8859-1?Q?2a+FRgrYaWlyhMTY6QBxWN8S8cAt9MK6N5B962EMLlah0tdS2pakamyV8T?=
 =?iso-8859-1?Q?kVuVoUOxZLoqkRM0G+l717dLnyt5C9luJVDdHcbK7R3yU/kr+PxRlhpDpk?=
 =?iso-8859-1?Q?A52/ka62Hw9r9r/OeWwlWQV6GuHoHFhB9FgaNZWPlP2FHrDi6npzOMqLGw?=
 =?iso-8859-1?Q?6YpeC/E5+FPrKXVTYRTUWMIrl5s9HfuAYz9HRXRw8iMAYlnv/FBg180NG+?=
 =?iso-8859-1?Q?B6Q28V9KpT30316LlrRvZxM3Tp+jSxJNUrj79cMDLXilk2xE163G79mjUx?=
 =?iso-8859-1?Q?U1noin95DsormjZQsiqAqq8uUvaaOOitKL9aYFM4FsHBsKVt9S++crPe3n?=
 =?iso-8859-1?Q?C/93ZlGJ81LxdyAt4W24KmWj3cTz7Tkxh8lPRqZbSV4tXeZchs+ZOtZYda?=
 =?iso-8859-1?Q?H0XICdtX5UbWvqi0R7PEWaozq2TEni2He1BiktlBEk3ZXEpe57mckPGJ9Y?=
 =?iso-8859-1?Q?CYR/jMsQMyRiAYLCRlALnBKqVFvIDtJWZPpM3iH4CAhbMezpYXAdZiIoWf?=
 =?iso-8859-1?Q?oE2fKYy3WYiY+L5yfEs73ORSBwZ7j42MQwlKGED2QVo3EXVgudMXY+emWU?=
 =?iso-8859-1?Q?e//o6mU7HolZrSu6Cg6gADp6sUS6xcy7xjUBxH9FatyjGaTDCGOYwy5/G9?=
 =?iso-8859-1?Q?PxW85PgGGbpB/DKX+X7wjmNgDBJ77TAeinjgkp9iKXS9nX+zcZeZYfNwmC?=
 =?iso-8859-1?Q?wtGawjOOkJLspxD3MsBWPNGdQ5MLF7QRswePoSN2Z+cznQFrpo9Qs8YOfB?=
 =?iso-8859-1?Q?XtT2IoWA0R+fV69woNFKLa2V+KeryT6BwPuSgfbx3eUikJrMzKoJh2GPHJ?=
 =?iso-8859-1?Q?SqP9O74pntxrhqj6m+SrG3QhCYnOtFDK8nD6F9qSa5+XdSE0ksqDaBqnE9?=
 =?iso-8859-1?Q?sxjI+89iFm9rmShrhQ38bL7TAc2N97Yd/hPcgjX3XIVIWpAMn0rGzUL8ii?=
 =?iso-8859-1?Q?GyzW57hMhvmUmWqWztb1QyCr823NXkROPutyxJhilvxrmTVul8klOS9XY6?=
 =?iso-8859-1?Q?a4WXS5qoKTxrm3C9Rx6YejgJqwYH4y6Q5GF1/Pzw26fUnY1JIelibPGSkw?=
 =?iso-8859-1?Q?kxf0Wx1uNZNI4WJUBgu6MA/WPrvLV11BwsyqP16OdIsZPsC0bsxKNEfTy8?=
 =?iso-8859-1?Q?XM4lwFiy0gBlzylNIuiKmX+u3oZ/28Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1129e523-87fe-4e9e-a7a1-08df349570d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 01:47:35.6697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUrSzIr8+ij4hDbH5d+0mw9oweE9R7PKr5kBPq3yNYSAImyRyqr18dMxVrvMHdj9bOrXRNA1A89Ss+3gNlA7x3R3bx1HOakdi1uYOA8sb5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6184
X-purgate-ID: tlsNG-bad1c0/1793152059-3AAD8034-B2BE1965/0/0
X-purgate-type: clean
X-purgate-size: 4328
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Mykola Kvach <mykola_kvach@epam.com> writes:

> Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent
> SMMU cannot see writes that remain in the CPU cache.
>
> On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMID
> for SID 0x4100 while the CPU saw a populated L1 descriptor.
>
> Clean new stream tables before use and updated STEs before the existing
> configuration invalidations. Clean the L2 table before writing its L1
> pointer, then clean the pointer. Skip these cache operations on coherent
> SMMUs.
>
> See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.
>
> Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
> Assisted-by: Codex:GPT-6.1
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bf153227db..a396e2b9e0 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smmu_=
device *smmu)
>  }
> =20
>  /* Stream table manipulation functions */
> +static void arm_smmu_clean_strtab(struct arm_smmu_device *smmu,

I think the name is a bit misleading. You are not cleaning the stream
table. You are cleaning cache entries. Also, behaviour of this function
is more generic, as it know nothing about stream tables and clears any
cache line you are giving it.

Maybe call it something like arm_smmu_flush_strtab, or
arm_smmu_clean_dcache, or something along these variants?

> +				const void *ptr, size_t size)
> +{
> +	/* Xen's dmam_alloc_coherent() returns cacheable memory. */
> +	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> +		(void)clean_dcache_va_range(ptr, size);
> +}
> +
>  static void
>  arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_des=
c *desc)
>  {
> @@ -735,8 +743,11 @@ static void arm_smmu_write_strtab_ent(struct arm_smm=
u_master *master, u32 sid,
>  		 * The SMMU can perform negative caching, so we must sync
>  		 * the STE regardless of whether the old value was live.
>  		 */
> -		if (smmu)
> +		if (smmu) {
> +			arm_smmu_clean_strtab(smmu, dst,
> +					      STRTAB_STE_DWORDS * sizeof(*dst));
>  			arm_smmu_sync_ste_for_sid(smmu, sid);

I see that there a lot of places where you are calling
arm_smmu_clean_strtab() before arm_smmu_sync_ste_for_sid(). I think it
is better to move arm_smmu_clean_strtab() to the beginning of
arm_smmu_sync_ste_for_sid().

> +		}
>  		return;
>  	}
> =20
> @@ -762,8 +773,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smm=
u_master *master, u32 sid,
>  		dst[1] |=3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
>  						 STRTAB_STE_1_EATS_TRANS));
> =20
> +	arm_smmu_clean_strtab(smmu, dst, STRTAB_STE_DWORDS * sizeof(*dst));
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
>  	write_atomic(&dst[0], cpu_to_le64(val));
> +	arm_smmu_clean_strtab(smmu, dst, sizeof(*dst));
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
> =20
>  	/* It's likely that we'll want to use the new STE soon */
> @@ -805,7 +818,11 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_d=
evice *smmu, u32 sid)
>  	}
> =20
>  	arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
> +	/* Clean the L2 table before writing the L1 pointer. */
> +	arm_smmu_clean_strtab(smmu, desc->l2ptr, size);
>  	arm_smmu_write_strtab_l1_desc(strtab, desc);
> +	arm_smmu_clean_strtab(smmu, strtab,
> +			      STRTAB_L1_DESC_DWORDS * sizeof(__le64));
>  	return 0;
>  }
> =20
> @@ -1700,6 +1717,9 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_=
device *smmu)
>  		strtab +=3D STRTAB_L1_DESC_DWORDS << 3;
>  	}
> =20
> +	arm_smmu_clean_strtab(smmu, cfg->strtab,
> +		cfg->num_l1_ents * STRTAB_L1_DESC_DWORDS * sizeof(__le64));
> +
>  	return 0;
>  }
> =20
> @@ -1766,6 +1786,7 @@ static int arm_smmu_init_strtab_linear(struct arm_s=
mmu_device *smmu)
>  	cfg->strtab_base_cfg =3D reg;
> =20
>  	arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
> +	arm_smmu_clean_strtab(smmu, strtab, size);
>  	return 0;
>  }

--=20
WBR, Volodymyr=

