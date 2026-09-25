Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2B9C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 17:40:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434337.1654355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA9uW-0005x6-BQ; Fri, 25 Sep 2026 17:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434337.1654355; Fri, 25 Sep 2026 17:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA9uW-0005wx-84; Fri, 25 Sep 2026 17:40:36 +0000
Received: by outflank-mailman (input) for mailman id 1434337;
 Fri, 25 Sep 2026 17:40:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xA9uT-0005wr-Tm
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 17:40:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA9uS-00GUVu-Sb
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 19:40:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab6b209-bab6-0a2a0a5309dd-0a2a4503d696-14
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 19:40:32 +0200
Received: from [52.101.69.136]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab6b210-fae8-0a2a45030019-3465458851fa-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 19:40:32 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DB4PR03MB8754.eurprd03.prod.outlook.com (2603:10a6:10:37a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 17:40:29 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 17:40:29 +0000
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
 b=LLvUriqlmoujgWwxBDE5FxFMRs6QMve07VK4W+80LdUV0c/H+FdeRKkPDjEDnsbLQbXHK7QfLi5c/mKf51YGGsL5cQWnuuUcKnFtW8yoxbzirYXDPBZUNV3fu8A7E0GTZb6zWLmpoFu79XOCyjfYl+sd7Dzq1FGByjE6b/j8W1P8aZ7w6io5Ayex6w5LiqMCHy2PNeAlxx6ELRKmNurECZtXJTfE4W0qiAWIW9q7eeBzyYCF+AcbkBKghadTSNVxI+P+1mD49K/HdThWSbi/XU/JLpx1AgDXrcREeQucI7oUKNe5PvpHVVqKQ9tbAS/4sU6wugmM4N8IyLsnBK5hxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni2hvsCsFylIizY+btKJ48F/2zoo9N9NXpu+DLBqsZA=;
 b=wh16Zzz9tklchGvarKPG+J09MJ0ey5+eijbvaskob3hGeLiFe2SqHUFO7rT0MsGgua8LSwugFeFVXiTjeaHEm3lE+6QR7xnOS+sC4sCiVaKcu6dMfshbVBtbNRzDu3+tiC6Vq76E922Cy0Myor8RUmbPef8rGEUjx7f4YdU+rZorjsBU9Jogy4k0QNht73XK1lBJmei7zd8e2qu4oiTVtN+JPLMeBfKo4dZ779KZwwJsFKzPyeadSWqwoeFlsdKA8KytSgzXJCSPdC7+0KdRWtB3at8sVb7QpVehpSIqCwIhBjnP14RdVEgEEkwAnE+CMR743YwRA/oGmjWIG3JdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ni2hvsCsFylIizY+btKJ48F/2zoo9N9NXpu+DLBqsZA=;
 b=Vl/4X0VksXVujrDpdBpVtfHcldwbJ34/cwO53MEM39CCGm0eayPzkBSEB7chzqK4ZPuZBWUmjHTzDh3B+UjQRpIQLy9g3kThn22wnGGVNmPNpAzMLuZjSv3Yqq2MeJYEH90abejUVd7vR4XRpDJWHSQV/r0nxPjyktaJcNUJw2tVe3q34Hug/qbnAZ+h6O+9c22pae57yeXddq2cJhT/9V9WninjpSBqL7Z6mKochwPKZYpAVA73FHu/plJhxuw8rFSGW9daxTMCZ+9ZAWHZkaMERMkJSDpoH5xAfaHELmI7XgriNEWVF48Fdp/W327mOw+2fHPqRETyv75im8ReaA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 3/4] xen/arm: its: refactor ITS quirk matching
