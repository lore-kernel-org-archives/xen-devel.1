Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EA7C61DCB
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:38:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400449.1636114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWYk-0002mk-39; Thu, 27 Aug 2026 09:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400449.1636114; Thu, 27 Aug 2026 09:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWYj-0002lZ-S0; Thu, 27 Aug 2026 09:38:09 +0000
Received: by outflank-mailman (input) for mailman id 1400449;
 Thu, 27 Aug 2026 09:38:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1wzWYj-0002di-0V
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:38:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWYi-002LkA-DH
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:38:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a90057f-bab6-0a2a0a5309dd-0a2a450ca456-10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:38:08 +0200
Received: from [40.107.130.73]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6a90057c-f479-0a2a450c0019-286b82493340-5
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:38:07 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9562.eurprd03.prod.outlook.com (2603:10a6:20b:599::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 09:38:01 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%7]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 09:38:01 +0000
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
 b=Y5B62HZCXOcSnbOIpvrch9/Mrar3dohzhh2j8iAC4Qei5E3QK+tKALpf1KhP8oa7VDbBAL+F+hCGQF7wxLlMkeqeW7N1vwsNUQLI9vXWHJLPjabVc9JKHXufQBizZXmXbZAhf0QC4cimLvjp3kElB+ChVrysEYDCm2HKpDtksAS/BMMjz74Y0GCcJINC2I5POe/puHOv22LNZlnl0Cq9YUR1X2bDCpe25aAssJX+I2oQ8UacmeBpfTvWaiHVcJLlXug0nXndiqa1e6zbdGUxz8YGJHK2Bg4PdPRTJikRJmMN3OZQ61Bg4FiJL+/AT2lVR14BgOtc+AI1DeOVlA6G9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hUzwFJQA/zIrKfA9M7At2QegoMA77ggOg6gny1kC54=;
 b=cGYt4HighruKOFXFBpoQe3M7y4X8M/TVhL+cbXFhpEoADP0e/y92qVZdoN68oGUrey05J6T+YikwiNGsLiHcCrb310z94z/doFIFfFA7zzol1bgwgfeI7mUbN/aKUAhYJF1xXZeeFUuhdFg/XC2ZWs38aCfZW+4htqeuBoIgnOKtp1LP1bQIOZGAJOilJfgGLhLlR2N4seNpbsufBEePDgJXEc/vt8Yu6qAwMtm77wyoFrqoPcPV01QxVjoT4hSZ5a0wj4BGO2C56i9VfaTq9BRF2+P/VLSUBqRYTlnrLpSH6bDAOSemCTZDuJSe6S1RQfuXPcadlKEM6BR3qSwu+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hUzwFJQA/zIrKfA9M7At2QegoMA77ggOg6gny1kC54=;
 b=B7oCOVwhvhcIHvxcslTeC7EJXzenuapiq+tcsWGzw3QrSqKBz5S6hD6vo2DsWCk+IghE2ExobBc2OJ4J5eKtyfx/V7nV1iIRW0aX+rq4NQCIv6Kv4Jz0diZphVu8zOjBa9s/wdDuuGME0u2/80pU/fCnIJlpJENVU+z0KMRpWGsph92rTkapta/RsXdtkgbB87Rc3itv4ObiJ78gmULKstKq12mSqPF9lO5dBxPxwnT8drViwPLC7y7MZZX2CnrWOhmftKVx4IqqhRSXj5zeG/9ZAvH+RA5EoSukjOIUwnfrA8zy5myrLEmqJIE27OVQuFWDpYnvE0MfZkr4d5czOQ==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v1 2/2] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v1 2/2] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdNgfAHPmcI5IBhUGZU0o2oDVW1A==
Date: Thu, 27 Aug 2026 09:38:01 +0000
Message-ID:
 <e97ab666be0d667dc823c3d881ac9ed76267a7a5.1787821757.git.Sergiy_Kibrik@epam.com>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|AS2PR03MB9562:EE_
