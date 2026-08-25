Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89277C5B572
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399039.1635251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyirR-0005NO-OS; Tue, 25 Aug 2026 04:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399039.1635251; Tue, 25 Aug 2026 04:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyirR-0005NG-KS; Tue, 25 Aug 2026 04:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1399039;
 Tue, 25 Aug 2026 04:34:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wyirO-0005N8-HX
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 04:34:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyirN-009noE-4V
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 06:34:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a8d1b11-bab6-0a2a0a5309dd-0a2a4501cb88-40
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 06:34:04 +0200
Received: from [52.101.125.141]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a8d1b34-5984-0a2a45010019-34657d8d74ab-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 06:33:59 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSOP286MB7742.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:467::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 04:33:54 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 04:33:53 +0000
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
 b=mmESx522xrtaBhsQ5l84SFnJKJt7bl4ywWcBkQQI7pQzOfPortHdaFpM6WXPRJ2o54F8IQS+LKpNEnrZbJ46QrO5LxeRX+vaeGo1AYAO7xaAgJ1cZMmI2eXFPrO6wd9xdzNd8nAQejOtEX8xXxM3Svcrge5qNrf4wh7xv3UgumwzbzhJXUnOE6iJd47orluZwMkoWUFxUtpvUwlPmA9+zeTOponDABjDX1w581hvJXQbiaNoQ/xopDe6BkF/f3AhmgCEpOXnaM8f9Y4VhdD+Doyy/RaOoECunMBCpib1fzsWCMmnzFxKD9ovhEEidQSevwBIs7YrEwrCDsHzzbbR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSXJLd3NZY45/QGN9d/73fOosRtWj4l059gGuSH6Wzs=;
 b=jnm/XYkNrd+V5gtwUqtAcCAkkYxHWg2RVgWLxuiLyXOLksKullbRF1aIqEOAoVF6Szx9WgNkuSLUaCTfRiiFpr/NtMgo+4Rv8+cmPjrAoBwRTJuWUGWPAm/hGYx79l4wu52gO5FPPgAIrxYRTAYIquOJNEgkmICZncvMK/wGHQ2RyAdc2As4Nj8iXz/NKja++Zwo9J6XTPYb0yHmfwv7kbG0XtHUN8Yq8FltpYVdjNPV11/ZR6yxH7YWjvw4yLJqh9flIVvqXibsNaqxDYkaoVI7RQGw5xGKrx1Xoaobfg2xquXZbqPQEDgXCy7S815wB0Tj9T4YmyZtORmYWqxfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSXJLd3NZY45/QGN9d/73fOosRtWj4l059gGuSH6Wzs=;
 b=SnmucV3I8GKVxlHe/GSsErPu7bMlAhuGexnJ/ZsI2GDvGXX2KdB7ewTftx+GPG577gOjjhcfejH/QvXMzN/YQN5nbpfXzzsboZFPHwRl5aztKvYpyN8vGHpro3y6hfQmE52iHMEEGENwrJT9nJRfE3n+oFajxn8KvUwoXkMbCjU=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: RE: [PATCH v3] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
Thread-Topic: [PATCH v3] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
Thread-Index: AQHdM4NyLvQAa8Bus0iwWtzTdZAy7ras3w4AgAENCoA=
Date: Tue, 25 Aug 2026 04:33:53 +0000
Message-ID:
 <OS9P286MB7222E529B1FC372B81A1E3FA82AF2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260824044530.301938-1-taka@valinux.co.jp>
 <e6edf3f8-5085-4b5b-acdb-ac17402e86ee@amd.com>
