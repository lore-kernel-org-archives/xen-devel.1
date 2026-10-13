Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839DECA9ED0
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 02:59:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446662.1662755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGSjS-0007vE-2M; Tue, 13 Oct 2026 02:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446662.1662755; Tue, 13 Oct 2026 02:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGSjR-0007v7-W2; Tue, 13 Oct 2026 02:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1446662;
 Tue, 13 Oct 2026 02:59:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xGSjQ-0007v1-4P
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 02:59:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGSjP-00DesR-EE
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 04:59:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd9e7d-8faa-0a2a0a5109dd-0a2a45029404-6
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:59:11 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6acd9e7f-6ca4-0a2a45020019-34654848b25b-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:59:11 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by GVXPR03MB11092.eurprd03.prod.outlook.com (2603:10a6:150:2a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 02:59:06 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%4]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 02:59:06 +0000
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
 b=WHReWNORxjACEptDw82Gy3MH+PnU+A+4SvkphC4zF19+HMrKqbNmh3AxjgqQ9MWNWzIveFwQrDtWwYfNxHUd0bvKa7tpnoJ03Vm4BujpmpLDhPXzKZ91p+RooPcONNUJd8+OGnhDjSiraQ2ORXoJSdzIlYXMlud5gAtqSrup6b92HrXcEmMZBVMXkj4K2mUhw1buen4xH/u/EF0qj2X12BVeldiol7UPhNtiH3wYakkvim2dFUx/Z09teGhyXvOr/7saqh4V5mfZm1aGFFW/qJLo6GTlvPwzMAMC+qZ23m7DSowuFWzVAGhrYTzfx8T982g/bHkbsuiOJrZP4M5b0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mQc2r15wOLTA8zOhQs/kKQnVWeEG1CIJ/D1gPI2Kcw=;
 b=jSRr6yn+S6zpXvCovOwF2EFGW1mp5JSJHQ3eiCQIBkt3aCWGRvHNePCghQiq0KnfOHw4jvOl5q/oQcYjv2367COK1YJRc0uxj+8WVNKpHPi3HHJOqV6Bvx5o3NP50/MTT/mNiNPmL5dPzeiWaXHsaOgWydRiINh5lPz+BZ0z2ZRzhbGyaLW23oJYLr/NPS3+cTJx73q9nMUPTTp8KTNWFJ0HKsBa2wZUVkO37hlJk0CQlIR0V+Lum4NZ8OEwZ7UVxkELWaAaAblmzxeqWMIK4yhi9Wz7WJqYGuI/5H12vonqUGJJlK2l53e0V/7P/bfMfhynm0YTn2NtNV+LSJYATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mQc2r15wOLTA8zOhQs/kKQnVWeEG1CIJ/D1gPI2Kcw=;
 b=Q0U8tH0YwbONoWuQpLrrZV/cEeWvN6sYggaLHd1dAhhGhxHTxZnoxJ/tfq2nAG/J52B/QwjJtFKmyrgi9tHKjG06gDGDIJhNtvGpeLbi5DnzqDN/hlIq97G3WsQ4pWDSESVXtM72KQgWP6+RgUwdYzA5E08zood/WyqRDZJE7MR74u+5zQOygUKKijnALEErmCjD+LDlPjsmigq2gFS/D6SoY28i9PgZW8yfFfTBYlIiEFCxW4k2fLmkOu+RfUJ7AQeFJ67gcwt/95hQR0VGkbY2QkRDGTRavT9TKXG2oIOblGPH/H7BSHg4+8I/HeDtdl+Y8vE4mEbs5BR59+orRQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 3/4] xen/arm: its: refactor ITS quirk matching
Thread-Topic: [PATCH v4 3/4] xen/arm: its: refactor ITS quirk matching
Thread-Index: AQHdUEUWBir3UQDjYEWvHkcwQ5Z1KA==
Date: Tue, 13 Oct 2026 02:59:05 +0000
Message-ID: <875wz6wbk6.fsf@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
	<b29ddd0b36b5564c564c31f511ecddb1d681afeb.1790707009.git.mykola_kvach@epam.com>
In-Reply-To:
 <b29ddd0b36b5564c564c31f511ecddb1d681afeb.1790707009.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Tue, 29 Sep 2026 22:02:12 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|GVXPR03MB11092:EE_