Thread-Topic: [PATCH v3 3/4] xen/arm: its: refactor ITS quirk matching
Thread-Index: AQHdSqtNwidRcqNdj0yo3wTLZbOD6Q==
Date: Fri, 25 Sep 2026 17:40:29 +0000
Message-ID: <87v77tz0tw.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<a9bccc7d8054244cdbe754fd16b8d2faba01af3f.1790089161.git.mykola_kvach@epam.com>
	<87cxu44y2q.fsf@epam.com>
	<CAGeoDV_jENgPvMTMAGbUOxc80H=z4GtmxRGSdTgXj1ym0Z1Wxw@mail.gmail.com>
In-Reply-To:
 <CAGeoDV_jENgPvMTMAGbUOxc80H=z4GtmxRGSdTgXj1ym0Z1Wxw@mail.gmail.com>	(Mykola
 Kvach's message of "Thu, 24 Sep 2026 08:00:00 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DB4PR03MB8754:EE_
x-ms-office365-filtering-correlation-id: f1ecd2dd-1625-45e7-7a36-08df1b2c1747
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|366016|1800799024|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 ICVoq3zz7tKJysBeAqVevljfH+Y4RdexUjjrbaOUGKtq/GmqhyMiHGano0AmoRQJNvUw2BtnUdDH7aCtZMynsQEhs77YwkUxX6VH9iQECqBM3n0RuRzDfZBm0TXfltNHCD89Nz+Rnwft4A5GGceCZSlQ/1M7e2yWaCFj9AcVpC+z3CD3+HFmY9G9WHk8LkSjY66HmfamZCBfiGiyzZkGmEQWRgQ2ceeIw5wL/4UKipymTpDB7xfJ8Orbw7FqTUA0gN/DwntyShz+IYtKhRO9zqJ/qWhifF9peSAuLtoa+ddugd2BRZv9du0NiFSkGaVcX2fVD2KhURVSk+0LxVJmoVMp9GeCdKEofhNYfC5O9pvPMCkXLHo30bz1mcsnWRC7b9afAy8bEufv38tHQQ7oIPXHw3C9h48fLVPy8hXv4Qh12nUtOJEaZTs4cuNJT88IucRm0MdJxlJ61GurSozWM4TBmsEZKKq5NzPZkejZRuZgFVu4oevw/jOi9a/EHpILC0NhhyxRhK0p3F/TbadszEzlHow57dwfSSRJzFnLNcEu5CI+KdD3TSihv/9bIuBWM5b7lm5+otndl+K8My35DE/9rdOImM1NQzB9PRnVoKeVSdKcxtXE4wYM2T6ZKQpK5WQIACnq/Q620K8lQDpbru8znWQazaS2TcLxRcj4doNm0AJhTxRTCLwax6OOCPIRIlupdrEwrZyhZn5H4vtp/isfQVD4RrgHkDqViscTexg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(366016)(1800799024)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RklHejZ1bTkybWVNUnl2d09FNTlwcG1JKzUrM09RZzJtT1lRUW5TNkNpTHZr?=
 =?utf-8?B?dDhRMVdwMjZETDJuNEJVVDdBY2krc3J2SW9jUFEyMmV0NzBWczVtQWZ2U1hu?=
 =?utf-8?B?KzVmdTRvS0tyMEJweG00VWwvVjVmZW9MbGhFWnJPYzQvU0tVVXhCMlgxRFVS?=
 =?utf-8?B?bU1CYWJrZzRFdjlzM25BdmhBZDZUazV4blRoV0FtYkZqY0xqcTZ4M1dSaWFt?=
 =?utf-8?B?bmM2RXVPbnJRWDErVloyak1mNWNueFIwcVpzcml5WUE5UGg4Szdnc01yNnNm?=
 =?utf-8?B?UjJGa2pnL0dIWmJydkFKNk1KdGxrQlhxVS80SEJZelQ2K0pDcXRnbm5rQk51?=
 =?utf-8?B?Nmw1RnBLN1M5aUdteFJ4RE9qWjh6RE5GMnhTaUQyZFM0d3lFOUpQRitqOE5Y?=
 =?utf-8?B?NXVrYSs3U3FLb0RlYnBhOTZ5dG9oV1ZzVzhheGszZUE4a2FJUWE3TndTRW9r?=
 =?utf-8?B?SVBGTnJ4bFplNHJ1WmpZRXBJSXNHSjVCRlJVVGl0Y1hucFY1MWlpMUp1LytC?=
 =?utf-8?B?VWhTc045SFRFWVF3UkExMktkaHlKeWNwYi9hd2hQSGhWS1d0M0hFS3J0bjlh?=
 =?utf-8?B?c3pZRmVMeS9udlpLazZ6Y2I3dUxTUE9NNkFic1YwNW9ia0ZQdnEraGdSYXkr?=
 =?utf-8?B?ZFFoaTVhcHNzQndQVW9ZSXU4ckNCeDY3NGYwem91MWhLMDdBZS9kRXBCOVA0?=
 =?utf-8?B?cWI1MEhMN0xPeEE0LzJNOGljbTB1SjJVZDhyNG5XbVN4bm1LS0EycWxmcUp3?=
 =?utf-8?B?bit1ay9xYWhHUTJyTnZFK0ZFWWFxZkxLQ3pHUSthU3VmVU5WNzRMT3VLZ3pX?=
 =?utf-8?B?dzV0NmdHSFcwUFo0Y1lxZnoxdHVOcUc0NUozTGZVdktwK3N6SUtmakx4Mm9y?=
 =?utf-8?B?VC9Td2hsY0VWZTBJU3lYSytEVXFPdXZrQ044L0dNaXdTa09iNnAwWG82RVNC?=
 =?utf-8?B?anN1S1VWK2JyYWxaNE5MMlJiVzVraUhQL1h3VkdORjE4MnFpeTJjV3lxRXZK?=
 =?utf-8?B?OFhMQmlyRi8rZzdScVZNK0JrczFWb3VmSUVZZTBlRzhMRjhsaVR4QjJyTU5a?=
 =?utf-8?B?T3hNS0ZYSDBKT2ZkSDNubkl5VkdwNjgwQUhPM0tUcUVHMXlCS2dnY0VRNFU4?=
 =?utf-8?B?SGVLMkhjeGx3UjNuRkRnSlZSTEFiTHhRTzFTTG96cGRKbEFKZWtXZWpSZS8x?=
 =?utf-8?B?QzFHUHJwWTl3Nm12OUt4OFhwNTM4OFNXQUlZcjdlaUUvQlB1R0J0alFUbnBW?=
 =?utf-8?B?Mjl6Tmt2ajJkMVFYRWxheXlrTnBieXFtTjV6aDJQYlplNHBDNVFqc2g1ZllP?=
 =?utf-8?B?U2lZSlhVMFBONk1JNmZ6dnVBOEdQRzIwR2NJMFlKaDR1ajVURFFINVp4cCsz?=
 =?utf-8?B?bi9jQlN5RmEzK1Z4L3M3T1kwMnV4ckt2dDZFRmZtV0hLNU1RTFBVbnhiY2dZ?=
 =?utf-8?B?eUpQYjJwU0xoY3BuaWwvZndNMEZwOWdVeXpTN291eUpZVXBvTGtmdnhRZEsz?=
 =?utf-8?B?bmNzeFlOOVNQVlU2KzNUZlJ5bEpBQlBXcHdCWVBLMzFWSER0YkViaTA2VnVJ?=
 =?utf-8?B?NlRUT0FJMGZYeVlxQi9wUS9KNDRTd3FscVVYK0JWWUNJSDAxa3RUTVQyOWRR?=
 =?utf-8?B?TnB5cDR0bjhsSHMrclU5WExKVDhONlBIdXFJaVU2QlBmcjV2Tm02SUswTGky?=
 =?utf-8?B?bjU2ZHE0ODJ4L2U5SDNsOEdDR0k4WWJhb0l5RWRROEp1Y080QXErU3BGcDhn?=
 =?utf-8?B?WTZkbVJXZk5lSk8yUnd5aGtHSHVoZjNKVnd2TGNrVUkyNC9DMjBaMVJDOGpU?=
 =?utf-8?B?d0lZUENlUXdyMzhvR3I3RC80ZlVlbXkzOEdWR29OUEVNTUhEeURHdklVOFpn?=
 =?utf-8?B?ZkJVbENCa0dvT2d6OUZJQ2tYcGpuaTZncS9oZjcrSFMyNngxaHhGamxLUTNY?=
 =?utf-8?B?c00wT2ord1Y5VnRXMUhBR2JraHZxcXhvYUplWERLcE9LWFlGZkMvUFlPalpG?=
 =?utf-8?B?WC9HcFVSc1BrUzc4Qnk3MERoZGRtZytvSis0NGZ6djBDWXhYbEd3bi9GSS9u?=
 =?utf-8?B?bjNjWFl6L3NaUHVOaUhuMjZlRGlKY2YzankyeXJxVkxjck1ZTkhjdkRiNEhX?=
 =?utf-8?B?UjhnYzZWRjMyUmRYaWJ0Y3pwZzNFd3pHVFhRakNnaXJ5MDBLSW1IM1BGQzFV?=
 =?utf-8?B?TXh2bE16Y0Y1OE9hVmVUVTlZSTlPRXhuV3Q3WWlEaFowWGR3bGtMc3hLSTVF?=
 =?utf-8?B?eDFITGphQm5jajFzSVJpd1J5TUFhM0NlNUZCQWNrWWw5eVBNdDRGUHVOMGVm?=
 =?utf-8?B?cWxzWXpVNkJGMFZtRjZRaC9pZE5BYmVpWERzVk1UYTAzTGx4VkpSODhBd2Va?=
 =?utf-8?Q?5iKEitmDmIlOL+g4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65C82F0A45C95A45B155DC87EB6AAA56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ecd2dd-1625-45e7-7a36-08df1b2c1747
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 17:40:29.2436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQUlLnTQ6lyT8wXL+roxbRISWGsmUEQUamp5xCJE0vrkkEy6fF9OwwtQNvEpLyrCXVmTY/hDkBq02hsO3XBhKDGGvzEIih5o4jEOm01SbKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8754
X-purgate-ID: tlsNG-33051d/1790358032-6D2D84E9-4621B054/0/0
X-purgate-type: clean
X-purgate-size: 7748

SGkgTXlrb2xhLA0KDQpNeWtvbGEgS3ZhY2ggPHhha2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyaXRl
czoNCg0KPiBPbiBXZWQsIFNlcCAyMywgMjAyNiBhdCAzOjIx4oCvQU0gVm9sb2R5bXlyIEJhYmNo
dWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPiB3cm90ZToNCj4+DQo+PiBIaSwNCj4+
DQo+PiBNeWtvbGEgS3ZhY2ggPG15a29sYV9rdmFjaEBlcGFtLmNvbT4gd3JpdGVzOg0KPj4NCj4+
ID4gSVRTIHF1aXJrcyBhcmUgbWF0Y2hlZCBvbmx5IGJ5IElJRFIgYW5kIG1hc2sgZmllbGRzIHN0
b3JlZCBpbiBlYWNoIHRhYmxlDQo+PiA+IGVudHJ5LiBUaGF0IGlzIHRvbyBjb2Fyc2Ugd2hlbiB0
aGUgc2FtZSBHSUMgSVAgYmxvY2sgYXBwZWFycyBvbiBzZXZlcmFsDQo+PiA+IHBsYXRmb3JtcyBi
dXQgYSB3b3JrYXJvdW5kIGlzIHZhbGlkIG9ubHkgZm9yIHNvbWUgb2YgdGhlbS4NCj4+ID4NCj4+
ID4gUmVwbGFjZSB0aGUgZml4ZWQgSUlEUiBmaWVsZHMgd2l0aCBhIGdlbmVyaWMgbWF0Y2goaHdf
aXRzLCBkYXRhKQ0KPj4gPiBjYWxsYmFjayBhbmQgYW4gb3BhcXVlIGRhdGEgcG9pbnRlci4gQWRk
IGFuIElJRFIgbWF0Y2hlciBhcyBhIHJldXNhYmxlDQo+PiA+IGJ1aWxkaW5nIGJsb2NrIGFuZCB1
c2UgaXQgZnJvbSB0aGUgUi1DYXIgR2VuNCBtYXRjaGVyIGFmdGVyIGNoZWNraW5nIHRoZQ0KPj4g
PiBSZW5lc2FzIG1hY2hpbmUgY29tcGF0aWJsZXMuDQo+PiA+DQo+PiA+IFRoaXMgaW50ZW50aW9u
YWxseSBuYXJyb3dzIHRoZSBSLUNhciBHZW40IHF1aXJrLiBQcmV2aW91c2x5IGV2ZXJ5IElUUw0K
Pj4gPiB3aXRoIElJRFIgMHgwMjAxNzQzYiBtYXRjaGVkLiBOb3cgaXQgbWF0Y2hlcyBvbmx5IGEg
RFQtZGlzY292ZXJlZCBJVFMgb24NCj4+ID4gYW4gcjhhNzc5ZjAgb3IgcjhhNzc5ZzAgbWFjaGlu
ZS4gQUNQSS1kaXNjb3ZlcmVkIElUU2VzIGFuZCB0aGUgc2FtZSBJSURSDQo+PiA+IG9uIG90aGVy
IHBsYXRmb3JtcyBubyBsb25nZXIgbWF0Y2guDQo+PiA+DQo+PiA+IEtlZXAgZmlyc3QtbWF0Y2gg
c2VtYW50aWNzIGV4cGxpY2l0LiBBc3NlcnQgdGhhdCBub24tc2VudGluZWwgZW50cmllcw0KPj4g
PiBwcm92aWRlIGEgbWF0Y2hlciBhbmQgdGhhdCBJSURSIG1hdGNoaW5nIHJlY2VpdmVzIG1hdGNo
IGRhdGEuIFJldGFpbg0KPj4gPiBydW50aW1lIGd1YXJkcyBzbyBtYWxmb3JtZWQgZW50cmllcyBj
YW5ub3QgY2F1c2UgYSBOVUxMIGZ1bmN0aW9uIGNhbGwNCj4+ID4gb3IgZGF0YSBkZXJlZmVyZW5j
ZSBpbiBub24tZGVidWcgYnVpbGRzLiBQbGFjZSB0aGUgbWF0Y2hlciBkYXRhIGFuZA0KPj4gPiB0
YWJsZSBpbiBpbml0LW9ubHkgcmVhZC1vbmx5IHNlY3Rpb25zLg0KPj4gPg0KPj4gPiBUaGUgbWF0
Y2hlZCBlbnRyeSBzdGlsbCBzdXBwbGllcyBzZXBhcmF0ZSBJVFMgYW5kIExQSSBmbGFnczsgdGhp
cyBwYXRjaA0KPj4gPiBvbmx5IGNoYW5nZXMgaG93IHRoZSBlbnRyeSBpcyBzZWxlY3RlZC4NCj4+
ID4NCj4+ID4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5j
b20+DQo+PiA+IC0tLQ0KPj4gPiBDaGFuZ2VzIGluIHYzOg0KPj4gPiAtIERvY3VtZW50IHRoZSBp
bnRlbnRpb25hbCBuYXJyb3dpbmcgb2YgdGhlIFItQ2FyIEdlbjQgbWF0Y2guDQo+PiA+IC0gQWRk
IHRoZSBub24tZGVidWcgTlVMTC1kYXRhIGd1YXJkLg0KPj4gPiAtIFB1dCB0aGUgbWF0Y2hlciBk
YXRhIGFuZCB0YWJsZSBpbiBpbml0LW9ubHkgcmVhZC1vbmx5IHNlY3Rpb25zLg0KPj4gPg0KPj4g
PiBDaGFuZ2VzIGluIHYyOg0KPj4gPiAtIFJlcGxhY2UgdjEncyBvcHRpb25hbCBwbGF0Zm9ybSBj
YWxsYmFjayBwbHVzIGZpeGVkIElJRFIvbWFzayBmaWVsZHMNCj4+ID4gICB3aXRoIGEgc2luZ2xl
IGdlbmVyaWMgbWF0Y2goaHdfaXRzLCBkYXRhKSBzZWxlY3Rvci4NCj4+ID4gLSBBZGQgYSByZXVz
YWJsZSBJSURSIG1hdGNoZXIgYW5kIHVzZSBpdCBhZnRlciB0aGUgUi1DYXIgR2VuNA0KPj4gPiAg
IG1hY2hpbmUtY29tcGF0aWJsZSBjaGVja3MuDQo+PiA+IC0gRG9jdW1lbnQgdGhhdCB0aGUgUi1D
YXIgR2VuNCBxdWlyayByZW1haW5zIERULW9ubHkuDQo+PiA+IC0gS2VlcCB0aGUgc3BsaXQgSVRT
IGFuZCBob3N0IExQSSBxdWlyayBzY29wZXMgd2hlbiBhcHBseWluZyB0aGUgbWF0Y2hlZA0KPj4g
PiAgIGVudHJ5Lg0KPj4gPiAtIERvY3VtZW50IGZpcnN0LW1hdGNoIG9yZGVyaW5nIGluIHRoZSBs
b29rdXAgcGF0aCBhbmQgZ3VhcmQgYWdhaW5zdA0KPj4gPiAgIGVudHJpZXMgd2l0aG91dCBhIG1h
dGNoIGNhbGxiYWNrIG9yIElJRFIgbWF0Y2ggZGF0YS4NCj4+ID4gLS0tDQo+PiA+ICB4ZW4vYXJj
aC9hcm0vZ2ljLXYzLWl0cy5jIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tDQo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pDQo+PiA+DQo+PiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5j
IGIveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPj4gPiBpbmRleCA0NTRmZDBlMGVmLi5mNTIy
MzJjYTQwIDEwMDY0NA0KPj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+PiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4+ID4gQEAgLTU0LDggKzU0LDggQEAg
c3RydWN0IGl0c19kZXZpY2Ugew0KPj4gPg0KPj4gPiAgc3RydWN0IGl0c19xdWlyayB7DQo+PiA+
ICAgICAgY29uc3QgY2hhciAqZGVzYzsNCj4+ID4gLSAgICB1aW50MzJfdCBpaWRyOw0KPj4gPiAt
ICAgIHVpbnQzMl90IG1hc2s7DQo+PiA+ICsgICAgYm9vbCAoKm1hdGNoKShjb25zdCBzdHJ1Y3Qg
aG9zdF9pdHMgKmh3X2l0cywgY29uc3Qgdm9pZCAqZGF0YSk7DQo+PiA+ICsgICAgY29uc3Qgdm9p
ZCAqZGF0YTsNCj4+ID4gICAgICB1aW50MzJfdCBpdHNfZmxhZ3M7DQo+PiA+ICAgICAgLyoNCj4+
ID4gICAgICAgKiBscGlfZmxhZ3MgYXJlIE9SZWQgaW50byB0aGUgZ2xvYmFsIGhvc3QgTFBJIHBv
bGljeSBhbmQgbXVzdCBvbmx5DQo+PiA+IEBAIC02NSwxMSArNjUsNTIgQEAgc3RydWN0IGl0c19x
dWlyayB7DQo+PiA+ICAgICAgdWludDMyX3QgbHBpX2ZsYWdzOw0KPj4gPiAgfTsNCj4+ID4NCj4+
ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrIGl0c19xdWlya3NbXSA9IHsNCj4+ID4g
K3N0cnVjdCBpdHNfcXVpcmtfbWF0Y2hfaWlkciB7DQo+PiA+ICsgICAgdWludDMyX3QgaWlkcjsN
Cj4+ID4gKyAgICB1aW50MzJfdCBtYXNrOw0KPj4gPiArfTsNCj4+ID4gKw0KPj4gPiArc3RhdGlj
IGJvb2wgX19pbml0IGdpY3YzX2l0c19tYXRjaF9paWRyKGNvbnN0IHN0cnVjdCBob3N0X2l0cyAq
aHdfaXRzLA0KPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHZvaWQgKmRhdGEpDQo+PiA+ICt7DQo+PiA+ICsgICAgY29uc3Qgc3RydWN0IGl0c19xdWly
a19tYXRjaF9paWRyICptYXRjaDsNCj4+ID4gKyAgICB1aW50MzJfdCBpaWRyOw0KPj4gPiArDQo+
PiA+ICsgICAgQVNTRVJUKGRhdGEpOw0KPj4gPiArDQo+PiA+ICsgICAgaWYgKCAhZGF0YSApDQo+
PiA+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+DQo+PiBJdCBsb29rcyBzdHJhbmdlIHRvIGhh
dmUgYm90aCBBU1NFUlQgYW5kIHRoZW4gdGhpcyBjaGVjay4NCj4+DQo+PiBNYXliZSBpdCBpcyB3
b3J0aCB0byByZW1vdmUgQVNTRVJUIGFuZCBwcmludCBhIHdhcm5pbmcgaW4gYSBkZWJ1ZyBidWls
ZCBpbnN0ZWFkPw0KPg0KPiBUaGUgQVNTRVJUIGNhdGNoZXMgYSBwcm9ncmFtbWluZyBlcnJvciBp
biB0aGUgc3RhdGljIHF1aXJrIHRhYmxlIGluDQo+IGRlYnVnIGJ1aWxkcywgd2hpbGUgdGhlIGV4
cGxpY2l0IE5VTEwgY2hlY2sgcHJldmVudHMgYSBkZXJlZmVyZW5jZQ0KPiB3aGVuIGFzc2VydGlv
bnMgYXJlIGRpc2FibGVkLg0KPg0KPiBIb3dldmVyLCByZXR1cm5pbmcgZmFsc2Ugc2tpcHMgYSBw
b3RlbnRpYWxseSByZXF1aXJlZCB3b3JrYXJvdW5kLA0KPiB3aGljaCBjb3VsZCBjYXVzZSBhIGxl
c3Mgb2J2aW91cyBmYWlsdXJlIGxhdGVyLiBUaGlzIGFsc28gcmFpc2VzIHRoZQ0KPiBxdWVzdGlv
biBvZiB3aGV0aGVyIGNvbnRpbnVpbmcgaXMgYXBwcm9wcmlhdGUgaW4gbm9uLWRlYnVnIGJ1aWxk
cy4NCj4NCj4gV291bGQgeW91IHByZWZlciB0aGUgZGVidWcgd2FybmluZyB5b3Ugc3VnZ2VzdGVk
LCBrZWVwaW5nIEFTU0VSVA0KPiB3aXRoIGFuIGFkZGl0aW9uYWwgd2FybmluZyBpbiBub24tZGVi
dWcgYnVpbGRzLCBvciB1c2luZyBCVUdfT04oIWRhdGEpDQo+IHRvIHN0b3AgaW1tZWRpYXRlbHkg
aW4gYWxsIGJ1aWxkcz8NCg0KVGhpbmtpbmcgYWJvdXQgdGhpcy4uLiBZZXMsIEkgYmVsaWV2ZSB0
aGF0IHNob3VsZCBiZSBCVUdfT04oKQ0KDQo+DQo+Pg0KPj4gPiArDQo+PiA+ICsgICAgbWF0Y2gg
PSBkYXRhOw0KPj4gPiArICAgIGlpZHIgPSByZWFkbF9yZWxheGVkKGh3X2l0cy0+aXRzX2Jhc2Ug
KyBHSVRTX0lJRFIpOw0KPj4gPiArDQo+PiA+ICsgICAgcmV0dXJuIChpaWRyICYgbWF0Y2gtPm1h
c2spID09IG1hdGNoLT5paWRyOw0KPj4gPiArfQ0KPj4gPiArDQo+PiA+ICtzdGF0aWMgYm9vbCBf
X2luaXQgZ2ljdjNfaXRzX21hdGNoX3F1aXJrX2dlbjQoY29uc3Qgc3RydWN0IGhvc3RfaXRzICpo
d19pdHMsDQo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgdm9pZCAqZGF0YSkNCj4+ID4gK3sNCj4+ID4gKyAgICBpZiAoICFod19pdHMtPmR0
X25vZGUgKQ0KPj4gPiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiA+ICsNCj4+ID4gKyAgICBp
ZiAoICFkdF9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInJlbmVzYXMscjhhNzc5ZjAiKSAmJg0KPj4g
PiArICAgICAgICAgIWR0X21hY2hpbmVfaXNfY29tcGF0aWJsZSgicmVuZXNhcyxyOGE3NzlnMCIp
ICkNCj4+ID4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gPiArDQo+PiA+ICsgICAgcmV0dXJu
IGdpY3YzX2l0c19tYXRjaF9paWRyKGh3X2l0cywgZGF0YSk7DQo+Pg0KPj4gRG8geW91IHJlYWxs
eSBuZWVkIHRvIG1hdGNoIElJRFIgaW4gdGhpcyBjYXNlPyBZb3UgYWxyZWFkeSBrbm93IHRoYXQN
Cj4+IHBsYXRmb3JtIHJlcXVpcmVzIHRoZSBxdWlyay4NCj4NCj4gSSB3b3VsZCBwcmVmZXIgdG8g
cmV0YWluIHRoZSBJSURSIGNoZWNrLiBUaGUgbWFjaGluZSBjb21wYXRpYmxlIGRvZXMNCj4gbm90
IGlkZW50aWZ5IHRoZSBleGFjdCBJVFMgdmFyaWFudCBhbmQgcmV2aXNpb24uIEtlZXBpbmcgYm90
aCBjaGVja3MNCj4gcHJlc2VydmVzIHRoZSBleGlzdGluZyBJSURSIHJlc3RyaWN0aW9uIHdoaWxl
IG5hcnJvd2luZyB0aGUgbWF0Y2ggdG8NCj4gdGhlIGFmZmVjdGVkIHBsYXRmb3Jtcy4NCj4NCj4g
TGludXggYWxzbyB1c2VzIGJvdGggY2hlY2tzIGZvciB0aGUgUi1DYXIgR2VuNCBETUEzMiB3b3Jr
YXJvdW5kOg0KPiB0aGUgcXVpcmsgZW50cnkgbWF0Y2hlcyBJSURSIDB4MDIwMTc0M2Igd2l0aCBt
YXNrIDB4ZmZmZmZmZmYsIGFuZA0KPiBpdHNfZW5hYmxlX2RtYTMyKCkgYWRkaXRpb25hbGx5IGNo
ZWNrcyB0aGUgbWFjaGluZSBjb21wYXRpYmxlLg0KDQpPa2F5IHRoZW4uDQoNClsuLi5dDQoNCi0t
IA0KV0JSLCBWb2xvZHlteXI=

