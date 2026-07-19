Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3407EC4450A
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 00:44:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365738.1615939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlFd4-0004e8-1z; Sun, 19 Jul 2026 00:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365738.1615939; Sun, 19 Jul 2026 00:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlFd3-0004dw-Sp; Sun, 19 Jul 2026 00:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1365738;
 Sun, 19 Jul 2026 00:43:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlFd1-0004dq-BZ
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 00:43:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlFd0-00Ekjp-91
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 02:43:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5c1cf7-2eae-0a2a0a5409dd-0a2a4505e572-22
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 02:43:32 +0200
Received: from [52.101.125.139]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5c1db1-4cb1-0a2a45050019-34657d8ba413-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 02:43:32 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4124.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sun, 19 Jul
 2026 00:43:26 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.012; Sun, 19 Jul 2026
 00:43:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzoQhx5hLVi4r7Qa5axnDaaaNO/Q/t1cah913Uosgz1sZe7eOfEN1uQuljlzGR/ahrth+hcvPELWhaSFWx8iX+6ZlWebGhbBJvdfCDJamIj6M1q8iXBcaucLy7E4aNVgxwURTJK7BFiCuYnxSSGIQFC9voIDF9A+vmqey8ubkl2X0h2FwUvhacNmsBst+MGcHqlUoapCygUdMcKVaSX/GfAmDxr14M+79dbFolGpJpEa8If8vco+bJwhKCtQkp9jKNZ8aAajfs+i9+0RD99fqJyn2LMoySD4Wy34qySY3YioXMDGCbFo0008K6KMQV7cR/ByGKsebQlm8WVTIFwq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgzu3Bu1pfNzbm6mkbFKGzLJhXgLyCskZC6X/tBOrFc=;
 b=lbqeUtbRhCMi2o3hKjavhIK83fDnvhYx4wjmJJHkv164PqQQz7o+/71ku/vu3FsfCkvF0TSzKoeLGfxbNR2g2IZTFfjRCvN6JLMpO+YVfRyiR3dKTnvTzbUZGYcHcY10j9eWe39x/KHLq3KADDUra12CA8lHF2QDl3Vg8E0y7hwGyiJRiUPGlfoFCo1G+3yHbqnrKFaKhQMpZkzCgym5Ftt8B05vBOra2d/O2UeA+N612E2ztMjHO65UgdmGkRUrn0o/pzqrnW6azxRj5rqBanLPYXXtwEfxTVGeygRRd+W6NaZW/hI4qp2kt1UexZsEHsPilwDRcXkovoh0n3h+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgzu3Bu1pfNzbm6mkbFKGzLJhXgLyCskZC6X/tBOrFc=;
 b=JAoPIHx5EsYB40l+ECrmSOyc69jaKZRfX8dvXAIr5bf+wLNpcSeogXpPmGHxAxKU/0tqpKIP50qlICtsZjtEA9AwpzgkSljvXiAfZa41oO51IVOsX8SURQzgAm0PYuiUf3SdxgDSZkHqxtfHJja0aqD5pdFNMu2BMas1AjbsNsc=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdE33lRSerj/u3kU6sfibELhxcvrZwIjgAgAPc8jA=
Date: Sun, 19 Jul 2026 00:43:25 +0000
Message-ID:
 <OS9P286MB72226311D2F6D41A627F9D7D82C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-2-taka@valinux.co.jp>
 <e7eeeebc-5829-47db-96d0-2f804dcd4356@suse.com>
