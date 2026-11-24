Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C08606A321
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 02:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=iIwcMiF5
Received: from list by lists.xenproject.org with outflank-mailman.1500581.1696669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVg8m-0003V5-Ed; Tue, 24 Nov 2026 02:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500581.1696669; Tue, 24 Nov 2026 02:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVg8m-0003Us-82; Tue, 24 Nov 2026 02:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1500581;
 Tue, 24 Nov 2026 02:20:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xVg8k-0003Um-8H
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 02:20:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVg8j-00EVdO-67
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 03:20:13 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6b04f45c-bab6-0a2a0a5309dd-0a2a4509b126-2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 03:20:13 +0100
Received: from [40.107.159.112]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6b04f45c-be1a-0a2a45090019-286b9f701c99-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 03:20:12 +0100
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 (2603:10a6:150:805::10) by AM9PR03MB8009.eurprd03.prod.outlook.com
 (2603:10a6:20b:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 02:20:07 +0000
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544]) by GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 02:20:07 +0000
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
 b=tw8owDI/rTHa80wv2RL83AD8ggH5k4JLHt9dMoespSK/r6B1kLyA9kQrzc2m9wVHSoz7dxtKPy0buJKSMnG0XhwZcCGlmT5SUIXu/LXrfmRrtlLJ2y/tLpXbLunPnBBGYxoukm+ywG+suDpVaRKkmD8rYGxFWNEZkbqR/WYcQm6D2MxOiIaSyY2pSzQBn8Ssu9XQA4z15VXohmY4d5NLdHoMRoZaS2vS4H9j7VVsLAOe4418H75vpepI3UbyIIElmfhhS5TZOPVzjzAUMYlqPlAYho7Ymx9YM2ehtZIw/2/gYTaFguCig+A3stv18VgLybz1zwxbCaSElgVvJgk4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih4O+VzAsPHud5xpDhqK3RmAEcv5yRmh8RgjZRAYTzk=;
 b=BKI3hoaIbjs26AVRJIaOq5gPbNzfH0EM5MLpvIDiD3Hwwx8CdIW8apn5PSYOqdpDOavX9U9RVv0GWer9kGOafDu8Xl5IgQcMl4/ijgCofjfI7NKh2OLsC0vZFMLeoynEXef534sefBYe21piiHwGdvGYFGEk1c20oTIcdF+GoL0qYAjNA/asML1+aUdz3nNx05ZRh/yn0RGvYZnSm9+ZfNyEn/09AZuhgRYu0c2KAsIaPAyfw9FFiK5zNR7R+1pJX5jNdItEyIFPKobQ/aey3SjTCvXqU3ift+b82hqqtEb6DIKhpBQOycuZEOfvMc7tZaN4qw9VEqfqJdjFrJaNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih4O+VzAsPHud5xpDhqK3RmAEcv5yRmh8RgjZRAYTzk=;
 b=iIwcMiF5Cz1m362WjOU7BGN70tzmhYt7pHDj8vJqLci/IoFRJnQNvEWl8gN7H2aMVV+w8eiDF+nDKo10TIi7rd+Dhxb4gEmwi6/m8Q0zclH5ooekZfcH1Da7WMoZgP3hL6MeY98f2N0qUmhEW4vVLwtmSVa7NuzzW3IVQ62DuGQuBvzKkDvVpsZnx0+bhU4us+3vJU74WxZr+xJAZw/5Xo/mCTGl+s32hffPlWtXt9ORzis41vmz5AH9EfcKRSGjbUaKsiftvzcs3hc2L39xllETPQCT7YzeOOacl1s/9zT1XwJwrpH+7sTSA6SJTtY5nMTib39DochMONb7PpdrHA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
Thread-Topic: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
Thread-Index: AQHddi+rPrDcM3j2gUuDy+04RxtZEbc8iEOA
Date: Tue, 24 Nov 2026 02:20:06 +0000
Message-ID: <87v75nj7hm.fsf@epam.com>
References: <cover.1794873792.git.mykola_kvach@epam.com>
	<3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
