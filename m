Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855A2C44521
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 01:18:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365751.1615947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlGAL-0007ur-Ii; Sun, 19 Jul 2026 01:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365751.1615947; Sun, 19 Jul 2026 01:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlGAL-0007uk-FU; Sun, 19 Jul 2026 01:18:01 +0000
Received: by outflank-mailman (input) for mailman id 1365751;
 Sun, 19 Jul 2026 01:18:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlGAJ-0007ue-2y
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 01:18:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlGAH-006PKi-QA
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 03:17:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5c2545-5cb7-0a2a0a5109dd-0a2a45028e82-28
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 03:17:57 +0200
Received: from [52.101.228.124]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5c25c3-6ca4-0a2a45020019-3465e47c9990-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 03:17:57 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2955.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sun, 19 Jul
 2026 01:17:52 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.012; Sun, 19 Jul 2026
 01:17:52 +0000
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
 b=hw0tl64vjwTtRp3XvFiaHWINZEn5H30+tRswL48QXU4diwBH0dbIENTym6N3XIzd/kXrNjjLQSWYEin96IJOC3odStLwJ4n/MKQcsRULWoWlcRMclZww5rs5O01+UMrDu/UiNrCJn1F1Cmt+uwRrkSw7obSgRrHomdkYBO7yx3cOegDe6PRLAAdGfOXWtfey2FxUwl1GBBOiRavu3X/F+cruIr3ighJsTuwsennvoxOhDB5Xc8G01ilc0r/baofBFMHTUKb1PZ5oz41KK+hUhMZETc/mipXgHmQVMG8TtCIzgtxI69wwNo2ikfSJ6QelfLtCCtogvT+1CI9HQB/Dvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUOkcfgMlaWNsnAsXo5wY3QU1xHSbMoppFOlZ9VFkNs=;
 b=Yb4wk5Eez5wuPLDaC1CwiY0jczr3coEyU3l4zmKbSBFMVTIJf/OU015WGtRVfJlWao9Ti8UrdZWWdpnUMDEZjOd5N3TMFHmBxGkLiUPk5BgjJedkm5GU7P8dphg4jjXnU+jq8pb9ALXUmaqmH0gYVisO/cHPhQ/TpqA//EotFW6WnSbcphNDpPOlYdQPg9/xbMuOw0Hp8KQP01lH2l6+cKmtTKatujdgbB9ktIuaPhsM0DG8oHP1fXwFv36gGzsEvj15wqywAFTscQwRgUsX5AmcM4Kn8VYW8RnNYg0RNly2l1C4R9yrz2ThsOY4MEo2s3ISNHfpEx63FiwP6RRcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUOkcfgMlaWNsnAsXo5wY3QU1xHSbMoppFOlZ9VFkNs=;
 b=rPn7Mr6DxEUhWTK2r6FPspG6d22gEy7dkE7rZv9SFttz39GNLZ4EPV3r/roTXIQXZclm/Osfq7SGUULVzs4ahNfXhkHycQr3wN0wfSzKXhMuN0KFOvJKnKLcZ6yGrHXlsy6O2ZYG4Klhd/Eu2GGAuMEJfskFz8F9K9AgObkEl8Y=
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
Thread-Index: AQHdE33lRSerj/u3kU6sfibELhxcvrZwJ2MAgAPosBA=
Date: Sun, 19 Jul 2026 01:17:52 +0000
Message-ID:
 <OS9P286MB722280A3A0E6E36B8194501B82C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-2-taka@valinux.co.jp>
 <f2f3572c-6a77-4f65-bf8e-82298d145a6e@suse.com>
