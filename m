Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D68CA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 10:30:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439028.1657545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCaWk-0005P9-Ek; Fri, 02 Oct 2026 10:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439028.1657545; Fri, 02 Oct 2026 10:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCaWk-0005P2-C5; Fri, 02 Oct 2026 10:30:06 +0000
Received: by outflank-mailman (input) for mailman id 1439028;
 Fri, 02 Oct 2026 10:30:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Sergiy_Kibrik@epam.com>) id 1xCaWi-00055D-QF
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:30:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCaWi-00FrfH-3X
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 12:30:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6abf8799-8faa-0a2a0a5109dd-0a2a450ad31c-32
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:30:04 +0200
Received: from [52.101.83.75]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6abf87ab-f2d2-0a2a450a0019-3465534b944e-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 12:30:03 +0200
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DBAPR03MB6408.eurprd03.prod.outlook.com (2603:10a6:10:194::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 10:29:58 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:29:58 +0000
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
 b=rjXTNa4tmxUUGyvJnVmzH6ENDCfx2NyQ43RTQJLSJnVcaW342Z26cThwv+3HDNVJLMmJ1QLU30nVwBP4bRU/QEudNzblMyWkH7KxCjwClsAcVB2SGXzZKedB3poLfsMOoTDklmNjsRnGe0COMwrCSU4SiNz9/JljHbEvzppcFqSAC5Vm9wGHA/CZebkqbtR5nGQzgXR0A44bLhlPT6VzfQRMgzatox8lK23IQF4CVOaud+nQX3Y7pO55/pmk93mCjnBJkk9aVyM/J9fU794y1iwEIVVjrOo7VhCeao3cuiAHHDdOIgV6/1GksG7l8/uhYoM+PG4zFXtq7zko9OeKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLrSnB8SPF/okncHWoV+okSYAdNqsGAHwI46xiRzM7w=;
 b=OYCMUUDjy/w4/J7ApYj+wb4i0ft9Vdk8x50Q1d8Rm9Ew9dN3lY98dEHQaA2gqsHwBN9NINNZYATF6S0G/RGZuL5LSz4faNk7beFsDAabyQRUUPfPHXfxuILpKFkNHi71sWJKgHfuZxXpkM0PnXtU0AhbAMJ8SSrk5jSfZAUD/1wJ2aNPXj+VTAnD0QY8ZL+W4stWo2r4e5H3ZjIbFuzW9VBwV2YsG7a/Kcj9ovb2QMAAlqPQTG8u0eJPq9Mn5GDvqXAzF+avSC1lGIasnInFC+SdmL/SJgxGB5AqPRJPEJeHpXqMz2oMKxvh0y6eSEgsQH76yolF/yGVFQQPdH8aTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLrSnB8SPF/okncHWoV+okSYAdNqsGAHwI46xiRzM7w=;
 b=dtvLy8zkdhON6o10yOLoaaERdUjDewXySKotFDO7EMabnSkbd3DZFWx6mjfV/hT8LWFAHLrjDmqlgUYBa7dTwuIeDjfDRwZ23UtaIXi8mUTUDReUJ6PoFkKw+JiLR1mrtYYrTKz76jv8l2DQv+Bogp+llCd6PrFJE52VXcQc2cNOx2HXGigMLS4rfr9DUsaEpqKDUFgnmsr/5gdPoTuNEf6nt0Ycm0Nsa7f4aqRItA3TmsLKJoBeJ9CNidE9elmeHzZMCNYhXMge9RZp6CN/gWhj7fR6BvvXroyQ8oQ+13mG2FNtwoEt8H5fD84BphTTqnP/ERR77yphASU4T4m47w==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RESEND PATCH v1] xen/xsm: flask: restore sidtab state on policy
 load failure
Thread-Topic: [RESEND PATCH v1] xen/xsm: flask: restore sidtab state on policy
 load failure
Thread-Index: AQHdUlATCy0sfywDV06Ga65AkQTQHLbp/b0AgAAPk4A=
Date: Fri, 2 Oct 2026 10:29:58 +0000
Message-ID: <8349bf11-930b-4431-8d77-51f273827446@epam.com>
References: <20261002092556.542986-1-Sergiy_Kibrik@epam.com>
 <0787063a-ca04-437b-9bd9-307fa084007e@suse.com>
