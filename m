Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB006606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Q4nmhtM6
Received: from list by lists.xenproject.org with outflank-mailman.1502984.1698898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWOci-0002wH-NS; Thu, 26 Nov 2026 01:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502984.1698898; Thu, 26 Nov 2026 01:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWOci-0002w9-Iq; Thu, 26 Nov 2026 01:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1502984;
 Thu, 26 Nov 2026 01:50:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xWOch-0002pz-28
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 01:50:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWOcg-00Dx6w-Ei
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 02:50:06 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6b079039-8faa-0a2a0a5109dd-0a2a4504958a-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 02:50:06 +0100
Received: from [40.107.130.83]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6b07904d-b57f-0a2a45040019-286b8253654b-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 02:50:06 +0100
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 (2603:10a6:150:805::10) by DBAPR03MB6440.eurprd03.prod.outlook.com
 (2603:10a6:10:193::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 01:50:02 +0000
Received: from GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544]) by GV1PR03MB788477.eurprd03.prod.outlook.com
 ([fe80::c759:686b:939a:1544%4]) with mapi id 15.21.0639.012; Thu, 26 Nov 2026
 01:50:02 +0000
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
 b=RbIP0MYh67wAlVmlVPXu6e+/ufb8aFNbtI0X0qnixy1rTYf0tur+ElBmSSGsGWBQu6bmK9Ebuwtk7a+tHmwX+d+YBXIWWc1t8nQrc8qfXmntHTETwdqwzlWMQg6gUagdP09ziDBG1Ri/4mahh4woP8DP5Z1OF3oO1e+YfL+67PBqYDEJMQPTayT/+2tuVdgrSnGCv4hp8WZas81t7Gqi3e2qtEDLU9x5vWhdz6KIeUJZolZQKCt5dMPvsb4B0vae1hZlncM7n7qZDn9hRbWfLNlgFC/Syp77dMmROZqhWpriZqMvlQM5VF/J4gruKeCqhhBbFzcUi6KcGnt0HGYqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDjd4wNmgvxLG+iD9znl8jXjCP8RrUuJNF/Qo9gRu58=;
 b=khlTf/9p54myIbATI2F86SeCzKIpQ0uZMID//IuxyjFjn0m0/24f6V3f65itlEs3wOZmLnVu99SDh3PAmBXHBm6Qu2v4hvT6cGSHGt7SkRHxzTtLUWEloaK7yosaKoBIRWQNQfr06FpKvrfSBus6bX28/J+XHb/+7j1wblv04bVdPKNSUz+vTOZ/eJY2W06Gn0yLwC6+DRuyEc2k8YhfUZItI8oKemGBeZSbtN2xTw8oeKaKRhH69UZQgKduFX406gbksZEalEYY7ka5YlGEXdkz1B48ihWdXikEdIyC0SppUbRZ9VIfp4xl/DiBT+OE82zSlQllv69I+eFCnkkbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDjd4wNmgvxLG+iD9znl8jXjCP8RrUuJNF/Qo9gRu58=;
 b=Q4nmhtM6ADhcEyDjOjiwZK/gkzJ+hqQArJ9wfvlTErdBF5F5LHwDv3rymoAjsb1xy+zD8LtEAxENplHzEqXDqLCjmfk2x/Ssu0n4VfAsjuNYM1f6fhNS3Pl/nlaVsUgvcWPAkBrwWr8yWiE2uoR+ez5Vd2/an5tP5jpAQ+msjLaSFY5FoG2L/KpTXIAchkPH72vE5Gct36fpoQ28ReYbItcYpagRPedTqwTpHWlqE7l162rCn+AhJ4sc/8HVYZRyuBw5CIJyupJKvRJoOXATKe89hTS6Z//zwT7V3AaTeDLRiuU42AJkXH9c3G2duHZGeEcl7129sFJq0sysKJ8P8Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jens
 Wiklander <jenswi@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 6/6] xen/arm: ffa: Deliver VM-to-VM notifications
 locally
