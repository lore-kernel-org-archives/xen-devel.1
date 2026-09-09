Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEE7C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 08:57:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412685.1643060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4E7K-00023N-C4; Wed, 09 Sep 2026 08:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412685.1643060; Wed, 09 Sep 2026 08:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4E7K-00023F-9E; Wed, 09 Sep 2026 08:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1412685;
 Wed, 09 Sep 2026 08:57:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1x4E7I-000239-Cf
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:57:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4E7H-00CgMy-PU
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:57:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6aa11f5c-2eae-0a2a0a5409dd-0a2a45068c28-28
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:57:15 +0200
Received: from [52.101.69.118]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6aa11f6b-195a-0a2a45060019-346545765b56-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:57:15 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GVUPR03MB11305.eurprd03.prod.outlook.com (2603:10a6:150:33d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 08:57:09 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:57:09 +0000
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
 b=ke7BL2N39ZhKYS1uILv/wr9/0Fy7mzYmKYczeqWsKFBHtdTa8UmgCzpdQaTMHhsLjhCuem/vMVvaWKih7pu7uw8Zk67T+xisKURPNOAmhbftvIJOnrOgX2JXVA/smm/iwDetb5EX4VZWau1SnCHE/8iRx4tjq6H51aHxeDwuFd0OnmDDhkLV+KbKdeQ5rBeW43uU1vh5t7Wvl5OOZHODC3kU6yhoVVFnqPfWUH5wR3ndwMvzn9F+7MB8JdmjlFOuzw45pqdmSwS9Bb/+R565ALkxtpOqU/WKRNlcPpluxOWx7Li/4P5LlOUx7o+l495OcaI+pLWqSxA8lAA6kDcycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO75MlVDe0nMYZAvzFeDEUNClrnEUOmHUJcaSb/LUBU=;
 b=fODwZGr3GD1aBpxotbuYLQs1kak3n6rwsyeU/AawD/3p/pRSCuz5HPrMMgsMXvIWlinO5FrjzR9PWhkE7LK6cWXjO40xHSdScKP19+HdLdkaZk490DfcKWwTmGZ72o1pkjvHlV+XvwSo7BEhBIXPBCDXUUt8MZtqVp3hZU3BoEAIroa6wmudO2WmTFIrz7MM8Bu34Vx+e5/1mSiOLKjBcY4VYjzVdCAOqA+Dx17UwLTEExQQ+9umakK7TnvgwFoJTxoQ8B6eTHkGDWtoBOog20VYSjXgdVaRRXdrugsz+K/vNP2SM9avTFcVxnl59tPN2Y3QFT55iDkXGyBBD/JaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO75MlVDe0nMYZAvzFeDEUNClrnEUOmHUJcaSb/LUBU=;
 b=CP3zOy1wp/9pHUkPVwTH4DqxysZ/gjIRsFeBV108wCj6qInx9S6W44lYnHHTaoDu0GsfrhM3iyBBxfYPI2nfwkPlIgrHn6VoJdAcOd1+8e8UpvEup9S0zpFjYiVoyOZz5zSnpdi0rH8nooT8jng0bL8DywPBIdf/iAmN5cVkywfTLPM03tXqP6upnZSEixhdaT6KSFsnB5e1zgL3SBvjFy7Cfya3RZZIqYrcr6drCb8Kas2qUzUSJ+OwyPXWYynbb6RLNG9yeGWWU0wTt1tGiz9Em/mk+icKQGD+tWlsOaSf6loQX4oPbU00Kkpcr/5Uitv6ihG0pO2+7/5Ft6Gj5g==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v2] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdQDkyagFQfWFtmkmXmxebnPrTEg==