In-Reply-To: <0787063a-ca04-437b-9bd9-307fa084007e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB9192:EE_|DBAPR03MB6408:EE_
x-ms-office365-filtering-correlation-id: 5ba8c523-f998-4c41-0087-08df20701bd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|5023799004|11063799006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 qhiFTWBkIaTXSCmIa5FLDharxLUVRpZxxg03kFjwXQGPKystCD4JfYDMFjJA6UfkTKqTQoQiPJbXhnFKZzXnfXxDPlwtOtzlJgz9PCuL5j77GFwAp0inda0eL8xb4IC5ylGmurdiN+Xub803RDnpMKZ5TAG/9aWAT3azrBrrkoSenhOPfWe8z+IvmFA7GL5un2wJ0N5d0G5n1deY8eiZ896Bzpy0pj0VySkHD4xq0h6cn5xBf+IJFHkhWjCFdEY50R/SqrY8U8LU6FFK/gpb8nDFgzYgjxDTk48dpljUsqMgnaw4vMsiOBjm7Mbb/G38kK7s2LtJusNeIlay45+5mWaOfEHuuDJ5ClNip6JwQcw/mPGMgwIkUn1ZhLC1oilgqfiIChRcvYFTuI0dRIrfyMTPYvpqiNmKOl7HjEmldZKnOWuXgynw+wclywppvI3i/LiSTAGDypFqmc55Pl2Oy4wtzpjUC4DOxANkIlXnbIzsKbw6AwUSIcHmyHTieaImtBqUwk+M+hVcFY747ER3y4nUgjQuYIRYHTRni2kXNwM64v7ap0j6MsfCwFaASaycbsIz8CNsz8bABR9BVeVEkr56LB5855kvrVWCHvktrzvNq568GCcXkFJmTHUqnkC5FeLS7ls/l7c4MEY2Pv+LsO+mXpKD01i4Ab9fvmh9Kz+/fpXNS6f2tZmVMPAtmytJpLtHeP/T1LSQPnBDJ9RLj334SpPgJyySKskNkhkhtAY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(5023799004)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXdnSE1DMTdac213QUE2ZytScFBpMUNVQ1B3TkFPZmpMV0NKNnI1OWs0Q3lx?=
 =?utf-8?B?S3krVEhPQXhrUlZTYlVOOU43V3l1WXlBeVFTYkVwTWF2TWxnZnYyM0ZiNm1l?=
 =?utf-8?B?SzIrbG05bzh0eWZXVnMxYWZScGhwVk16dDdUSU53VnU0RHNiYlJRSDN5ZUcw?=
 =?utf-8?B?RUZTMWNIajc1YXdTVEV5QnZiRmt2NlpZYnZrbVZKSzIxdEhQc3o4cjM0WW1O?=
 =?utf-8?B?b016SlV4L2lYSjZKMEd3Y29ueHRodHh6bndkSFVsSE90biszamhOWGhjWm81?=
 =?utf-8?B?aTNOUGI1UGc5VmZBa0lZQm1RSVdlbTVWMTRNVS9vQURnUVFpS0E1Z1k2eklC?=
 =?utf-8?B?RUhKT0FpTm1YWjc4K0s3QzRPSEhKaFR0c0JRUXpvbm10cVYvbXJEV1lXU1BQ?=
 =?utf-8?B?S1orUWkrSGtUNy9hNjRzOTlvRmJCeFlCLzBBdG9MZ0pzVEVqY2VEOUpUYTBu?=
 =?utf-8?B?cTZucXQxZTBvUFlvMEY2MVd0M3BPK2M3NDFHa3diNy9EbkhMdE9LcXpYNTI5?=
 =?utf-8?B?Tm11QytodmdCYVlObjNIOHFzdFNVRGhOcUFtRVVyeEdTYW9JaU9saEI5Y0Jn?=
 =?utf-8?B?eXhzaTRab3RINThhc1k5WTF0OERabVp3aDBUbC9SaGEzQUJhY0JsV1VkZ0Vu?=
 =?utf-8?B?eE1DNHpEcnQva0N2aFFFNWNUZTgwUDVWR2tkZjJIeEVPcEVtcEV5NExmbkdF?=
 =?utf-8?B?Sk0xZjlhTkZVOW9BcjZGUmlKTjhLektodlBJRFMwOU1qSTZOTnFxUHBBTkJM?=
 =?utf-8?B?cjVscmhyYmlWdkFxSkY2UTA5ZGxnSzVJS25UNGFhWHVxZ0lZWEVzWGVuZG5H?=
 =?utf-8?B?Sy9FaEVvalhxR0JxRmx2WUhqd3hmc0FUZktTTzJWQXlBM0wzMklQc29LcHNK?=
 =?utf-8?B?Y0NVcmxBM1l4R1p4NjlJUWNBNnZUa1V5WlFMZmdBK0JaM2RLNmpZZlZMWkFy?=
 =?utf-8?B?cUlpTTZ2c2J2dy90WVVQcEtVdHFmRHlvYmpRNTdHUExrUE5tNlBBMTZBOUc3?=
 =?utf-8?B?SVV4OHp2dDdJODRPZ3VaaWJzU2JQanlKK3Vsa25JVzZjeFhLTkJEU2U1Q29h?=
 =?utf-8?B?SHVUdVlScVV2VHNjczYzY0RiRXM4NjllUGZ3NUd3MlJ6VlhIYzJkUFVnTE03?=
 =?utf-8?B?R3dKeTRVK2ZwZVFWYUlUMzVCb29tTjA1MDBnK2d0Ulp4R2taZ2dGUEZVaHU4?=
 =?utf-8?B?Ymo0dkw0eXhxS1hBOC84amRkcEptZFBGWjlZUDEraDUrYXFGU3BFWGFIM1FR?=
 =?utf-8?B?Ny9NN3Z1V2J5NkVpdmcrZmk3cndXcElRQmVUQUJRbU9HOFJuNE1HMmN6S2Zr?=
 =?utf-8?B?Qm82V2VqdHlqYjA3TXlpcEJKMXJzUFpUalZTeTJQeVVndUJjOHJla0JsZFpJ?=
 =?utf-8?B?RjZ2S2ZFYmVoNGRMY2E4QkhNdklvdnV6OHk5ek5Lck5KT1ZHVWFTNUZZcnBp?=
 =?utf-8?B?VWFyc2kyWkZ0UXJibmIybnNqbFZiZGlxbm1yaGh5bHJMSW9JVG5pbGVnbFlr?=
 =?utf-8?B?MUo4UHl4VE9wZEZXbGh2dnp5blovZnlUczZhcmdqY0k4NE96KzJwNEZJd0Fu?=
 =?utf-8?B?bTlaNmVoS3JyNnkvZ05JaTBvWExROGJ5R2M2aXNGcHh6WSs2eDVJV1BhOUtu?=
 =?utf-8?B?SksyQWgvak5HdlpkWXFYSmVYaTdGZjVua05ib0RDU09heUR0NUtZTmxNYXFy?=
 =?utf-8?B?MS90ekgrWnY0UEhLTXdhdnM2dk43WUo5YWFRR3dkWFJxMjhpdXg3Ynh6eDBp?=
 =?utf-8?B?WXZkLzhxQnd6S0hRcmhNcnFYcHN2ZkFPZzQvOWdUTlIwQ1lFQUwwemF3MDlT?=
 =?utf-8?B?S25tNDFodHd2K005Z1dtUkdFMWVLWFZ0Sm5JZnNvcWNQcFJjckxPbFk2SG00?=
 =?utf-8?B?UVFQUXo0ZS9sZUo3akgrY0tIc0x2QktCQSs1TnFDT05lVG1hUjNZRWFleDZn?=
 =?utf-8?B?QTN2YzhWNG1PYjlLaVVyODdad0ljYTF6NkkyMGFlTXkvbW91dEx6K1VRdmFR?=
 =?utf-8?B?QTYvRzRmOWJETzhqVHB6SFRBQ1hzRGI3dHBrR2ROQ3pLWXRRT0tZVjRTblc3?=
 =?utf-8?B?VkJzdndsK1lmbEd3SktRTU81dWpIMzdYcmUxeVY2ZWl4M0tRajlNSHFZd09E?=
 =?utf-8?B?dGt0UTZWVGF1VFE3Wm1WVkxQNkNSM1FJcjhreDkybG0wcE5QUk5TZWFIVTc4?=
 =?utf-8?B?bVM0RHNCT1hsZ1lIYnpCVkZaT3FGUWIzM0c5T0N6QWJuazIwaUFJRzhqSjdE?=
 =?utf-8?B?NGh5cnpSUTlXZHhUK01kYnE3ZlYwUTd2ZWxRUk5NcUdDSzVxS01qVlhYaEY3?=
 =?utf-8?B?ajRtRHZNQnIwSmE3aXMrQXBHMkNYWHJoSlBjbWhneWowMndyc0tUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <607C4A13531F054EA551A4C6D6C849C6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba8c523-f998-4c41-0087-08df20701bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 10:29:58.4550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1khJJIxo6ZalFY2MkJ+m4WBhg4U5/tUM9Fs4fIaM9y4td+9qQqThHzSPaWe0b4PQrSquvFCcyPO7gV7OiMl4tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6408