In-Reply-To: <e6edf3f8-5085-4b5b-acdb-ac17402e86ee@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OSOP286MB7742:EE_
x-ms-office365-filtering-correlation-id: d215895e-e12f-46d0-e04e-08df026211d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 AmWuEqJlVFgRWMx2SAiO5zc/MCalapnyDHXqxq1+iCLNC/qLObqPMco1iisPV+vL2Lk7fbxxIP8bBWI2UBFXmcat7gan27ZmNKh+DcIAYs21nhGmkjuvkuVR111sRYc6mD1Ya7GC2Dk4arOVlyq4a8gMCRRPTqheNA32qr9LRVFXMTjjWyWUJ8l9ZvedJeRXkcLZ9YWE2rH+Lj6zeCQS4UFuhKq0Lhd+gwjmIg0qEq9utmDS7Jo17gV54+bsb5M7CM6IFn7Rz9LvXEFvnUUDcvHx3Z8OTdRJ+LyYnj3tKoI2BynTHKA4S3hsNR40bINSWm/X9ThzVIqWRS+HexgaY1aLmVypptBz1jkspalDMkS7bSJo0+8waP/CEMdCW3c2LWej0wpZHIbn8KrIxeQgrz/d7dbSkkYmoVzIk09iNdLtMDNQtHG7CnbLA1XMAH9aqScVrwXrI+bXa3QiCDNnZRNPSnzSu0SsjO5ZSXWqHUBWNufdjdGrZFNyzov4/NFR1cBXwkzI1f3xdtHM8xnbg8Ti4ejo69vb0xT+x7QbwjqfxHpbV983Tuq1NR2Icto3x0sgR1rJHTWMvrqXQudJZ1eKSy1kuvn2fWXCyOUTUMQlF9aOP7k6Z5wprP1dWSASTLD/KY4/i2EtAVvCiNXdIV4unEAdC+gfyDVHNEQ90Dq/lMoHrH9IMHTSed7Mc81M367RqfHBxg8ZirSc2ZegSh7DPH4hhgetBteJ7PCmBZg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzhRcVF3UlFZVlJ2aHE2aUQzb1Y1bTBuKzBSeHZxaWQvai9LQTJJdVYyTXJ2?=
 =?utf-8?B?dFNjanlubEp5NTBYUlVtYTBNMXVjYjdrWUhTWGJRbzRlTTVId1B6YlBsUFo1?=
 =?utf-8?B?M29FVVA5N3Q2TWRCRU9zNFRnVytiRi9iWkNKajJPSE9lcWV1UFZRWU1mamJ3?=
 =?utf-8?B?bDdTYWlUY0xTREl6Z3Y3eTVvR0VVcTR2bVc0K016ZFJkeFd2VzdGa2R0blNN?=
 =?utf-8?B?MXdXRlMreUR3Nnc2QTNyY3RUMTR1akE2UjJCVzcwZzNkRngxOUN5aFcwZ0Yv?=
 =?utf-8?B?WkFwM2dBQklMQUlPZjd1Wm9uY1F4Q3RSZWtUb1hqdTdxYjZuNDFvNThTaVFv?=
 =?utf-8?B?N1VlK1NoQTNnRUdoNXJ1VXFmaGF0MG9VSEVvNFF4L3piT1ZwVGtjSEtjYm1J?=
 =?utf-8?B?cU90M1NXdXV2ZVBablhoS0IvNjRCM3VnYTZoNmhSb3ZqZkVZUGtwUjVNMzZV?=
 =?utf-8?B?S1Y5TUN1OTRhZDEwYnlSV2Fqc213TmFmajV5RU9EdFB4a3lKUWdPVnRETGVv?=
 =?utf-8?B?MW5HRzg2bzVKZ0xEZTBCb0ZrVlNnYmlDN0Yrb3k0Y2RlbUFXZGVGTFdZd002?=
 =?utf-8?B?L1RRV0tmZzVHNURTelRCZkh0NnpQalFPN1lZd2VTQzZsTWh0QlpIeEttZGo1?=
 =?utf-8?B?Ukt1cmsyWFhLd0xOS2g0b3lFT1V5K2tHSnVxZ0pFeThJSjZWSFRsMS9BNFBP?=
 =?utf-8?B?TTVudTg0TGFZUk12U05ocnl5TElqRnVYVmpoeWhQc2JXZXh3bnhnZlNhMkt1?=
 =?utf-8?B?R0QyM1ppTEJnclZTL2NOSnh2NlRXb2RrNGJNakFZa1BVWmlGODRpSCtHQm9m?=
 =?utf-8?B?Z1pZVTMwY3pZVitUbGZnVUMrbXFtTmNRRDExSzBZRlJRclFYRGdINW4wR0dT?=
 =?utf-8?B?TmFERUJRZE1odk5JajltUDNYQ1hGZkR6cERabXROUHJkR3VISWJwSDZHdk95?=
 =?utf-8?B?WkNlcTR4MHM4enJyaEp6cFVORzRSeklreDkyUXorOG1ad2tpRTJCUHI4eWxR?=
 =?utf-8?B?Ry9UWHlQbzAwb09Bb2ZqK2hyMUl0eGFZMUdKV3NRaUdrYWE1ZTNPQTlycXFl?=
 =?utf-8?B?UUtMVXZKLzFmWGYyMWE2ZE1yb2tYNzJ4ZkorYU5rNXZrZjlCRDZlUjYxaFZ5?=
 =?utf-8?B?b2Z0MG0rUGsraTlMc1hHZmQwUG0wUzdzN0VuWGNicTEzTkxpR2ZUNWhLclNi?=
 =?utf-8?B?dDdUNWNGY1ZwSFN3eDdWTGxINzVVcFQvSlZtRStNZC9ibUMrOUF3d0k1VVVJ?=
 =?utf-8?B?S2gzdVpBSUZwSnNIQ0cvTEZqOGkxSXBQenA1dTBodFdvdldtd0U3aUxFMktK?=
 =?utf-8?B?WE9FN2Y4cWJ5ZGxoUlQwYVdSYlRLQkU3ZkFKSmhOTDZzV3JzUFEzbFF1S3Yr?=
 =?utf-8?B?RHRFalNKY2p4M25PeHNtNkZRZS9wanFhYW80SnB2UVdkSDlKMTlyQzVjMG1J?=
 =?utf-8?B?MDRjaTNvNjBLVEx4OUY3N1JQSmdnMnZURW92WDRCYWx3M0NuU24xVGJxWWF5?=
 =?utf-8?B?Tjhmb1NPOE5VQVJZS21sckNmaUJ6NFdqZW9UT05KckJ4ZnoydEhNTkVHcXRn?=
 =?utf-8?B?T0tNNUFKd1lIdVVLNWp1clROcVZPNzU4MnJycUFraEJ2THdQem1MMElvZXZH?=
 =?utf-8?B?dWtJN0E5TXBQcXNiL1lXS3poQkRZWTFjdk4remhIN0JGQ0JFOGN3bXY5SmtM?=
 =?utf-8?B?d0ZiWEVLZGtFME94SERvTzR0enRyeFUybzRRQ29ZNnpPV0xwdGh3OHphN1li?=
 =?utf-8?B?ZFlncUdQaFNVUTZKT3kyZmt2UWJGT0NFZnZEK3BmWHZvRmxWL3l4aEFYYVRp?=
 =?utf-8?B?NEI1OWNIQ3lDdEtZRVAydzY0SVBmMHpYUytCMSthZ01MUHpHL2pldkwxNktK?=
 =?utf-8?B?SGN1WFlldmx6dy8wZC9XM0ljbGkyYUJvdmpzcnE0S3V1cFlwcGJLdURTTlZa?=
 =?utf-8?B?NDNtejFDUHRlWmZrSWhJb2F1enZzdFNWQ2U3RmFBY0FSQ1VrMXg0Nng3a0xZ?=
 =?utf-8?B?R0szcDRycHV0OXJuMkNuS2NDY3pWMXJjZ2hqc2lLSG43eDVIT2JxZW02Yi90?=
 =?utf-8?B?VExvNUNYWitvei85bGxQdFU4bnNhUzNOUTB3Z2VCQUNhL1ZHU2l0cU5TeGJV?=
 =?utf-8?B?cnVWZjdlYkwxeGNzQ3Y0NjhRRHFyWU9hZGxRS1NiUjRxTk9mSVpyWjl3MlN2?=
 =?utf-8?B?aWVYZ2pFZGk1MTN3ZllhZmdLRHlVeFdpMFR5UmJRbGEyM1NwU01ZMlNNcDkv?=
 =?utf-8?B?QWdITXU5VFBvblI1WXF1ckpmOXI3ZDFQU0xVRldqMTJ4TlVDODR2SVRHOVlv?=
 =?utf-8?Q?znodGHR00qxIvy9B8L?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d215895e-e12f-46d0-e04e-08df026211d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 04:33:53.8319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4mEuN9K4cpl/HwQVzumZfuxWQA1tw4ZJ6RuYMlAMlmW/63hIAB0fJrwWvya61fXsbHKC8X90CnxdqQBlPGtXyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB7742