In-Reply-To: <f2f3572c-6a77-4f65-bf8e-82298d145a6e@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYWP286MB2955:EE_
x-ms-office365-filtering-correlation-id: 3093ae14-1efc-4a30-3952-08dee5338e0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Yqf37U7NWefmyNV3bFdoptzQC0aTfQS1OFyRBH4Y6o7mvFvCGjkxUYio8aPU69Yoft4JanMDJtRK2oogUKLe89fQukO4YwtsTPnigqPE9stTvCKgCamLHQOMQsx07Cfpef359vLxqAJ5hKZnT2MnrJ0GJOC3wIvnkcoiGGW1AMCR9TJNztg8oi7vpkIepCs17/IMj9J8bICCI3KyWfAw3mk1x29nUb0rthYcxKbbrLDfKtJd8/d92tTpgO6LJucP+smGV87Aw7YPc6hM+vr1rNx/Ihi80ONjt26f0MaGFaI6a5qxL3Ukm56lpgzhLy7baSCQG+YGGX5y9jzshmoMjYhDVmsflEMK5EDJsjiYBCZS3u+jjVbHO8hbH7DJISMC7ZfKhZYFIXImVCcEfSgJ/jhbQbRCcPBlvaW8lLvwC1GHn8BwD0dfas6kHk9+4EEyDoUwXVzrXF1GGO+d83aGoiJsliM6AuU4+moa+n8O8J9iX1w1R3Odcj3M2hVUw8xOuECZsv9CYyGW7jYo1K2CQjuWaqISScGbieACe18eFJ5/rMLNvvVFJhspfghXGg/kTTLQDRBHOPMv9VqjWkRtWqzqcPOzhjB2bn7cfABeSVp443D1tfeunniDRY2ejOWgCoCNhvNlxcd7V0AiYRpvf5jdylWDAy8hsmJhDfY5gSgSF93UEoIFYs/34VQsdBaS5EaMrpb1RG7pkftVX8gJWdQCR5bayPsn816Ec0uJZps=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzJqS3EwUUVOdDFTYWd3UkhOaDFkN045M3V5d0h4czQ0NGw3RGRsZFR5RWVP?=
 =?utf-8?B?UmRDUFVFNzBLcDI0eW5FRFphL3BibVRJTkZZRTdVN2xYTzJsaTRLOFhHZTlk?=
 =?utf-8?B?d3JOYlJGam0vdjFKa21hY04wWnI3TERMZWVzSU5CcStra3pUVUlodHlGYkZ2?=
 =?utf-8?B?d3didi8wMld3SWVzR2ZWM2t0T2VHT1Q1dkxURmFzaEJUc0hDc0lsc0E0K3NT?=
 =?utf-8?B?bVpUMFV5TVZJd3lIT0pZWnArNHdpbVNCckN0bWI0OVpwVmxDOERvTjREZjNv?=
 =?utf-8?B?cmtBaHBHYnVxUmF2SisyK3lCQ1NoRHlkcGIxaEhKblZyVS9Mc2JUMm01MERL?=
 =?utf-8?B?UGUyWGp6VER2THB1dGhjemFSbXQ3eTMzLzc0M2g3a09xMjUrcGpZMEE3Ylho?=
 =?utf-8?B?a3Y5M0VEV00ya3Z4UG05YzFyQldKZVZHVFlnNzlTMGxXZ29FbGRuQVJYOVo3?=
 =?utf-8?B?RktDQlZ5Wm95RG5kbjRQZFIyRkZrOEliWmo4Z1owdi92SXJUbG1GS0pWZm9M?=
 =?utf-8?B?YzdVRDVlZHI3SXAweUdoM3h5TnBaUU9wbWltcXNRVFBOOXBQQXJnVjh4WE1E?=
 =?utf-8?B?WWtsU0k2aFNEM0ZCOXZrL2RERmRXUE9zV1N4Zy9lVkpGaGZ2d3cyS1lJdWhK?=
 =?utf-8?B?M0RkcUxDUXRwMjBFNmdLMmZtRFNRWVNSU2t6WjN4U1V3bURLQTJJM1IrcXpv?=
 =?utf-8?B?NFM0RGErN0NYVWdrR2NtcFpHa0ZwNzRIK2JYZncvcFFQWklwaHJsditFMk1S?=
 =?utf-8?B?WEJRN2RuWlBxNGswM1VSOFEwK2ljaWpNVmJ0NFJOSzNoNVFvR3QwSVQ1c0ty?=
 =?utf-8?B?RWlqV0ZQd2VNd25sdFNiOFJKaTUrTTlRNTFOT1d5Rlh5bUVZcEdiUk5zSjUy?=
 =?utf-8?B?YzZpbHJoangrZEhzUFIvcGtySm1VQTRaRVcyckVRQ2dWRmtSY1dCYTFTNHZt?=
 =?utf-8?B?QStzcnUwVzJyakZwWEJBajZvbm1UcFA1UDNjTkZRMVRzcjYvQnVSNEV2WTIx?=
 =?utf-8?B?Q3ZlNUdDNGdBa05CMCtNTEtZdUhKUmVKb1c1VGZHb0JSTVpLb3FOQ2pVNFJ1?=
 =?utf-8?B?VGNqVnBReVFzOFY3SXppZGYrQnFSOGRJLzJnczJ5MnJ4WEpWQUo0d25SR29l?=
 =?utf-8?B?dGdvTDU3OGFZcUVPTHZ4OS9CbWlqZUpEQnhWOCtJcWxkSmt1QzF0OTB6OU1h?=
 =?utf-8?B?ZVp3dE1NZEFVaEY0K0lyM1l1YmYvTzlieUhHbHBHMGVKc1E2NERDR3V4OUw3?=
 =?utf-8?B?amE1LzNnNTRNeldyQnpiNk5VTjlyU2tnY3VpenhjWU52d2hzUUNxRDJJdEdj?=
 =?utf-8?B?WUIrNElvM3FaMVNiMnB3c21Ddnk4clRaSVNrV0VPeEJBSGhxai8rem10dUdz?=
 =?utf-8?B?dE5jeHRoRnFqZFFiSGpzY3QwWk82OUhxVElxWTFzNzNENVJXKzZERVNESWtr?=
 =?utf-8?B?MjFscGdwQ2h3VnZlR0lyQTNmWXBPekZQK3p3RUlJZ3FhL01GdmpTKytQeXBx?=
 =?utf-8?B?V1pHUm11OEI1anZBa3lZd1ViZFMxcGpKd0wyRUZScEdUQ3M5aXNsblIxNFY1?=
 =?utf-8?B?bGxwM3N3K3JlRjNGSFhhb2xHMEVEekZjQThtYjVaNEdpZVNvS3hUWWZkZEhI?=
 =?utf-8?B?c0VyVlQ3M1VrZFpYY3FkM2tRdDZqZkpHb3FzMEZSWW01ZzNIVUo3QjZPK1VT?=
 =?utf-8?B?Y2d1bFROYnJtVjZaamZHcnlGbnZsMVFjWFlNR2xibEl0S1czQTd3QXBEMWZG?=
 =?utf-8?B?ZDhScFRHYWtmSU1vREFBczdOL3l6WDJhZEQ4UzVXcUhjQzM4cHJjUjlIbWhi?=
 =?utf-8?B?NlJSQ2VyZFc1QkFtOFhjL2g1TGtZVlVtSXB0QWgwNmxNbkMwQ1M3MzdvcE9J?=
 =?utf-8?B?aUhWSFdNNGlnVUpiWlk1TnZFMGdjbXFzRXhWVVRpNDErcE1DcGZiYW5YZ3RS?=
 =?utf-8?B?RjRpSlo4K0dIckVObi9wMmhFNzZuNU5xeDhtd09seEZITWRaNENlazF6UjZ6?=
 =?utf-8?B?bkVSUGxnYUNhNWRweXlyQ0lHaXh0anlhc1hJL3pnV0lZVzlGOTNNM1FKTnhS?=
 =?utf-8?B?OUhUSGtrTmlBNEkwRVVjRnVaZjJoL3RrN1JPWjRsYldYa3F3cTlrN3RVNWhy?=
 =?utf-8?B?UVFhS2l6WE5uTUJTc2NuUFA3T20yendjUEEwS3BUVE1Teld1STNCWGluOTJQ?=
 =?utf-8?B?U1Rxdm9XRzNDUGkrTnhObC80cEdVSWpDWDVSVVFxM0UwTzgrWHNoc2NLNHR6?=
 =?utf-8?B?RUQzUGMxUVhJZVI4c0dVREVNL0czQkh2SzVGV0g4ZlJTczlySTVtRXZGc3h0?=
 =?utf-8?Q?b/B/3j1uOVEk8fHmRT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3093ae14-1efc-4a30-3952-08dee5338e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 01:17:52.2418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ho81MWCJHLSWiIclphrqw6UhOzcq0y0qvwCC93FgsBrq5LWtcLF3iXKyLhduDFG6cW5HuTX7vdMlWVHR9QG9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2955
