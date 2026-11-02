Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFCA606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=GiXdh78O
Received: from list by lists.xenproject.org with outflank-mailman.1468143.1677220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNqC5-0002HK-3x; Mon, 02 Nov 2026 11:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468143.1677220; Mon, 02 Nov 2026 11:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNqC4-0002HD-W5; Mon, 02 Nov 2026 11:27:16 +0000
Received: by outflank-mailman (input) for mailman id 1468143;
 Mon, 02 Nov 2026 11:27:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNqC3-0002H7-8N
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:27:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNqC2-00GXiw-Ev
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 12:27:14 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae8738e-e002-0a2a0a5209dd-0a2a4505ad2c-10
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:27:14 +0100
Received: from [40.107.162.135]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae87392-4cb1-0a2a45050019-286ba2878bab-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:27:14 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9680.eurprd03.prod.outlook.com (2603:10a6:102:315::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:27:10 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 11:27:10 +0000
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
 b=K2Dreo5FOwULhymmVvLjNZ2Y2oCwDrDRd00MImQOmDLoz1miUNPWZy38U1aWVTaTdyJsdu0mw4DYb2nt4MDd1Y/Jsyy9mFKx1Wy9uokOuiq/ctswtk8GPnp8IhoXFnx5Q0wnprtVeQHSWWUp5vJNlfgBCAQ8hwKXWTkiKU4E1AQZqi2Vhfr/Kru+EJTjmZ37Yg/hPV0KLh5zWUEQEnDS3hklOTZduCBirNoRcZSLL3tsTm8b/ZBVm8q3l28/oHgHoyZHhfskxVeCjYZLlO2icwGevGGfjqUpxBcEb7VfGfpbFVITLzMuMYg0h7f9R+ZfdiLsElAtdNeSwuIAxdx4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWEkDLfYHh1tUCRdaVzkbt628Bo72NXnTma0koZ+NTE=;
 b=jeYgjqJuieZZl2vQFXrwKZaIljtm3I7FdO/YV32ggg+mQ4wuG3uYy6DLYVzziw8Ouh6mH1QSKQKPuVn22SEjC1lD7q9nbNUh97jTqY1mWSqSWuWLxkwrlkwU/xohmWglnwGnapV0lMWjEkuFx+7TQY3Es3cjCdvznlVoKeyshurCQIqbuhfpL3QSbaRcsBS6bnwb/UdRspd/6ky86OfaaKnJB4edCSqIuzFfFhnbh1bdKcGdl5s83oeUo86ThX8z4OfEwTg2kTsAOUDLVIXOWOJ6P+lk6n7M66mGErxujza0Q+EO2mlps0NRa68U+dpCwI5rzZwVEzBHm+CqPAdhJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWEkDLfYHh1tUCRdaVzkbt628Bo72NXnTma0koZ+NTE=;
 b=GiXdh78O1GqjocNmzvx7SnqSJNci1ELucH+5KAHdPtDqlE6UUq/q3lpUCM9KZD32cyDLEaG1jU6y+76bdf86nHHC7pLNd6i78QBmLG/Qr8Homsf6B+BCrx2tjvSFJIilpSyNacG6L0pV//SauXJykU+XCfPmCtG0BklmP6tFmuWpkDzTkPqgzPvd9qBDKjoOX7rzNMlvkOuVJHKIoDrNaXrQFoDf5Ybb+8NhKlX4HUZPUPEyolCKy83w9ixevR9b5gBWyO14Y5kzGAeDYOrOqaapiO//WMyHuU/pbwClVqAXlDWnPuVkAYQ3AkuZ0SGsykRMAHlZW+wF/pCstVN8zg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: [PATCH v3] misra: deviate C library-style functions from Misra C:2012
 rule 11.8
Thread-Topic: [PATCH v3] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
Thread-Index: AQHdar0Zg3xbnpOjDEOIG1N7fPDHpw==
Date: Mon, 2 Nov 2026 11:27:10 +0000
Message-ID:
 <9f282c78786279ea38cd96e4e8fa080e5dba0b9e.1793616364.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9680:EE_
x-ms-office365-filtering-correlation-id: 2faa455b-3f3c-4bb4-8d00-08df38d43c10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|42112799006|38070700021|261021135927099003|261021123027099003|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 2gzK51fBQiXGy4ifu6mA/vGWNE995kezsfq9/rf1nOV1fCSiQ/cRXc8vqaJPDXrQ9XmQkCbWCXDgk5aSXlmvqzq9leUHiIv60YxeEhKn2QxJ+SGX0wmJXyZvkeSSUYxTkemvgMOL2lXXFLCmkhl/0aNQg7GtfUqQc6ysi1uZ/Y3p/PHJafFu4RMeeBnaH811tYLeLBvV0T2+WqdFXVEcQ68ePDPkw6b7vc/xjfbdvBw2VuNOHIQBQWSZl9TKdOwpupJ78356UOfbRpedjBLhgqdTReaTx6gp8Vvz9PryqfljeRvNFeIvXbtEDxs2q90V3qL4qIBfc3m8PcbT1frKsXY4kthdAikNceRl8fu0EEUqIb9lEIYKIro+Bp7vwIxdiGLjZDQZqbbj8DP6p7sde4c97e6HDFxlKwQ+tMlQGXrjCZseKMwBMaF85PI1BYi+6pB6qAuYeS6h5joLTblxIRXb8wsGAXAJ6TMEC6OnHKYNsgVE8U/bMox5LA/R4dA+iPsA93JWmB+wpv2NX3RlNvD1ckkaQgKilhHY8G8wETiTzidOAAg5kKK+ZSLx4zgkcYtvR6y3Cr8cTgvzOsrl0qT7GczMXa8yUXQJMbgj9CDiOGiIuT3cfMGvhfH8ak8NnUC3Flq2CLhvs8JT6JAWdoH9Gk8aWpmEvmrPPXOZN+kNCmYSlklFBF5WBBlBDu23+97MQd6tdOGEcMNYbYMElcpLvc21g+HgBzMOZReKvgE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(42112799006)(38070700021)(261021135927099003)(261021123027099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWVrcHpjalJRaTd4em8vb0ZuNHpJeXdlb1N0aWRkbE94MjZ1SFJzYnVWMVdp?=
 =?utf-8?B?eWVoOGtxaTVJblpvYnRoRXhObW1zaGhtMXFTWGl0dkptUnZReUVwVHh4MUo5?=
 =?utf-8?B?K29uSkpjbWFUTWJmZ09zQU9OOHhBVmYzYnlNZDdVUUtOVm5BYVFta3dYRi9W?=
 =?utf-8?B?c0k4NGpyRGhUdVJLMDQrRjA3WVRCbDJPbDg1TDd3djM0alN1a2llNEtjeEdn?=
 =?utf-8?B?d0hjWm5zcVhaWUNPWHV6eGJFbHI2c2Q1blZCdVN1Zy8xS1RlOVNoK1VBWkkx?=
 =?utf-8?B?ZU1mSldJQTJiTFpJWGZXZHpXU3ZGQ04wQTdYTDhweTVNZXh2eFlFU2E3aEl3?=
 =?utf-8?B?bHdaVjNISld2ejJWYk9HZTZOckVyQktyUVZWVTdsd1V5V3B2bk1veDFXd3Bh?=
 =?utf-8?B?NXJiTUxtK2d2VHpiNkE2aWkrcWhKcUFrc1JQZHJOcENjNTMrS3E0Y250NWZp?=
 =?utf-8?B?SVFHOTNHM3ZBT2s3MlRkMWc5TFMxMzZBd2tXNXZ1YjNHVkVTRDhhbUZ4elhJ?=
 =?utf-8?B?dUkvVjBIS1NHVVZraUZyeGhCbzR0ZG5vbnM4WSswa0QzN3BtUEFaRlgvamZF?=
 =?utf-8?B?ZGJsUHhkaEtFOFlITFVMSjlPTDRhSy9Wb0xnR1JLNUdVMk8zRGNYcXZDQTd2?=
 =?utf-8?B?MXZxWTNmV2gwbkNJZ1dwYStTT3lOeTgwUFc1d1NEWGlpdHJqRytLSjQvM2c3?=
 =?utf-8?B?NjBKc29YMzJyQVpWcWdPcnlYTVloa05JZTRYeHNiSXBBejEzWi9VdEdsWmcw?=
 =?utf-8?B?RVptdVovbkdxeWd3RWI5bkFmUTlMT1N4STA0elB0emJiT3IySUlhUEV5SmZ2?=
 =?utf-8?B?c093cFdFME9tdEw2eWhYRkhXSXRHNk1EWWNzSTNUM0xmdEVDVlJDMjZDV2xq?=
 =?utf-8?B?aEZVNnArRnNQWGRDWWxGUmpvOGgzM0JxSTdnSWJWUzlVcGxhS1lrWm1EbitD?=
 =?utf-8?B?cmVXTTdlenhqSE9lRGtoV3pvWHBxOENjNDB6Y0p5dktHTmRJQ09zK2lsL2Ez?=
 =?utf-8?B?dktURVdnYnNlWTRlS3RnWld5NU9aSFhJV2ExSHg3eVVjNnZaVjNTYzV4cnF6?=
 =?utf-8?B?L2JaV2ZwRmhhNzN1NEdmYnorUkx2UU5RTTlFZWxpVkI3U2hHaSs2bFltSXVz?=
 =?utf-8?B?ekllN3k5bDdDbHZaR0ZGeEprWkNmblprd2NWeXhjV2w5WUI0YzRtdk9ZWFhT?=
 =?utf-8?B?cy9oc1BWRTlTWlpMTkVFVldIVGZNdmQ3UlpTWGFoUW1NaFFoVnB6T1ROZlJh?=
 =?utf-8?B?M1M1TFF6clE3TjJ3ZWMwK1FSK2c5aDIzdFl1dDRLSThCYlFDUEM1bGdsdFBO?=
 =?utf-8?B?UHc0L0xDYjRubXoxL3lkS2ZGSzZrdUVTYVRhbEpYWjdTN2h0VVZuUVNqeWhp?=
 =?utf-8?B?QlFoZldHc2JLRVVaYlBYYXBvNlFkc3RsWU9BSGJjOEJyQUdzVHRjQkJXa0c4?=
 =?utf-8?B?NUFVYmwreVhQMHBvRUJxc3dEQjR0Tmgrc1N3UXNaWldlLzZKNXIvMnF6cGJv?=
 =?utf-8?B?YmtFVHNEVWdsWG9IMjBWS25IOXN6dk8vRlRwS0d1UTR2K3BlV2pZaEh5QjhY?=
 =?utf-8?B?aDkrUVc4d1I0c3A2RDc5TnhVRHpJdFZTL3FYTWtLZmJBMXJ6ejhUT3FKWjQy?=
 =?utf-8?B?djA1NjNsdjVlaW12bm1NcDAzRzVzaENhUVB3NlB5TGpmdS9VR1R0RlhyWkZG?=
 =?utf-8?B?c1VtaExPazVDZEZVNEowV3BzbGZ3ei9LTkVjTCs5RVFGQVQvQVhqTWhsNlRy?=
 =?utf-8?B?MklFLy92QWVnSDNxRUE4S0JRemNDV1RxZEZwUFRrR3pJKzZYMmlhZ21aMjBK?=
 =?utf-8?B?NGVrVDhMYlRwSVc5SnBtcXUwTHBoVHVZWHZqY3Nabk5HUXNKeXhONGdCSkVs?=
 =?utf-8?B?S1lSc3JzV0IySlB6MkNyM3NSVjFZaHFqOWtBMDlBUDQ0REsyMzZSMzkyREVX?=
 =?utf-8?B?dlhPVGZwaU1GWkQ2dSthdDBqWjVLc1p3cFFTYnU1bTJLYm95YnI3MU0vMVdn?=
 =?utf-8?B?YjQ3Um1QVHFjQldkYXRKVE41R3ZMTENKMXh6U0p0Z2I2WHdGUDgvWDdTNnVp?=
 =?utf-8?B?QThiYXlmd2o1bTN3dTFtK2FmOERNWCtTQVl0UlFhdGc5THRkSTFSOEIwQVBk?=
 =?utf-8?B?MnVlODIwZFFqM0lpcFhBekFWNWtjK051S3RVckJZUlV6bDQ5cWI1RW1VWmRY?=
 =?utf-8?B?SUE1dzNITHBPamdNdFVGWHVaZGlsU2tQQ2haSWZIODNwamo2SmdJOEpad0Rs?=
 =?utf-8?B?MTZsSDJWSFord2EwNW5vZVB3RTNRL1c4bTdDMzJmSHZzVDZFdStiNDhkMzIx?=
 =?utf-8?B?a0ZVMXppNlRPS055Z05LbnhDam5tcTVNQWtpVHZKSGlxYVVnV3J4Njk0WmJt?=
 =?utf-8?Q?FSLHmSMRDlddgsTM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faa455b-3f3c-4bb4-8d00-08df38d43c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 11:27:10.1585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RF+fVCbSo7Ys9Z5ToxRXfxIXr93aMCC5kwlL+JOfTnMuh1OMBzttkt1mGJEKX35P1cPnep1Arje47NUVjluyvrKAbnry7W6dpKOHuRPBc3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9680
X-purgate-ID: tlsNG-c201ff/1793618834-247132A1-66AFC90A/10/78276251493
X-purgate-type: spam
X-purgate-size: 6080
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

YnNlYXJjaCgpLCBtZW1jaHIoKSwgc3RyY2hyKCksIHN0cnBicmsoKSwgc3RycmNocigpIGFuZCBz
dHJzdHIoKSBhbGwNCmFjY2VwdCBhIGNvbnN0IHBvaW50ZXIvb2JqZWN0IGJ1dCByZXR1cm4gYSBu
b24tY29uc3QgcG9pbnRlciB0byB0aGUNCm1hdGNoZWQgZWxlbWVudCBvciBieXRlLCBtYXRjaGlu
ZyB0aGVpciBzdGFuZGFyZCBDIGxpYnJhcnkgaW50ZXJmYWNlcy4NClRoZSBjYXN0cyBpbiB0aGVz
ZSBpbXBsZW1lbnRhdGlvbnMgc3RyaXAgY29uc3Qgc28gdGhhdCBjYWxsZXJzIHNlYXJjaGluZw0K
YSBub24tY29uc3Qgb2JqZWN0IGdldCBiYWNrIGEgbXV0YWJsZSBwb2ludGVyLiBBdm9pZGluZyB0
aGUgY2FzdHMgd291bGQNCnJlcXVpcmUgZGV2aWF0aW5nIGZyb20gdGhlIHN0YW5kYXJkIEMgbGli
cmFyeSBwcm90b3R5cGVzIG9mIHRoZXNlDQpmdW5jdGlvbnMsIHNvIGRvY3VtZW50IHRoZXNlIHVz
ZXMgYXMgZGV2aWF0aW9ucyBpbnN0ZWFkLg0KDQpVcGRhdGUgZG9jcy9taXNyYS9ydWxlcy5yc3Qg
dG8gbm90ZSB0aGF0IHRoaXMgY2xhc3Mgb2YgZG91YmxlLXVzZQ0KbGlicmFyeSBmdW5jdGlvbnMg
aXMgZGV2aWF0ZWQgb24gYSBwZXItZnVuY3Rpb24gYmFzaXMuDQoNClNpZ25lZC1vZmYtYnk6IERt
eXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IE5pY29sYSBWZXRy
aW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gIyBhdXRvbWF0aW9uL2VjbGFpcl9hbmFs
eXNpcy8uKg0KLS0tDQpDaGFuZ2VzIGluIHYzOg0KLSByZXdvcmQgInB1YmxpYyBBUEkiIGluIHRo
ZSBjb21taXQgbWVzc2FnZSB0byByZWZlciB0byB0aGUgc3RhbmRhcmQgQw0KICBsaWJyYXJ5IHBy
b3RvdHlwZXMgaW5zdGVhZA0KLSBmb2xkIHN0cmNociBhbmQgc3RycmNociBpbnRvIHN0citjaHIg
aW4gdGhlIEVDTEFJUiBjb25maWcNCi0gYWRkIEFja2VkLWJ5IGFuZCBSZXZpZXdlZC1ieSB0YWdz
DQoNClRlc3QgQ0kgcGlwZWxpbmU6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVv
cGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzMwMTcyNjE2OTQNCi0tLQ0KIGF1dG9tYXRp
b24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCB8IDggKysrKysrKysNCiBk
b2NzL21pc3JhL2RldmlhdGlvbnMucnN0ICAgICAgICAgICAgICAgICAgICAgICAgfCA5ICsrKysr
KysrKw0KIGRvY3MvbWlzcmEvcnVsZXMucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDYgKysrKystDQogMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQoNCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2
aWF0aW9ucy5lY2wgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9u
cy5lY2wNCmluZGV4IGM3YTgwMGM2MmYuLjI5NjM0MGJiNGMgMTAwNjQ0DQotLS0gYS9hdXRvbWF0
aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCisrKyBiL2F1dG9tYXRp
b24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KQEAgLTQ1MSw2ICs0NTEs
MTQgQEAgd3JpdGUgb3Igbm90Ig0KIC1jb25maWc9TUMzQTIuUjExLjgscmVwb3J0cys9e3NhZmUs
ImFueV9hcmVhKGFueV9sb2MoZmlsZShodm1fZ3Vlc3Rjb3B5KSYmdGV4dCheLipfX2h2bV9jb3B5
LipIVk1DT1BZX3RvX2d1ZXN0IGRvZXNuJ3QgbW9kaWZ5LiokKSkpIn0NCiAtZG9jX2VuZA0KIA0K
Ky1kb2NfYmVnaW49IkZ1bmN0aW9ucyBic2VhcmNoKCksIG1lbWNocigpLCBzdHJjaHIoKSwgc3Ry
cGJyaygpLCBzdHJyY2hyKCkgYW5kDQorc3Ryc3RyKCkgYWNjZXB0IGEgY29uc3QgcG9pbnRlci9v
YmplY3QgYW5kIHJldHVybiBhIG5vbi1jb25zdCBwb2ludGVyIHRvIHRoZQ0KK21hdGNoZWQgZWxl
bWVudCBvciBieXRlLCBtYXRjaGluZyB0aGVpciBzdGFuZGFyZCBDIGxpYnJhcnkgaW50ZXJmYWNl
cy4gVGhlDQorY2FzdHMgaW4gdGhlc2UgaW1wbGVtZW50YXRpb25zIHN0cmlwIGNvbnN0IHNvIHRo
YXQgYSBzZWFyY2ggb2YgYSBub24tY29uc3QNCitvYmplY3QgeWllbGRzIGEgbXV0YWJsZSBwb2lu
dGVyLiBUaGlzIHVzZSBpcyBkZWVtZWQgc2FmZS4iDQorLWNvbmZpZz1NQzNBMi5SMTEuOCxyZXBv
cnRzKz17c2FmZSwiYW55X2FyZWEoYW55X2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vYnNlYXJj
aFxcLmgkfHxeeGVuL2xpYi8obWVtY2hyfHN0citjaHJ8c3RycGJya3xzdHJzdHIpXFwuYyQpKSki
fQ0KKy1kb2NfZW5kDQorDQogLWRvY19iZWdpbj0iVGhpcyBjb25zdHJ1Y3QgaXMgdXNlZCB0byBj
aGVjayBpZiB0aGUgdHlwZSBpcyBzY2FsYXIsIGFuZCBmb3IgdGhpcyBwdXJwb3NlIHRoZSB1c2Ug
b2YgMCBhcyBhIG51bGwgcG9pbnRlciBjb25zdGFudCBpcyBkZWxpYmVyYXRlLiINCiAtY29uZmln
PU1DM0EyLlIxMS45LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYW55X2FyZWEoYW55X2xvYyhhbnlf
ZXhwKG1hY3JvKF5fX0FDQ0VTU19PTkNFJCkpKSkiDQogfQ0KZGlmZiAtLWdpdCBhL2RvY3MvbWlz
cmEvZGV2aWF0aW9ucy5yc3QgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQppbmRleCA3NmJl
NmIzMjUxLi5iZWU0Njg2Njc1IDEwMDY0NA0KLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJz
dA0KKysrIGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KQEAgLTQ0MCw2ICs0NDAsMTUgQEAg
RGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCiAgICAgICAgcmVhZGFi
aWxpdHkuDQogICAgICAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCiANCisgICAqIC0g
UjExLjgNCisgICAgIC0gRnVuY3Rpb25zIGJzZWFyY2goKSwgbWVtY2hyKCksIHN0cmNocigpLCBz
dHJwYnJrKCksIHN0cnJjaHIoKSBhbmQNCisgICAgICAgc3Ryc3RyKCkgYWNjZXB0IGEgY29uc3Qg
cG9pbnRlci9vYmplY3QgYW5kIHJldHVybiBhIG5vbi1jb25zdCBwb2ludGVyDQorICAgICAgIHRv
IHRoZSBtYXRjaGVkIGVsZW1lbnQgb3IgYnl0ZSwgbWF0Y2hpbmcgdGhlaXIgc3RhbmRhcmQgQyBs
aWJyYXJ5DQorICAgICAgIGludGVyZmFjZXMuIFRoZSBjYXN0cyBpbiB0aGVzZSBpbXBsZW1lbnRh
dGlvbnMgc3RyaXAgY29uc3Qgc28gdGhhdCBhDQorICAgICAgIHNlYXJjaCBvZiBhIG5vbi1jb25z
dCBvYmplY3QgeWllbGRzIGEgbXV0YWJsZSBwb2ludGVyLiBUaGlzIHVzZSBpcw0KKyAgICAgICBk
ZWVtZWQgc2FmZS4NCisgICAgIC0gVGFnZ2VkIGFzIGBzYWZlYCBmb3IgRUNMQUlSLg0KKw0KICAg
ICogLSBSMTEuOQ0KICAgICAgLSBfX0FDQ0VTU19PTkNFIHVzZXMgYW4gaW50ZWdlciwgd2hpY2gg
aGFwcGVucyB0byBiZSB6ZXJvLCBhcyBhDQogICAgICAgIGNvbXBpbGUgdGltZSBjaGVjay4gVGhl
IHR5cGVjaGVjayB1c2VzIGEgY2FzdC4gVGhlIHVzYWdlIG9mIHplcm8gb3Igb3RoZXINCmRpZmYg
LS1naXQgYS9kb2NzL21pc3JhL3J1bGVzLnJzdCBiL2RvY3MvbWlzcmEvcnVsZXMucnN0DQppbmRl
eCA1ZjlmZTRjODYwLi43ZTE5MWEwZDRhIDEwMDY0NA0KLS0tIGEvZG9jcy9taXNyYS9ydWxlcy5y
c3QNCisrKyBiL2RvY3MvbWlzcmEvcnVsZXMucnN0DQpAQCAtNDc1LDcgKzQ3NSwxMSBAQCBtYWlu
dGFpbmVycyBpZiB5b3Ugd2FudCB0byBzdWdnZXN0IGEgY2hhbmdlLg0KICAgICogLSBgUnVsZSAx
MS44IDxodHRwczovL2dpdGxhYi5jb20vTUlTUkEvTUlTUkEtQy9NSVNSQS1DLTIwMTIvRXhhbXBs
ZS1TdWl0ZS8tL2Jsb2IvbWFzdGVyL1JfMTFfMDguYz5gXw0KICAgICAgLSBSZXF1aXJlZA0KICAg
ICAgLSBBIGNhc3Qgc2hhbGwgbm90IHJlbW92ZSBhbnkgY29uc3Qgb3Igdm9sYXRpbGUgcXVhbGlm
aWNhdGlvbiBmcm9tIHRoZSB0eXBlIHBvaW50ZWQgdG8gYnkgYSBwb2ludGVyDQotICAgICAtDQor
ICAgICAtIFNvbWUgc3RhbmRhcmQgQyBsaWJyYXJ5LXN0eWxlIGZ1bmN0aW9ucyBhcmUgaW5oZXJl
bnRseSBkb3VibGUtdXNlLA0KKyAgICAgICBhY2NlcHRpbmcgYSBjb25zdCBhcmd1bWVudCBhbmQg
cmV0dXJuaW5nIGEgbm9uLWNvbnN0IHBvaW50ZXIgaW50bw0KKyAgICAgICBpdCBzbyB0aGF0IGNh
bGxlcnMgc2VhcmNoaW5nIGEgbm9uLWNvbnN0IG9iamVjdCBnZXQgYmFjayBhDQorICAgICAgIG11
dGFibGUgcG9pbnRlci4gVGhlIGNhc3RzIHRoYXQgaW1wbGVtZW50IHRoaXMgYXJlIGRldmlhdGVk
IHBlcg0KKyAgICAgICBmdW5jdGlvbi4NCiANCiAgICAqIC0gYFJ1bGUgMTEuOSA8aHR0cHM6Ly9n
aXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEyL0V4YW1wbGUtU3VpdGUvLS9ibG9i
L21hc3Rlci9SXzExXzA5LmM+YF8NCiAgICAgIC0gUmVxdWlyZWQNCi0tIA0KMi40My4wDQo=

