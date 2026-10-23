Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78015606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ApcVoBL9
Received: from list by lists.xenproject.org with outflank-mailman.1459143.1671212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKD9Z-0006GV-V4; Fri, 23 Oct 2026 11:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459143.1671212; Fri, 23 Oct 2026 11:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKD9Z-0006GO-RY; Fri, 23 Oct 2026 11:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1459143;
 Fri, 23 Oct 2026 11:09:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xKD9Y-0006GI-OA
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 11:09:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKD9Y-00CRBX-4p
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:09:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6adb4073-2eae-0a2a0a5409dd-0a2a450cb4a4-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 13:09:40 +0200
Received: from [52.101.66.135]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Sergiy_Kibrik@epam.com>)
 id 6adb4073-f479-0a2a450c0019-346542873e44-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 13:09:40 +0200
Received: from AM0PR03MB6050.eurprd03.prod.outlook.com (2603:10a6:208:15d::10)
 by DU4PR03MB11142.eurprd03.prod.outlook.com (2603:10a6:10:5f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:09:35 +0000
Received: from AM0PR03MB6050.eurprd03.prod.outlook.com
 ([fe80::657b:d5bb:c261:f9d]) by AM0PR03MB6050.eurprd03.prod.outlook.com
 ([fe80::657b:d5bb:c261:f9d%4]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 11:09:34 +0000
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
 b=APyohjcKqvvADs9DGVC4QdDf6m8ImmZFG/yUqb1kU521IAkDCna6W75mP5Wi9sqIwp8aQiekFf4qcQIDC6ytEcF1kq+Z8CnNfWDOYSbel4E+SXJ5KlZ94STdgyiWppOw4mtnPBN/dPv9cRGwEWH5vDUat4y5lMOmUCZU8B+mR/+OxC03+vc/zzC+52V1b2Mt85l48oHcjHu/cNavr4w6BcSwlFeb5540H9z76xRQ09Z4nGkiQVUx+p13QcD375vyu+bhcdZtHORq3sjn/SN2f2qfXms1nOYC4cJ0Pv+asjO2vTZ1SzBin1Ka4vY2ov3zgReD1z5kuOVulyunIoqhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x1wOfUxu+7NF8wJ9lY1NYo9Inzl+n5Rp4VMchpDEsY=;
 b=NsFKtVBJj0RImqEJiIzospBAwLhDi50ZfgeAkoiLR8zkZie9+Duy6+Iy+ZAGFrGUq4e3Ywmbh6qE4YzJstwCM2XZQ3UW8aDlOVzkVs4UPT9EmIzOeQdkyB1AgGJBwMLY1Y91t+oAV6Oj+OB+TXMzFpU0hInZ+BiSM354Du9ZTcwv8NZHUHhodEpegT//NSuize343RZiMGVJj5w9o1CtTyYeDvZsa/i1tzwT8x9Fm0uorpxeeAIFUwUgE4CbxyyPMHDRv/3TqliVPtA9sMrSkUk6g0AicRf9NzwzlGpbS8TCGwArAIs/oQSf5CrP3Rx7uq2A7Hke7RhO5kSRJWRmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x1wOfUxu+7NF8wJ9lY1NYo9Inzl+n5Rp4VMchpDEsY=;
 b=ApcVoBL9ve6gl5wHzF94u8Pe3J5mxa6lu+XjYKr9m4tk7Mx9ZMQXXxrMSf2TigxTRKcJOGFnvOmTAV3fLKD9ulMgIXcjgc3zNFD70mjD6JWGQuj6bxqFtg5e8i6UYzA0pbFBU0GHjailevD6l9P1zcdTirTGsNtBRqPGSvX/TR9GP072EbUHXSuMOMdkZvDK7QrnOEikV0Q2qGm+dLTvhSPOl/9ZLDCim836/wAg0fLZ4zRlhtX5WYesZ1gXv1QTn5Ju/4mxHvgkOis41pm2s5XMrSZQFKviurl2zS5Dxri9VtcVd/J9YA/Ccf1UFMT8q3eZhSh4dH2Ncz3oyPNmMg==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5] common: dom0less-bindings: introduce XSM labels
Thread-Topic: [PATCH v5] common: dom0less-bindings: introduce XSM labels
Thread-Index: AQHdYt78vs0mWAZx8Uyiwl8OuJrbTw==
Date: Fri, 23 Oct 2026 11:09:34 +0000
Message-ID: <20261023110933.2325318-1-Sergiy_Kibrik@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB6050:EE_|DU4PR03MB11142:EE_
x-ms-office365-filtering-correlation-id: c5a75acf-6475-4a86-ceb9-08df30f61eb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261021121427099003|6133799003|18002099003|10067099003|261021135927099003|11063799006|261009223027099003|261022105027099003|56012099006|261022075727099003|38070700021;
x-microsoft-antispam-message-info:
 ljx4nsfRYorwNECGY8BJgzurZ6IYnOrlliSkct3i/cfGxjOUVMQDSY7ZIXx5nnw9/4qpGGxSsRBpvCoEtX6u6aFl/W52/Te1PFCAW0Jub1onRWRQ8XgkunyLb+mzv+QCh3uoHmrk4HhLMfyrsmFT1e6bsy4ECdzDQZj7uNl+tGtXvfZuoa2KoxTBIK+jgPBkCjCS4cyNUg9N9cFtly4NXFGHLDnwHF0WLix4q+Ku6cElbnub6sDXGVJ4kP0qbxnyJTfT4W+pjQwdZ+EiV9OdHBfzlGiFwJwYhf82ke3TU1Zk0Rm7HMY2uT1JsqPACAiuHplErYATdTI3qAyvHZPx1Alt/wlwBWd97OmPddmFdrEv6ZflSObEhywVjlmGOMQ+CdaqLAwLIrqTfjUXst6GSMrBLADWJVYzatVx8jl7kcWVITep2p9C67L6ASW7oMjDDDcGgXLMe9xbExLZXL10sKGqKM62bXStys50v/DRp85c3YFCxy7Lg6dXRLGnvkuc1fwhaba/1XdBA5UHcq+nOgpAWbgHH2/Ux5fippbzPpoGmcjDvi9+ZAxvMsbhLi4O39sdOqpNYJVQ/M6GJtoXZUuHSmgHXW6iQkXq2hrjgatMh85/POpqM0j/FG2SarC0Hg1Gn2DmPHbbicI0PBpiipbnHZASRdsEte3VtYGKJTbMqWgQnsjaFdH1HYUrRD0jY9WXzA2OFwKSZgB3nuHDeevbtr3AiDfJckfAoxOiFdM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6050.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(6133799003)(18002099003)(10067099003)(261021135927099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXVWSTd5Rm1rOW45UTRyZ21WemJoaHlZR1pNUWs1aUt3djRaUGRNUWFFcWZI?=
 =?utf-8?B?UjNRYUMvMVFZVEZiL096OXZVUWt2encybEt2L3J3MWZaeXhodVhPQWlqenFI?=
 =?utf-8?B?WHB2cWx4ME81Y3B4L21OLyt5V1NySGlqdjZqT2VqNndSTC9JK3pEb3ZHYmhK?=
 =?utf-8?B?S3c5RWFscTNwa3FXcFdwbWJWUjQwZWxUS3V4NkFNejJqTGdEOVF0ajV1Y2V6?=
 =?utf-8?B?dnRHQktxWDdyM3IzWW5weFBDYytjR2QxcUNJMzZKUXZRS3E3UGNmS1VDK0dl?=
 =?utf-8?B?TDRUTnFNWnNMOUtYQlRQeU51NHBpWEI3Q21pOXV3emJTUWh1Z1AwM1ZJWVdt?=
 =?utf-8?B?b3BrOERUOFJ6M3EyamZiNmpYdjFBcEFONHRkL2dMYWZnNTltdGZ5ckV5NWJT?=
 =?utf-8?B?Mk1wQjRUWEhaSDY3cGxqck9PSkZyK0NwcGlGYVV5YkttSmNHY3RlOUpQMXlS?=
 =?utf-8?B?b2JnZjlaaDRycTFORVhuczBNNWNQdTluNTFnODQwK0p6QzdKM2lMTk5vckY2?=
 =?utf-8?B?eVVmL3Bjei9RL21LMklqTVQ2SEZYQU1lUllFMmZzK1Z3Q1pJMWVueUtkMEdh?=
 =?utf-8?B?dmlHVS9iVXB2TGFUQTN2RFlTcDlKTi8vS2JGTVVEc1d2QnB0MlRtODBUQzVx?=
 =?utf-8?B?a3AyaGxXSm5hR1ZtRmdIZzFTdmZMamcwOVFMM1duTGtOeG05RkpyVnFUNXAw?=
 =?utf-8?B?K2RuVmppamZjc044aTRBNTNtV25FaDY5eFVQV1RpQnJiOTVLOVVTYWhXbmVN?=
 =?utf-8?B?NWdJaWNkQ3p6Rzk0UXBnazRrWnNzUXZlNWZDOTZGMXY0bGFKMmc4MFhMK3JU?=
 =?utf-8?B?VnRmOVJuWkJybWpuVDA2bEl0dkRORXhmTkk2ZGxJYkN6NUN4Sm12TWFkaG5t?=
 =?utf-8?B?K1NwOStEU0xGakJLdE9YZWZIZkwwWEV0VG9nWW1tV1U5dit0TVhVR1VtV3Jn?=
 =?utf-8?B?MERmMU9URGtwZUVtUzlxYXlNOUk5VUgzb2EyZDkxc2MzSm1PSEk1RGdlSlVZ?=
 =?utf-8?B?T1o1L3pUWkUyeFdvMkxKeHIzMEliREFjQ2dwaUw0QVVzRjhWUlNTRHRoalZp?=
 =?utf-8?B?dVYrOG5iTnlUTkNrcXdjM05uakQwR3p1VDJ4MFg0VVQ5WkJkeXhTRVhFcXdz?=
 =?utf-8?B?cTlpRXhqekJBTE9DRC8zZ00vVElGZ1EwQXE3R3FyOEhaQStKSXdCRnA0UXhB?=
 =?utf-8?B?KytCZ0xZY1czV3pmSjNhZGh1RFVjTG9iaTc0K0ZDV1M0aExaSTJ3SlJ1andq?=
 =?utf-8?B?MnYwaytMYy94a3BlLzBxc3lXSmxEN3k1S0RhOXJVaHhsdi9Xa29sRGF3REpY?=
 =?utf-8?B?SWFiWjluZi9lTWpYYzdSbzhlUmlRWFg3UFE5TzVRUUg4alExcFdQQXEzOWpw?=
 =?utf-8?B?WUl5SnUwRzYxWFEwNlo5aEE1SlM4MERjNit0WWljaWc4VnIxQjMvdVhjMFA0?=
 =?utf-8?B?bDZFRFhERmFPSzl5cXI3TWduR1NyQUhIaGVzNHFzTkp4eE9xNUV3NXVYZDkz?=
 =?utf-8?B?RUlDdkFXcUN2aGZMY0dEdWpwNlBmdUJSK2FzMk9jU252c3oxb1pkSnVEYTVn?=
 =?utf-8?B?bHNYa3VjYnlTUEt3T2V5Y00wWjVqbDNaem5icjFVM254SjhBUEtHRmN0c3FJ?=
 =?utf-8?B?WnhoOHFPc2kwQ3NzbGVNdGhTcGsyYjkvWG9yWTdGN0ZJWjRWbVZrR1JYb1Rp?=
 =?utf-8?B?Q24wbC9Qa1F6RE1xUUl3M2poSVlEVmZSWGtPQ3cxdGluYmhlMEpRT0JBZVc0?=
 =?utf-8?B?VU5FQVVVSEYvY3NvY2wxVS9TbTJhOTZaclZWVjJ5ZUhtaGhuSVJpZjFWVjNa?=
 =?utf-8?B?dEVQNzRIa1I5ZytWVy9SNDlNK29rSllsVlRacW9DanlpTys3SVlRUDV2M2tj?=
 =?utf-8?B?akJqMzk0RXBzaXhWSDJKOUNHdVlnKzBrcVplVEdZZUNzT3RnUXhrYjliaXU5?=
 =?utf-8?B?ZmYzNGFzU1JxMUtRQW5GT1BIVFY3UkttQUJPekJIV3lmV016MjhuaDhlYVFv?=
 =?utf-8?B?WUFZNXF2YldlMmNrc2E2Y2JwOHNwU3JlODYzU2F0NlBEUmhlc0NaZnBJdS9O?=
 =?utf-8?B?c2wzT1dIVU9KRmlKQjZaNGdtYnBpZVM1dGdacG1OU0Fmdk1UdDVlZGlnZ0xO?=
 =?utf-8?B?elJWazhBd1hXM254VHl4OVYyUXByYzRRM0piRU1GQkVpOXhBbWZoT0Z2bWFy?=
 =?utf-8?B?aEM0ellTNExmSHpUTk9JMkFaR3N3S2gxRXhRWU9icWRkazgyRld3b2ZjZTgr?=
 =?utf-8?B?SndiT3lWc3JEcHBaMHhhUnkyZExqdWJQVUQyUlRvMXZLMzhCTDN6ZW5OMzhX?=
 =?utf-8?B?bFIxOEVsMCtZSEpSaExZSHNxbGlDYm5xR3ZBY09nQUVodFBhZXFzYnliYkJi?=
 =?utf-8?Q?4W4+mzuuYlef2Szc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6050.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a75acf-6475-4a86-ceb9-08df30f61eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 11:09:34.5145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kn4TyVZLuk6MbNT1LraWB6/RbFh8mi4ALFSo9NehbO63bgVDOOrbgEJ+zcv2GgyFlxFE2LCZr8NZwXiYcB1bZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB11142
X-purgate-ID: tlsNG-d25034/1792753780-5113AA5B-A5F387CF/10/78276251493
X-purgate-type: spam
X-purgate-size: 8064
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkICJzZWNsYWJlbCIgcHJvcGVydHkgdG8gYmUgYWJsZSB0byBzcGVjaWZ5IHNlY3VyaXR5IGxh
YmVsIGZvciBhIGRvbWFpbg0Kd2hlbiBYU00gRmxhc2sgaXMgZW5hYmxlZCwgc2ltaWxhciB0byB4
bCBjb25maWd1cmF0aW9uIGZpbGVzLg0KDQpDdXJyZW50bHkgZ3Vlc3QgZG9tYWluIGNhbid0IGJl
IGNyZWF0ZWQgYnkgWGVuIGluIGRvbTBsZXNzIGNvbmZpZ3VyYXRpb24gd2hlbg0KRmxhc2sgaXMg
ZW5hYmxlZCwgYXMgZG9tYWluIGlzIGFzc2lnbmVkICJzeXN0ZW1fdTpzeXN0ZW1fcjp1bmxhYmVs
ZWRfdCIgbGFiZWwNCmJ5IGRlZmF1bHQsIHdoaWNoIEZsYXNrIGRlbmllcyB0byBjcmVhdGUgYWNj
b3JkaW5nIHRvIGN1cnJlbnQgcG9saWN5Lg0KDQpCZWNhdXNlIGNvZGUgZnJvbSBvdXRzaWRlIG9m
IGZsYXNrIGNhbid0IGRpcmVjdGx5IGV4ZWN1dGUgaXRzIGludGVybmFsIEFQSQ0KYSBuZXcgWFNN
IGhvb2sgbG9va3VwX3NpZCgpIGludHJvZHVjZWQgYXMgcGFydCBvZiBYU00gQVBJIGV4cG9zZWQN
CnRvIHJlc3Qgb2YgWGVuLg0KDQpTaWduZWQtb2ZmLWJ5OiBTZXJnaXkgS2licmlrIDxTZXJnaXlf
S2licmlrQGVwYW0uY29tPg0KUmV2aWV3ZWQtYnk6IEFsZWphbmRybyBWYWxsZWpvIDxhbGVqYW5k
cm8uZ2FyY2lhdmFsbGVqb0BhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWlj
aGFsLm9yemVsQGFtZC5jb20+DQotLS0NCkNDOiBEYW5pZWwgUC4gU21pdGggPGRwc21pdGhAYXBl
cnR1c3NvbHV0aW9ucy5jb20+DQpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0NCmNoYW5n
ZXMgaW4gdjU6DQogLSBwcmludCBlcnJvciBjb2RlIGluIHBhbmljIG1lc3NhZ2UNCiAtIHJldHVy
biAtRU9QTk9UU1VQUCBpbnN0ZWFkIG9mIC1FUEVSTSBpbiB4c21fbG9va3VwX3NpZCgpIHN0dWIg
ZnVuY3Rpb24NCiAtIGFkZHJlc3Mgb3RoZXIgcmV2aWV3IGNvbW1lbnRzICYgYWRkIHRhZ3MNCmNo
YW5nZXMgaW4gdjQ6DQogLSBpbnRyb2R1Y2UgWFNNIGhvb2sgYGxvb2t1cF9zaWRgDQogLSBhdCBT
SUQgbG9va3VwIHJldHVybiBlcnJvciBpZiBzZWN1cml0eSBzZXJ2ZXIgbm90IGluaXRpYWxpemVk
DQogLSBkb2N1bWVudCBwYW5pYyBpZiBEVFMgcHJvcGVydHkgaXMgdXNlZCBhbmQgRkxBU0sgZGlz
YWJsZWQNCiAtIHBlciBNaWNoYWwncyByZXF1ZXN0IHBhbmljIGlmIEZMQVNLIGRpc2FibGVkIGlz
IGxlZnQgdW5jaGFuZ2VkDQotLS0NCiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rpbmcu
dHh0ICAgICAgfCAgOCArKysrKysrKw0KIHhlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3Mt
YmluZGluZ3MuYyB8IDEyICsrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oICAg
ICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrDQogeGVuL2luY2x1ZGUveHNtL2hvb2tzLmgg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKysNCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgOCArKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5n
LnR4dCBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCmluZGV4IDFkZmRm
ZjBlNGYuLjdlZGNlOTY0MmUgMTAwNjQ0DQotLS0gYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVl
L2Jvb3RpbmcudHh0DQorKysgYi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0
DQpAQCAtMzQ4LDYgKzM0OCwxMiBAQCB3aXRoIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoNCiAg
ICAgbm90IHBhc3NlZC4gVGhpcyBjb25maWd1cmF0aW9uIHJlcXVpcmVzIHN0YXRpYyBhbGxvY2F0
aW9uICh4ZW4sc3RhdGljLW1lbSkNCiAgICAgYW5kIGRpcmVjdCBtYXBwaW5nIChkaXJlY3QtbWFw
KS4NCiANCistIHNlY2xhYmVsDQorDQorICAgIEEgc3RyaW5nIHByb3BlcnR5IHNwZWNpZnlpbmcg
YW4gWFNNIHNlY3VyaXR5IGxhYmVsIHRvIHRoaXMgZG9tYWluLiBEb21haW5zDQorICAgIHdpbGwg
YmUgY2xhc3NpZmllZCAidW5sYWJlbGVkIiBpZiB0aGlzIHByb3BlcnR5IGlzIG5vdCBzcGVjaWZp
ZWQuDQorICAgIE5vdGU6IGJvb3Qgd2lsbCBmYWlsIGlmIHRoaXMgcHJvcGVydHkgaXMgcHJlc2Vu
dCBidXQgRkxBU0sgaXMgZGlzYWJsZWQuDQorDQogVW5kZXIgdGhlICJ4ZW4sZG9tYWluIiBjb21w
YXRpYmxlIG5vZGUsIG9uZSBvciBtb3JlIHN1Yi1ub2RlcyBhcmUgcHJlc2VudA0KIGZvciB0aGUg
RG9tVSBrZXJuZWwgYW5kIHJhbWRpc2suDQogDQpAQCAtNDI1LDYgKzQzMSw3IEBAIGNob3NlbiB7
DQogICAgICAgICBtZW1vcnkgPSA8MCAxMzEwNzI+Ow0KICAgICAgICAgY3B1cyA9IDwyPjsNCiAg
ICAgICAgIHZwbDAxMTsNCisgICAgICAgIHNlY2xhYmVsID0gInN5c3RlbV91OnN5c3RlbV9yOmRv
bVVfdCI7DQogDQogICAgICAgICB2Y3B1MCB7DQogICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4
ZW4sdmNwdSI7DQpAQCAtNDU2LDYgKzQ2Myw3IEBAIGNob3NlbiB7DQogICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwweDE+Ow0KICAgICAgICAgbWVtb3J5ID0gPDAgNjU1MzY+Ow0KICAgICAgICAgY3B1
cyA9IDwxPjsNCisgICAgICAgIHNlY2xhYmVsID0gInN5c3RlbV91OnN5c3RlbV9yOmRvbVVfdCI7
DQogDQogICAgICAgICBtb2R1bGVAMHg0YzAwMDAwMCB7DQogICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxtb2R1bGUiOw0KZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmluZGluZ3MuYyBiL3hlbi9jb21tb24v
ZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmluZGluZ3MuYw0KaW5kZXggNDFkNzJkMGQ1OC4uMmQwNjFl
NWJhNiAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYmluZGlu
Z3MuYw0KKysrIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1iaW5kaW5ncy5jDQpA
QCAtMTEsNiArMTEsOCBAQA0KICNpbmNsdWRlIDxwdWJsaWMvYm9vdGZkdC5oPg0KICNpbmNsdWRl
IDxwdWJsaWMvZG9tY3RsLmg+DQogDQorI2luY2x1ZGUgPHhzbS94c20uaD4NCisNCiBpbnQgX19p
bml0IHBhcnNlX2RvbTBsZXNzX25vZGUoc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYm9vdF9kb21haW4gKmJkKQ0KIHsN
CkBAIC0yMSw2ICsyMyw3IEBAIGludCBfX2luaXQgcGFyc2VfZG9tMGxlc3Nfbm9kZShzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKm5vZGUsDQogICAgIGJvb2wgaGFzX2R0YiA9IGZhbHNlOw0KICAgICBi
b29sIGlvbW11ID0gZmFsc2U7DQogICAgIGNvbnN0IGNoYXIgKmRvbTBsZXNzX2lvbW11ID0gTlVM
TDsNCisgICAgY29uc3QgY2hhciAqeHNtbGFiZWw7DQogDQogICAgIGlmICggIWR0X2RldmljZV9p
c19jb21wYXRpYmxlKG5vZGUsICJ4ZW4sZG9tYWluIikgKQ0KICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7DQpAQCAtMTQxLDUgKzE0NCwxNCBAQCBpbnQgX19pbml0IHBhcnNlX2RvbTBsZXNzX25vZGUo
c3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlLA0KICAgICAgICAgcGFuaWMoIidsbGMtY29sb3Jz
JyBmb3VuZCwgYnV0IExMQyBjb2xvcmluZyBpcyBkaXNhYmxlZFxuIik7DQogI2VuZGlmDQogDQor
ICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfc3RyaW5nKG5vZGUsICJzZWNsYWJlbCIsICZ4c21s
YWJlbCkgKQ0KKyAgICB7DQorICAgICAgICBpbnQgcmMgPSB4c21fbG9va3VwX3NpZChYU01fSE9P
SywgeHNtbGFiZWwsIHN0cmxlbih4c21sYWJlbCksDQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmZF9jZmctPnNzaWRyZWYpOw0KKyAgICAgICAgaWYgKCByYyApDQorICAgICAgICAg
ICAgcGFuaWMoIkludmFsaWQgc2VjdXJpdHkgY29udGV4dCBmb3IgZG9tYWluOiAlcyAoJWQpXG4i
LA0KKyAgICAgICAgICAgICAgICAgIHhzbWxhYmVsLCByYyk7DQorICAgIH0NCisNCiAgICAgcmV0
dXJuIGFyY2hfcGFyc2VfZG9tMGxlc3Nfbm9kZShub2RlLCBiZCk7DQogfQ0KZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgNCmluZGV4
IDYzMzE4NTlhZmEuLjdhMDVkMjA3OGMgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94c20vZHVt
bXkuaA0KKysrIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgNCkBAIC04MjMsNCArODIzLDEyIEBA
IHN0YXRpYyBYU01fSU5MSU5FIGludCB4c21fZG9tYWluX3Jlc291cmNlX21hcCgNCiAgICAgcmV0
dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihhY3Rpb24sIGN1cnJlbnQtPmRvbWFpbiwgZCk7DQogfQ0K
IA0KK3N0YXRpYyBYU01fSU5MSU5FIGludCB4c21fbG9va3VwX3NpZCgNCisgICAgWFNNX0RFRkFV
TFRfQVJHIGNvbnN0IGNoYXIgKmN0eCwgdWludDMyX3QgbGVuLCB1aW50MzJfdCAqc2lkKQ0KK3sN
CisgICAgWFNNX0FTU0VSVF9BQ1RJT04oWFNNX0hPT0spOw0KKyAgICAvKiBkdW1teSBwb2xpY3kg
aGFzIG5vIHNlY3VyaXR5IGNvbnRleHRzICovDQorICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCit9
DQorDQogI2VuZGlmIC8qIF9fWEVOX1hTTV9EVU1NWV9IX18gKi8NCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94c20vaG9va3MuaCBiL3hlbi9pbmNsdWRlL3hzbS9ob29rcy5oDQppbmRleCBhMzMx
ZjVmMGU1Li4zYzFiZWYzMDUzIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUveHNtL2hvb2tzLmgN
CisrKyBiL3hlbi9pbmNsdWRlL3hzbS9ob29rcy5oDQpAQCAtMTY5LDYgKzE2OSw4IEBAIFhTTV9I
T09LKGludCwgYXJnb19yZWdpc3Rlcl9hbnlfc291cmNlLCBjb25zdCBzdHJ1Y3QgZG9tYWluICop
DQogWFNNX0hPT0soaW50LCBhcmdvX3NlbmQsIGNvbnN0IHN0cnVjdCBkb21haW4gKiwgY29uc3Qg
c3RydWN0IGRvbWFpbiAqKQ0KICNlbmRpZg0KIA0KK1hTTV9IT09LKGludCwgbG9va3VwX3NpZCwg
Y29uc3QgY2hhciAqLCB1aW50MzJfdCwgdWludDMyX3QgKikNCisNCiAjdW5kZWYgWFNNX0hPT0sw
DQogI3VuZGVmIFhTTV9IT09LMQ0KICN1bmRlZiBYU01fSE9PSzINCmRpZmYgLS1naXQgYS94ZW4v
eHNtL2ZsYXNrL2hvb2tzLmMgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCmluZGV4IGQ2NWJhMGFl
YWUuLjc0MTk2OWMwNjQgMTAwNjQ0DQotLS0gYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCisrKyBi
L3hlbi94c20vZmxhc2svaG9va3MuYw0KQEAgLTE5NDksNiArMTk0OSwxNCBAQCBzdGF0aWMgaW50
IGNmX2NoZWNrIGZsYXNrX2dldF9kb21haW5fc3RhdGUoc3RydWN0IGRvbWFpbiAqZCkNCiAgICAg
cmV0dXJuIGN1cnJlbnRfaGFzX3Blcm0oZCwgU0VDQ0xBU1NfRE9NQUlOMiwgRE9NQUlOMl9fR0VU
X0RPTUFJTl9TVEFURSk7DQogfQ0KIA0KK3N0YXRpYyBpbnQgZmxhc2tfbG9va3VwX3NpZChjb25z
dCBjaGFyICpjdHgsIHVpbnQzMl90IGN0eF9sZW4sIHVpbnQzMl90ICpzaWQpDQorew0KKyAgICBp
ZiAoICFzc19pbml0aWFsaXplZCApDQorICAgICAgICByZXR1cm4gLUVBR0FJTjsNCisNCisgICAg
cmV0dXJuIHNlY3VyaXR5X2NvbnRleHRfdG9fc2lkKGN0eCwgY3R4X2xlbiwgc2lkKTsNCit9DQor
DQogc3RhdGljIGNvbnN0IHN0cnVjdCB4c21fb3BzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgZmxh
c2tfb3BzID0gew0KICAgICAuc2V0X3N5c3RlbV9hY3RpdmUgPSBmbGFza19zZXRfc3lzdGVtX2Fj
dGl2ZSwNCiAgICAgLnNlY3VyaXR5X2RvbWFpbmluZm8gPSBmbGFza19zZWN1cml0eV9kb21haW5p
bmZvLA0KLS0gDQoyLjQzLjANCg==