In-Reply-To: <e7eeeebc-5829-47db-96d0-2f804dcd4356@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS9P286MB4124:EE_
x-ms-office365-filtering-correlation-id: a23abced-2b92-4c8e-6954-08dee52ebe60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|4143699003|3023799007|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info:
 OFwlEM0HTfq5jur9Ep8oWPcPWCD7S1TmfMD9wzg2Ctu5Rmui9PTPdhzpzxRsmM9dMi7yeTyOGDpuV7XR2gmo9xwg1h0w3PDGqGiYIP5/tDS3TngnapTLsBVGayx6/KOODiH6awvYiX0cLFsLUnnQmRjmr7O/IfnwmCx2fGReObNPFBW11azo+cRud53+ROr3qxwTLeH5mc4ibCMN4A4c6dSj6NeURwGwKvEQZO1xVZTQ/0x0LvfQ2nrwpNmVrupB8lYQuFBJGt/cF6RKsxEkxN3aLAOilTph9WQKkz6OS3qQ/pPKwYsBTz3tlfN/v0dU8IypLmjlpxLtUhthY+dBrrQUChYn5OK0HyCdzwh+2JiQes+sNvcLLWDFFcCDvOqzn95uuG2eZzW+LDHIa68VL0nX+7hTDnTpRyV5UQtBYtVxpEcGAlhA8PjHf/YNOaEKKWKdtdSvPP5a5qnD2bmOgX5QBDYzxFuTs9uswkbKhwximpoL4PDLiMZpPB+TahsN0HXfMAInUN0Z/EGRzOuuJi1N3YqlH9udyIFp4ND2UvG+uQ0gXEosVWBk8P/yvYsVUwTCJfFm5d9x54ZT4eOZewboD9MsNT2U2swdHQv/B4caqoIXWA4PaeoH5xnjHhh/92B8xOnrH1e2aIvjnUFruhxFplMGVQmZJ3zXiaICQccQSFQYI8zek67ZHtxCaVwrySJs8HProf7Bhy/0mGUSyhNsLloA3XxdtkkZ2QJY0GQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(3023799007)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkUrVzBNUU9zWVJxLytvNTRKM0pHR3gxM1dmQjRtcmZiR2hjTzl2M2FINGlk?=
 =?utf-8?B?V3FzVmQyVnZQWnhJYWxCQTh4YVI2TGtPU3pOOUE2bGZ2K1hKenhMQTMxRVRR?=
 =?utf-8?B?M25FQm9sR2R3TUhaRU5ISHI4c3lyMEFnY2srU2N3a1BkQ0tUSEgyVUg1R0wr?=
 =?utf-8?B?QUhPOWQ0aldlT0FKTSt2VE5wWWIyaktjeDRETHdyV3E2M3h6eXdsVkxBTmhS?=
 =?utf-8?B?Sk1YbUFCQkhsNDJyVEhkSE5DWXVBbHk1WTdURXV4dGppTnYvTDlmRHg0T0l2?=
 =?utf-8?B?cHMwVGNsbVlBelpQRExBeWN5UlpZTnkrWC9zSE5VTjdFbUFiS0pXaERUeUt4?=
 =?utf-8?B?eGxqRTF1WDRYYUJzWUo1MFFGekRQaU1JM2NVV3d6V2ZBSEpuQTM4NDd2dmZL?=
 =?utf-8?B?RXNQTGMwOFZKenl0M2xmeEJXNFZMSVhqaWJFT1AwQm9MaFFRRUZiclZXM2Zm?=
 =?utf-8?B?TU5wVHRTcDBrZ0tQNGFvWnQ1di9vZlVKbGl4cmNwQnRKTytaanNLZ1R5cFdW?=
 =?utf-8?B?WVovUGRmTXljWktFL2UwZDhaMERYNm1JMytsbmMzRmFpcmNQSUtaYmJEWmVu?=
 =?utf-8?B?OVZ4NXl4QnU2aXJnY3QrZ1FteVpIR2F4N2F3SFJmTVRPYW9EUXk3dlhOYnRw?=
 =?utf-8?B?ZWhxYWRxcjNQaCtabHVMbHBJNDRCTnNGZzBmOGJIMU1UYzVIZ2ZMMHBEaWs1?=
 =?utf-8?B?U0FybCtMQTVuMStxQTJycGlKV2ZoKzh2L2JYOU9QVmdxd2dPV21KUWJ3SmNL?=
 =?utf-8?B?bjNmS1V2Q3d3YklFblRKTk0wRlZxRldEaVhiekRCZTZJYVFuTzNwYnlBSk0x?=
 =?utf-8?B?T2NWdHF1ekptZWxXck1IRE5kV1AzSjVOb2RrZUxMdExFanVlVmk3Rjl3RTdt?=
 =?utf-8?B?Y3l0TUhreUZSRWhVQk5XclBQWW4wampwR2MzZHIrdEZPMjlXRjZORlMvLzRJ?=
 =?utf-8?B?UnFCeThLM3J6VHNndHJQNm94a3dXMWliMTlLUDRybVBINWtYQkI0LzJZaUVi?=
 =?utf-8?B?cTA2QWRsbi9uMGsyQ1llYWNZQXFrVWt1UTRsK2F1U09BRmZVSnl5YjEvaGhR?=
 =?utf-8?B?NkdRaFZtZitNSkhxQnp6eXBWNUVTOGR2UHQwMG4zdDFDTTMrUU9CQmpFVHZY?=
 =?utf-8?B?U01haEZpYWZ5MjR2aFZXejhnblpOMmg3eUsrMXZwSjZXejA1c252WWpoTjJX?=
 =?utf-8?B?QXRuZHZRSlFhWFZFNWxnbWdtT1M2ck9yVHpQVFJlNWt0UC9vOVBDcVBrWGgy?=
 =?utf-8?B?UHAzWVZxUzNvRUFkbU9VK0g0cVVJRFhLQUZ5cnVESlpSSVpKYjg1VnNEVW1n?=
 =?utf-8?B?UVh2akwxTDk1RWkrVG9tRjBkcHBVUkNCK05IbE9oc0t5QnRpQkQ1L3laRDRG?=
 =?utf-8?B?Q2t5SGZpV2UwUnc1cnB6cUVuUUcwWFM5NUcraWg3ZkZCRm1MMFcyaVdqTFYv?=
 =?utf-8?B?THlOVDZ5WDlZekdtOVFOY2RSNzZqTS8wVm9xZDl3aTNnNzZiTHc5aEZVM2gx?=
 =?utf-8?B?V2xuak1vVnhvZllmbUZZNUFZUTBKTjJZRU9QbGZLRUxjaHE5T0VtTUgya2Zq?=
 =?utf-8?B?MWU1emlKbUFBbnNjK3U1SGVQVmQ3M3NtRE5hWHlTc0ZYaGNETDk1NWZjcFEz?=
 =?utf-8?B?SnZaV0wvVFFOblpjcUh4VUJpZzRmK1ZkY2EzQ295VTd6a1pyVzY5aHMvYU1H?=
 =?utf-8?B?OTByVHNBdyt1UVBiZFRHbElLRnFtNGpHdW9CdXNNT2ZrTWNoc0tKeTZZTnNp?=
 =?utf-8?B?MnRqT0NXeXVTODMvam9peEFTY1pSUEtVZXMwdWFGbUU2L1ZMd0pmWHg0cHZm?=
 =?utf-8?B?am5FUHIyaFR0dW5PNjJDUVcwbWN4WTlSbnVVRWxmOUFUekI2ZTN2Yk15NFR6?=
 =?utf-8?B?bHZFZC8xbVVwL2dWNHRSMlJDK1crZHlIL20rRnE5bklCY25STVZ3bDFVZ3Fw?=
 =?utf-8?B?bXlxQlhPbkMrWkFMUDdJbDhYclNLQlVCeVVjTzBJN2hIOEJUdEY5R1h5Z3NP?=
 =?utf-8?B?MUVSTWR5QlRISStnQzljc2U1MzQrS3AvdlJpOHZGZURpSWpTRGNRNS9MeDNT?=
 =?utf-8?B?MG1aUlMwcDNOMi8yQTducWVWZlEvL3pscEF3bEtQL2E1WFlma293M1dkNnh5?=
 =?utf-8?B?RU5qblA3di9XaUhVazhnR2hETEM0RDFYNnlySWhWbEdUTHdlRG1oY1hnajMv?=
 =?utf-8?B?MFU4cW1DWXFDbWJMWDFFandVQkQrdGNSc0RnTy8rWGtVTElEY3NtUjIyWTYr?=
 =?utf-8?B?VktLdHF6akJrYzVQLzh6eHlNTnErL0hkZGVodEkvUWVVN3V5OVNiaWRQb09l?=
 =?utf-8?Q?oGR0uKA6Pc/NwjY27Q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a23abced-2b92-4c8e-6954-08dee52ebe60
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 00:43:25.8325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ri8U8hW29yIRhAWsKwuwu3psf2tmLKarftfDtu4lVfICDIm0oYTYG6iSGDhtgJpPgKaN55mR56CKNvFPzOCGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4124
X-purgate-ID: tlsNG-c201ff/1784421812-71CA82A1-DB68D248/0/0
X-purgate-type: clean
X-purgate-size: 7296

