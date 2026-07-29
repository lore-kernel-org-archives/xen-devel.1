Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22155C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 16:49:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376455.1623184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp7TF-0004Qg-F4; Wed, 29 Jul 2026 16:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376455.1623184; Wed, 29 Jul 2026 16:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp7TF-0004QZ-Au; Wed, 29 Jul 2026 16:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1376455;
 Wed, 29 Jul 2026 16:49:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wp7TC-0004QR-Mh
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp7TC-008GiD-3P
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:49:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6a2f04-2eae-0a2a0a5409dd-0a2a4503d626-16
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:49:24 +0200
Received: from [52.101.228.120]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6a2f12-fae8-0a2a45030019-3465e4780daa-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:49:24 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY7P286MB6705.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Wed, 29 Jul
 2026 16:49:19 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 16:49:19 +0000
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
 b=fv7JlwhxGrOsuSOjqzqWXTphLffIuSJ8APGvAh+KzPsCa0a8mAzLDNO4fOcAX4yesrN/ZfVI2RZT0SPWoxe8MZxJBtq1xP81+LnLvQrEpbGSh7wcgWxDVrDTxCJcGfyWHoUxkNBxlBvXNoLEYDZAoQlzek+BQxykktMl8oVBFW6fV7j1mHJN0eLnUiMMa6RWA7zfddJ0/yFLEAVM5AbttlecE2rIIEvyyKvJ+oQlynaM9fKXRRkjmw203Rh774thFCo1BH6IoHdgyF1kdOfLNwDFeh8X0DzWJeeKJDGIxLWM9UQe+AMEh4pG451cBvPDbGwPYhlbtpPkEE5aDs9xVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDeX+bvw/nMCZ5sEFoNAq0XcAJqf2H2QxEemH8Q2E2c=;
 b=EdMeQmqr1OySF4IlCYeKnAweV9n9y6K0qb1g1h+hRXAkpUqazqTN6yN4x8PaJ7G0aCaqiggH7JSQ4te8Wc720Qq0mRfY2IXKsw5XV9HExZJo78Ce2Jih+r7PQodUZYKFNplrRCPGQCbvBkZUUuuu86pjpOF8OpNFOE/W0ECSY5DaNkAK+pvXoYCZv7Q7/6vjP8roHvw/oxVzjvkPpva63TATUUDNMExkhwlGOIdkLQUugJC7dEqWax8nLSF7AZMXK632h5s/prTWiP2RVju7s+YYBSkCzHR8WU+EjZK3xdqKlhD2mYsz6kabauv+xAl6XG0BOFwk1ZB0rN3EPqqd5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDeX+bvw/nMCZ5sEFoNAq0XcAJqf2H2QxEemH8Q2E2c=;
 b=YpT6HSBw1FqFx4AZfliiFKoLAs4z+t6o82v8+7oM7dpgdNM8IePVoYx+ORjuuZW3plkGb0YsL+zGHwUm5gH9r6rC4jA9oYSglCk2qHewWha5BUAtshctU+4aqiRaCJ5Gia7f3wDzT4CNAw7epNKe1FzoEDjbxEBbKVyTJnKwd+U=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU
 topology support for ACPI and DT
Thread-Topic: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU
 topology support for ACPI and DT
Thread-Index: AQHdHk7kiFOoxTQzWEaKzsYc0MFEnraCkUuAgAIlOQA=
Date: Wed, 29 Jul 2026 16:49:19 +0000
Message-ID:
 <OS9P286MB7222D972AE41E4298AB214CE82CA2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260728050642.411240-1-taka@valinux.co.jp>
 <6ebc44f2-c7a3-4b33-9f6a-cd48be13ad27@suse.com>
