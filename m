Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1754CCA601E
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 17:24:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444600.1661373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFEKm-0000Ag-ES; Fri, 09 Oct 2026 17:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444600.1661373; Fri, 09 Oct 2026 17:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFEKm-0000AZ-Az; Fri, 09 Oct 2026 17:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1444600;
 Fri, 09 Oct 2026 17:24:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xFEKl-0000AT-4J
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:24:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFEKk-009OPC-0p
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 19:24:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac92344-e002-0a2a0a5209dd-0a2a4503ba3e-18
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 19:24:37 +0200
Received: from [52.101.72.77]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac92355-fae8-0a2a45030019-3465484dfd52-4
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 19:24:37 +0200
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com (2603:10a6:102:1da::11)
 by PA4PR03MB7373.eurprd03.prod.outlook.com (2603:10a6:102:108::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 17:24:36 +0000
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e]) by PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 17:24:36 +0000
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
 b=UEkOkw0xGsMy9OWLBn5k1DptzmUK0R6Pu/gzlgJCMn7tXeMQNCi1HLuOjO1XB28GgxRciq6xIugOlhOzhbKRfNdquzHMyxdbYbzeAb5qeprq3xTn2/ds9BP4eGHIWWzDfpt0fZ14Y9IDps7vK1HHP4ETs8AKBoj6yYpAigGShSHPkaWi+qLHyqg1u30q9zmsuE40fSbiR0yp1J9nWMzl7a7bIG7luqWRUAgevc+jq1MmD0x/qHvMS4ZHdMkt/pyaw+wXwRGxhX7QD+06ctBHwR9e8Qh1TqlqsAzVCcWmeznetMttOFcO1quorBsvqb0/PvirnvOFw0ao7RzlRBNohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kG0Nrink/VIjzZVh3uGkOeZoaYXZYdL5u63rSihIUQ=;
 b=wF8apXMnHQWyt9c4ezDKtBvru8KQCtt4DIlU6s5xmUkURjjAfTBj+4Fr7Krbkxv7qRtkYOJjmiQtLZiuEX8rUD/R7TnLfHsOg0YvPYpi+m/hMrI5tkRSMF8av19O5CBXrbl6ttFbnoPsG7qPdaCKpjJiCMJNAOelBMfcXdG8O3hmH4eYcuY0kKA1cYLde7uPJFWZIZ1yQkw54TnrEy+ApThbKTXrOQyqHijP4CD8PrekNqpCyKFUHJtukXeCht+3ngvDiej05wAu778q1SOVmSf3CfZ+RagB1rNGTRqmcAzMgBzQHjIG9YHmWlGZBgnYVHSm3NjJ2/o/gb7molFk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kG0Nrink/VIjzZVh3uGkOeZoaYXZYdL5u63rSihIUQ=;
 b=kLUKMMwOr9BeVnTgT4CVA0TRkxASMsKhKhssQBbo/uf6OYIyw65WEs4pMF3paGWu8Ko4bNyvdGmwQwARUbFkYL+Nz87x62EdFilmqxymWFIf4gBam6VrFutae153fDJwxklyCpT9KeVWvpTMT9F5O76A+cCANnZJxsgy2Uz6SYO2D+KVGCUVIXtNoCe4ghikj6emXE5mcwVaq3de5ZRkXHr657Ecv4P/fTHkmoiR252f+jRHErZNdeLWLo3+sfSS1oOn6067I5dCBasxEs8Qk/oLkLkXG0esKR6s6XtaZ4QXUsZvTMRuNxj9QuIyzYeAHKLac1BrgfQQOwhbxEGhbg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 10/19] arm/its: Keep track of BASER regs
Thread-Topic: [RFC PATCH 10/19] arm/its: Keep track of BASER regs
Thread-Index: AQHclF+MPQ/oNp2C80CWhnrkrdvP0rb2/VyA
Date: Fri, 9 Oct 2026 17:24:35 +0000
Message-ID: <4965f6c4-0c37-4f55-9e10-72990ba40090@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
 <cc8390af73d86c72d5274e6cc3c314fe018a2c8d.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To:
 <cc8390af73d86c72d5274e6cc3c314fe018a2c8d.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR03MB7531:EE_|PA4PR03MB7373:EE_