X-purgate-ID: tlsNG-720697/1784423877-F24B62AC-76BC05EE/0/0
X-purgate-type: clean
X-purgate-size: 1648

SGkgSmFuLA0KDQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
Ki8NCj4gPiArDQo+ID4gKyNpZm5kZWYgWEVOX0NQVV9UT1BPTE9HWV9IDQo+ID4gKyNkZWZpbmUg
WEVOX0NQVV9UT1BPTE9HWV9IDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4N
Cj4gPiArDQo+ID4gKyNpZmRlZiBDT05GSUdfR0VORVJJQ19DUFVfVE9QT0xPR1kNCj4gPiArDQo+
ID4gK3N0cnVjdCBjcHVfdG9wb2xvZ3kgew0KPiA+ICsgICAgY3B1bWFza192YXJfdCB0aHJlYWRf
c2libGluZzsNCj4gDQo+IEJ0dywgYXMgdGhpcyBhc3BlY3QgYmVjb21lcyBtb3JlIGFwcGFyZW50
IHdoZW4gbG9va2luZyBhdCBwYXRjaCAyOiBXaGF0IGlzIHRoZQ0KPiByZWxhdGlvbnNoaXAgb2Yg
dGhpcyAoaS5lLiBjcHVfdG9wb2xvZ3lbY3B1XS50aHJlYWRfc2libGluZykgdG8NCj4gcGVyX2Nw
dShjcHVfc2libGluZ19tYXNrLCBjcHUpPyBUaGUgdHdvIG91Z2h0IHRvIGJlIGlkZW50aWNhbCwg
YnV0IEkgY2FuJ3Qgc2VlDQo+IHRoaXMgYmVpbmcgZ3VhcmFudGVlZC4gQW5kIGlmIHRoZXkgd2Vy
ZSBpZGVudGljYWwsIHdoeSB3b3VsZCBib3RoIGJlIG5lZWRlZD8NCj4gDQo+ID4gKyAgICBjcHVt
YXNrX3Zhcl90IGNvcmVfc2libGluZzsNCj4gDQo+IFNhbWUgZm9yIHRoaXMgdnMgdGhlIHBlci1D
UFUgY3B1X2NvcmVfbWFzay4NCg0KSSBoYXZlIGNvbnNpZGVyZWQgdGhlIHNhbWUgdGhpbmcgYmVm
b3JlLiBIb3dldmVyLCBjb25zaWRlcmluZyB0aGUgQ1BVIGhvdHBsdWcNCnN1cHBvcnQgdGhhdCBN
eWt5dGEgUG90dXJhaSBpcyBjdXJyZW50bHkgaW1wbGVtZW50aW5nLCBpdCBpcyBkaWZmaWN1bHQg
dG8gcmVtb3ZlDQp0aHJlYWRfc2libGluZyBhbmQgY29yZV9zaWJsaW5nIGZyb20gc3RydWN0IGNw
dV90b3BvbG9neS4gV2UgaW50ZW5kIHRvIHVzZSANCmNwdV90b3BvbG9neSB0byBob2xkIGluZm9y
bWF0aW9uIGZvciBDUFVzIHRoYXQgaGF2ZW4ndCBiZWVuIGhvdHBsdWdnZWQgeWV0Lg0KDQpXaGls
ZSBpdCBtaWdodCBtYWtlIG1vcmUgc2Vuc2UgdG8gcmVtb3ZlIHRoZSBwZXItQ1BVIG1hc2tzIGlu
c3RlYWQsIA0KSSBoZXNpdGF0ZWQgdG8gZG8gc28gYmVjYXVzZSB0aGUgaW1wYWN0IG9uIHg4NiBY
ZW4gd291bGQgYmUgcXVpdGUgbGFyZ2UuDQoNClRoYW5rIHlvdSwNCkhpcm9rYXp1IFRha2FoYXNo
aS4NCg==

