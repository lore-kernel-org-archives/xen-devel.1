Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFC1606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=hc86y7hD
Received: from list by lists.xenproject.org with outflank-mailman.1481403.1685265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQibv-000148-TE; Tue, 10 Nov 2026 09:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481403.1685265; Tue, 10 Nov 2026 09:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQibv-00013o-QP; Tue, 10 Nov 2026 09:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1481403;
 Tue, 10 Nov 2026 09:57:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQibt-00012U-J9
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:57:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQibs-00Gwsv-W4
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:57:49 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af2ea99-2eae-0a2a0a5409dd-0a2a45018258-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:57:48 +0100
Received: from [52.101.70.130]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af2ea8b-5984-0a2a45010019-34654682d8bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:57:31 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by AS2PR03MB9002.eurprd03.prod.outlook.com (2603:10a6:20b:5f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 09:57:28 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 09:57:28 +0000
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
 b=k4m+GtRUfAVm5wmX+/gdB5IXC/dQBEEn525hDyzCt2DEoJgYF9tg5myy6qhtOJA6JBJZCarOWF4z3sjoTT1jcy9x8IAgy2tr8qrMNWwGtSygxsE8rIauh4PpwXi2ia1ZDwCxoNw/KfakRUVIkIrm0UxFL3UX05tvINV+AFKQ2vNiQ2/6i9jwnN75uowudDN6/5Wm+QgT47eMvk3z/PU0EFGMG3U+Xa4uM0NSWeyxtY5B2iOkeuqGPaVEhbx+3vLOKHRNGS6SYo5iwu/afstPMOL/kZkiGOGL5H1pbjJmac9joEpZGpX4COZ3uyHrtx06oQmY64TKtj2T1s7zeYCyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR8RkwZxtdX8uP8dmfZNQxtrb2BBOkdj4QS60eDZTSU=;
 b=b+42EWwxjPhzOP6dvHKqRlT0yuMGkZVdhYzjTluORTwSAm7bMwXqnZL/WCsXrryknkqi0uFi7jVxsLCaoYMOEAsJtID40n95isH7HiwMbIjdYMN6Q4nH+5pPnml34iGuCfLRGW7huPZSiZWZaFlAjAS5a8yW/7PrVN+5TTaqrLazNeIXARJNi0TKJtwrJ4AwZRJ90cJfWm2osqplhV2a9IvuvNYS7Mw7NwDp59ULMb4NXfjlTJbKZG/azBTlNhYJtvrRC2aJ/o99XcnrgpI4Ty2QvVm3mQrrMEtAjDfMycFx5E/z7wXxmM7nvvZJ0PlBZ8r7+KLB26C/7z0aFb8Y7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR8RkwZxtdX8uP8dmfZNQxtrb2BBOkdj4QS60eDZTSU=;
 b=hc86y7hDjJobL/uybHHSmxwPDf/nifF+Xn8ymVQCVE/ST7KQGGRzkUPGTZGf3YvlruudWEf+myDIHb4tpx0d8XJtfr7TgQkMbIXKoBwrDm2gmdSGiwArsAJPzGva4XD1IhZkx94hMMAR+QcSzPIiEJae9H39wz9nHxr/0pWc/ZfuwRl5w0JB8poME8KBDi/L21inzvaTCDg4OlichqlN4nbZvyTRM7edIXWZOxR28lAhWzvmc5KUrp1wzH2VdBntlaohmbs9/dh9jSKR2UqKAB9ls0YiT+uaaZkWNaovHPgn31vvSdDyulB52Zxn2uhhApKW+VNHhxfT/Ezy5DIreQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.com>
Subject: Re: [PATCH v5 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Topic: [PATCH v5 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
Thread-Index: AQHda7koX4FG1lKLjU2XVKKJzideWbcnHCwA
Date: Tue, 10 Nov 2026 09:57:28 +0000
Message-ID: <20261110095654.551557-1-mykyta_poturai@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
 <112c09580e509dd89db411fd61e556d8637582d4.1793726692.git.milan_djokic@epam.com>
In-Reply-To:
 <112c09580e509dd89db411fd61e556d8637582d4.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|AS2PR03MB9002:EE_
x-ms-office365-filtering-correlation-id: 0b63c1b7-a029-4f95-db39-08df3f11079c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 9I8oVHzvZsegHWQ6wML8X2a2CZ8T2/7UN61+VMBXzA4iPRSOxsVovodXKmcYG7TuxYcXIKo+KYO2IrgxMQb+rNb/qUOAGm7K2lMbtAuwWMiQHxIXh3frOSHZnCMDnV4GHJxpZawtqjAg9VmEhK2po7uSJwOzVwAYVHxK96KJVwo8tOtj/5R0+XWGidiicydM6hIHnr3LQtBNr5KwCboHDHHtoSEpg4/DzxngzXtn7TSq8MbpKlsuRwQK2joAFm2vEBiX7UMdeLR0Y4sm5SEgXA7g/eA1pRyXq9GHl+T/i9HVKr68KGSfUnGvXtf3WL6gWjixjOaJsBEcvtWRFjLD9ISv2q5exdAuRd5xyc9cEXzqPQFzHvvpgbOTYwNTXGSanAIhV+nc79P4bHO7V9taij+cagO3oVthb8pbgUXQeDq1h6pcA0tbLwl+TGcTWDxlwvL+azJR+Uxn2MZ7SFcnIiX8xWoUpHBDibFG7FKQ4uWGOVr7MnHlHoE4yn+ehksz4KmrPpWwAEdFKedIPbwPNGRucdq9t1EXPTTZDAMiSZ8CZV+DK6D4d6NrpIstHW21iK6ECSSvnHM+yTWMJxsFffzYvV/x9Aj7uJYZ1Oq1fbxz8Ma8AcKeWzdspsjZIqIuaDEsXml2fLBw665N0TzsRIPX6XuxBfYMxnGqfkITycHFyslSYFeCbuk/sch6WOqbugvLkD3ZNPIamqeqh/6SFo462V0L4uaMGTWCUn+S0xQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ELpPRrnhBFpxYaf2A/1j86IE2JdlPFYrU0XUkvzUCAvnCY6vtEEBpTBtZP?=
 =?iso-8859-1?Q?tqpVgB3dkyiIqT/6SMNNbOoWPX2tS1tbp9Q0zgiYh65XYpAaVD30t2wbdT?=
 =?iso-8859-1?Q?PT5huHkfp6RLyKadYao1NFX4r1gCCh7uFnRIgqq4duHXEyP80lA8OtSd4Y?=
 =?iso-8859-1?Q?2Z7G6MnXCd1EHq5RhXDzB2xQcD+ki37T/II689l6iDRiPbjCtZQshLA/x3?=
 =?iso-8859-1?Q?HNmUryjRn3mFf9NBQGV5tQgIzyOqsanfU5q6F2VsyFsfnTHCF+2h8cfZCp?=
 =?iso-8859-1?Q?KxBva3DpDEwL/CyF6vi4RzoPrr48/DEMGUV2os6MEwbCyHZdu2E3oyxtQ5?=
 =?iso-8859-1?Q?/ixTgOV5gLVsBPZUeN6fOaqjnFzDe1AoN0fYVF0mF6pOwx3fZDulhUmQw3?=
 =?iso-8859-1?Q?tCutfo6MvBNOPDpUeN4m/GX8Buh+U5s/zJd50ByEQkbsnys7Tl02JRh+Us?=
 =?iso-8859-1?Q?yCOtfEENaGEkx8oblUptyg0ucSGIgz7eXzaKzyoHg895LZSIqboNWE4fPp?=
 =?iso-8859-1?Q?i5SZ7goxrXHUCiFskdgN/rWR8bmdsXkcfgLU3PINlAAVWV4gm7Hzb9ZfQY?=
 =?iso-8859-1?Q?3Vb665Fqs4XLy47lTyKC37fJ95y14K3cKQgfJzh/55XLu8W/9sKKS6V3Fw?=
 =?iso-8859-1?Q?mRHEbgGif5eaduHqSpcxW0lMRwzj/A/rGgOyc+0ioxglxv6R5QDPB0Ods5?=
 =?iso-8859-1?Q?1MgYvVnT8PQCjKMYWaj2sDY8vF1nhKJ87P1zmxdzEB1TuONDG6wz0M51JV?=
 =?iso-8859-1?Q?JgkaGUL/oec52lhiusLgZh4VC/eBB0C4RVkHJexblJc2RFgp5+S/i5yFu+?=
 =?iso-8859-1?Q?c6kBOItUfUom6S8xO1hNq+ewolf9xH/E9fKYc6k0Z1UAJHNvJSF5anYIKx?=
 =?iso-8859-1?Q?zxijgMyh4oSFMfnJ736FzU0O5EuoOcrN4pS+gF32niVkC6bDHgp2reayIS?=
 =?iso-8859-1?Q?OY1JTu9OsMKl+OXxmJQRyXeg+vUZV/kA0YdzYQiqpN4hwlOjUsMATKRATy?=
 =?iso-8859-1?Q?R70RaA75KjyiIqPkA8opjBanaS7knr0SyanyChuz8Eu5NWq+mEZVfaddrp?=
 =?iso-8859-1?Q?VgdRRHV0/hLURljms5Tr82uhi2t5ELz3gW8sQT4PkNHsfUz9IU0ZmWGYpZ?=
 =?iso-8859-1?Q?E0+Pk+m4/zpEzolvMHMCwjQqe3L5yxqtcOnuBaxN4CbfP3kw6O2QdkVjWt?=
 =?iso-8859-1?Q?W99fgg5xdF1GSfoKqFP1x75Jn3/co/gxtJO9HJLkCZ3gQsF41ssSmJaw5y?=
 =?iso-8859-1?Q?hyk+qAWadH6CRlimOrCiyA2rEGP5Lvk4nCvnt/c5LZ1A7xqJorfKhU8AFC?=
 =?iso-8859-1?Q?6KU6nsoxx9AmqIPryUW9nuOwx21hWLM2ukrKGcFjW5z3pktlVLPpe4u+hG?=
 =?iso-8859-1?Q?fWtjeQTVMl4P33Xb6Udp2sWasDYv4JH0QL7bD8BU18MMqJrzDRPjYF5lEK?=
 =?iso-8859-1?Q?lcWmko5evXXAGtf7D03oYT+C6Fib6WQYQS0I7jfwUR1IsyW3boaYWi5Wv1?=
 =?iso-8859-1?Q?LQHosUyirR3kErvJi/DzDmGFp//0T1HR61yHR9AgNrO7cGZixP4Yrv1VOs?=
 =?iso-8859-1?Q?JxkwQdsZPGfm/tRyOpVAX8VhFTkajK8NQsQeQGEJhUQnjHOpjKiZZcJGbx?=
 =?iso-8859-1?Q?cqCk1Cx4/p1T9RpRslXaH9BH9+L/kZ954yGoCFlUv27FKyvGhqInrPxgue?=
 =?iso-8859-1?Q?cbi4uTW9DKVxPPyn8G3NdlLSUnm5ySzhD2ndpxPS6i7mQx95MAFToZJZQs?=
 =?iso-8859-1?Q?IyXB06NhmWcTpK12wvGHSdhEK5JcUWooKy1qIHTBgxXjDPjDej0PD/R+ms?=
 =?iso-8859-1?Q?rQhvxLasvg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b63c1b7-a029-4f95-db39-08df3f11079c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 09:57:28.4008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOhbb8D6bIGFMSpZkzqsQDRlif3Xaz6oyr60YbIPYwlXytxHhDYmAFineliTle0NSRGBXde9gqU1XZSQLdoNxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9002
X-purgate-ID: tlsNG-d62444/1794304651-1D47D757-289DC77A/0/0
X-purgate-type: clean
X-purgate-size: 19766
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 17:30:54 +0000, Milan Djokic wrote:
> Introduce a vIOMMU mapping layer to support passthrough of IOMMU devices
> attached to different physical IOMMUs, including devices with the same
> Stream ID.
>
> Add a new generic vIOMMU API, viommu_allocate_vsid(), which allocates a
> guest vSID and maps it to the input pSID and the backing physical SMMU.
>
> Once the mapping is established, the guest uses the vSID for stage-1
> commands, and Xen translates the vSID to the corresponding pSID before
> processing the command on the physical SMMU.
>
> Implement usage of the new API for dom0less guests. Allocate vSIDs when
> creating the guest device tree and replace the original pSIDs with vSIDs
> that are subsequently used by the guest driver.
>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>  xen/arch/arm/include/asm/viommu.h       |  12 ++
>  xen/common/device-tree/dom0less-build.c |  35 +++--
>  xen/drivers/passthrough/arm/smmu-v3.c   |  10 +-
>  xen/drivers/passthrough/arm/viommu.c    |   9 ++
>  xen/drivers/passthrough/arm/vsmmu-v3.c  | 184 +++++++++++++++++++++++-
>  xen/include/xen/iommu.h                 |   6 +-
>  6 files changed, 242 insertions(+), 14 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm=
/viommu.h
> index 5ae21042f0..3d0eb92655 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -34,6 +34,16 @@ struct viommu_ops {
>       * Called during domain destruction to free resources used by vIOMMU=
.
>       */
>      int (*relinquish_resources)(struct domain *d);
> +
> +    /*
> +     * Allocate free vSID/vRID for the guest device and establish vID->p=
ID mapping
> +     * Called during domain device assignment.
> +     * Returns 0 on success and sets vsid argument to newly allocated vS=
ID/vRID
> +     * mapped to physical ID (id argument).
> +     * Negative error code returned if allocation fails.
> +     */
> +    int (*allocate_vsid)(struct domain *d, uint32_t id, uint32_t phandle=
,
> +                         uint32_t *vsid);
>  };
>
>  struct viommu_desc {
> @@ -54,6 +64,8 @@ extern struct list_head host_iommu_list;
>  int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>  int viommu_relinquish_resources(struct domain *d);
>  uint8_t viommu_get_type(void);
> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle=
,
> +                         uint32_t *vsid);
>  void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>                              const struct dt_device_node *node,
>                              const void *iommu);
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 970f89ef68..3b2a888698 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -32,6 +32,10 @@
>  #include <xen/static-memory.h>
>  #include <xen/static-shmem.h>
>
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +#include <asm/viommu.h>
> +#endif
> +
>  #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>
>  static domid_t __initdata xs_domid =3D DOMID_INVALID;
> @@ -333,11 +337,12 @@ static int __init handle_prop_pfdt(struct kernel_in=
fo *kinfo,
>  }
>
>  #ifdef CONFIG_ARM_VIRTUAL_IOMMU
> -static int __init modify_pfdt_node(void *pfdt, int nodeoff)
> +static int __init modify_pfdt_node(void *pfdt, int nodeoff, struct domai=
n *d)
>  {
>      int proplen, i, rc;
>      const fdt32_t *prop;
>      fdt32_t *prop_c;
> +    uint32_t psid, phandle, vsid;
>
>      prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
>      if ( !prop )
> @@ -347,10 +352,23 @@ static int __init modify_pfdt_node(void *pfdt, int =
nodeoff)
>      if ( !prop_c )
>          return -ENOMEM;
>
> +    /*
> +     * Assign <vIOMMU vSID> pairs to iommus property and establish
> +     * vSID->pSID mappings
> +     */
>      for ( i =3D 0; i < proplen / 8; ++i )
>      {
> +        phandle =3D fdt32_to_cpu(prop[i * 2]);
> +        psid =3D fdt32_to_cpu(prop[i * 2 + 1]);
> +        rc =3D viommu_allocate_vsid(d, psid, phandle, &vsid);
> +        if ( rc )
> +        {
> +            dprintk(XENLOG_ERR, "(DOMID=3D%u) Failed to allocate vSID fo=
r "
> +                    "pSID: %u, pIOMMU: %u", d->domain_id, psid, phandle)=
;

Missing \n?

> +            goto out;
> +        }
>          prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> -        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
> +        prop_c[i * 2 + 1] =3D cpu_to_fdt32(vsid);
>      }
>
>      rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
> @@ -365,7 +383,8 @@ static int __init modify_pfdt_node(void *pfdt, int no=
deoff)
>      return rc;
>  }
>  #else
> -static inline int __init modify_pfdt_node(void *pfdt, int nodeoff)
> +static inline int __init modify_pfdt_node(void *pfdt, int nodeoff,
> +                                          struct domain *d)
>  {
>      return -EOPNOTSUPP;
>  }
> @@ -374,7 +393,7 @@ static inline int __init modify_pfdt_node(void *pfdt,=
 int nodeoff)
>  static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>                                   int nodeoff,
>                                   uint32_t address_cells, uint32_t size_c=
ells,
> -                                 bool scan_passthrough_prop)
> +                                 bool scan_passthrough_prop, struct doma=
in *d)
>  {
>      int rc =3D 0;
>      void *fdt =3D kinfo->fdt;
> @@ -397,12 +416,12 @@ static int __init scan_pfdt_node(struct kernel_info=
 *kinfo, void *pfdt,
>      node_next =3D fdt_first_subnode(pfdt, nodeoff);
>      while ( node_next > 0 )
>      {
> -        rc =3D modify_pfdt_node(pfdt, node_next);
> +        rc =3D modify_pfdt_node(pfdt, node_next, d);
>          if ( rc )
>              return rc;
>
>          rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, siz=
e_cells,
> -                            scan_passthrough_prop);
> +                            scan_passthrough_prop, d);
>          if ( rc )
>              return rc;
>
> @@ -489,7 +508,7 @@ static int __init domain_handle_dtb_boot_module(struc=
t domain *d,
>              res =3D scan_pfdt_node(kinfo, pfdt, node_next,
>                                   DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>                                   DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> -                                 false);
> +                                 false, d);
>              if ( res )
>                  goto out;
>              continue;
> @@ -499,7 +518,7 @@ static int __init domain_handle_dtb_boot_module(struc=
t domain *d,
>              res =3D scan_pfdt_node(kinfo, pfdt, node_next,
>                                   DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>                                   DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> -                                 true);
> +                                 true, d);
>              if ( res )
>                  goto out;
>              continue;
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index f213b3de12..b0ec004960 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3103,7 +3103,7 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(=
const struct device *dev)
>  }
>
>  static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
> -				u32 sid)
> +				u32 sid, const struct arm_smmu_device *smmu)
>  {
>  	int i;
>  	unsigned long flags;
> @@ -3119,6 +3119,9 @@ static struct iommu_domain *arm_smmu_get_domain_by_=
sid(struct domain *d,
>  	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>  		smmu_domain =3D to_smmu_domain(io_domain);
>
> +		if (smmu_domain->smmu !=3D smmu)
> +			continue;
> +
>  		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>  		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>  			for (i =3D 0; i < master->num_streams; i++) {
> @@ -3347,7 +3350,8 @@ static void arm_smmu_iommu_xen_domain_teardown(stru=
ct domain *d)
>  }
>
>  static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
> -		const struct iommu_guest_config *cfg)
> +				const struct iommu_guest_config *cfg,
> +				const struct arm_smmu_device *smmu)
>  {
>  	int ret =3D -EINVAL;
>  	unsigned long flags;
> @@ -3357,7 +3361,7 @@ static int arm_smmu_attach_guest_config(struct doma=
in *d, uint32_t sid,
>  	struct iommu_domain *io_domain;
>
>  	spin_lock(&xen_domain->lock);
> -	io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
> +	io_domain =3D arm_smmu_get_domain_by_sid(d, sid, smmu);
>  	if (!io_domain) {
>  		ret =3D -ENODEV;
>  		goto out;
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrou=
gh/arm/viommu.c
> index b4b91ab1cb..e476567b49 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -76,6 +76,15 @@ int viommu_relinquish_resources(struct domain *d)
>      return cur_viommu->ops->relinquish_resources(d);
>  }
>
> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle=
,
> +                         uint32_t *vsid)
> +{
> +    if ( !cur_viommu )
> +        return -ENODEV;
> +
> +    return cur_viommu->ops->allocate_vsid(d, id, phandle, vsid);
> +}
> +
>  uint8_t viommu_get_type(void)
>  {
>      if ( !cur_viommu || host_iommu_list_incomplete ||
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthr=
ough/arm/vsmmu-v3.c
> index 24588affe9..5d225ccc08 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -86,6 +86,8 @@
>  #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MAS=
K, \
>                                      FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK=
, x))
>
> +#define MAX_VSID   (1 << SMMU_IDR1_SIDSIZE)
> +
>  /* event queue entry */
>  struct arm_smmu_evtq_ent {
>      /* Common fields */
> @@ -133,6 +135,14 @@ struct arm_vsmmu_queue {
>      uint8_t     max_n_shift;
>  };
>
> +/* vSID->pSID mapping entry */
> +struct vsid_entry {
> +    struct list_head entry;
> +    uint32_t    vsid;
> +    uint32_t    psid;
> +    struct arm_smmu_device *smmu;
> +};
> +
>  struct virt_smmu {
>      struct      domain *d;
>      struct      list_head viommu_list;
> @@ -157,6 +167,8 @@ struct virt_smmu {
>      spinlock_t  cr2_lock;
>      spinlock_t  strtab_cfg_lock;
>      spinlock_t  irq_cfg_lock;
> +    spinlock_t vsids_lock;
> +    struct list_head vsids;
>  };
>
>  /* Helper functions */
> @@ -379,8 +391,31 @@ int arm_vsmmu_handle_evt(struct domain *d, struct de=
vice *dev, uint64_t *evt)
>      }
>      else
>      {
> +        uint32_t sid =3D FIELD_GET(EVTQ_0_SID, evt[0]);
> +        struct vsid_entry *vsid;
> +        bool found =3D false;
> +
>          smmu =3D list_entry(d->arch.viommu_list.next,
>                            struct virt_smmu, viommu_list);
> +
> +        spin_lock(&smmu->vsids_lock);
> +
> +        /* Translate pSID->vSID */
> +        list_for_each_entry(vsid, &smmu->vsids, entry)
> +        {
> +            if ( vsid->psid =3D=3D sid && vsid->smmu->dev =3D=3D dev )
> +            {
> +                evt[0] &=3D ~EVTQ_0_SID;
> +                evt[0] |=3D FIELD_PREP(EVTQ_0_SID, vsid->vsid);
> +                found =3D true;
> +                break;
> +            }
> +        }
> +
> +        spin_unlock(&smmu->vsids_lock);
> +
> +        if ( !found )
> +            return -ENOENT;
>      }
>
>      ret =3D arm_vsmmu_write_evtq(smmu, evt);
> @@ -558,6 +593,71 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smm=
u *smmu, uint64_t *cmdptr)
>      struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
>      uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
>      struct iommu_guest_config guest_cfg =3D {0};
> +    struct arm_smmu_device *phys_smmu =3D NULL;
> +    struct host_iommu *host_iommu;
> +    uint32_t psid;
> +    struct arm_smmu_evtq_ent ent =3D {
> +        .opcode =3D EVT_ID_BAD_STREAMID,
> +        .sid =3D sid,
> +        .c_bad_ste_streamid =3D {
> +            .ssid =3D 0,
> +            .ssv =3D false,
> +        },
> +    };
> +
> +    /* vIOMMU->pIOMMU identity mapped for HW domain */
> +    if ( domain_use_host_layout(d) )
> +    {
> +        psid =3D sid;
> +        list_for_each_entry(host_iommu, &host_iommu_list, entry)
> +        {
> +            if ( host_iommu->addr =3D=3D smmu->addr )
> +            {
> +                phys_smmu =3D (struct arm_smmu_device *) host_iommu->iom=
mu;
> +                break;
> +            }
> +        }
> +    }
> +    else {
> +        struct vsid_entry *vsid_entry;
> +        bool entry_found =3D false;
> +
> +        spin_lock(&smmu->vsids_lock);
> +        /* vSID out of range or no vSIDs allocated */
> +        if ( sid >=3D MAX_VSID || list_empty(&smmu->vsids) )
> +        {
> +            spin_unlock(&smmu->vsids_lock);
> +            arm_vsmmu_send_event(smmu, &ent);
> +            return -EINVAL;
> +        }
> +
> +        /* get vSID entry corresponding to passed vSID */
> +        list_for_each_entry(vsid_entry, &smmu->vsids, entry)
> +            if ( vsid_entry->vsid =3D=3D sid )
> +            {
> +                entry_found =3D true;
> +                break;
> +            }
> +
> +        /* vSID not mapped */
> +        if ( !entry_found )
> +        {
> +            spin_unlock(&smmu->vsids_lock);
> +            arm_vsmmu_send_event(smmu, &ent);
> +            return -EINVAL;
> +        }
> +
> +        psid =3D vsid_entry->psid;
> +        phys_smmu =3D vsid_entry->smmu;
> +        spin_unlock(&smmu->vsids_lock);
> +    }
> +
> +    /* vSID mapped to invalid physical SMMU */
> +    if (!phys_smmu)
> +    {
> +        arm_vsmmu_send_event(smmu, &ent);
> +        return -EINVAL;
> +    }
>
>      ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
>      if ( ret )
> @@ -578,7 +678,7 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu=
 *smmu, uint64_t *cmdptr)