x-ms-office365-filtering-correlation-id: 8d32759b-7390-4341-4ff9-08df262a30e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|23010399003|38070700021|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 iBLQyyKH0dMXnAUfZqAks6DMtt7cCYFDyZuQZuE1mItV5OJQ0VTU8BmBKqlbKGPatGQmJn5QjqT2ZyfZFz83lv6QA5NfDINmwDgkd3VYRjT4i/a55uHwPhFKKXJcDS8a8UGc23W5AW9KwS4avQsVu2D8S6JYPNsYCDBYZGG5O+h2hnJwl9g46PgbZthDsEpqe3EBgti2B4xuyyWdZ7vrGxblRXpIXxAQjQ7w0mTH2DtQA966C6xg90FCnnjXUShbzKxNmlwTtub2m08FZdRTYRP0otAnc4f/upMSqkOHCroToeiFrjY1OqZSBMoWQesIgNZG+cBOYfZmrX4oBR2VUA/Y+6iwZ+OxdudF7dSBJowjAvPMPzB/GW1KI7JkkGkdYM53/N4ARPBjyvRAICYwm+26zBEJ8aoyS4yqy3rL9lr+ugh18CXKxxLgw1N5DsJmdf8P9g1hR5OtpDU0vayCmWDJ9N/mBXt6ipusnFxoQuWaFZfLag+MNMEnMtNRgnFGIh3BxwExWsyYWzVPfRNSfAta/rLxAlrVZNu1/4/VJ/yzkWmc1Aj6oE/CWqgLF9EqZBUGuuIBUxOo4jNX1uTCRmVtglQginybWmDry3TCySbU+aBgFQdcolkXWcoTWVgzDbxVsbGLUBJ7UnmdtCIJ88grLug5TN8c1wFIbyCOfzhPPmJnN+klcYxZm/oswWrG7FhCoJZ8YcK8nJ364KYlfBAPuNjQV5BsMgpecAbLBYc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(23010399003)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTBFZ1hsNEtJblpaMGgybWpaNEVlcksxVWswZ09TTTZJMzJZbVE4WEdOSW5w?=
 =?utf-8?B?djY4MFp4QXBUSDFnTyszTkFFcWxyV2laVDZiR0dHTDJzc1Zha2w0RHZhNlF4?=
 =?utf-8?B?VUtnaWlBVHpLTmIxVjJPdHBqVUl6eFYwU25TT2F0WlBscit3Tzk3ZlhXQS9X?=
 =?utf-8?B?Mmw5Qmg3b293cXBpeGhrZjhTU0lZc1VuNkE2M2NHV0lSTjZMbTR3aUpsL1hT?=
 =?utf-8?B?MVROMFl5NDhuRHpqZkdWcVRFM3M3Wlg3eTBLUXNrM0piYmJhUGQybW5BNDZh?=
 =?utf-8?B?K20xUW5IVUpVbEY3NC9xTGc1cjNwalRrR05aa1pONkJ2SUVPTGlHUlpSY0hY?=
 =?utf-8?B?WkMzTG81K3lVaFBRelp0U0VUREsxdDArM280QXRKVG1TampIbG8wbkFnbVZs?=
 =?utf-8?B?VWFJdWx2MGk1Nk1odnZEUDRjTEVDS0dUaFlaMjdnT2pRc1dSS0pUMC90MVlM?=
 =?utf-8?B?azBOZWRJT3JWZnBYOHoyNHBGYUVOcWpubjBQRS9IbzBxRnRwclZha2ZkVDZB?=
 =?utf-8?B?MkFNZUlvU1hhaW8xUTJFeUhaKzFXQmdQcG9WNVhEN3p6bjdlWE9ET0VmZG9U?=
 =?utf-8?B?OWdkK3ozb0c2dkkzOHJ3eEo1QUNsT1k3Nmt2ekVyQ1dmMmxUZkVyOTE4c3Ex?=
 =?utf-8?B?bUZVdU5TVHY1VUl6Nm1ia2FBVDQwZE1VMGpVaEhBaExXZVN4WkxXT0t4ZVly?=
 =?utf-8?B?VHNGSXB5bnhYd01lSDNaV3FycTdXRU1zUjdOTVJDU1A1WXpqQldTcXVZbDdE?=
 =?utf-8?B?cVFOaVhYM3M5eTJidExoQ0RjeGxCamV4Z3RRcWd6dkNCL0JqN1V5TlVPWTZQ?=
 =?utf-8?B?UUJCR3BPM3A0aGg1SCtiKy9uM1dha2FhcHZpYm5wbU5MY1FZSUREZjkwaDR3?=
 =?utf-8?B?VU11Mkk2RjY3Zk1WZHZ1Rjl5NWF2YStOM2tyS082S3YySjNodE9DdVlNNW1K?=
 =?utf-8?B?N1QyUGVON1p2YkMyWjRIT3Rpa1pxTi9Wa3JtYmc4cUZrVFRLZ0IrTmFXcHNH?=
 =?utf-8?B?aU5qdk9lTU1jZ0MxWFhWL1Y3M01kM01weC82TG40YUFpTVA5T08yY1RRaEZx?=
 =?utf-8?B?bFhYcUl2blBKNWw2bnBEWlgzQ3RHaE4yQTJweFo5R2xBN1VNSjRCUXVYQzBs?=
 =?utf-8?B?UjdkMWFNTk1jdTBIUTFuUXh6NzRwUlR3NHBUeWdpVXhXRUZTKzlCVTZyb1F3?=
 =?utf-8?B?SzBGMGNYRHM3dlVxcUUwY0c4Nk5tVjRQSWlZbjZYSEF0cFJnYng4dmZHUGl4?=
 =?utf-8?B?VmJQV1o5Z3pyV1BOT09LRTJvR3RtNExYUERCWlN5Y1RDL1NEdVZWUjBUbnpz?=
 =?utf-8?B?NEZJbm1rdGxrNXU1UDdacmM4S0tCWk5teTltNE1ybWxyUlc5ZUQzUGMyODRt?=
 =?utf-8?B?NUNiOW1KQXpjQWp4WU1kR1ZVemNwNlF4N1dUUEtxZllDZCtyUHMvN2hlZE5x?=
 =?utf-8?B?dEpkbmQ4K2N5WjVJLzhSMWNHbURJY1NrMzMza0tTQXhzTzZHSVNQYkx1MHA0?=
 =?utf-8?B?akhQSjlLM21vMFNjbmdUQkI3NUdvZW03UjFEVVF5UWhMKy9wKzRBdGkwYkc2?=
 =?utf-8?B?Y3VJb281UUlOQ2hzeFc1ZWhmSG9lcE1VSUtQMFJYcTFwZ1JGdWpSeTEvK2xC?=
 =?utf-8?B?ZEhyWENUVkZqVDRJVzgwRllCWWNLRlltR2xJUHFrelZIeGJzUmdFZ2JpVlQ1?=
 =?utf-8?B?SUR2STI5emxsQ1d4cWVieEZPN3c1ck53QmM1ejV0UmU1eGJITmxXdjBUYzhL?=
 =?utf-8?B?MzJnS3NiQ0R0RHloZE9zZURBVnFjQ3owdVB0aUEvMGpoMlFBUWc4YThvYy9C?=
 =?utf-8?B?Wk4rTVEyOS9DUDFGbG93SE9OUHFvcWVEQStCem5odUw3dXZMY2ZoU1BybVg2?=
 =?utf-8?B?NnEvRm9uMjZRSjA1UW8xVTlaczgzK3NDQWh4MzZrVG1lcWJSd00yT29NUlJW?=
 =?utf-8?B?Zlpic2M0VGltNG81eVVwNEkrb1RZaGszem96TXdwbGRBWXJpWlBYTHBDSmZZ?=
 =?utf-8?B?TmpTdFJ6TnlYMG1Ia2lXNHlwTDd5dmZINW5LaFJDeFhWZ3VkSDJxZkFHekNq?=
 =?utf-8?B?QmJsU1daZXBxZ0UwSEpsMkxscnAzeUt6OVNZQmtxNlBqeitaNWx3a0s4NzY4?=
 =?utf-8?B?aWRmQkVwZXhVWlAvNEw2TVR5cnhwOWk0Y2diN3lQZlMrL1FlZzdSbTExbEg5?=
 =?utf-8?B?V1Btc1JmR014akp2NXlZZHA1TXhYUnZYQ0hCWkVQeitWbk1aNm9rRnZWNkRJ?=
 =?utf-8?B?d1lnODY5QjRobzVpeWU3TG9zcUZGd0tkTXFFdjBod0F6NElEUEszZjJxZWZq?=
 =?utf-8?B?UnlBcUtBNGh1a0JUNGVOdU5INFhWb29YOElTL1dmQmlVSTNtY3c4SVFWa09z?=
 =?utf-8?Q?dw3kETzPaPggbveM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B639700B2A67F945B30575F434ED4095@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d32759b-7390-4341-4ff9-08df262a30e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 17:24:36.0010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myrjhowcAjKJOsfulaFvJrhIKj+4KFPLRz+pL2NstY+C7r2Qakj0Jbb8b7QIREqu/64JcIkEFSc2b7JaChVeGp3+Rymuspv1XTKAiR1SDdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7373
