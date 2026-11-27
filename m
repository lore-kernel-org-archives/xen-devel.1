Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B5606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=uzL0fAYs
Received: from list by lists.xenproject.org with outflank-mailman.1504835.1699881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOU-00048t-KB; Fri, 27 Nov 2026 11:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504835.1699881; Fri, 27 Nov 2026 11:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWuOU-00046n-FI; Fri, 27 Nov 2026 11:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1504835;
 Fri, 27 Nov 2026 11:45:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xWuOT-0003uN-15
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWuOS-00DghQ-Dn
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:45:32 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d4b-2eae-0a2a0a5409dd-0a2a450cbb04-36
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:32 +0100
Received: from [52.101.66.94]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6b096d5a-f479-0a2a450c0019-3465425e5687-6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 12:45:32 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by DB8PR03MB6139.eurprd03.prod.outlook.com (2603:10a6:10:141::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 11:45:27 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:45:27 +0000
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
 b=GfODkD+olsS+nKGfqvFpXf5tV1CWG2yi555AT50ZppQ4gxDnc285dsZiy6mV7w1BQ8qL2SvctBdFdBTOKC4L99p4K2OQy+rxcXsfKeMoiUpYAtZ+2CsRiro/j0KRJBw06zpliX9xKHZCGlPFDaHZJ6Bx4MZKiKlc7FuSCTjtr07C/URsom8T4UxjIcYRQYuTAHckCGvn3/gx23vLzVLc+qfwPJLr/SIuD3LnXhb+s0wYYdDSkluPLdjaFVxPnGTIbUvI/8IdKe3sXlb4v/uUC8u0UCibtT7Qe2xIh7Pxh5Fw8UrM1Zav7yqkMcDRgDDWoukhbKmP1miQY7y7TYXcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIvrJXWmv6E1Sd3AOeBs2SqxrPUShRpwNKbAjXEpJU4=;
 b=QDacxLeS7j+M0E2tGAL7JfNmMLTLo2HJTTRq1kn2XhSCsVnyXWPtpFH93UZVfUG2NTNH3g59oJ5c7rSFcN8nE7tv24AaLXU5npGN6CzF3niBJrGQToM2RNtuILHUqOxDNQ2dkshoZ8I7t2gjOC2yx9VmtsWp4LQbS/cEU7FuDR896jMiSb+brWm2eLF/oKc4VqO3wOKvu5yzjp8ex6Ipt7cy5F4MzUcdaODAiIqUFm+895HkJIA7Af5elGpq7Hz5i+zs13UKKB3iv8Mbw4oUPYZVf6LgMRerTGHL7mukkePAhh+wYAFsIA5ZVFR1T3nexjYzBGNL7Pg3G+PE1mOmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIvrJXWmv6E1Sd3AOeBs2SqxrPUShRpwNKbAjXEpJU4=;
 b=uzL0fAYscTU9iF/K6r+4OP8Ebsk/K5WLI5GLrNpRXxqMH9lQK8+hZLCEjvl/WgkDYC0/CIW+dvi1ax3IFWTL2oKQdldIJfKMcoPsH+f5Jw/zdqTayQEmpnr0ZOB6ZOUhCVSrAWWSnx+geQYKmr4aJvlqMcZQ1RWILit9A3hTX0uYztePSlAfn+b8+QYQ+RBlVmxiY5T6AynX/vy5FqIV6sqRm4LiVqqUGIVYnMzfFOch/FNcDsg5sfl6ANuv05awtzLeec88/ZolFzHJShCCFNuUScyHNt9P4TIwO9E9Damh+OlW/prqcejKa0OK+4sd5RY/HfbPfEOd7YxQ2DlREQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v12 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v12 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHdfmTMFTq6WJkad0ijoEKfcznazQ==
Date: Fri, 27 Nov 2026 11:45:27 +0000
Message-ID:
 <5c3447cb434f8a5fedffa12cd38079de7f20f091.1795775931.git.mykyta_poturai@epam.com>
References: <cover.1795775931.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1795775931.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|DB8PR03MB6139:EE_
x-ms-office365-filtering-correlation-id: 27613be8-0959-48fc-92a8-08df4c7bee9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261021121427099003|56012099006|261009223027099003|261022075727099003|261028144727099003|10063799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 wLMPqBXrUv94mWS3bTni5GVgyIfjuUBiN5wimuUmfKkrcZChgepUYMD5lIYaayI/iledBfBLusYO6GEIg9bAkfaDfgjiZXFDaXecUhPQD2hAfNtK65EGbpt4OZJt/q2uIlP/KRUScyx/Jf/I77yvFelY/QKknA/6pi4z4d3Gsli4Eyf5+8vAAN+bnhI0B3YJaifFWQ+j5uSQBh0BcN6bwdxXPhrsGHnNeq2Z+5ir7ao0ljXDPPycM5BtE5nCywL3pFNQ64sUyDcP3frgdfgZsDcJWFLuqqfihT0qs9n4qyIeS+W7HqOdCI5fz8qDSA/KWM/oAiNi9NqYCmOXVtszqYTkFrW/OatnuM3moD1ZdCs+kSrXHQS90YrbcXVTW9AmiaMIldSjfc7Z82oLHWP+iIf9TgbHESXTNH5iCETZOXIMFfr5ZhpCOVo4GC0Q9nXcwV3fwu15MFv1f1sIMes41umkOs+yTBGPWKpA4IlfvVc88bNL+8fx0y4A0jXuSoUezMMBmAzEGNJ4612Kit9oqoYmBzDOvzChA80xu0EhAHbLRUVBjAXYJ0ok2As+JTpjuU4j+O8Ay5zFYgonesfHUnNhh42Wr3CbBJvCIZG5Spd18wrCPd7BeuP1TjJyPqowLAeCJoAjPZge4EfuLeT/g62jwsg3q8HQ0synvZm9d+EVlnkjsjk0D/TRcsZNFvy/XauC9cRvb9SD5j4MuNnL4esOMqKj5EQZLOhQmAldfj0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021121427099003)(56012099006)(261009223027099003)(261022075727099003)(261028144727099003)(10063799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ry9BWDVUWXdrSFdjR2xMbGFVbDd5OThEanErQnNnSmFzenI1ek5TY3RGTncv?=
 =?utf-8?B?dEx1MnljUW5MUkhIa3hPdDNLTFh4QUQ2L3pySFlzeDRsU0R6UW9YcnV0dTE5?=
 =?utf-8?B?MFRmNENhcng4VERjMkx4WEtqYzQwbzZjT0NkNWdsK2Vsbkk3QXBKU0xmNDhT?=
 =?utf-8?B?Z2FTZzdFQ0h3THJaZjN4ZjNvZlVRWTJiYm9IcHVoL1RjWXpGOW0yL3BTVEJL?=
 =?utf-8?B?c0NuMWpFNnlSaXFsTlk1eGlrbWQxZEZ5U0JERi8vdVRnejRyeHF6U3kvVEtI?=
 =?utf-8?B?MmdiU1h3Qmg1TDJpU25CTkVyTnltZGRTdWZqdk5SOVJQRWFJcFhpNXprN201?=
 =?utf-8?B?d25VOG9Ud0FPTHRSanZXeTA2eGQ1Yng1WEJPeU4zWGhQaWVOWVRrcmlHK1FJ?=
 =?utf-8?B?SS9wSkJneGFKRjUvVzBXNGxXK0w2VTMzR1Z0MWV6em1YUHd3ajBIZ045elVR?=
 =?utf-8?B?dkV2WkhTdXdvVTBiTE1Zaitvd3QvSExzdWVaeGdZNk9CSUNkMHdpM0hzcGxj?=
 =?utf-8?B?NzRMTk4yQjNMQjlKUVovL3ZaZWFINEhkb1Q2MU84WlNIakprTXlWRUhIRDZm?=
 =?utf-8?B?WDRtYWpxVlRoSlZ4ckduVzZ0czNFakFqS1N2QktjY0tKZEQyNDB5cTJqRldT?=
 =?utf-8?B?RmduN1dSbFNYenB0Qjc3OXN3QTRHWWF4VklUalltajhXM0tZRWppSjdnN1Jk?=
 =?utf-8?B?bTlGVVlrVll6V1Vla0RiOFdmc3Z4cEtySHVDczV2WDhMK29pNU9nSXhVRzRi?=
 =?utf-8?B?ZUFzTHRWQjVjc1QyWHhLZTN5RE1qd3ROVjFxbitSdWVndGlQejF6cU81dEt4?=
 =?utf-8?B?bmhycVBXcmlUQ3htOFdIVzNkQUhYZXNzRDM4dFMyb216SjcyeTFYc0UrRFRP?=
 =?utf-8?B?eGdxQjFIRk1WMkJ0b3hFMzgwSmVWVXNMZ2lrNWNJZ0l5d3luVnFuMDgzRmxr?=
 =?utf-8?B?MzdTRnJDcFdWdG9XalcyUnZUUzhSQ0FWajBNWGpkRHdLNWlaSTg1WkYrd1Zw?=
 =?utf-8?B?aVo1cG1JQ3lVdDJ2UEExeXpUeGNnY0k4UjYyYzlhKzg4cThmNit2a3ZiL1dZ?=
 =?utf-8?B?Z3pFcy9MSFA1NFZpRnZLYjIvTENqWEJRQjk2MDJ6YmtXdWlmZ3RVOU5USWhz?=
 =?utf-8?B?K0ZaMVZuanhEZHJSS1J1b3RGd1lRMnArUHVlM0lkZ1M0WDdJdi8xQVJRMHpy?=
 =?utf-8?B?czdYd0NKWUVTNk5VSmVKZVRzT2VZUzV5bGJ6b1N4eGZ1RWJaRTM1S0Yyenh1?=
 =?utf-8?B?WDFSNVkxV0l0Q0hxb3FNRXkyMHFYOGVNNjAyVURGQ2JFby9wa01kODFFWDRY?=
 =?utf-8?B?NklGK3JHMUJNL0pPOWpzbXc5L2lhZjVCenVvTGgyWGhwS2xKNExCSkNuQ0lo?=
 =?utf-8?B?OFk3V3hIRXMrV3VjNEZCQ3NiOWEwZHVhdS8zTHBSd3E0anI5RlNQaGt2aVFi?=
 =?utf-8?B?cG50b2poZnNkam5Cb3pacGJHOWNVOXRYOG52eldLUTc5b2k2Yi9tU0xyS091?=
 =?utf-8?B?WlRDYVdxM0RWMXJ6bnBGZDRTallpckhiczdkMERTb2Q0b29acXBneWVBdGQ1?=
 =?utf-8?B?Z2M3aDd0MHU2REpwVHBkYmc4TGRteXZmMnJIdXEvTllXMXRPYzZuTmx2RGVh?=
 =?utf-8?B?R0lpUURwUE5FRElKdkJLWU9OOFNDekJ6V2paays4SkoxQkZqTktQYWxtZElD?=
 =?utf-8?B?YWNnRncvZVN5aGdrUE9xUk1WR3NKN3Q1RCt4QjI0akJlaGNSaE9vR28zcTFO?=
 =?utf-8?B?ZjdKbmQ2STVSYkMrRlh5V2JaTFhjdXV0MU8yOW1sZEE4SGpFdzRJRE5lemFu?=
 =?utf-8?B?TURNV09sd1k1dWNFTVBMd3R3Nng3NDBma0RZb0RNT2dUSHc5bUo2ek1hVWda?=
 =?utf-8?B?SGdNM2YrYjR3MlZmRFQ2elNSWE5wTzQwSGozVlNsTDl0dFltS3dCWXNZZVhX?=
 =?utf-8?B?M1ZaNGZTVWZQNWI5OXRrNFgrbDdiZERDcTFvRWxoSUI1R2xnTzZ5YTByUkVW?=
 =?utf-8?B?VTlzSEcxSWNqZFRvTy9mbWFyTHAydWp4UCtIQUp4YzNxbVBpeWEyU0VqVmI0?=
 =?utf-8?B?dTRXeXI5aHR5OFhIeDkwTzRqRWxLUGZEdzdXazBybjE4cHJURG8yNThtMjNj?=
 =?utf-8?B?TFFLOTZDWUVwaVFEMnBVWThFRXZmcWtMSnhnazVyaHpLRWlEMFVueW5ld2dm?=
 =?utf-8?B?Rk8rQ3ZRQUE3V1U5VVVNUUIvR1h4eHR0c2wyZElBRVl6am5GaHhBM1dqUGFP?=
 =?utf-8?B?YW9sQjJ3TloydHYxS25BYXlMRitPcVkvbkpwUEhadGFwUHEwdndUa1ZHSFZi?=
 =?utf-8?B?ZkRHUy9pUEgvU2FCQVNPMnBSUWdmckQrSlZrVkZkck9KQkpWOERudz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27613be8-0959-48fc-92a8-08df4c7bee9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 11:45:27.7363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/yzo1SX1kfkyw9U/0fax7d0RH3+4X/DNLwtZpav87Tz1MusuRsf7T9rTjUq8dmNbsh+AFjyYHeP7YYT6XnpUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6139
X-purgate-ID: tlsNG-d25034/1795779932-51339A5B-990A871A/0/0
X-purgate-type: clean
X-purgate-size: 5038
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rm9yIHRoZSBwdXJwb3NlcyBvZiBjZXJ0aWZpY2F0aW9uLCB3ZSB3YW50IGFzIGxpdHRsZSBjb2Rl
IGFzIHBvc3NpYmxlIHRvDQpiZSB1bmNvbmRpdGlvbmFsbHkgY29tcGlsZWQgaW4uIE1ha2UgQ1BV
IGhvdHBsdWcgYW5kIFNNVCBvcGVyYXRpb25zDQpjb25maWd1cmFibGUgdG8gZWFzZSB0aGUgcHJv
Y2Vzcy4gVGhpcyB3aWxsIGFsc28gaGVscCB3aXRoIGludHJvZHVjaW5nDQpDUFUgaG90cGx1ZyBv
biBBcm0sIHdoZXJlIGl0IG5lZWRzIHRvIGJlIGNvbmZpZ3VyYWJsZS4NCg0KU2lnbmVkLW9mZi1i
eTogTXlreXRhIFBvdHVyYWkgPG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCi0tLQ0KdjExLT52MTI6DQoqIG5vIGNoYW5n
ZXMNCg0KdjEwLT52MTE6DQoqIG5vIGNoYW5nZXMNCg0KdjktPnYxMDoNCiogbm8gY2hhbmdlcw0K
DQp2OC0+djk6DQoqIGFkZCAiaWYgRVhQRVJUIg0KKiBhZGQgQUINCg0KdjctPnY4Og0KKiBmaXgg
c3R5bGUNCiogcy9DUFVfSE9UUExVRy9DUFVfT05MSU5FX09GRkxJTkUvDQoNCnY2LT52NzoNCiog
bmV3IHBhdGNoDQotLS0NCiB4ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJjYWxsLmMgfCAxMiAr
KysrKysrKysrKysNCiB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAgICAgICAgICAgfCAgMyArKysN
CiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysNCiB4
ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAgICAgfCAgOCArKysrKysrKw0KIDQgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Bs
YXRmb3JtX2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQpp
bmRleCAwZjNjNzkxZmMyLi4yZDQzZDIwMTQzIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L3Bs
YXRmb3JtX2h5cGVyY2FsbC5jDQorKysgYi94ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJjYWxs
LmMNCkBAIC03MzUsNiArNzM1LDEyIEBAIHJldF90IGRvX3BsYXRmb3JtX29wKA0KICAgICB7DQog
ICAgICAgICBpbnQgY3B1ID0gb3AtPnUuY3B1X29sLmNwdWlkOw0KIA0KKyAgICAgICAgaWYgKCAh
SVNfRU5BQkxFRChDT05GSUdfQ1BVX09OTElORV9PRkZMSU5FKSApDQorICAgICAgICB7DQorICAg
ICAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAg
ICB9DQorDQogICAgICAgICBpZiAoIGNwdSA+PSBucl9jcHVfaWRzIHx8ICFjcHVfcHJlc2VudChj
cHUpIHx8DQogICAgICAgICAgICAgIGNsb2Nrc291cmNlX2lzX3RzYygpICkNCiAgICAgICAgIHsN
CkBAIC03NTcsNiArNzYzLDEyIEBAIHJldF90IGRvX3BsYXRmb3JtX29wKA0KICAgICB7DQogICAg
ICAgICBpbnQgY3B1ID0gb3AtPnUuY3B1X29sLmNwdWlkOw0KIA0KKyAgICAgICAgaWYgKCAhSVNf
RU5BQkxFRChDT05GSUdfQ1BVX09OTElORV9PRkZMSU5FKSApDQorICAgICAgICB7DQorICAgICAg
ICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQorICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICB9
DQorDQogICAgICAgICBpZiAoIGNwdSA9PSAwICkNCiAgICAgICAgIHsNCiAgICAgICAgICAgICBy
ZXQgPSAtRU9QTk9UU1VQUDsNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wLmMgYi94ZW4v
YXJjaC94ODYvc21wLmMNCmluZGV4IGFlNGU1YTY2ZDcuLmUzYzRjMGQ1ZTAgMTAwNjQ0DQotLS0g
YS94ZW4vYXJjaC94ODYvc21wLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXAuYw0KQEAgLTQxNiw2
ICs0MTYsNyBAQCB2b2lkIGNmX2NoZWNrIGNhbGxfZnVuY3Rpb25faW50ZXJydXB0KHZvaWQpDQog
ICAgIHNtcF9jYWxsX2Z1bmN0aW9uX2ludGVycnVwdCgpOw0KIH0NCiANCisjaWZkZWYgQ09ORklH
X0NQVV9PTkxJTkVfT0ZGTElORQ0KIGxvbmcgY2ZfY2hlY2sgY3B1X3VwX2hlbHBlcih2b2lkICpk
YXRhKQ0KIHsNCiAgICAgdW5zaWduZWQgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7DQpA
QCAtNDQzLDggKzQ0NCwxMCBAQCBsb25nIGNmX2NoZWNrIGNwdV9kb3duX2hlbHBlcih2b2lkICpk
YXRhKQ0KIHsNCiAgICAgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7DQogICAgIGludCBy
ZXQgPSBjcHVfZG93bihjcHUpOw0KKw0KICAgICAvKiBIYXZlIG9uZSBtb3JlIGdvIG9uIEVCVVNZ
LiAqLw0KICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQ0KICAgICAgICAgcmV0ID0gY3B1X2Rvd24o
Y3B1KTsNCiAgICAgcmV0dXJuIHJldDsNCiB9DQorI2VuZGlmDQpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3N5c2N0bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jDQppbmRleCA2YmQ0ZTE5MWE3
Li4xMGQ0ODVlNjMzIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jDQorKysgYi94
ZW4vYXJjaC94ODYvc3lzY3RsLmMNCkBAIC01Myw2ICs1MywxMiBAQCBzdGF0aWMgbG9uZyBjZl9j
aGVjayBzbXRfdXBfZG93bl9oZWxwZXIodm9pZCAqZGF0YSkNCiAgICAgdW5zaWduZWQgaW50IGNw
dSwgc2libGluZ19tYXNrID0gYm9vdF9jcHVfZGF0YS54ODZfbnVtX3NpYmxpbmdzIC0gMTsNCiAg
ICAgaW50IHJldCA9IDA7DQogDQorICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0NQVV9PTkxJ
TkVfT0ZGTElORSkgKQ0KKyAgICB7DQorICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCisg
ICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCisgICAgfQ0KKw0KICAgICBvcHRfc210ID0gdXA7
DQogDQogICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1ICggY3B1ICkNCkBAIC0xMjAsNiArMTI2LDEy
IEBAIGxvbmcgYXJjaF9kb19zeXNjdGwoDQogICAgICAgICBsb25nICgqZm4pKHZvaWQgKmRhdGEp
Ow0KICAgICAgICAgdm9pZCAqaGNwdTsNCiANCisgICAgICAgIGlmICggIUlTX0VOQUJMRUQoQ09O
RklHX0NQVV9PTkxJTkVfT0ZGTElORSkgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHJldCA9
IC1FT1BOT1RTVVBQOw0KKyAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKw0KICAgICAg
ICAgc3dpdGNoICggb3AgKQ0KICAgICAgICAgew0KICAgICAgICAgY2FzZSBYRU5fU1lTQ1RMX0NQ
VV9IT1RQTFVHX09OTElORToNCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4v
Y29tbW9uL0tjb25maWcNCmluZGV4IGE2MTlmMmNlZjEuLjIwNzk1OWE3ZDUgMTAwNjQ0DQotLS0g
YS94ZW4vY29tbW9uL0tjb25maWcNCisrKyBiL3hlbi9jb21tb24vS2NvbmZpZw0KQEAgLTY0OSw2
ICs2NDksMTQgQEAgY29uZmlnIFNZU1RFTV9TVVNQRU5EDQogDQogCSAgSWYgdW5zdXJlLCBzYXkg
Ti4NCiANCitjb25maWcgQ1BVX09OTElORV9PRkZMSU5FDQorCWJvb2wgIkNQVSBvbmxpbmUvb2Zm
bGluZSBzdXBwb3J0IiBpZiBFWFBFUlQNCisJZGVwZW5kcyBvbiBYODYNCisJZGVmYXVsdCB5DQor
CWhlbHANCisJICBFbmFibGUgc3VwcG9ydCBmb3IgYnJpbmdpbmcgQ1BVcyBvbmxpbmUgYW5kIG9m
ZmxpbmUgYXQgcnVudGltZS4gT24NCisJICBYODYgdGhpcyBpcyByZXF1aXJlZCBmb3IgZGlzYWJs
aW5nIFNNVC4NCisNCiBtZW51ICJTdXBwb3J0ZWQgaHlwZXJjYWxsIGludGVyZmFjZXMiDQogCXZp
c2libGUgaWYgRVhQRVJUDQogDQotLSANCjIuNTYuMQ0K