SGVsbG8sDQoNCj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4gPiArKysgYi94ZW4vY29t
bW9uL0tjb25maWcNCj4gPiBAQCAtMTQwLDYgKzE0MCw5IEBAIGNvbmZpZyBIQVNfRVhfVEFCTEUN
Cj4gPiAgY29uZmlnIEhBU19GQVNUX01VTFRJUExZDQo+ID4gIAlib29sDQo+ID4NCj4gPiArY29u
ZmlnIEhBU19HRU5FUklDX0NQVV9UT1BPTE9HWQ0KPiA+ICsJYm9vbA0KPiANCj4gWW91J3ZlIGdv
dCBpbmRlbnRhdGlvbiByaWdodCBoZXJlIGFuZCAuLi4NCj4gDQo+ID4gQEAgLTE5MSw2ICsxOTQs
MjUgQEAgY29uZmlnIFZNX0VWRU5UDQo+ID4gIGNvbmZpZyBORUVEU19MSUJFTEYNCj4gPiAgCWJv
b2wNCj4gPg0KPiA+ICtjb25maWcgR0VORVJJQ19DUFVfVE9QT0xPR1kNCj4gPiArCWJvb2wNCj4g
DQo+IC4uLiBoZXJlLiBXaHkgbm90IC4uLg0KPiANCj4gPiArY29uZmlnIERUX0NQVV9UT1BPTE9H
WQ0KPiA+ICsgICAgYm9vbCAiRGV2aWNlIHRyZWUgYmFzZWQgQ1BVIHRvcG9sb2d5IHN1cHBvcnQg
KFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gPiArICAgIGRlcGVuZHMgb24gSEFTX0dF
TkVSSUNfQ1BVX1RPUE9MT0dZICYmIERFVklDRV9UUkVFX1BBUlNFDQo+ID4gKyAgICBzZWxlY3Qg
R0VORVJJQ19DUFVfVE9QT0xPR1kNCj4gPiArICAgIGhlbHANCj4gPiArICAgICAgUmV0cmlldmUg
Q1BVIHRvcG9sb2d5IGluZm9ybWF0aW9uIGZyb20gdGhlIGRldmljZSB0cmVlIHRvIG9wdGltaXpl
DQo+ID4gKyAgICAgIHZpcnR1YWwgQ1BVIHNjaGVkdWxpbmcuDQo+ID4gKw0KPiA+ICtjb25maWcg
QUNQSV9DUFVfVE9QT0xPR1kNCj4gPiArICAgIGJvb2wgIkFDUEkgYmFzZWQgQ1BVIHRvcG9sb2d5
IHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gPiArICAgIGRlcGVuZHMg
b24gSEFTX0dFTkVSSUNfQ1BVX1RPUE9MT0dZICYmIEFDUEkNCj4gPiArICAgIHNlbGVjdCBHRU5F
UklDX0NQVV9UT1BPTE9HWQ0KPiA+ICsgICAgaGVscA0KPiA+ICsgICAgICBSZXRyaWV2ZSBDUFUg
dG9wb2xvZ3kgaW5mb3JtYXRpb24gZnJvbSB0aGUgQUNQSSBQUFRUIHRvIG9wdGltaXplDQo+ID4g
KyAgICAgIHZpcnR1YWwgQ1BVIHNjaGVkdWxpbmcuDQo+IA0KPiAuLi4gdGhyb3VnaG91dCBoZXJl
Pw0KDQpJIHdpbGwgZml4IGl0Lg0KDQo+IEknbSBhbHNvIGEgbGl0dGxlIHB1enpsZWQgYnkgdGhl
ICJpZiBVTlNVUFBPUlRFRCIgb24gdGhlIHByb21wdHMuIEltbyB0aGF0DQo+IHdvdWxkIGJldHRl
ciBiZSBub3JtYWwgImRlcGVuZHMgb24gVU5TVVBQT1JURUQiLiBUaGUgc2l0dWF0aW9uIGlzDQo+
IGRpZmZlcmVudA0KDQpPa2F5LCBJIHdpbGwgcmVwbGFjZSBpdCB3aXRoICJkZXBlbmRzIG9uIFVO
U1VQUE9SVEVEIg0KDQo+IGluIGUuZy4gY29tbW9uL3NjaGVkL0tjb25maWcsIHdoZXJlIHRoZSBk
ZWZhdWx0IHZhbHVlIG1heSBiZSBZICh3aXRoIHRoZQ0KPiBwcm9tcHQgYmVpbmcgaW52aXNpYmxl
IG1ha2luZyBpdCBpbXBvc3NpYmxlIHRvIHR1cm4gb2ZmIHRoZSBvcHRpb24pLg0KPiANCj4gQWxz
byBtYXkgSSBzdWdnZXN0IHMvdmlydHVhbCBDUFUvdkNQVS8gPw0KDQpPa2F5Lg0KIA0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi94ZW4vY29tbW9uL2NwdS10b3BvbG9neS5jDQo+ID4gQEAg
LTAsMCArMSw2NSBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
ci1sYXRlciAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+ID4gKyNpbmNs
dWRlIDx4ZW4vY3B1LXRvcG9sb2d5Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPg0K
PiA+ICsjaW5jbHVkZSA8eGVuL2R0LWNwdS10b3BvbG9neS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVu
L2luaXQuaD4NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBmcmVlX3RvcG9sb2d5X3Rh
YmxlKHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVkIGludCBjcHU7DQo+ID4gKw0KPiA+
ICsgICAgZm9yICggY3B1ID0gMDsgY3B1IDwgbnJfY3B1X2lkczsgY3B1KysgKQ0KPiA+ICsgICAg
ew0KPiA+ICsgICAgICAgIGZyZWVfY3B1bWFza192YXIoY3B1X3RvcG9sb2d5W2NwdV0udGhyZWFk
X3NpYmxpbmcpOw0KPiA+ICsgICAgICAgIGZyZWVfY3B1bWFza192YXIoY3B1X3RvcG9sb2d5W2Nw
dV0uY29yZV9zaWJsaW5nKTsNCj4gPiArICAgICAgICBmcmVlX2NwdW1hc2tfdmFyKGNwdV90b3Bv
bG9neVtjcHVdLmNsdXN0ZXJfc2libGluZyk7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAg
WEZSRUUoY3B1X3RvcG9sb2d5KTsNCj4gDQo+IFhWRlJFRSgpLCBhcyBpdCB3YW50cyB0byBiZSAu
Li4NCj4gDQo+ID4gK30NCj4gPiArDQo+ID4gK3ZvaWQgX19pbml0IGluaXRfY3B1X3RvcG9sb2d5
KHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHVuc2lnbmVkIGludCBjcHU7DQo+ID4gKyAgICBpbnQg
cmV0Ow0KPiA+ICsNCj4gPiArICAgIGNwdV90b3BvbG9neSA9IHh6YWxsb2NfYXJyYXkoc3RydWN0
IGNwdV90b3BvbG9neSwgbnJfY3B1X2lkcyk7DQo+IA0KPiAtLS0geHZ6YWxsb2NfYXJyYXkoKSBo
ZXJlLg0KDQpPa2F5Lg0KDQo+ID4gKyAgICBpZiAoICFjcHVfdG9wb2xvZ3kgKQ0KPiA+ICsgICAg
ew0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJGYWlsZWQgdG8gYWxsb2NhdGUgbWVt
b3J5IGZvciBjcHVfdG9wb2xvZ3kgdGFibGVcbiIpOw0KPiANCj4gSXMgdGhpcyByZWFsbHkgYW4g
ZXJyb3IgKGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIHRoaXMgdGhlbiBhbHNvIG5lZWRzDQo+IGxv
Z2dpbmcpPyBUaGVyZSBtYXkgbm90IGJlIGFueSB0b3BvbG9neSBpbmZvcm1hdGlvbiB0byByZXRy
aWV2ZSwgaW4gd2hpY2gNCj4gY2FzZSB0aGUgYWxsb2NhdGlvbiBmYWlsdXJlIGlzIGJlbmlnbi4N
Cg0KT2theSwgSSB3aWxsIHJlbW92ZSB0aGlzIGxpbmUuDQoNCj4gPiArICAgICAgICByZXR1cm47
DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgZm9yICggY3B1ID0gMDsgY3B1IDwgbnJfY3B1
X2lkczsgY3B1KysgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGlmICggIXphbGxvY19jcHVt
YXNrX3ZhcigmY3B1X3RvcG9sb2d5W2NwdV0udGhyZWFkX3NpYmxpbmcpIHx8DQo+ID4gKyAgICAg
ICAgICAgICAhemFsbG9jX2NwdW1hc2tfdmFyKCZjcHVfdG9wb2xvZ3lbY3B1XS5jb3JlX3NpYmxp
bmcpIHx8DQo+ID4gKyAgICAgICAgICAgICAhemFsbG9jX2NwdW1hc2tfdmFyKCZjcHVfdG9wb2xv
Z3lbY3B1XS5jbHVzdGVyX3NpYmxpbmcpICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAg
ICAgIGZyZWVfdG9wb2xvZ3lfdGFibGUoKTsNCj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgIkZhaWxlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGNwdV90b3BvbG9neSB0YWJsZVxu
Iik7DQo+IA0KPiBTYW1lIGhlcmUgdGhlbiBvYnZpb3VzbHkuIEFsc28gcGxlYXNlIHJlc3BlY3Qg
bGluZSBsZW5ndGggY29uc3RyYWludHMuIERvbid0DQo+IHNwbGl0IGZvcm1hdCBzdHJpbmdzLCBi
dXQgc3BsaXR0aW5nIFhFTkxPR18qIG9mZiB0aGUgc3RyaW5nIGxpdGVyYWwgaXMgZmluZS4NCg0K
T2theS4NCg0KPiA+ICsjaWZkZWYgQ09ORklHX0dFTkVSSUNfQ1BVX1RPUE9MT0dZDQo+ID4gK3N0
cnVjdCBjcHVfdG9wb2xvZ3k7DQo+IA0KPiBXaHkgd291bGQgdGhpcyBiZSBuZWVkZWQ/DQoNCkkg
d2lsbCByZW1vdmUgdGhlIGxpbmUuDQoNCj4gPiArc3RydWN0IGNwdV90b3BvbG9neSAqX19yb19h
ZnRlcl9pbml0IGNwdV90b3BvbG9neTsNCj4gDQo+IFRoaXMgaW5jbHVkZXMgdGhlIHNhbWUgZWZm
ZWN0Lg0KDQpPa2F5Lg0KDQo+ID4gKyNkZWZpbmUgSU5WQUxJRF9UT1BPX0lEICh+MFUpDQo+ID4g
Kw0KPiA+ICtzdHJ1Y3QgY3B1X21hcCB7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgdGhyZWFkX2lk
Ow0KPiA+ICsgICAgdW5zaWduZWQgaW50IGNvcmVfaWQ7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQg
Y2x1c3Rlcl9pZDsNCj4gPiArICAgIHVuc2lnbmVkIGludCBwYWNrYWdlX2lkOw0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBjcHVfbWFwIF9faW5pdGRhdGEgY3B1X21hcFtOUl9D
UFVTXSA9IHsNCj4gPiArICAgIFswIC4uLiBOUl9DUFVTIC0gMV0gPSB7SU5WQUxJRF9UT1BPX0lE
LCBJTlZBTElEX1RPUE9fSUQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIElOVkFM
SURfVE9QT19JRCwgSU5WQUxJRF9UT1BPX0lEfQ0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBu
aWNlIGlmIHRoaXMgcHJvcGVybHkgdXNlZCBkZXNpZ25hdGVkIGluaXRpYWxpemVycw0KPiB0aHJv
dWdob3V0LiBBIHRyYWlsaW5nIGNvbW1hICh0d2ljZSkgd291bGQgYWxzbyBiZSBuaWNlLg0KDQpJ
IHdpbGwgcmVwbGFjZSBpdCB3aXRoOg0KDQpzdGF0aWMgc3RydWN0IGNwdV9tYXAgX19pbml0ZGF0
YSBjcHVfbWFwW05SX0NQVVNdID0gew0KICAgIFswIC4uLiBOUl9DUFVTIC0gMV0gPSB7DQogICAg
ICAgIC50aHJlYWRfaWQgPSBJTlZBTElEX1RPUE9fSUQsDQogICAgICAgIC5jb3JlX2lkID0gSU5W
QUxJRF9UT1BPX0lELA0KICAgICAgICAuY2x1c3Rlcl9pZCA9IElOVkFMSURfVE9QT19JRCwNCiAg
ICAgICAgLnBhY2thZ2VfaWQgPSBJTlZBTElEX1RPUE9fSUQsDQogICAgfSwNCn07DQoNCj4gPiAr
c3RhdGljIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqX19pbml0IGR0X2ZpbmRfY2hpbGRfbm9kZV9i
eV9uYW1lKA0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpkdCwNCj4gPiAr
ICAgIGNvbnN0IGNoYXIgKm5hbWUpDQo+ID4gK3sNCj4gPiArICAgIHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqbnA7DQo+IA0KPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIGNhbm5vdCBiZSBwb2ludGVy
LXRvLWNvbnN0Pw0KDQpJIHdpbGwgbWFrZSBpdCBjb25zdC4NCg0KPiA+IC0tLSBhL3hlbi9kcml2
ZXJzL2FjcGkvTWFrZWZpbGUNCj4gPiArKysgYi94ZW4vZHJpdmVycy9hY3BpL01ha2VmaWxlDQo+
ID4gQEAgLTEwLDMgKzEwLDQgQEAgb2JqLSQoQ09ORklHX1BNX09QKSArPSBwbS1vcC5vDQo+ID4N
Cj4gPiAgb2JqLSQoQ09ORklHX1g4NikgKz0gaHdyZWdzLm8NCj4gPiAgb2JqLSQoQ09ORklHX1g4
NikgKz0gcmVib290Lm8NCj4gPiArb2JqLSQoQ09ORklHX0FDUElfQ1BVX1RPUE9MT0dZKSArPSB0
b3BvbG9neS5pbml0Lm8NCj4gDQo+IEFzIGJlZm9yZSwgSSdkIHByZWZlciBpZiB0aGlzIHdhcyBh
cHBlbmRlZCB0byB0aGUgZWFybGllciBncm91cCBvZiBvYmplY3RzLg0KDQpPa2F5Lg0KDQpUaGFu
ayB5b3UsDQpIaXJva2F6dSBUYWthaGFzaGkuDQo=

