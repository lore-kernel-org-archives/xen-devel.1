Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B4CA600A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:49:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443063.1660450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjo2-0002Kf-IN; Thu, 08 Oct 2026 08:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443063.1660450; Thu, 08 Oct 2026 08:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjo2-0002KY-Fd; Thu, 08 Oct 2026 08:48:50 +0000
Received: by outflank-mailman (input) for mailman id 1443063;
 Thu, 08 Oct 2026 08:48:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xEjo1-0002KQ-Gn
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:48:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEjo0-004p7f-HE
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:48:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ac758ed-e002-0a2a0a5209dd-0a2a45018cd0-30
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:48:48 +0200
Received: from [52.101.83.108]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ac758ef-5984-0a2a45010019-3465536cab26-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:48:48 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9178.eurprd03.prod.outlook.com
 (2603:10a6:102:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 08:48:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 08:48:43 +0000
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
 b=krvh39CFNZ65y0sKVCVSF1vvWSsuzchXg6XPq07gjhV3BN+Ikg75zuZcorm87AccT5eIWhc8qcfuoxnY4DdR+80XrQiCG3xxbuAxe/l9mi3G3AcDqYxqI3LebUPam1yFLuKphyE8Xa0ht0o1DhpRqQ10BbJj7GcBblfjA83nEA54yrQmqBFxpVgVJhXFrKGhUuxPDcXx3rN8sO58Z7VtA4Ms4pemPmNhR3Xkd+QmV9LRcw08UpGhRqun7QXBByHrZsa0jkAjhSR4e4/Xv45osSQEYa4+BfNiTxHaiz4hWqWCRFvslErhgVG3UmIZPJbOH5qP1ghCoXLYTPvbav0zpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mS4FDbP6ENKZD64FEZ8XvAoAMwqSYYfUVdgtbLP0wE=;
 b=NaNdi4JzoSW1+MGmAqEEEn2TV3C9whHelXvoI2Jy1tOJAlpZmBWKgnGOQiw7hLzdbwyQ2ijM4ueOOuYeMUw0JenZ688epsBJ1LOTr/rl2W+/fj2XZZO6QFklQxg7bxKALQqBClsFNSOFeWqypDhCoXfmeY3Qb38W3BV7QDWELRAZUZcZfb60BlEHl+FaLLOcp+5k0DSSfhCFr+ZHy5Us9UUjUvCZJKbyzul8QygzKOsRxgjDPJerbu7TQC/EkMafR0yhcawEbqonv5BgSxSs3ty9D/OHF43WJhku9ZksGUwkB+N5d+6p6m5+sQ2vlafRzVS6QGl0MwJjtoHx1CYc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mS4FDbP6ENKZD64FEZ8XvAoAMwqSYYfUVdgtbLP0wE=;
 b=hUFFRafNFuCtAXSIOHAClWU8+xXk3dE9t236+kb4Hsxg4inVyDGMXU2jvTJFo5dC95w0FLtOWyc/cXfQlm2pHsPteqUKpqnQP2X1MWwh0SoFGyRSJnwxQ/Qq4OmrJS24lbnDS1IlYPYumcd9cIwT8nxNiZ3pTogIisLPJDeLNLe5M9oi/UyXcZN7qDDtFyCsJSHKYIJ0KGGghPF5PBUGTPYuu3nHg88Ad7aprBXjmszi9l5Hx8Jjfqfwgb6GXGfyI7fbRgCW3n6YjxMRL5NHiE3fHMPKraVBCehNIfeIBs0YtYoKn9GJG2Gh2VNv635bJ3QNpSPvsDv+dVFksPY/kA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v9 6/6] docs: Document CPU hotplug
Thread-Index: AQHdLu5YUFC+BXJe80SorzYjSmg7ErbzpccA
Date: Thu, 8 Oct 2026 08:48:43 +0000
Message-ID: <6b106b71-cc16-420e-9466-91246fc06dc6@epam.com>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
 <70484b3362f3b816bf4ed5f70c374c198a8a6eea.1787042017.git.mykyta_poturai@epam.com>
 <87bj9q84w5.fsf@epam.com>