In-Reply-To: <6ebc44f2-c7a3-4b33-9f6a-cd48be13ad27@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY7P286MB6705:EE_
x-ms-office365-filtering-correlation-id: e3ce1604-1f3b-469c-259e-08deed915586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Ua+U/eARyvjKwfQ3QyhYTee9lVzE5C0cnNUQ6lwp4mB3ZM52yEJzFHFEcZru/YNU7Gf64rQpe37mn7wsSgL3fK5cKB3sCAvwHKuLEGVQSgtwQ/Tbw7DRZtYkxnSDS76AfTh829F/Jw9VZ2o0SuPib8EzObiC3b1e0q86cOfdaFWEawi/ikfsTn6FYdP756mU4vvYzV+bXCuRBUrvqRtGp+lzSm+FFeouPcdmn1T22Rz+dfv+B/B6PNOxPnHkzk3yy8MjzBFGFEA7sOjF1IlhebwFRp2wGr0XyDJXrv407TQVcJZKnbEUkY8CF/P9uPzdo+E0RSEchuI319aRf8KPENMCKtKMagoF+gDmWJ18SFuaVqt4hbX3bPEzB+kfPNzTSBnO82jeixbXlkgLBWVKkRTvUfnnmO1TY+0NNTxo5hZybgyWodc+mHftd8Yfhm9Y/kioBvZgQqGNP2Agw/Fyf6KjHPVcE+gXBpjkcLzqKOn3SOxTQbGRCcHoHTQKCgHuZ78mVYfPl3wCV8GhAXM01zG4Uh6OlzKS2+HnvyH0z8Vq1Z14saQ1jB9IEaCBeZzxzhvX16sXgC71MNpBEW8weeZPTTXuzRt1j9xABmoP0PuQaIQ0sZQHzD6/1uZQUEXyJrIrEZEig2YbCudERyj5wDMiFVVNgBTBe+F7v9aSaw9Nonnluna3UHziXsLpAnSq23AbvWmy0ervI1yJsRLiyOZGkCn6fVzvue+/2pAHstg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3ozYlRZSmhhWm5HUzBsYXJKTE9HLzZTcnE1TFQ5STc2MU02a01pdTVvMjZj?=
 =?utf-8?B?MlQ1bjZTU0tpdU5DQzR4UVEzTGFNaDJnQ3lqNTVJSFI5ZmNsaXR3OE40Mm1l?=
 =?utf-8?B?Q0pFY09Ta1Fkc1d3QWdLN3Z3SDBQY3d6dnVneE01YXNqbExXSWVrNFdYcktZ?=
 =?utf-8?B?c3kvaVdsYXpVbkFYSCs3T1VmbUNiVEdFMzJrN1ppNTVCb3hyTklkKytLL2hU?=
 =?utf-8?B?S05HS0wyUWIvTDhXaFdNYkJFcGd0bTBiWmxEL2ZQTlBpbEkyc1VreW9SOGpW?=
 =?utf-8?B?RjAvbi9GdmlRRUt3dlFnZzlJUno5bVJPUlNZUDlVZmsyQUlEWTdLTC9xV2RU?=
 =?utf-8?B?dllJSHM1SHdUeWhOY3Vqc2psTkVxd3h2aklteWJDRjNpbUlCcmNkeXREZkVx?=
 =?utf-8?B?U1BWTGhIcUhDYVVpY0RtTWdZUTZFUDE3UndYdG1HVStpT3pXYWRCTE52YjMv?=
 =?utf-8?B?YjY4N0NGQTljWGgzLzJ5R3dWRnU4S3NQMUVwKzNuZGI5cFJDNmRGakFEYndG?=
 =?utf-8?B?RnBzV0Z4MTVGRWd2UjJ1aU8wd1FDQkVPQ2FUM3l6TWtuR2JVT0Y0UGN5RHdR?=
 =?utf-8?B?RWlxWFBTbFc4L1JSaUFkRU9adW54WUVVaVg1MHl5QUMrTE11dFN5QnFPOGxh?=
 =?utf-8?B?aHVSV25UMVFBdldqRTY4RW94MmNBVlUvVnZaZzJxV2x3UUJ4U0tUSEtLZXN6?=
 =?utf-8?B?MXI1UGZSWTNUZFlBNXFZQ1UyZU1iWFZNeis1MXRvNEhiQk82SStQQjkrSXRa?=
 =?utf-8?B?SjAzcHVEV1A1NlV2dmpsSWs5UGhiSlpMR0JsVzFvR1JoOG8xd2k4cGVpMkhH?=
 =?utf-8?B?M1pZR2VhaDNLUVVKK1Y2T3JjVVdmL3Y1QXFHOG5nNDFQRVlLNHFqd1phQWJw?=
 =?utf-8?B?ajJOQjZ6OEFFWGFId2tCWXZlNk9RbEJvL2w3Tk9USEE0Q0Z5QytXNjhHYmtB?=
 =?utf-8?B?TWQ5WW1xVnRZbWhFaXIxbVBpbzk4aHpCWWpyTFloWFdoY1p5UU1pd3JOamNH?=
 =?utf-8?B?UFoyVFhMQUxjRyttM0RaeEdVRXF0SThtdFhCQjh5TE5uVzRENmNka3pXSW0x?=
 =?utf-8?B?ZTJTYWU4b1V4clZySHBvTEMzQzdEY2kzSHNPM0NoakNJcVNsekRVc28wTDBW?=
 =?utf-8?B?bm9abkQ0Skh0c2dnRld3MkNFd2M4K0FESVFySGF5MGlGTEkzU3YzdlZGdzU5?=
 =?utf-8?B?UVhMdHhpU1FvTHhBWEhpd3dvK0YzSlFNei9UbS9HT0JPWFRiWS91ODJuUERy?=
 =?utf-8?B?Q2ZYVGpiVHpZMU5JK1kwRWdIb2ZVSVB0VXZDbENRL0h2YStyRjQrc3NqUk5W?=
 =?utf-8?B?Wkk3NVh0WFBBSnE0QnYwMWxyQTZRNEFxaWs0cytRMlExOE1oeThLS2srZmVz?=
 =?utf-8?B?Um5ya21tdE4wQzF3RjBlVUlNaHkvR2lzL1ZsYVRuaXRxbXpEMVRYNXdNQnhS?=
 =?utf-8?B?Z24rZ3dSamR5VXN6ZkxsSyt6WDltRjlTajJVL0Vqd1VxV09takR1K2VUbkpm?=
 =?utf-8?B?OEJ4UFUwU0xiZmRWelF2V2NIYXFTNnRPYU1MUHB3alZsZjBQeldpTlhMVjdT?=
 =?utf-8?B?OXlNTzdaMVdkMHMrY1JSc09Xb0RZT01QOW9ZcVEram9vYlFIeDJCYkROb05t?=
 =?utf-8?B?Q2lVaWtQWEI1cnN0aXBTTEdpMDBmRU43TzNsYWcrK2lOM21rTFY1eERhcnIx?=
 =?utf-8?B?c3Y3bCtzbTd2SDk4UE9BdzBKbEJBYmI1aHhOR1Y3MEs3bEJOSkNDZmJaRFAz?=
 =?utf-8?B?N0ZWeDdLVHFsRnBQbmNHV1RlaXNvUTFPdTJab2IxL3pOVnV5cklXaGFucHJJ?=
 =?utf-8?B?elIrK09sb09qOG15NUg0OG4yYkxMWW8vbUpqZUVFY09MMzN3bi9PbTdOR3lx?=
 =?utf-8?B?cWsra01pWmgxb0VGczFHTC9mWDg1TkhQSkIvT3NIM2dkemhOL0tJSHVjOXRN?=
 =?utf-8?B?dXJadWs2NmwzOGJzTzlhQVh5RUNKOGNXQVI0aG8ySjdOdXBIOXgvWkU3Y1g2?=
 =?utf-8?B?MTFZRThkWVJRQUZOQzNMbmhFbVJWWk9IMTRPcVkyOEtIRk56L0lVMDkzdWly?=
 =?utf-8?B?clFFZGhGQlgyWU9vSW1Da1BKVkNKblpCUVU3aEdTVnNYY09QeDl0RmR0b1BN?=
 =?utf-8?B?M2pXMGh0dWtHL3dybDB5bGlEalI3cGlIUmhjYi9NdGU4YmpmZnVNQkswckdj?=
 =?utf-8?B?bDZERFlBTWhlZFZocG1wREdHYytnTHJHRitBcm9nTjVJbVVhUStpMDVEQWph?=
 =?utf-8?B?YXdaWkhQVkY3Z3RRbkIrQkhiQ1Y5bDErdzFDZ2dvMHlidXFwMGlSZ0xkeWVp?=
 =?utf-8?Q?6ktFLKuy4dnq1pqi2/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ce1604-1f3b-469c-259e-08deed915586
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 16:49:19.3495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p3BHi+oUzSfka5WS0Jj2HjoHkN2mLhP2kbVBqK0ch5ztjsClR+pscbsUu8gFfNS6G+nqx58uKDC5qvNzSC02vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6705
X-purgate-ID: tlsNG-33051d/1785343764-6E0D14E9-B7E15648/0/0
X-purgate-type: clean
X-purgate-size: 1524

