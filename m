Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC58C79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 10:40:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412784.1643132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Fif-0003aL-1E; Wed, 09 Sep 2026 10:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412784.1643132; Wed, 09 Sep 2026 10:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Fie-0003aE-Ur; Wed, 09 Sep 2026 10:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1412784;
 Wed, 09 Sep 2026 10:39:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1x4Fid-0003a2-Hg
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:39:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Fic-00Ed8O-UW
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:39:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6aa13775-bab6-0a2a0a5309dd-0a2a450aabf4-12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 12:39:54 +0200
Received: from [52.101.65.86]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6aa1377a-f2d2-0a2a450a0019-346541564edc-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 12:39:54 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB7000.eurprd03.prod.outlook.com (2603:10a6:20b:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:39:51 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:39:51 +0000
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
 b=wCmqF2dy/SDrDiTVE791ryu3SotJ463xfP5BmOSIQkOkS90+dpOW0F4EJSCXlszW4rsh6Psqbe2/ahTNXd3Wy/mm9kNnloMhxVOT69JQCC6MpTJie+EZ38aqVG+a5aWR50LyTop2BXGrBCw93+EVDbjKu6royGGXrIcb1l5Vy2wUlIKl48Ubl1mYP4kzMXW02w2FH7f86x75jRlKMPFeFUFrhkYvnJYFb7epUzXNFlkimN/EfuxjUpTgJsjAlbKUxUXSw4IL2ErQy+6RVjFKeYMfc5Q22gcuAfkUVHAd7aq0bzpQwMjbAEAUpTZ0WnYLGKxex2dH4MQ4BUtKc5Umuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqAx4JXBDjsuTjvGn0Yn946AEs/s02oIA1BLDhDbrWo=;
 b=oNhhiBX5yQuoGDtsrC3PELnBrqbEFq+r3yNc8oz7GFo3pi9WUsbE65YKY3X53E7y5CJaHm50u2zaSj04ukPDpmH8eJBvQtXu62+kBxfEVpWfiXDPGILW9R+4v8mRGO3L3hK5qecvOv5/hKXJixID41cKbS4q/nRSe//pAkwOxW1Gc0hErV7pMDHC6a03fvjw+ZHCxrLjJmO3PRq+RwP2aSoyyrOJLqdEOFo350xDxA/IvjwGVsZHfQjJuo+9Qllg7nRtbWDhLsx8AhbLNoA+V6h2XKJzIRWTqKi3A5KvsMKtDuQ0m+Wlq6bCOK21YHnLn6D9KysZm8xiSriBZgXg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqAx4JXBDjsuTjvGn0Yn946AEs/s02oIA1BLDhDbrWo=;
 b=Pv9HgM9I4hecbTg46yz86PiP/LSyxcg0k80BA8hb27oLJI7Zn6hSx4CnfmEkxoeaqSRST5YaY3xs6jTXeuuEzvRA6Z8sj6hMDWQvDeRKER5BA6zr0FmYr7ixaFiAAtH7n0PcdxViSPGco5mHCxEDDko+sltD36//GajwCiSsDTnJL6j/PRxv5NJc+G15S/HnubOCAsci2HTT+IhFDwhe1ys5tX4yzltDtSuSOoXuYHV+CPXpGsDIEyPvwxBMFZROEpvixNw8hlp+25t5Xaq5MvZDP/UhMPX/OvGZI9OvqxEUQpat8VPAABMJrqnbF5DfaMxVyZA90d1xkF7OSZpCgg==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v2] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdQDkyagFQfWFtmkmXmxebnPrTErbF9McAgAAZ2wA=
Date: Wed, 9 Sep 2026 10:39:51 +0000
Message-ID: <d6458362-9fc7-4a5d-9063-c4ac7d21bb01@epam.com>
References: <20260909085707.2359322-1-Sergiy_Kibrik@epam.com>
 <3f2bb6fe-a517-421f-adb9-c33d67ef4591@suse.com>
In-Reply-To: <3f2bb6fe-a517-421f-adb9-c33d67ef4591@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS8PR03MB7000:EE_
x-ms-office365-filtering-correlation-id: 0abb13f9-ffc1-4d71-904f-08df0e5ead8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 jz+8O25GAgzbC0mg0uqOCvOg5LwLrClT9vikrLzZrczNRcAto+TW3iaaR/gyKYxcBWJnpP6+yez/5Qh1csGdK2P0sRDmE/QxiGFhGCDJv3Q0oMYXvSiqWJYj8TPa6Ntm5j4mojL5nNfyqpwnAxK0S1jez6bFlPM+NK2zIjMQgyUXhLuQnh20AdU8ScT9ddcAdYnkBPRhR7zSHsmqOSIRRaFs6qv/VYEAB7zGK366ZyZGTvS9mgbxj38XsOj8XQaY8bxh+QiraDWEZNx1FRvHIpr8R6+oWswIjYCIHSp86lYKlZPAd51JGafbcFb1z4jk/cCNNtUrEXRlzVLUZrc2Gyjp3cMEdPmM/mdc1tYm4C9cNzkTX+lg4K7gYLKzXYcvoKgNsOdMwI9F0wwABa4BiEvms22N6rBGYFz/0O9hl3soK4Pf1BT1ByDbOsOxZ1h7WMw2JjRlvGZivdYT07WCl1iRNwSsZXUaTQmpyKwNtfJZ9pRB/DMYnm5GMtMAMWVodP2EE3geKCKmEPSYyUHGC59Z16bmAnzR7xhkJwyZ5nmEsBAZMnRWHjAkXLCj6rVgVvC4O//9OFrr6snuPu1R73TJgQMqQD+Z+FqpcKhDWX5VyjsOBYeZ+mikVOyXJaVJiYNwyQSrEgXD0nmenqBHb+dzkJs3I7ZzeLNNyhFycTMm7cZRgnhavV1CP0ZscUz7Tqos9xSHYrLz9gPQn1sYIwLePXQzscybR0BS7KYPDUE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elYxcXpLeW5iYTg1b1VDaXdJRytCZXRwUXZPVGVYeGVvOE0vemgwZXhXUTg2?=
 =?utf-8?B?MTBwa3Iwd0h3THlRcWhhZmtidkVsQ3hFQ3pBV2lkeE5RdnVoWlJKMFdzN1lq?=
 =?utf-8?B?bTAwbzdwdzQyOVVZaWdzOENBbStnWUhWOXg2WUlaK2xxazFyaTluU3kzaFRl?=
 =?utf-8?B?cmVPWnV4VDg5RlJvc3JESDlsQU9DUnZzV0NqWHo4akpISlJNR2ZpRkY2dzhR?=
 =?utf-8?B?aEFlbXgzVGFSV3VqaFc5bGQrdFIrWFd1RUYvSnk0TVA0bVAyVnVRZDhvRklP?=
 =?utf-8?B?SGV2Tmt1R09XMnlJQzFKWTAwbXpOelFDeDcwQjZGRFB3a0g4TVA1R3ltYy9x?=
 =?utf-8?B?azlaVzllUjN4UVZVS29MWkpQRFhKelE3THVWWUFGTEtwQm94T3JVK1BzeFE0?=
 =?utf-8?B?QUhEd3NkRzcrZFBYNVlhN3dEY0lTR0tJQ2dzRFRucjFFUEthYXB1dVdpRUlY?=
 =?utf-8?B?aVFkOUt0YmxNemM3c2RabFNWTGxXS05Xc0tjOTZKNmNQYzd6STJMdmdSdWt2?=
 =?utf-8?B?VWxxZlJPY3JzUzJZZnk5ZDhNK0pTVE1sNnR1dzlpSnBXYWxoSlpTKzNUc0Yr?=
 =?utf-8?B?Wllpc3pxeWVXUXNTRUZmdmpBMXpVRlBXQzYvNkthQnB3UjZMMlVnVlVpM3dC?=
 =?utf-8?B?aUZ6Y2Jmc21QTGxqM0lxV3d6V2kwYTRTd3FrcHJDYnNHdy84Q2xkTDB5cTRv?=
 =?utf-8?B?V3A2clJrTVBid1p3ajVCN1UzT2hhUkpWSVgwQjIyTUVWTGZBaFhnUzZ6VTZl?=
 =?utf-8?B?VE03Z0dLTE5xQm1KTDdIZUJpTkhIc2tzOGYwQjBZQngvcWJ1RC82SXh5K2pT?=
 =?utf-8?B?MTFuckVwckZncG1NVm9FUVdJSE1RRGN6bXlBK25CMHc0RDlxTG1hR3pvOFZy?=
 =?utf-8?B?ZUwxcU1sbG1wQ2ZXTVMvZEVsTWN5RU9hcWhRNTlJZWdVVEFuRnhRRS93OEpH?=
 =?utf-8?B?RlhVRG5PdXVJemtaY0k2MEEvZUErQ01rRXFZaW92dXVFY0pYOFlndlkzeWN2?=
 =?utf-8?B?T3B6enhER1V0M2hRdlNGbjVxcHJuQUltdUdNVFNOT1lUOXVhanhlcGFvSHdz?=
 =?utf-8?B?ZldDQ0l5TUJqS0x5MXFpVXQ5V1pUcXUySkdHUVg3cHN4UGxXTE9WaVFvNkFu?=
 =?utf-8?B?R244WVVRMEpWUmZIYUdnYURCdEhhN21oRlZSTTlNa1hodXdLRmx0bHhZeTVY?=
 =?utf-8?B?SWp1dXNIejM0SkN0L3VWYmtBSktUeTV5YkdjTmMxNllOZFh2RkhnQzlHcTJL?=
 =?utf-8?B?UlBKQ3NqcWUxSndOcFJHdWs2RzliTmZTVkhyWTRjbHFSN1ZtTVJZQmd5bUxC?=
 =?utf-8?B?VGhjRnpEYVpONU1JcVMyT2FjanVUWldyV3RaZTlJclBaTldFZ0dpTndkUlla?=
 =?utf-8?B?RzNIZkRLajJ5WXZaZ1hvU3F3bUFNT0UvZUh5eWkxUlh5UmZsbEJmdXpyMVFW?=
 =?utf-8?B?NUVDd0dVQXA4NGlET2lNY2c0M0hPaXYrdWZHOS9PSjd4RWVYRmtjSTlVYzBv?=
 =?utf-8?B?bGFJQk1CckxJbzRic3NNMnlHVDl2TzNnYklaM1RCZG9lWUZzVHpQMjlCOGJN?=
 =?utf-8?B?MnZUZCtoaitMN0xLWEI4QkVPbUMwT0duTjk3Ym4xTGJDSXMrYzd6QW1JdnRJ?=
 =?utf-8?B?b2V3aU0wRlB3Z2dneFNVWGRsSzdIT0ZGUVBSK09YK09VeDRTcjJDQTlMRkFD?=
 =?utf-8?B?elVJRG14WWU4TGx4Qk5tYlZBejFjTUgyZFkxQmwwNlRQUEkzSUIrZzhOZTNI?=
 =?utf-8?B?eTc0Qm1UUktMTjc0SVgzS1VFdnVlM1lUbEhCQk5oUTRyZityUWEvRGhYVExn?=
 =?utf-8?B?Tm1BSHE4V1ZyYXB3SVRnajN3M3lxd0N2aVUza2VwWHR2UnZLSXNia095cFp0?=
 =?utf-8?B?L1hITlRaTU5MNHFqK2l6UFVobmRJd2NRK2V3c08rOVEySlBzSW9jVkxDQVB5?=
 =?utf-8?B?SjJEemFGTERvRU9ZZlhkSzZ2RFFlQ0JFbjZxeXBsVDlSZjVGamRsbmFCdnMz?=
 =?utf-8?B?Z1FoKzlWSFZ2eXY5WkhvTnM0elBrTFpYVk82emFqdjRyMkcvT1h3c1ZlbXVB?=
 =?utf-8?B?d0NsejIra0V1RUI3VGVMdDFNMzkyVUJ2WVlUT2RQVVVSQUR0OU02Rk5Wa0JY?=
 =?utf-8?B?T0RBcjA0YmZzSm9OTzR1clNLaHgySTlVRXdZSGs1ZFBoSzN4eU04eFFUTHNa?=
 =?utf-8?B?WFJKcnBzVWNoSDVQWGlVSWtpNGtMaDZJQm5uTmxERU1CMlUvb2tpVUNDaitz?=
 =?utf-8?B?YzE1UEg5RVV1VXcwWlVyMkdpaC8xOG5xQkNSR2JwN3JIa2FnU3NaZXZCNExU?=
 =?utf-8?B?VWVad1F5R2tWa3o0VWhNQmVrbFZLTEZTQXFEYTlWVDQvSGhXdmlSdFJneWtD?=
 =?utf-8?Q?PZaqPEGXf9lNKrY0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA14EBD501C53B4EA5DFB481B0BA6E9B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abb13f9-ffc1-4d71-904f-08df0e5ead8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 10:39:51.1314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhVagre9zifZZg6cBX6BTx1KSJU1/TdeJopxUCZFSlrRz31cqyaOTxAbkhmHAb1SBcVRzh0Mq8+mWopYXs6kyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7000
X-purgate-ID: tlsNG-4011c0/1788950394-50ACCCFC-FEA97E27/0/0
X-purgate-type: clean
X-purgate-size: 1150

T24gOS85LzI2IDEyOjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDkuMjAyNiAxMDo1
NywgU2VyZ2l5IEtpYnJpayB3cm90ZToNCj4+IEBAIC0xNDEsNSArMTQ0LDEzIEBAIGludCBfX2lu
aXQgcGFyc2VfZG9tMGxlc3Nfbm9kZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQo+PiAg
ICAgICAgICAgcGFuaWMoIidsbGMtY29sb3JzJyBmb3VuZCwgYnV0IExMQyBjb2xvcmluZyBpcyBk
aXNhYmxlZFxuIik7DQo+PiAgICNlbmRpZg0KPj4gICANCj4+ICsgICAgaWYgKCBJU19FTkFCTEVE
KENPTkZJR19YU01fRkxBU0spICYmDQo+PiArICAgICAgICAgIWR0X3Byb3BlcnR5X3JlYWRfc3Ry
aW5nKG5vZGUsICJzZWNsYWJlbCIsICZ4c21fc2VjbGFiZWwpICkNCj4+ICsgICAgew0KPj4gKyAg
ICAgICAgaWYgKCBmbGFza19jb250ZXh0X3RvX3NpZCh4c21fc2VjbGFiZWwsIHN0cmxlbih4c21f
c2VjbGFiZWwpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZF9j
ZmctPnNzaWRyZWYpICkNCj4+ICsgICAgICAgICAgICBwYW5pYygiSW52YWxpZCBzZWN1cml0eSBj
b250ZXh0IGZvciBkb21haW46ICVzXG4iLCB4c21fc2VjbGFiZWwpOw0KPj4gKyAgICB9DQo+IA0K
PiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIGlzbid0IGEgc2luZ2xlIGlmKCk/IEFsc28gKG5pdCkg
dGhlIG9uZSB3cmFwcGVkIGxpbmUNCj4gaXMgbWlzLWluZGVudGVkLg0KDQpubyBzcGVjaWZpYyBy
ZWFzb24sIGNhbiB2ZXJ5IHdlbGwgYmUgdGhyZWUgbG9uZyBleHByZXNzaW9ucyBjb21iaW5lZCAN
CmludG8gc2luZ2xlIGlmKCkgY29uZGl0aW9uLg0KDQogICAtU2VyZ2l5