In-Reply-To: <87bj9q84w5.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9178:EE_
x-ms-office365-filtering-correlation-id: 59e5ed58-2b77-43e4-3b8d-08df2518f565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|260925021911599003|56012099006|260925021311599003|260925022911599003|10067099003|4143699003|38070700021|11063799006;
x-microsoft-antispam-message-info:
 HiwbeQf5Rb61el2+owJOCu2KhWoZ0MWnMJB3ZFZeDS/CeIBeQyZQYhWBr27xF9GDNHYMz1MWMvbzNbP42HbIVRztW5ZK/xrj5iTr176cD+2zpd+cx3ynCliHu1odIpWnkvmm9XUbyr30/bw3aT4hOWbGVpQAjrhc22Dpbixnx6U+ixd2ukRLXuMwo/ZTc68FTgpSrg6MmC4PcPmkjGHktqjDDFMQatfCZwbmsr/8Gq2ytSp2Wl32xUfFMUuXWrUgMRlLoUNi7kG2PNSh97BtDIJ7SLVr79Wr0hxMyXBGIFdCOSHGy1YTiE1/BBpgj06NwHWJD7MMicErN5Sxb0OYjF13f/BTeouuAldBxPONTW7YTJjfOijR8P71SsZ2Ldg22NiDpIWkfOdti+fyQ5QU0ztyjnbknID+ig7F8AfIy+/qycJnPtaAZ+lgKOWtLbiYWfBJVtwgCOp1Qtmm26rZ0MZd2sW4ZFl5LDWtBKZ0mcFGots5kPVnWEl1JgPWeZ9YmpohiuYC9lVFaruQSgzm6SIUXGcQEbuO0g6igMwaCiwHe9LmGH+McVWguUwHDBB8lkrIA2bYhSnPPQbYxNi9zDY9/kOogHu/4SCIfOKX+S/9H1178ELktw/O3FQVYZ+0oNc/XmMuBlVKyPCoHrR/GtW/gxSDWoRbgqbRjmEsSBk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(260925021911599003)(56012099006)(260925021311599003)(260925022911599003)(10067099003)(4143699003)(38070700021)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1VySFpZUGcwaUowZEs1VXN4RHN1akdpdC9neTJHSEk1M1crL21xM1dDOXQ2?=
 =?utf-8?B?QVpYN1lCWnpzdklYMmdRWEo2Zy9sSGFBdld6ZmN4YUZBclUxQmkxYjBRWUFa?=
 =?utf-8?B?TUIxaTdNL015RzdjdjF0bGwzVDRHZzlGT0hXYXFxRlI3UEppUUtBdzRacXdN?=
 =?utf-8?B?WVpSL3hKY3lIRktUKytYWWhHSEJtZzFGK0MzWnA0UXBycktIYWVPU2pTa0hr?=
 =?utf-8?B?SWYxN0tnTzNTUmo1TUdqcm80V05CKzJFZkEvV2E5NGN4VDN3MnJad1JWRWpM?=
 =?utf-8?B?K2x5ZHBCUFQ0VVN3TXUwbEN0akllbXFMYlY3ZU9jd2hmZGUwK1RxQjhCc1A2?=
 =?utf-8?B?NEduZlRxUGVxZ0dOTXAybHppWUdONU04cTY2UUU5L0RFcnNYamJJTWVZK2hM?=
 =?utf-8?B?U0IySXZUaFhiRUJpSWtHc3ZOSXcyK3FpTlR6R04xcU5IUFFmaTNkMTZiUFZy?=
 =?utf-8?B?K3pqeW9Sc2F6cTFYTk1uZklXZUFYUmc5NlR1anF6dFhSMDdrOSt3VkVVcGNx?=
 =?utf-8?B?dkdTY0YvemkyUThrSGFuekVMU2NyQk1vaGZvbGZpYkx0VytLYm1aa045MVNP?=
 =?utf-8?B?aUZVcWJyd2Nic2c0UERnS0lVeWxqY0Z5eU91NHJRcW53b1JjMXdyWkJSdFJJ?=
 =?utf-8?B?VUh0RkZnaGJuNFhacWZudjVPY3JHVXJrK0o5alNTaEtDNEpoSDJOMHdpd1I4?=
 =?utf-8?B?TC9RMmwreFI0T0hoQ3ZEeHhJRCtMYlRCOHVVbDNCaFRFdUxaK0RyVUU1cTFV?=
 =?utf-8?B?SkhLY1NUU0psRlRlaTFPREFCb2NUOHQ1QzVMRDN6NURYN3lmOFpyemZnRzZV?=
 =?utf-8?B?WFFXY2MybmRVNzdaQmlIYXRPQzdqT1k0OXNEZDhBcjNVZDB2Qzk1NXdWSVZR?=
 =?utf-8?B?am5JWWNLK0RWQlUvczZHbG50WTA2dWJDd1kxZ0J4amxhSGNtdkthQ3I1VjVt?=
 =?utf-8?B?dzVFYURXVTVNeEZIYXpCdjhINlZxNENnWFExMHZ1OS9NNE9uV1o3a0p1dFVG?=
 =?utf-8?B?QzFlUGxwMlVFVEZYVk90U1lxV2dwMlBqbDhHNi94RWd0LzNpb0FkbnI5cURO?=
 =?utf-8?B?dktoYWJHek5MRmVCc3RQeitvNzhTZ1dPTllBL1dsVEZKUHhnYUkramtpc1RQ?=
 =?utf-8?B?NmtmdGdVNEtXaDVHVkc3N1ZsanNqaE0wZmxhY2FLaEhIVDNtUjN2RWV4VU5r?=
 =?utf-8?B?a2dKZzhKWitwZmV1WmgzcjZlTVlBWjNCYXI4U2plYUx4aENjaGx6bFQ1ejk0?=
 =?utf-8?B?UmU1TjNsdUVLWnJDdHdoSzg5LzFkZVFwTlhqNnhmbkJ2UkQrQU0zL2d2M0Jj?=
 =?utf-8?B?eEsrbkpHTUVMWlREL1lQcXE2YnJhb2pBYVloZ3c0YmtaYmY3cGJWVEQwaEV5?=
 =?utf-8?B?WStYMVlGV0k2UzVHei9jU2JVNXlNSjlBU3NlMHBEUE9qRThKajh1aFhac3lB?=
 =?utf-8?B?T0tFT2tRSDIrVnh4NVRZd3dnb3lnc1RwT1ZjVkl1L05xZzYrcnl5MUFwbGZh?=
 =?utf-8?B?T1VmS1JuaUpHQVZZT1hEMW5GK1QwTENpQzhHZGMvbHNOQVR2WnFVdDE4MDJO?=
 =?utf-8?B?d096Tm9BQWJoRmZNaFNWTWNPRCswcjhUOW1abFZnQWttMGp0eE9sRFRPb3B4?=
 =?utf-8?B?MkpIWDAzYUVJTHdld3FlVE5JSXRSN1ExQ3B2aHhBT1paaUVCMDdXcUNnQlZJ?=
 =?utf-8?B?elRNTThjbmx6WFpPTFhPaGxhMFF5N2ZIYVArNlFnazJkTHJBSGZXeTFaU2Y3?=
 =?utf-8?B?L0xLdDZnWThRTnRkcVdENWtUOHFKZ2RqRGJRV3dTTzVjUDZndWkyYjJhQ3hh?=
 =?utf-8?B?SXQvNFdabFhmdzNWa3ZpTG1kWklLVjE0UUt1NWpRYmxPeWtPTWNFNzZQamJC?=
 =?utf-8?B?cnBvVC80WjQ0WlpjbmpKa0xTWk0rZytJODZDWkJvQytPZmFGWkcrVzJnalBn?=
 =?utf-8?B?UzlRTGhucjYxUE91dVFoNWtBQklwOU1Hc2pQYVkwZFNGdFpFb3hSZ2ZmTjhE?=
 =?utf-8?B?NGxsM2kzcVhyclJMZHZCdEhvQ0xTRTRJaWtzQVhBaW9zUVVOSEdUdlpQY0tw?=
 =?utf-8?B?U2FuTVd6ZEtKZlVRMk44VFV0aGtvKzcxSy9Kdk50YTFrZXlNNlJNQVM1UnFF?=
 =?utf-8?B?clhCTFcwZ1NEaEUvVzlnVTJ4djR0WFlKcXVKTUh1QklRQXlsOStPdTFFb0py?=
 =?utf-8?B?cit5U0ZHQ2Q0Qjl5MXZMbVc3cEtVNTkyOFFHbFBTTTJIT01lTnduMGdlQURy?=
 =?utf-8?B?VWRyRmpGeEMyd1l0YlEydmszaFZnR0Y3N3VNb2RCR0pNeDJoc3dGVnM3V2xn?=
 =?utf-8?B?WmhNQmFRT1VLKzRjUnRSS2NGQlJzdjd5SG42RFdzbmZGZ3RrZldrbDlFRllv?=
 =?utf-8?Q?I93FUQvkDzIg+/Nw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5419398F4B46A74A8948CD1F47B34452@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e5ed58-2b77-43e4-3b8d-08df2518f565
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 08:48:43.5783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dc1eI3O2HCelQpb08kJfUi3ghTjbxz+GcZYPcr1I8H+JzDm0NgIuEsZ0cV3Z9dANgz2AoLzgpkZEaDWYoHkqGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9178
X-purgate-ID: tlsNG-d62444/1791449328-C495A757-6908EB13/0/0
X-purgate-type: clean
X-purgate-size: 4758