In-Reply-To:
 <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.4; emacs 31.1
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB788477:EE_|AM9PR03MB8009:EE_
x-ms-office365-filtering-correlation-id: 6b7d003c-dcc5-45fc-ef31-08df49d174f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|1800799024|376014|366016|38070700021|261028144727099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022105027099003|11063799006|4143699003|56012099006|10067099003|261022075727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 WDArRk0cb15kViYJU/v21IEvn7JEsuwK6kCXXdyeFLQi5gBfVcbRHcOzAMgHjmOc8RDPRXVFNoO1ddF0Lnz4UK163r4t/v1FQZjRIfOvJKqtkrdwsKJoppZWew4J98EPfrL7F85Z6iFcjK76Xja315nruIOi41q9fe7f/znawiVK0CWlELxXKddrlO+5UL6VavQ/5LCg2NlzowMPOKeAVKHxWUrfoTRcGXnzW0FzxMT11Aae9YXUpe+5rvjjhvZaywrBDonhlhahqtOD7l+/A5MUrluinwUiQOMtn9rWyX3GXsXkCpnhzkbfKu1dzBYIVwaCmyXi3yoUdq41bjLhZt18Yf+7vS5UtW+PjYNbe+wTRtkp6QqyMalNpKlDgLzqBijhBDQAJomhtN1lLf/MQufjw6E8hq1yS0r1RGUdoGBRiXfhiBBcufI56g0T0LA3SlAT7oYa+u4jqf5Tc2M1wTSSAl25nvSJQ3R4Kgrq9CReLg5hYaXH+RYHplEYDWw2IeCUcDXM3engbAqTewZOR617GtF+egEuakZn8C8cSDkB6ckre3DAMUOVe2vWCFOEW8pS1nj74iFTWdYz/5PYsDj4XFsJ+x3rzN6qgsqew3pZ5+yHAZbUg0JHRn0Ce22SKCjuShc3vaMRBdqyqaQicjDET/DyX1Htw1dKLmXLKS3NVhPXqmcWgD8o07nO24/D7pm+5bQwkbf0h7eNTukNBsAtoZIySvvky1tyGOZMUm8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB788477.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(1800799024)(376014)(366016)(38070700021)(261028144727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(11063799006)(4143699003)(56012099006)(10067099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2pYYWFNbmJDVmZDWnMyNmphalQ3cnVJNWF3VGtCNzg0RDNjWWtXMkVNNWQ0?=
 =?utf-8?B?K2QxODhRajRzdlVuWUFUV2NBaDJQUjQyWmgrY1F2NnpRcEkwRmJqNFRtbDJa?=
 =?utf-8?B?ODc2T0VjczkyeDJiYWQ5dGo0eGQ3emt4ZGluaGJtUTlVQmdkRXdIaldoSmtY?=
 =?utf-8?B?OHd2R2ljZDloUHJickhqR3ViVnYvMGNjNUZIZnFNaDEvZkJiTWR0ZzR3aTh1?=
 =?utf-8?B?Ulg2WEpxZXBPSncvSTNuRFJxb1Z2ZzZQVVVvWFJYdDFJTVFoMFJXbDRYQm0y?=
 =?utf-8?B?dC85ckRmSURqWU1HRWNDUUg5QnFQMUpwL1ZnMmxVZlVKcFo2MVhzQ3c4aEUw?=
 =?utf-8?B?dHBjVmJnSVhGLzlOcG1Bcitjd3lDUkhER3Qrdlc0OWZVa0t0aS9YYXhaUEdh?=
 =?utf-8?B?Qm5nVXk0eElQODV3eEJjcXVOR3dwbVIyMjdWTWZnOUhjNWxKS1IzNzVnYjJZ?=
 =?utf-8?B?V0VraEhZTkFVMjdCa2twY1JyUE9Oc2xnT1dKK3lVYmw0Y01YZitoN2p2aExx?=
 =?utf-8?B?SnNXNUEvakptZjlIVy8wL09pUDRSTWpKa3UwNHNoU1EzSllOSllRWTIxaXlq?=
 =?utf-8?B?elFyMmdXbFNGWlk3Z1BHMXZrL0ZsQ0pNZVBuRDNpcFQ5UmF3Q1dPM04raXJU?=
 =?utf-8?B?aWwzdldwaUZBMnVsajd4SUplMkJ0TzQ2NGc1QzNGdkNjQXkzWHc3am1BWFdH?=
 =?utf-8?B?VGMvWHh0UzM0bnBuMHJaVmJaR1M3QzdrbmhFU2Mwbjc4cy9sTUVRb1g1dWN3?=
 =?utf-8?B?b3BmVVVPY0hvRmdxNlBtZ3UvOEIwQkRNeTdIRzJMbnVtV1RGZ3NkUDdNRXdB?=
 =?utf-8?B?MnUreXJHWHBGdnJubXI4WUxYNDh1WlVTRzN2TFBnUWpzellHdmtIQ2JFa1B5?=
 =?utf-8?B?VTV5Y3M4WlY0ZGpWRUJYT3ZOOS9ubDJ4MnRINWU5VWpZZWFvTXA5dWo0K2tG?=
 =?utf-8?B?SmUxQUI1THdIMzIyYkRNejhiaFJiMnBQblFqaTNmdDhxcUlGT2Y2b09vNVpB?=
 =?utf-8?B?UTRMclFQZmdGUG5ISHE1UlI1bWo0V2s2K1VldTVPMStHeEVNMDJ5SVZIMnNj?=
 =?utf-8?B?cFl1MUsxWkJvUkZremtnSkNXMXNidEU1YlNsS3ZDQ2trdjJpQkgxbHNNY0ZV?=
 =?utf-8?B?Q1VZS3Zqak1pSEhJbG9vRDFBOXlsLzYrc3pzTUdhdGJJVU9CazNuRkRYMEds?=
 =?utf-8?B?Mk9GdUlpTStPb1ZvaHF6ZDV1ZEJQek1oVEw5YmFHbit5M2FIR1JTUlprWExB?=
 =?utf-8?B?SllkN1FjOFA4dWZHZi9CdWtkK2VvS01YRE82V29xVTVMZlZTeEVkVnJpMExO?=
 =?utf-8?B?MEx4NVpUZGxaV01QaGtaMklUZ2dTalZ1RHJGbHladjZpY1lENlllK0RpRGQz?=
 =?utf-8?B?aTl2b3N1cWxXM0RkWGFmL08yeUs5QTVod09qRlYvTjNHRUdkdi9LVmwrUDZl?=
 =?utf-8?B?TFFIYks1U1JXcUtsRjE3eUhSckdnQmcyK2FhZmZvZExxVnJySnZ4a09JUkh2?=
 =?utf-8?B?Q01ObmJ3aW1XbGlMWHRCVmZjZ05nSkJYRjgzZ1NOSGtoaGZaZHlqR0VFMysy?=
 =?utf-8?B?WG5ld3MxLzB1ZDBscnUzYVJGUk1XZWpwQ0ZRVkFZK1JYNmJQMXVQSlNMWjVt?=
 =?utf-8?B?VCs0ajJOZ0tmbWpzMzdhTU1LY3J3bnBMNmZIMTUrRDIrKytsVHhqZlJZOVpG?=
 =?utf-8?B?a2tOU0Vwa2lIVWhYcFpQK05sTFBab2NQRWg5NHZCa3FiZzQxaHlHVjBDS3hR?=
 =?utf-8?B?MlF5amxuVCs4ZmlPUDZEb2ZVM3ZlbEhaMWxSKzk4Y3BneWdaQXFCQVRMcmpK?=
 =?utf-8?B?VnI1UU5wZTkvcGhzZzZBemVuSEZyblNyMUx4WnZBZEdPMjdUZUFkcEZmeGZ4?=
 =?utf-8?B?UEMwcTZSN2pGRkptVnJLOUdzcjM4MVhMMVNuOEhhNFdMUUJjSDBtbXBaSy9Q?=
 =?utf-8?B?T3BrSFJQQmh0aUdUUG4wYU5QVWQxSkhDVGdIMlhteWVGRUpscnVXVVRSNW8r?=
 =?utf-8?B?ZXM2eWlMMkszdFozdndaWFZiRUVoWlBob1N3UDlhWFk1Ti93alg4eWswRk5v?=
 =?utf-8?B?cDhQTGxYeDA2MFI2bVFjZUMrUjdXaThWV1g3SmNmRTRoR1lGUWNPRnNRNEE2?=
 =?utf-8?B?QzcrYTVuWEYvN2pzUDQyODVkbTN1NitEMmt2cGdrUDE1WkNmQUZvMUUrYkhJ?=
 =?utf-8?B?eEsrbTFrdlF6ekNObHBrKzluOGIzRzZ6UUZGcEdPUEtFT1AwS0hFYW5JYWdC?=
 =?utf-8?B?L25kdzFEeDBvNUp6Z0ozYVpzZWp1eHJpRTRpUUZZZVVjdll3S3J5enRqWXds?=
 =?utf-8?B?ZldsMnd6OTVoOU1ldVE2bFZ5eEFNenJ4RWVEUFdyMEdlT1JuMU80cEpUNVlJ?=
 =?utf-8?Q?TFwr7k+rMy4VNUVY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB788477.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7d003c-dcc5-45fc-ef31-08df49d174f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:20:06.8671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/058P90keEqtjRw5BqEdFgeEBICENrOF4pVb+E+aEX8h0veqWbhFmhTorFpjBusyk/8DdY9aNT59UV5s34FIFEpqXDKq4wCyZkishb3QNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8009
X-purgate-ID: tlsNG-bad1c0/1795486813-FD86F034-A44F66DE/0/0
X-purgate-type: clean
X-purgate-size: 3116
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgYWdhaW4sDQoNClRha2luZyBpbnRvIGFjY291bnQgSnVyZ2VuJ3MgY2xhcmlmaWNhdGlvbiwg
SSBzZWUgbm8gcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2guDQoNCk15a29sYSBLdmFjaCA8TXlr
b2xhX0t2YWNoQGVwYW0uY29tPiB3cml0ZXM6DQoNCj4gV2hlbiBhIENQVSBmYWlscyB0byBjb21l
IGJhY2sgZHVyaW5nIHN5c3RlbSByZXN1bWUsIGNwdV91cCgpIHNlbmRzDQo+IENQVV9VUF9DQU5D
RUxFRC4gQWZ0ZXIgdHJ5aW5nIHRoZSBvdGhlciBDUFVzLCBlbmFibGVfbm9uYm9vdF9jcHVzKCkN
Cj4gc2VuZHMgQ1BVX1JFU1VNRV9GQUlMRUQgZm9yIHRoZSBzYW1lIENQVS4NCj4NCj4gT24gYXJj
aGl0ZWN0dXJlcyB3aGljaCBkbyBub3QgcGFyayBvZmZsaW5lIENQVXMsIGJvdGggbm90aWZpY2F0
aW9ucw0KPiBxdWV1ZSBmcmVlX3BlcmNwdV9hcmVhKCkuIFRoZSByZWxlYXNlIG1ldGFkYXRhLCBp
bmNsdWRpbmcgdGhlIHJjdV9oZWFkLA0KPiBpcyBzdG9yZWQgaW4gdGhhdCBDUFUncyBwZXItQ1BV
IGFyZWEuIFRoZSBmaXJzdCBjYWxsYmFjayBtYXkgYWxyZWFkeQ0KPiBoYXZlIGZyZWVkIHRoZSBh
cmVhIHdoZW4gdGhlIHNlY29uZCBub3RpZmljYXRpb24gYXJyaXZlcywgb3IgdGhlIHNhbWUNCj4g
cmN1X2hlYWQgbWF5IGJlIHF1ZXVlZCB0d2ljZS4gVGhlIENQVV9SRVNVTUVfRkFJTEVEIGNhbGxi
YWNrcyBhbHNvIG5lZWQNCj4gdGhlIGFyZWEgdG8gY2xlYW4gdXAgdGltZXJzIGFuZCBDUFUtcG9v
bCBzdGF0ZS4NCj4NCj4gU2tpcCB0aGUgcGVyLUNQVSByZWxlYXNlIGZvciBDUFVfVVBfQ0FOQ0VM
RUQgZHVyaW5nIHJlc3VtZS4gTGV0DQo+IENQVV9SRVNVTUVfRkFJTEVEIHJlbGVhc2UgdGhlIGFy
ZWEgYWZ0ZXIgdGhlIG90aGVyIGNsZWFudXAgY2FsbGJhY2tzLg0KPg0KPiBUaGlzIHByZXBhcmVz
IHRoZSBjb21tb24gY29kZSBmb3IgQXJtIHN5c3RlbSBzdXNwZW5kLiB4ODYgcGFya3Mgb2ZmbGlu
ZQ0KPiBDUFVzLCBzbyB0aGUgcGVyLUNQVSBub3RpZmllciBkb2VzIG5vdCBjYWxsIGZyZWVfcGVy
Y3B1X2FyZWEoKSBmb3IgZWl0aGVyDQo+IENQVV9VUF9DQU5DRUxFRCBvciBDUFVfUkVTVU1FX0ZB
SUxFRC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBh
bS5jb20+DQoNClJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNo
dWtAZXBhbS5jb20+DQoNCj4gLS0tDQo+IENoYW5nZXMgaW4gVjE0Og0KPiAtIENsYXJpZnkgdGhh
dCB4ODYgc2tpcHMgZnJlZV9wZXJjcHVfYXJlYSgpIGZvciBDUFVfVVBfQ0FOQ0VMRUQgYW5kDQo+
ICAgQ1BVX1JFU1VNRV9GQUlMRUQuDQo+IC0gUmVtb3ZlIHRoZSBibGFuayBsaW5lIGFmdGVyIGZh
bGx0aHJvdWdoLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4NCj4gQ2hhbmdlcyBpbiB2MTM6DQo+
IC0gTmV3IHBhdGNoLg0KPiAtLS0NCj4gIHhlbi9jb21tb24vcGVyY3B1LmMgfCA4ICsrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3BlcmNwdS5jIGIveGVuL2NvbW1vbi9wZXJjcHUuYw0KPiBpbmRleCBmMTgwZjM3
MjUzLi43NTdkZTExMWRiIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL3BlcmNwdS5jDQo+ICsr
KyBiL3hlbi9jb21tb24vcGVyY3B1LmMNCj4gQEAgLTgyLDYgKzgyLDE0IEBAIHN0YXRpYyBpbnQg
Y2ZfY2hlY2sgY3B1X3BlcmNwdV9jYWxsYmFjaygNCj4gICAgICAgICAgYnJlYWs7DQo+ICANCj4g
ICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICog
T24gcmVzdW1lLCBDUFVfUkVTVU1FX0ZBSUxFRCBpcyBzZW50IGFmdGVyIGFsbCBDUFVzIGhhdmUg
YmVlbg0KPiArICAgICAgICAgKiB0cmllZC4gS2VlcCB0aGUgYXJlYSBhbGl2ZSBmb3IgaXRzIGNs
ZWFudXAgY2FsbGJhY2tzIGFuZCBsZXQNCj4gKyAgICAgICAgICogdGhhdCBub3RpZmljYXRpb24g
cmVsZWFzZSBpdC4NCj4gKyAgICAgICAgICovDQo+ICsgICAgICAgIGlmICggc3lzdGVtX3N0YXRl
ID09IFNZU19TVEFURV9yZXN1bWUgKQ0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAg
IGZhbGx0aHJvdWdoOw0KPiAgICAgIGNhc2UgQ1BVX0RFQUQ6DQo+ICAgICAgY2FzZSBDUFVfUkVT
VU1FX0ZBSUxFRDoNCj4gICAgICAgICAgaWYgKCAhcGFya19vZmZsaW5lX2NwdXMgJiYgc3lzdGVt
X3N0YXRlICE9IFNZU19TVEFURV9zdXNwZW5kICkNCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

