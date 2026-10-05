Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1DACA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:38:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440728.1658166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDg5K-0002mR-CH; Mon, 05 Oct 2026 10:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440728.1658166; Mon, 05 Oct 2026 10:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDg5K-0002mK-92; Mon, 05 Oct 2026 10:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1440728;
 Mon, 05 Oct 2026 10:38:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDg5I-0002lE-Uo
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:38:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDg5H-0024Cw-Hz
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:38:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac37e03-8faa-0a2a0a5109dd-0a2a4506c76a-38
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:38:15 +0200
Received: from [40.107.130.142]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac37e17-195a-0a2a45060019-286b828e89cd-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:38:15 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by DU6PR03MB10967.eurprd03.prod.outlook.com
 (2603:10a6:10:5c3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 10:38:12 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 10:38:12 +0000
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
 b=CmIG3S9C4uubAXDt71hfImYoYbgsrEwkf8VUa8KIatATuBRpEBe2Ft+EvLfMGUjXklQt6vw/KFXsLOXYQp5mKMzCMQvBIj4z4pZa84JFwmsBM9xEGj54f1RINGwzZi1GxqvT7PehtyntcMoX0A4um0TJBccwLYh53tiJl4PtdO3U0k5wkSDtfbQgQERE0tpr2DW6lmwQGj6rMHyWzVLSNd3lQiKjRNdNmzI1iVuXGQc3pwu8/1yQLovOf3/m2ZyC35QSBBxEVmZwp2QdI+ibXTfS388gsOhmdi9nkPTuiik5b9cYr+7/8v2/sUiPmP+ntiPKqsd0/EMw87mX/w8/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJhOiI1D5xUBlpAiqrtu3EP57Qh8aYWsgMZ5he6gzp8=;
 b=o+MkHa52zY1pjP3wMzvkbVVdPGL361c07ezJPbKpN7mPtlEvNXptZNh47Qp9CyFoKayy6eM7+yRS+ZG+cxvwoWoDSlyjRw+S6J8LRInI94xcGpQr++SQtidjEGApGVvBuZBE6R68Yps2XxHBW1uvNKvsXuE8PHivTQbf+5jgQbCnRny/4MOBplM3Mvum8hefhl9B1x9q/lDc8leD/t+RT9odtcWu0ksEBC+ptlRfUb09iGMCSZRUL4XKI99kDyijUNOJdHQ7SsWkSDIlj/8DnBoY9g9F+Oz4X4PGOgyPfIEQIXXDykevwbyuvyhal7DfDKKNxf8HkTvmfqqFYMdGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJhOiI1D5xUBlpAiqrtu3EP57Qh8aYWsgMZ5he6gzp8=;
 b=Ii3uKOT/cBmUObg6AxRCrQFD4z+Qh8BETnSjSWTUnhfNSlWyoti8SGrw1N4UnSP0L4kMyzVJF2qeXm3IEr5M/zzYz3bNo/eFWl60YDXEUpmPDzt0XTg3+cxFNunF+BvJ1NRcQi6J5flWNN8l1dH/aw9v+wc3OA2ARm6MLTPxLzQnB1cHVSlSwlNxrbjs4AquYKBX00CP7yHk4BOPAEMZcHO9BLMWD014IC5oJkPmIN2dfuROMUQaYEetAw9cZdX4exttUHV+ynW21z8i+/fPb3EN4M6Y54klXkgZcLHDHgiH6LuNjn9jM+zFuzRilKz8bJpuhuXKju/kaz3U32bjgw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/12] kexec: machine_reboot_kexec() doesn't return
Thread-Topic: [PATCH 06/12] kexec: machine_reboot_kexec() doesn't return
Thread-Index: AQHdNrtNnuxIk3AqN0yIVRN5rIwRg7azOR0AgDvEqIA=
Date: Mon, 5 Oct 2026 10:38:11 +0000
Message-ID: <a016bb1f-3178-404f-8ace-a33575a2de2d@epam.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <26fe76ce-db8f-4641-aeea-667fb6ee3932@suse.com>
 <d7bb3db821a0018d7b0dc5c8a6729df9@bugseng.com>