Date: Wed, 9 Sep 2026 08:57:09 +0000
Message-ID: <20260909085707.2359322-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|GVUPR03MB11305:EE_
x-ms-office365-filtering-correlation-id: f0a1711e-8c55-46c6-a376-08df0e5054d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|6133799003|18002099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 KM3xhJes4iGHoavvYnyFFg46sp0eGk1RCvQfiBajgLadbqrCXOYwdmDoUqh1f3eDPOnkxbFFatDrBxEphV8T/zRlZ6B+1TAN8t0pgVCiEza1eKWCrt+QxQeQnR+WWiXNSutc0lTyFu1DN4kpYCCREgZBHRyRZ8KqCWbad5OgOaZBvSb4TFtSl3XrPdDf9kCxI0AxXI1f4MGD0429qJ5s768I+E/4Z3+Tl19DJwie7XC9MEA1/pYihcQgRxY48YsPBrSqbDm9Ee3X4xrznx1D4yMJRZWr3q16Arbpgt0f0+4UkGTHXkT6Gi7SIdJyxfUO9BiOiqQ/DkZokU4SIKjOSV7IYnu+mRObTNnGn082GYXezYJfwuUGr0afMIy9AxXQJDHSXFQdRSGHRtq8ngUo0dC0CYgA25b7ONRdmzJv46nM7y2t+J6KjJ39ymYiFdMgE8dY98ABVpDgJAWirFJYF0vwsO5DLObcz3e2oL+riANBjRDBIHf8OVx3ixVrkLp979md9o+VB9Bua9dC5vCStaSno4/xfGXAaz0Nt0kCz8DY1qT/TASoqdfLEiQNNDh1VBRX+381ib0cEaEZhoUAT4Qst3OHn/kDi3sZJTenbbFk/of0SMrnT/D4X5ZGQ4yI/9Aj23q/QBZPbvAiRhEbe8XakPCU0N0ocpq2JbH/WnN73dKHttkowUQMSGNvSO8zwAfUdn4ZZgS9XkWFh1/5JXojW8Jhd2WNrl5owWk4bow=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjlxT09sd3VCSVBiRDcvOWxiMUZwRVBZZlRFTHk3QUtFbU5PK2NsajF1MXNm?=
 =?utf-8?B?eGovN0k2MEZJNTNPRGh4eEs1RFJyQjl5Wkp4TXBHYi91S3cyY0RPL1RKNFc2?=
 =?utf-8?B?Skd5Skp5MS9ZTVlWcmo3ZitObjF5YmdnWGNLRWFwQlNIY21pbU1wZEJuNGFD?=
 =?utf-8?B?bFNaV2NZQ0FYUHpCSm52cm9uWjBwZ2ltejdFclBrcE93ZnZWMW9sQXMwUncx?=
 =?utf-8?B?K2wrU0pqcUl4UEkrcHgrNGd2N0JodFBOOVlvQXk0QmFQNS93c3JBU1l1WVhl?=
 =?utf-8?B?dWpZWnhjSnFqMlh3UWJuanl0eksxZkhKemx5VnN0UHdZNEZNNTNkZHhnMHh2?=
 =?utf-8?B?dnh4YVJjL2JWOWs3Yitudy9JLzZpQ0xyaVZCaSsrcXI2T1Urc1FQZmJBSlBh?=
 =?utf-8?B?eHJGaHZ1L0xUQnZYYTNWbHpmV2Z0RmRIcTk4SW8vdUhUWllmbk1yajl5Szgv?=
 =?utf-8?B?V29MTjIrNE1TQ2NSRjlicVQ4QTNidUFLcFBUQUFyKzZWTkl5NVNnTmVZNkVZ?=
 =?utf-8?B?OE56eEhZdjQ1VXlQd1FVbk1pYXdGeE1jTy9NRkNYUllRSlZxMHB2ZDdDREsr?=
 =?utf-8?B?dGdCell3YWt5enZYM3hhOGFqMW10VTBwdFVSYXpxWFRTRE9QRERXZk5lbFlS?=
 =?utf-8?B?NXVOL3p5TzhqaWZSUCs0YzBXZnJXMUJJVE5OUEdYbCtMSmdESDRyMDV2RlIx?=
 =?utf-8?B?aG56eENTMExQQjNSWml1U3gzRWdZSWs5MUJPeTFuN050TEVEbG1sNTNlbWln?=
 =?utf-8?B?MWtMKzAvV0g0Y0pNV1BZN25aMTdLMkVnM1k4TC9yYmVBbHoxTDI4NThDeVJE?=
 =?utf-8?B?YXlnN1k2NUFZZkZBQ0h3VGl3MGNqK083ZExlcklCSVNaNlEvK3FhcHU0U3hL?=
 =?utf-8?B?THpNT2VmM3F6VkJBZm80RGdaRjU3UTJGQUlEZDJBU2NCYmFzMm41cUZJNjJr?=
 =?utf-8?B?S2dUUUxtby9sbEZWNitveUhDQjV5Snk5K0ltR1NsUy9wQ29GNGZrWWVqOU43?=
 =?utf-8?B?SmJkWi9ZTzd2cUltZUNMWW1oQ09CMHdvVkI1UzlQUEZWY0ZteEVPWlBiNUxw?=
 =?utf-8?B?STFibnVZK0ljalpCdzJUK2JVYTlsdklBOUFVQ3Q2ajFVZVRCSXQ1czQwT3ZC?=
 =?utf-8?B?TjZnVktuS25YalQ2MFBHNUVSOTZ5NFg0bUtRQ1hQSlI3bGZOK0EyTkphYlM2?=
 =?utf-8?B?ZDM0VEh3WWtQSzNUNVNEanJweURqcWI5WnA2NTdDRVhMOXNkZ3hGbmFaUHI0?=
 =?utf-8?B?bVFZRmd3RjhGWDdaUUhNN3JlUDdaS21acHNMVXB4VDJMTndvWVI2aVNPYTFN?=
 =?utf-8?B?RW1jL1VhVFJWTHV6SWR2TkduN0JZQ0hQTXp2WHpIVXV6MmFsSU5nbk9LSWtT?=
 =?utf-8?B?bm81cGMrSGxiYnlLSDNxVStjVG1RN1RwUkhrcEc0dzl2eXU2RzJ3Q1ZMbTdO?=
 =?utf-8?B?eGFObGEveStCZHVBWW5zTGh4YnlUZ1lUYkcyczlVdG5hWDZUL2ZkWEdwNG9I?=
 =?utf-8?B?ektyclNkLzIza1VYai9JYXNRZ2ZTbk1uSmJDaVZER3BOK1dBeG1GWmlsdDN5?=
 =?utf-8?B?VDFUQ1JSK3lMY0F0U0s4RDBtUGVsQ1ZFUWkvUWVjYnpPWnRlZjlVY0IxS1R1?=
 =?utf-8?B?a3VoVERvSkpVd2d5VG9jSWVBcWc2K2laeHp4UDdwaTJwVXdSd0JsZ1p5bzAw?=
 =?utf-8?B?ZDdiZXJmQkp0NWR0ZnpHQTZPdEczVWx4dG5waFlaVTRjcTVTNnYreXBsaHBI?=
 =?utf-8?B?NjhrMzBoZTlVQk9PMDdXcGJFYkxsZGtMUk16dCtlMUxwUlhhY1huK3NnY0N0?=
 =?utf-8?B?ZDFzODNBVXg5dGQ3Z1piaXdMY3piMENMelduQktjbXFyOXVSR0NJaXplSEgr?=
 =?utf-8?B?S2xZd3EzVXdXOUhmVExnVTBMZTZlaHNmdVdrZDBuemU1dXg3M1hVMmNBek5o?=
 =?utf-8?B?YnE4ekxIZndMZElrTDlpblpSTjY5WFVCcEFGc3pRT0hOanVkOTlJWDdnekVo?=
 =?utf-8?B?NEx3am5BQ0pHaTF3dVMyZk03Q2lPYy96TUtnK2VqcXNJSnhiNkY2VVZjUGt1?=
 =?utf-8?B?d25XVlRRaVRldkxVRlNqL0g5SmpWaDUxTzFCRWRtOE1uU05PYWJlNEJ2SFRW?=
 =?utf-8?B?S3NQdmdna0s4MjNlb3Fsa3BDZG1uRGtnbVp1Z2hoV3pmOCtxWFBhRHBlY0FW?=
 =?utf-8?B?MmJxdzFOM0c2eG5yb1pyeXJQUTZlUjczN1FUN1dXKzFRMDNQNHFodTdRMHFr?=
 =?utf-8?B?bkkvd05CMFNMYnRFL3FsVmZHS0pYajlBczU5VGYyb2w5L2hFUWNESHhubVQw?=
 =?utf-8?B?VVhjV0lOa3lLZUttQThLK0I1enFRTDNxdU5yYnVoRkppV2t5d1dCRXhGeWF3?=
 =?utf-8?Q?lmMYawhLq8+orLH0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B53AA722D342494C882DB7FA3CED37BE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a1711e-8c55-46c6-a376-08df0e5054d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 08:57:09.2968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyDwndxF2nl2oz4iPVhc9jWJL7JW2cKwF9hHIpLGvj16X5uQ86UxWSCM+hznSTbhR31kk5c94SJllbT8aZ+GNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11305
