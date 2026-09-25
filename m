Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEBBC98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 17:46:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434350.1654364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA9zW-0006ix-25; Fri, 25 Sep 2026 17:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434350.1654364; Fri, 25 Sep 2026 17:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA9zV-0006iq-U3; Fri, 25 Sep 2026 17:45:45 +0000
Received: by outflank-mailman (input) for mailman id 1434350;
 Fri, 25 Sep 2026 17:45:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1xA9zU-0006iR-FL
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 17:45:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA9zT-00Dcb0-SC
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 19:45:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab6b340-2eae-0a2a0a5409dd-0a2a450c89f2-10
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 19:45:43 +0200
Received: from [52.101.83.135]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab6b346-f479-0a2a450c0019-34655387672f-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 19:45:43 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DB9PR03MB7786.eurprd03.prod.outlook.com (2603:10a6:10:2cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 17:45:40 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 17:45:40 +0000
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
 b=KO0/Vw5ykr/GbOeNHRmKHMeoSQB4TovEeHKbKCmZMTNsfSDHjWS8wzrku1kTf6j4/ep25JdWb7MeziC1dz7YotOQOB7U9HaFi9npEMettJBaXczm7tzxRC1mcl6+xOXviuqOc8N2uCC2YOZ4IJjA4qhPFVK2Fg+mf4SQjAl8uQCLnmYmMLpQxbpCJdx0h4nKqXzedslWVPa2j4eQz0oci7tanA+RH11ZKFsTaPiIElMpP5KZpTaTccifxODWg1WIvMslIENQY8+cMmQrVEocpuzX38veWA12Jh9dk7sLM5kDnJkkjIs0CvYPLBEQ3qiu11QZfsWnQd4FydXAZBiSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug/jAZJmMQ2W9AiE6v1OO80WA0+IMEJaL5YO8AqSE4k=;
 b=ppWtiQKFVSt8iaWUQeDFjgZgyQzryESlQmCZ/GtR9Upz9sQXH3XxY9pTuCQ6eDiXZve+MqdbpUHzfDFubxecaQiibGgSI/hn91OwNvirGYvs43wWzE9DUThtIcgxlZcSaVg/68Zf/pFoFQznatMzgEK35jsQElK1Pnr4J7L3grDnwctJPE6EZYX2tXLS1E9UT6XE5oa0uuqxMCWj830d/ubgJ5uuVP6GiR1eiHnP1UNd6oTXyGWwRdM3dySEeAkua87DZop21UB/dreBtCQg3e/n+eXXTGrL9/lmFUrL4U4mpUETn9IJZ7Z99D8jLH//a9hfoewqm9F91Fqo2lOCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug/jAZJmMQ2W9AiE6v1OO80WA0+IMEJaL5YO8AqSE4k=;
 b=D/0AJ2ayFHEEco+WhxSjQM33kYYtOH1O5ljIMmi3AsURC67RBk7JVH9pqBzrSAVBUOzfCyelZNq8Mo+fn+eh93ctUZ9qS5mZAK0wHYaVtIMQYVSn+1wO2pbgMSicAowp2Y8FVMC5Zj217inmB3FOc1VjWzzOHgpf2RZTi2k/VsM7nM19i3ROcqODSlT387cuz+fDOj7nRWSgY+bus4TU76qg1rLC2kTAjxOoPKHv/R1q9iF1p3ZndMYjU5lWEJqfclDODluM6SDhN43dT/usWwS0YZ1IQT5CCItc4it2v2+8sl4dXkeyoaPVTrRopKneMgYTQ2wLFtwftnAh80Ea6g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: Mykola Kvach <Mykola_Kvach@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
Thread-Topic: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
Thread-Index: AQHdSqtHErIjikKEzUu28tenN1pYhA==
Date: Fri, 25 Sep 2026 17:45:40 +0000
Message-ID: <87mrt5z0l8.fsf@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
	<e93b497d55dbfeb2aaaa9ff4b55b8925f902d395.1790089161.git.mykola_kvach@epam.com>
	<8733v06dsq.fsf@epam.com>
	<CAGeoDV9fO1-snJTxez1bjiiRDmhzBrrRBy+HBLfBO51v4Xdt9A@mail.gmail.com>
In-Reply-To:
 <CAGeoDV9fO1-snJTxez1bjiiRDmhzBrrRBy+HBLfBO51v4Xdt9A@mail.gmail.com>	(Mykola
 Kvach's message of "Thu, 24 Sep 2026 08:00:00 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DB9PR03MB7786:EE_
x-ms-office365-filtering-correlation-id: e948fec1-b7d9-49e7-6c23-08df1b2cd0f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|1800799024|366016|376014|38070700021|260925022911599003|4143699003|3023799007|6133799003|4133799003|10067099003|11063799006|5023799004|260925021311599003|56012099006|22082099003|18002099003|260925021911599003;
x-microsoft-antispam-message-info:
 0K/SBnWwU+jqVm6yWzo/jWOuNvNxjEb8NZSFJ4oW7K5cUXEBL6mB7Q4RW4JQX9VRZ3rKlU5ycBmoCS8ZuA6xWgrpymU26qlhEm1oJ7KNx/Hu8yAuvh8LerWZ3ic46DjzkELwvJHxbTKvWekv0oUhHKXpuNhqbr/t0oz/oB02+o9e5JHUIvQ9AcbwicyE68xmgI2jLWM0KhnW6yUD/LrBZLt6zU0xHBH4f78ujQZjN+R5/rbU6ICfM6TnVuuhw+Yh0qJt4PnYWDhOyzPD/6uZjVJepirKYE1VRdRiVslzMJmrv6xn1y6MKt1l2I2t+7TDajGLpd6UKixizxesxz3qCWCti1/+chXGGdTalQZUAggGS/sL53JuZRR2ZSE7bceGY0bTTEl6nutzJmii9xM0D57QJw9etq0ewH+JZyol8a8EF1g7YVX/gKMslMafhIGSgw5egHAJQkSblDqc72DhX89bHqT7irh2h+vWYC3Cy9IpgOs2DJFiHsjTKg/zUDFoTKGq0NJGILApz5adM5YHZg2kI4tFpXhPwu+aj+jbIBFN9tUt2hEBmrzkMTTaKXK6novKdJ75sqtOs+edRIhCSfUNk5au8zCUW08du4la4fZGU14zgnlYiNOQLNQU5c9bhCuFW+ilq75JuDPi3dPmfRUtCLlPeTOC+hioRblHdYk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(1800799024)(366016)(376014)(38070700021)(260925022911599003)(4143699003)(3023799007)(6133799003)(4133799003)(10067099003)(11063799006)(5023799004)(260925021311599003)(56012099006)(22082099003)(18002099003)(260925021911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzVhczRYL1h5V2EwMXN3Y0hiVGFhQWZxT09NcnliY0dnUHlydUdJWHVWMHJr?=
 =?utf-8?B?aXBPY0lWdDM2WjhEOVNMb29WZSs4RUQ0b1dBOEo2MzZZYnc5ZnNyUGtHOUhL?=
 =?utf-8?B?d3MxclVSZHpjWHFQbEhiVzFQd2VLTGJWQlQ1K2IxNVZFV2VhMjlPVHRweVQy?=
 =?utf-8?B?ZVZPdllkODJ6Qi9jbWxabzM4QiswUVRpWmF5ZWdmbi9lL3lKWXhMbituQ3lr?=
 =?utf-8?B?aGJmaGgrMjZkM3BXNTdJbzE1NW9VRGxiQUZwWlcvM1FRZnh1WTJxUjZOSFFX?=
 =?utf-8?B?c2lsVHBnNWl5WlpCbVI2VElCT2pUTDR0OUlNaG1jc0RoVWFhS3c5RW9PN0Zv?=
 =?utf-8?B?dkcvNzRlVml4MzVwU0lJSXlsYnoyZXkwZU1Hak5UaCtsV0lGYVRYZUNkVkpr?=
 =?utf-8?B?aWM2SHlCMzFKWUU3S3RtY2Jzd1RmVG5yK29peXJBY3o3ekpzenI1aEJYUWMr?=
 =?utf-8?B?Mnhad0hLd0hVQVVWTXFqb1Fnb2IvUzJzZlFUWkg1WlkrRnFUQWtWSWU3OHFv?=
 =?utf-8?B?anUyTVJVSllwSThBb0xRZ3pmUW1ycThYVmcwaCtodUpTZldGRHhCUm0wNU9I?=
 =?utf-8?B?enNRd3VRZ3RicVA4T0lQSXZFeVdURllFQ0hybnR4bC8zblpSL243NHVUeklU?=
 =?utf-8?B?OVpmK3FHdk93K0ZJTGRLWEIwYVYwL0YyQTM1RTNsdUJQbHQxanFTek1EYmxZ?=
 =?utf-8?B?YU1vY3pJc0x3NE0xNzRZL3p5bFNWbkVBTEVMMVg4RCtyc1ZpUmJZaTNUbEFm?=
 =?utf-8?B?c3RlR0RhdlZoalFiL3lkYXM2cG14TkUrTDVxclNhV000NUlOSXo0ZmxPditP?=
 =?utf-8?B?RHFDMGMrNG8ySnNWeE1MUXFJd3h6Szhsb0Y3SkxHTDM5S0lJNWQwVzFyZDJ0?=
 =?utf-8?B?by8wYThJSWlabHFQMzBKbW1xam0zeXhlMndVWE9hWE1DZEFrbWNuRllDakp0?=
 =?utf-8?B?bnZVWHk0TkRSdDBQWmk1NzlXbVc4c0drR1ZGOW1JN1VZMjlib3grVXA5Wm9p?=
 =?utf-8?B?bTM2bFByeEM5Ylk3K054WXZJQkdRWlNQTlJFaHpLMkx5c1lQOHhObmJ5T3g1?=
 =?utf-8?B?MjhjQ0tVWWZxMXlCUy94S3NOUFFxMXpXelpSQnc0TDE2d1hWUlBmR0xQK25W?=
 =?utf-8?B?cWR6NWdxWTF0djluTGRtRm4yZ05NVWhLZkRDajhRZk5VTzlOZmNjOWdnYWl4?=
 =?utf-8?B?MEYyTTVVQ2ZWczFTY3h6aWwzQ3VWVmhaZDQvcVQrK3l3VGhyWC9PbmVoNXRo?=
 =?utf-8?B?S2Z2K0xIajlEbnFCa1p3ZnNXYWJVckcvSWRCdG43ajFrdWEwZk9mR1BDbWFG?=
 =?utf-8?B?WDVJYkowaHpFYVF5c1ZVRk13MUFwdHhNd2dRaEorckVwT2lUQzlNZ2UxM05P?=
 =?utf-8?B?azRtSGM4QU8yNXNmMi9QbE93eElzL0pDYXMybnQ2dVViOEowZ1BMVFM4MzBJ?=
 =?utf-8?B?eGhCdy8vTWh0K0ZuQWdRSUVEZnJPNTJzc2d0ZUFBUVdURDlFWlNjVkF3dUtr?=
 =?utf-8?B?Uk5FVGFsM1BqdkdwTVEwdEhXM3g0OEJGaXBKM21tZStYbUwrRC9JeHVSK3ZM?=
 =?utf-8?B?UUdIdi9VekdTcXpkdXEvSU9JMEpnT1c4d0dldTZFNXhjd0tmR2c0T3p2SGE2?=
 =?utf-8?B?ZVlsQnkrOG1NMUhFUytSZ3U4eDJyN2s0dS9KMk9QbHhseVc2d25ieUx3c2di?=
 =?utf-8?B?VURzbERxS3paalVCQ1Q3b1dlRk1pVWtiSFRSS0MvU3d1bVdmajhRQld3RDUv?=
 =?utf-8?B?NkFTcFZzUTZqdGUxSjVoUSswbFExYTVmU1BpUmVqQ2x4SXliNEJNcU1zZEQ0?=
 =?utf-8?B?bmpSZG9LQ2k5TnZEZ05tMjd2aVdCRW81RUpLUHFJM0VHb0VKWHZJOW5QQzAz?=
 =?utf-8?B?bCtQSXFYTnZkWjZ1T2czV2FmbEU3Y1FnQ2pVWEF2dEx1Ykx5YXZKOVVmeUtM?=
 =?utf-8?B?WWl4T0lwMVVNWHJxK0VESGxmaklkQ1FlZnlRa1g1TXdjTHNGRnJ3bmtwNmZG?=
 =?utf-8?B?Y3MzM2Y3cklFSmZMclRwMmFxNHJhWnVaRGd0MU40QVhTakZVSXcyN3dqVVJn?=
 =?utf-8?B?Ym1hUWc5amJscWFZcmg0TUdKM0Vkbis3ZUh6eDZYclVNNDM0bTdrcng0TUZl?=
 =?utf-8?B?MXkrZ0wvS0VYZzBWMjd3Y3RmZHJMRElQTHBBRlVjd0NIZTB3bmNDbUNyWGRL?=
 =?utf-8?B?dGxrVC9YeU1hNHV3MXhaMTJxSU9ZR00wbzFMRHNxUHJtNDR4TmZQN1FKZUc1?=
 =?utf-8?B?aFRTSFQ5Rkd1M051L0VrRm50YWxOTThuRzZFdWVac3hxakdMbGNuYVQwVkNW?=
 =?utf-8?B?RHJkL05qL1pmdlZZeEdCL3c1K2ZEbVVBeFJoejgyaDhlc3pkUVJQcWt4MGd2?=
 =?utf-8?Q?+aWobsV1YpRg/vfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49F4B600909D064B89C0D034BB114A9D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e948fec1-b7d9-49e7-6c23-08df1b2cd0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 17:45:40.7272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8zosL9mQ+LNVLNrtkwTdWVogHwcP3/0bV96Qzfpa5CItO9Hbeq9KfCZLN5+T6FsaGk68NRtehlyOWeeWhpfcsfDJPOvu1gRurNKqknwaGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7786
X-purgate-ID: tlsNG-d25034/1790358343-76EDAA5B-B2A1769E/0/0
X-purgate-type: clean
X-purgate-size: 6630

SGkgTXlrb2xhLA0KDQpNeWtvbGEgS3ZhY2ggPHhha2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyaXRl
czoNCg0KPiBIaSBWb2xvZHlteXIsDQo+DQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4N
Cj4gT24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMjo1NuKAr0FNIFZvbG9keW15ciBCYWJjaHVrDQo+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgTXlrb2xhLA0K
Pj4NCj4+IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPiB3cml0ZXM6DQo+Pg0K
Pj4gPiBUaGUgYm9vdCBDUFUgcGVuZGluZyB0YWJsZSBtdXN0IHVzZSB0aGUgbWVtb3J5IGF0dHJp
YnV0ZXMgc2VsZWN0ZWQgYnkNCj4+ID4gSVRTIHF1aXJrcy4gZ2ljdjNfbHBpX2luaXRfaG9zdF9s
cGlzKCkgaXMgdGhlcmVmb3JlIGNhbGxlZCBhZnRlcg0KPj4gPiBnaWN2M19pdHNfaW5pdCgpLiBI
b3dldmVyLCBnaWN2M19pdHNfaW5pdCgpIGFsc28gcHJvZ3JhbXMgYW5kIGVuYWJsZXMNCj4+ID4g
ZWFjaCBJVFMgYmVmb3JlIGhvc3QgTFBJIHN0YXRlIGlzIGFsbG9jYXRlZC4gTm8gSVRTIGNvbW1h
bmRzIGFyZQ0KPj4gPiBzdWJtaXR0ZWQgYXQgdGhhdCBwb2ludCwgYnV0IHRoaXMgb3JkZXJpbmcg
cmVsaWVzIG9uIHRoYXQgaW1wbGVtZW50YXRpb24NCj4+ID4gZGV0YWlsLg0KPj4gPg0KPj4gPiBT
cGxpdCBwZXItSVRTIGluaXRpYWxpemF0aW9uIGludG8gcHJlcGFyYXRpb24gYW5kIGFjdGl2YXRp
b24gcGhhc2VzLg0KPj4gPiBGaXJzdCBtYXAgYW5kIGRpc2FibGUgZXZlcnkgSVRTIGFuZCBjb2xs
ZWN0IGl0cyBxdWlya3MuIFRoZW4gaW5pdGlhbGl6ZQ0KPj4gPiBob3N0IExQSSBzdGF0ZS4gT25s
eSBhZnRlciB0aGF0LCBhbGxvY2F0ZSBhbmQgcHJvZ3JhbSB0aGUgSVRTIHRhYmxlcyBhbmQNCj4+
ID4gY29tbWFuZCBxdWV1ZSwgYW5kIGVuYWJsZSBlYWNoIElUUy4NCj4+ID4NCj4+ID4gVGhlIHN1
YnNlcXVlbnQgZ2ljdjNfY3B1X2luaXQoKSBzZXF1ZW5jZSByZW1haW5zIHVuY2hhbmdlZDogaXQg
cHJvZ3JhbXMNCj4+ID4gdGhlIFJlZGlzdHJpYnV0b3IgTFBJIHRhYmxlcywgZW5hYmxlcyBMUElz
LCBhbmQgdGhlbiBzdWJtaXRzIHRoZSBmaXJzdA0KPj4gPiBNQVBDIGFuZCBTWU5DIGNvbW1hbmRz
Lg0KPj4gPg0KPj4gPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
DQo+PiA+IFNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29t
Pg0KPj4gPiAtLS0NCj4+ID4gQ2hhbmdlcyBpbiB2MzoNCj4+ID4gLSBOZXcgcGF0Y2ggaW1wbGVt
ZW50aW5nIHRoZSBwb3N0LTQuMjIgaW5pdGlhbGl6YXRpb24gb3JkZXIgZGlzY3Vzc2VkDQo+PiA+
ICAgZHVyaW5nIHJldmlldyBvZiB0aGUgb3JkZXJpbmcgZml4Lg0KPj4gPg0KPj4gPiBMaW5rOiBo
dHRwczovL3BhdGNoZXcub3JnL1hlbi8zNDFlZGQ4ZGU2M2RjZDg0Y2NjNmU3YjZjMDNlOWU4ZmM3
MTA1MTg0LjE3ODE4NDcwNjEuZ2l0Lm15a29sYS5fNUZrdmFjaEBlcGFtLmNvbS8NCj4+ID4gLS0t
DQo+PiA+ICB4ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jICAgICAgICAgICAgIHwgMzIgKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tDQo+PiA+ICB4ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgICAgICAg
ICAgICAgICAgIHwgMTUgKystLS0tLS0tLS0tLQ0KPj4gPiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2dpY192M19pdHMuaCB8ICA0ICsrLS0NCj4+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+PiA+DQo+PiA+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZ2ljLXYzLWl0cy5jIGIveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPj4gPiBp
bmRleCAzMjU4MzViMGFkLi45NzI4MjViZjA2IDEwMDY0NA0KPj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vZ2ljLXYzLWl0cy5jDQo+PiA+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4+
ID4gQEAgLTExLDYgKzExLDcgQEANCj4+ID4gICNpbmNsdWRlIDx4ZW4vbGliLmg+DQo+PiA+ICAj
aW5jbHVkZSA8eGVuL2RlbGF5Lmg+DQo+PiA+ICAjaW5jbHVkZSA8eGVuL2lvY2FwLmg+DQo+PiA+
ICsjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4+ID4gICNpbmNsdWRlIDx4ZW4vbGliZmR0L2xpYmZk
dC5oPg0KPj4gPiAgI2luY2x1ZGUgPHhlbi9tbS5oPg0KPj4gPiAgI2luY2x1ZGUgPHhlbi9yYnRy
ZWUuaD4NCj4+ID4gQEAgLTU0OSwxMCArNTUwLDkgQEAgc3RhdGljIGludCBnaWN2M19kaXNhYmxl
X2l0cyhzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cykNCj4+ID4gICAgICByZXR1cm4gLUVUSU1FRE9V
VDsNCj4+ID4gIH0NCj4+ID4NCj4+ID4gLXN0YXRpYyBpbnQgZ2ljdjNfaXRzX2luaXRfc2luZ2xl
X2l0cyhzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cykNCj4+ID4gK3N0YXRpYyBpbnQgX19pbml0IGdp
Y3YzX2l0c19wcmVwYXJlX3NpbmdsZV9pdHMoc3RydWN0IGhvc3RfaXRzICpod19pdHMpDQo+PiA+
ICB7DQo+PiA+IC0gICAgdWludDY0X3QgcmVnOw0KPj4gPiAtICAgIGludCBpLCByZXQ7DQo+PiA+
ICsgICAgaW50IHJldDsNCj4+ID4NCj4+ID4gICAgICBod19pdHMtPml0c19iYXNlID0gaW9yZW1h
cF9ub2NhY2hlKGh3X2l0cy0+YWRkciwgaHdfaXRzLT5zaXplKTsNCj4+ID4gICAgICBpZiAoICFo
d19pdHMtPml0c19iYXNlICkNCj4+ID4gQEAgLTU2NCw2ICs1NjQsMTQgQEAgc3RhdGljIGludCBn
aWN2M19pdHNfaW5pdF9zaW5nbGVfaXRzKHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzKQ0KPj4gPg0K
Pj4gPiAgICAgIGdpY3YzX2l0c19lbmFibGVfcXVpcmtzKGh3X2l0cyk7DQo+PiA+DQo+PiA+ICsg
ICAgcmV0dXJuIDA7DQo+PiA+ICt9DQo+PiA+ICsNCj4+ID4gK3N0YXRpYyBpbnQgX19pbml0IGdp
Y3YzX2l0c19pbml0X3NpbmdsZV9pdHMoc3RydWN0IGhvc3RfaXRzICpod19pdHMpDQo+PiA+ICt7
DQo+PiA+ICsgICAgdWludDY0X3QgcmVnOw0KPj4gPiArICAgIGludCBpLCByZXQ7DQo+PiA+ICsN
Cj4+ID4gICAgICByZWcgPSByZWFkcV9yZWxheGVkKGh3X2l0cy0+aXRzX2Jhc2UgKyBHSVRTX1RZ
UEVSKTsNCj4+ID4gICAgICBod19pdHMtPmRldmlkX2JpdHMgPSBHSVRTX1RZUEVSX0RFVklDRV9J
RF9CSVRTKHJlZyk7DQo+PiA+ICAgICAgaHdfaXRzLT5ldmlkX2JpdHMgPSBHSVRTX1RZUEVSX0VW
RU5UX0lEX0JJVFMocmVnKTsNCj4+ID4gQEAgLTExODksNyArMTE5Nyw3IEBAIHN0YXRpYyB2b2lk
IGdpY3YzX2l0c19hY3BpX2luaXQodm9pZCkNCj4+ID4NCj4+ID4gICNlbmRpZg0KPj4gPg0KPj4g
PiAtaW50IGdpY3YzX2l0c19pbml0KHZvaWQpDQo+PiA+ICtpbnQgX19pbml0IGdpY3YzX2l0c19p
bml0KHVuc2lnbmVkIGludCBob3N0X2xwaV9iaXRzKQ0KPj4gPiAgew0KPj4gPiAgICAgIHN0cnVj
dCBob3N0X2l0cyAqaHdfaXRzOw0KPj4gPiAgICAgIGludCByZXQ7DQo+PiA+IEBAIC0xMjAxLDEz
ICsxMjA5LDI3IEBAIGludCBnaWN2M19pdHNfaW5pdCh2b2lkKQ0KPj4gPg0KPj4gPiAgICAgIGxp
c3RfZm9yX2VhY2hfZW50cnkoaHdfaXRzLCAmaG9zdF9pdHNfbGlzdCwgZW50cnkpDQo+PiA+ICAg
ICAgew0KPj4gPiAtICAgICAgICByZXQgPSBnaWN2M19pdHNfaW5pdF9zaW5nbGVfaXRzKGh3X2l0
cyk7DQo+PiA+ICsgICAgICAgIHJldCA9IGdpY3YzX2l0c19wcmVwYXJlX3NpbmdsZV9pdHMoaHdf
aXRzKTsNCj4+ID4gICAgICAgICAgaWYgKCByZXQgKQ0KPj4gPiAgICAgICAgICAgICAgcmV0dXJu
IHJldDsNCj4+ID4gICAgICB9DQo+PiA+DQo+PiA+ICAgICAgZ2ljdjNfaXRzX3ZhbGlkYXRlX3F1
aXJrcygpOw0KPj4gPg0KPj4gPiArICAgIGlmICggbGlzdF9lbXB0eSgmaG9zdF9pdHNfbGlzdCkg
KQ0KPj4gPiArICAgICAgICByZXR1cm4gMDsNCj4+DQo+PiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9m
IHRoaXMgY2hlY2sgaGVyZT8gSSdkIGV4cGVjdCB0byBzZWUgaXQgYmVmb3JlIHRoZQ0KPj4gZmly
c3QgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGxvb3AuDQo+DQo+IFRoZSBjaGVjayBza2lwcyBob3N0
IExQSSBpbml0aWFsaXphdGlvbiB3aGVuIG5vIGhvc3QgSVRTIGlzIHByZXNlbnQsDQo+IHByZXNl
cnZpbmcgdGhlIGV4aXN0aW5nIGJlaGF2aW9yLiBYZW4gY3VycmVudGx5IGRvZXMgbm90IHN1cHBv
cnQgTFBJcw0KPiB3aXRob3V0IGFuIElUUy4NCg0KVGhpcyBkb2VzIG5vdCBhbnN3ZXIgd2h5IHlv
dSBuZWVkIHRvIHJ1biBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgbG9vcC4gSQ0KdW5kZXJzdGFuZCB0
aGF0IGl0IHdpbGwgbm90IGxvb3AgYW5kIHRoZW4geW91IHdpbGwganVzdCBjYWxsDQpnaWN2M19p
dHNfdmFsaWRhdGVfcXVpcmtzKCksIHdoaWNoIGFsc28gd2lsbCBkbyBub3RoaW5nLiBUaGlzIGlz
IHdoeSBJDQphbSBhc2tpbmcsIHdoeSBub3QgbW92ZSB0aGlzIGlmKCkgY2hlY2sgcmlnaHQgYmVm
b3JlIHRoZSBsb29wPw0KDQo+IGdpY3YzX2l0c192YWxpZGF0ZV9xdWlya3MoKSBhbHJlYWR5IGNo
ZWNrcyBmb3IgYW4gZW1wdHkgbGlzdCwgc28gdGhlDQo+IGN1cnJlbnQgcGxhY2VtZW50IGRvZXMg
bm90IGNhdXNlIGEgZnVuY3Rpb25hbCBpc3N1ZS4gVGhlIGZvbGxvd2luZw0KPiBwYXRjaCBhbHNv
IHJlbW92ZXMgdGhhdCBmdW5jdGlvbiBhbmQgaXRzIGNhbGwuDQo+DQo+IFdvdWxkIHlvdSBiZSBP
SyB3aXRoIGtlZXBpbmcgdGhlIGN1cnJlbnQgcGxhY2VtZW50Pw0KDQpJIHRoaW5rIGl0IHdpbGwg
YmUgbW9yZSBzZW5zaWJsZSB0byBoYXZlIHRoaXMgY2hlY2sgYmVmb3JlIHRoZQ0KbG9vcC4gVW5s
ZXNzIEkgbWlzcyBzb21ldGhpbmcsIG9mIGNvdXJzZS4NCg0KLS0NCldCUiwgVm9sb2R5bXlyDQo=

