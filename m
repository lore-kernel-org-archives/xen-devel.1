Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8D606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=TU2xBmLb
Received: from list by lists.xenproject.org with outflank-mailman.1486683.1689202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRgIr-0008J2-6z; Fri, 13 Nov 2026 01:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486683.1689202; Fri, 13 Nov 2026 01:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRgIr-0008Iv-3l; Fri, 13 Nov 2026 01:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1486683;
 Fri, 13 Nov 2026 01:42:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRgIp-0008Ip-Mr
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 01:42:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRgIo-0028bV-Oy
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 02:42:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af66a93-8faa-0a2a0a5109dd-0a2a45019a14-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:42:06 +0100
Received: from [52.101.70.109]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af66aee-5984-0a2a45010019-3465466dd56c-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:42:06 +0100
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com (2603:10a6:20b:d4::24)
 by PAWPR03MB10043.eurprd03.prod.outlook.com (2603:10a6:102:35d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 01:42:04 +0000
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416]) by AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416%6]) with mapi id 15.21.0592.009; Fri, 13 Nov 2026
 01:42:04 +0000
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
 b=qmLxJo9QmGemje3xgMKZof//uCESchy4TgUn53fp/0cbV1/g4ulCxAUpcxwh4D9MSaS9D4YXu65YkKlr80nG6Y17/S2T/sOhBIxzrMIknO9sZFTYX+060xshCZVzVpGg39Vmkk0EswQcvw/w2JYZCVsrYccKKR2jagn2StMXkOlYx36YdUap5Bi+7QhgrBfnOVfMskxrbismzDtn5CwoyfIlYOcwA2Q252KHoaJ4HfRL63HIacFyEjTtfZP+8zxQCuhhTVtCL1zzCAEsLhObbWUU22tCU5/0k3YttgErvIA2UpVKXleGykocUIFTU5YLZKN3a6nYZ22ReLCCYPXPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1leAgql5u5vZ7qEFFBxt71dFSENd+EINZ/q2FlGY+YQ=;
 b=lc2+plI6+yc0COpYZH4M6Uk4oz4jipLBsYnZEOQatpZj6LpAfLgjNAIzfrTmRvNrYZ2XLVqzjvGdVM9Z3XtH06/S8oGvCWWeHhdjusd52h0ng0yj2NJckXTYmMEUUhnY68IrPt+qQ2wead3TObcyr6GJb4eojPAZgCaRCXPb3ONINVVadCoOcoKdW1IDWxLKml0f0YnXYdORk2wpwxLKWRUMoh57aUWRaMlSkTfAhqXxys3uxP1OzpiLt0IjhjmCgyP6Lvh4e3u7OkRdrdS5h8GyUcRAeXZRcDeKv1tkNVWxSVUjaZwPH7jnc307oTigF1EyDjQYsZjObzRrEKogeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1leAgql5u5vZ7qEFFBxt71dFSENd+EINZ/q2FlGY+YQ=;
 b=TU2xBmLb+c4c2/VHRdnLbfD/AcI1rHraGphzBrTCApJ8PK3Bc9ygNvtSFuANA+PcKwRBsopFGUrWYg1czvO0/ykZ8S1GRvctMyvPqF8MK9VZgIgXSQ2McSqXEisUR/laJy9W5zscN/MqERyYjtyUqBSHHjgVBOmz8/GDvaaispX8f1C5ZCYPu8D2RXUCSPT9/TC8swZxhS0wfRZCP+WYa/O8YoYj13+NWxUJwkTdi4bUIiZWF3Afskft4XrNoeFdw82flYeU2vKyOHOyYGFgT9wxUBXO3bl9Z1OxWkeUo42hD6cleXxAXYnp7pnw8JoEhd9cnCXYHtMR96lQMzoAxw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
