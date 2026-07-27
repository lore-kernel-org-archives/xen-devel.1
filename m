Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597C1C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 12:36:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371672.1619154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKZV-0007vS-Fu; Mon, 27 Jul 2026 12:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371672.1619154; Mon, 27 Jul 2026 12:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKZV-0007vL-Cn; Mon, 27 Jul 2026 12:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1371672;
 Mon, 27 Jul 2026 12:36:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1woKZU-0007vF-7z
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:36:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woKZT-003kqk-HC
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 14:36:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a6750d6-2eae-0a2a0a5409dd-0a2a4505cd8a-2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:36:39 +0200
Received: from [52.101.46.55]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a6750d5-4cb1-0a2a45050019-34652e373a30-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:36:39 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5210.namprd03.prod.outlook.com (2603:10b6:5:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 12:36:35 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0223.017; Mon, 27 Jul 2026
 12:36:35 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWumqU4LkTG/SvKoalQqU5MS+lgKx+oKcocRHGnK9Kzi4xecwuTRKS2KFsgud7PTb94XhEcCyKTd7QVs9/nJc9YJ6g/pW566q4ou6RGQ5jhZUSBeFpucMrj1tUvwus4oHLxHpjahC3fgvkesB4a/G0KatDxfxTWHH74YdDJx3E9KY+2Pe4NdXOY7Skzx3VwOD60yreUrOYYPhXmeFTNd/QF1Q0eKKdOlnsgux9NGT5FUWh7ZgPmjaur79kf1VVA1pTNifBL7LlTrEz/l2LHDZiTkwfyDQIyQFw/BeveiQQ+k59KLgN+Lfclc3gVFQB/fMTY3iA61BLHfPJJ20doyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnpeTxZQBAM5/IHaaPNeleJuM+UxZA8y7dnaefJaTxA=;
 b=bIQDYjHRYwUin/58+E93FZGJGG1hUUHbqL1LIoEdb701Fce3bJ/hIYyU1ZcxkfZzX4wQqLjXZ4kwXe1+dmzDPHPnGzmezYBmR2U6NmGTZKJJFkHVocnua8bN15ZxWXP53rCltAfOVjytNU7SnBS1GqGkJLHYU7vxTA6uJTO785ctg/xxdR+CxlSdV6/JhVNKk0iysyJ2HCzqSZPt52QraybD60Mcdv5VwNGeLm7Y2qS0ZN7BzO4xtQ0DyK59I0TzvyCzFbYAQ0R/I4V/Cm1tYSkJUuoKGf196WxBfWdg3kizRYYaoy4da1P1RK+zfmvFPZeHTnc+StRkfMOBDNMTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnpeTxZQBAM5/IHaaPNeleJuM+UxZA8y7dnaefJaTxA=;
 b=jR81vZvzAnwfdQW8gwilhaoAZShoLVqNbKYRTIvyFnVAfHv0RL5WH8MBK/nyMhfTaDnyirXnBWKZ8nHheqHc75hJg8I5BaLPU6+8mdXDRhcv6c9gWxY1GGwF7geeQZYZ4H5aea35coNTZ3ujjfcpPBi909k1AGnVwgPACiFKyHU=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>,
	=?utf-8?B?U3RlcGhlbiBDaGVuZyDvvIjnqIvlsI/mnqvvvIk=?=
	<stephen.cheng@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
Thread-Topic: [PATCH] x86/svm: require VMSAVEvirt for nested virt
Thread-Index: AQHdHZgDgUepMUDe+06Vza+F9KISebaBQH8AgAALr2s=
Date: Mon, 27 Jul 2026 12:36:35 +0000
Message-ID:
 <CH8PR03MB82746A032E40CEFA692FE867F0CC2@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20260727071709.196088-1-stephen.cheng@citrix.com>
 <1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@vates.tech>
In-Reply-To:
 <1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@vates.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|DM6PR03MB5210:EE_
x-ms-office365-filtering-correlation-id: 397f36cd-9147-48d8-5e41-08deebdbb253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|10067099003|22082099003|56012099006|11063799006|4143699003|5023799004|3023799007|38070700021|6133799003;
x-microsoft-antispam-message-info:
 AgKPeG4v5IchqzYXeFCLVXXvJuGllPr7XOLFn8nU/sSAYp2FR0BvIHIQgnFuVq+Tf5BFL+NjM2YxibFZS++NB5fh3lsCF225eUKyoNQLeq9TmBP9ze/kyaXcpo/lqNvS5qTjkRJthPOXuNBgYV5A7CbPnCFk5EPMjDrGcqgVQod/9t9dM1KPL0ho/jQ7a51n1zZx/RE5+s029kE/UqGpUaXf/TEJvoz4OVy4l64xTvVAysEFPm0FqqDfo1qcG5703Z6+blhpp7WITM7UbBiFcHG54QMKMVYTDKZjEE2b0Tk8SwBV30SuN78oyw7JGivM1AzTMl4mCMUUtMRDtmwGMgkfp2WqGQ6Qxqcjkxc7sKshbqHvSHe8q/KDsdGW7kT0XrIMZMQbtdbCKsEN/TW0lsDuGjBsEnFiB2NaIMX8YXc1LiBKStMEaLEjR8lKvCbfQWIY0BXH9Dzk5QPzlrYVjKCfYv+vlfTDSDnqg+RYL1MMFDaI+oQucMyWkdgOjtLRLmmDEw9XfZtH6cC+LwQfTzauNK6OWCfQYUFLYuA6QVGH6B1p74BofHZdTb72JjU68gc1HKSQVTCeM9O1XdqjMHkJLkh+BRI3aCzQLRR1JeBHrA9V49aY3V6EIio+sioaH+bStQ8E5Ja8fKnOugp/TBEHRkoJOijQwRRIahJjLxM3rVrCHORU6YG7YccXxDXprPl95nj3k3mV8z6kkhUbsSQy+ivVFznKEVMGbZXNeks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006)(4143699003)(5023799004)(3023799007)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1g1OHI2WXVxZU82V2toUkpKWVRNZjVnSFRuc2hmM1RuZnY0eVc2aHBORDM4?=
 =?utf-8?B?bXVocXBvQUwyVHZJK1JjcTBxN3M3NXZKZ1lVbWFpam1STVZjd2FYZldTbFY3?=
 =?utf-8?B?QzNkVzNycU5ROVlyRUhLVGFZZkhDNHdQcHVRZXN6cHVrVHJjVGxGZ3NBTG9s?=
 =?utf-8?B?bC9IVWFZa0Q3bW1lbUFFaXVKMEdwSFVjR1pJSldyRG9JYkVhWDVZSysycVRH?=
 =?utf-8?B?UlZ2QVFFdi9OUGdnSXFYYWxBU2ZBaW9SamxRdURFcjNiZFNwS3YzdXpSUXJI?=
 =?utf-8?B?QmI3cFRFRU1mUkNqZ09TMVlUR3RUamxjTldJZjRFeG5sa2JRQkJkekpBb1pi?=
 =?utf-8?B?RlJCMUErQ2pmOHdrMGkvMVY1ZGZDV1I2b2QzZjd4VytZdGlmaHg4UGs0VjZr?=
 =?utf-8?B?eGNja0xSWFpHNlE4a05SY2wwLzkyV3p1YmlNTnFMSUVKbnNTV09qamp1M2xR?=
 =?utf-8?B?ejM3STZZdVBnNzM1aHd2cDFsT2RuSDZuQVpwVTZRZWlwem1OeGIvN1MvaWpL?=
 =?utf-8?B?THluOVdYVGxxUlFTNzFiSnpYWHllNXgzQldrTFowaXY2Ui9qcS9raDFEWU9G?=
 =?utf-8?B?aWIzUjE5TExLWmtoL29wdlFYSUpMcnVxWDdoUk4zaFFFQ3dLSUNPVGNYd0NN?=
 =?utf-8?B?YlcwakxmbzlkUVVrczl1VTNXZDBZNDBRVUM4Q2d5bDFTNktYYnVzMzhyTVFF?=
 =?utf-8?B?bjc1cUdZWXN0U0FxS2o2dTBqOVRhUURPRm1iUEU0eXdzZE1QMlQvNXg1NlBw?=
 =?utf-8?B?YjVIU3JZeGNRZUNPaXJJWTJmV0dyUlFTdGl0bTZPZ2lqclRzbE5HcUhkSGNa?=
 =?utf-8?B?R05MQUdGME1ZU2RMOFBmTHdVMERWNWpMUzRvbTc3eTllb0prWm92Q1IyWnJJ?=
 =?utf-8?B?RHJ1RnM5UkxENTFUR0VJTkV4T0VlU0EyYjNJTXZPZkJRVkc5Zmk3eGNobnk4?=
 =?utf-8?B?S0kxUnZxTzRoYmh2M2JCbkl3YnFNTWJyY3lHTFZSSFI0YWMxUHV0M3RqTzRr?=
 =?utf-8?B?c3dDdUxIOThoc3o5aHNVVE9vNjB6ajVtN092VGpsUFRTUXh3bTR4THREQkpj?=
 =?utf-8?B?NG1WdHhxSmp6OVN1VWkzUDRnbjIraUtiTldta0JHekp6MXNqNDc1dGFNWTdG?=
 =?utf-8?B?MTIwUHJ0SWRMY2ZqZTU4Qzc3aXlNMlRqZTRlV2s3Z1ZWWFdUM1VHVXlIUEFw?=
 =?utf-8?B?NDQwcXlzNkNTb1ZSVEFPc28vL3pvZTZLUWh2YXJaWWYrY2ZCVUV4VkplcmpK?=
 =?utf-8?B?cVRJN0VPSFBUbXJHUkxuZXhOTUlBckJqT2xCaHZBanNTdms4ZU9nWmRycVFp?=
 =?utf-8?B?aHpPaEIzZXZ4R3k3Wm5CM2hWbkVBdlJXMWFMVEZHYitUdXFtSFB0ZGo3TVEv?=
 =?utf-8?B?TExiRUJiT21UcU5yWXZDTTJ1MlJRRkYvN0M1UTRyVlk3TWVJcUdqQXIxQVl6?=
 =?utf-8?B?VEE5SDE0ZzAzRTRXR2ZPdW9kWmgrY3JsSFA1TGFYVkJhd0hpVjBncTZjN2Rq?=
 =?utf-8?B?bVVmY0xJMFl3eE5OaTJPbnhYeDJiYitCdC9xSWZzN0RvZ1M1Sm1Yd05kcjhp?=
 =?utf-8?B?YVFIbTR2V1Z2VTRhT0NpdFJ5NWF4OVRONFZMSDM5TklRTU1hQjRoaVJTUHY0?=
 =?utf-8?B?ZlVCWTAvTHN4MkRWallzNjQwTzBxclpYWldRMlIzODFYcWJMN0Z4d3QwaGxO?=
 =?utf-8?B?VlorVmdJcFNweWdPcmF3VC9OSldEOTE2enkyWWJsMVhpeXJoSHRWYUdIZDdG?=
 =?utf-8?B?UUJZT0tJOXFoZmgzOExjeG9yQ0lWNXFzSGxtdDZmZ1ZqOEF1RDZRc0ZoTkZh?=
 =?utf-8?B?K0wxTnhGTmlHRndxNzZseXRlZmtzK3JWdUxyZFF1VzdRRnJZWS8wUmNleUhG?=
 =?utf-8?B?Y1ZnTmlBb1haUzM1WmlnS1k5bm5mNXVvWGNJUEZndHAzMWx1SERoWWU4K0hV?=
 =?utf-8?B?UlJsNFJ4a1hqanRqeGJ2WjVCRmt3NTFzYWVVT1ZDMXNCS2F4ZUpYckxCT0lO?=
 =?utf-8?B?KzdqOGFiK29RNFlNRkdHMm15ck5abXRZMFVyMTFMRGYvYVpoRys5UG5Pd3BL?=
 =?utf-8?B?b1pvTGRVTUZ2cHR6NFJNM0VTMHh6clMwMmxFNk5ERWJZakdpYTg3RkRKT0pz?=
 =?utf-8?B?Y1p6amR2MUI4eFJFTXBYZlRleUNMaGx5RzVraXpyS0h2SHFmZTM3L0ZjQzNn?=
 =?utf-8?B?V1B3RXcxUXlGQnByemJyYUVJK2k2Z2NLY29iL1JydlkrT2JOaURWQ3JqeDBn?=
 =?utf-8?B?WmtJSlUrOU9QTWdRYVM5bUwyMnkxQlYyRGUySkJSUUdtZUY0bWEzUVhteTZh?=
 =?utf-8?B?TGRtRi9laGp3WWMvbVUrVkJvWXE5ZHlFTTU4cXl4bTl6WTMrczlqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397f36cd-9147-48d8-5e41-08deebdbb253
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:36:35.5231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZfDOzJhDYdar/qnZd+vR/NEvH0kuNVmtmAlxiN6LeynllYCqSdgsbSGbstrks9IF0QeUHJwCw+0IA4FUBflErytgj759krD0MBp/Eb+1SBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5210
X-purgate-ID: tlsNG-c201ff/1785155799-F44A42A1-298F2A04/0/0
X-purgate-type: clean
X-purgate-size: 5038

