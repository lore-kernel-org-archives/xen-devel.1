Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7EA606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 01:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=hrYxa9o6
Received: from list by lists.xenproject.org with outflank-mailman.1462795.1673789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLstN-0003tj-Jx; Wed, 28 Oct 2026 01:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462795.1673789; Wed, 28 Oct 2026 01:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLstN-0003tc-Gm; Wed, 28 Oct 2026 01:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1462795;
 Wed, 28 Oct 2026 01:55:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xLstM-0003tW-Or
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 01:55:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLstL-009Pkh-ER
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 02:55:51 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ae155fa-bab6-0a2a0a5309dd-0a2a450a8f9a-34
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 02:55:51 +0100
Received: from [40.107.159.78]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ae15627-f2d2-0a2a450a0019-286b9f4e9a1b-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 02:55:51 +0100
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS4PR03MB8207.eurprd03.prod.outlook.com (2603:10a6:20b:4fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 01:55:48 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 01:55:48 +0000
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
 b=fhZlJNUqVCSP5sPpEhetILpxiUPuD7GG5drBfJ4mJvMBMySNCxfzK6YXqdAqlet8jDFRfwOhaFl+UGtaSRFk/U515F8JGPx/X1hVj3ULTUxjui20PlYK8AT7DvFL8V16+BI0JH9wDMHSOh0OW8cwY0zACcnn0guDvlcg+CNMOjsPQ9rL4UeNjILFfj0cDOR6xrgDaNwzNGMgTDsL8jh3U4uN5lWJQ+lxgr3UUjY5NTPJHw0/NnQdsxYtr7tEvjtyj0DYC+8j6HZ7x7NJLezdtwsLHvI1RAw4kQbw36ZFcnEaYzFYB9UAlmD19vO6XG2ZvsxOQ0m6HF6DypV+A9P13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JEB4TcI6rY9PoEiqupKaYUkobSukx5mh2G5+XgiwyQ=;
 b=TVOygFARYnPs8xmAQT5f1M8Pe2cW4dM0VWRLPnEpeAsDLE1En6TEhu5bsAHCZ4LY0g/aXvwDywIMYECafqVbmIAmraRq1Qiycj4QwO9c/oKOJQiKQmA9iW0zWcCB1uFbKilC55/aVR/cesLxBzm4hs7LGmFJo3t8hsUZbspZYoBf9eEa7VkUAPSjjP4dGUQpaedbe9ZGRNCOamJkOz+J+Wf1RZyQA+qzgNVNkfnT8KDCqsY+dySC4GNY/BT8agJINxNDAGzXDMuHy0vTHKVwRdrAnA1euW4RP2zqjFZ4GeOhim58JVypgKz6o+nP7nGaDdRBm7R//LEVmboc8eW/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JEB4TcI6rY9PoEiqupKaYUkobSukx5mh2G5+XgiwyQ=;
 b=hrYxa9o6pdy9qlqmHpGDkjYtGdKb9Zxf036sW7CPCa9/xZGJAbQAU3gpmNQibLwu2pRA4i6UH1onNHMk6MejzMxprFjFt/54JPESjnBhvsBs5o4kcUj1sbbqMVyPOx0RKE55udyoBlLQc/KZIu5Nc6HFdF9Tg/QyAqahcpn0Cu1szTUcYUvWFmmx7JNYNxkvrsp7Iz2A56xSosHVxTmYoRGJiR0Hy0Ni8oR9GxjuKjcHwxXMODO2EEifubsxmUEmbYNi5npwNtkBHZjYv8lDyL3zkLMNuQY8RtVupsQKcWvS4WekbZj9qarTnx0GVbwx/jL8c4IAvYUFG+lVFCUcTQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: smmuv3: invalidate TLB when freeing a VMID
Thread-Topic: [PATCH] xen/arm: smmuv3: invalidate TLB when freeing a VMID
Thread-Index: AQHdZU2CvV133olROUKhJSegs8l4mg==
Date: Wed, 28 Oct 2026 01:55:48 +0000
Message-ID: <87v76mr3ks.fsf@epam.com>
References:
 <c8cd6a9046d553f984bb80c69a35b9bb43a11418.1793002976.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <c8cd6a9046d553f984bb80c69a35b9bb43a11418.1793002976.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Mon, 26 Oct 2026 13:25:47 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS4PR03MB8207:EE_
x-ms-office365-filtering-correlation-id: 15ab847a-1b05-42b0-8575-08df3496966d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|23010399003|1800799024|376014|22082099003|18002099003|11063799006|56012099006|5023799004|261026121527099003|261021121427099003|261026140227099003|10067099003|261009223027099003|261022105027099003|261021123027099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info:
 3GEFluEBpAlfhy2Lf5yTFkdBQHEOCzZAU7AY85qx2f93tfApPLNLoj83HAaT7/E7fvgdNWN/fW/PyIWqdHVvj+udn3JBySXZc6wn2asmawR6TWpSuFUIZktDN1r3kJkpkbwofDGRHk79k5bZ1z9z/ggWqm93yNSKvL0+gzznJcQLMB3rUR6PqEeXbMgXDykT0buqtzs5PalRJIdMRf1Wmxk0iLtP2uq1kjbhJ0pW+rweyA2E0vqW3Xt5rKztZNOts/NDhb9Vi+kdjIJQ7berUkq3u8aaltswn1m8MaTXaf8OD4FaFDf+MyV5NGMzTOgup2o8qsUWHawc5ASUHZpZJLjJBxoJiCE6VSXbZTfIFd7P8tvXtjO56yedxe73+p1v4ldV4aBnAGWKnXi7dD+4lFpH+24GECbBj68Nz1TfFmu6wAyyP8m0/uFFA+sBcljTSOZeEBX40gso3XxUM0kzNvGT7Zv2OalYOuLw+Q17w+ZLcLQJnrSmMATdMYq3IkPdIe4YRmBJXZMfnrq8900fIfdxpUoCeOnlkJwBz9+iLpNGwYwvtUYKZXwPpJJ6lWa38bZ+sUPlNWxHnSH6kI6gMGFZnO/ZGdh+4Z5F/bre+2PM35arlXrtuKxCFjlsb+61n9EZm4kHahgsOVWwmt0xeGNsPB1YaHxaUz3VfnVMYV9PikkmAVOkP0nPLhiIvPQLvemWxAAETYGDjAjx3APRbUn3slbQQuOmjzQT46a/H/Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(261026121527099003)(261021121427099003)(261026140227099003)(10067099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WFN95zwXeYS/dAkUA9PFoZN+l+wo9+zKxDXfNIaCs79ntmrQOo2lODhY5m?=
 =?iso-8859-1?Q?gFR0PFGja+tFuqM5+mgH3EscGqYwozf0vJLfMWsl/3mpjJ0d/++kd0tKde?=
 =?iso-8859-1?Q?ND/STo8CXlBbH1nTdTcbTxKbn1Ge4yI7HY2/3t5tctRRvihG+0L+Di/Yzo?=
 =?iso-8859-1?Q?QS8dKe5CX9lu0GX8b1b1/QR4rGHLrroNW4IbO0zVpVwT5SLzGRxy5j9W45?=
 =?iso-8859-1?Q?QKy/TeaO7oNpVl0jnTNlzkbcE8dge0KQOlpKi9tdx1yHSpIWudc42uiE9p?=
 =?iso-8859-1?Q?Qw/kHih6UeYsgVG08OtsEseKSDZkRaDdhVIEbAeechsYSjI2IyI64ZnFNj?=
 =?iso-8859-1?Q?rY45825CFaz38RO1I64eLvsqce4flwjOXu7Uvyhta3iKzgt/QahPb/rTNR?=
 =?iso-8859-1?Q?HZ2voMUaCnqEcUOiccHQ/W63CSjVr2mK3T+E6/yQQOihJd0cCfCkbXrumg?=
 =?iso-8859-1?Q?tDrW2MOTigtShYH4FG64sDQBwaX8TC/nnOAQ2MAWdl2SPrPcwThZtYSxFE?=
 =?iso-8859-1?Q?fzv0StRQCZjwylrj1L9xrVBgUg83uduszFw0/wqeneNQIB15K8M/1iwonz?=
 =?iso-8859-1?Q?Lsky2YRvmJ1WskQIBzqNXrR9BBPEdqSyqo80JpI62aF6MbZfIPZMb11txI?=
 =?iso-8859-1?Q?StbaoJBl65BNZz+TMZfbjEUl54gQCi0O6HJ1IZBtrIwmrS2KqrnR4Ni4Pp?=
 =?iso-8859-1?Q?Q12jZuiY/QAbzQXSTDJ97f3m6QxvACJl4KgIQxMGGBBsDCvtO+cJ/NbH5T?=
 =?iso-8859-1?Q?5gWjF7YsVlHqZ+FaJP072VGXGhBTnLd1L0bYk0pJ2w5e4C37gF0X2MN83N?=
 =?iso-8859-1?Q?MqLM0qrgGbt3BF1zDFOR+uDfEMCVITdQAaPBzzrgqRcsAa8ZgSxiGPNIkr?=
 =?iso-8859-1?Q?5KbKs94He4LX596gN4zE78M28zTXo3TnEvU9PKyjRbRI6gBi/vXriZqUCp?=
 =?iso-8859-1?Q?8q2muC8PEcrdgUhB2CxLZ42wBoeMx7wZZ1qk7I5h4ks6gYNxMfDGl1YXNF?=
 =?iso-8859-1?Q?vBerS7rds0Ago0ryxGQWzotrfVwsOvoBOTazt9w42bHaef6xCus4ii8Bds?=
 =?iso-8859-1?Q?WgPiMZquARmPfFn7TuOkrQpst83ME9BWPyzaISF3l4C8WLAkH5GJ+u7M54?=
 =?iso-8859-1?Q?NZ0uu0fdWbZUQF4VBTUwMP6ibPvJadWNZir8tc0EzH56q+/XuRK0BLop8K?=
 =?iso-8859-1?Q?fSQtDe0TDZGxZzmAejQDI5Trwo8+c3PJWb92XwcdEWg3F0pibvWR9+uush?=
 =?iso-8859-1?Q?7guHdIcKmGm+Fr6xtnlIxBFyvvtCxPrWNa/J31/R+x4kYYFEghvR2JSNIF?=
 =?iso-8859-1?Q?KwRfYDOQDdVNPB2q8rhys2YtNySJ1iK4uhhyb5F3MFD5QwCLM6WP/54V3A?=
 =?iso-8859-1?Q?nvW3t0RkD131NR6LWH01YMVeO+ob6G1N2Z1t+G8oAtXfzWVoo94woGq6H4?=
 =?iso-8859-1?Q?hqt4OV0zb0/ETy3Fob1CstbqtKElvRNz7zqxfhYg/pTbVkS+cgqRXu5pdV?=
 =?iso-8859-1?Q?Goq5NB1jQ3VLbIXtxONAc67ACPkNYkcWJ7bfwRpop+/04FTAOZIC7d7HvH?=
 =?iso-8859-1?Q?PJMHfn+Yr5gUgfIlBYgCMl/9Onf/vKHk24yG33YVY9QJwFga6hFuooq3VE?=
 =?iso-8859-1?Q?tIpdnllq8r6iJ4IWaFAaqwla3JOY9LiErF6XGKe7vYeKijNF7LV5pM/Lxw?=
 =?iso-8859-1?Q?Oet9Gvd9xnh1zLL7gIhw6lW8+Bc3bhzoOjPIzZe5pWnqxLh0Hmly6lCrAY?=
 =?iso-8859-1?Q?wgvZn8I48nCDx6buIogWPDsnz0h/fT4/R6q0yKvfU7L52LCgxR07EeKVVB?=
 =?iso-8859-1?Q?MNRXkmeS9hQ/LhiopkBSlxoX0L5lP5Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ab847a-1b05-42b0-8575-08df3496966d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 01:55:48.3046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QklfXAKextq9lh+FZ1/6iSfsgoEHqDuIQnI+b7RpGKEnBuFWHFk2geigGwoztmiQ/Ycvyoz9AMpe11Xsyp+JtItCQQzlShodZPq+O+Eo6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8207
X-purgate-ID: tlsNG-4011c0/1793152551-5A5DBCFC-ECE06759/0/0
X-purgate-type: clean
X-purgate-size: 2539
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> arm_smmu_domain_free() releases the VMID without invalidating the SMMU
> TLB entries tagged with it. The VMID allocator (arm_smmu_bitmap_alloc)
> always returns the first free VMID, so a new domain usually gets the
> same VMID as the domain that was just destroyed. As a result, DMA from
> a device assigned to the new domain can use stale TLB entries and access
> memory of the old domain, which may already be in use by Xen or by
> another domain.
>
> In Linux, this invalidation is done by free_io_pgtable_ops(), which
> calls the tlb_flush_all callback (arm_smmu_tlb_inv_context()) before
> the VMID is released. The call was dropped when the io-pgtable code
> was removed during the port to Xen, and nothing replaced it.
>
> Linux guests that modify their P2M early in boot (e.g. by mapping
> shared_info in the xen_guest_init initcall) hide the problem, because
> the resulting IOTLB flush clears the stale entries. However, guests
> without Xen support (e.g. Linux with CONFIG_XEN disabled) do not modify
> the P2M early in boot, so the device keeps using stale SMMU TLB entries.
> This was observed as GPU rendering corruption after "xl destroy" and "xl
> create" of the same guest with CONFIG_XEN disabled.
>
> To fix the problem, issue a TLB invalidation for the VMID before
> releasing it.
>
> Fixes: b3be6ffb009c ("xen/arm: smmuv3: Remove Linux specific code that is=
 not usable in XEN")
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bf153227dbd..93176e2fb21 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1153,8 +1153,14 @@ static void arm_smmu_domain_free(struct iommu_doma=
in *domain)
>  	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>  	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
> =20
> -	if (cfg->vmid)
> +	if (cfg->vmid) {
> +		/*
> +		 * Invalidate all entries tagged with this VMID
> +		 * before it can be handed to another domain.
> +		 */
> +		arm_smmu_tlb_inv_context(smmu_domain);
>  		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
> +	}
> =20
>  	xfree(smmu_domain);
>  }

--=20
WBR, Volodymyr=

