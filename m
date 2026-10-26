Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404C606A331
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=flBGVFmS
Received: from list by lists.xenproject.org with outflank-mailman.1461550.1672585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMpQ-0006JA-6r; Mon, 26 Oct 2026 15:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461550.1672585; Mon, 26 Oct 2026 15:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMpQ-0006J2-3y; Mon, 26 Oct 2026 15:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1461550;
 Mon, 26 Oct 2026 15:41:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xLMpO-0006Iw-FI
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:41:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMpN-00HKAZ-Ns
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:41:37 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6adf74aa-e002-0a2a0a5209dd-0a2a450cb294-14
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:41:37 +0100
Received: from [52.101.65.134]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6adf74b1-f479-0a2a450c0019-34654186413b-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:41:37 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by GVXPR03MB10612.eurprd03.prod.outlook.com
 (2603:10a6:150:220::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 15:41:34 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 15:41:33 +0000
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
 b=OtBdBWghVU8KrGtV9MrknkKBq0woRTSl/YsyWh6mEzSS9o5yHAXi9RSim5ueHRJWRu9V6DVVduJnG7fYeYTovnNRz14PZKuP/oY4gCaTpTAAo4slSu5fKuBX5+kg7K3stquw6wB+ijoouDiy/8csPDC/kcdkkUmdY21P50uBrIhd6zWXCcJd8BDTT84wfMHg+HQ+zQNfm0kSsQWBYSnAhtWIvszP+tOp9f/HxcuhKWSto4RvoLpZ+53nsBJmuIekPH/moe+QDwFEAFkQkvt62PfHv2tHm6MEKaqRtsi3LMZucnOZ9OIO3ijc46DPezW/0QTKlMPTasaU5uzLwjjz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFdg5ZLtLFCMoHfU8GnwoxZIZFHCyAoIbazF6uMH77g=;
 b=GC34slGUYUmGkstmg42+skHw9EGo9SoLoychs2LlAUF7Mb5RObZbWU3YvHNV/RwEwIcmVDJaLwVs0V2JwRg2lPtqsefS7iLvX6wPGPwJTGs3NkB2DkLz/7aOntjsNsEP2hIi9Nl6LMaDCfCmeNVWd72cfKhNzCYAiSv3U6A+HrdsmpSx0qrUm7JZdCM1iRYtwRraHvepau5jdC1dhEveJMSzfws9qxFHyCWuhT/7NeL5VXI47yBt64WVy/Go+g+7X1OJOeZCgtCaVVi5GlB9glCNvFW3KY39pEP2gqOkyZJxkhGc/62z+hQEPn28TKG2a+auEscLYnNFJcf9j34NZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFdg5ZLtLFCMoHfU8GnwoxZIZFHCyAoIbazF6uMH77g=;
 b=flBGVFmS6aAbOJyHrNPLnCGX0OwIPgI9wAZHiTNLcSmR1BpWrxsS+3QgmVne4qDvGy233iSqZOGhEB9bxjytRNQ/qHUQX3uFv79Wy5vte1WVX3uJRp4hldZQUvnQlmrbtBRfspunlAN3+M3hvd1gWqFEBcu0VfNZ4QaTdtEijIlm0Cgct8bNBXGwofFKU1nlXT5hY23dOcBuRvBt5DrIw37rNgZFZeQxW9m+DHUhNrdtf7Cp633rGvnG0+xIdY8eit4yWMU3Q4MdEKlZV3hltpHdo+laNJwMDN59nHx+iQ96is6rnl2ImsDCDzDMUSeJmBNnlczOUyM2yrSkV2gqMA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Topic: [PATCH v5] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHdUnGcfnmLH64VckKy7OjAkXrKMLbuqNIAgCFle4CAAAbygIAABtAA
Date: Mon, 26 Oct 2026 15:41:33 +0000
Message-ID: <5de9bede-c621-4ee7-b3b2-6e4ded12d023@epam.com>
References:
 <41d073a1c07e10f0d86da4a31e7a91b7ffadd8d3.1790947567.git.oleksii_moisieiev@epam.com>
 <abf320fd-daa0-4057-a6c4-b56c4e336ee6@suse.com>
 <fb0e223c-44e2-4c28-ab24-50ce5a726185@epam.com>
 <f4aa19e4-6f48-4b8f-a648-c040e5f06f18@suse.com>
In-Reply-To: <f4aa19e4-6f48-4b8f-a648-c040e5f06f18@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|GVXPR03MB10612:EE_
x-ms-office365-filtering-correlation-id: b4774672-09b4-45ce-6020-08df33779cb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|261022105027099003|261022075727099003|10067099003|56012099006|261026140227099003|22082099003|18002099003|261026121527099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 FuGJLD/bYAU0zhmsbd8GY4vEn1TO9Trk0ENnByyECUIyvbq9TBe/UrXGlVzdpzOre+6hL6dKft6I5W5e94WKv8A4kHFiQDNj6dOO2V8lfJtHH3YRRADiposHeWgpLPTGp0FA2M1Zf+1f3Uy4qMH2Sf7grSHGoDK6bBJnKcq989jKaFz+z4eoT2ZGBpjW0bvQdJUrw7svh95ptyyM2157TdBMPjCx2vZ/D0p+i6WsJztTNk+Ekq0JBTyuM8InPvW9a4ULwm1IgqPHJNj5SObhEC5ohSxixcy2bpv2+Vn0fp0lK1mVG/Bb5RafvCdifiAHgqtkibm2aLTPbCon9zy8EwehpFsuwnLKohOCdS4LXIUCdK4+NlxC15LjNl1HjZxrM8+dbfHLM51FYDIzSqN5Huo99gwGr5T1fWL+cN7AUoCXUleawyxX7QSTEmslD4ZCuDBRrSEZwK4uiBxn6G8QCr03MAvQGBIYeU7e9OrrKv/QBMu0+i7DJQ4qaChjrn9E8tM3NPZM78vKm2vUFwykYZVpIgODduIAhTFHaXB2ttkH36htgAvO6wMm/FVh58e4rOTPdjt90ooTEONbS5wqfpAY0dAYbuSNThjw74oShXZ7fEVqI0/gUhuRA2FTAbs05sPChbpRhTnmDEOvjOGh7bK7D2kuF8UBUff2TR5OZE0BPv1VbM20GeMdoPf8KIuqpXyxfQxpB/sfmDdC1Dl+YvNgap5SMF05GsMzSERJpdA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTBFTVF1UHZNMGZwVFNMcHUyQVdQVFBPeEVodS80K3Q0amkyVnJFRTZxdk1r?=
 =?utf-8?B?eVd3OXFlYU0xdnpPZSs1OStlM3pESU1SVGxXNWUzS3Azcjk2WVR1ME9RWk9S?=
 =?utf-8?B?Vy9OdVM3YmhaQXVPMUtGSy80UXpQKzV5bXhidEtGR1I4QnpIdlNkZ285TE9Q?=
 =?utf-8?B?c2RmVVBUMmhWRDdlekJKaUl5aEV4TmpwVUEwSlRQQjg0aDFMZndOMGhzWGs5?=
 =?utf-8?B?Y3FaVXZacFIxL0ZuUlhCY3NvUmdGQkxKMDJtd2ZYeTRFL1FITkdobFp0M2Rw?=
 =?utf-8?B?clg3cWVvZHlmT1ZxYmtnSGNNa2hGaFF1ZEZNMFVCOGp1VWkycVIzKzZEMDRM?=
 =?utf-8?B?RUZtcHJhSXVyZldONzBKSHI2Q0tkTGJLQUxjLzFXbE9GbjRKWEw4WHF5cUNk?=
 =?utf-8?B?bFB6RzRRSFpYYUx6Mnl0NFZXcVZ4WlBiVEZjMXduc084NnRUWlIxMkZvakli?=
 =?utf-8?B?UDVaZ2wzdkZvZ3JvTU1VNXpBbGdCZmpGeFgwdlVKVDM4TGNwVlM0b1hQS0pZ?=
 =?utf-8?B?MVF3Y0pnWUdLamNBcm5UcjVuaE9XM3VtYUI4QWZ5ZHFLNE1SUW9xSjVxNkFx?=
 =?utf-8?B?M1RPeVJFNmovZVlhYVlpSWIxZmUvUkZLV20wcnVUUE5YeXo3SndPMmNNSmdL?=
 =?utf-8?B?ZkJ2blBYUWlXNEYyUWxKeDNZc0lRQlJkeWJyd3l6VE9Uc2NmZUpFVG04TE9E?=
 =?utf-8?B?NnpzcE1uYmowakJ0eXA0d1Q4WWI1Z1NZL1RhYkpMNWQrencwZVozblBpSU51?=
 =?utf-8?B?RU5veWNYbFVhdFFOMko3N0pSYkxUaXd1QlZ4WUJ4aDlZQ05vKzVXMnpDMzFx?=
 =?utf-8?B?RVRvcWc4a1d3WnB5MUVVQzVZRDVMWUh0SmxsRUtBb3hrS3JYb3AxSkVRWUlm?=
 =?utf-8?B?Y0MxK0l1ZmFNWTFEeUNaWjJRRVZWV1BDYXZibk4yeVExM3RnUkhIOHRLSEZD?=
 =?utf-8?B?VG8yNTdFemhveDZRd0M5Y09pdTNhckQ3TU5hK1ROYUplb2RCakwrVzJGd3lF?=
 =?utf-8?B?Y1Y3Rk8xZ1FCUlVMaVphR0R2ckg2TEo3bWt2THU5MW9ZaVdqendGam1xQVRQ?=
 =?utf-8?B?ZXlXeHVJRG9XYzc2a0tQYytjTFpOcnIwWnNiYld4OGs5dXhCZisvR1ZRMkhr?=
 =?utf-8?B?YVhIWC9KU1VHWG5mUkJhVjJteVF5Ykczb3RhNUluMGlzUmgyOXhyajlyZkhV?=
 =?utf-8?B?eitSYjl1MythVC9WQkdCK0t5bHVKc1BKN1dDalQ3QndoU2xaMlNUbHRmN21q?=
 =?utf-8?B?YnIyREpFYW91RGI0a0I5SWZUZnY0VThjcTdLbEZvWng3aEQxSEtWREVxRllu?=
 =?utf-8?B?aFpLSWNhZmdOY2NYMm5INURkendsWDl1aHNyTSt4bC9CYmlhWEwrNUpzNkZ4?=
 =?utf-8?B?Z09KWnlabTFWcW9GM2YvZy9NVk5QVmE1bmMxTEttbEhvZ2ppQXd6bUdvd2RI?=
 =?utf-8?B?cjkzVk5SNHB3Slk3K3BJRmVoenppQ3NlYjF6T2pnZk1rT0c2dXVsL240Y28y?=
 =?utf-8?B?bFN5ZVhkR0NCTUhvZmhuK3RGQ2hDL0NwOWRuS2xRRzNvR0F4RVVwc0J0U3Rq?=
 =?utf-8?B?TlVMMzhWNjY4dUVpU3NpOHZNSlNvcVYxR0NvTC9oVzU0aHpWcFprQmNEMjFv?=
 =?utf-8?B?OElmbEFjOFNISWFrUkpBbHJ1K2dTRHJyTTBFVnpZV2k5VDlJL3pkeTM1UWw5?=
 =?utf-8?B?aUg1eG5mSGU3cU5XYUkvRmxSckVFN2wvTkdWWlRLbGtvcDNjaEhHQTl2VWhz?=
 =?utf-8?B?QTl6djJwWk1qaC9Bb05jNHlXd201WlVpSU1qMVdxYjY0a3o1STN2UWx6T3dS?=
 =?utf-8?B?akRtd1BFMStFb2VoZUZsWjFVUFRsWVNBTUNNc0hNZjVWYXRoR2NSbVVwb1lm?=
 =?utf-8?B?NHdWYUJSQmRzQU15MXd1bmsyWEF6QnRUNGg0L0ZOWkw1Qm44dGkxNXBFUVFi?=
 =?utf-8?B?Y2VWQ3M4bWs0SCtJa3oxc0oxemdGeVBkd014TGJqM3l6QXFNUTl4RERqejZk?=
 =?utf-8?B?TXEvSGN3V252UzNvV1pvM0pYQUl3QzJOa2IvUmNHMSs5a21DMzRTeU82YnNN?=
 =?utf-8?B?N1dPaWxmajdObEtDK3Z1a203VTYyYk9LWjB5OGRxVHl0YUtHSW9IVEVtYU1y?=
 =?utf-8?B?ZEZLRWVWNDVkVldZd1BRdVpiaEFCOGdqVExqUjVUT3pCMEd0bFpFNjY3OEJI?=
 =?utf-8?B?V1h4WXJXRWxqY3d2bTlpN1RUN2Fhc1o2Y2dJYlN2alJ1ZTlTUVowL1JNbzNr?=
 =?utf-8?B?WFMzczBVWWQyaGtYWkhjcE9MdFgrZjlZdEV1bHU0cGtWYkZuazhLWEM5TGJB?=
 =?utf-8?B?bE96TWw5azVOTnZsUFF1ditidGdTbDFwdDRHYWVlbi9GNWZzRU5OeUJTUHFn?=
 =?utf-8?Q?usS21wxy7kM2RR+k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B4241D3EEF72F40A4B82593F1AEEC69@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4774672-09b4-45ce-6020-08df33779cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 15:41:33.2965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPYMXbVkSTTR0USK7ouDq61c/FarsTh5sYc/d1YNs8mnuzGRjm0dslSVPnzbljdqCxYAWF1fPZ7LsBLMpbIK2LNPiX9MD7hJPsEnZInPvLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10612
X-purgate-ID: tlsNG-d25034/1793029297-020C1A5B-EE03D2EF/0/0
X-purgate-type: clean
X-purgate-size: 2262
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQpPbiAyNi8xMC8yMDI2IDE3OjE3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjYuMTAuMjAy
NiAxNTo1MiwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBPbiAwNS8xMC8yMDI2IDExOjUy
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMi4xMC4yMDI2IDE1OjI2LCBPbGVrc2lpIE1v
aXNpZWlldiB3cm90ZToNCj4+Pj4gVGhpcyBjb21taXQgaW50cm9kdWNlcyBhIG5ldyBLY29uZmln
IG9wdGlvbiwgYENPTkZJR19ET00wX0JPT1RgLCB0bw0KPj4+PiBhbGxvdyBmb3IgYnVpbGRpbmcg
WGVuIHdpdGhvdXQgc3VwcG9ydCBmb3IgYm9vdGluZyBhIHJlZ3VsYXIgZG9tYWluIChEb20wKS4N
Cj4+Pj4gVGhpcyBmdW5jdGlvbmFsaXR5IGlzIHByaW1hcmlseSBpbnRlbmRlZCBmb3IgdGhlIEFS
TSBhcmNoaXRlY3R1cmUuDQo+Pj4gSSAoc3RpbGwpIHdvbmRlciB3aHkgdGhpcyB3b3VsZCBiZSwg
YnV0IHdlbGwgLi4uDQo+PiBGb3IgdjYsIEknbSBnb2luZyB0byBkZXNjcmliZSB0aGlzIGFzIGEg
Y29tbW9uIG9wdGlvbiBmb3IgbGVnYWN5IERvbTANCj4+IGJvb3QsIHdpdGggQXJtIGltcGxlbWVu
dGluZyB0aGUgY29kZSBleGNsdXNpb24gaW5pdGlhbGx5LiBNeSBpbW1lZGlhdGUNCj4+IHVzZSBj
YXNlIGlzIGFuIEFybSBkZXBsb3ltZW50IHdoZXJlIGd1ZXN0cyBhcmUgbGF1bmNoZWQgdGhyb3Vn
aA0KPj4gZG9tMGxlc3MgYW5kIGxlZ2FjeSBEb20wIGJvb3QgaXMgbm90IG5lZWRlZC4gSSdtIGdv
aW5nIHRvIGNsYXJpZnkgdGhhdA0KPj4gdGhpcyB1c2UgY2FzZSBtb3RpdmF0ZXMgdGhlIGluaXRp
YWwgQXJtIGltcGxlbWVudGF0aW9uLCByYXRoZXIgdGhhbg0KPj4gbWFrZSB0aGUgaW50ZXJmYWNl
IEFybS1zcGVjaWZpYy4gSXMgdGhhdCBzY29wZSBPSz8NCj4+Pj4gQSBuZXcgS2NvbmZpZyBzeW1i
b2wsIGBIQVNfRE9NMGAsIGhhcyBiZWVuIGFkZGVkIGFuZCBpcyBzZWxlY3RlZCBieQ0KPj4+PiBk
ZWZhdWx0IGZvciBBUk0gYW5kIFg4NiBhcmNoaXRlY3R1cmUuIFRoaXMgc3ltYm9sIHNpZ25pZmll
cyB0aGF0IGFuDQo+Pj4+IGFyY2hpdGVjdHVyZSBoYXMgdGhlIGNhcGFiaWxpdHkgdG8gc3VwcG9y
dCBhIERvbTAuDQo+Pj4gT2xla3NpaSAtIHdoYXQncyB5b3VyIHRha2UgdG93YXJkcyBSSVNDLVYg
aGVyZT8gU2hvdWxkIGl0IHNlbGVjdCB0aGUgbmV3DQo+Pj4gc3ltYm9sIHJpZ2h0IGF3YXkgYXMg
d2VsbD8NCj4+IEluIHRoZSBzdGFnaW5nIGJyYW5jaCBSSVNDLVYncyBzdGFydF94ZW4oKSBkb2Vz
IG5vdCBoYXZlIGEgbGVnYWN5IERvbTANCj4+IGNvbnN0cnVjdGlvbiBwYXRoLg0KPj4gSSdtIHRo
ZXJlZm9yZSBnb2luZyB0byBsZWF2ZSBIQVNfRE9NMCB1bnNlbGVjdGVkIG9uIFJJU0MtViBhbmQg
ZXhwbGFpbg0KPj4gdGhhdCBzZWxlY3Rpb24gc2hvdWxkIGFjY29tcGFueSBpbXBsZW1lbnRhdGlv
biBvZiBsZWdhY3kgRG9tMCBib290Lg0KPj4gSXRzIGV4aXN0aW5nIEhBU19ET00wTEVTUyBzZWxl
Y3Rpb24gZG9lcyBub3QgcHJvdmlkZSB0aGF0IHBhdGguDQo+PiBEb2VzIGl0IHNvdW5kcyBvayB0
byB5b3U/DQo+IEZUQU9EIC0gbXkgZWFybGllciBxdWVzdGlvbiB3YXMgdG8gdGhlIG90aGVyIChS
SVNDLVYpIE9sZWtzaWkuDQo+DQo+IEphbg0KDQpTb3JyeS4uLg0KDQotLS0NCg0KT2xla3NpaQ0K