X-purgate-ID: tlsNG-33051d/1791566677-77EC24E9-DC5BC314/0/0
X-purgate-type: clean
X-purgate-size: 2570

DQoNCk9uIDIvMi8yNiAxODoxNCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+IEtlZXAgYWxsIHRo
ZSBpbmZvIGFib3V0IEJBU0VSIHJlZ3MgaW4gaG9zdF9pdHMgc3RydWN0dXJlIHRvIGJlIGFibGUg
dG8gZWFzaWx5DQo+IGFjY2VzcyBpdCBsYXRlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE15a3l0
YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gv
YXJtL2dpYy12My1pdHMuYyAgICAgICAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKy0t
LS0tLQ0KPiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzLmggfCAxNCArKysr
KysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jIGIveGVu
L2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPiBpbmRleCBjNjI4OTU5ZjQyLi4yMzI4NTk1YTg1IDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+ICsrKyBiL3hlbi9hcmNo
L2FybS9naWMtdjMtaXRzLmMNCj4gQEAgLTQzMCwxNiArNDMwLDMyIEBAIHN0YXRpYyB2b2lkICpp
dHNfbWFwX2NiYXNlcihzdHJ1Y3QgaG9zdF9pdHMgKml0cykNCj4gICAvKiBUaGUgSVRTIEJBU0Ug
cmVnaXN0ZXJzIHdvcmsgd2l0aCBwYWdlIHNpemVzIG9mIDRLLCAxNksgb3IgNjRLLiAqLw0KPiAg
ICNkZWZpbmUgQkFTRVJfUEFHRV9CSVRTKHN6KSAoKHN6KSAqIDIgKyAxMikNCj4gICANCj4gK3N0
cnVjdCBpdHNfYmFzZXIgKml0c19nZXRfYmFzZXIoc3RydWN0IGhvc3RfaXRzICpod19pdHMsIHVp
bnQzMl90IHR5cGUpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ICsNCj4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IEdJVFNfQkFTRVJfTlJfUkVHUzsgaSsrICkNCj4gKyAgICB7DQo+ICsg
ICAgICAgIGlmIChHSVRTX0JBU0VSX1RZUEUoaHdfaXRzLT50YWJsZXNbaV0udmFsKSA9PSB0eXBl
KQ0KPiArICAgICAgICAgICAgcmV0dXJuICZod19pdHMtPnRhYmxlc1tpXTsNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICByZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgaXRzX21h
cF9iYXNlcih2b2lkIF9faW9tZW0gKmJhc2VyZWcsIHVpbnQ2NF90IHJlZ2MsDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2l0ZW1zKQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9pdGVtcywgc3RydWN0IGl0c19iYXNlciAqYmFz
ZXIpDQo+ICAgew0KPiAgICAgICB1aW50NjRfdCBhdHRyLCByZWc7DQo+ICAgICAgIHVuc2lnbmVk
IGludCBlbnRyeV9zaXplID0gR0lUU19CQVNFUl9FTlRSWV9TSVpFKHJlZ2MpOw0KPiAtICAgIHVu
c2lnbmVkIGludCBwYWdlc3ogPSAyOyAgICAvKiB0cnkgNjRLIHBhZ2VzIGZpcnN0LCB0aGVuIGdv
IGRvd24uICovDQo+ICsgICAgdW5zaWduZWQgaW50IHBhZ2Vfc2l6ZVs0XSA9IHtTWl80SywgU1pf
MTZLLCBTWl82NEssIFNaXzY0S307DQo+ICsgICAgdW5zaWduZWQgaW50IHBhZ2VzeiA9IDA7ICAg
IC8qIHRyeSA2NEsgcGFnZXMgZmlyc3QsIHRoZW4gZ28gZG93bi4gKi8NCg0KQ29tbWVudCBzYXlz
ICJ0cnkgNjRLIHBhZ2VzIGZpcnN0IiwgYnV0IHBhZ2VzeiBzdGFydHMgZnJvbSAwIChmcm9tIDRL
KS4NCg0KQW5kIHRoZXJlIGlzIGEgY2hlY2sgYXQgdGhlIGVuZCBvZiB0aGlzIGZ1bmN0aW9uOg0K
DQogICAgIGlmICggcGFnZXN6LS0gPiAwICkNCiAgICAgICAgIGdvdG8gcmV0cnk7DQoNCndoaWNo
IGRvZXNuJ3Qgd29yayBhdCBhbGwgd2hlbiBwYWdlc3ogPSAwOw0KDQpCUiwgRG15dHJvLg0K