X-purgate-ID: tlsNG-16d1c6/1788944235-F7CCD77B-003003ED/0/0
X-purgate-type: clean
X-purgate-size: 6142

QWRkICJzZWNsYWJlbCIgcHJvcGVydHkgdG8gYmUgYWJsZSB0byBzcGVjaWZ5IHNlY3VyaXR5IGxh
YmVsIGZvciBhIGRvbWFpbg0Kd2hlbiBYU00gRmxhc2sgaXMgZW5hYmxlZCwgc2ltaWxhciB0byB4
bCBjb25maWd1cmF0aW9uIGZpbGVzLg0KDQpDdXJyZW50bHkgZ3Vlc3QgZG9tYWluIGNhbid0IGJl
IGNyZWF0ZWQgYnkgWGVuIGluIGRvbTBsZXNzIGNvbmZpZ3VyYXRpb24gd2hlbg0KRmxhc2sgaXMg
ZW5hYmxlZCwgYXMgZG9tYWluIGlzIGFzc2lnbmVkICJzeXN0ZW1fdTpzeXN0ZW1fcjp1bmxhYmVs
ZWRfdCIgbGFiZWwNCmJ5IGRlZmF1bHQsIHdoaWNoIEZsYXNrIGRlbmllcyB0byBjcmVhdGUgYWNj
b3JkaW5nIHRvIGN1cnJlbnQgcG9saWN5Lg0KDQpCZWNhdXNlIGNvZGUgZnJvbSBvdXRzaWRlIG9m
IGZsYXNrIGNhbid0IGRpcmVjdGx5IGV4ZWN1dGUgaXRzIGludGVybmFsIEFQSQ0KYSBuZXcgcm91
dGluZSBmbGFza19jb250ZXh0X3RvX3NpZCgpIGludHJvZHVjZWQgYXMgcGFydCBvZiBYU00gQVBJ
IGV4cG9zZWQNCnRvIHJlc3Qgb2YgWGVuLCB3aGljaCBpcyBhIGRpcmVjdCB3cmFwcGVyIGZvciBz
ZWN1cml0eV9jb250ZXh0X3RvX3NpZCgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBTZXJnaXkgS2licmlr
IDxTZXJnaXlfS2licmlrQGVwYW0uY29tPg0KQ0M6IERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBh
cGVydHVzc29sdXRpb25zLmNvbT4NCkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KLS0tDQpjaGFuZ2VzIGluIHYyOg0KIC0gYWRkICYgdXNlIGZsYXNrX2NvbnRl
eHRfdG9fc2lkKCkgd3JhcHBlcg0KLS0tDQogZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290
aW5nLnR4dCAgICAgIHwgIDggKysrKysrKysNCiB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBs
ZXNzLWJpbmRpbmdzLmMgfCAxMSArKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hzbS94c20uaCAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICsrKw0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAg
ICAgICAgICAgICAgICAgICB8ICA1ICsrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspDQoNCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rpbmcu
dHh0IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KaW5kZXggYmNiMDZi
Yzc5Ni4uZmNjN2JlMGZmYiAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUv
Ym9vdGluZy50eHQNCisrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQN
CkBAIC0zNDUsNiArMzQ1LDEyIEBAIHdpdGggdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzOg0KICAg
ICBub3QgcGFzc2VkLiBUaGlzIGNvbmZpZ3VyYXRpb24gcmVxdWlyZXMgc3RhdGljIGFsbG9jYXRp
b24gKHhlbixzdGF0aWMtbWVtKQ0KICAgICBhbmQgZGlyZWN0IG1hcHBpbmcgKGRpcmVjdC1tYXAp
Lg0KIA0KKy0gc2VjbGFiZWwNCisNCisgICAgQSBzdHJpbmcgcHJvcGVydHkgc3BlY2lmeWluZyBh
biBYU00gc2VjdXJpdHkgbGFiZWwgdG8gdGhpcyBkb21haW4uIEVmZmVjdGl2ZQ0KKyAgICBvbmx5
IHdoZW4gRkxBU0sgaXMgZW5hYmxlZC4gRG9tYWlucyB3aWxsIGJlIGNsYXNzaWZpZWQg4oCcdW5s
YWJlbGVk4oCdIGlmDQorICAgIHRoaXMgcHJvcGVydHkgbm90IHNwZWNpZmllZC4NCisNCiBVbmRl
ciB0aGUgInhlbixkb21haW4iIGNvbXBhdGlibGUgbm9kZSwgb25lIG9yIG1vcmUgc3ViLW5vZGVz
IGFyZSBwcmVzZW50DQogZm9yIHRoZSBEb21VIGtlcm5lbCBhbmQgcmFtZGlzay4NCiANCkBAIC00
MjIsNiArNDI4LDcgQEAgY2hvc2VuIHsNCiAgICAgICAgIG1lbW9yeSA9IDwwIDEzMTA3Mj47DQog
ICAgICAgICBjcHVzID0gPDI+Ow0KICAgICAgICAgdnBsMDExOw0KKyAgICAgICAgc2VjbGFiZWwg
PSAic3lzdGVtX3U6c3lzdGVtX3I6ZG9tVV90IjsNCiANCiAgICAgICAgIHZjcHUwIHsNCiAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInhlbix2Y3B1IjsNCkBAIC00NTMsNiArNDYwLDcgQEAgY2hv
c2VuIHsNCiAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MT47DQogICAgICAgICBtZW1vcnkgPSA8
MCA2NTUzNj47DQogICAgICAgICBjcHVzID0gPDE+Ow0KKyAgICAgICAgc2VjbGFiZWwgPSAic3lz
dGVtX3U6c3lzdGVtX3I6ZG9tVV90IjsNCiANCiAgICAgICAgIG1vZHVsZUAweDRjMDAwMDAwIHsN
CiAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiLCAibXVsdGlib290
LG1vZHVsZSI7DQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1i
aW5kaW5ncy5jIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1iaW5kaW5ncy5jDQpp
bmRleCA0MWQ3MmQwZDU4Li4wYjBlZDZlMjVkIDEwMDY0NA0KLS0tIGEveGVuL2NvbW1vbi9kZXZp
Y2UtdHJlZS9kb20wbGVzcy1iaW5kaW5ncy5jDQorKysgYi94ZW4vY29tbW9uL2RldmljZS10cmVl
L2RvbTBsZXNzLWJpbmRpbmdzLmMNCkBAIC0xMSw2ICsxMSw4IEBADQogI2luY2x1ZGUgPHB1Ymxp
Yy9ib290ZmR0Lmg+DQogI2luY2x1ZGUgPHB1YmxpYy9kb21jdGwuaD4NCiANCisjaW5jbHVkZSA8
eHNtL3hzbS5oPg0KKw0KIGludCBfX2luaXQgcGFyc2VfZG9tMGxlc3Nfbm9kZShzdHJ1Y3QgZHRf
ZGV2aWNlX25vZGUgKm5vZGUsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBib290X2RvbWFpbiAqYmQpDQogew0KQEAgLTIxLDYgKzIzLDcgQEAgaW50IF9faW5pdCBwYXJz
ZV9kb20wbGVzc19ub2RlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSwNCiAgICAgYm9vbCBo
YXNfZHRiID0gZmFsc2U7DQogICAgIGJvb2wgaW9tbXUgPSBmYWxzZTsNCiAgICAgY29uc3QgY2hh
ciAqZG9tMGxlc3NfaW9tbXUgPSBOVUxMOw0KKyAgICBjb25zdCBjaGFyICp4c21fc2VjbGFiZWwg
PSBOVUxMOw0KIA0KICAgICBpZiAoICFkdF9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAieGVu
LGRvbWFpbiIpICkNCiAgICAgICAgIHJldHVybiAtRU5PRU5UOw0KQEAgLTE0MSw1ICsxNDQsMTMg
QEAgaW50IF9faW5pdCBwYXJzZV9kb20wbGVzc19ub2RlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAq
bm9kZSwNCiAgICAgICAgIHBhbmljKCInbGxjLWNvbG9ycycgZm91bmQsIGJ1dCBMTEMgY29sb3Jp
bmcgaXMgZGlzYWJsZWRcbiIpOw0KICNlbmRpZg0KIA0KKyAgICBpZiAoIElTX0VOQUJMRUQoQ09O
RklHX1hTTV9GTEFTSykgJiYNCisgICAgICAgICAhZHRfcHJvcGVydHlfcmVhZF9zdHJpbmcobm9k
ZSwgInNlY2xhYmVsIiwgJnhzbV9zZWNsYWJlbCkgKQ0KKyAgICB7DQorICAgICAgICBpZiAoIGZs
YXNrX2NvbnRleHRfdG9fc2lkKHhzbV9zZWNsYWJlbCwgc3RybGVuKHhzbV9zZWNsYWJlbCksDQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkX2NmZy0+c3NpZHJlZikgKQ0K
KyAgICAgICAgICAgIHBhbmljKCJJbnZhbGlkIHNlY3VyaXR5IGNvbnRleHQgZm9yIGRvbWFpbjog
JXNcbiIsIHhzbV9zZWNsYWJlbCk7DQorICAgIH0NCisNCiAgICAgcmV0dXJuIGFyY2hfcGFyc2Vf
ZG9tMGxlc3Nfbm9kZShub2RlLCBiZCk7DQogfQ0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hz
bS94c20uaCBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KaW5kZXggOTgwOWUwMDVlMC4uNzNkMDU4
YThiMiAxMDA2NDQNCi0tLSBhL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KKysrIGIveGVuL2luY2x1
ZGUveHNtL3hzbS5oDQpAQCAtMjYxLDQgKzI2MSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoYXNf
eHNtX21hZ2ljKHBhZGRyX3Qgc3RhcnQpDQogDQogI2VuZGlmIC8qIENPTkZJR19YU00gKi8NCiAN
CitpbnQgZmxhc2tfY29udGV4dF90b19zaWQoY29uc3QgY2hhciAqc2NvbnRleHQsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNjb250ZXh0X2xlbiwgdWludDMyX3QgKnNpZCk7
DQorDQogI2VuZGlmIC8qIF9fWFNNX0ggKi8NCmRpZmYgLS1naXQgYS94ZW4veHNtL2ZsYXNrL2hv
b2tzLmMgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCmluZGV4IDkwMjg1NzQxNWIuLjliMTA3ODRh
Y2IgMTAwNjQ0DQotLS0gYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCisrKyBiL3hlbi94c20vZmxh
c2svaG9va3MuYw0KQEAgLTIwMTQsNiArMjAxNCwxMSBAQCBjb25zdCBzdHJ1Y3QgeHNtX29wcyAq
X19pbml0IGZsYXNrX2luaXQoDQogICAgIHJldHVybiAmZmxhc2tfb3BzOw0KIH0NCiANCitpbnQg
Zmxhc2tfY29udGV4dF90b19zaWQoY29uc3QgY2hhciAqc2NvbnRleHQsIHVpbnQzMl90IHNjb250
ZXh0X2xlbiwgdWludDMyX3QgKnNpZCkNCit7DQorICAgIHJldHVybiBzZWN1cml0eV9jb250ZXh0
X3RvX3NpZChzY29udGV4dCwgc2NvbnRleHRfbGVuLCBzaWQpOw0KK30NCisNCiAvKg0KICAqIExv
Y2FsIHZhcmlhYmxlczoNCiAgKiBtb2RlOiBDDQotLSANCjIuNDMuMA0K