Thread-Topic: [PATCH v3 6/6] xen/arm: ffa: Deliver VM-to-VM notifications
 locally
Thread-Index: AQHdO7KoPFvS+zi8yEulsuVRHLReJLdAGX8A
Date: Thu, 26 Nov 2026 01:50:02 +0000
Message-ID: <87ld6gicon.fsf@epam.com>
References: <cover.1788268510.git.bertrand.marquis@arm.com>
	<24033eeb87446cda8c91f27a453317417328fd5f.1788268510.git.bertrand.marquis@arm.com>
In-Reply-To:
 <24033eeb87446cda8c91f27a453317417328fd5f.1788268510.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.4; emacs 31.1
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB788477:EE_|DBAPR03MB6440:EE_
x-ms-office365-filtering-correlation-id: 91ac60b3-d794-4779-9dae-08df4b5f9631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|42112799006|10067099003|56012099006|4143699003|11063799006|261102123227099003|261022105027099003|261026140227099003|261021123027099003|261021121427099003|261028144727099003|38070700021|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 dbzVU8N2Ri/oE2dngQMX+mpTaRW3Gm4cxYiR0nYXqgdthF8bk3IATT82x2CZ65kz2Yid1M6wqeCrmf97scpMoLYuAumxd1s7Scn0wB59fkDw7yE1wGm6RfTjxLBjBoeEEhIE+Av2jxHhYzs2sFCOUh5/kqpTdphznz7n4vGwDrW3wXXURH0bnjoEf7g6ndyrRpSybiDUcUbYs6XWrbsEQsV/KouM4accyziDVrbAbE2pBbkSH4FYC7pUaJbSnYPwNlOG1Uvi3+GHTJxr2/TA9BiVEeS1TuDuFT358JT6d7n86qlnjxOWv3mJBxcaK+AEL/Rr/ATGttMQUC3Qd2ieh2YJ2lQRAd4wIi3CH1WN72jGHlb9P6G/Ka30CuSnZ043dNaDe2ob8Olf7Lp4EzNSMOHSuc5yUNwFEPPVxR6PVZgXvi5fkLpe5zdI0CDNOy3KnLnpp4BCiHsiGP4CIGkjXB8TsdEpWnWfKuf9AuM5/B7nzSmrgJ915KxERyV6Vdbh9Z55EuyBEiBqebrLoNHlW5yjpk11f7C5cp1YqsmLXvS99INvJ2w0GTOPPAJNN4w9g9om8nNY1mm49aZZwfcp5HUzEU7XEcKInsUSX4OTdAwZRY7FrpXA4i/nlPWC0XefRpg8uD6KS3gr5kNqY2eAaCpab2O7GaUJpKicDIrcrHd2FsvN35H62lt4tExAGwQyCPQnKKNs+liFNg7rHj4COLkKAD6LLFavKO8898oX70s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB788477.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(42112799006)(10067099003)(56012099006)(4143699003)(11063799006)(261102123227099003)(261022105027099003)(261026140227099003)(261021123027099003)(261021121427099003)(261028144727099003)(38070700021)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUM4VXQ2RUlyU2N0QnNCNjdqRVFBNEZpaWlObWZLbkJCK1Z1RTdFQ25BM0k3?=
 =?utf-8?B?RUJVKzBweWErMHBMQk5FNWtlQzhQa2txVmlwN0pXeG85eFRXNmZoRkxnazBM?=
 =?utf-8?B?VGhBdXJKTFdicEJIWWVpU2JpOGc4TGRyYVF4bVJTdk5zNnBNR2Z1QXRxZ2wx?=
 =?utf-8?B?R2dhazBmcWNZVnYwYzQ4ODdvWXp1bDdBbWk5dFFtbTNEc25QZmltUzVzUTVF?=
 =?utf-8?B?OFZYQk5naGdOaGJtUTZ2TlNMTE1FUnBNQitQZ0luQmN5bHc5dkRxR3d4cEFl?=
 =?utf-8?B?UFp2L0w1WjBKaUNxSm1aZ0t1d0JNQ21EVjRFL1hPaVNvWjI3VlZEQ0ZmWllC?=
 =?utf-8?B?OGlDeHJ1Vmo4ZmVtVk1TSDFYWDUwVERqTWZwVHFrVEpRYVBmMnBYdVVTZW9C?=
 =?utf-8?B?VDNhSm1nQ0Rsd1ArT1BFaUZJQ05TVlk4THdpc0N1VU5MK0VIdnNUWUdHQXBR?=
 =?utf-8?B?cStYNm9OdmNVWHhrd1pWNlphMWxCSHBUT1Z1OTBQd04rMXJRcHVEYnc2MGlG?=
 =?utf-8?B?UmRLRGZIYVc0NGZYcjhOYXBMWklOMnZIZFZKSUxuOWg4Z3FjNWRCbjYyYkx2?=
 =?utf-8?B?eEhKb3V2K1ZpWWFhclpUUXpGNHpKVFVITGo1bmEzQ1B6OXJ5cmVrVVRWQzA0?=
 =?utf-8?B?c1JsNzQyVUR4d0hjaExaVHdDaWlrd0trRnVQNFpyS09XVHRmbCtTc2l4WWJu?=
 =?utf-8?B?cHZhcjJyTnNGdjUrTHZmRlZ3dkhwMDNyaEZvMVRDMHFaT01vTXJwUkdKcFJ0?=
 =?utf-8?B?M0FGUys0eWFFcU9LOTdDcElhTGNVRU1ENHZMditUdldsMSs1OHZEMW1WQWxM?=
 =?utf-8?B?ZFlTZnZ1NTBuWnA5NFVRQysvMXN3S3JqU3hWeXZydWJtZHl0aHlhVW4rSFRl?=
 =?utf-8?B?QzlIZmNiSjJuSEtrK25oSE05VTB2WURZelRtdDFwZk9kK0tTQ2x3QjVHNUdx?=
 =?utf-8?B?NTd0UFlBVzl3Z01FRGRHbldPZUhyVjJnN2l2Nm5ILzRKYXQ5OHUrbHk2alJZ?=
 =?utf-8?B?MUpPc1d2bGhZOGVuU0pFbTg5QU9sT1Rja0M3ZFY0MVQybjd4NUFQNk5sNldQ?=
 =?utf-8?B?TjZXcm5HQ2pDNDc5THRxRUVhV0UveTdmdWR1VTlGdHhaelBEdmgvYzhxREo0?=
 =?utf-8?B?dTVMOFIvdVhpU1lVNG83dFdZTHpSRlRjWjhiTUF6eU9xcDJHeTFlSDlhaldZ?=
 =?utf-8?B?dXkyald4dnNPbDgyam5tNmNTdWNDdmU0M3AydVJOS0hhQUJQdXRSajdKdmJZ?=
 =?utf-8?B?UnB0WEdkTFR3MGE2YXNZY0ZwemJKaE1ONG1MSnRjNExjeUtGeUVhcWtTci9U?=
 =?utf-8?B?WmxRMUdXbTd6WmpjaG14ZXIzR0pNbTFPeER2TFZZSUw5RTZQVTF0QVQyNTNa?=
 =?utf-8?B?RlVwcU1YcUVoUWp2ejhWZm12dDQwMkt5RDl0S3FuM3RybWVGWm41T3E5NFZj?=
 =?utf-8?B?bHdOZjB0blUzaEw4SFh0OTZCblFiUVRWcW00RFRMTHlSQXBLbmNFRTFSTVFm?=
 =?utf-8?B?TUNENGFscEFJNG1tcDZWSlUvKzFtYjhVVTU4WmhoMTBoR3pQNG5XQUV0S2Jt?=
 =?utf-8?B?UzJrWGZLT29VMDRXVGtveFJwNXJ6aDNiMnRWWDdvMEdsellBYWtnbDJRMm5S?=
 =?utf-8?B?RFZyM2czNjBOVHdNSXVtaS9hbjNNZGJLZkFONWxhOUlmZ0Nacy9Qck1xbHgv?=
 =?utf-8?B?QVRGQi9zSlVKdHRTc3pVV25peFVMTXd5bzlHRElkQlBDMHhqc0dneDUzZEFx?=
 =?utf-8?B?Q2VPK3JaR3FaYWVUYUhZNVBvOVRZYkVuT2ppNU9GUGhZM2ZKZ1Z6OER0WGxO?=
 =?utf-8?B?czM4czdLTFJpUlJNQ0lYZ3RiLzdsd0lTSGJUK0pWcHdibXc4Yzc1WUF4OER6?=
 =?utf-8?B?R2tsMHBZanUxL2dLNVNWZ3B4VFR3MUZOQjdleEdzaVZmWGpYTmFGcGgvSWhX?=
 =?utf-8?B?K3lQNzVhNDU0Ynd0U3NweklmZjZNcFRVVC80RWxlYXdjclUxOURubmFldGVM?=
 =?utf-8?B?TjZHUW96clp5VUIzbmZkR3RoamhWQjNpaEFsNnpETWJFTDlQSHlhdWhrTmdn?=
 =?utf-8?B?MDh5SzdLZEs2a2tYbFFiQmJabVN2UTgyTDArNmhCbjRQNWxqdXNFbmJYb01a?=
 =?utf-8?B?VURjZi9kTUVmVzQxQUNmSW5GcVFERnozM0JHQTZNTFZITUdsWGpYU0pPa1o0?=
 =?utf-8?B?RUxwdGNPS3JUSzloeVhGdTdPS0lTZExjM2xQeEtyZ0o0bDJidkxkaENIcGd1?=
 =?utf-8?B?azd2TkV1NFJoWXpZQzhhM0FoU1RPSFlMUStCU1pOTE0xWTNVdDlTOVlzdzVW?=
 =?utf-8?B?Nk9xRFh0eldnWW9TdTdtL0IxbC9BNUxFZU9icVU0RXdSWlJ6NWlSQWhwUWN0?=
 =?utf-8?Q?mtZDlkoddc7YdwJA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB788477.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ac60b3-d794-4779-9dae-08df4b5f9631
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 01:50:02.3277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q4s2qtoufDAjMhsqGIPF5o9ObWpY/zVNojr/wH5SNA3N2evvHNh4QxFyGGHdo0A2EIcf9lCZtxcXxmWwmm14iE1wZ3DkPaMc+r1FqndN+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6440
X-purgate-ID: tlsNG-ebf023/1795657806-C1ED6B50-0F0A385F/0/0
X-purgate-type: clean
X-purgate-size: 2276
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQmVydHJhbmQsDQoNCkJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNv
bT4gd3JpdGVzOg0KDQo+IFZNIG5vdGlmaWNhdGlvbiBiaW5kaW5nIGFuZCBwZW5kaW5nIHRyYWNr
aW5nIGV4aXN0IGZvciBub24tc2VjdXJlDQo+IGVuZHBvaW50cywgYnV0IEZGQV9OT1RJRklDQVRJ
T05fU0VUIHN0aWxsIG9ubHkgZm9yd2FyZHMgc2VjdXJlDQo+IGRlc3RpbmF0aW9ucyB0byB0aGUg
U1BNQy4gTm9uLXNlY3VyZSBWTXMgdGhlcmVmb3JlIGNhbm5vdCByZWNlaXZlDQo+IG5vdGlmaWNh
dGlvbnMgZnJvbSBvdGhlciBWTXMuIExvY2FsIE5QSSBkZWxpdmVyeSBhbHNvIG5lZWRzIGV4cGxp
Y2l0DQo+IHJlLWFybSB0cmFja2luZyBzbyByZXBlYXRlZCByYWlzZXMgYXJlIG5vdCBsb3N0IHdo
aWxlIHRoZSBpbnRlcnJ1cHQgaXMNCj4gYWxyZWFkeSBwZW5kaW5nLg0KPg0KPiBBZGQgYSBsb2Nh
bCBWTSBub3RpZmljYXRpb24gZGVsaXZlcnkgcGF0aCBmb3Igbm9uLXNlY3VyZSBkZXN0aW5hdGlv
bnMuDQo+IG5vdGlmaWNhdGlvbl9zZXRfdm0oKSByZXNvbHZlcyB0aGUgZGVzdGluYXRpb24gZW5k
cG9pbnQsIHZlcmlmaWVzIHRoYXQNCj4gZXZlcnkgcmVxdWVzdGVkIGJpdCBpcyBib3VuZCB0byB0
aGUgc2VuZGVyLCBzZXRzIHRoZSByZWNlaXZlcidzDQo+IHZtX3BlbmRpbmcgYml0bWFwIHVuZGVy
IG5vdGlmX2xvY2ssIGFuZCByYWlzZXMgYW4gTlBJIG9ubHkgd2hlbiBsb2NhbA0KPiBwZW5kaW5n
IHN0YXRlIGlzIG5vdCBhbHJlYWR5IGFybWVkLg0KPg0KPiBUcmFjayB3aGV0aGVyIGEgbG9jYWwg
TlBJIGlzIGFscmVhZHkgYXJtZWQgd2l0aCBub3RpZl9pcnFfcmFpc2VkLA0KPiBjbGVhciB0aGF0
IHN0YXRlIG9uY2UgYm90aCBWTSBhbmQgaHlwZXJ2aXNvciBwZW5kaW5nIGJpdG1hcHMgYXJlDQo+
IGRyYWluZWQsIGFuZCBrZWVwIG5vdGlmX2xvY2sgaGVsZCBhY3Jvc3MgdGhlIFZNIG5vdGlmaWNh
dGlvbiBpbmplY3Rpb24NCj4gYXR0ZW1wdC4gSWYgbm8gZGVzdGluYXRpb24gdkNQVSBpcyBvbmxp
bmUsIGxlYXZlIHRoZSBwZW5kaW5nIGJpdHMgc2V0DQo+IGFuZCBrZWVwIG5vdGlmX2lycV9yYWlz
ZWQgY2xlYXIgc28gZGVsaXZlcnkgY2FuIGJlIHJldHJpZWQgbGF0ZXIuDQo+IEFsc28gZXhwb3Nl
IGZpcm13YXJlIG5vdGlmaWNhdGlvbiBhdmFpbGFiaWxpdHkgc28gRkZBX0ZFQVRVUkVTIG9ubHkN
Cj4gYWR2ZXJ0aXNlcyBub3RpZmljYXRpb24gc3VwcG9ydCB3aGVuIGl0IGlzIGFjdHVhbGx5IHBy
b3ZpZGVkIGJ5IHRoZQ0KPiBmaXJtd2FyZSBvciBieSBDT05GSUdfRkZBX1ZNX1RPX1ZNLg0KPg0K
PiBGdW5jdGlvbmFsIGltcGFjdDogd2hlbiBDT05GSUdfRkZBX1ZNX1RPX1ZNIGlzIGVuYWJsZWQs
IG5vbi1zZWN1cmUNCj4gRkZBX05PVElGSUNBVElPTl9TRVQgZGVsaXZlcnMgVk0tdG8tVk0gbm90
aWZpY2F0aW9ucyBsb2NhbGx5IGFuZCBrZWVwcw0KPiBOUEkgZGVsaXZlcnkgcmVsaWFibGUgYWNy
b3NzIHJlcGVhdGVkIHJhaXNlcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVp
cyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJh
YmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPg0KDQpbLi4uXQ0KDQotLSANCldCUiwg
Vm9sb2R5bXly

