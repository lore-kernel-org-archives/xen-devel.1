Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A148CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 16:09:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441636.1659233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE7je-0001A8-Gd; Tue, 06 Oct 2026 16:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441636.1659233; Tue, 06 Oct 2026 16:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE7je-0001A1-Cv; Tue, 06 Oct 2026 16:09:46 +0000
Received: by outflank-mailman (input) for mailman id 1441636;
 Tue, 06 Oct 2026 16:09:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xE7jc-00019v-PF
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 16:09:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE7jb-00HFSK-Sp
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 18:09:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac51d40-e002-0a2a0a5209dd-0a2a450690d6-18
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 18:09:43 +0200
Received: from [52.101.65.77]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac51d47-195a-0a2a45060019-3465414d6bed-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 18:09:43 +0200
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com (2603:10a6:102:1da::11)
 by AS8PR03MB9048.eurprd03.prod.outlook.com (2603:10a6:20b:5b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 16:09:39 +0000
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e]) by PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e%3]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 16:09:39 +0000
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
 b=QuhTykO0jnXr3NrvfIiFbq+6X0j72RD3sPSUKtVhOsBAU9ip8tVq7R7afAuTNla3S1bNnsrmEoSI5NFOPHlZGw2xFC7+A15auiJZJoVstMYbRCAv0BeZ7pTxpqrehrxqkTDdtjI0RIteuXZCOMPSiUNUNFcpDe2CwOFrAl9BNxruBMuHIBKfMYf2LTvaZp/BrJbTWN6bOsjYT+GuoLtVy3OhWCEYDhUfKhOtjqN4Wy4e3TFK+P9NcqgqNhzmEn7VvnenNM64EGtHZj+DKC8EQnZSQvur5qJTxougUQplsfjpf4k5OdteJF7a28eykLBUyb8PYChtOJ8q6Jt/p1EOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqeqPmRIP55qeuFGubxWMpyfNYitvyBVmzEDNyDZ9QU=;
 b=nCFyOXw9vJJY1qmv6IE6SFYnPcvx7zVVBADbqOT9i/jGuGhY+SB7919jpYYQN717IxDAPI46G6BVtP2y6KrQgMOvgumQ1Y6sEayFeZTekCA5kGCU4nmgrd0FdhUZGqYC/qvkkyhT8/iFhKtr19ORDDZ4oblhpDPKHIbKxx8rzbZFaRkoQ/YIhp8C88YOh257Z3Ve1FOdtbjOqp9gZ+mh4lIUDaBnbCcxKg+uYsN5WOaxOw4B91/8ap2611PKuW/+Rql1q/eG6UAWOfm6NChpmvCv8B1ZSGHMfdalV5OqtyYHSovHy3PrEgsf7PaLOaxGR7Xw63CXiPulvoHHy+KNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqeqPmRIP55qeuFGubxWMpyfNYitvyBVmzEDNyDZ9QU=;
 b=AaVpjb3j472fILMtW1f6nAYBChc/XAjPDZk0c6qKpYuVzkt/E8DNMCtqBu3+FcaTrDuFttYHwUiilTgZujgy311KRk3JW1CYo2eMTBnGyRpmMvhXqbIQoqWvkpWrNLyaPjY4EYSuPNujcutUTn2KegT0yAOgDnkQeUXmamfBUW5ydeD2AHJdz7Iv6NWQ0NZ3UNIwHTe2gblyWDWaSGSpk6VyttLip+t1iARgBr6CYVTQpY11uDpI8Zo111vPUTkZ6n4CNV4H6FM2G4CTqL6qbsVJOQIqcK6EZEIwzyoWhne+tKGa4QHwNMuZdRUdfCw27FqvdAzJMTcrITZtluZAuA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdVZ47rgN8qfc/LUyZracn12XLU7bwnI6AgAASYQA=
Date: Tue, 6 Oct 2026 16:09:39 +0000
Message-ID: <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
References:
 <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
 <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