T24gOS8yMi8yNiA0OjEzIEFNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4gSGksDQo+IA0K
PiBNeWt5dGEgUG90dXJhaSA8TXlreXRhX1BvdHVyYWlAZXBhbS5jb20+IHdyaXRlczoNCj4gDQo+
IEkgaGF2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbnMsIHBsZWFzZSBzZWUgYmVsb3cNCj4gDQo+PiBT
aWduZWQtb2ZmLWJ5OiBNeWt5dGEgUG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQo+
PiAtLS0NCj4+IHY4LT52OToNCj4+ICogZml4IHR5cG9zDQo+Pg0KPj4gdjctPnY4Og0KPj4gKiBy
ZW1vdmUgc3VwcG9ydCBzdGF0dXMgdXBkYXRlDQo+PiAqIHVwZGF0ZSBjb25maWcgb3B0aW9uIG5h
bWUNCj4+DQo+PiB2Ni0+djc6DQo+PiAqIGFkZCB0ZXN0aW5nIGFuZCBsaW1pdGF0aW9ucw0KPj4N
Cj4+IHY1LT52NjoNCj4+ICogbm8gY2hhbmdlcw0KPj4NCj4+IHY0LT52NToNCj4+ICogcy9zdXBw
b3J0ZWQvaW1wbGVtZW50ZWQvDQo+PiAqIHVwZGF0ZSBTVVBQT1JULm1kDQo+Pg0KPj4gdjMtPnY0
Og0KPj4gKiB1cGRhdGUgY29uZmlndXJhdGlvbiBzZWN0aW9uDQo+Pg0KPj4gdjItPnYzOg0KPj4g
KiBwYXRjaCBpbnRyb2R1Y2VkDQo+PiAtLS0NCj4+ICAgZG9jcy9taXNjL2NwdS1ob3RwbHVnLnR4
dCB8IDk4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9j
cy9taXNjL2NwdS1ob3RwbHVnLnR4dA0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvY3B1
LWhvdHBsdWcudHh0IGIvZG9jcy9taXNjL2NwdS1ob3RwbHVnLnR4dA0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLjRmNjA2OGRiMzANCj4+IC0tLSAvZGV2L251
bGwNCj4+ICsrKyBiL2RvY3MvbWlzYy9jcHUtaG90cGx1Zy50eHQNCj4+IEBAIC0wLDAgKzEsOTgg
QEANCj4+ICtDUFUgSG90cGx1Zw0KPj4gKz09PT09PT09PT09DQo+PiArDQo+PiArQ1BVIGhvdHBs
dWcgaXMgYSBmZWF0dXJlIHRoYXQgYWxsb3dzIHBDUFUgY29yZXMgdG8gYmUgYWRkZWQgdG8gb3Ig
cmVtb3ZlZCBmcm9tIGENCj4+ICtydW5uaW5nIHN5c3RlbSB3aXRob3V0IHJlcXVpcmluZyBhIHJl
Ym9vdC4gSXQgaXMgaW1wbGVtZW50ZWQgb24geDg2IGFuZCBBcm02NA0KPj4gK2FyY2hpdGVjdHVy
ZXMuDQo+PiArDQo+PiArSW1wbGVtZW50YXRpb24gRGV0YWlscw0KPj4gKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4+ICsNCj4+ICtDUFUgaG90cGx1ZyBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHRo
ZSBgWEVOX1NZU0NUTF9DUFVfSE9UUExVR18qYCBzeXNjdGwgY2FsbHMuDQo+PiArVGhlIHNwZWNp
ZmljIGNhbGxzIGFyZToNCj4+ICsNCj4+ICstIGBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX09OTElO
RWA6IEJyaW5ncyBhIHBDUFUgb25saW5lDQo+PiArLSBgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19P
RkZMSU5FYDogVGFrZXMgYSBwQ1BVIG9mZmxpbmUNCj4+ICstIGBYRU5fU1lTQ1RMX0NQVV9IT1RQ
TFVHX1NNVF9FTkFCTEVgOiBFbmFibGVzIFNNVCB0aHJlYWRzICh4ODYgb25seSkNCj4+ICstIGBY
RU5fU1lTQ1RMX0NQVV9IT1RQTFVHX1NNVF9ESVNBQkxFYDogRGlzYWJsZXMgU01UIHRocmVhZHMg
KHg4NiBvbmx5KQ0KPj4gKw0KPj4gK0FsbCBjb3JlcyBjYW4gYmUgZGlzYWJsZWQsIGFzc3VtaW5n
IGhhcmR3YXJlIHN1cHBvcnQsIGV4Y2VwdCBmb3IgdGhlIGJvb3QgY29yZS4NCj4+ICtTeXNjdGwg
Y2FsbHMgYXJlIHJvdXRlZCB0byB0aGUgYm9vdCBjb3JlIGJlZm9yZSBkb2luZyBhbnkgYWN0dWFs
IHVwL2Rvd24NCj4+ICtvcGVyYXRpb25zIG9uIG90aGVyIGNvcmVzLg0KPj4gKw0KPj4gK0lmIHRo
ZXJlIGFyZSBYZW4tYm91bmQgaW50ZXJydXB0cyBwaW5uZWQgdG8gdGhlIHBDUFUgYmVpbmcgb2Zm
bGluZWQsIHRoZXkgd2lsbA0KPj4gK2JlIGF1dG9tYXRpY2FsbHkgbWlncmF0ZWQgdG8gb3RoZXIg
b25saW5lIHBDUFVzLiBJbnRlcnJ1cHRzIHVzZWQgYnkgZ3Vlc3QNCj4+ICtkb21haW5zIGFyZSBo
YW5kbGVkIGJ5IHRoZSBzY2hlZHVsZXIgd2hlbiBpdCByZXNjaGVkdWxlcyB0aGUgdkNQVXMgdG8g
YSBuZXcsDQo+PiArb25saW5lLCBwQ1BVLiBXaGVuIGEgcENQVSBpcyBiZWluZyBvbmxpbmVkLCBz
b21lIFhlbi1ib3VuZCBpbnRlcnJ1cHRzIHdpbGwgZ2V0DQo+PiArcmVkaXN0cmlidXRlZCB0byB0
aGUgbmV3bHkgb25saW5lZCBwQ1BVIHRvIHByZXZlbnQgaW1iYWxhbmNlLg0KPj4gKw0KPj4gK0lm
IHBDUFUgYmVpbmcgb2ZmbGluZWQgaGFzIHNvbWUgdkNQVXMgcGlubmVkIHRvIGl0LCB0aGV5IHdp
bGwgYmUgYXV0b21hdGljYWxseQ0KPj4gK3VucGlubmVkIGFuZCBtaWdyYXRlZCB0byBvdGhlciBv
bmxpbmUgcENQVXMuDQo+PiArDQo+PiArTGltaXRhdGlvbnMNCj4+ICstLS0tLS0tLS0tLQ0KPj4g
Kw0KPj4gK09uIEFybTY0IGNwdSBob3RwbHVnIGlzIGN1cnJlbnRseSBub3QgY29tcGF0aWJsZSB3
aXRoIElUUywgZHVlIHRvIGFuIGlzc3VlIHdpdGgNCj4+ICt0aGUgcmVkaXN0cmlidXRvciBhc3Np
Z25tZW50Lg0KPiANCj4gSW4gdGhpcyBjYXNlIHlvdSBwcm9iYWJseSB3YW50IHRvIG1ha2Ugc3Vy
ZSB0aGF0DQo+IENPTkZJR19DUFVfT05MSU5FX09GRkxJTkUgaXMgaW5jb21wYXRpYmxlIHdpdGgg
Q09ORklHX0hBU19JVFMNCj4gDQo+PiArDQo+PiArT24gQXJtNjQgdGhlcmUgY2FuIGJlIHByb2Js
ZW1zIHdpdGggRkZBIGlmIHNlY3VyZSBGVyBzdXBwb3J0cyB0aGUgbm90aWZpY2F0aW9uDQo+PiAr
QUJJLCBhbmQgd2l0aCBURUUsIGFzIGJvdGggdXNlIG5vbi1zdGF0aWMgSVJRIGFjdGlvbnMuDQo+
IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBvbiB0aGlzPyBBRkFJSywgT1AtVEVFIGhh
cyBvd24NCj4gY3B1X3VwL2NwdV9kb3duIGNhbGxiYWNrcywgc28gaXQgc2hvdWxkIGtub3cgd2hp
Y2ggQ1BVcyBhcmUgb25saW5lLg0KDQpJdCdzIG1vcmUgb2YgYSBwcm9ibGVtIHdpdGggdGhlIHdh
eSBpbnRlcnJ1cHQgaGFuZGxlcnMgYXJlIHNldCB1cCBpbiANClhlbi4gTXlrb2xhIGFscmVhZHkg
aGFzIGZpeGVzIGZvciBpdCBpbiBhIHNlcGFyYXRlIHNlcmllcywgYnV0IEknbSBub3QgDQpob3cg
dG8gYmVzdCBzeW5jIHVwIG91ciBlZmZvcnRzLg0KDQpodHRwczovL3BhdGNoZXcub3JnL1hlbi9j
b3Zlci4xNzg3ODM4NDU1LmdpdC5teWtvbGEuXzVGa3ZhY2hAZXBhbS5jb20vNjIzYmU5YTBhNTYw
MzA3M2YyNWQwMDk5NzlhYjQ5YjYxMWU3ZGRkYy4xNzg3ODM4NDU1LmdpdC5teWtvbGEuXzVGa3Zh
Y2hAZXBhbS5jb20vDQoNCmh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuL2NvdmVyLjE3ODc4Mzg0NTUu
Z2l0Lm15a29sYS5fNUZrdmFjaEBlcGFtLmNvbS9jYzEwODg4ZjM0ZTg4N2Y3MzlkNjYzMTJhYTg3
MWE2ZGY0MTk2MjA0LjE3ODc4Mzg0NTUuZ2l0Lm15a29sYS5fNUZrdmFjaEBlcGFtLmNvbS8NCg0K

