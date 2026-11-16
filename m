Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DE2606A88F
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 19:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=MoQqhLxZ
Received: from list by lists.xenproject.org with outflank-mailman.1491496.1692265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT2JS-0003Lt-8r; Mon, 16 Nov 2026 19:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491496.1692265; Mon, 16 Nov 2026 19:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT2JS-0003Lm-6H; Mon, 16 Nov 2026 19:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1491496;
 Mon, 16 Nov 2026 19:24:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xT2JQ-0003Lg-O6
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 19:24:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT2JP-001knn-Tb
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 20:24:19 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afb5838-bab6-0a2a0a5309dd-0a2a4506d070-16
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 20:24:19 +0100
Received: from [52.101.65.122]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6afb5863-195a-0a2a45060019-3465417a4f58-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 20:24:19 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AS8PR03MB7637.eurprd03.prod.outlook.com
 (2603:10a6:20b:345::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 19:24:18 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 19:24:18 +0000
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
 b=vrCSfO7hYUDTnI+7GoajXSr0vZQMoF5A10CVEg1e36PRkj5rSVbs06QxprR+ia8SBL0quBlNK75fGs6VcNDngd4on9vUkmC7uiHieIrNRsrRtd67QxrLdRL3oArXDSK91IovYeW0aC1sm9L69ZocyS2slBUtppAnbBV0LqdgHKEuuNTH+SrRdI6uRTdSsOBarC/B1r+5wemoWKKtU4k2KCsLsAhv7GPyU3Lx1B7MZ29YAQw7hy8afzFGk5PNyBHMvtfj4pMCD3J7Wf9s5PfXsoDM0B0VDk7fDBJv0+AvTSuxWPDzRK5USdStB/7Dj38BteBR+Lq1OBDMHusNZ3oT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw9wrOQdTHZ76IDcphyY/4sKgzOP6dXyZFGetDyAu8E=;
 b=FK6raDN7kQ9cAfF5i7RF/TYqSFgHQm61vSC8zXTptr7qt2Emu554rMhOFmJwsNjALkqS8osBIpZMdEq5QYJX7BmUzBj/09WvYpvO5E0Y2Tqy8qN88Bmof/WiSs5xcuuP0akYqYF/MyQpF0fZnZi2rSg4EescdyVnNXTVwfEAERe+uvQnkw1zZX+Zb5Bgp8e9GGOr5OC6kRSD3XZkPPvfqQqgiKBCldRJMpRw5PmHB/gV3kd7ORnVmOPLa1F2rOW1n4pgrcI5f6jIeFR9FFgnD9MgUn0jcAz87cZp6bJ0ciGgCz9oQAlatnDrTU9FcYsltymrNUALSctohp1aZRVYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw9wrOQdTHZ76IDcphyY/4sKgzOP6dXyZFGetDyAu8E=;
 b=MoQqhLxZRJTzIFAKprFV5NJwVs9P/3SRsooFTN/EcfVDnZ0gkOZOK7qyZbPhtFEj7Iaefmdy4UDL+xyD+nJi93j81Rjsx0EyZQlNOlqr9yT9N2PQxbQxmO8nQozkjYoJFnwKkyRz8WADPEOqxRq0Ay9O8ijFfhfY7y3mKYspbrqfNfHHqnLpLFC2rQ1xZqd1OuglX75O+wtHHY03PLb4hAcmn3ErvCvniIrsdYrtxUBDidNHpTihnYIRp1itrlP9ulU2qC1ccF4VLCD1kLTmPN28M6pX+nBlFgYK4dTBCnghTnhyDGyrxt8aWCkLvKuaxy56s4RvGjsbJGMe6g+sJw==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 0/2] tools/symbols: fix oversized names and token expansion
Thread-Topic: [PATCH v2 0/2] tools/symbols: fix oversized names and token
 expansion