x-ms-office365-filtering-correlation-id: 11f498ff-013c-4649-5145-08df28d5f1cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|23010399003|38070700021|11063799006|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 SN/XEY6HxB3IEw3B8duZ02q9e4Jv5fo32Kyc+pn6ZMuG77OLzB+mX0ZrmBz1NWPs83JBZbyWenS2DfrU9/wAaj75FMP+wYxDe1xh3zjgWv4xXIU2olL14ZVpb++T3ZrG/2Wydb7zIp0QKZmEh6L5GWlkNW3qnkFPxiK9xN1bJdizwo1m3hiYL3rsiSY9ZXtk9opl7Mv9KynNufsqQMPEOkSM5mhTYL5T6BO3MFHygRG/CxdjgFgZr8wSyy1CI829oIdGvD3fg+Nxb0Wlfyi9S2S/0yXAespDs2Amw63JC/TI0U0IxwY5G6VKFOzL9IVqcXIdIViZWqv0P4iRQyH71O82P/lbX9fqrEBb5sQHj0CFQjUInFibspXEvneLkNXImYsgdFMj6b5lJyQhBzWwN+C8IUTNfrDADJxhKGcHh78FqWzsmtYcgfA8PiexCYqY+aMuLLmwaDcRwrGvunMlxi9DVjAGyjOoVCYzrZy5p2zfZOr8Gc9Gzq3XYPp3MzBukAamBwk+Mt4ie/Be4znptKc75OnzXc4rSihSPk6lGLnZ2WOYFd2ReigsFuwS7FANfSVcTi3jAcOcJQzFUXGse85BQpMBCHynjziOxvuYSqB95TR1uylG2a8AWtHcm3IgX4ui1nCdPLIakkzmJ4VSUPbgdN3L2UQtesKjyxil6roxdS7rJDMmj75qo9bEkb5uHlmJnvgIp4N37z5/+RZkuZChHMgq1oH5gpvxGpfA0uk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(23010399003)(38070700021)(11063799006)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ebEpedceUdDUhLWFq9P3SEEFpIC8eEyX2+2BYGb1XxCr6ie0HCImxkeEK3?=
 =?iso-8859-1?Q?4GuYhXij8uHPvckcrxPOaHbdu9AzqCtKcBUFxEFdK963q5b2pnfGRCwp/S?=
 =?iso-8859-1?Q?vI6SrXqk1JBC5kn3LT2W5D+28Fbt00lkzRELEUgEEsISKya0tM9Mt2+Zgs?=
 =?iso-8859-1?Q?Cei7GygoQ59qMVDLp9q+oCZlAPDEIJXzKsCZUZ8xLSP4702JcSLo2uZmWH?=
 =?iso-8859-1?Q?UBSqyX3KEkWW+zTX5tIotBqD4YCO/HKs/U/Zx/ykdvPBiKZzFjdBvmHol/?=
 =?iso-8859-1?Q?4UJJJ//hQTVP5aWTN+Mew/8MWE9HKAaY4cmmGnm1Z89oK6EFdCU+RmsYfi?=
 =?iso-8859-1?Q?wr5zcbIGnqiYK9uzBQwWm1gB+Wy1V0QGGAmCcm6qZiN4AocKFLZB25ohhj?=
 =?iso-8859-1?Q?dzBwOpxHo5NjUyKa84sFcKGsLawA9QSJvPybgU5mgsgbPchKpe0YEMZwf4?=
 =?iso-8859-1?Q?4L785IdrvgPvUfcFcwjjk52LXdOuIdqCpnFHODCYiBF7gOP4V14V2U+KvK?=
 =?iso-8859-1?Q?J/WYRaabTTMVnCal4+K9bwFzlJ4mcUGdltMKm4hrpWbfgPUS5tAnovQKUr?=
 =?iso-8859-1?Q?8bRblX1izWPYxuXvipzpXcg4NQOwGc+DvXqJqHATWy0KTj+9YN04DvWRKD?=
 =?iso-8859-1?Q?guVob9FrRe7vE8Ky3yY61HrDS0N3pRTf9/m5YfhCpWOzTZ8R00ogj2RSKH?=
 =?iso-8859-1?Q?ZM/iG2N/m5YM7q5Tomqifqz70kGhL2w/IiqGYYNYp97lFIiGmSAKGkB5xh?=
 =?iso-8859-1?Q?K1WvZJZ/YEAMd0VZxVM1/+L29EGIzql2GW6SnX8bnbUX4CHEDUDnkk1gLi?=
 =?iso-8859-1?Q?TTsuh8Qz3QzximgxldgTzIBLTtt5FZQZ4aB7i6gpuWtsF2VR18yxz9EZZt?=
 =?iso-8859-1?Q?hGwzM9k+J1U1zJkjYw+jQuKPC43WKwCLmHxVH2NjYWZGRfXk5vvzXjhd23?=
 =?iso-8859-1?Q?UVPjTzivgQn1DpdeGTh2EUl7HsCfGkBX9K/FoTpod3SE647NVTAxHR45OD?=
 =?iso-8859-1?Q?C14UgUP67V62a6UFkd/e/cNJOJwxIgiPuzoRcLOWo9w9YIb5vusSKs2U8R?=
 =?iso-8859-1?Q?Nif3SBHukTRDBeLT1h+sTH6Wy0FGrdNTBKwWCNtmFEXbQNYt2Bi+eFNHis?=
 =?iso-8859-1?Q?V0h3dymtx+s1O5aG1mjgxZ43Bd+rU5zQi0xK8WOVq1GHZcL8RIL4wIt2+d?=
 =?iso-8859-1?Q?NV2+0o0fhp0AQGulk+Yly6i4sD5x19Sj/sgF7QrQ1HCaJM6nlWHca2fMM8?=
 =?iso-8859-1?Q?gjljOKgwdCA58+VATA3K4Lz2aAY+M/rvH6CaxbQBI9U/Yeuz85PaDU61kX?=
 =?iso-8859-1?Q?iMD5vulIkUsH16wAoKNZjjMItdNO3bnO4ByB9twWncQd3EUyNyFbjnsHtq?=
 =?iso-8859-1?Q?CvEDrgRyi2SWHIBk+xyhWw8ltfKNOG7UxC3f+G9F8MbNgF5f/GXCn4kVtO?=
 =?iso-8859-1?Q?9QKJPj7PnmlsEzl9dBTvUle5Hjim27iMLfyQeDuYNvrpTnFbh5mEDLoJia?=
 =?iso-8859-1?Q?Tt0FeZ3N+70mQMIFLAJabv72nV9vJFzse1/aDy5tYjT5/iEOL2oQWNk8wY?=
 =?iso-8859-1?Q?vuh+iXeDBYbdXwqijwsVHP+8bD6uV+StUXA8+xgHk28qwpd9NA23Nh2Jgf?=
 =?iso-8859-1?Q?NqG9rfzjDdFpEOQe7iO40Qf8HCJkh4izKvb5LN5LNXJcpli8027pJYcnj6?=
 =?iso-8859-1?Q?D1FSE9gpA0olfpXayjp/JM9lMx3Erxpy63qoGSNQOkkUh0/X5vlQddQO4N?=
 =?iso-8859-1?Q?uBvkkRFREShW++TlVe9rrK/1SIogk0DyM9M1Nx7QHel0YY+tW480uYYqgt?=
 =?iso-8859-1?Q?BSPIieVaWRj8+MCf3oFzHx/rQTyZIoc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f498ff-013c-4649-5145-08df28d5f1cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 02:59:05.9193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZDOwEcPMkDRfVmJwkgjscn+c95rNwPsvebobGTLCcEYVv9huKuWkdokBSqyuL+T+Mh7dQUwX19BwOoz75JDu3CyKiawiKcPtpe5k8AU2Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11092