In-Reply-To: <d7bb3db821a0018d7b0dc5c8a6729df9@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|DU6PR03MB10967:EE_
x-ms-office365-filtering-correlation-id: 3d316d82-1367-4593-99e2-08df22ccc146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|42112799006|376014|22082099003|18002099003|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 XW3BadbHnis7JChwrgrGgHK/KqMAN506FXnoQ5a5+cBI/JAubLIiID01RKQrXTT6sHJc7QChTNaY1aKanEJAVPvWbMaL+GInO0X7SjKRofugvwDeiXngopyOKcMKmduVxsrGuSHl6Mv90QLG7niwV3e9EK3X9wd8yG+1zU8iygn1AeFqqwR6nlmBinD7s0mwLNV9EP30zow+u/Qcxj93wXEDGtR2oMZNp8oTLvlPe0Ab6t5Bxc3BJclQKkyZ7CTwQcoYYVm1dzS8s8Yd+GHUCavosAcqe4Q2uVATitaJ6pToKIPE2Fd7b10TO1YWFTOJwv6U9dJRPY9AzgLYBgsBznL4FQoC7m9YdPZFVttNp53gKK8vp51SPleQZ1x0kuWqELNMCGrtvaYqjyCjbjsiHQt99HQuvp+fP+jZysS+upEMfI4pCu/9j0FyUu0QYnsLNpLphhRZvSvxhNuWhByboXAbfx3WfDueO2A604McUM3weO/VNtwtEYTjK7MGJM2fLffRVMCqKGypG7muWv9JyOzd79wVu50qhbz5kiZv7hiTmbQEhLW68I67Fba+b1rdcWfbiG/IsOrX6uZoRxT1xpN1cZT1HER8yDOLKBqaJhqGHjgFctq+2k9D7PNRYjTc06LlpbqhFJxM6N4A3Wt9tOCIm1WSlS+jeB5v9k+xxPl0deW1ZAKLtmtIFDk/fvYCdXC1ZnPa1WnLHwbp97UvQB4WVGoEm8uw99dyxeTopOU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(42112799006)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkhPRVdjbEtaeW84NFAzQzZ5d1FjYjdGOGRTT1pBajdzcWdMTERxWDRCYWVq?=
 =?utf-8?B?R0t1TGdRZ3ZSUnQ0bC9jZ25PK2xuT1Q4eWNVNTJIdEVaQXpTN0prL3FYRGFX?=
 =?utf-8?B?ZmR0dGZKUmd3elM4ZVhRbkhxeU1mTnNMQlh6a210NjRvTEdEMWdiclNHSTRi?=
 =?utf-8?B?YTJNZjQrV0plejYxOHFySFpZWVdKZ0VmL3M1WktsRVVMVERnYjJ5MlIxdzlY?=
 =?utf-8?B?dUtnSjJwZmdEZk53bVVyTFBNYlY4ZVdMVEtPYkRzbE55ZzBCOGtsaHhaSWRN?=
 =?utf-8?B?L2gyYVhHd1R4dW0vcHZ2N2V3TEZIRHFWYVFGNUpwbFFkVlJPMVZuRjZaS1J5?=
 =?utf-8?B?MzBxYXArWmJJbTcwZW0zb09BTllEbS96RXhkQXpNc2p0emZ5TmM0Y0IzaG9E?=
 =?utf-8?B?NTR5c0pKN0lCd3lhTWRqNUZUVWhiUzlTSWJWL3RCNDRFeTNBNFgwMTA5eUxH?=
 =?utf-8?B?K1VGUnZHTUFYVXliWFFMcXh1RndQWFFjdlR2SU9Ic2dhQktma1pvZHRwbC9j?=
 =?utf-8?B?Lzd5TkJnOHJSNTV6VzNFNFJyTjZWcWNic0t0eENoZUxvNWdsaDhvZHlEeWJR?=
 =?utf-8?B?REkzd24xYk9FVWlmZmJDUzUyU3ZhZk9XMFhONHVYamVxT3NIZXU1RFFEVUtM?=
 =?utf-8?B?OGVRaFViZkM0MWxrbW1jWUtBUHhkMmsxQjJoUUcxODdBZnI4MlJKNTFQZ2JB?=
 =?utf-8?B?VUtUOEI0eEx1ZmttWkNRdnREVUkra1VxQnZ4Szd1a1g3RExVYzJ0TVJQeXRs?=
 =?utf-8?B?MllFUUp0d0d5aysxbVBCUDdtblplT1l0T1EySld3a2FySmtSL0Y0Z2Z4ZTJW?=
 =?utf-8?B?RGh3YWdvRHR2a3JrOWJXWFdLRzVORjBuUnV2b0ZKL0N2TjJKcmRSUnQwS3h6?=
 =?utf-8?B?MHJNV3NMclhJcTBPY0pXRkwyRjVwemc1Skh0WXRvaS9pMWNJL2ExY3NqblNj?=
 =?utf-8?B?QjlYT1UvalIvOHA0b21UNHd5Ry91NTFkazV1cnRKZkIxUWxtOXpGWHM1Qysz?=
 =?utf-8?B?blp6L2VsV0dMRVNzWVhqcTdpeHRoWHdqZUhkMXkwcWNPbHJFNXVWVTZrRHBY?=
 =?utf-8?B?RkNwMzc0OWsyQURnY2Q3ODU3RUJhbFdvdVEvcmgxUmViTjVTd1JsYTVEYXpj?=
 =?utf-8?B?MGZrYm9XMmVUNHJtSEJhRUdsUDd5d3N3c1BDYkYvVzhkRWRFM0JLNkZRVnhs?=
 =?utf-8?B?N1BldXl3VmhPcFlGUW5BRFJ1cVk4V21WSHFtZmpiMkRjdVZueHpabUdwM0tR?=
 =?utf-8?B?NUdqVW1rWVlZSndMUFJDOWhwN3Z6YVhLako3bEoyWmZyQWRJUk1JemhGM2NZ?=
 =?utf-8?B?TmJjY083OXZ5SVpSMklnd0VScDFtMFhlemtITXRNMnRqS2xvOGJWNFExc3VI?=
 =?utf-8?B?WUJVRFJGamRSL2lSU0lValpTZkU4dFZoZzU4RHpEdUduQUE3cW1keXQzVGhW?=
 =?utf-8?B?Z3M5cUlZNEFUREYxaUl1a0N4YWwzb1NXNkltVnpVZWxDL2dpYVpmTW53R1Y2?=
 =?utf-8?B?aEJjQ2xtQm54THNXdTF1SVo4c0JtdXIyNE9RYWhqdGVxZktReVJCYjdmcW9l?=
 =?utf-8?B?akhUL2lSb2M3RGpPcTN2aDdIVjQ0MlZHNzUwUWloa3pJVnJVd0lCWEw4MGx6?=
 =?utf-8?B?WmtKdVFkQWN0UldZeThoL3RpQVBMcHlaTXdwSU9xY1p4QmdGWVRPZXBJVjly?=
 =?utf-8?B?TXhGSGVJV1FYTEJnbTFKeTdCWTJVZUdKU3htVkNmN3JhRlZ1SFJWT3BldVBq?=
 =?utf-8?B?dGExWGl6K0Y4NnBYYXkxajRDZDFCblFnL2l5WGY4ci9nT0tWcVArNTNuOFBB?=
 =?utf-8?B?U21BL3FqVnllb2N5SGc0WDBPeE9Da3pSSVBZbXpQTDdNekNwK20rUkp4a3Rt?=
 =?utf-8?B?K3k1VlhjOG50RlVneG40b2p2UXFHbzN1T2prNVZLMlJ0a3VKUFpScGNBbWpo?=
 =?utf-8?B?eWJJd2I3YVdwc2tTSzdTOHcvQUxwTVZGaTJxb1NOVXdseG80T05nbm10OEFt?=
 =?utf-8?B?TUZ5MVFsc3VmQXk3MXVOb05GcjVGd2ZSTVVKb1J6ZmVuYWU0WjhsMml4bWor?=
 =?utf-8?B?SmpxMFNJRjJFNlovcmdkcVFMNWljNG5tMCtSb1lYTFB2UUN4RUladTV2OWg1?=
 =?utf-8?B?dUh4SXVHWTRST3Z6K0xzSXBnU0RMNlZ1andlcUpnY0VDeGVudG5td1VUYjJ5?=
 =?utf-8?B?ajB2QWNrYUx0YTVKNUhQd0NzUHRHeUIvNHlGdmRoQmVqT1VIUHdaNmFEZHE2?=
 =?utf-8?B?S1doODIwUGREcHdBcjFoVjdsa2syTEVoQ25MNjBFMWJ6VytvdTBsV1hhSXR4?=
 =?utf-8?B?SS9RU3JGUHpHYUpiQ2tLSHdYa09sbnRwUFNvQjRZV2FkeURWakdFSnI0UVZw?=
 =?utf-8?Q?Bqkf1s8cV4EgmtMY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8D99CE1AA793F45A5FA99DAD712E710@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d316d82-1367-4593-99e2-08df22ccc146
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 10:38:12.0387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/iT6DTopB5x7/J9lccV8IkqahtksuXZUDs58wLjkCKXjJaosCho70Z0YoyNL86teTUObfkuVhXBtimGy7p8Gs7OIVxQYoRIlg91mC3Gv78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR03MB10967
X-purgate-ID: tlsNG-16d1c6/1791196695-F580D77B-24FF2F9B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2258