>      else
>          guest_cfg.config =3D ARM_SMMU_DOMAIN_S1;
>
> -    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
> +    ret =3D hd->platform_ops->attach_guest_config(d, psid, &guest_cfg, p=
hys_smmu);
>      if ( ret )
>          return ret;
>
> @@ -1189,6 +1289,13 @@ static int vsmmuv3_init_single(struct domain *d, p=
addr_t addr,
>      smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
>      smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
>
> +    /*
> +     * vSID->pSID mapping layer is only used in the context of domains t=
hat
> +     * are not direct-mapped
> +     */
> +    if ( !domain_use_host_layout(d) )
> +        INIT_LIST_HEAD(&smmu->vsids);
> +
>      spin_lock_init(&smmu->cmd_queue_lock);
>      spin_lock_init(&smmu->evt_queue_lock);
>      spin_lock_init(&smmu->gerror_lock);
> @@ -1197,6 +1304,7 @@ static int vsmmuv3_init_single(struct domain *d, pa=
ddr_t addr,
>      spin_lock_init(&smmu->cr2_lock);
>      spin_lock_init(&smmu->strtab_cfg_lock);
>      spin_lock_init(&smmu->irq_cfg_lock);
> +    spin_lock_init(&smmu->vsids_lock);
>
>      ret =3D vgic_reserve_virq(d, virq);
>      if ( !ret )
> @@ -1317,8 +1425,16 @@ static int vsmmuv3_relinquish_resources(struct dom=
ain *d)
>      if ( list_head_is_null(&d->arch.viommu_list) )
>          return 0;
>
> -    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_lis=
t )
> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_lis=
t)
>      {
> +        struct vsid_entry *vsid, *vsid_temp;
> +
> +        list_for_each_entry_safe(vsid, vsid_temp, &pos->vsids, entry)
> +        {
> +            list_del(&vsid->entry);
> +            xfree(vsid);
> +        }

Can this break for host_layout domains? The list is only initialized for no=
n
host_layout ones.

> +
>          list_del(&pos->viommu_list);
>          xfree(pos);
>      }
> @@ -1326,8 +1442,72 @@ static int vsmmuv3_relinquish_resources(struct dom=
ain *d)
>      return 0;
>  }
>
> +static int vsmmuv3_allocate_vsid(struct domain *d, uint32_t id,
> +                                 uint32_t phandle, uint32_t *vsid)
> +{
> +    uint32_t i =3D 0;
> +    struct virt_smmu *smmu;
> +    struct host_iommu *host_iommu;
> +    struct arm_smmu_device *phys_smmu =3D NULL;
> +    struct vsid_entry *entry;
> +    struct list_head *vsid_head;
> +
> +    /* vSID->pSID mapping layer not used for direct-mapped domains */
> +    if ( domain_use_host_layout(d) )
> +        return -EOPNOTSUPP;
> +
> +    if ( list_head_is_null(&d->arch.viommu_list) )
> +        return -ENODEV;
> +
> +    smmu =3D list_first_entry(&d->arch.viommu_list, struct virt_smmu, vi=
ommu_list);
> +
> +    /*
> +     * Find the physical SMMU corresponding to the device-tree phandle.
> +     */
> +    list_for_each_entry(host_iommu, &host_iommu_list, entry)
> +    {
> +        if ( host_iommu->dt_node->phandle =3D=3D phandle )
> +        {
> +            phys_smmu =3D (struct arm_smmu_device *) host_iommu->iommu;
> +            break;
> +        }
> +    }
> +
> +    if ( !phys_smmu )
> +        return -ENODEV;
> +
> +    spin_lock(&smmu->vsids_lock);
> +    /* Get first free vSID index */
> +    list_for_each(vsid_head, &smmu->vsids)
> +        i++;
> +
> +    /* Max number of vSIDs already allocated? */
> +    if ( i =3D=3D MAX_VSID )
> +    {
> +        spin_unlock(&smmu->vsids_lock);
> +        return -ENOMEM;
> +    }
> +
> +    entry =3D xzalloc(struct vsid_entry);
> +    if ( !entry )
> +    {
> +        spin_unlock(&smmu->vsids_lock);
> +        return -ENOMEM;
> +    }
> +
> +    /* Establish vSID->pSID mapping */
> +    entry->vsid =3D i;
> +    entry->psid =3D id;
> +    entry->smmu =3D phys_smmu;
> +    *vsid =3D entry->vsid;
> +    list_add_tail(&entry->entry, &smmu->vsids);
> +    spin_unlock(&smmu->vsids_lock);
> +    return 0;
> +}
> +