X-purgate-ID: tlsNG-720697/1791860351-674BE2AC-E95EB5A7/0/0
X-purgate-type: clean
X-purgate-size: 6057

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
> Keep first-match semantics explicit. Use BUG_ON() if a non-sentinel
> entry has no matcher or the IIDR matcher receives no data. A broken
> entry must stop Xen in both debug and release builds, as skipping a
> required workaround could cause a failure later. Place the matcher data
> and table in init-only read-only sections.
>
> The matched entry still supplies separate ITS and LPI flags; this patch
> only changes how the entry is selected.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>


> ---
> Changes in v4:
> - Use BUG_ON() for missing IIDR match data or a missing match callback.
> - Keep the existing quirks variable name in gicv3_its_find_quirk().
>
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
>  xen/arch/arm/gic-v3-its.c | 64 +++++++++++++++++++++++++++++++--------
>  1 file changed, 52 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 280ace0577..43804a6c7a 100644
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
> @@ -65,11 +65,49 @@ struct its_quirk {
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
> +    BUG_ON(!data);
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
> @@ -78,17 +116,20 @@ static const struct its_quirk its_quirks[] =3D {
>      }
>  };
> =20
> -static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr=
)
> +static const struct its_quirk *__init gicv3_its_find_quirk(
> +    const struct host_its *hw_its)
>  {
>      const struct its_quirk *quirks =3D its_quirks;
> =20
>      /*
> -     * The first matching quirk wins. More specific quirks must be liste=
d
> -     * before broader IIDR-only entries.
> +     * The first matching quirk wins. Entries that match a specific plat=
form
> +     * must be listed before broader IIDR-only entries.
>       */
>      for ( ; quirks->desc; quirks++ )
>      {
> -        if ( quirks->iidr =3D=3D (quirks->mask & iidr) )
> +        BUG_ON(!quirks->match);
> +
> +        if ( quirks->match(hw_its, quirks->data) )
>              return quirks;
>      }
> =20
> @@ -97,8 +138,7 @@ static const struct its_quirk *__init gicv3_its_find_q=
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