SGkgSmFuLA0KDQo+ID4gQ2hhbmdlcyBpbiB2OToNCj4gPiAgLSBBZGQgYm91bmRzIGNoZWNraW5n
IGZvciB0aGUgbnVtYmVyIG9mIHByaXZhdGUgcmVzb3VyY2VzIGluIHRoZSBQUFRUDQo+ID4gICAg
cHJvY2Vzc29yIHRhYmxlLg0KPiA+ICAtIFZlcmlmeSB0aGUgdmFsaWRpdHkgb2YgZW50cmllcyB3
aGVuIGluZGV4aW5nIGludG8gdGhlIG1hcF9jcHVfYWNwaWlkIHRhYmxlLg0KPiA+ICAtIENvZGlu
ZyBzdHlsZSBhZGp1c3RtZW50cyAoZm9sbG93aW5nIFhlbiBzdGFuZGFyZHMpOg0KPiA+ICAgICog
UGxhY2UgbG9naWNhbCBvcGVyYXRvcnMgKCd8fCcsICcmJicpIGF0IHRoZSBlbmQgb2YgbGluZXMg
d2hlbiBzcGxpdHRpbmcNCj4gPiAgICAgIG11bHRpLWxpbmUgY29uZGl0aW9ucy4NCj4gPiAgICAq
IFBsYWNlIGFyaXRobWV0aWMgb3BlcmF0b3JzICgnKycsICctJykgYXQgdGhlIGVuZCBvZiBsaW5l
cyB3aGVuIHdyYXBwaW5nDQo+ID4gICAgICBsb25nIGFzc2lnbm1lbnQgc3RhdGVtZW50cy4NCj4g
PiAgICAqIEVuY2xvc2UgYml0d2lzZSBvcGVyYXRpb25zIGluIHBhcmVudGhlc2VzIHdpdGhpbiBj
b25kaXRpb25hbCBleHByZXNzaW9ucw0KPiA+ICAgICAgdGhhdCBjb21iaW5lIGxvZ2ljYWwgb3Bl
cmF0b3JzLg0KPiA+ICAgICogQ29tYmluZSB2YXJpYWJsZSBkZWNsYXJhdGlvbiBhbmQgaW5pdGlh
bGl6YXRpb24gd2hlcmUgYXBwbGljYWJsZS4NCj4gDQo+IE1heSBJIGFzayB0aGF0IHlvdSBzbG93
IGRvd24geW91ciByZS1zdWJtaXNzaW9uIHJhdGU/IElpcmMgQXJtIHBlb3BsZSBoYXZlbid0DQo+
IHJlYWxseSBsb29rZWQgYXQgdGhlIHNlcmllcyBzbyBmYXIsIHlldCB3aXRob3V0IHRoZW0gZG9p
bmcgc28gbm9uZSBvZiB0aGlzIGNhbg0KPiBnbyBpbiBhbnl3YXkuIFlvdSBtYXkgdGhlcmVmb3Jl
IHJhdGhlciB3YW50IHRvIHBpbmcgZm9yIHRoZWlyIGZlZWRiYWNrLg0KDQpUaGFuayB5b3UgZm9y
IHRoZSBhZHZpY2UuIEkgd2lsbCBob2xkIG9mZiBzZW5kaW5nIG5ldyB2ZXJzaW9ucyBmb3Igbm93
IGFuZA0KcGluZyB0aGUgQXJtIG1haW50YWluZXJzIGZvciB0aGVpciBmZWVkYmFjay4NCg0KVGhh
bmsgeW91LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