X-purgate-ID: tlsNG-4011c0/1790937004-4BED2CFC-19A1DB50/0/0
X-purgate-type: clean
X-purgate-size: 1442

T24gMTAvMi8yNiAxMjozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjEwLjIwMjYgMTE6
MjYsIFNlcmdpeSBLaWJyaWsgd3JvdGU6DQo+PiBFcnJvciBwYXRoIG9mIGZhaWxlZCBzaWR0YWJf
bWFwKCkgbGVhdmVzIGdsb2JhbCBzaWR0YWIgaW4gc2h1dGRvd24gc3RhdGUgYW5kDQo+PiBmcm9t
IHRoYXQgcG9pbnQgc3lzdGVtIGlzIHVuYWJsZSB0byBhbGxvY2F0ZSBuZXcgU0lEcyBpbiBzaWR0
YWJfY29udGV4dF90b19zaWQoKS4NCj4+IFRvIHJlc3RvcmUgc2lkdGFiIHN0YXRlIG5ldyBmdW5j
dGlvbiBzaWR0YWJfYWN0aXZhdGUoKSBpcyBpbnRyb2R1Y2VkLCB3aGljaCBvbmx5DQo+PiByZXNl
dHMgc2h1dGRvd24gZmxhZywgcmV3aW5kaW5nIGVmZmVjdCBvZiBzaWR0YWJfc2h1dGRvd24oKS4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnaXkgS2licmlrIDxTZXJnaXlfS2licmlrQGVwYW0u
Y29tPg0KPj4gLS0tDQo+PiBOZXcgZnVuY3Rpb24gaXMgbm90IHN0cmljdGx5IHJlcXVpcmVkLCB0
aGlzIGFsc28gY2FuIGJlIGFjaGlldmVkIGp1c3QgYnkNCj4+IGRvaW5nIHNpZHRhYl9zZXQoJnNp
ZHRhYiwgJnNpZHRhYiksIGJ1dCB0aGlzIHdheSB3ZSB3b3VsZCByZWx5IG9uIGl0cw0KPj4gdW5k
b2N1bWVudGVkIGludGVybmFsIGJlaGF2aW91ci4NCj4+IC0tLQ0KPj4gICB4ZW4veHNtL2ZsYXNr
L3NzL3NlcnZpY2VzLmMgfCAxICsNCj4+ICAgeGVuL3hzbS9mbGFzay9zcy9zaWR0YWIuYyAgIHwg
NyArKysrKysrDQo+PiAgIHhlbi94c20vZmxhc2svc3Mvc2lkdGFiLmggICB8IDEgKw0KPj4gICAz
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gTm90aGluZyBpcyBiZWluZyBz
YWlkIGFzIHRvIHRoZSByZWFzb24gb2YgdGhpcyByZXNlbmQuIFdhcyB0aGlzIHBlcmhhcHMgbWVh
bnQNCj4gdG8gYmUgYSBwaW5nPw0KPiANCnllcywgaXQncyBraW5kIG9mIGEgcGluZy4gTm8gY29t
bWVudHMgZm9yIHByZXYgcGF0Y2gsIHNvIEknbSBzZW5kaW5nIA0Kb25jZSBtb3JlLCBpbiBjYXNl
IGl0IHdhcyBsb3N0Lg0KDQogICAtU2VyZ2l5