In-Reply-To: <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR03MB7531:EE_|AS8PR03MB9048:EE_
x-ms-office365-filtering-correlation-id: 53dd9a2c-476f-4054-559e-08df23c4398b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4133799003|38070700021|4143699003|260925021911599003|260925022911599003|260925021311599003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info:
 vLbLxmB4TkSIB3vFnrKIVYiKq5dC9EdyFKFJD13w8EOzZjlzsOKtUV0v/tE2mCxpUozJJVlUFGLygCUtmQFPWAGdsFSxwjsPunSoIpAeRMwaHaK3bIpvGoOU6gCpURs3o2CKHOAubVx8HBflhsuJdqoRjUyJu+kb49N5YEfAnuAlrp8ifY89TnCYHgnumQ+50+I7bCkIRkz4SWzAE1ZSYqoInQOXMj3oMEYVz5bAIUEvjYvl9QCLCsvTelSkewwxXGfprxnb7w+8wBURum+VAPUDgoo6zPtqRT0K5Y8MRuRbS2168gGKMDkU1zLoK2smpJg3v+/3tiRtqU78jWgaBxwMY1YuKLlB9uV1aVLtInmg1acouK6u4sLdG4oSTpUtuOu15wBwUziidH6IJ+YWJutJn+QgvOs/Gu0cTez3un5Sx9z5ZFnXw5Ge8PL5OCF1W1pXzkZ+6W4Ch1hkIiOeoONzCBEZ0y/MNxEntCNWXH0x8RZSvBtx46HXHDIS8Fb12iWHkts0DI7S6f1lMFp/JHBSRbOFPjYFvWMx0gWRozkQ5I3zh9G0apCzDBD0ky1j0t/WjcN7xgJh4NApsURZNszL/qU5JSOatfCjxjjTpDbWZzG5qaj3WnPQNdUshkURtvpSsssusIFS0opy0qqINJv4RkJEKOAPBZC5js1JuLE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4133799003)(38070700021)(4143699003)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkVxdHo5cVBTcGhUdVliSmppSXBjTGZXWnRoV1RCRkFQT3JQRy8zMlI0Tlhj?=
 =?utf-8?B?dGgrc1ZsNStOYS9Uc1ZCQlNPZ1F0Q3dDUDdUZG13Q2d1NGhPNjk3dWllUlVm?=
 =?utf-8?B?SVR3R0h1blp3YmtpVjNqMWdVZkdXMUdHOG1XcyswaGU2MXRUN1ZNMkl1T2Zm?=
 =?utf-8?B?Mm1CVDNCbTdSTDBQZjVibXBOTytrQmJreGdHN200b0pyU25KVEEvNWczbVpV?=
 =?utf-8?B?a0F6Z3lyZ1kzQ3EwWDV6czRIRHkxOHVHWTZQQjJTQ2cxSVJFMUFPQWp2YWJt?=
 =?utf-8?B?c0Nad2VpS0VleW1Kc2pjRkFGOXprUEczWm5LaXBIM2V4emZDTVYxdzhXcE1r?=
 =?utf-8?B?aHlQMSs3NnNCM0Y2N0Z0YkpuS3hzZldXV3BtT2NpdmZpbkR0dVJLS3M1TGMr?=
 =?utf-8?B?TXlGa1cvaFJXemd4N3FTRWpYTkZjVUF5VHJqb1l4NkVpZGJPUFJ2U2RTVjNM?=
 =?utf-8?B?VGFMaXZzYS90bzg4OStmMndzb2hpSVRTUW5KNTV0bUE4V3JTUDJtak40cTZN?=
 =?utf-8?B?SDBodnNnd01wdTZvRGYzcCs2TXEzT3pPVE1JeDZWaGdLNHpENVhEclFCRTZN?=
 =?utf-8?B?S1RSTTRyemgya0NSaGpTQXgxcndlTmRqMmdKc3hyOEt3MGxzd3BuUWdtaDdl?=
 =?utf-8?B?VjNGTldJdGdleDNJTUhKcEthejBhV3ExRGc3RGNjeHEzbEl4c1lLd2tkSHZU?=
 =?utf-8?B?TitEbm11RjNzdGw5djIxaTVjWVU1em0yVkFlUDFPWVdNTHNlSk84Z2dnU0tT?=
 =?utf-8?B?d0Zlckl2RXNrNnVCNzZjWm5YbGU3MHhSVFdQdjNraEU5MEI3RGdWNjRldkxp?=
 =?utf-8?B?bFMrMUJsZG5XdzJnZHY3VUNLZ01MTy9ZVmh5UVJzWkM0ZGlPejhQdWYvMlhW?=
 =?utf-8?B?d0tYcTUxVy9HekhXTnhCZjJVZ1RBY3ZQbHpha3UwMzB5dTJmQTI5T3FrTUhj?=
 =?utf-8?B?aXNXTmp4aTdRbDRtbTJESGtLR2Jkdi9WeDFDc3A2Z0FoYTRDb3ZERGN5bU4z?=
 =?utf-8?B?S0xlRXN6WVVzeWp6NWNLdWc4dTlVQjJ1a3hib3lJR2EveTZFc2hyaDhNT05v?=
 =?utf-8?B?V3RiSHkzNWY0V3NZV0ZkM0dqdXlXdEYwMkZ0UFhJcTdyWmxvbEdYS25uQ0lK?=
 =?utf-8?B?bm5SN25OLzJwM0hUQXh5YW5HdkJGSTNBTzFLQUU0UXQzbGVjVW5VUnVqT3Fs?=
 =?utf-8?B?K2g0Y0YyeWRVUE5CZjN2cG05VUZIRGhLUm0yTjA4MTZycVU5aHR4L0txcjdK?=
 =?utf-8?B?VXBPdXR5OWt6VHBET2pnNmRxMmZpK3E3VGpnNlRTeXNwd00wTDhXOG5NVUgy?=
 =?utf-8?B?blhtWWdRNUsxZXM4c094aEVUVDhOaWNxY0p1dnhxTUtCL29ya1ZkK2xGdUd0?=
 =?utf-8?B?N3pMTDFINFNQOHZQd3RBQVVJUGpXYjdleWduaU1yRGwvVmRyVlAxczJ4bVlw?=
 =?utf-8?B?Z3hlcjZJUDZqMGxSM3hvTkwyZVRRYlpKclZHN0Fuc3ZtMHM5Q3djNU1aWUlm?=
 =?utf-8?B?VDVEb0oyZk9PeGpJR3lqMmUvNkNRY3ZkYVYrOGR0ZkZ4d0dtVGdFN1FuT2xr?=
 =?utf-8?B?SGNrRHEwdTdBR2FDOE5MajhvZEljWmpZL1h3NjlXeURTbENUVUErSms3eldq?=
 =?utf-8?B?eHlsNDN5ejBINWhrMmJOOHQwSk4rWGp4Y2o3aTBNWnRHamw4Ym40UkZlM3RB?=
 =?utf-8?B?UGNhalpEUDhXK080YWJSdWU4cjZXMWkvUU9GeHJFTHJ6QXQ5TlBBRWVyR0ha?=
 =?utf-8?B?VnhkdWFoZ3A2THU3Z3ZFSWE1cUd3VGhNdnJxazFPR1dkV25xZUhTVlI4b2Y4?=
 =?utf-8?B?SnRYZ2RkOFJIaDZBYTg4aE1GWjZiL2hIMkRXd1JPZTNIMlphM3NPY3dNZHA2?=
 =?utf-8?B?bVpkbkt3OXYzaDhDQXU0cWx3Z3lFMzF6Y0p2bWZTY1lSVDdtdjAzQ0tHSDRJ?=
 =?utf-8?B?aFN2NUlUdWM0aHM3c25IY0M3d1BDYXVuSGZUbk0xZFQwelg2THlwRHlhcEJ2?=
 =?utf-8?B?aWJrUDRmTEtHQzg2WE1KNGpJMld2b3NlWnpSMDVMZytDY0NpTHZBa2NieHRF?=
 =?utf-8?B?S3RidHU0WGxlV0VzSm9mMHBoRDNFS3hiaTYyOEgvMXJ3TVhUY3JQT2V1Nk5a?=
 =?utf-8?B?MlBiaTBobDRaMDdTK1ZGVTdFd2E2YkczcmVMUnV4eTMxWDJqOHVzeXdQN3ZB?=
 =?utf-8?B?Qm1IbjJvVnY2U3AyL3k5TkpoS3AwNVFaV244V2YySFdsWXhJYjZxdTdJeUhm?=
 =?utf-8?B?Mmt0Mk0xeUJXQ0tscDlXSFpYaUorY1JaeVhmb2htK1E1NHZYRkJPNmloaG1q?=
 =?utf-8?B?MjVRYVpDREhEb3NGYURnWHZuZnJpc2ptVjRkUkxWa0UrOVh1MkMwcU9OcS9Z?=
 =?utf-8?Q?0vpgLvR0sGsBQ3rA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F023B017F868D046826F6D10C262A03F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dd9a2c-476f-4054-559e-08df23c4398b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 16:09:39.5336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ex+7zU8fd6d0hS6g0Q3e0SKXfoXOYKELn8ZD9KNmexjAU3c/dBL6rRffZwb7Mwbqy/oBHUYAyRyP8UbbFSFAQ01s17WfudXdyZZ2xVeRhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9048