x-ms-office365-filtering-correlation-id: bae71e0c-836a-4483-57bf-08df041ee33b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 rV3KnQpwSkGWtrQjLmjioGsc3+UoqreuFxbG/Zw5vPAoBYtJSbVwAoP3saiHNVop9mLC3UiepEpSyuBiWqbl03VqguvB/ExPd+E++fhTF+L/VqhQvOyUSBQPWOPMyeWsqoFT85o6pEp6ui4GgWfPC2rwguqyEzqJG+IHjdKp18MkBzsHRljNI8xtIeI14hlues2/uthRZ6u/qMmEvtWkLUsCa1CxqfakQoqofU9WY156hfpBkZ8t4VDzw4okhRXhY4qgdnUcs+gMJOhMYhL1DnwKfk3pOjW4mATUlUl28iYSZpkeZZtQdR/VC+mZ5TDsyKNTW1smPoEOp3ZOvwhzDdnWlR5XaH1rHMS2zs09t8F8iSTO12tVGKU4j8nMguewfVZHwA1ULAOx7rshe3SsWV8qRYL8ZW4f0F9rpApyUIbeCJz4MM+CvneCwcXn3Q0Yg1lVe2VUpeyku7niMB9c8W5HsfhbSGPLe42lmvhV3BayLo1G1c0Q0xzretvYI8G7ywbaV51Qcz11glFJWEHdSwH5qe7/WHAXrqo9w0gb33PKZjxCKmok+LZncyvoySXDy1iwxuqa0C1YZGuKOq9iLMep+8lbNDDXoi3HJ92CjXg4JmJRV9P9cVCdtg1/avEVy4uarNrS6nO9Kob5f9XoYoN0PFvgUmRRg91a42+96w9ubbOjzvz0amB/0ggXiKvtW+YYc4bv2TW9Y3nsX4P9wxs4MIm4sh1Z04Ew2d1/unY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHJ4ZENsZ2ZrMXJldXBPV3NETkc1cUdydGI2TDkxY0Z3VHJyNk12Y1lLOHhM?=
 =?utf-8?B?Z1dydWxuMWkxZm9LMXVxY1VTblVPM1Ryd3NybzNScnNHcFNEOEFaRlpDN2tQ?=
 =?utf-8?B?ZHZTb2tZZkVPSkw2cEFTb1AvOUdkZnArNWxCNzkrQjFRVVNaM3Z0ZEVlNThB?=
 =?utf-8?B?Y1NZUjdVa2JNdVVkVndZYmozbHdNejBuVTNhdjQybS9ZL0hGb2NWN0QvcGZl?=
 =?utf-8?B?aSt2Um84ZUVQNE91SWJjcTgyeE5TSGFGZzNRcWMrSDRtR094dmpIczNDTVpw?=
 =?utf-8?B?MCtJN0Z6d0NYdmMxSEh5cEpBZUY3bnpKMXhoRE96TlZkaWxiTlY3d2tOV2tw?=
 =?utf-8?B?RHZjY3Zid0RXTysxbSsrYmdSWWxVWFZIOTVyL2ZTdTNLU1IzTFZ6eE9OOU1m?=
 =?utf-8?B?LzNzY1pYaFhQS1ZSZjlrR0RHQ3IvL01UbFpweWtMVmQ2YmJRMlRDb1J5M3hZ?=
 =?utf-8?B?T1dISzVReTJRQVhCdmNWRjF3OWx4L0J4MXJBMkFwSmlqQ005eXpwQlpObkV1?=
 =?utf-8?B?N2FtckZNQmRtbE5EcE96VE56RXY4Z2ZreTNRYkV4L3RtWWdyektqUFpxRmNx?=
 =?utf-8?B?clUzblFCb1VCSUI1VEJhd2ZKRngwa2djWWFuU0dmTGVoVkNiTkN0MkpPTkJy?=
 =?utf-8?B?QkN6U0Z0QVl1QlVQTWNVM29JbEd0NkRFUWp1QmMzczdaYWhPTlpFRHdtQzZT?=
 =?utf-8?B?NWlJZWoyNzhaaWViTW0rQlArWGVnVnV5N0dMWnZxWkZQYWxmZXhaTGtHWFhr?=
 =?utf-8?B?c01yTzBqMDRHRFNpRHdST2FqQ1RQNzBudUVmbkJ1N0dTcytXU2lYS1IrVmo0?=
 =?utf-8?B?QkF0WDFHTms3T2pZZHliY2JTcWE3S0hhUStlMkNJU1Y0eHkwdkxST3lPZGpH?=
 =?utf-8?B?R09aczNkWHROdkF1bE1HYjlhQTg3bUpJV2ovMWpGTmsrcmZCSHNzSU5ybnBy?=
 =?utf-8?B?WXJkS2FJWUxPNTVXOVBsR2l5ZTZvNzQ1dUJvaWorMkF3Kzh3M1RQVFFwVWkx?=
 =?utf-8?B?cTZhTjlPRVA5VWVDMzF6a1RVZ3FpRXZBYVVMY3laZUVhaWt6RkQ1c3dtMisw?=
 =?utf-8?B?S0YyNkovTWpEY2tHcmdPeEZ0VEZwUXRFU1pmV2wwN0IxOXZWK1JubWZpQ0Mv?=
 =?utf-8?B?bkRXVGpkWStXM00yblkwd2VoY0p1Tk9Nc1RKQTgrTDkxS1JpQjY3NzJuUmNW?=
 =?utf-8?B?VHM3UDJnQWg5TE4wWE1BMzRzWHRYQmhWS2hZanhRcVAxMlEyTERXTXBla3JT?=
 =?utf-8?B?eXNaWitvNDN0bUFodHJ5aXVyNEs0ZkowZm8vd3JEeWE1dGRSL1QrYnFKeXpZ?=
 =?utf-8?B?RXFIakJpdlA0UHpXWVhwTTdvanBuanVPd3VaVGNuSjdKQ0NoeUNrWjF4TTRH?=
 =?utf-8?B?UWhMbjF1VDYydnFGSHRTaURkdG1EK2UzNlpxT1FtaWwyeEU4T1lpVEtocmRU?=
 =?utf-8?B?a3JNa0J0a3dKR1dQZVhjN0M0ZjRwcUpIazhncmxYd1B3TEwvK00wWCtETFU3?=
 =?utf-8?B?aFhtMzZWR0NTTDU2OVN4S0xOSVNnekIwL3RteER2a3paWkljSEttSFF0QnpX?=
 =?utf-8?B?djlEbUJaZW55TzdHa3pPcDJaa0ZPdGE4eUNUSkVtOWM5Y2tITmNYQ21aVGJz?=
 =?utf-8?B?WkgzSHBvci9XTnhhYnFMdGFFaDJHSXBpK3o5dlpOcUkxUlMwNDN1a0M1UWc4?=
 =?utf-8?B?eENTUmNhQmlTSmZlcmxjRjVNTmY1SDErSHZqc1d3Y3htRmR2YzZvajdWVmhX?=
 =?utf-8?B?NHYyQzFlRDh5c2FoYjcvRXkxY21EYWplM1NvL1pIVEZzbEVPVE9Oa2FQbkRu?=
 =?utf-8?B?eXYwejhqc2ZCVGY0SXRlMFMzRXNWSGhxY0FFUjQydC9oMGVpL2lST2VRWGZJ?=
 =?utf-8?B?MUNPdFVNQXJJaVFpMjdrZkJ3RGJqUnAvbmhHY3RKMVkyeWI2ZTFLaTNXbkVO?=
 =?utf-8?B?YS8xMXJ0eUsxRkFEVGRqbW1LR1kvRFJtQ2NvQ3FTNTBwYmdUQWlnbVRUbHc3?=
 =?utf-8?B?MmlpVWszM2RCKzFsTldIRkdsTFhHN3gwRndGajlsaGx2UUNNL0ZickNrbkl1?=
 =?utf-8?B?M2xpdHZ4aE9VQU9GN3dkcVJTRzVCTFI4aC9wMmpFT0tmbFdUdFVsRWp5eGJZ?=
 =?utf-8?B?MmZudVFMbWNocGRyVXFxQ1dHeGdYNUl2WWNUVmVQdWozWVhTdGQ3Yy8yRy9x?=
 =?utf-8?B?ZU9YZXlHUVVGU2ZjM2JaOWFuWUFvN2h3ZEE3RmpCUSttQ29FZjBCeGtQUkJ0?=
 =?utf-8?B?cnVEdWlYNjRVclNMOGRPeC81WkhJOEVXN1VBUXg0OWJpeHMyZzd5SDEzUzVQ?=
 =?utf-8?B?ZUQ1V2Z6R3IzbjlvdWd0b1hVdEQvdytPay9PWEtnRTdNRmpIaTJZUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9114834568C8D4FB8D9C4A502935E6B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae71e0c-836a-4483-57bf-08df041ee33b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 09:38:01.6047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGmSB3PGwY4KGn0Cl4v69oVXC+5n47Q9nd3V2vgW3bK0hs/syCLtJVTKJOmapzt/RNDajitMqwN/+31dPJJV4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9562
