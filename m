Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5C606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 01:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=vQcnFqd6
Received: from list by lists.xenproject.org with outflank-mailman.1458710.1670772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3fv-0002dL-Rd; Fri, 23 Oct 2026 01:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458710.1670772; Fri, 23 Oct 2026 01:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3fv-0002dE-P0; Fri, 23 Oct 2026 01:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1458710;
 Fri, 23 Oct 2026 01:02:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xK3fu-0002d8-Cr
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 01:02:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK3ft-004Ny7-NS
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 03:02:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6adab217-e002-0a2a0a5209dd-0a2a4505c30c-18
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:02:25 +0200
Received: from [52.101.83.104]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6adab221-4cb1-0a2a45050019-34655368d3b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 03:02:25 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AM7PR03MB6611.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 01:02:23 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 01:02:22 +0000
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
 b=g8YoPAkW5hTCNElKCVXycfM/irzhOtCtAV8rqnjXsNjW8XLc9a+fGoGbEeERlzwTXoY6wzc/Cx8JaS6J1KZyiqt+cffurAgnsiX7CBPsCHZoNjOhsBhHIJh/P+yE+eDa29mz1xE1dx94E4u3n+pYH5aR64k+VMUugdhXpijkPjEoCIxthNSMhebq0tooMUT5vbzqI2b5C8PT5HiRNsxr/shQgjqfjkbheKQgmr9cfQYN4AQmkgk+nKdpZTLeDOJRTdncyflnKnDF6cXsmg7JfZC1to+gWzT9RcQFOqloN6h/DGWEMGzIPJaC7974WO1h8A0m6MLxmp4OYiz/9O90Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Cr95uzyJTQ2SIOyr27a+bJf+FmBkG286w2Ct4/NhK4=;
 b=SS4S7+p0g/bdKUkUop7OueIbsXTHCjVQEOTOshX2Z78c4zxZJ47v6vgKyneP4fo69ey+fQOWedaOc3vinsrXSPCv9cvyCFxXMViy2N460O8hiiPuXa+TuzbUSrVx8HKVPrySnKk3GoNK/LKVmWdxozfU+d34fFQvPTF1qFaVvxmjHO4DfwSZZySHQ9ZnyEz+7Zq86W204iYQONphnbEjH4GHAKYK+6JpHtblc9X78Cgp0ywB1yX5pdhkucc/SqbRja3JIMyMlaRXGmLXELL00zfia15ocljnBgbosArPhyavinEn8pKMY4ysmIJkbXvMWLTqqM4W/zitpCoJCmkqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Cr95uzyJTQ2SIOyr27a+bJf+FmBkG286w2Ct4/NhK4=;
 b=vQcnFqd6Zg96KHTr8jsLjfVA1+LZSnLqqXHdOGhE+TF8O15oDkGLxdyLwJyKI/2+/gwRF95zj9ilp1Gndug/gE3M7EENVplwAReQ32TjVrm0gEvShEmdVGiSyngWS19rEYvvYlUrj4zCu5ZMoR9sarYzHCc7Icby2COmTbmcYASeYzgjH67A6jLvcivqUj8yvMw5fHkp4EyD2H+ik+4EShNhOdDypoMIRPY+eCThC+lEcvBqWYCay/OqVSnWFUx7IxWU/1mD3YjgpQpDT/EXUzPix/b9BgTQy022G4pplAyUxBhjUOW+IlD7g/Qxqp98t4i1UUhB9geuOgHR2IChHQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/arm: Don't create useless P2M pool for a hardware
 domain
Thread-Topic: [PATCH] xen/arm: Don't create useless P2M pool for a hardware
 domain
