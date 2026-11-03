Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A427606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=r1l+neHB
Received: from list by lists.xenproject.org with outflank-mailman.1470311.1679039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHzG-0001gF-J6; Tue, 03 Nov 2026 17:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470311.1679039; Tue, 03 Nov 2026 17:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHzG-0001g8-GE; Tue, 03 Nov 2026 17:07:54 +0000
Received: by outflank-mailman (input) for mailman id 1470311;
 Tue, 03 Nov 2026 17:07:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOHzF-0001fv-LZ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:07:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHzE-00F3Vk-Qd
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:07:52 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aea14d2-bab6-0a2a0a5309dd-0a2a450bc4ce-28
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:07:52 +0100
Received: from [52.101.52.32]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aea14e4-b7e8-0a2a450b0019-346534206068-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:07:50 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5348.namprd03.prod.outlook.com (2603:10b6:a03:21b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:07:45 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:07:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+uel5iu3PwqNGKiJdrYAsBUFH/pRSdQUjmpydw7oc/sy29bXw0dS2Y/0v0jPWxbHlTU0PRZs0kt/r2FUhGVLyCjyz/f84/921WUX7j09AvHak/7lIknvVGuuCXE4XHPP20rELvPk9xK5jEEputJOHLZhYF4c5nMbfq0PjmvV9ZLOwNdIvqk74GSujhHvz4Or5DXZVrOhTzIG5An9qDrB51GEejH7FPH8scXzpROJT/qsnNR5QP9Y2MJ7qhoUxyHd83IZLB+X/pGiRA6qVDeeF0SbC6hOotj6mHp4tYwMeWcgbI2msPzGysVlrRXfp+qrmYui5X9f5047+lRf7odug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yO2774Qc6/2csyiWXKPlSoEKms2gNaH8nsP9aIadlI=;
 b=bOWGP2Oq4m+q1Ssjy3FNMngPUxE2shkUveSRO4VISkJWbKYrEfM+Zdz452NVvnNYO2f2ySYck+oy9KlJ/p+snZmV4QGzh5VLUQBDOmvj2klCn0WW+rg7g09l6c2h6oC2OzslggvvUsebybM9gR2Jix2OSiC1Xpz44WcAFRnYscIBXQLeYC7GkYIvicrjKeKqbESGNBuLRoAlIV7Nxe13XAbDtBZCt0/Uv0Pv+h1Fv7ZTcHn50PH9D2rjhN1/52IgiR4RDOp0XuUyJhHAvz7KeBjYO+BgQK2g4uzTlWmf/vQ7YLjnQFLleqGCwQIwZCH6dgsiOxcS9BUSqR4WoPm6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yO2774Qc6/2csyiWXKPlSoEKms2gNaH8nsP9aIadlI=;
 b=r1l+neHBYJcEesKG8QZRm6W1HhorUEBkMIS1mgtg3/OT7xMpk1uVnLDwFxHE3Fh4D+DyYgScX0haYSsKgAPYlA7MdXrLBMUbrUoA3OAd4U+rQkUIlwHXsRM+SF0E2Kgt4FmUKdtYHl14MlXmEQoLzO0pyfqriFcc4tQZyabIy5o=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: =?utf-8?B?Q2h1bmppZSBaaHUg77yI5pyx5pil5p2w77yJ?= <chunjie.zhu@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "jason.andryuk@amd.com"
	<jason.andryuk@amd.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"roger@xenproject.org" <roger@xenproject.org>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears
 V_INTR_MASKING
Thread-Topic: [PATCH v1] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears
 V_INTR_MASKING
Thread-Index: AQHdXVVTRd+tP+KIck2rlzcwmbytZrcU2N01gAdj4ACAAGzRfQ==
Date: Tue, 3 Nov 2026 17:07:45 +0000
Message-ID:
 <CH8PR03MB8274B269EEAFE914E122E59AF0692@CH8PR03MB8274.namprd03.prod.outlook.com>
References:
 <CH8PR03MB8274BC92D24DC22A0E41AA63F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
 <20261103101134.236608-1-chunjie.zhu@citrix.com>
In-Reply-To: <20261103101134.236608-1-chunjie.zhu@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|BY5PR03MB5348:EE_
x-ms-office365-filtering-correlation-id: e20e88a3-a265-4d07-e039-08df39ccfac1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|4143699003|11063799006|56012099006|261009223027099003|261009221227099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 hZXn6M9AllH3Q2z4JbIoD63APuP2ySa7RUH2gru3YYhjcTRyTFS57m30fHeP+kvYsmJZRx8IFEEdAuMRPRLCVMvjodCTYh+p02afWYP4L6nz3ANUBf4bPYkoFMZ92Dy+J4M5iOQVTSgeRqkeW2vwk3gFEbkzWWecUDrgQiQDhf5upa5ciebQPoxDxqpGI9gY6PuuzO1OcMxgGs/ajXJJFitqofZDfNkShuLTlg037ge3bh54LuMAAEEEGhjp8PvjcKV4UipXFwRKbjU1oTvKUYuuBpKbZJUiZvNnwENqFFpmGDcDwKurWmUOCejF7Oz1WKZlo1r0PwOXTh6wN+sFBERxIyvX+mEVds9UUoa7dCBu38jTpJrH/DE24ha3WfP2/eTa8PF4afr12QAtUwQTtsk4S9NS5w0oNEZwVOe1lbNiEQeV0bVBzgRg26J7SmAORoerDPHNaztrKKkPtQpE01tscl2dJJHL+MlkKINskVuxx5cfX42GjbEC0ZxYGO1ngptlqJ9UhuNVGPNcv6RxRtuJs5gK3knZAejGbaLXlLbGBCV9HsRZDgJvGuZsuOyVjXzIK568WZeEaMNSygJF3jXZFh0URegFAqllNg383JwWQqyqCTFK8AgtNeXlH4cc6td56pN3lfHV87WUIzp4pr2v4twL6GM4nF0Q7h2HvuQ7pzr39s7OCm4pjfwpY/CKrGlZ2GGWkaB+h3pjWVbLcH04v3njz+hBkN9twaXgpgM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blczNkN4ZUZySjhwSzh4WVZ4QnF0L0c0WHNVWk5wZEdKaGtmK0g5UTlHSWJC?=
 =?utf-8?B?L1VHdnRWWUFvQ3pza3BPMEtaUXZieEpNWU1vVFpYTTMvK2pkL0dLaE10a0hN?=
 =?utf-8?B?elF3WnhHKzhVU3RKSTBnNGFzV3JzMnJwcTY4Z21jNzJ4ZEZXYkszZ1NySUNT?=
 =?utf-8?B?Y0gyZDVMTk41SnpvckNJeDBybElHVDQzQ2U3enQyRTlFUWFWUlVIQ0VPTUVL?=
 =?utf-8?B?UXpzdGI1eFkySFZXa2ZnT0FsSlVoVmRiQTIvayt6U1pwc1docENXaWRERnZS?=
 =?utf-8?B?dkV4K1R5dk9VSDYwY2RFQlh5dXNPNjlkVnAxTGZEQ2NpRHcrZ0VPem9wMFlK?=
 =?utf-8?B?UkxaVzJCU0F6ei80dnN1ZDlIR2hqdkphU0JRU3dRTGF4bVU2c0pVUUZadVV0?=
 =?utf-8?B?amwzd2kxb0Z4WTdMTUJhNnpYcCtSOFNleWJ1U2g5enFVK3p0aSs4M3QxbStM?=
 =?utf-8?B?eWFxdXAwRXRlM0NoSGVDK3J1OGQ2ZUM5ZURhUHVMTHZnalhMZHlCSTVDbVI0?=
 =?utf-8?B?L2pFMWUySmlVd0xqZHFkUXRzcUFsWVRVVTZFczBLZEMzNU5hTTd2a09iOW5h?=
 =?utf-8?B?WlFuQytUM3FRSzlXQjBxaVZLaUVnVEF3MFNrM2tOcG5YeDBpeXB3d3AyemFK?=
 =?utf-8?B?UHZrdEZYdlNmcXIydEhZOE9tRU5WS2d4N1VhWDAzNFZtaWhDVDFZZ3VIelp3?=
 =?utf-8?B?NGYveHVhMG40ZzJicldJZmRYaHZYaW9meEVqb1ZIZzBla2ZURmEzSko1UWRW?=
 =?utf-8?B?K0o0Y3FjalNHbllHcVFyRTlFQmRORzJLeEt4WTVyV3phSXNXTFJubFNOK0VK?=
 =?utf-8?B?aXdqNTBaVDdULzNhTXhDWUoydHVnZGdrRkx6RTdWTEpEUUdya1ZJeUxySzdO?=
 =?utf-8?B?cHRkTGJuQ3JwTnVFRWpzSFNqYkthempWb2I0eWFIajM4cjUxYXFyRHUrNmQr?=
 =?utf-8?B?QTRzVm42anhTUFNzWXo1MllIZXRxbFl4Z2k4STFqejRZYjJxdlVlVjJ3dlBJ?=
 =?utf-8?B?QTBraURJRzFKN2FESHpSS2F0MDAxK3dleXBVUnl6ZTZmcjlab1VoaWIyUkNP?=
 =?utf-8?B?bmVuSzF2VktpcTJGbFhCdTJLYlZsWFZ1enlwSGhPM0pUZ2xpT2lMNFhWYnd4?=
 =?utf-8?B?K3l2TkVaRGEzQTc1UzREZFNpUTIxU01laWdkVnZrOThodVowWHR2aUFWWFhr?=
 =?utf-8?B?N0JweXozYjBWMXBPSXhseURTMTdRSitMVnNKdGVnVDhnbkdRUmdMak5DVVVK?=
 =?utf-8?B?TU5ldEpObGZTcmNWVFJNWUtRblFJY3NTM1FlVTJLL1AzZjVMZ0xUb2szMFdl?=
 =?utf-8?B?cFhzbjhPODRIa0piRFpLSzlUM01NSkxWdUZHdTloaG5pYlVqR3RreE8wZnV1?=
 =?utf-8?B?Z1BMa0Q2dVBoRlNBdVlQd2o4TnhBenU4N25qb05naEo3WUFqVnAzMlFYT09s?=
 =?utf-8?B?NnlEdkcwMkJISXNoLzlYU2o1dmRzYm1VQXc2U3BKd292a3JvV0wzVW1rKzQ1?=
 =?utf-8?B?bis4YzlRcnJJRDhuNFhWdmNCb0FZdmR6b2pWek9kcHFqMEVUc2hjYVNxcmtp?=
 =?utf-8?B?VC9aQjRCaXJzNE1GdXRaYW9VRTdMRHJXMGhwcGd5aUNVMFFLQ21BOXkwN0Zl?=
 =?utf-8?B?U21LS3h6cHVNbDhnQzd6cU5Zc3B3MnJMK0x4WTNJK0FUbHlFMXpXQkNKdStN?=
 =?utf-8?B?Z3BVZGlzRWdrVndZblpmdmFsdkN4VGVqSFM0QithS3RPeHEzR3o5cWtjOVRC?=
 =?utf-8?B?VjRmQ1lFWjcrWDV6SmlpcW5lcFQ5a3I2QU9EamNhSUNmVytRaFQ2bEp1VjAv?=
 =?utf-8?B?WEIrZ0lzUnRCLzNXcXJPSU5ZdCtRWHc1Z1ZtOHhiYktuV2hwQm9IRzkrSjRB?=
 =?utf-8?B?aUxKTklQbG9UY1Q3UkdwdVRFaEdnUE1DY0tnbGhOeUZ4SGk4OWI0M1JzcVdL?=
 =?utf-8?B?NjY5bW43T0RkQk5Zd2QvS1VJMzRDUTZiR1UrR21TQ1ByeW9jeFUwcTdOVytu?=
 =?utf-8?B?VkxnelZwN3pFRVRWcG43ME4ydGxLSTlydGxpSEk5NXRWWnR5MkZzRkNqNUhD?=
 =?utf-8?B?b09lSEwwSUZydVUrVENveTBWZVE3MFRWU0RHZ3JIc2pGQW9ndmlOazEyMjNz?=
 =?utf-8?B?N1RRK1BEbU5xUkI2K285TFoybllYNFNRTnhmK1FYUnJBaVNSak9BSEVIYVBt?=
 =?utf-8?B?TDRtdjBqcG4xeEovelMvZGlGYnBvMkNsUkhZYnpPZ0M3R0lySU1Dek9FR2hB?=
 =?utf-8?B?bThudVNTd1N5K2hMcDJCNkFOWEQrYkpwemxkczhIYjhFOWNDNDd2Mk9JQkYw?=
 =?utf-8?B?VmZ0MVNpbjlaRGc2NUdMaysvaWZlL3FjTVBOQno5eHA0N0tLOWxpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20e88a3-a265-4d07-e039-08df39ccfac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:07:45.2573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GzOduqCqCYfORxr1E/IFLj6nRG0Tbr6wONtWKUsXrqztiWqKaKm8FlLet+A28JZdveisNz0LPC0DB8PW/kL9lrywfJtSx4h8ctuzfQhfqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-purgate-ID: tlsNG-42698a/1793725671-AA0C59EA-9ACDF9BF/10/78276251493
X-purgate-type: spam
X-purgate-size: 3576
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBGcm9tOiBDaHVuamllIFpodSDvvIjmnLHmmKXmnbDvvIkgPGNodW5qaWUuemh1QGNpdHJpeC5j
b20+Cj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMDMsIDIwMjYgMTA6MTEKPiBUbzogUm9zcyBM
YWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBDaHVuamllIFpodSDvvIjmnLHmmKXmnbDvvIkg
PGNodW5qaWUuemh1QGNpdHJpeC5jb20+OyBqYXNvbi5hbmRyeXVrQGFtZC5jb20gPGphc29uLmFu
ZHJ5dWtAYW1kLmNvbT47IGpiZXVsaWNoQHN1c2UuY29tIDxqYmV1bGljaEBzdXNlLmNvbT47IHJv
Z2VyQHhlbnByb2plY3Qub3JnIDxyb2dlckB4ZW5wcm9qZWN0Lm9yZz47IHRlZGR5LmFzdGllQHZh
dGVzLnRlY2ggPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYxXSB4ODYvbmVzdGVkc3ZtOiBob25vdXIgTDIncyBFRkxBR1MuSUYgd2hlbiBMMSBj
bGVhcnMgVl9JTlRSX01BU0tJTkcKPgo+Cj4gT24gVGh1LCBPY3QgMjksIDIwMjYgYXQgMTc6MjAs
IFJvc3MgTGFnZXJ3YWxsIHdyb3RlOgo+ID4gV291bGQgaXQgbm90IG1ha2Ugc2Vuc2UgdG8gY2hl
Y2sgdGhpcyBpbiBuc3ZtX2ludHJfYmxvY2tlZCgpIGluc3RlYWQ/Cj4gPiBUaGVyZSBpcyBhbHJl
YWR5IGEgc2ltaWxhciAoaW52ZXJzZSkgY2hlY2sgdGhlcmUgc28gZXh0ZW5kaW5nIHRoYXQgc2Vl
bXMKPiA+IG1vcmUgbG9naWNhbCB0byBtZS4KPgo+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24s
IGJ1dCBJIHRoaW5rIHRoZXJlIHdvdWxkIGJlIGEgcmVncmVzc2lvbi4KPgo+IG5zdm1faW50cl9i
bG9ja2VkKCkgaGFzIG5vIGFjY2VzcyB0byB0aGUgaW50YWNrLiBQZXIgdGhlIEFQTSAodm9sLjIs
Cj4gc2VjdGlvbiAxNS4yMSksIFZfSU5UUl9NQVNLSU5HIGNvbnRyb2xzIHdoZXRoZXIgdGhlIG1h
c2tpbmcgb2YgaW50ZXJydXB0cwo+IChFRkxBR1MuSUYgYW5kIFRQUikgaXMgdG8gYmUgdmlydHVh
bGl6ZWQuwqAgVGhhdCBtYXNraW5nIG9ubHkgYXBwbGllcyB0bwo+IG1hc2thYmxlIGV4dGVybmFs
IGludGVycnVwdHMgKFBJQy9MQVBJQy92ZWN0b3IpLsKgIE5NSSBpcyBub3QgbWFza2VkIGJ5Cj4g
SUYvVFBSLCBhbmQgI01DIGlzIGFuIGV4Y2VwdGlvbiwgc28gbmVpdGhlciBpcyBhZmZlY3RlZC4K
Pgo+IFdpdGggdGhlIGNoZWNrIG1vdmVkIGludG8gbnN2bV9pbnRyX2Jsb2NrZWQoKSwgYW4gTk1J
LyNNQyBhaW1lZCBhdCBMMQo+IHdvdWxkIGJlIGhlbGQgcGVuZGluZyB3aGVuZXZlciBWX0lOVFJf
TUFTS0lORz0wIGFuZCBMMidzIElGIGlzIGNsZWFyLAo+IHdoaWNoIHdvdWxkIGJlIGEgcmVncmVz
c2lvbiBmb3IgTDEgaHlwZXJ2aXNvcnMgdGhhdCBpbnRlcmNlcHQgTk1JLyNNQy4KPgo+IFNvIEkg
d291bGQgcHJlZmVyIHRvIGtlZXAgdGhlIGNoZWNrIGluIHRoZSBodm1faW50c3JjX3BpYy9sYXBp
Yy92ZWN0b3IKPiBjYXNlIG9mIG5lc3RlZHN2bV92Y3B1X2ludGVycnVwdCgpLCB3aGVyZSB0aGUg
c291cmNlIGlzIGtub3duLsKgIElmIHlvdQo+IHdvdWxkIHJhdGhlciBoYXZlIGl0IGluIG5zdm1f
aW50cl9ibG9ja2VkKCksIEkgY2FuIGluc3RlYWQgcGFzcyB0aGUKPiBpbnRhY2sgZG93biAoY2hh
bmdpbmcgbmh2bV9pbnRlcnJ1cHRfYmxvY2tlZCgpKSBzbyB0aGF0IHRoZSBJRiBjaGVjawo+IGlz
IGFwcGxpZWQgdG8gbm9uLU5NSS9NQ0Ugc291cmNlcyBvbmx5LgoKWW91IHNob3VsZG4ndCBuZWVk
IHRvIHBhc3MgaW4gbW9yZSBpbmZvcm1hdGlvbi4gbmh2bV9pbnRyX2Jsb2NrZWQoKQpyZXR1cm5z
IGEgcmVhc29uIGZvciB3aHkgdGhlIGludGVycnVwdCBpcyBibG9ja2VkLiBJdCBpcyB1cCB0byB0
aGUKY2FsbGVyIHRvIGRlY2lkZSB3aGF0IHRvIGRvIHdpdGggaXQuIElmIHRoZSByZWFzb24gaXMK
aHZtX2ludGJsa19yZmxhZ3NfaWUsIHRoZW4gaXQgc2hvdWxkbid0IGJsb2NrIGluamVjdGluZyBh
biBOTUkuCm5lc3RlZF9zdm1fdmNwdV9pbnRlcnJ1cHQoKSBjdXJyZW50bHkgaWdub3JlcyB0aGUg
cmVhc29uIHNvIEkgdGhpbmsgaXQKaXMgYWxyZWFkeSBicm9rZW4gZm9yIHRoZSBtb3JlIGNvbW1v
biBjYXNlIHdoZXJlIFZfSU5UUl9NQVNLSU5HPTEgYW5kCkwxJ3MgUkZMQUdTLklGPTAuCgpTbyBJ
IHRoaW5rIHRoaXMgd2FudHMgYSBmaXggdG8gbmVzdGVkX3N2bV92Y3B1X2ludGVycnVwdCgpIHRv
IGhhbmRsZSB0aGUKcmVhc29uIGNvcnJlY3RseSB3aGljaCBmaXhlcyB0aGUgVl9JTlRSX01BU0tJ
Tkc9MSBjYXNlLCBhbmQgdGhlbiBhIGZpeAp0byBuc3ZtX2ludHJfYmxvY2tlZCgpIHRvIGhhbmRs
ZSB0aGUgVl9JTlRSX01BU0tJTkc9MCBjYXNlLgoKVGhlIHJlYXNvbiBJIHByZWZlciBwdXR0aW5n
IHRoZSBsb2dpYyBpbiBuc3ZtX2ludHJfYmxvY2tlZCgpIGlzIHRoYXQKdGhlcmUgYXJlIG90aGVy
IHVzZXJzIG9mIGl0IGJlc2lkZXMgbmVzdGVkX3N2bV92Y3B1X2ludGVycnVwdCgpIGFuZCB0aGUK
YmVoYXZpb3VyIHNob3VsZCBiZSBjb25zaXN0ZW50IHRoZXJlIHRvby4KClJvc3M=

