Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BEC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 13:26:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382155.1625526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrF9o-0005lo-M0; Tue, 04 Aug 2026 13:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382155.1625526; Tue, 04 Aug 2026 13:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrF9o-0005lg-IU; Tue, 04 Aug 2026 13:26:12 +0000
Received: by outflank-mailman (input) for mailman id 1382155;
 Tue, 04 Aug 2026 13:26:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wrF9n-0005lZ-GX
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 13:26:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrF9j-00EwWZ-LD
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:26:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a71e865-bab6-0a2a0a5309dd-0a2a45049eec-22
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 15:26:07 +0200
Received: from [52.101.193.39]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a71e869-b57f-0a2a45040019-3465c1270510-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 15:26:04 +0200
Received: from LV4PR03MB8234.namprd03.prod.outlook.com (2603:10b6:408:2e3::8)
 by CH4PR03MB7650.namprd03.prod.outlook.com (2603:10b6:610:235::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:25:59 +0000
Received: from LV4PR03MB8234.namprd03.prod.outlook.com
 ([fe80::264a:2e82:2064:7fab]) by LV4PR03MB8234.namprd03.prod.outlook.com
 ([fe80::264a:2e82:2064:7fab%4]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 13:25:59 +0000
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
 b=qQce9i+beoT6Sz0IVgC6nTOtXRH08LaAU6TN99Zp6jSivd5TcGZuw1aCNQ3ZMJ192e4XemDu74Wp6lk4olG6oWacohmcu6VtnqM7tOpxCJ80ElC1XsBhDCaAinyB6LnwFGVQWrSXhKz1rvbQlCQ7z1bxd/YZhXUwXdxE7EY9PQjI4CjJHPeL+nkFhFObp4c70XN4wMM7qssl1uxa+KGrbDyjSYQXTso99D5c3bTP0KHlGS57HY8PjlvvwxyEjmksUrWiYXC/zwAeAujGIaALaf3+3ynlEm/SrSAW+Odpqb8jJCG3+9or99waMX6aItkZBsi+afcD6T3vf2aJYmmkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiW6mLdAAoCz8vBWUjYfWULIRb0u3XW6lB+9qHUuNCQ=;
 b=lEbH41CRA+BuhA+EtS0EWIDpngY8wWksYmrfQxy2D6ZSULGwSYSypcS4t2qvj9WRsj2T4jh5pmsKViTc6L9FC1NEy1ANuM2QxL6Et9+sCTiCJhGFbx28khx1L4ScNO68ISi2B4YmfKIFT6qXKr3VmBx6Zm9Z8BOYEW9LjDqheEF0rjjsuUaaMXy21nqwvIUts+U3BnuXUpJvRaswI87xu5O8B3iWWH1M88KjqOP5d9BQlhhEoN0/HSif5NVujinlWntSoL9DUAR6geyYwzQNHs/8xlyY5lNBOV9KFhcVCEbxGKB5ri3mWvRSfBNoGex9QYkOZbWJAVcsNFq9hPLAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiW6mLdAAoCz8vBWUjYfWULIRb0u3XW6lB+9qHUuNCQ=;
 b=eq4TI9tggU+2MqOlJgRn6vK/6U5s8Y8AJaRp5sOomWJLwuNn1Q7az+7KxT78cJ0EcvLHvy8vLsjJHDOwbJDREqVRfAyc061p01daPboeG6zbRe/p1zslY2PRA/kUg9eXKeECWotTF4pwjXF7z1G9di/wpbOEkLsRxVQkBvNbQiI=
From: Marcus Granado <marcus.granado@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper@citrix.com>, Roger Pau
 Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
Thread-Topic: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
Thread-Index:
 AQHdGF9mhIhyvqGSRUyPVZ4Z3HHB7rZ3oucAgAJQsgCAAB5PgIAKMo6AgAhhrfGAAQyTAIAAA40AgAA+3Ks=
Date: Tue, 4 Aug 2026 13:25:59 +0000
Message-ID:
 <LV4PR03MB823492BF26528F6FAC11CC3AEDD42@LV4PR03MB8234.namprd03.prod.outlook.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com>
 <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
 <CAHt6W4erBfB+H_0d+2rQ0apz9Jt6ex+WVjEjyPm6EApoHVJgmg@mail.gmail.com>
 <1784755834.8631fc262581453bbf619ec5b2062170.19f8bbccffd000edb5@vates.tech>
 <CAHt6W4cWLfSVoCSgr-YsQb1Mv=VZek0CakTBwK7tx_n9RkeiUg@mail.gmail.com>
 <LV4PR03MB8234F0C54B63FABE4D749FBBEDD52@LV4PR03MB8234.namprd03.prod.outlook.com>
 <1785834903.8631fc262581453bbf619ec5b2062170.19fcc0e18f8000e099@vates.tech>
 <CAHt6W4dHih5z1LpRpdRiU_CC0dCQTF=324=KM6QJbUHS1xQ1GQ@mail.gmail.com>
In-Reply-To:
 <CAHt6W4dHih5z1LpRpdRiU_CC0dCQTF=324=KM6QJbUHS1xQ1GQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV4PR03MB8234:EE_|CH4PR03MB7650:EE_
x-ms-office365-filtering-correlation-id: 14ed79d3-2558-43c8-7ca9-08def22bec68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|366016|376014|1800799024|38070700021|56012099006|6133799003|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 9cMZ06eFEkIr4hMVI+ljPo08HkzJ0tUkZK4Ake+Zwb7GA7pcDF/fBk1Srj6P7Sq6KP4LqnJVtuoOAd5y9yTgutE4y2uuDRM0Z1hrVp/cjOB6GIDIW2ENqAhT8+7zykPj0mcUn8ybVKPXI4g2FRPTIzwYMpVRvn6nrssd2I2oxuGdXcU2c7n194ZH6utRXUvDt40HpeAlbhMaQ1ATrffpJsyMrezmjW37HQyDoPaDqx5Gsdvu3z90wL004FZ+67moAUrhi3PSlevtClUdyg68kYSyHN0gOqRTuLdQb9vOEBIYEUndAGo+tJm1dqO5vy0EWUGTvyzlMXLKq815EH5NHHjZW/bJbKT1v5PUtzMuTEozYeXelzBg0f86/q1jFzRNSGQLS4Rnfiofm3c+Jj0oKTBk1lMGmNIgCUcz0J5iQMHtsw6JJ0PLxlBks35bnHAj+rL8oAqD5CxZgDaSYoYBlINcgt9fQbFzIxDfRJJ4scfBVJr9rWnDZgU6d1FNJqaZlW+KiGd77dgFErImKMHShTnVJJUQDfR+O7XlLOAzniU+GI5JbzQttXo+XaSjEV6yCVtiCW9m95+oEOAEthFGnYHX8HOninNBi1muGAS94YWuygrS9atUssa5tXaasqh936XGmTI+iorDORCb60s+1voOz1c9NtUzxw/KAD5GSFrsOijzkw6Iax/zwxU7H4+6v8WIeNqdleea0q6Qq0Ow0K+SuBUoLifV5Pvun5Weyuc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV4PR03MB8234.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rFqBhGpF3XwwZDp4wqSseYm0EKVdGrmgXONwwYb3EK4YGGE/uR64qoDJfl?=
 =?iso-8859-1?Q?4SaceeTVBGKrcrfbdPP5fi2yrKZiaSmkAd0wVWnscCMHym6nyhEiP4neME?=
 =?iso-8859-1?Q?v5t3SXQVPLMqJE+aF361I6xhfqZYk26z9RoTCoIqCIvq/YwYOg0yeBRe/P?=
 =?iso-8859-1?Q?4SOKET1cYkZDnGpMqqpCCWj2bG59L44EB+WCOWKysbHuVrZl33C1P3FhHT?=
 =?iso-8859-1?Q?OJLBUxqHyjafVFgBxOu+whBR3jM+p0cwMIfpMOs1oIn+Tlhb1Gb0LSc5T6?=
 =?iso-8859-1?Q?l5Wcg4Bx0drSZl4p5U+YFjmhu3exBJaM5MlTmQhgUgzhNqD2296Q75QU88?=
 =?iso-8859-1?Q?TD9uetCuDscqQksFPF4certwjS/UAfdfxlbHVA7KG4BkBpc+3QXP4NyrKu?=
 =?iso-8859-1?Q?fvMxxgjvHGVlYjgen/XhEDzZo91kwPkHogyw0CHOCo876gU92Q27GCzGpI?=
 =?iso-8859-1?Q?2HHqDcsnKtPmH/FMdgmPYjbhpq2u3CcM4gFTCwBtoEijTmxQDAcYKjv1ww?=
 =?iso-8859-1?Q?wtHv33ZrzzuKJ5JoglNNe/NxMkB+utFTcvz5Z61b0/HyFehH/GYy6mdIQB?=
 =?iso-8859-1?Q?zm8xLQ5ubYhuqo93qR53bnaxl7282DppHA6NpKVqGK8eCEfNntkOBicyLY?=
 =?iso-8859-1?Q?Oi0owwZNv0bRUsU9i8Np+VkXU4F1eG73MiQn3FqXyogt5C8atc9L1upTVJ?=
 =?iso-8859-1?Q?bGGJeBqsgu9OYWImTEaKU8Jlk+Im6IDj5ywqLEcVDm+QqXhSBTNmmU3TwF?=
 =?iso-8859-1?Q?RUM+md6Yg09/v2//goa4IjKXkh+IMMgMVtoCrtQB1z103rKUSDZyv3Vi5M?=
 =?iso-8859-1?Q?21z4zqMgVlj5NVylt6crFmY+j5MLGOzjZz5eI6xa8B3NZnO7EgbZvgjYxt?=
 =?iso-8859-1?Q?ISoRI3mO66x6IvY5zEIA2lnL4u4gRdMa0Vk7xnjx2X1SeMYHnO2nv25oI/?=
 =?iso-8859-1?Q?tiwD4oMb9Wgbgf9oxgd6W9nZ3sA8HRo7Bi8aAjkYQ92V+lyWKUeMyFOKXf?=
 =?iso-8859-1?Q?bWPZd6aSfaDHSvi4qLW+VuqIIlbbqOvosIJqKf4fkCNFHSm2XINb0+n8pm?=
 =?iso-8859-1?Q?o8N5W+2BL/pBUegKhvRYmearsUzjrDeg61LoFRLNaRlMC9yaxYjxhN+lQi?=
 =?iso-8859-1?Q?psSqLmwQYOWAvh29DC6uxKJTHcWQrzdG/xMj9pM+slQTwWFLHQvz8it3Mv?=
 =?iso-8859-1?Q?9ZMeosQLF7GOSvA8QHEGzbab3cdqrH2ZZYO0Dehi9/3rRINu+qNy261nxr?=
 =?iso-8859-1?Q?oLve5gKY5nFNwQ6N8Rzg3A7SkZECly9EI4R9rezvnuaMIxscXhK7hnm2BI?=
 =?iso-8859-1?Q?pdmW4Aht5241TSozsvf8o/aSBsSvxE+IPOXbRzizhaYX2PDtyWfVgeBXVd?=
 =?iso-8859-1?Q?JS/dDs+OmxFQ4w3ptlaLrjiNZ2vPojYQrNlkDenGsrfW1VRSvULJvwnbkJ?=
 =?iso-8859-1?Q?2sKA+O3EkTcoR0PLlcJ2NdBJFtpfOQwAHGzwWvnUVsVrgF7kunAlmM2Rit?=
 =?iso-8859-1?Q?SIuloSFe3RaWbwOo09eW7yO0Sy38E10Z9EJ+SB8gtxEL2Wk2Uf1AKadxbm?=
 =?iso-8859-1?Q?X44NT2RL7CqgcV9QuU2r5p+yavW2ZUMVmhdt51NWGdURalxefJG+M7r7yA?=
 =?iso-8859-1?Q?ejN0ykZe1+SgrlHQ4bmfcn1oWG8cEREOLlHLNMsZYgty/tPc1k62I3TH36?=
 =?iso-8859-1?Q?ShEtQ3dYxFBxLLqI4MzFtu0rdQwZ/FaUXDjLukMNSLHv+TwiUW1IF9zUK/?=
 =?iso-8859-1?Q?y9K9Q/AOCyY1ENDH70xLUZWgt/fANbDKjwdjOfPKkOI7BeQifqUJ9LCMLh?=
 =?iso-8859-1?Q?I8PFF+2FTzOIegPpbjSssyPbms939mjIDF9Vxd0EmKbnzjz5knt+eoaNnv?=
 =?iso-8859-1?Q?Zb?=
x-ms-exchange-antispam-messagedata-1: MdL7AZZ066Q20g==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV4PR03MB8234.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ed79d3-2558-43c8-7ca9-08def22bec68
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 13:25:59.6436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggaNSiIXgARp+KVX8hqCBhDHuB6FKUsYRxTrVaaFPv9DeNUqG67+0qErW9EdCJzM92mWya6Lt5JTQY/Wim4e86QJlh8bfSqGTr832a9rdMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7650
X-purgate-ID: tlsNG-ebf023/1785849964-51ED6B50-92D0355F/0/0
X-purgate-type: clean
X-purgate-size: 6230

On Tue, 4 Aug 2026 at 10:27, Frediano Ziglio <freddy77@gmail.com> wrote:=0A=
> On Tue, 4 Aug 2026 at 10:15, Teddy Astie <teddy.astie@vates.tech> wrote:=
=0A=
>>=0A=
>> Le 03/08/2026 =E0 19:23, Marcus Granado a =E9crit :=0A=
>>> simplify to reusing PAGE_DATA and spending one octet of its reserved wo=
rd=0A=
>>> as follows:=0A=
>>>=0A=
>>>=0A=
>>>       0     1     2     3     4     5     6     7 octet=0A=
>>>      +-----------------------+-----+-------------------+=0A=
>>>      | count (C)             | comp| (reserved)        |=0A=
>>>      +-----------------------+-----+-------------------+=0A=
>>>      | pfn[0]                                          |=0A=
>>>      +-------------------------------------------------+=0A=
>>>      ...=0A=
>>>      +-------------------------------------------------+=0A=
>>>      | pfn[C-1]                                        |=0A=
>>>      +-------------------------------------------------+=0A=
>>>      | page_data[0..N-1] if comp =3D=3D 0                  |=0A=
>>>      | or page_cdata     if comp !=3D 0                  |=0A=
>>>      +-------------------------------------------------+=0A=
>>>=0A=
>>> with two new entries in the field table:=0A=
>>>=0A=
>>> comp        Compression algorithm applied to the page contents. 0=0A=
>>>              means none, and the record is exactly as it is today. 1=0A=
>>>              means LZ4 block format. Other values are reserved for=0A=
>>>              other future formats like ZSTD etc. A comp !=3D 0 can only=
=0A=
>>>              be emitted if 0 < len(page_cdata) < N * page_size. An=0A=
>>>              unknown comp must cause the receiver to fail with a=0A=
>>>              "Compression algorithm <value> not handled" error.=0A=
>>>=0A=
>>> page_cdata  Present instead of page_data when comp is non-zero. A=0A=
>>>              single compressed object holding the concatenation of the=
=0A=
>>>              N page_data entries. The receiver must verify that=0A=
>>>              0 < count <=3D MAX_BATCH_SIZE.=0A=
>>>=0A=
>>>=0A=
>>> Teddy, I hope this format covers your points: it's no longer LZ4 specif=
ic,=0A=
>>> the inline clen inconsistency in libxenguest record disappears, it's on=
e=0A=
>>> block over an immutable copy of the batch instead of one per page, the=
=0A=
>>> decompressed size is known up front, and the allocation derived from co=
unt=0A=
>>> is bounded on the receiver.=0A=
>>>=0A=
>>=0A=
>> Looks good to me.=0A=
>>=0A=
>>> On Wed, 22 Jul 2026 at 20:42, Frediano Ziglio <freddy77@gmail.com> wrot=
e:=0A=
>>>> Don't we need to bump the version number while we add a new mandatory=
=0A=
>>>> record?=0A=
>>>=0A=
>>> I believe we may avoid having to do a version bump if we adopt the prop=
erty=0A=
>>> that 0 < len(page_cdata) < N * page_size when comp !=3D 0, as in this c=
ase=0A=
>>> the compressed data sent to an old receiver would fail in handle_page_d=
ata()=0A=
>>> with "PAGE_DATA record wrong size". Bumping the version would make=0A=
>>> uncompressed migrations fail if they are sent to old receivers that als=
o=0A=
>>> understand uncompressed migration, so avoiding if possible would be goo=
d.=0A=
>>> The spec says migration tools "shall always save images using version V=
",=0A=
>>> so it doesn't seem like we could bump the version only when compression=
 is=0A=
>>> on.=0A=
=0A=
=0A=
Thanks. I will take the discussion so far as the record format above being=
=0A=
agreed, so the only open point is how it is carried.=0A=
=0A=
>> The specification says=0A=
>>=0A=
>>  > Padding and reserved fields are set to zero on save and must be=0A=
>> ignored during restore.=0A=
>>=0A=
>> Which is not really going to help if we add a new field that matters on=
=0A=
>> how the content is organized.=0A=
=0A=
Agreed that the sentence as it stands does not cover it, but I think that=
=0A=
is a documentation problem rather than a format problem: once the octet is=
=0A=
given a meaning by the specification it is no longer a reserved field, so=
=0A=
the rule stops applying to it. The v2 spec patch would define comp in the=
=0A=
PAGE_DATA field table alongside count and pfn, and leave the remaining=0A=
three octets reserved and required to be zero.=0A=
=0A=
To make the compatibility argument rest on the specification rather than on=
=0A=
one implementation, I would also add these rules to it in the same patch:=
=0A=
=0A=
* a saver may only emit comp !=3D 0 when 0 < len(page_cdata) < N * page_siz=
e=0A=
* a restoring side must reject a PAGE_DATA record whose length is not=0A=
  exactly sizeof(hdr) + C * 8 + N * page_size when comp =3D=3D 0=0A=
* a restoring side must reject a record with count > MAX_BATCH_SIZE, and=0A=
  must fail on a comp value it does not implement=0A=
=0A=
The second is what handle_page_data() already does today, so writing it=0A=
down in the specification is easy and turns the PAGE_DATA argument below=0A=
into a guarantee rather than an observation about the current code.=0A=
=0A=
> Yes, there's no check for "_res1" being 0, however there's this check:=0A=
>    if ( rec->length !=3D (sizeof(*pages) +  ...=0A=
> so, as long as we require that the compressed data is less than the=0A=
> uncompressed one (we should) it's fine.=0A=
=0A=
> Not strong but if I could vote I would just use part of "_res1" as=0A=
> proposed.=0A=
=0A=
I would vote the same way. To be explicit about it: an old receiver=0A=
will reject a compressed record through the length check rather than=0A=
through the mandatory record rule, so the diagnostic is "PAGE_DATA record=
=0A=
wrong size" rather than one naming the unsupported compression. I think=0A=
that is an acceptable price for not adding a record type, given the strict=
=0A=
inequality above makes the rejection guaranteed rather than incidental.=0A=
=0A=
Andrew, Roger, the one open point is whether to carry this in a PAGE_DATA=
=0A=
reserved octet or in a separate PAGE_DATA_COMPRESSED mandatory record.=0A=
Unless a maintainer prefers the latter, I will implement v2 with the comp=
=0A=
octet in PAGE_DATA and the three rules above.=0A=
=0A=
Marcus=0A=
=0A=