X-purgate-ID: tlsNG-d62444/1787632444-1E27A757-FE1907CC/0/0
X-purgate-type: clean
X-purgate-size: 6856

SGkgTWljaGFsLA0KDQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L3ZzeXNyZWcuYw0KPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC92c3lzcmVnLmMNCj4gPiBAQCAtMjI3LDYgKzIyNywx
MSBAQCB2b2lkIGRvX3N5c3JlZyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywNCj4gPiAgICAg
ICAqLw0KPiA+ICAgICAgY2FzZSBIU1JfU1lTUkVHX1BNSU5URU5TRVRfRUwxOg0KPiA+ICAgICAg
Y2FzZSBIU1JfU1lTUkVHX1BNSU5URU5DTFJfRUwxOg0KPiA+ICsgICAgY2FzZSBIU1JfU1lTUkVH
X1BNTUlSX0VMMToNCj4gPiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIEFjY2Vzc2libGUg
ZnJvbSBFTDEgb25seSwgYnV0IGlmIEVMMCB0cmFwIGhhcHBlbnMgaGFuZGxlIGFzDQo+ID4gKyAg
ICAgICAgICogdW5kZWYuDQo+ID4gKyAgICAgICAgICovDQo+IFRoaXMgY29tbWVudCB3YXMgcmVj
ZW50bHkgcmVtb3ZlZCwgc28gcGxlYXNlIGRvIG5vdCByZS1pbnRyb2R1Y2UgaXQuDQoNCk9rYXku
DQoNCj4gPiAgICAgICAgICByZXR1cm4gaGFuZGxlX3Jhel93aShyZWdzLCByZWdpZHgsIGhzci5z
eXNyZWcucmVhZCwgaHNyLCAxKTsNCj4gPiAgICAgIGNhc2UgSFNSX1NZU1JFR19QTVVTRVJFTlJf
RUwwOg0KPiA+ICAgICAgICAgIC8qIFJPIGF0IEVMMC4gUkFaL1dJIGF0IEVMMSAqLw0KDQoNCj4g
PiAtICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9ERlIwX0VMMSwgZGJnMzIsIDApDQo+ID4gLSAg
ICBHRU5FUkFURV9USUQzX0lORk8oSURfREZSMV9FTDEsIGRiZzMyLCAxKQ0KPiA+ICsNCj4gPiAr
ICAgIGNhc2UgSFNSX1NZU1JFR19JRF9ERlIwX0VMMToNCj4gPiArICAgIHsNCj4gPiArICAgICAg
ICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPiBUaGVyZSBpcyBubyBuZWVkIGZvciBh
IHNlcGFyYXRlIGxvY2FsIHZhcmlhYmxlIGlmIGl0J3Mgb25seSB1c2VkIG9uY2UuIEluIHRoaXMN
Cj4gc2VyaWVzLCBwbGVhc2UganVzdCB1c2UgYHYtPmRvbWFpbmAgZm9yIGBpc192cG11X2RvbWFp
bigpYC4NCg0KT2theS4NCg0KPiA+ICsgICAgICAgIHVuaW9uIGNwdWluZm9fZGJnMzIgaW5mb19k
YmczMiA9IGRvbWFpbl9jcHVpbmZvLmRiZzMyOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoICFp
c192cG11X2RvbWFpbihkKSApDQo+ID4gKyAgICAgICAgew0KPiBQbGVhc2Ugb21pdCB0aGUgYnJh
Y2VzIGZvciBhIHNpbmdsZSBsaW5lIGBpZmAgYmxvY2suDQoNCk9rYXkuDQoNCj4gPiArICAgICAg
ICAgICAgaW5mb19kYmczMi5wZXJmbW9uID0gMDsNCj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+
ICsgICAgICAgIHJldHVybiBoYW5kbGVfcm9fcmVhZF92YWwocmVncywgcmVnaWR4LCBoc3Iuc3lz
cmVnLnJlYWQsIGhzciwgMSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGluZm9fZGJnMzIuYml0c1swXSk7DQo+ID4gKyAgICB9DQoNCj4gPiAtICAgIEdFTkVSQVRFX1RJ
RDNfSU5GTyhJRF9BQTY0REZSMF9FTDEsIGRiZzY0LCAwKQ0KPiA+IC0gICAgR0VORVJBVEVfVElE
M19JTkZPKElEX0FBNjRERlIxX0VMMSwgZGJnNjQsIDEpDQo+ID4gKw0KPiA+ICsgICAgY2FzZSBI
U1JfU1lTUkVHX0lEX0FBNjRERlIwX0VMMToNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBzdHJ1
Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPiA+ICsgICAgICAgIHVuaW9uIGNwdWluZm9fZGJn
NjQgaW5mb19kYmc2NCA9IGRvbWFpbl9jcHVpbmZvLmRiZzY0Ow0KPiA+ICsNCj4gPiArICAgICAg
ICBpZiAoICFpc192cG11X2RvbWFpbihkKSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAg
ICAgICBpbmZvX2RiZzY0LnBtdV92ZXIgPSAwOw0KPiA+ICsgICAgICAgICAgICBpbmZvX2RiZzY0
LnBtc3MgPSAwOw0KPiA+ICsgICAgICAgICAgICBpbmZvX2RiZzY0Lm10cG11ID0gMDsNCj4gV2h5
IGRvbid0IHlvdSBjbGVhciBocG1uMD8NCg0KT2theSwgSSB3aWxsIGFsc28gY2xlYXIgaHBtbjAu
DQoNCj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIHJldHVybiBoYW5kbGVfcm9f
cmVhZF92YWwocmVncywgcmVnaWR4LCBoc3Iuc3lzcmVnLnJlYWQsIGhzciwgMSwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm9fZGJnNjQuYml0c1swXSk7DQo+ID4g
KyAgICB9DQo+ID4gKw0KPiA+ICsgICAgY2FzZSBIU1JfU1lTUkVHX0lEX0FBNjRERlIxX0VMMToN
Cj4gPiArICAgIHsNCj4gPiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0K
PiA+ICsgICAgICAgIHVuaW9uIGNwdWluZm9fZGJnNjQgaW5mb19kYmc2NCA9IGRvbWFpbl9jcHVp
bmZvLmRiZzY0Ow0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoICFpc192cG11X2RvbWFpbihkKSAp
DQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBpbmZvX2RiZzY0LnN5c3BtdWlkID0g
MDsNCj4gPiArICAgICAgICAgICAgaW5mb19kYmc2NC5zcG11ID0gMDsNCj4gU3lzdGVtIFBNVSBh
Y2Nlc3NlcyB1bmRlZiBmb3IgYSB2UE1VLWVuYWJsZWQgZG9tYWluIHRvby4gQ2xlYXIgdGhlbSB0
b2dldGhlcg0KPiB3aXRoIFNQRSwgVFJCRSwgZXRjLg0KDQpVbmRlcnN0b29kLg0KDQo+ID4gKyAg
ICAgICAgICAgIGluZm9fZGJnNjQucG1pY250ciA9IDA7DQo+ID4gKyAgICAgICAgICAgIGluZm9f
ZGJnNjQuZWJlcCA9IDA7DQo+IEZFQVRfRUJFUCBpcyBBcm12OSBqdXN0IGxpa2UgU0VCRVAsIHNv
IHlvdSBzaG91bGQgYXBwbHkgbXkgY29tbWVudHMgdG8gaXQgYXMgd2VsbC4NCg0KT2theS4NCiAN
Cj4gPiArICAgICAgICAgICAgaW5mb19kYmc2NC5kcGZ6cyA9IDA7DQo+ID4gKyAgICAgICAgfQ0K
PiA+ICsNCj4gPiArICAgICAgICByZXR1cm4gaGFuZGxlX3JvX3JlYWRfdmFsKHJlZ3MsIHJlZ2lk
eCwgaHNyLnN5c3JlZy5yZWFkLCBoc3IsIDEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbmZvX2RiZzY0LmJpdHNbMV0pOw0KPiA+ICsgICAgfQ0KDQo+ID4gLS0tIGEv
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NwcmVncy5oDQo+ID4gKysrIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2NwcmVncy5oDQo+ID4gQEAgLTI0Niw2ICsyNDYsNyBAQA0KPiA+ICAjZGVm
aW5lIFBNSU5URU5TRVQgICAgICBwMTUsMCxjOSxjMTQsMSAgLyogUGVyZi4gTW9uLiBJbnRlcnJ1
cHQgRW5hYmxlDQo+IFNldCBSZWdpc3RlciAqLw0KPiA+ICAjZGVmaW5lIFBNSU5URU5DTFIgICAg
ICBwMTUsMCxjOSxjMTQsMiAgLyogUGVyZi4gTW9uLiBJbnRlcnJ1cHQgRW5hYmxlDQo+IENsZWFy
IFJlZ2lzdGVyICovDQo+ID4gICNkZWZpbmUgUE1PVlNTRVQgICAgICAgIHAxNSwwLGM5LGMxNCwz
ICAvKiBQZXJmLiBNb24uIE92ZXJmbG93IEZsYWcNCj4gU3RhdHVzIFNldCByZWdpc3RlciAqLw0K
PiA+ICsjZGVmaW5lIFBNTUlSICAgICAgICAgICBwMTUsMCxjOSxjMTQsNiAgLyogUGVyZi4gTW9u
LiBQZXJmb3JtYW5jZQ0KPiBNb25pdG9ycyBNYWNoaW5lIElkZW50aWZpY2F0aW9uIFJlZ2lzdGVy
ICovDQo+IFBsZWFzZSBkcm9wICJQZXJmb3JtYW5jZSBNb25pdG9ycyIuIEl0J3MgdGhlIHNhbWUg
YXMgIlBlcmYuIE1vbiIuDQoNCk9rYXkNCg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS92Y3ByZWcu
Yw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPiA+IEBAIC0zMDUsNiArMzA1LDcg
QEAgdm9pZCBkb19jcDE1XzMyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBjb25zdA0KPiB1
bmlvbiBoc3IgaHNyKQ0KPiA+ICAgICAgY2FzZSBIU1JfQ1BSRUczMihQTVhFVlRZUEVSKToNCj4g
PiAgICAgIGNhc2UgSFNSX0NQUkVHMzIoUE1YRVZDTlRSKToNCj4gPiAgICAgIGNhc2UgSFNSX0NQ
UkVHMzIoUE1PVlNTRVQpOg0KPiA+ICsgICAgY2FzZSBIU1JfQ1BSRUczMihQTU1JUik6DQo+IFBN
TUlSIGlzIEVMMSBvbmx5LCBzbyBpdCBkb2VzIG5vdCBiZWxvbmcgdG8gdGhpcyBibG9jayBhbmQg
dGhpcyBjb21tZW50LiBQbGFjZQ0KPiBpdCBuZXh0IHRvIFBNSU5URU5DTFIuDQoNCk9rYXkNCg0K
PiA+IEBAIC0zMjAsOCArMzIxLDM2IEBAIHZvaWQgZG9fY3AxNV8zMihzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncywgY29uc3QNCj4gdW5pb24gaHNyIGhzcikNCj4gPiAgICAgIEdFTkVSQVRFX1RJ
RDNfSU5GTyhJRF9QRlIwLCBwZnIzMiwgMCkNCj4gPiAgICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJ
RF9QRlIxLCBwZnIzMiwgMSkNCj4gPiAgICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIyLCBw
ZnIzMiwgMikNCj4gPiAtICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9ERlIwLCBkYmczMiwgMCkN
Cj4gPiAtICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9ERlIxLCBkYmczMiwgMSkNCj4gPiArDQo+
ID4gKyAgICBjYXNlIEhTUl9DUFJFRzMyKElEX0RGUjApOg0KPiA+ICsgICAgew0KPiA+ICsgICAg
ICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47DQo+ID4gKyAgICAgICAgdW5pb24gY3B1
aW5mb19kYmczMiBpbmZvX2RiZzMyID0gZG9tYWluX2NwdWluZm8uZGJnMzI7DQo+ID4gKw0KPiA+
ICsgICAgICAgIGlmICggIWlzX3ZwbXVfZG9tYWluKGQpICkNCj4gPiArICAgICAgICB7DQo+ID4g
KyAgICAgICAgICAgIGluZm9fZGJnMzIucGVyZm1vbiA9IDA7DQo+ID4gKyAgICAgICAgfQ0KPiA+
ICsNCj4gPiArICAgICAgICByZXR1cm4gaGFuZGxlX3JvX3JlYWRfdmFsKHJlZ3MsIHJlZ2lkeCwg
aHNyLnN5c3JlZy5yZWFkLCBoc3IsIDEsDQo+IFRoaXMgYnJlYWtzIHRoZSBhcm0zMiBidWlsZCAo
eW91IHNob3VsZCBhbHdheXMgYXQgbGVhc3QgYnVpbGQgdGVzdCB0aGUgcGF0Y2hlcyk6DQo+IHMv
aHNyLnN5c3JlZy5yZWFkL2NwMzIucmVhZC8NCg0KSSB3aWxsIGZpeCBpdC4NCg0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mb19kYmczMi5iaXRzWzBdKTsNCj4gPiAr
ICAgIH0NCj4gPiArDQoNClRoYW5rIHlvdSwNCkhpcm9rYXp1IFRha2FoYXNoaS4NCg==