X-purgate-ID: tlsNG-d25034/1787823487-024DFA5B-16147642/0/0
X-purgate-type: clean
X-purgate-size: 5006

QWRkICJzZWNsYWJlbCIgcHJvcGVydHkgdG8gYmUgYWJsZSB0byBzcGVjaWZ5IHNlY3VyaXR5IGxh
YmVsIGZvciBhIGRvbWFpbg0Kd2hlbiBYU00gRmxhc2sgaXMgZW5hYmxlZCwgc2ltaWxhciB0byB4
bCBjb25maWd1cmF0aW9uIGZpbGVzLg0KDQpDdXJyZW50bHkgZ3Vlc3QgZG9tYWluIGNhbid0IGJl
IGNyZWF0ZWQgYnkgWGVuIGluIGRvbTBsZXNzIGNvbmZpZ3VyYXRpb24gd2hlbg0KRmxhc2sgaXMg
ZW5hYmxlZCwgYXMgZG9tYWluIGlzIGFzc2lnbmVkICJzeXN0ZW1fdTpzeXN0ZW1fcjp1bmxhYmVs
ZWRfdCIgbGFiZWwNCmJ5IGRlZmF1bHQsIHdoaWNoIEZsYXNrIGRlbmllcyB0byBjcmVhdGUgYWNj
b3JkaW5nIHRvIGN1cnJlbnQgcG9saWN5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBTZXJnaXkgS2licmlr
IDxTZXJnaXlfS2licmlrQGVwYW0uY29tPg0KLS0tDQogZG9jcy9taXNjL2FybS9kZXZpY2UtdHJl
ZS9ib290aW5nLnR4dCAgICAgIHwgIDggKysrKysrKysNCiB4ZW4vY29tbW9uL2RldmljZS10cmVl
L01ha2VmaWxlICAgICAgICAgICAgfCAgMiArKw0KIHhlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9t
MGxlc3MtYmluZGluZ3MuYyB8IDExICsrKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jv
b3RpbmcudHh0IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KaW5kZXgg
YmNiMDZiYzc5Ni4uZmNjN2JlMGZmYiAxMDA2NDQNCi0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNl
LXRyZWUvYm9vdGluZy50eHQNCisrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGlu
Zy50eHQNCkBAIC0zNDUsNiArMzQ1LDEyIEBAIHdpdGggdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVz
Og0KICAgICBub3QgcGFzc2VkLiBUaGlzIGNvbmZpZ3VyYXRpb24gcmVxdWlyZXMgc3RhdGljIGFs
bG9jYXRpb24gKHhlbixzdGF0aWMtbWVtKQ0KICAgICBhbmQgZGlyZWN0IG1hcHBpbmcgKGRpcmVj
dC1tYXApLg0KIA0KKy0gc2VjbGFiZWwNCisNCisgICAgQSBzdHJpbmcgcHJvcGVydHkgc3BlY2lm
eWluZyBhbiBYU00gc2VjdXJpdHkgbGFiZWwgdG8gdGhpcyBkb21haW4uIEVmZmVjdGl2ZQ0KKyAg
ICBvbmx5IHdoZW4gRkxBU0sgaXMgZW5hYmxlZC4gRG9tYWlucyB3aWxsIGJlIGNsYXNzaWZpZWQg
4oCcdW5sYWJlbGVk4oCdIGlmDQorICAgIHRoaXMgcHJvcGVydHkgbm90IHNwZWNpZmllZC4NCisN
CiBVbmRlciB0aGUgInhlbixkb21haW4iIGNvbXBhdGlibGUgbm9kZSwgb25lIG9yIG1vcmUgc3Vi
LW5vZGVzIGFyZSBwcmVzZW50DQogZm9yIHRoZSBEb21VIGtlcm5lbCBhbmQgcmFtZGlzay4NCiAN
CkBAIC00MjIsNiArNDI4LDcgQEAgY2hvc2VuIHsNCiAgICAgICAgIG1lbW9yeSA9IDwwIDEzMTA3
Mj47DQogICAgICAgICBjcHVzID0gPDI+Ow0KICAgICAgICAgdnBsMDExOw0KKyAgICAgICAgc2Vj
bGFiZWwgPSAic3lzdGVtX3U6c3lzdGVtX3I6ZG9tVV90IjsNCiANCiAgICAgICAgIHZjcHUwIHsN
CiAgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbix2Y3B1IjsNCkBAIC00NTMsNiArNDYwLDcg
QEAgY2hvc2VuIHsNCiAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MT47DQogICAgICAgICBtZW1v
cnkgPSA8MCA2NTUzNj47DQogICAgICAgICBjcHVzID0gPDE+Ow0KKyAgICAgICAgc2VjbGFiZWwg
PSAic3lzdGVtX3U6c3lzdGVtX3I6ZG9tVV90IjsNCiANCiAgICAgICAgIG1vZHVsZUAweDRjMDAw
MDAwIHsNCiAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxrZXJuZWwiLCAibXVs
dGlib290LG1vZHVsZSI7DQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9NYWtl
ZmlsZSBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvTWFrZWZpbGUNCmluZGV4IDkwMzZlNDU1ZDYu
LmU0ZGUyOTI1MzMgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL2RldmljZS10cmVlL01ha2VmaWxl
DQorKysgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL01ha2VmaWxlDQpAQCAtMTEsMyArMTEsNSBA
QCBvYmotJChDT05GSUdfRE9NQUlOX0JVSUxEX0hFTFBFUlMpICs9IGtlcm5lbC5vDQogb2JqLSQo
Q09ORklHX1NUQVRJQ19FVlRDSE4pICs9IHN0YXRpYy1ldnRjaG4uaW5pdC5vDQogb2JqLSQoQ09O
RklHX1NUQVRJQ19NRU1PUlkpICs9IHN0YXRpYy1tZW1vcnkuaW5pdC5vDQogb2JqLSQoQ09ORklH
X1NUQVRJQ19TSE0pICs9IHN0YXRpYy1zaG1lbS5pbml0Lm8NCisNCitDRkxBR1MteSArPSAtSSQo
c3JjdHJlZSkveHNtL2ZsYXNrL2luY2x1ZGUNCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2Rldmlj
ZS10cmVlL2RvbTBsZXNzLWJpbmRpbmdzLmMgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBs
ZXNzLWJpbmRpbmdzLmMNCmluZGV4IDQxZDcyZDBkNTguLmJmZmQyZWM2NWQgMTAwNjQ0DQotLS0g
YS94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJpbmRpbmdzLmMNCisrKyBiL3hlbi9j
b21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmluZGluZ3MuYw0KQEAgLTExLDYgKzExLDggQEAN
CiAjaW5jbHVkZSA8cHVibGljL2Jvb3RmZHQuaD4NCiAjaW5jbHVkZSA8cHVibGljL2RvbWN0bC5o
Pg0KIA0KKyNpbmNsdWRlIDxzZWN1cml0eS5oPg0KKw0KIGludCBfX2luaXQgcGFyc2VfZG9tMGxl
c3Nfbm9kZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBib290X2RvbWFpbiAqYmQpDQogew0KQEAgLTIxLDYgKzIzLDcg
QEAgaW50IF9faW5pdCBwYXJzZV9kb20wbGVzc19ub2RlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAq
bm9kZSwNCiAgICAgYm9vbCBoYXNfZHRiID0gZmFsc2U7DQogICAgIGJvb2wgaW9tbXUgPSBmYWxz
ZTsNCiAgICAgY29uc3QgY2hhciAqZG9tMGxlc3NfaW9tbXUgPSBOVUxMOw0KKyAgICBjb25zdCBj
aGFyICp4c21fc2VjbGFiZWwgPSBOVUxMOw0KIA0KICAgICBpZiAoICFkdF9kZXZpY2VfaXNfY29t
cGF0aWJsZShub2RlLCAieGVuLGRvbWFpbiIpICkNCiAgICAgICAgIHJldHVybiAtRU5PRU5UOw0K
QEAgLTE0MSw1ICsxNDQsMTMgQEAgaW50IF9faW5pdCBwYXJzZV9kb20wbGVzc19ub2RlKHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSwNCiAgICAgICAgIHBhbmljKCInbGxjLWNvbG9ycycgZm91
bmQsIGJ1dCBMTEMgY29sb3JpbmcgaXMgZGlzYWJsZWRcbiIpOw0KICNlbmRpZg0KIA0KKyAgICBp
ZiAoIElTX0VOQUJMRUQoQ09ORklHX1hTTV9GTEFTSykgJiYNCisgICAgICAgICAhZHRfcHJvcGVy
dHlfcmVhZF9zdHJpbmcobm9kZSwgInNlY2xhYmVsIiwgJnhzbV9zZWNsYWJlbCkgKQ0KKyAgICB7
DQorICAgICAgICBpZiAoIHNlY3VyaXR5X2NvbnRleHRfdG9fc2lkKHhzbV9zZWNsYWJlbCwgc3Ry
bGVuKHhzbV9zZWNsYWJlbCksDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZkX2NmZy0+c3NpZHJlZikgKQ0KKyAgICAgICAgICAgIHBhbmljKCJJbnZhbGlkIHNlY3VyaXR5
IGNvbnRleHQgZm9yIGRvbWFpbjogJXNcbiIsIHhzbV9zZWNsYWJlbCk7DQorICAgIH0NCisNCiAg
ICAgcmV0dXJuIGFyY2hfcGFyc2VfZG9tMGxlc3Nfbm9kZShub2RlLCBiZCk7DQogfQ0KLS0gDQoy
LjQzLjANCg==

