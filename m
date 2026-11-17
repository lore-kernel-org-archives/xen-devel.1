Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD5606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=USUN7ZIq
Received: from list by lists.xenproject.org with outflank-mailman.1493107.1693237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTOy9-00045A-7J; Tue, 17 Nov 2026 19:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493107.1693237; Tue, 17 Nov 2026 19:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTOy9-000453-4R; Tue, 17 Nov 2026 19:35:53 +0000
Received: by outflank-mailman (input) for mailman id 1493107;
 Tue, 17 Nov 2026 19:35:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTOy7-00044x-7c
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 19:35:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTOy6-00BycX-K6
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:35:50 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcac81-2eae-0a2a0a5409dd-0a2a4505c65a-32
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:35:50 +0100
Received: from [52.101.84.85]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcac96-4cb1-0a2a45050019-346554553e73-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:35:50 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by CPHPR03MB395035.eurprd03.prod.outlook.com (2603:10a6:380:107::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:35:47 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 19:35:47 +0000
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
 b=fwTdfvYLYb4Gjq2U/YWnRA2oZa2KvSFMUL2iNfSY4BTQEBz0n3TSPNstIQFrlp0ypQHfxwTbyNV318SCUUiOZHoMZFpfY36Op3vPcon19Mv59RCPT4X1r1L3nmMC1Feplr2s3KjrpOpEfgZdVSHMeMA+26I7JqvQdRp+I0QnFAFomlkkvI9bLQeCiDbpNmVtDNBeH0NUWloRV2eJz/2+V7MD4vGajve6czsSt8zp7FASLlR3hbtdYKXDTlS480NfDX5NmD08CNLRTynTgtIAji/UvdRFOtKHJOroiC8O2M1kiN3FJarzVFNNWIif7dhwCBVMsD8bakrg4siyp//JiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDDzvay385CUNjb72j2EhJns+cfktYW1MWGlf4e3lWs=;
 b=JdAkgvuOHLkNgDr7F7eDW0egA0EVrvh+l8whzpg9B8lTQP4nEJ9CvlOnZ0EocSm83jjjuCA7hnGHLf1gwGRAkCMtqzlKnNaH1RqoKk0cv208IIjjgvEfXzZSjwt81r+3I1zMEXmhCLjfOaYEiZuJlATSzZnC41IACqZW9B9qJzwW6Hh3RDKB/ZDElS+7eBc8i4YkL0rbqzHtsmzdia4ByRyZ6BK64RJm2d5wF1YzlG9HXbYMpGgpFqXktDWTrMx8cXhuHrUz8JZpRf1UOXEtf6KJ7W0yochZcRhOpuYebqKVkzxaHE7SH1DymVoSA+n/ZBComm1Se5v4DwiS2H62nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDDzvay385CUNjb72j2EhJns+cfktYW1MWGlf4e3lWs=;
 b=USUN7ZIqxhW66+0z7kGQ2tge1VuG6X+5Vi9KKS30tzpvk+JDsaL0FPvInZQhtSTiHHyWfUq2oWkVwbHVIvNRZF67rRRlpYplTE/6oGi9J2oSwf7TOKWQ00y9A/uVfQM4ublHQgabhundVaDYrXIid/8nNE/7F7it6Gr9OQb1G8JLRfNOvyy7AE1WUvvWjWxRQVgvqY1WFawj8QafQPJvjIztYbDlejjd1MPerKFIIvQjcL9LE2ZFiOHs+jyLunY7OgPQ2b732fm7hzZugLlUATc52vNOunbBmrnhd5O5LY6jsrqDvPoPBWWUpRmzYt1YkshHto3qbValmfMHk432qQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: [PATCH v3] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
Thread-Topic: [PATCH v3] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
Thread-Index: AQHddsrYLaVRJihQEUu25Hr3vcjlcw==
Date: Tue, 17 Nov 2026 19:35:47 +0000
Message-ID:
 <d02a8b799661f9e58be3b39a31ec1c07eff3fcf4.1794939649.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|CPHPR03MB395035:EE_
x-ms-office365-filtering-correlation-id: 2ab8aa0e-5afb-4495-9e96-08df44e1faa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|366016|1800799024|7416014|376014|18002099003|6133799003|261009221227099003|261009223027099003|3023799007|260925022911599003|11063799006|260925021911599003|56012099006|260925021311599003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261021123027099003|261021121427099003|38070700021|261102124527099003|10067099003;
x-microsoft-antispam-message-info:
 fl8FisIGlr2ZbbQ38BBPbUaBTkp4sCFdC2HNBNlBoD4ntTICLGUR6uzZntdMtC2h8xQrJuL4WwOX/+G3y6eXD9tP+ohI8ghbVxVGQY2S69DYIGhv2UVQsWqs5wY7aqcl7RjvMyBM+/DY33VSg2aF7FnL8oh3KBe3MbK+DI5xbhy+vhxw+PgCwfmafkmIoP1dSy1c993Got42OH3XeC7NERuj69MfF94ZYJBq4EZG/38UZ0I7cP9d1gLmNHRvPDn25e/f8FxwXvSh9fizTGQmmYjcPwE4lO5nDGORwandMvLUyOKOHQKrIG7jy0NdZLE7ByV25t0+w5/AX4OeXnHaUoLyWx850fOpxh/pNj/sTmqDta2VMVUzpRecWfXT/rUk6Vg9G0HG8kr8DSxNXGqvQCqkpA/f0uWSepWt9yLhxR1XtX1oexPis5TQx9UNAvP7s9BRaYXoXWmQq6eBj5OtDJGeNqMnrSHB4DhJRLapRjP/mQPsYiPUNuOakaTWYsu9bhudM1icyDZjI12ODTVJBJsZQlwsU0ZvAY3mSM3Hb5ykCB8pjGe4CSlgwgPUV50NnhU2ZmWMOPJvXaLQ/VNbf1oBrxOT7e4Y/O0v+qxv+pWZCezqbPyFVKU/sobjG33/b/w/u0HicHX8A9DTlLxDzoqzUXZQpXC7+c4YZXk2bj5mnZpU0Brzm3+ijDKGl8+3yQd8fDKFTyquFcBr791rUnAZLLhPBmZtA01F5vbZ9Mk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(366016)(1800799024)(7416014)(376014)(18002099003)(6133799003)(261009221227099003)(261009223027099003)(3023799007)(260925022911599003)(11063799006)(260925021911599003)(56012099006)(260925021311599003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(38070700021)(261102124527099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTlOWEQrdWtUSzZ5dVN4U0FCaFEzUWwxNDdONU5zSnYwd29WYVZPWSt4cld6?=
 =?utf-8?B?d3ozbkNlNys1aUtVM3hsWmFpa056RkU1bW1EdVYrYk9kTVRReWd5cGU5L0Qy?=
 =?utf-8?B?SkZVYXdsM1pUUkkrMDB0U0o2OGtMbFR1K28wMS9hdW50MWovUW1VTWxnTVRR?=
 =?utf-8?B?d0FjSUU1V3V5WVVQeEZSYzBGdzVuVDhXMi82YXIxclQxekpPQm9ZZTZiNU5G?=
 =?utf-8?B?aDB2a1dzT25OWnlIN3RTbTJOVDFWd3BHQWFiekl3MXdYUHVnT3VWVEY2M3Yw?=
 =?utf-8?B?VmR2TjE3K1d5dFdVK3pNbUYzN1AyU21yNE5uMzlNb1ZDN0QzVWpPTWQ5eU5X?=
 =?utf-8?B?NVZZYlJXUzZRaDFBY2hGVC9QNjAzZUhUZ2UwV05JYVdER1p5MjNrQVU1aTho?=
 =?utf-8?B?TnRoazRQZW5uV2dBaGViQ0F3eTZ2Q25xdG9QMGpCYzRGWTF6RTVSRHF3TUFE?=
 =?utf-8?B?ckdrY3NFKzQwcW83a0xiSHVUOWRpNDhnWkU3bGhqNjJhc01tS3VjbjRkS0x0?=
 =?utf-8?B?NzRTbDByOWY3Mi8vYTI0QVVNWW0wQ01NS0orTVEyRThEUGY3UlE3bkFzQWs0?=
 =?utf-8?B?d3ovRG1xR0g1ZVNVM29ydTNrUEtjU0FKUWtUYVhRaFc4TFdEd0c5ZitMU3cz?=
 =?utf-8?B?ZFJyZlFvTkNyb3k3K1VMNW1DYklUandXK05vMG9EN1Nab1dyVjZXRHNPcGpn?=
 =?utf-8?B?cTBjWnlndzJuQVNuV2p4MUNIL0IyTGM3d2lpVkpwQU1qY2NtREZwTTk5ajdH?=
 =?utf-8?B?TERjZy9HOUlvYkxRa2thcVU5ZjNjOFI3U3Mxam8wSmhDNEllNGZYRmlTVDl3?=
 =?utf-8?B?MEh1M0ora09QYlpsVlQ3ZTB5QlpnaVJJMjR0U0RCOWM0SlU2VGpsNEI3RVkv?=
 =?utf-8?B?S3FLVHlweVM5WlpPV0NFU3c4MTFEVllhakpwMXhWc3AvdmdORVp1R29UcURt?=
 =?utf-8?B?aWRMRUg3ZXUxdDdDOUh2dGxLb0FqR1B6Z0pDRmd3cWo0djdIZm9nOFY1VVhC?=
 =?utf-8?B?RG45Y3RpSjBYaEFUK1dFTkI3ZFhJMElGSUhmRnZyTUh2ejBFL2w3ajlmUWNn?=
 =?utf-8?B?ME1EZGVRd0RmVmdyclByek9yU1Q0L1RVS0JHTGxUU2NrWnpPM0EvZWxUcjJu?=
 =?utf-8?B?SkI5RC94ZEE4SXdjOVhhTWYySUllOUpESzZOK1BseC9TMEJ2S01BcEZhdW5v?=
 =?utf-8?B?VHdGWmlDNGpPb1ZBZTNUNUMrU0tJaWp6RHV0elMyN1dvcHhDMXBhYzhvVTVU?=
 =?utf-8?B?cCszZk1GMVpXMGk0K0djVTJubFlKWTR6cGZZN3NIaVJXYXM0ei95VmViSld0?=
 =?utf-8?B?TVpYeThxZC9IVWtPZTRwN21zMVhBYW9RcW56Q1RQK3FIOXBRM1oyaHduL3BK?=
 =?utf-8?B?V2FTd3hnOXZSV0RCanNhNGJYWWdFSGQzSjNWRXFxaDVTM3NZTHBGZHg3VDJk?=
 =?utf-8?B?Mm51dlBrUXRCQ3hsMC9NT29OZkJlN28ydXo0d2VYazZmMmhCM2lFN0ZyYnho?=
 =?utf-8?B?eTRsQ2NhUDVYOTM4N0hORlY0eU9Lb0ZFdzlkTTNhbkNBaUpleTJJSDBSU01p?=
 =?utf-8?B?U29menlKeHFTYWlFTkVLdkhXbUVXbG1qd1N5NEJtOWo1SWdmRjlpQmdYaExI?=
 =?utf-8?B?cHZIUWNHS2pCYi8yMTFuQ3ZVTjk2aEJoRGlGWU9FNkFhMnczcE51bVMwb2Mv?=
 =?utf-8?B?b2x3TURHTDhpK3dSbmEzNnlCMnNhUUEwUFpiWmZ4NXFVQVQrYVR6T2Q5RGZH?=
 =?utf-8?B?YlF6Wk9henZSWlc5LzRCMXlmZHdhY3ZRa2xjc3Zkdyt0V1FmMHV0bWZhS1g5?=
 =?utf-8?B?clJ2bWI4ZVc3eXArQzMwMXMzR2Z4VHNlVGdYYjRhQ0xvY20rZnZMMi93czRC?=
 =?utf-8?B?bUZ3T0grVG5nZTgreHo0eENueGVrcWd6ZGFYVFRmU0lITDVRNGRyRExINFhJ?=
 =?utf-8?B?US96Y1dSdXVyalBtc2V2OEp0K3d4bnhuQyttRFV1V2ZacWd5QWRiL3kySURN?=
 =?utf-8?B?czFNMkhRVEoyWnA3YndkUnNPOS9yT24zWFE2dmsrTUx4cEZMWStvTVRmemhm?=
 =?utf-8?B?VnppbjhoNklNUDZXTmxSVFplWkhZQ3B0VEFZNTlOUjUxcGMxUSt2SW8zMlE1?=
 =?utf-8?B?T2RIcFJESGV1WWJDZHlraStmeTlwYWJOWkU4aTJuK3lVVzBBZko3VU40VUhn?=
 =?utf-8?B?dnZtZ2pBeTloeGVFV1ArQ2dKSnNLbHlHSG8vWUtMbVFnOTlrbjZrNDBFT2ww?=
 =?utf-8?B?RXhoYWFpQ0NYbzdyOFlkd2d1OVBZbWJ1SityTEk4bUFFdk9oRUhaWEZTc1RP?=
 =?utf-8?B?QnBLRjVwVFBIelBmd2VLZjZ5VXY5UDhSNE9ZMDdZaWtnM3JyU0tlMm03bldh?=
 =?utf-8?Q?oVCudvPflI1CXbpM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab8aa0e-5afb-4495-9e96-08df44e1faa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 19:35:47.2653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0X1C5h2UtYVs7ybfif0uhgfQMZuGwWjmPfMsPQb/nLaGqMkKSBlBdvsyGktr5xyt7BFoAzR6ZaK/+UWCbHL55BJGbrrrYbVJZZ1OLOx4iA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR03MB395035
X-purgate-ID: tlsNG-c201ff/1794944150-F5EA92A1-A638E30D/0/0
X-purgate-type: clean
X-purgate-size: 7468
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUlTUkEgQyBSdWxlIDEwLjEgc3RhdGVzOiAiT3BlcmFuZHMgc2hhbGwgbm90IGJlIG9mIGFuIGlu
YXBwcm9wcmlhdGUNCmVzc2VudGlhbCB0eXBlIi4NCg0KVGhlIHJlc3VsdCBvZiByZWxhdGlvbmFs
LCBlcXVhbGl0eSBhbmQgbG9naWNhbCBuZWdhdGlvbiBvcGVyYXRvcnMgaGFzDQp0eXBlIGludCBh
bmQgdmFsdWUgMCBvciAxIChDOTkgNi41LjhwNiwgNi41LjlwMywgNi41LjMuM3A1KS4gQW4gb2Jq
ZWN0DQpvciBmdW5jdGlvbiByZXN1bHQgb2YgdHlwZSBib29sIGhhcyB2YWx1ZSAwIG9yIDEgdG9v
LCBhbmQgaXQgaXMNCnByb21vdGVkIHRvIGludCAoQzk5IDYuMy4xLjIsIDYuMy4xLjFwMikuIFVz
aW5nIHRoYXQgdmFsdWUgYXMgYW4NCm9wZXJhbmQgb2YgdW5hcnkgKywgLSwgYmluYXJ5ICssIC0s
ICosIDw8LCA+PiBhbmQgb2YgKz0sIC09LCAqPSwNCjw8PSwgPj49IGlzIHdlbGwtZGVmaW5lZC4g
RGl2aXNpb24sIHJlbWFpbmRlciwgdGhlIHJlbGF0aW9uYWwNCm9wZXJhdG9ycywgaW5jcmVtZW50
IGFuZCBkZWNyZW1lbnQgc3RheSBjb3ZlcmVkIGJ5IHRoZSBydWxlLg0KDQpVcGRhdGUgdGhlIEVD
TEFJUiBjb25maWd1cmF0aW9uIHRvIHRhZyB0aGUgYWNjZXB0ZWQgdXNlcyBhcyBzYWZlLg0KVXBk
YXRlIGRldmlhdGlvbnMucnN0IGFuZCBydWxlcy5yc3QgYWNjb3JkaW5nbHkuDQoNClNpZ25lZC1v
ZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQot
LS0NClRlc3QgQ0kgcGlwZWxpbmU6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVv
cGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzMwODA0NTkwMTMNCg0KQ2hhbmdlcyBpbiB2
MzoNCi0gaW5jbHVkZSB1bmFyeSArIGFuZCAtDQotIGRyb3AgcmVsYXRpb25hbCBvcGVyYXRvcnMN
Ci0gc3BsaXQgdGhlIEVDTEFJUiBjb25maWcgaW50byBvbmUgY2xhdXNlIHBlciBvcGVyYXRvciBn
cm91cCBmb3INCiAgcmVhZGFiaWxpdHkNCi0tLQ0KIC4uLi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlS
L2RldmlhdGlvbnMuZWNsICAgICB8ICA5ICsrKysrKysrKw0KIGRvY3MvbWlzcmEvZGV2aWF0aW9u
cy5yc3QgICAgICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysNCiBkb2Nz
L21pc3JhL3J1bGVzLnJzdCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysrDQogMyBm
aWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9u
L2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wgYi9hdXRvbWF0aW9uL2VjbGFp
cl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCmluZGV4IGQ0OWFmNTMwNTUuLmUyMmEw
NWEyMWIgMTAwNjQ0DQotLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2
aWF0aW9ucy5lY2wNCisrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZp
YXRpb25zLmVjbA0KQEAgLTM0MSw2ICszNDEsMTUgQEAgc3RpbGwgbm9uLW5lZ2F0aXZlLiINCiAt
Y29uZmlnPU1DM0EyLlIxMC4xLGV0eXBlcys9e3NhZmUsICJzdG10KG9wZXJhdG9yKGxvZ2ljYWwp
fHxub2RlKGNvbmRpdGlvbmFsX29wZXJhdG9yfHxiaW5hcnlfY29uZGl0aW9uYWxfb3BlcmF0b3Ip
KSIsICJkc3RfdHlwZShlYm9vbHx8Ym9vbGVhbikifQ0KIC1kb2NfZW5kDQogDQorLWRvY19iZWdp
bj0iQSAwLW9yLTEgQm9vbGVhbiBvcGVyYW5kIG9mIHVuYXJ5ICssIC0sIGJpbmFyeSArLCAtLCAq
LCA8PCwgPj4gYW5kIG9mICs9LCAtPSwgKj0sIDw8PSwgPj49IGlzIHNhZmUuIFNlZSBkb2NzL21p
c3JhL2RldmlhdGlvbnMucnN0IGZvciB0aGUgZnVsbCBleHBsYW5hdGlvbi4iDQorLWNvbmZpZz1N
QzNBMi5SMTAuMSxldHlwZXMrPXtzYWZlLCAic3RtdChvcGVyYXRvcihwbHVzfHxtaW51cykpIiwg
InNyY190eXBlKGVib29sfHxib29sZWFuKSJ9DQorLWNvbmZpZz1NQzNBMi5SMTAuMSxldHlwZXMr
PXtzYWZlLCAic3RtdChvcGVyYXRvcihhZGR8fGFkZF9hc3NpZ24pKSIsICJzcmNfdHlwZShlYm9v
bHx8Ym9vbGVhbikifQ0KKy1jb25maWc9TUMzQTIuUjEwLjEsZXR5cGVzKz17c2FmZSwgInN0bXQo
b3BlcmF0b3Ioc3VifHxzdWJfYXNzaWduKSkiLCAic3JjX3R5cGUoZWJvb2x8fGJvb2xlYW4pIn0N
CistY29uZmlnPU1DM0EyLlIxMC4xLGV0eXBlcys9e3NhZmUsICJzdG10KG9wZXJhdG9yKG11bHx8
bXVsX2Fzc2lnbikpIiwgInNyY190eXBlKGVib29sfHxib29sZWFuKSJ9DQorLWNvbmZpZz1NQzNB
Mi5SMTAuMSxldHlwZXMrPXtzYWZlLCAic3RtdChvcGVyYXRvcihzaGx8fHNobF9hc3NpZ24pKSIs
ICJzcmNfdHlwZShlYm9vbHx8Ym9vbGVhbikifQ0KKy1jb25maWc9TUMzQTIuUjEwLjEsZXR5cGVz
Kz17c2FmZSwgInN0bXQob3BlcmF0b3Ioc2hyfHxzaHJfYXNzaWduKSkiLCAic3JjX3R5cGUoZWJv
b2x8fGJvb2xlYW4pIn0NCistZG9jX2VuZA0KKw0KIC1kb2NfYmVnaW49IlRoZSBtYWNybyBJU09M
QVRFX0xTQiBlbmNhcHN1bGF0ZXMgYSB3ZWxsLWtub3duIHBhdHRlcm4gdG8gb2J0YWluDQogYSBt
YXNrIHdoZXJlIG9ubHkgdGhlIGxvd2VzdCBiaXQgc2V0IGluIHRoZSBhcmd1bWVudCBpcyBzZXQs
IGlmIGFueSwgZm9yIHVuc2lnbmVkDQogaW50ZWdlcnMgYXJndW1lbnRzIG9uIHR3bydzIGNvbXBs
ZW1lbnQgYXJjaGl0ZWN0dXJlcw0KZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5y
c3QgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQppbmRleCA3Yjk4M2RiMjY0Li42NDU4YTc5
YTY3IDEwMDY0NA0KLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KKysrIGIvZG9jcy9t
aXNyYS9kZXZpYXRpb25zLnJzdA0KQEAgLTM1NSw2ICszNTUsMjYgQEAgRGV2aWF0aW9ucyByZWxh
dGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCiAgICAgICAgd2VsbC1rbm93biB0byBhbGwgWGVu
IGRldmVsb3BlcnMgdG8gYmUgYSBjb21wYXJpc29uIHdpdGggMC4NCiAgICAgIC0gVGFnZ2VkIGFz
IGBzYWZlYCBmb3IgRUNMQUlSLg0KIA0KKyAgICogLSBSMTAuMQ0KKyAgICAgLSBUaGUgcmVzdWx0
IG9mIHJlbGF0aW9uYWwsIGVxdWFsaXR5IGFuZCBsb2dpY2FsIG5lZ2F0aW9uIG9wZXJhdG9ycyBo
YXMNCisgICAgICAgdHlwZSBpbnQgYW5kIHZhbHVlIDAgb3IgMSAoQzk5IDYuNS44cDYsIDYuNS45
cDMsIDYuNS4zLjNwNSkuIEFuIG9iamVjdA0KKyAgICAgICBvciBmdW5jdGlvbiByZXN1bHQgb2Yg
dHlwZSBib29sIGhhcyB2YWx1ZSAwIG9yIDEgdG9vLCBhbmQgaXQgaXMNCisgICAgICAgcHJvbW90
ZWQgdG8gaW50IChDOTkgNi4zLjEuMiwgNi4zLjEuMXAyKS4gU3VjaCBhIHZhbHVlIGlzIGENCisg
ICAgICAgd2VsbC1kZWZpbmVkIG9wZXJhbmQgb2YgdGhlIGZvbGxvd2luZyBvcGVyYXRvcnMuIFVu
YXJ5ICsgbGVhdmVzIGl0DQorICAgICAgIHVuY2hhbmdlZC4gVW5hcnkgLSB5aWVsZHMgMCBvciAt
MSwgYWxsIGJpdHMgY2xlYXIgb3IsIGluIHR3bydzDQorICAgICAgIGNvbXBsZW1lbnQsIGFsbCBi
aXRzIHNldC4gQmluYXJ5ICsgYW5kIC0gKGFuZCArPSBhbmQgLT0pIGNvdW50DQorICAgICAgIHNv
bWV0aGluZyBpZiB0aGUgY29uZGl0aW9uIGhvbGRzLiBcKiAoYW5kIFwqPSkgeWllbGRzIHRoZSBv
dGhlciBvcGVyYW5kDQorICAgICAgIGlmIHRoZSBjb25kaXRpb24gaG9sZHMgYW5kIDAgb3RoZXJ3
aXNlLiA8PCBhbmQgPj4gKGFuZCA8PD0gYW5kID4+PSkNCisgICAgICAgZXh0ZW5kIHRoYXQgc2Vs
ZWN0aW9uIHRvIGEgc2hpZnQ6IGEgQm9vbGVhbiBsZWZ0IG9wZXJhbmQgY29udHJpYnV0ZXMgMA0K
KyAgICAgICBvciAxLCBhbmQgYSBCb29sZWFuIHJpZ2h0IG9wZXJhbmQgaXMgYSBzaGlmdCBjb3Vu
dCBvZiAwIG9yIDEuIC8gYW5kICUNCisgICAgICAgKGFuZCAvPSBhbmQgJT0pIGFyZSBleGNsdWRl
ZC4gQSBCb29sZWFuIGRpdmlzb3IgaXMgMCB3aGVuIHRoZSBjb25kaXRpb24NCisgICAgICAgaXMg
ZmFsc2UsIGFuZCBkaXZpc2lvbiBvciByZW1haW5kZXIgYnkgemVybyBpcyB1bmRlZmluZWQgYmVo
YXZpb3INCisgICAgICAgKEM5OSA2LjUuNXA1KS4gVGhlIHJlbGF0aW9uYWwgb3BlcmF0b3JzIGFy
ZSBleGNsdWRlZCBhcyB3ZWxsOiB3aXRoDQorICAgICAgIDAtb3ItMSBvcGVyYW5kcywgd2hhdGV2
ZXIgdGhleSBleHByZXNzIGNhbiBiZSB3cml0dGVuIHdpdGggdGhlIGVxdWFsaXR5DQorICAgICAg
IGFuZCBsb2dpY2FsIG9wZXJhdG9ycywgd2hpY2ggYWxyZWFkeSBhY2NlcHQgYW4gZXNzZW50aWFs
bHkgQm9vbGVhbg0KKyAgICAgICBvcGVyYW5kLiBJbmNyZW1lbnQgYW5kIGRlY3JlbWVudCBzdGF5
IHVuZGVyIHRoZSBydWxlLg0KKyAgICAgLSBUYWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQor
DQogICAgKiAtIFIxMC4xDQogICAgICAtIFhlbiBvbmx5IHN1cHBvcnRzIGFyY2hpdGVjdHVyZXMg
d2hlcmUgc2lnbmVkIGludGVnZXJzIGFyZSByZXByZXNlbnRlbmQNCiAgICAgICAgdXNpbmcgdHdv
J3MgY29tcGxlbWVudCBhbmQgYWxsIHRoZSBYZW4gZGV2ZWxvcGVycyBhcmUgYXdhcmUgb2YgdGhp
cy4gRm9yDQpkaWZmIC0tZ2l0IGEvZG9jcy9taXNyYS9ydWxlcy5yc3QgYi9kb2NzL21pc3JhL3J1
bGVzLnJzdA0KaW5kZXggN2UxOTFhMGQ0YS4uYzA3NWZlMjM5MSAxMDA2NDQNCi0tLSBhL2RvY3Mv
bWlzcmEvcnVsZXMucnN0DQorKysgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0KQEAgLTM4Nyw2ICsz
ODcsMTAgQEAgbWFpbnRhaW5lcnMgaWYgeW91IHdhbnQgdG8gc3VnZ2VzdCBhIGNoYW5nZS4NCiAg
ICAgICAgICAgIGNvbXBpbGVycycgZXh0ZW5zaW9ucykNCiAgICAgICAgICAtIEltcGxpY2l0IGNv
bnZlcnNpb25zIHRvIGJvb2xlYW4gZm9yIGNvbmRpdGlvbmFscyAoPzogaWYgd2hpbGUNCiAgICAg
ICAgICAgIGZvcikgYW5kIGxvZ2ljYWwgb3BlcmF0b3JzICghIHx8ICYmKQ0KKyAgICAgICAgIC0g
T3BlcmFuZHMgb2YgZXNzZW50aWFsbHkgQm9vbGVhbiB0eXBlIChyZXN1bHRzIG9mIHJlbGF0aW9u
YWwsDQorICAgICAgICAgICBlcXVhbGl0eSBhbmQgbG9naWNhbCBuZWdhdGlvbiBvcGVyYXRvcnMs
IG9iamVjdHMgYW5kIGZ1bmN0aW9uDQorICAgICAgICAgICByZXN1bHRzIG9mIHR5cGUgYm9vbCkg
dXNlZCBvbmx5IHdpdGggdW5hcnkgKywgLSwgYmluYXJ5ICssIC0sDQorICAgICAgICAgICBcKiwg
PDwsID4+LCArPSwgLT0sIFwqPSwgPDw9IGFuZCA+Pj0NCiAgICAgICAgICAtIFRoZSBlc3NlbnRp
YWwgdHlwZSBtb2RlbCBhbGxvd3MgdGhlIGNvbnN0YW50cyBkZWZpbmVkIGJ5IGFub255bW91cw0K
ICAgICAgICAgICAgZW51bXMgKGUuZy4sIGVudW0geyBBLCBCLCBDIH0pIHRvIGJlIHVzZWQgYXMg
b3BlcmFuZHMgdG8gYXJpdGhtZXRpYw0KICAgICAgICAgICAgb3BlcmF0b3JzLCBhcyB0aGV5IGhh
dmUgYSBzaWduZWQgZXNzZW50aWFsIHR5cGUuDQotLSANCjIuNDMuMA0K