DQoNCk9uIDgvMjgvMjYgMTI6NTUsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI2LTA4
LTI4IDA5OjAyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE1hcmsgaXQgYXMgc3VjaCwgYW5kIHRo
ZW4gcmVtb3ZlIHRoZSBjb2RlIGZvbGxvd2luZyBhdCBpdHMgc29sZSBjYWxsIA0KPj4gc2l0ZSwN
Cj4+IGZvciBFY2xhaXIgZmxhZ2dpbmcgdGhhdCBhcyBhIE1pc3JhIHJ1bGUgMi4xICh1bnJlYWNo
YWJsZSBjb2RlKSANCj4+IHZpb2xhdGlvbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IE5pY29sYSBW
ZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4NCj4gDQo+PiAtLS0gYS94ZW4vY29t
bW9uL2tleGVjLmMNCj4+ICsrKyBiL3hlbi9jb21tb24va2V4ZWMuYw0KPj4gQEAgLTQwMSw3ICs0
MDEsNyBAQCB2b2lkIGtleGVjX2NyYXNoKGVudW0gY3Jhc2hfcmVhc29uIHJlYXNvDQo+PiDCoMKg
wqDCoCBCVUcoKTsNCj4+IMKgfQ0KPj4NCj4+IC1zdGF0aWMgbG9uZyBjZl9jaGVjayBrZXhlY19y
ZWJvb3Qodm9pZCAqX2ltYWdlKQ0KPj4gK3N0YXRpYyBsb25nIG5vcmV0dXJuIGNmX2NoZWNrIGtl
eGVjX3JlYm9vdCh2b2lkICpfaW1hZ2UpDQo+PiDCoHsNCj4+IMKgwqDCoMKgIHN0cnVjdCBrZXhl
Y19pbWFnZSAqaW1hZ2UgPSBfaW1hZ2U7DQo+Pg0KPj4gQEAgLTQwOSw5ICs0MDksNiBAQCBzdGF0
aWMgbG9uZyBjZl9jaGVjayBrZXhlY19yZWJvb3Qodm9pZCAqDQo+Pg0KPj4gwqDCoMKgwqAga2V4
ZWNfY29tbW9uX3NodXRkb3duKCk7DQo+PiDCoMKgwqDCoCBtYWNoaW5lX3JlYm9vdF9rZXhlYyhp
bWFnZSk7DQo+PiAtDQo+PiAtwqDCoMKgIEJVRygpOw0KPj4gLcKgwqDCoCByZXR1cm4gMDsNCj4+
IMKgfQ0KPj4NCj4+IMKgc3RhdGljIHZvaWQgY2ZfY2hlY2sgZG9fY3Jhc2hkdW1wX3RyaWdnZXIo
dW5zaWduZWQgY2hhciBrZXkpDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4va2V4ZWMuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL2tleGVjLmgNCj4+IEBAIC00OCw3ICs0OCw3IEBAIGludCBt
YWNoaW5lX2tleGVjX2FkZF9wYWdlKHN0cnVjdCBrZXhlY18NCj4+IMKgaW50IG1hY2hpbmVfa2V4
ZWNfbG9hZChzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlKTsNCj4+IMKgdm9pZCBtYWNoaW5lX2tl
eGVjX3VubG9hZChzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdlKTsNCj4+IMKgdm9pZCBtYWNoaW5l
X2tleGVjX3Jlc2VydmVkKHhlbl9rZXhlY19yZXNlcnZlX3QgKnJlc2VydmF0aW9uKTsNCj4+IC12
b2lkIG1hY2hpbmVfcmVib290X2tleGVjKHN0cnVjdCBrZXhlY19pbWFnZSAqaW1hZ2UpOw0KPj4g
K3ZvaWQgbm9yZXR1cm4gbWFjaGluZV9yZWJvb3Rfa2V4ZWMoc3RydWN0IGtleGVjX2ltYWdlICpp
bWFnZSk7DQo+PiDCoHZvaWQgbWFjaGluZV9rZXhlYyhzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKmltYWdl
KTsNCj4+IMKgdm9pZCBrZXhlY19jcmFzaChlbnVtIGNyYXNoX3JlYXNvbiByZWFzb24pOw0KPj4g
wqB2b2lkIGtleGVjX2NyYXNoX3NhdmVfY3B1KHZvaWQpOw0KPiANCg0KTEdUTS4NCg0KUmV2aWV3
ZWQtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+