Thread-Topic: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
Thread-Index: AQHdctS+bY8M3xpQsk6cT4CjWHv4wA==
Date: Fri, 13 Nov 2026 01:42:04 +0000
Message-ID: <87h5hl8q38.fsf@epam.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
In-Reply-To: <20261112183620.3277591-1-andrew.cooper3@citrix.com> (Andrew
	Cooper's message of "Thu, 12 Nov 2026 18:36:20 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB6070:EE_|PAWPR03MB10043:EE_
x-ms-office365-filtering-correlation-id: 75396a9f-bf6c-405d-58bc-08df412751f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|261102123227099003|261022075727099003|261021123027099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 R6mWxvRW1u1yah7lejWBv5e/yMM8GTsDRi072Jb9Kca8CyxaoBRuRJ1Am+wrDxN6P3GUknBWq7CcK22AhQWeIJ7rKnkuxJsAjtkE10Z8+gK6zQyOLaUz39zSU6gDObpO50piLq05ZH4tbFNtMTFhuieslR+S8X8CaVVWKE1anTzft64EjeMR3PSZWlTW1/LKdip3WuSg+1Vk2n0cGZiNqEjKpcY/KdW9A51z8xp1uiFYj/+yepyZWcWc4nE9uAberl8b+B0hYk7ail0TxlnqwIe+AOdvvnGYR1PngmooormGizToExCbywKYjwwtVrrmmORPnQTiHMNokN0dGwtW+zH7WiE02GG30aaP2tqXSXXgz9IWUkhF5N8aylGD8T5dnUkFrQkEJybhnbkuJSj/SrcoEvCApSWmD9/44+H92aIAafvYJ6xFJNrsWIxLcPa4+ucaaQEydOmKE6VtTOKCmkZODvsevideDRRZobL+ftqObpN/7AoHUgUR+r9067Cn5VoqeLdPNn2irZC8XLjdZd2A3xsE3vAsRppsFgmmqUjLBmy2EeDXogXQkR/wBGxzGUdP+akhdvV5K1YmCuCpidWmbkuKEXeGtJJhvB7/IN/zeteLaiPzlOlJuK8I/cZ8i9ao2hqj7QjNOWzmqITuF8N0VZEyT7LRzIx/uSFEUYXSeUSKmjtg9AaePjt7FaCimh2AkeYMZowZAGdV0huKw6FGOGOh4Q0rXxqtWXQbWx8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB6070.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXNIckkyQUk5aUluMnhxbjcwQkR5VC9tbDlTWTc0QmY0VTV3RHJoNHN2UXE2?=
 =?utf-8?B?ZFRBNlNXamJEQ1JEdmFKemdkbzVmbC9EbEp1SXlvZW03VFB5aGthZ1k2Q1h5?=
 =?utf-8?B?WHFCZXJWTVR5dC9pSTl2S2tkanp0bzVJUlZPUzhSODF2b1gxc3ZsKyt3WnE1?=
 =?utf-8?B?cXhIOUpWTjJ1T1hTWTF6UWg1SloycFB4RFJkMGJWWit5dnZYblVwdm5vbVpj?=
 =?utf-8?B?NERnUi9xV1FDeFEweTdaY2p2dStWTXlucTVmOFBnR1BmUDlpMTY2TGR3a1Y1?=
 =?utf-8?B?V2xOZHNKMVBNNDVtb3lmWFI1aW04cVYrNmMwbElPYzJROVQ0bHp4b2VwekZN?=
 =?utf-8?B?RU9JaW03TXZ2ZWl0K2RsY3hZSHgySUFWZzNQQnFHdTFIU25yekIxTXA4UUNh?=
 =?utf-8?B?aUdLVmg1WGJzaE1NVFpDQUkrKytyUTBDRXZ4YWo5MllXWlUxRjUvRjh6NHl1?=
 =?utf-8?B?dzhielI2aEhtcitVZllpMHRGalhFb24xR3ZKWFpwbXVXZGgxSkFaT2hUN0t5?=
 =?utf-8?B?TkplQUxyRmR5MmY1YkdpT1FRbzRVaW4rNGFQdy9sWVpJa2RFTXJJWGtCdWNr?=
 =?utf-8?B?K0dwZm1qOGdueThIU08yTnRET3hJLzBUOFE0bVhoRDhkNlFGUDhMQ3E3QVl1?=
 =?utf-8?B?WE04bkpMVFVPSzlGdTZPbXQ0YkNmNStUV2EzTVlhalR2dW9jcCtONUYwelZM?=
 =?utf-8?B?REpybEhYekFuOGZQTUx1Nk5BN0c3RkpVdlBYaVhTL2NoOVYxeTByMi84VDlx?=
 =?utf-8?B?c1ZhREhmNW4rb3hpUUR1WmRSYk5vNGJ6OHRCcjZ2V3hKOGZyRCthK2J4ZDJQ?=
 =?utf-8?B?VHp4NkZzQUxxSWl5d0NYNXM5dXRUeHc5MVlhU3kycnhmV1g4YTNQOXFKVXc4?=
 =?utf-8?B?dml4eXM2RFo2eG45U2h5QUJxL2ZXN1pBWWVYNnljV3VBdjNFcFRkVUdZKzBs?=
 =?utf-8?B?OGtrZ3E3LzFKWmZSbUFVeGthY05VZURlT2txMG8zc0IvMVZaSytLaUt3S0dV?=
 =?utf-8?B?R1pEaHdNaDAwR0VrODBlTlJWdnhvbXV0WStrWkp1WCtYOUdWSlI4QjFiZklC?=
 =?utf-8?B?ZzcwUmV3OTlRQlA3bUhzWXBqWXdLREQ1ME9lZjZwRXEwdkFTREYxenh2cEdy?=
 =?utf-8?B?V0p1UjdDTVMzY1JDM3hvdlBBYlpxYTUxM0E2M3hwdWJWSjNPQkxCaU9TdnNn?=
 =?utf-8?B?WEZBVC8yTVp3eERIbVNZcTd5NUQxY1FrSTNKR05RS0thTW8vSHlUeGNuei9N?=
 =?utf-8?B?aXYyVEdkWUJxeXIxYituak9iOEVLWHBQUUhHSk0ya2wwYkY0MFYxZWNCeFB0?=
 =?utf-8?B?YTNVVjZyL3l1QTRjNHY5MHhSRmVaK1F6VnIxTkpKbTRZWXpWd3pTYm0yTHg4?=
 =?utf-8?B?c1IxaXJNaUhUTzVxa1JzRTQrRXhTUXdVMS82alNyMzNOcktFOHA2SnA0MUdG?=
 =?utf-8?B?Ymh3VURzMVQ2dmxtV3o0MFNHL1ozZS9WN0ZzUXhaNHh0MUVDaWZnNStQV04z?=
 =?utf-8?B?cEt6UytDWG5vTXRHWHBMb0pabE1wT3FCb3lQTDhoY3AzbC9jdFlxN1JjUlAv?=
 =?utf-8?B?cG1PSEx4anR2OW15Ym9Od01sOElPakR0dkVOZGlQdDk0QUtraWxhc1c2MjE2?=
 =?utf-8?B?Z2NLdlkyTDE5WVpERWhoMHNwTThGU1pIbTdtdjQ4emtFeDUvaXc2Q014UEZB?=
 =?utf-8?B?QStNQXo5bGYrY09icm1YZzlSaWE1UnJjdXphNUIrZFZ4RDJ2eG9EN2tuYTNa?=
 =?utf-8?B?aUpEbE00UTNwMnVXUmtDeGdUNTJmUTJOQU1HaHhDWTdMS1lNZU5VT1pUY0J0?=
 =?utf-8?B?NlROUDQ1Q1BVL3E1Smo4MERKK2dMK0lqcVpVSkt4anZVMGFQd2VmRDIzOFhi?=
 =?utf-8?B?UGRFM3c1NGxVelVKMlA1NWFjbHgxV0d4Q0pKLzBnaGpkcEVWUjI2eE5scE5D?=
 =?utf-8?B?WTN1eGFRdzV2Sm1VMmxja0Q5VlFrdUd0MDR5c1p6dUZrQ1hxTTN1Si9tUkFk?=
 =?utf-8?B?ckl6S3UvdzdzR2RkeFpWaFNkTG1pUzdoelZmY0dDdEU3ZkNrbWtzVWNnRGcy?=
 =?utf-8?B?OG81WUFHYUpLcDZ2YklEZE9pWDNvME8vODBJR2dtZS81anZLT3VTSVo5NDdN?=
 =?utf-8?B?dlV5Ti84L2Y5QjhIUGgvYW1KTE1RM0JWMnpNMmswTjZzVlo0Y1d4S0pueEM5?=
 =?utf-8?B?SXA3RHlWcHBzbnovdHhCWVByb2xKM0lIdGNvQXNoM1Z6bnFEdGVyL0FvWFdp?=
 =?utf-8?B?Mm1wMUg3eHZmVXJFWkdKVDJ5RDNZMWZKNlZBMmFKNjU2WjU5YStnbEdKQXYx?=
 =?utf-8?B?YzVhMjRxdkhzZ3VHTWtVWGJxWFBveWd3RUh6RTdPcHA5bUwzUHpRajRHZEFM?=
 =?utf-8?Q?vx1F+QfU4qnm92CA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E44D58BC23B6ED4C96ADB4D22F079213@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB6070.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75396a9f-bf6c-405d-58bc-08df412751f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 01:42:04.3423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyvvoxWN/aHdGILg8B6dBN7uCs7yWRuEcwNwaE7K7ZKKrOTxnHpvWKZDMO30BoxqNbvj3wI+HbWnMZHTbpispJKwD4O6jpBH3ONvo89KWS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10043
X-purgate-ID: tlsNG-d62444/1794534126-BF262757-D9262169/10/78276251493
X-purgate-type: spam
X-purgate-size: 4710
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNCkFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyaXRlczoN
Cg0KPiBUaGlzIGlzIGEgbGlzdCBvZiBwb2ludGVycyB3aGljaCBpcyBvbmx5IGV2ZXIgcmVhZC4N
Cj4NCj4gSW4gdGhlIEFSTSBsaW5rZXIgZmlsZSwgZml4IHNvbWUgYWRqYWNlbnQgbWlzYWxpZ25t
ZW50Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9i
YWJjaHVrQGVwYW0uY29tPg0KDQo+IC0tLQ0KPiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXJAeGVucHJvamVjdC5vcmc+DQo+
IENDOiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCj4gQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+DQo+IENDOiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+DQo+IENDOiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFy
bS5jb20+DQo+IENDOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiBDQzog
T2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+DQo+IENDOiBCYXB0
aXN0ZSBMZSBEdWMgPGJhcHRpc3RlLmxlLWR1Y0B2YXRlcy50ZWNoPg0KPiBDQzogVGltb3RoeSBQ
ZWFyc29uIDx0cGVhcnNvbkByYXB0b3JlbmdpbmVlcmluZy5jb20+DQo+IC0tLQ0KPiAgeGVuL2Fy
Y2gvYXJtL3hlbi5sZHMuUyAgIHwgNiArKystLS0NCj4gIHhlbi9hcmNoL3BwYy94ZW4ubGRzLlMg
ICB8IDIgKy0NCj4gIHhlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUyB8IDIgKy0NCj4gIHhlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMgICB8IDIgKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5s
ZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gaW5kZXggNjEzNTExMzkwZmY0Li5kMWJi
NmM2MmQyMDggMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gKysrIGIv
eGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPiBAQCAtNTEsOSArNTEsMTAgQEAgU0VDVElPTlMNCj4g
IA0KPiAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4gICAgLnJvZGF0YSA6IHsNCj4gLSAgICAg
ICAgX3Nyb2RhdGEgPSAuOyAgICAgICAgICAvKiBSZWFkLW9ubHkgZGF0YSAqLw0KPiArICAgICAg
IF9zcm9kYXRhID0gLjsgICAgICAgICAgLyogUmVhZC1vbmx5IGRhdGEgKi8NCj4gIA0KPiAtICAg
ICAgICBCVUdGUkFNRVMNCj4gKyAgICAgICBCVUdGUkFNRVMNCj4gKyAgICAgICBTQ0hFRFVMRVJf
QVJSQVkNCj4gIA0KPiAgICAgICAgICooLnJvZGF0YSkNCj4gICAgICAgICAqKC5yb2RhdGEuKikN
Cj4gQEAgLTkzLDcgKzk0LDYgQEAgU0VDVElPTlMNCj4gICAgLmRhdGEgOiB7ICAgICAgICAgICAg
ICAgICAgICAvKiBEYXRhICovDQo+ICAgICAgICAgKiguZGF0YS5wYWdlX2FsaWduZWQpDQo+ICAN
Cj4gLSAgICAgICBTQ0hFRFVMRVJfQVJSQVkNCj4gICAgICAgICBIWVBGU19QQVJBTQ0KPiAgDQo+
ICAgICAgICAgKiguZGF0YSAuZGF0YS4qKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvcHBjL3hl
bi5sZHMuUyBiL3hlbi9hcmNoL3BwYy94ZW4ubGRzLlMNCj4gaW5kZXggMzcyNTZjODg2NWE5Li5j
ZGRiNzA4NTUzMDcgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3BwYy94ZW4ubGRzLlMNCj4gKysr
IGIveGVuL2FyY2gvcHBjL3hlbi5sZHMuUw0KPiBAQCAtNDgsNiArNDgsNyBAQCBTRUNUSU9OUw0K
PiAgICAgICAgICBfc3JvZGF0YSA9IC47ICAgICAgICAgIC8qIFJlYWQtb25seSBkYXRhICovDQo+
ICANCj4gICAgICAgICAgQlVHRlJBTUVTDQo+ICsgICAgICAgIFNDSEVEVUxFUl9BUlJBWQ0KPiAg
DQo+ICAgICAgICAgICooLnJvZGF0YSkNCj4gICAgICAgICAgKigucm9kYXRhLiopDQo+IEBAIC04
NCw3ICs4NSw2IEBAIFNFQ1RJT05TDQo+ICAgICAgREVDTF9TRUNUSU9OKC5kYXRhKSB7ICAgICAg
ICAgICAgICAgICAgICAvKiBEYXRhICovDQo+ICAgICAgICAgICooLmRhdGEucGFnZV9hbGlnbmVk
KQ0KPiAgDQo+IC0gICAgICAgIFNDSEVEVUxFUl9BUlJBWQ0KPiAgICAgICAgICBIWVBGU19QQVJB
TQ0KPiAgDQo+ICAgICAgICAgICooLmRhdGEgLmRhdGEuKikNCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3Jpc2N2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUw0KPiBpbmRleCBk
OTM3NWE5NjE2OTcuLjI1MGVlM2YzNmY0ZiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvcmlzY3Yv
eGVuLmxkcy5TDQo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUw0KPiBAQCAtNDMsNiAr
NDMsNyBAQCBTRUNUSU9OUw0KPiAgICAgICAgICBfc3JvZGF0YSA9IC47ICAgICAgICAgIC8qIFJl
YWQtb25seSBkYXRhICovDQo+ICANCj4gICAgICAgICAgQlVHRlJBTUVTDQo+ICsgICAgICAgIFND
SEVEVUxFUl9BUlJBWQ0KPiAgDQo+ICAgICAgICAgICooLnNyb2RhdGEpDQo+ICAgICAgICAgICoo
LnNyb2RhdGEuKikNCj4gQEAgLTkxLDcgKzkyLDYgQEAgU0VDVElPTlMNCj4gICAgICAuZGF0YSA6
IHsgICAgICAgICAgICAgICAgICAgIC8qIERhdGEgKi8NCj4gICAgICAgICAgKiguZGF0YS5wYWdl
X2FsaWduZWQpDQo+ICANCj4gLSAgICAgICAgU0NIRURVTEVSX0FSUkFZDQo+ICAgICAgICAgIEhZ
UEZTX1BBUkFNDQo+ICANCj4gICAgICAgICAgKiguc2RhdGEgLnNkYXRhLiopDQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPiBp
bmRleCA4Zjk0M2UxMWVhZDQuLjkyNTg0ODk4MDIxOSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gv
eDg2L3hlbi5sZHMuUw0KPiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+IEBAIC0xMTks
NiArMTE5LDcgQEAgU0VDVElPTlMNCj4gICAgICAgICBfX3JvX2FmdGVyX2luaXRfZW5kID0gLjsN
Cj4gIA0KPiAgICAgICAgIEJVR0ZSQU1FUw0KPiArICAgICAgIFNDSEVEVUxFUl9BUlJBWQ0KPiAg
DQo+ICAgICAgICAgKigucm9kYXRhKQ0KPiAgICAgICAgICooLnJvZGF0YS4qKQ0KPiBAQCAtMjk3
LDcgKzI5OCw2IEBAIFNFQ1RJT05TDQo+ICAgIERFQ0xfU0VDVElPTiguZGF0YS5yZWFkX21vc3Rs
eSkgew0KPiAgICAgICAgICooLmRhdGEucmVhZF9tb3N0bHkpDQo+ICANCj4gLSAgICAgICBTQ0hF
RFVMRVJfQVJSQVkNCj4gICAgICAgICBIWVBGU19QQVJBTQ0KPiAgICB9IFBIRFIodGV4dCkNCg0K
LS0gDQpXQlIsIFZvbG9keW15cg==