Thread-Index: AQHdYKA5Y9iGAf1wvEqPStYCLfy4lg==
Date: Fri, 23 Oct 2026 01:02:22 +0000
Message-ID: <87fqxxut42.fsf@epam.com>
References: <20261020143458.194784-1-michal.orzel@amd.com>
In-Reply-To: <20261020143458.194784-1-michal.orzel@amd.com> (Michal Orzel's
	message of "Tue, 20 Oct 2026 16:34:58 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AM7PR03MB6611:EE_
x-ms-office365-filtering-correlation-id: 7d2d7417-668e-40b4-f9c0-08df30a14ba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|42112799006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|10067099003|56012099006|18002099003|22082099003|11063799006|5023799004|38070700021;
x-microsoft-antispam-message-info:
 rkxEU1wlXCDf72/gKMW6ZIAHNIaikbhFiavUL4n5k61/Ll3KvjpG470EvIXXpDXNrZt/B43TQcRMhmmA7LxDrXEyjZ/FeJ1Y5TqFmdVlyRtWDwxqEeN4X1HYe+lEU3EM3KQMMcqAEeIuiktca7BpLdDPl1Mye+qu4WpFahKfyOc8D5CJ8hn/OCE5kJhiXbFEQQuzi0s9QB2DBXcBTMpjHRa0f6n5Vm3yJyTb4IT6S65QoCapsDIBgWaeysM05wtslVD79SEOEXkTcjz/CK5Co/JKhJNtJBKvJsb9URqBMn1W/sgt5xsNXLXMgwf1sZlc75KHlP0NqbDPc2hU4YP27YLB+xTVrAIQAcFxBBCtNXd0Ky5wpKN6YesAOlcECp5AE/H64qM+iQ8ovXa1xkWiwc/WgG2kcyi8PVj4OHIMnx4CV0+QKvLwHSUIJA4HLjpNKoVct9on/nlYWPAV0RQW9Ymzn6lNgONUvPPqYP53scP7k1XlE0hewPwS/p/gxbzvlmQRaGqRRZ3o098oxExHj2wrhQIMp+daYvP72sINKLfntD0Wz3N7kS5nO8mnPP3Fu4KoB3GSnc9IVKfp9R8IB2Bmo5Cj5QCuivemBmaSw11rzqSib/vAEP3YyLwLSvZ8x6vtk6es9HS+o2aKI060eZE8d2girOUE7AuBQGzyh7Q1yNzNKGBqoBye+wA/yR1290Mlq2WYPK/crak3sANXzi+xGUmS48hdgNAI0OyvliQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(42112799006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZLXuSC95I9djXIOmM5aL13UfWGRlBMKquZRLRBn/5KBIejgU3zgpnr+TIM?=
 =?iso-8859-1?Q?49D+bARA5LBTwru8Xdu03XakjEnqRnfveajP/zfj31MEk3mAfn0MtwOJbG?=
 =?iso-8859-1?Q?6R/vKOQS3oafHO9MArE+0dHC5IZMt46lZDYUP87tZVVClrryI577nRFGI7?=
 =?iso-8859-1?Q?CIfQVAHS1zKXcBAkcnIVuX8Ebuz7CF2iKat1LhF1MwoRQgha3y/gSDe+F3?=
 =?iso-8859-1?Q?dNQi8Jm0gc20nf3YK0/mwPIXAGBRCC+JN6mvqiWmmBV3odwIOnUzWT525n?=
 =?iso-8859-1?Q?Frzdm6hG7BVqvgbVfms4ZxOZl2nOqv24tvVBBdOeG2s0AmUlCyxCENTHie?=
 =?iso-8859-1?Q?FrQgW7GVlDId7R5jnXSBn/ZxVb6M0tC/xjC07KdyiqvA7wY2D+fmbpzLrN?=
 =?iso-8859-1?Q?CPZ8MCURoHObx6txawIhAy4kvKL9NFleoARSf3zNVk4WgjR8HjQx3pJFU7?=
 =?iso-8859-1?Q?1gwPOmciY+ocfePLW8j02fWxGJZkFkPT0RLw1cK0xBbjMYH84ExhQwmAHn?=
 =?iso-8859-1?Q?A5LuvuLWZn3h1sLwR+GTkR0c1YuRWU1uc2Rj57XyJOUeSaw56VUD7P72eX?=
 =?iso-8859-1?Q?iDNr6kMhP58wjQlPEbzuQUdZF70Cfli1mKYo6g4+uPLyT4U12J+1HSvKB8?=
 =?iso-8859-1?Q?fcrlAhu7fpxFjp8BQepUhB+nvul9CudfgWen0tQfDTQimC10x3BqFXUgbc?=
 =?iso-8859-1?Q?ovbzve2g5U7EFiw564WEAjKnLae8Pqvgg4n7Ri4ftrMmSqONb/Xvx1LNc+?=
 =?iso-8859-1?Q?3CSwlJzWL4+dom8E4ie9xZHzAN8qfAdI/4QPBk7iL3t/uAGfQ+xcGOv4Vo?=
 =?iso-8859-1?Q?UAiTBZ2Na0iRGZPOfKI6QIEYYKPaJ0Xy0Nzoclzzek6aMBLRlgoYeOV29O?=
 =?iso-8859-1?Q?RCIvEqsiGVarxALxq9MsJ0hJ6Ts98DiL87MhKgM0XSosJBkSdUQtascQhL?=
 =?iso-8859-1?Q?GmgjmCrsitdSdfgij623UtoyCGlao5ptK5xLpgpHe2GVXElRZ7YbzHkqkY?=
 =?iso-8859-1?Q?KCQa4hiN6TiCJaLyDuW77q849VnvzCAkK77np8z/3awA3RtrRoxT85L94N?=
 =?iso-8859-1?Q?PEFwrdKUuKKF73GnTTK1Z3U6IHgHXZAFB4S2xHOZrJCUXtnKvkbAXGVKc1?=
 =?iso-8859-1?Q?o1PSripny/y+0j7mQEc+dSK8lpsXaHvZ+ntJSxGUB0qRWUZWOFawzU14UK?=
 =?iso-8859-1?Q?iQP1eeTlrbIbo0PzJ9SvS6CWyALmwf+TOqZO3pr5L29nUYmJtN138wnOMa?=
 =?iso-8859-1?Q?UW8dhodLyVabgXFTd69YGFCg64XgSvPfuNRXMGlQF0j/rrFu8C4lN4UscN?=
 =?iso-8859-1?Q?ruhTIZF0AoTBe8Vf++DxvuJkcCViD/fr0/b48i8W7NIvKusSkIMTvpT5Ft?=
 =?iso-8859-1?Q?94Ejz4Ke7Kw1YtR3FpE3qyI7cg5PlJkZj2chLu8mjp9kE3Pe7qH4gy1InH?=
 =?iso-8859-1?Q?eH73pKIOiP9VkJ489Kn+5SgvTVl1FPHiDE21eU/5ZabgNxicaVXd1ZH+xk?=
 =?iso-8859-1?Q?i7KtMrdT1qL4VegBhKaIiUVO2oLKQL/8GEbOXr58mlWPXiU0TBv0Ex+bJ9?=
 =?iso-8859-1?Q?u9CsMYHc5LxfUg7fnArL91JjEedFHppXR/oqkLdDxxBPOzqLHhQUk8s52m?=
 =?iso-8859-1?Q?Ov1APfQ3krNt34p/1gn7V5wx84E03LUj4nTGZiFte02aUtkql5Gm2vzxgU?=
 =?iso-8859-1?Q?8vgAjuWKfpgVuWr8TojCcx8TGYA+bd1KIpW68oFXM6P5p0zhiUOLfZ8ld9?=
 =?iso-8859-1?Q?8QjfmA3aFs/Ge+AIlCT4hl7ZyuUz1naMfEg0Qt0mqCv0K+7fUpO08/rzIN?=
 =?iso-8859-1?Q?UeQb1muaPX3/h8gYysHXYBs0pD8rx4E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2d7417-668e-40b4-f9c0-08df30a14ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 01:02:22.6838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1yUY3EPzmERnjmOn+yCDjkQ6D2iuxxzpZzj3nMXmPaIrhRPNQx1v2j7CVQucW0qobVUUMsOtThMVEBurXEqq3FOWV333mz4Ru5i3DUPy/5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6611
X-purgate-ID: tlsNG-c201ff/1792717345-738BE2A1-44A20BA1/0/0
X-purgate-type: clean
X-purgate-size: 4850
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

Michal Orzel <michal.orzel@amd.com> writes:

> On Arm, the hardware domain does not use the P2M pool. Its P2M pages are
> allocated directly from the heap, without any limit. However, when the
> hardware domain is created using dom0less, we still allocate a P2M pool
> for it, either of the default size or the one given in
> xen,domain-p2m-mem-mb. This memory is never used and is simply wasted.
> The same applies when the pool size is set for the hardware domain using
> XEN_DOMCTL_set_paging_mempool_size.
>
> Don't create the pool for a hardware domain. Make the get/set paging
> mempool domctls return -EOPNOTSUPP, skip the pool teardown and reject
> xen,domain-p2m-mem-mb for a hardware domain in dom0less.
>
> The dom0less check is Arm specific, because on RISC-V the hardware domain
> does use the P2M pool.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
>  docs/misc/arm/device-tree/booting.txt   |  4 +++-
>  xen/arch/arm/mmu/p2m.c                  | 14 ++++++++++++++
>  xen/common/device-tree/dom0less-build.c | 12 ++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 3787d2e2b668..c3705ab7d913 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -277,7 +277,9 @@ with the following properties:
>      used for the domain P2M pool. This is in-sync with the shadow_memory
>      option in xl.cfg. Leaving this field empty in device tree will lead =
to
>      the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4K=
B
> -    per MB of guest RAM plus 512KB for guest extended regions.
> +    per MB of guest RAM plus 512KB for guest extended regions. On Arm, t=
he
> +    hardware domain has no dedicated P2M pool, so specifying this proper=
ty
> +    for it makes the domain fail to build.
> =20
>  - max_grant_version
> =20
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 2cf35d8a3709..70d7c9fed955 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -61,6 +61,10 @@ static void p2m_free_page(struct domain *d, struct pag=
e_info *pg)
>  /* Return the size of the pool, in bytes. */
>  int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>  {
> +    /* No dedicated pool (no limit) for a hardware domain */
> +    if ( is_hardware_domain(d) )
> +        return -EOPNOTSUPP;
> +
>      *size =3D (uint64_t)ACCESS_ONCE(d->arch.paging.p2m_total_pages) << P=
AGE_SHIFT;
>      return 0;
>  }
> @@ -69,6 +73,8 @@ int p2m_set_allocation(struct domain *d, unsigned long =
pages, bool can_preempt)
>  {
>      struct page_info *pg;
> =20
> +    /* No dedicated pool (no limit) for a hardware domain */
> +    ASSERT(!is_hardware_domain(d));
>      ASSERT(spin_is_locked(&d->arch.paging.lock));
> =20
>      for ( ; ; )
> @@ -119,6 +125,10 @@ int arch_set_paging_mempool_size(struct domain *d, u=
int64_t size)
>      unsigned long pages =3D size >> PAGE_SHIFT;
>      int rc;
> =20
> +    /* No dedicated pool (no limit) for a hardware domain */
> +    if ( is_hardware_domain(d) )
> +        return -EOPNOTSUPP;
> +
>      if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
>           pages !=3D (size >> PAGE_SHIFT) ) /* 32-bit overflow? */
>          return -EINVAL;
> @@ -134,6 +144,10 @@ int p2m_teardown_allocation(struct domain *d)
>  {
>      int ret =3D 0;
> =20
> +    /* No dedicated pool - nothing to tear down */
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
>      spin_lock(&d->arch.paging.lock);
>      if ( d->arch.paging.p2m_total_pages !=3D 0 )
>      {
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index fcb438c50a04..a877e695ad11 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -757,6 +757,18 @@ static int __init domain_p2m_set_allocation(struct d=
omain *d, uint64_t mem,
>      int rc;
> =20
>      rc =3D dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_=
mb);
> +
> +    /* No dedicated pool (no limit) for a hardware domain on Arm */
> +    if ( IS_ENABLED(CONFIG_ARM) && is_hardware_domain(d) )
> +    {
> +        if ( !rc )
> +            return 0;
> +
> +        printk(XENLOG_ERR
> +               "xen,domain-p2m-mem-mb cannot be specified for a hardware=
 domain\n");
> +        return -EINVAL;
> +    }
> +
>      /* If xen,domain-p2m-mem-mb is not specified, use the default value.=
 */
>      p2m_pages =3D rc ?
>                  p2m_mem_mb << (20 - PAGE_SHIFT) :

--=20
WBR, Volodymyr=