Is it okay for multiple vsids to be mapped to the same psid?

>  static const struct viommu_ops vsmmuv3_ops =3D {
>      .domain_init =3D domain_vsmmuv3_init,
> +    .allocate_vsid =3D vsmmuv3_allocate_vsid,
>      .relinquish_resources =3D vsmmuv3_relinquish_resources,
>  };
>
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 253f8bb6cb..c94ee4f08e 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -312,7 +312,10 @@ static inline int iommu_add_dt_pci_sideband_ids(stru=
ct pci_dev *pdev)
>  #endif /* HAS_DEVICE_TREE_DISCOVERY */
>
>  struct page_info;
> +#ifdef CONFIG_ARM
>  struct iommu_guest_config;
> +struct arm_smmu_device;
> +#endif
>
>  /*
>   * Any non-zero value returned from callbacks of this type will cause th=
e
> @@ -391,7 +394,8 @@ struct iommu_ops {
>
>  #ifdef CONFIG_ARM
>      int (*attach_guest_config)(struct domain *d, uint32_t sid,
> -                               const struct iommu_guest_config *cfg);
> +                               const struct iommu_guest_config *cfg,
> +                               const struct arm_smmu_device *smmu);
>  #endif
>  };

Isn't arm_smmu_device a little too specific? This will be a problem if othe=
r
IOMMU implementation tries to add support for this. Maybe replace with void=
* and
let specific driver cast it to it's own type?

Thanks,
Mykyta=