X-purgate-ID: tlsNG-16d1c6/1791302983-FC80577B-8AB3F8CB/0/0
X-purgate-type: clean
X-purgate-size: 2502

DQoNCk9uIDEwLzYvMjYgMTg6MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMC4yMDI2
IDE2OjIzLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBIaWRpbmcgLnhlbi1zeW1zLlsw
MTNdIGFzc3VtZWQgdGhlIGFsbW9zdC1maW5hbCBpbWFnZSBpcyBhbHdheXMgcGFzcyAyLg0KPj4g
T24geDg2IExBU1RfTElOS0lOR19QQVNTIGlzIDIsIHNvIC54ZW4tc3ltcy4yIHN0YXlzIHZpc2li
bGUuIE9uIEFybQ0KPj4gTEFTVF9MSU5LSU5HX1BBU1MgaXMgMyBhbmQgdGhlIGZpbmFsIGltYWdl
IGlzIC54ZW4tc3ltcy4zLCB3aGljaCB3YXMNCj4+IGhpZGRlbi4gUGFzcyAyIGlzIHVzdWFsbHkg
b25seSBhIHN5bWxpbmssIHNvIEVjbGFpciBzYXcgbm8gcHJvZ3JhbSBsaW5rDQo+PiBhbmQgcmVw
b3J0ZWQgZXZlcnkgdHJhbnNsYXRpb24gdW5pdCBhcyB1bnJlYWNoYWJsZS4NCj4NCj4gV2hlbiBJ
IGRpZCB0aGF0IHdvcmssIHJ1bGUgMi4xIGVuZGVkIHVwIGNsZWFuIGZvciBib3RoIEFSTTY0LSog
YW5hbHlzaXMNCj4gam9icyAoaWlyYykuIFVwb24gcmUtY2hlY2tpbmcgSSBub3cgc2VlIHRoYXQg
QVJNNjQtYW1kIGhhcyAxNzcgdmlvbGF0aW9ucw0KPiAoYXBwYXJlbnRseSB0aGF0J3Mgd2hhdCB5
b3UgdGFsayBhYm91dCBhYm92ZSksIGJ1dCBBUk02NC1hbGxjb2RlIGhhcyBub25lDQo+IChodHRw
czovL2dpdGxhYi5jb20veGVuLXByb2plY3QvaGFyZHdhcmUveGVuLy0vcGlwZWxpbmVzLzI5MTY1
NjkyMzIpLg0KPg0KPj4gU3RvcCBoaWRpbmcgcGFzcyAzLiBQYXNzZXMgMCBhbmQgMSByZW1haW4g
ZXhjbHVkZWQuDQo+DQo+IFRoaXMgd2lsbCBjYXVzZSBzY2FubmluZyBvZiBib3RoIHBhc3NlcyAy
IGFuZCAzLCBpLmUuIGNvbnN1bWUgbW9yZSB0aW1lDQo+IGFuZCByZXBvcnQgZHVwbGljYXRlIHZp
b2xhdGlvbnMgd2hlbiBib3RoIHBhc3NlcyBhcmUgcmVhbCBsaW5raW5nIHN0ZXBzLg0KPiBJIHRo
aW5rIHdlIHdhbnQgdG8gYmUgc21hcnRlciB0aGFuIHRoYXQsIHRvIHJlYWxseSBzY2FuIGV4YWN0
bHkgb25jZS4gSQ0KPiBkb24ndCBoYXZlIGEgZ29vZCBpZGVhIGp1c3QgeWV0IGhvdyB0byBhY2hp
ZXZlIHRoYXQsIHRob3VnaCAoYW5kIEkgd2FzDQo+IHdvbmRlcmluZyBhbHJlYWR5IHdoZW4gcHV0
dGluZyB0b2dldGhlciB0aGUgb3JpZ2luYWwgcGF0Y2gpLg0KPg0KPiBKYW4NCg0KSG1tDQoNCkF0
IHRoZSBtb21lbnQNCihodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvaGFyZHdhcmUveGVu
Ly0vcGlwZWxpbmVzLzI5MTczNzU3NzMpIEkNCnNlZSBBUk02NCBSMi4xIHZpb2xhdGlvbnM6DQot
IDE3NyBpbiBBTUQNCi0gMjQ5IGluIGFsbGNvZGUNCg0KQW55d2F5LCB3ZSBjYW4gaGF2ZSBpZi1l
bHNlIGxpa2UgdGhpcyAoY29waWVkIGZyb20NCmF1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VD
TEFJUi90YWdnaW5nLmVjbCk6DQoNCi1zZXRxPXRhcmdldCxnZXRlbnYoIlhFTl9UQVJHRVRfQVJD
SCIpDQppZihzdHJpbmdfZXF1YWwodGFyZ2V0LCJ4ODZfNjQiKSwNCiAgICAgZmlsZV90YWcrKHsi
eGVuX3N5bXNfdG1wIiwgIl54ZW4vXFwueGVuLXN5bXNcXC5bMDEzXSQifSksDQogICAgIGlmKHN0
cmluZ19lcXVhbCh0YXJnZXQsImFybTY0IiksDQogICAgICAgICBmaWxlX3RhZysoeyJ4ZW5fc3lt
c190bXAiLCAiXnhlbi9cXC54ZW4tc3ltc1xcLlswMTJdJCJ9KQ0KICAgICApDQopDQoNCl5eXiB0
ZXN0IHBpcGVsaW5lIGlzIGhlcmU6DQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVv
cGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzI5MTg1NzE3NDkNCg0KQlIsIERteXRyby4N
Cg==

