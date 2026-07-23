Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C95FC531CA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 13:14:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369135.1618030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtFZ-0007UT-GX; Thu, 23 Jul 2026 13:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369135.1618030; Thu, 23 Jul 2026 13:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtFZ-0007UM-DH; Thu, 23 Jul 2026 13:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1369135;
 Thu, 23 Jul 2026 13:14:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wmtFY-0007UG-DX
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 13:14:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmtFX-00FrMo-OH
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:14:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a621394-e002-0a2a0a5209dd-0a2a4501d526-44
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:14:07 +0200
Received: from [52.101.85.31]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a62139c-5984-0a2a45010019-3465551f32f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:14:06 +0200
Received: from LV4PR03MB8234.namprd03.prod.outlook.com (2603:10b6:408:2e3::8)
 by LV3PR03MB7561.namprd03.prod.outlook.com (2603:10b6:408:288::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 13:14:01 +0000
Received: from LV4PR03MB8234.namprd03.prod.outlook.com
 ([fe80::264a:2e82:2064:7fab]) by LV4PR03MB8234.namprd03.prod.outlook.com
 ([fe80::264a:2e82:2064:7fab%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 13:14:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUR+UlFmFrf7XWsZ5RH5btzrukM2mGUrxMPZzE768tncS3t4GJT+kK8iZNho9fKAgMDQsziwv4X//CmLo1SShdmxcd0ETE4o+4mtxSkaHn7uMcpZsFcFRUhe6sqsQIJ4vaeVMZqQ++CMIM7UXKx9FZx/CJWQrx/EXsleaU2evIO7/LhqSUAMQvw5AMTWe/AaXL3oCyfOu45Dy6nqRVRFJa9z0DhScr8LOLLl2zjdcC9nR7tbCTQwJ4uQrJMx3rxFTto3/Xfvt++0dwXRNfe/BvqD4qrRsWksgTuH+J0c7LLGLYbsPQjpzvcireaPy6kMcstL20wW3w3mknmusn8gpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nolBbTm22vHTne5a275fXU1vUqEx0wtdFj8Wk3AQHVE=;
 b=N4Xmz7OvXpRC6QL4BPmALJce5qCkhy4gioIzHAyBF2+qE+NT+PWj3/XQr3Ijfh7/DeYvZmJIrdO0bDx/8Dtxqy8YXk4jESx5gnKTR1XJcIbaMdAPNjeEwZ+63NQCGJHsWnPxshkyam7WjqWM1UZ7WZ3jOdxtAkxdcV21ncDVvuErFbcyEcHYtqV0kLP2FrNiOPJoRMvEhvdSTQFdR12sjzPEaEPabk6EJ/IpOdN+FnCPyXAQfyshNeK0mo/SHv9I39hz1qSANws8nZOn3JrwPfkKBFLy9iAZJhH6fkjcAEIi71DwKAL1fnd+l7v4x2YGlHEkiq7DuMx3GyFmcoAvhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nolBbTm22vHTne5a275fXU1vUqEx0wtdFj8Wk3AQHVE=;
 b=xy3aj2BmzMrKDgbLTM5UE/sZE1VTB6/zyz5tzPcTr7Z9WgitZXw+7iiudqnF7jqjIYx5nvkuQO16ZVaA8F8maGjN6Lp/ye8bSmzIFtowVs7aMdnzL/6a6i5HOIZ/wGMgh0XiJMop9yFSWMIm8vaDfYvgFN3u9gl9XwmRB+c7VRE=
From: Marcus Granado <marcus.granado@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Frediano Ziglio <freddy77@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
Thread-Topic: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
Thread-Index: AQHdGF9mhIhyvqGSRUyPVZ4Z3HHB7rZ3oucAgANsT7g=
Date: Thu, 23 Jul 2026 13:14:01 +0000
Message-ID:
 <LV4PR03MB82348E706D3E9FB567387609EDC02@LV4PR03MB8234.namprd03.prod.outlook.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com>
 <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
In-Reply-To:
 <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV4PR03MB8234:EE_|LV3PR03MB7561:EE_
x-ms-office365-filtering-correlation-id: 6f47c408-774c-4356-83d1-08dee8bc4393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10070799003|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 342A3a2vDvql2cgaohFJmEMZ976XmYZvprMxSql4hCBLivtw9mCpBZ7wwUM6c8HS3PPGyjvsopdmxO97gGCq5X3UMeogbvYlHH0xtk6ooekY9PIGgTlhWWk7nC1uhOWnxPOuGLSwJ7dw68YV+qkbf63+FGudxE9Pp90xXC3P++OXkPNqCZz8xrFblF5Qg743EEX8KVxWOzLLDajwPoqhlUDBsNNlCBFQoO82+GRYqgJ66B8wh46O76vlAqs1O7t6VtGmiGWnFyeJGZK9yqyByBNbCIKINgkvwe63kitFsOn2DTCWX3DWGmUWW8OVc+jl5IQpbBSWZ59k24omB05+G/mRUWkuS12U8i04n43KkQlIN6+xYVtALGacObaGuOeN2/36P2WXqlpMg4R00NCsEKOEjOB4DMzUt6Onj82V4qqfZ3n9j44bnL8mkxSydg7hr5YcpT5FWNLO3GLyN4sOK9WhIndBpuqCcDIXouPDSZJAstyxtg0N2l7i7rlTxqhiqJpCuJMjnXUoq2jfm/wjmCQeagNgL9Gy7iZ+cvwEL8xG0sMn9Hgq2I7nI1DCiB4sk/FaQuBrMmGYbcTMlVfbM1Yc6jb+ZA5u1+V1oTMUiXD+7FCgKYG1NXX/3oMiXJbwn5YW9/kWmWj56cENw8PQhG53cZyXH7wToiwYf85SU1aHGuYCKUIVyyRNIYhlRFtGM7MgK0CXKyuIa/Ar2/C7hvWfsGFWyArfxCSXQv0kvwk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV4PR03MB8234.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10070799003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4xXMGWW8md4kBzC//qxUjfEdfBDSh8GUQhkIgykglkioPKPAV86fVSuQOY?=
 =?iso-8859-1?Q?Mo6jEtXHl9Uew35qaEBWPf0Zu0zWbdgEr7M+X6Y4EHHtxsl/BiQMl2clOY?=
 =?iso-8859-1?Q?TKVpeVQr1xIjUe8OzHLf3qHo7DrQ0DhPJ0lY85s6ugFpB75vxrRFUSMv7v?=
 =?iso-8859-1?Q?jPp5p6PmQUxs4CRFW5bsSRmCF2XJ8wEl2t+TvbphQTdhrHfMVhYt0Yhhsw?=
 =?iso-8859-1?Q?mfja3s3wsavJz/waeNyJ+SncUh2jDl37n3aJvgVjx0zX95usKQOh3w+Pkk?=
 =?iso-8859-1?Q?Rk0p27dzz/eO7KNaA1/TvpTTKtrOCvayfoQrFANE1U9UEU4Y0uLsOOQGRm?=
 =?iso-8859-1?Q?nFtICLcTQRd47Kr852RqkZl0IeXAdX8bouS++tB8YFIxSlVGwzqXEs3rIv?=
 =?iso-8859-1?Q?k5FNrnglxKAmPPieM4sElA34zdzp8NzpTULdeDN4b3gqD7hbAL/7e2T6Y5?=
 =?iso-8859-1?Q?QLyXJDIkwoA3g75mT3OWNL/uRVBK0skoiGKUqJrdf9jCsQ80486zJYn/kR?=
 =?iso-8859-1?Q?RtFiaUY/6cy2XUlB9LndxdtIrBdZm75vzcOAL1KK1jAlDKb1gCjZUiiBHY?=
 =?iso-8859-1?Q?QlaQ8JVcPIph/dXyRk1ynYdaZ79bVhtYGCzvj3BwymYF0CZ42FbBmLcpRI?=
 =?iso-8859-1?Q?StD2Lq8jCaGbzsb2nKmWrPDMQGdEkKXCbQcBSzN2yZt3kE9LNBBVx6wdEm?=
 =?iso-8859-1?Q?dS3lmfrcIh/POcMiCQ3ZJcGx3gKFL2k0WZfaLpnAZng3NIhSbuQOJLd9lt?=
 =?iso-8859-1?Q?ciZhqYJOsD9by0hIJeHS9zrHxrkV4lvMNuY4DZTxE8pgRAX0t10HK7iob+?=
 =?iso-8859-1?Q?ioKVfOtMz0Kp1bfZGCCj9gV3/KV40MEAqHxhrFxkfC8gDNZr1k20LSPIMw?=
 =?iso-8859-1?Q?2yRQHJFbVNb6gB/8Rw6CEqRliy2trfFF0yyZBjKGooOO58IEDRzN39k0tw?=
 =?iso-8859-1?Q?L4AXLTV6u6vyQRsW09D8/n1yQo5r514ehTNLrdPsv2rvNZDDmeU6oVQMr2?=
 =?iso-8859-1?Q?rWbmydDmYCSb+ODAGH+PYyF2pk81WnyT/lKsBfpjSHUUIx0Zdni5FeSCdu?=
 =?iso-8859-1?Q?PcmKIrzSSg+hwk0/w1DqEXOWhcI2rCXSaza2A8fPJHK34PKKRHHF9ylOnD?=
 =?iso-8859-1?Q?vlrVvF6ppVBMZqkX1jmP6FKGewJveOCLMlR7nym0FX6x/a/vVzcOc32Cag?=
 =?iso-8859-1?Q?RtQgT6bJx2xGxcc5taZuKY7qERKTZsjDPXKT0wbik3U+dsClJiYvt7OgYE?=
 =?iso-8859-1?Q?5UqXmFt9Q2f2TBBfBCaWvUk6kgDo5uX6sI5vnVmsl63yKYJTPsIZ0CzLV+?=
 =?iso-8859-1?Q?R6h3CoQamK4bKSGsDlNRY1dqux7E1xj8yMeF41Df4IAmpQlRBXTLIAeoOq?=
 =?iso-8859-1?Q?yjxa4haPGY6c4ljnuv8g4JfdlyMP3d9Z3bGSJ1VEj3DQPJq4qqJdzO0h+c?=
 =?iso-8859-1?Q?Jpmro/PCiy4cwavND2Ga4lRROp0Hxr43KDIPJHbYU2wGiOJeXXNWLCEksq?=
 =?iso-8859-1?Q?qkOJejvosAppSUmrqDtDb6PWOrdgQ4qUlCM1BVglliGsqLPFNrJUSJWnyZ?=
 =?iso-8859-1?Q?0opO6+S+e0YUuAU0zDSCKEj6n9APDjy0rlmJyZ52bplBeVsFc7f/ij2Z9D?=
 =?iso-8859-1?Q?SBAo5chUkW7HYEs0rEAJLhnSTwHwoBNe39zXhiKIlmkBMnlFZI8LWaY1lC?=
 =?iso-8859-1?Q?6xWviAv0TRJlrCa9mbtng+bqW5CWmvK+M8iP9PFaCM9bD0myP6uIusVxEW?=
 =?iso-8859-1?Q?eaLm0cgFIkqm5AN9D822ojeoCTfBfWKaoQw619Fc6h21q7diGOWDsF4460?=
 =?iso-8859-1?Q?lonFNLG8MNIsgra9xgib1Y39Hm5+31ORSDjePmlJTzuIQ/fIqV+IYxz2TW?=
 =?iso-8859-1?Q?yK?=
x-ms-exchange-antispam-messagedata-1: 6m99iM8Zp4+PEw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV4PR03MB8234.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f47c408-774c-4356-83d1-08dee8bc4393
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 13:14:01.8168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQoN3y8LnRx8BZJgPMEeNzyMAulGcfBKIzgKkJupZ4wggMSAmb+xQIONMgUaFRBjXdE8GRF9kkpyJFLdZPodThAiqnHFiDVDCSV5eNIA+Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7561
X-purgate-ID: tlsNG-d62444/1784812447-C4558757-119C7885/0/0
X-purgate-type: clean
X-purgate-size: 6333

On 21/07/2026 at 09:20, Teddy Astie wrote:=0A=
> Le 20/07/2026 =E0 17:51, Marcus Granado a =E9crit :=0A=
>> +PAGE_DATA_LZ4=0A=
>> +-------------=0A=
>> +=0A=
>> +A PAGE_DATA_LZ4 record carries exactly the same information as a=0A=
>> +PAGE_DATA record, but with the page contents LZ4-compressed.  The saver=
=0A=
>> +may emit it in place of a PAGE_DATA record when LZ4 compression has bee=
n=0A=
>> +requested.=0A=
>=0A=
> Would it be preferable to make this structure more generic, i.e=0A=
> PAGE_DATA_COMPRESSED, as I'm not sure it's wise to restrict to only LZ4=
=0A=
> (someone may want to add support for e.g zstd or another algorithm=0A=
> without having to change the format) ?=0A=
=0A=
It should be possible to create a more generic structure like=0A=
PAGE_DATA_COMPRESSED instead of PAGE_DATA_LZ4, which accepts different=0A=
compression algorithms in extra new fields. I suspect the challenge here is=
=0A=
how generic to make it: I wonder if it wouldn't be equivalent and simpler t=
o=0A=
instead add new record types (PAGE_DATA_ZSTD etc) in the future when=0A=
necessary, as a new algorithm needs new code on both ends anyway and reuses=
=0A=
the same per-page framing, so a generic record would not actually avoid a=
=0A=
code change. Perhaps we could adopt a PAGE_DATA_COMPRESSED_* family prefix=
=0A=
for the wire format doc, and rename the algorithm type PAGE_DATA_LZ4 ->=0A=
PAGE_DATA_COMPRESSED_LZ4, so that eg. in the future=0A=
PAGE_DATA_COMPRESSED_ZSTD etc reuses the same family document and is only a=
=0A=
new type id. This would be an interesting question for the maintainers of=
=0A=
libxenguest.=0A=
=0A=
>> +            Each sub-block is a `uint16` little-endian length `clen`=0A=
>> +            followed by either an LZ4 block or a raw page.  When=0A=
>> +            `clen > 0`, page_data_lz4 is `clen` octets of a raw LZ4=0A=
>> +            block [...] When `clen =3D=3D 0`, page_data_lz4 is=0A=
>> +            page_size octets of a raw, uncompressed page.=0A=
>=0A=
> The inline clen at the beginning of page_data_lz4 feels a bit odd to me,=
=0A=
> or at least, a bit inconsistent with how pfns are arranged. I think=0A=
> something like i.e=0A=
>=0A=
> 1. count and (reserved)=0A=
> 2. pfn[0] ... pfn[C-1]=0A=
> 3. clen[0] ... clen[N-1]=0A=
> 4. page_data_lz4[0] ... page_data_lz4[N-1]=0A=
>=0A=
> would be better.=0A=
=0A=
Using an array clen[0..N-1] before the page_data_lz4[0..N-1] is neat and as=
=0A=
you said follows the existing pfn[0..C-1] pattern, and I think it would be=
=0A=
good to adopt it in v2.=0A=
=0A=
> Though, aside that, I'm not sure having separate compressed block for=0A=
> each page is a good idea. Compression is more efficient when processing=
=0A=
> larger blocks, LZ4 documents a 64 KB deduplication window (of the past=0A=
> bytes) [1].=0A=
=0A=
LZ4 expects the source buffer to be immutable for the duration of the=0A=
compression call. However, during live migration the guest is still running=
=0A=
and updating its pages concurrently with the compression. This mutable=0A=
source buffer can cause compressed back-references to be inconsistent in th=
e=0A=
>4KB deduplication window (LZ4's match window reaches 64 KB, ie. up to 16=
=0A=
pages), resulting in corrupt decompressed pages on the destination.=0A=
Corrupted dirty pages would be resent and healed in the next iteration, but=
=0A=
corrupted clean (non-dirty) pages wouldn't. Indeed, I initially experienced=
=0A=
with compressing the whole 4MB batch and found the guests would crash on th=
e=0A=
destination due to corrupted page contents after decompression. Compressing=
=0A=
individual 4KB pages avoids this back-reference inconsistency issue across=
=0A=
pages. Any inconsistency caused by a concurrent write inside an=0A=
individually-compressed 4KB page is not a problem, as it's marked dirty=0A=
anyway and will be resend in the next iteration, so the problem is only=0A=
present when compressing together >1 page.=0A=
=0A=
I also tried staging: compress from a read-only copy of the whole 4 MB batc=
h=0A=
to avoid the concurrent guest writes. That is safe, but it adds a second,=
=0A=
slower full memory pass per batch, which I suspect is better to avoid to=0A=
minimise memory bottlenecks in this high-throughput memory transfer=0A=
operation. Measured on identical buffers, per-page in general costs <1% of=
=0A=
the batch on ordinary compressible pages and is no worse on incompressible=
=0A=
pages (it stores them raw rather than expanding them); per-batch wins when =
a=0A=
page is duplicated within LZ4's 64 KB window, which per-page cannot dedup,=
=0A=
and in the measured scenarios the aggregate effect on a real migration is=
=0A=
not visible within the run-to-run variations when comparing per-batch=0A=
compression vs per-page compression, so in v1 I adopted the per-4K-page=0A=
compression.=0A=
=0A=
> In my opinion, it may be preferable to have one large block with all the=
=0A=
> page datas (covering up to MAX_BATCH_SIZE=3D1024 pages) rather than havin=
g=0A=
> to uncompress individual blocks. Which in the end would remove the need=
=0A=
> to have individual clen[n].=0A=
>=0A=
> What do you think ?=0A=
=0A=
Regarding using one large block (B=3D1), this would resurface the issue of =
the=0A=
cross-page back references problem, as the guest keeps updating the pages=
=0A=
while we compress them. Per-page independent blocks (B=3DN) make it safe to=
=0A=
compress directly from the live mapping. Right now we have B=3DN (the=0A=
zero-copy non-staged compression in v1), and we could extend it to allow B=
=3D1=0A=
(the cross-page compression with staging) in the future, something like:=0A=
=0A=
1. count and (reserved)=0A=
2. pfn[0] ... pfn[C-1]=0A=
3. B=0A=
   if B=3D=3DN: zero-copy, non-staged per-page compression units=0A=
   if B=3D=3D1: staged per-batch compression unit=0A=
4. clen[0] ... clen[B-1]=0A=
5. cdata[0] ... cdata[B-1]=0A=
=0A=
If we wanted to allow a generic 1<=3DB<=3DN, for B arbitrary compression un=
its=0A=
for arbitrary blocks in each unit, then we'd probably need another array=0A=
plen[0..B-1] to map a compression unit to expected decompressed=0A=
cdata[0..B-1] size for the decompressor.=0A=
=0A=