Thread-Index: AQHddgASYmrr0ohkDk+QiVyeCn9meg==
Date: Mon, 16 Nov 2026 19:24:17 +0000
Message-ID: <cover.1794852738.git.mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|AS8PR03MB7637:EE_
x-ms-office365-filtering-correlation-id: ad47bd9a-d959-4cdf-9a73-08df44173562
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|6133799003|11063799006|10067099003|261022105027099003|261026140227099003|261022113327099003|261028144727099003|261021121427099003|56012099006|261009223027099003|261102123227099003|261021123027099003|38070700021|261022075727099003;
x-microsoft-antispam-message-info:
 lC40b4E2/iJUFI+cdsCI/Y0qxZks+dhXwSHBp9LP00QPgXTjiAH8v8h+NZN2IQam97q11LLiu5JMZrSuy6ypEDKUTnuWR5fFNd7ANC5eUBW2bjNm7TMiuJsOchFgcJwuBWU0ulsWwuYcnOFme+XK94AcfzreqRTD0rr2qE0f2CxakSb8okbSgIctPbr/sDAAOdg2oivw+9WJ8cBvy82RlaWSRKMvdtReGxhlV+BlgEJO8Zq9IEkTN9fJ45CEBNU5N3y3rsT70NQC3eLdnru39ISdbj9a+Bfuoh15ugTuqCTN+t44Fpg9efKbU1BEUYUPX3u61v5V7+YSWgIMxF3qAVVD6pAkT9edbjtQdnDDn6RLfsR3cERAIbUHZAjrM3uuRAghnEx3TvQ8NRhUnsfl4Y3CSfqi7Oih6S5sRR1Hfo+1pGH0o/2bLE0/aHpopa9j1gZtzIloysx45M2y9a1oefmLYHtHI1tSaTjaDOiPZcWLo6Vry2mH81IuB/XXRfuySbp5G9SjYbJEtOhV1xrFpXi+on/Rw17Yw3mWlRI3QjiBEPXkQYvPqqcB4fcuWbMXx7LWflbm7MwXs0Tu6nDvVus/iDoh2ZNO3Tea6aPNWHzusXMe+OA8VOpUk/cgWhGu0rbygskHZQ6JHctNGpesnGJB17gB65upSABFWy5TmIMkaVj1p1u5aDYy5a6fbTKzbLtPtbFLmWr1wRAFXxPAO4SZrnDhMHsxZ+ygNUQfZCg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(6133799003)(11063799006)(10067099003)(261022105027099003)(261026140227099003)(261022113327099003)(261028144727099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261021123027099003)(38070700021)(261022075727099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1VaRGJmbWtpbVhSOHhjaTlnT1lzNGJ3RGJhU3o2UFgwNmgwNmVTaTVyeGp3?=
 =?utf-8?B?S3Z2aFFaVE00NnNKV0F4UWRFWE91TVVrczZqSDMveHlJNUNXbDBuSVZqNDlq?=
 =?utf-8?B?eWQybjVWOE1pcHBScGk3ZlNieGZlcDlWQWdsNWJ5Z3I3Z3Y0ZGVlVWNYclV2?=
 =?utf-8?B?dnRJREdMcjdWRGRwZnhtYjlmWjJ2ZXFWQWpTS29Bajl6bVhVV3dEVUJoL0o5?=
 =?utf-8?B?bkVLUXM5bnN3bUNWNjhlQWNpbVMwaUdZQzFQRzk2RmcxdU1BUE92TWM0WmNs?=
 =?utf-8?B?b3MxK3JHL3ExUUwwMkdNYjQ5cE8xcURITFFZVm53OWJXWjgzTENFSzBkRWIv?=
 =?utf-8?B?S2VpVmZqUU1DVFI0T1NoM2NQSlNSalZxQ2E2VVc2TFFXV1BWMGdMbUkvSFJN?=
 =?utf-8?B?RktodGRLMG5Wb3VZWHZid0piR1ZSMzFBZnpNOEt4eU1EcTNoU3FDamQvVnBC?=
 =?utf-8?B?a2JmL3Q3RVVINVprWVM2ckdSNEdXN0hldGtseTFNLytjQzk3dTBROEVlZEtt?=
 =?utf-8?B?YVZhdUFETnRCdVVqaW5Jd3hEUmRtR0lxTGJ2TzhXTmNueHVJMXR5ck5abFI3?=
 =?utf-8?B?eW4xeHZ0aGp1UE9yVENhVzFrM09mTHZMMWNEK293anNBZUJuY01OcFNsdmNI?=
 =?utf-8?B?V1QwQnNSaDVRQTNUR0JWdDY1TEtibUhwSmZzOVhOUThqbmdNUmhENFdOc3pq?=
 =?utf-8?B?Tk9nNkRjcVlpbmhhUTN0UmNmS1FMK3ZSbDNjVUxBSzFUV1BlS08xdVczWnFK?=
 =?utf-8?B?blBsN3JaYm1ia0RzY0wzZjQvWmhjVTVGeXJFSmUybzErL05TL0Q3YjcxT3Bm?=
 =?utf-8?B?ZGdlUG53QlNBbVVOMnhUTVI2S2VYaDFZd01qaDEyRmZ6SW9rMHFIb01qVE45?=
 =?utf-8?B?ZnVZK0lnMmpsRGRjMHhCOGFuTXhGSmlrQmxDMGkxc25FeFNPcVUwS3MwZ1Jl?=
 =?utf-8?B?K0k5N2llRFd1RXlCU1dPeDVuMldLZWRWVFdMVzFwY3FPNzVPcmh0SW4yektj?=
 =?utf-8?B?SnptVjFmUktLOFlyN0gwSEFPdUdNeEpGRGtaUXhuTllDTWRHcFRlNVpBSUV4?=
 =?utf-8?B?OEY4bEJQeTkrWVdZdnQ5TG1ZdTgyekhiN0hmRVAyL0dLYTZManpGSE42VFlP?=
 =?utf-8?B?UHZCZSsyQmoxSDc5RllJSm5oWnQvdm1YMWNYZDltLzBrWnkwN1ZYVmpSRTJX?=
 =?utf-8?B?KzYzRmVqcWo0SjZjbzE1Y2Y3aWdYeTNXa2pzNHg4ZEtEVFhJYUgxSUwzTjk3?=
 =?utf-8?B?ZHlNUjArdUtRcjlMeENJWDZHbEN5M3RLOTRMN1h3TXR6R1pvTWoxSWpOaGtz?=
 =?utf-8?B?L283TUlXYVpDeGx0OU80RGk1Yk4wVzFaMkgwaXZDSEFQY2hqRGtNeWhldHhu?=
 =?utf-8?B?OWpIRWJTaE5HTVVubWREeHA2enNCR0EzRWkwT2lIMSs2MTV0cUs2TGlveWRV?=
 =?utf-8?B?Q1FEaEJRNWdiTUJEWm5na25PdStiMGtOOTdOR21FYm94OVFSajdVZnJTT0Iz?=
 =?utf-8?B?OTFER2hVaDFuYlU2V2VXdDkxY0t6b2x6U0pYV1l4bzkwTWQ5bFpKd1FIS1RR?=
 =?utf-8?B?L0RzOCtTR2dqUFA3YUZiY3ZDeDFCa0UxcnJqQ2lQTHQweURjYXF4Z1luQTEr?=
 =?utf-8?B?VXNkbS8za3FQLzRmY1dvV0Q0TCs5MU5JREFzYnQ2VWhOeXJESjlkTGRHeW9O?=
 =?utf-8?B?VDI1TTlPOHNPcTg3MnlDZFUwK094R1JWMlQrMkJHQnVKa3lzMzgrazdoUmo5?=
 =?utf-8?B?RVI1NUhwKzYzRm05Q2k3RThldi9LdzA0QlJtem9WUzJjTkZudzRBNGdQU0dy?=
 =?utf-8?B?dWpqU2ttSm1helh1UEFuQ2xzeW1KOW5FTXpFZnZCOVpiT3VwT29HK3dNa3d1?=
 =?utf-8?B?aDlsRWZJaDNCRUNYbWdORERBRk5GNGZFVFc1YzBkaVJZamZkQ2JuSW9NOHp5?=
 =?utf-8?B?L1lZMnVjMXA2a0xDeUo2WUZnTDVWN2QxUXRXTDV1VmpRK1RQY2huM3A0M29l?=
 =?utf-8?B?c0F0ZHlUNlViSGdmM3dabXRXVVY4SzQxVzJpZ01kdlMyOXJyMVdmRDAreEU1?=
 =?utf-8?B?QStHcVNUcnRZZWd5VlFqUHVOVE5PdXRON1BhdU5uRmpMNC9XTCtsZlNkZWo2?=
 =?utf-8?B?akI2empQTjNFSjQxQWRMZm02ZytXcU10V3o2UERmeElYQ1lTSkI0OFNiM3k2?=
 =?utf-8?B?ZkczcGNMMWVNbi9Xc2VnckliU2p1YXExNGFEWUZSK21PM0ZLaExEYkZIdzJP?=
 =?utf-8?B?S21iTm04ams4aER5WmU4UjN2NjRqbWNSWlU5Rm1jK01HRW56c2ppWlBUZ0Mv?=
 =?utf-8?Q?bYWDLdVqhV/9ufwcm0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad47bd9a-d959-4cdf-9a73-08df44173562
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 19:24:18.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZNpFB1H19t+4qS6VQIMk2XcFEwT9DfsYXR2fnSxYfC0KEdov7Wr63YRY6G9PCr7uwjPiBFMoTyj4MXSTc83mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7637
X-purgate-ID: tlsNG-16d1c6/1794857059-F7ECC77B-B838D237/0/0
X-purgate-type: clean
X-purgate-size: 2726
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgYWxsLA0KDQpUaGlzIHNlcmllcyBmaXhlcyB0d28gYnVmZmVyIG92ZXJmbG93cyBpbiBYZW4n
cyBzeW1ib2wgaGFuZGxpbmcuDQpUaGFua3MgdG8gSmFuIGZvciB0aGUgcmV2aWV3IG9mIHYxLg0K
DQpQYXRjaCAxIG1ha2VzIEtTWU1fTkFNRV9MRU4gaW5jbHVkZSB0aGUgdGVybWluYXRpbmcgTlVM
LCBmb2xsb3dpbmcNCkxpbnV4J3MgY29udmVudGlvbi4gVGhlIHJ1bnRpbWUgbG9va3VwIGJ1ZmZl
cnMgc3RheSBhdCAxMjggYnl0ZXMuDQpUaGUgdG9rZW4gZXhwYW5zaW9uIGJ1ZmZlciBncm93cyB0
byAxMjkgYnl0ZXMgdG8gaG9sZCB0aGUgdHlwZSwNCmEgMTI3LWJ5dGUgbmFtZSBhbmQgdGhlIE5V
TC4NCg0KUGF0Y2ggMiByZXBvcnRzIGFuZCBza2lwcyBuYW1lcyBsb25nZXIgdGhhbiAxMjcgYnl0
ZXMgaW4gcmVhZF9zeW1ib2woKSwNCmluY2x1ZGluZyB0aGUgZmlsZW5hbWUgcHJlZml4IGFkZGVk
IHRvIGxvY2FsIFNZU1Ygc3ltYm9scy4gVGhpcyBhdm9pZHMNCmdlbmVyYXRpbmcgYSB0YWJsZSB0
aGF0IGNhbiBvdmVyZmxvdyB0aGUgcnVudGltZSBsb29rdXAgYnVmZmVycy4gQSBsb25nDQphYnNv
bHV0ZSBzb3VyY2UgcGF0aCBjYXVzZWQgdGhpcyBvdmVyZmxvdyBkdXJpbmcgdGhlIGJvb3Qgc2Vs
Zi10ZXN0cw0Kb24gYW4gT3JhbmdlIFBpIDUgZGVidWcgYnVpbGQuIEh1bWFuLXJlYWRhYmxlIC0t
eGVuc3ltcyBtYXBzIGtlZXAgbmFtZXMNCmxvbmdlciB0aGFuIHRoaXMgbGltaXQuDQoNCkNoYW5n
ZXMgaW4gdjI6DQotIFJlb3JkZXIgdGhlIHBhdGNoZXMgc28gdGhlIG5hbWUtbGVuZ3RoIGNoZWNr
IHVzZXMgdGhlIGZpbmFsDQogIEtTWU1fTkFNRV9MRU4gY29udmVudGlvbiBmcm9tIHRoZSBzdGFy
dC4NCi0gUGF0Y2ggMSAodjEgcGF0Y2ggMik6IG1ha2UgS1NZTV9OQU1FX0xFTiBpbmNsdWRlIHRo
ZSBOVUwgYW5kIHVwZGF0ZQ0KICBpdHMgdXNlcnMuIFRoZSB0b2tlbiBidWZmZXIgaXMgS1NZTV9O
QU1FX0xFTiArIDEsIHdpdGggdGhlIGV4dHJhIGJ5dGUNCiAgZm9yIHRoZSB0eXBlLCBhcyBkaXNj
dXNzZWQgd2l0aCBKYW4uDQotIFBhdGNoIDIgKHYxIHBhdGNoIDEpOiByZXBvcnQgYW5kIHNraXAg
b3ZlcnNpemVkIG5hbWVzIGluc3RlYWQgb2YNCiAgZmFpbGluZyB0aGUgYnVpbGQsIGFuZCBtb3Zl
IHRoZSBjaGVjayB0byByZWFkX3N5bWJvbCgpLCBhcyBzdWdnZXN0ZWQNCiAgYnkgSmFuLg0KDQpU
ZXN0aW5nOg0KLSBCdWlsdCB0aGUgaG9zdCBnZW5lcmF0b3Igd2l0aCBHQ0MgMTUuMi4wIGFuZCB0
ZXN0ZWQgaXQgdW5kZXIgQVNhbi9VQlNhbi4NCi0gQ2hlY2tlZCBCU0QgYW5kIFNZU1YgaW5wdXQg
YXQgdGhlIDEyNy8xMjgtYnl0ZSBib3VuZGFyeSwgLS14ZW5zeW1zLA0KICAtLXNvcnQtYnktbmFt
ZSBhbmQgLS1lcnJvci1kdXAuDQotIFJlcHJvZHVjZWQgdGhlIHRva2VuIG92ZXJmbG93IHdpdGgg
NjQgaWRlbnRpY2FsIDEyNy1ieXRlIG5hbWVzIG9mDQogIHR5cGUgVDsgdGhlIGZpeGVkIGdlbmVy
YXRvciBwcm9jZXNzZXMgdGhlIHNhbWUgaW5wdXQgd2l0aG91dCBlcnJvcnMuDQoNCkJlc3QgcmVn
YXJkcywNCk15a29sYQ0KDQpNeWtvbGEgS3ZhY2ggKDIpOg0KICBzeW1ib2xzOiBtYWtlIEtTWU1f
TkFNRV9MRU4gaW5jbHVkZSB0aGUgdHJhaWxpbmcgTlVMDQogIHRvb2xzL3N5bWJvbHM6IHNraXAg
bmFtZXMgZXhjZWVkaW5nIHRoZSBydW50aW1lIGxpbWl0DQoNCiB4ZW4vYXJjaC94ODYvcGxhdGZv
cm1faHlwZXJjYWxsLmMgfCAgMiArLQ0KIHhlbi9jb21tb24vc3ltYm9scy5jICAgICAgICAgICAg
ICB8ICA2ICsrKy0tLQ0KIHhlbi9jb21tb24vdnNwcmludGYuYyAgICAgICAgICAgICB8ICAyICst
DQogeGVuL2luY2x1ZGUveGVuL3N5bWJvbHMuaCAgICAgICAgIHwgIDMgKystDQogeGVuL3Rvb2xz
L3N5bWJvbHMuYyAgICAgICAgICAgICAgIHwgMTEgKysrKysrKysrKy0NCiA1IGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi41My4wDQo=