PiBGcm9tOiBUZWRkeSBBc3RpZQo+IFNlbnQ6IE1vbmRheSwgSnVseSAyNywgMjAyNiAxMjo0OCBQ
TQo+IFRvOiBTdGVwaGVuIENoZW5nIO+8iOeoi+Wwj+aeq++8iTsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4gQ2M6IFJvc3MgTGFnZXJ3YWxsOyBBbmRyZXcgQ29vcGVyOyBBbnRob255
IFBFUkFSRDsgTWljaGFsIE9yemVsOyBKYW4gQmV1bGljaDsgSnVsaWVuIEdyYWxsOyBSb2dlciBQ
YXUgTW9ubsOpOyBTdGVmYW5vIFN0YWJlbGxpbmk7IEphc29uIEFuZHJ5dWsKPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSB4ODYvc3ZtOiByZXF1aXJlIFZNU0FWRXZpcnQgZm9yIG5lc3RlZCB2aXJ0Cj4g
Cj4gCj4gTGUgMjcvMDcvMjAyNiDDoCAwOToyMCwgU3RlcGhlbiBDaGVuZyBhIMOpY3JpdMKgOgo+
ID4gVmlydHVhbCBWTUxPQUQvVk1TQVZFIGxldHMgYW4gTDEgZ3Vlc3QgZXhlY3V0ZSBWTUxPQUQg
YW5kIFZNU0FWRQo+ID4gd2l0aG91dCBpbnRlcmNlcHRzLsKgIFdpdGhvdXQgaXQsIFhlbiBoYXMg
dG8gbWFwIHRoZSBMMS1wcm92aWRlZCBWTUNCCj4gPiBhbmQgcmUtZXhlY3V0ZSBlYWNoIGluc3Ry
dWN0aW9uIGluIEwwLCBjb21wbGljYXRpbmcgc2VjdXJpdHktc2Vuc2l0aXZlCj4gPiBzdGF0ZSBo
YW5kbGluZy4KPiAKPiA+Cj4gPiBNYWtlIFZNU0FWRXZpcnQgYSBoYXJkIHJlcXVpcmVtZW50IGZv
ciBuZXN0ZWQgU1ZNLsKgIEFkdmVydGlzZSBpdCB0bwo+ID4gTDEsIGVuYWJsZSBpdCB3aGVuIEwx
IGVuYWJsZXMgU1ZNLCBhbmQgcmVtb3ZlIHRoZSBuZXN0ZWQgVk1MT0FEL1ZNU0FWRQo+ID4gZW11
bGF0aW9uIHBhdGguwqAgQW55IHJlbWFpbmluZyBpbnRlcmNlcHQgdGhlcmVmb3JlIGNvbWVzIGZy
b20gYSBndWVzdAo+ID4gd2hpY2ggaGFzIG5vdCBlbmFibGVkIFNWTSBhbmQgcmVjZWl2ZXMgI1VE
Lgo+ID4KPiA+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC04Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBTdGVwaGVuIENoZW5nIDxzdGVwaGVuLmNoZW5nQGNpdHJpeC5jb20+Cj4gPiAtLS0K
PiA+wqDCoCBkb2NzL2Rlc2lnbnMvbmVzdGVkLXN2bS1jcHUtZmVhdHVyZXMubWQgfMKgIDExICsr
Kwo+ID7CoMKgIHhlbi9hcmNoL3g4Ni9jcHUtcG9saWN5LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDMgKy0KPiA+wqDCoCB4ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0u
Y8KgwqDCoMKgwqDCoMKgIHzCoCAyNCArKysrLS0KPiA+wqDCoCB4ZW4vYXJjaC94ODYvaHZtL3N2
bS9zdm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAwICsrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID7CoMKgIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMiAtCj4gPsKgwqAgNSBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCA5OSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXNpZ25z
L25lc3RlZC1zdm0tY3B1LWZlYXR1cmVzLm1kIGIvZG9jcy9kZXNpZ25zL25lc3RlZC1zdm0tY3B1
LWZlYXR1cmVzLm1kCj4gPiBpbmRleCBjZTE2OGU2OGUxLi43OTg0ODBiMjU5IDEwMDY0NAo+ID4g
LS0tIGEvZG9jcy9kZXNpZ25zL25lc3RlZC1zdm0tY3B1LWZlYXR1cmVzLm1kCj4gPiArKysgYi9k
b2NzL2Rlc2lnbnMvbmVzdGVkLXN2bS1jcHUtZmVhdHVyZXMubWQKPiA+IEBAIC0xMDksMyArMTA5
LDE0IEBAIGxlYWYgODAwMDAwMEE6ZWR4Cj4gPsKgwqDCoMKgIFVzaW5nIGl0IGluIEwwIHJlZHVj
ZXMgdGhlIGNoYW5jZSB0aGF0IHdlJ2xsIG1ha2Ugc29tZSBzb3J0IG9mIGVycm9yCj4gPsKgwqDC
oMKgIGluIHRoZSBkZWNvZGUgcGF0aC7CoCBBbmQgaWYgaGFyZHdhcmUgc3VwcG9ydHMgaXQsIGl0
J3MgZWFzeSBlbm91Z2gKPiA+wqDCoMKgwqAgdG8gcHJvdmlkZSB0byB0aGUgTDEuCj4gPiArCj4g
PiArLSAxNSBgVkxvYWRTYXZlYCAqVmlydHVhbCBWTUxPQUQvVk1TQVZFKjogUmVxdWlyZSBmb3Ig
TDAsIHByb3ZpZGUgdG8gTDEKPiA+ICsKPiA+ICvCoCBXaXRob3V0IHRoaXMgZmVhdHVyZSBYZW4g
aGFzIHRvIGludGVyY2VwdCB0aGUgTDEgaHlwZXJ2aXNvcidzIFZNTE9BRAo+ID4gK8KgIGFuZCBW
TVNBVkUgaW5zdHJ1Y3Rpb25zIGFuZCBlbXVsYXRlIHRoZW0gYnkgcmUtZXhlY3V0aW5nIHRoZSBy
ZWFsCj4gPiArwqAgaW5zdHJ1Y3Rpb24gb24gYSBtYXBwZWQgY29weSBvZiB0aGUgTDEtc3VwcGxp
ZWQgVk1DQi7CoCBUaGF0IHBhdGgKPiA+ICvCoCBoYW5kbGVzIGEgY29tcGxleCwgc2VjdXJpdHkt
c2Vuc2l0aXZlIHN1YnNldCBvZiBzdGF0ZSAodGhlIGhpZGRlbgo+ID4gK8KgIHNlZ21lbnQgZGVz
Y3JpcHRvcnMgZm9yIEZTL0dTL1RSL0xEVFIgcGx1cyB0aGUgU1lTQ0FMTC9TWVNFTlRFUgo+ID4g
K8KgIE1TUnMpLCBzbyBvbiBmYWl0aGZ1bG5lc3MgZ3JvdW5kcyB3ZSdkIG11Y2ggcmF0aGVyIGxl
dCB0aGUgaGFyZHdhcmUKPiA+ICvCoCBkbyBpdC7CoCBXaGVuIHByZXNlbnQsIHRoZSBpbnN0cnVj
dGlvbnMgZXhlY3V0ZSBuYXRpdmVseSBpbiB0aGUgZ3Vlc3QKPiA+ICvCoCB3aXRob3V0IGEgI1ZN
RVhJVCwgd2hpY2ggaXMgYm90aCBzaW1wbGVyIGFuZCBmYXN0ZXIuCj4gCj4gSSdtIG5vdCBjb252
aW5jZWQgbWFraW5nICJWTVNBVkV2aXJ0IiBtYW5kYXRvcnkgaXMgYSBnb29kIGlkZWEsIGluCj4g
cGFydGljdWxhciwgdGhlcmUgaXMgYSBlcnJhdGEgKDE0NTQgLSBQcm9jZXNzb3IgTWF5IExvZyBV
bmV4cGVjdGVkIExTCj4gTUNFIEVycm9yIFdoZW4gRXhlY3V0aW5nIFZpcnR1YWxpemVkIFZNTE9B
RCBvciBWaXJ0dWFsaXplZCBWTVNBVkUpIG9uCj4gRmFtaWx5IDE5aCByZWdhcmRpbmcgdGhpcyBm
ZWF0dXJlLgo+IAo+IEhhZCB5b3UgY29uc2lkZXJlZCBpbXByb3ZpbmcgdGhlIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gb2YgdmlydHVhbGl6ZWQKPiBWTUxPQUQvVk1TQVZFID8gQUlVSSwgdGhlIHdh
eSBYZW4gY3VycmVudGx5IGltcGxlbWVudHMgdGhpcyBpbnN0cnVjdGlvbgo+IChieSBtYXBwaW5n
IHRoZSBMMSBWTUNCIHRoZW4gY2FsbGluZyB2bWxvYWQvdm1zYXZlIG9uIGl0KSBpcyBtb3JlIG9m
IGEKPiBpbXBsZW1lbnRhdGlvbiBjaG9pY2UgdGhhbiBhIHJlcXVpcmVtZW50Lgo+IAo+IEEgYmV0
dGVyIChhdCBsZWFzdCwgbGlrZWx5IHNhZmVyKSB3YXkgdG8gZW11bGF0ZSBzdWNoIGluc3RydWN0
aW9ucyAoYW5kCj4gbm90IHJlbHlpbmcgb24gVk1TQVZFdmlydCkgd291bGQgYmUgdG8gY29weSBw
YXJ0cyBvZiBMMSBWTUNCIGZyb20vdG8gTDAKPiBWTUNCIGFuZCBsZXQgWGVuIHBlcmZvcm0gdGhl
IGFwcHJvcHJpYXRlIHZtbG9hZC92bXNhdmUgb24gaXRzIG93biBWTUNCcwo+IGFzIHVzdWFsLgo+
IAoKR2l2ZW4gdGhlIGxpbWl0ZWQgcmVzb3VyY2VzIHdlIGhhdmUgdG8gdHJ5IHRvIG1ha2UgbmVz
dGVkIHZpcnQgZnVuY3Rpb25hbCBhbmQKZXZlbnR1YWxseSBwcm9kdWN0aW9uIHJlYWR5LCBJIHRo
aW5rIGFueSB0aW1lIHNwZW50IG1ha2luZyBpdCB3b3JrIG9uIG9sZGVyCnByb2Nlc3NvcnMgYW5k
IHRoZW4gdGVzdGluZyBpdCBpcyBhIHdhc3RlLiBBTUQgbmVzdGVkIHZpcnQgZG9lc24ndCB3b3Jr
IG5vdyBzbwpyZW1vdmluZyBzdXBwb3J0IGZvciBvbGRlciBwcm9jZXNzb3JzIGlzIG5vdCBhIHJl
Z3Jlc3Npb24gaW4gZnVuY3Rpb25hbGl0eS4KClJvc3M=

