Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DF4CC6B3A
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 14:09:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450635.1666067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHM8Q-0007u2-RC; Thu, 15 Oct 2026 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450635.1666067; Thu, 15 Oct 2026 14:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHM8Q-0007tB-KF; Thu, 15 Oct 2026 14:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1450635;
 Thu, 15 Oct 2026 14:08:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xHM8P-0007dH-AL
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:08:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHM8O-002ujh-NQ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:08:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad0de59-e002-0a2a0a5209dd-0a2a4501c5d8-36
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:08:40 +0200
Received: from [40.107.130.109]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad0de68-5984-0a2a45010019-286b826df94d-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:08:40 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by BR0PR03MB478273.eurprd03.prod.outlook.com
 (2603:10a6:2c8:57::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 14:08:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:08:39 +0000
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
 b=I122jX0I4HqJEDzAxn2gqcqc/2rZWeqAgCxY8XXUEiBPxQ/62JJ6AQL5FZrsBjzc2wx5lIzpPaUvxulzYk512zQj3sPyjasHq+0tIx/kqojC8YhGG69lNYlLO2Sc9tQjiYwFlxykS9tmlcdidGwqcC62FnuDrNBdwc8fPLlIKteSd/ydDjg69a3CSw8lBUThmYPw4/zSzpRVX6X9gPLp7HaE+5u2U51w5uf4IjiGDC7vPw4atTGTIMtrIAU8rzlzHuO2JgXQ5zG3Ral0zlZUv1a0kqeueXhd8lLEL55UqNGLef7DXCF4gzdiq8Gjo+Y+Ky6FEWSl/Mvf4IC/h9rsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFTVJBiBGZaYOy71IJGDHQLcbg/ldMmAczl5fkv0boE=;
 b=SKJjn8dyDY90YA8BIGmDPQmpbIQ0RhfLGCdpVA/Py1WQEwjOCtU84NSpItqopeN5WDMc1TqRIxjwyXizqJhSK0y54yaHAX/HjXckEp1+cPa09HzXoinSTBklVWpZg90VyLFHI+Nj3r6ELeE4MmXX1nzmQXvmiN1BXqdIJHKPhp8mh/2gvlO/8ocFdQF6rwbKI4l3xPvmmTgoo2Pk+IyqNfVryHx8Vf0p8/XB5cZDkFB2D04Uu7NlhwdBF41nczxJPtq4hijXhBRLoFi8PvNptUkZ6G5e930QoE3lKcogJN9Fm0+k28qSxvxfMybG/B6PhcY/w55rTCgg1o1ePVMudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFTVJBiBGZaYOy71IJGDHQLcbg/ldMmAczl5fkv0boE=;
 b=hzTcCiRScYv+ne4rfoeiCjjqumZRLdkr5kwCXpr1GMRmSIw5+xsXtzdgi+Q8go/ZJm8l5WNd32Tp6jaY6F+u3rXTwJdn9DaCdsFPwnnjjwTyCnIuJxQ55s7FJtXn9BdHGx1SXV3b9q9/tF6+hRpFEJv4ui0SBTVxNWsvibVStoplbWfttF1ZyJcMpEVUTC+uhbt0Iw7k2NipTAblZI3uGaXsbm0rOSU6pVKlR8gKUJ1oZoAoY9jyw6xYs8efSVXl2PhmHrfy59BW6hIrdQt/MRQLSiDja5bNxtDWHGCt5Yl0GMZiz0QGgie6Ka03ZV4ivPYYqvf34dLuUZsmwhxPbQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v4 5/5] vpci: add SR-IOV support for DomUs
Thread-Topic: [PATCH v4 5/5] vpci: add SR-IOV support for DomUs
Thread-Index: AQHdXK6teWhG3WjO0kSjTx4KoVhJjw==
Date: Thu, 15 Oct 2026 14:08:38 +0000
Message-ID:
 <8823cd01334978baea19515c35068c789d4568bb.1792072426.git.mykyta_poturai@epam.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792072426.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|BR0PR03MB478273:EE_
x-ms-office365-filtering-correlation-id: 0d3478f7-d5a9-4d2b-7348-08df2ac5cfb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|10067099003|38070700021|11063799006|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 3m7yIc6q0XAL2YpMXEeFXE7clPfDhhbBnIwASbkVBe3QhVm7AcW9Oe2sxu042Gkzsfhe82b/ldEQYPwJ7Vz7bKgzbSnpRox6gaGwBXePmPIR/6Airf1FN1utb0VfMLnP704Wgqz9Z9VJrnWQlLlpHT9IW9xjzI87+IRtou31wt3biYS+oEvFxNpGJOaQp9dIT7qOAomKwJNrgMQ0ScEH/oQzZs9NnIO9xWk5aFGMHS1VznHpngjxN/omEZfouPldNJf/sbw+fQiowc5NBqiOKnQb0049W0OpuSUWgRHfFzNnJCSLojGPTW35lphuMSILnG6WdDoUJoxW9Pyk9rQ95Aenml8+4EjskjBnuDgd64xIhe/ZCnY+HjK5nIFzzl3pkXowNAsAHQO97j2WIwRsKsQVeiddEWDqG6Jj/TPfq1/WtZbz99HemoHgiaKO+daQ4kR07IOBAPlml7EHTFntui41AqvpCanaChDNY7u3gr+kEi3mTuvZcLBQJVNBYwbmFjtx52WJMAUYtCeMg3YnxGMiQH9J3gj3JE+7KVs9G0EUU/r2BHtWQA8fpzdCk7Ti9OwltkzeGZiYieK3JF8hdpO5P2kB/NLe/chPjwZ/HKTlOmx7SxgHma1rAeOs1BOENwdc6YLdrw/Crijhx823+uvHPk1FRVh2hu5Kn77jG54QOuHWQbOTVia6RmY5c9YxdEmSyt7KTO7FKDv1GvSqM7kuQO533m5ubc9+fxlGjis=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(38070700021)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk1ScFprME9uYXdoSGYzL01ma01EZEtiL3dCSllaYU1oelIrUFF5N2dKMFZY?=
 =?utf-8?B?SUxOL1ZpQ3BUb3ZUK1ZvZzJDcUxsSVptOUpIa3diUlBiVWNtTzZRVnlQcnBF?=
 =?utf-8?B?NE9nTFR5WHo1K01ReDZtUzZvUjZBZFVnZnRnQ2NkRnFyL3JNQ2dldEFFRWpP?=
 =?utf-8?B?OWJXV3RzZFBxSnR2enI1N1VjdVo3RU5CdGt1WW9wZ0ppK29LUk9DbXZTN1ZH?=
 =?utf-8?B?ZmlqTHJEZzBVdVZLdlpDZCtsY0R3MmxDQnQ3UXFlRE1MT1VTd2YxZnY4bjFG?=
 =?utf-8?B?TlFvbEk1bzViU1RIcitCMHp2Qmdrd1J3L0hFT0IwSTEwWDdtZjhJWjRNbE4r?=
 =?utf-8?B?eXR5WW1jdGltUnI2VkdGcHo0T09zZVFDVFp0S0paRE1CZHI4QVBGOUhKRzNX?=
 =?utf-8?B?UVVwNDRieHcrUUVBbzNiSm1Gb042WXh1ZERES0dyZUorb0ljSVoxdlk4SUVx?=
 =?utf-8?B?cmpsVGNBZzAzdXR4M3VxMWttdmdESlNvWnhMajEzbWdwWjJvN01yM3c2K3By?=
 =?utf-8?B?NE1zN2p6U3pXcG9GczZMazVrRVpSdHg1bDhMMXJwWmVkc3dUQVB4WXpQa1lp?=
 =?utf-8?B?dlhnVnovWjBxUlJFMlBQKyszOUN2RzdyeHBnZTM1dmhSS0FHOGZWV29nNjl4?=
 =?utf-8?B?U3ZOeldNSmJBNGNzMjVPWVNHeXhHclNSeWZ2VzdiUWdUcXAwNHBscEIvN2Y0?=
 =?utf-8?B?WUMzak1qb1RkOFMyYzlNMkoreFhqcGZTUjNaN0t3cldoTzVyOUp6MEYyaElK?=
 =?utf-8?B?TlRCRjJ1TlR6RG5hcWlCRlFMTGRlOU9VQzhIbmkvVGErK1d0cEJJUkZXeURn?=
 =?utf-8?B?TkJEck1HTGlYblNIOGlDclVhTGk5MWdWdzN2RGRjUnFLMkoxaEtSZHowY2R4?=
 =?utf-8?B?ZS9JMEZ3UGhLUzJ0NS90R0ovVUNmOEJEWldscXgzbFdrUlhWNk0xN1hKdXEv?=
 =?utf-8?B?aWwvU0c1QjhrQVFsejErOVpKcmF0eXozdllhTU02Z2ovcjlLM0xFRUZkTk1o?=
 =?utf-8?B?dUFzUkUzSFNINGt6UGFWZXVhV2hyRy9mN3dMRzYyZVQyaVhwS0JmOFJzZGFH?=
 =?utf-8?B?ZlhzaVZnZEJ1VFBodm1DVlRwbkMwNklUNklGZWJ2bjE5bzFGSWZIQUFyN3V6?=
 =?utf-8?B?MDRwejJ5ZlhrK0dqdzRVL1VqZkRKcllWTmZrK3lySUpxN0k1OENpVmd0dWpE?=
 =?utf-8?B?NFByVFczeHhZeXlEMUpoWGQ1QVZOMmU2bkVpRmFHUHhpWklhS0gvcXlTSFZr?=
 =?utf-8?B?L3JzZVU1UFU2OC9XdUVNTVEyNW5Nc0JlQVNPMVl6cW9nV0NVYW5mdFk0NVI1?=
 =?utf-8?B?RHdLWHlEc1NSVHhSS2lpczZSM0NFZFE0WXJiM01kT1FLL3NpUVpUbnVPT1gr?=
 =?utf-8?B?VGY3VkVadWJ0d1JOdnNxZHEvam5zbGZFWC9IekVJVmZLUS9ISkhvUUhmRUMz?=
 =?utf-8?B?dDdleVlFMmh0T2s0MGtLMytYSjVNZzF0RkFLZlEvRVd3KzJIZjVSMDY0UHdk?=
 =?utf-8?B?UUZmTHpsU1pRNlB1ZGZCaDU5RHd6aDVzMmZPZVZadm5iaHo2ZXBrQjd2VTdi?=
 =?utf-8?B?NVpHNSttckR3ZlBqOUdkMGtpeWlUeVRCUXMrQ1o2ZzF6Nm5UNGlGd3lmZmhE?=
 =?utf-8?B?WklMTmo5SENnd2VZckdpWExQMEc5Y3lDY2FqMkkrbVNkVjR2NndBOFhpWlZz?=
 =?utf-8?B?TGR6MDVJVzIya2RFNkJoeVdsTE1yYmhVVWZTT0VQdzU5UHB6ZUgzdDRRYUZw?=
 =?utf-8?B?bWdUMWFNV0htU1NiSHB2c24yamg4ZytISVZ1eHN3d3laY2VhR2tDYnNaQ29q?=
 =?utf-8?B?UmtyOEYzOXRmWThycjdqbm5nZXZsL3l4ampTRkdSa2FIcjBqYlFTRDVEQVhL?=
 =?utf-8?B?NEhXU3RvQXVTMTRrUjhUOUFadUd6N1JJeFMxb3M1Wmh6eTNBUlpWQkhUUzYr?=
 =?utf-8?B?amxxMTNHR3VUalJxUm1XYlRBb1pWM1NGeFZQT21wQlRKZVRyVU5MZS95cGh5?=
 =?utf-8?B?UWJGVzVFZlFtemhXaTE2ejJ6MldnTGxZSlVYTGR2RDQ3WHRpeW9VcTVUTW5p?=
 =?utf-8?B?ZVZVR0xzM2NGbzhMVEY5VXNCK0x5SjN1NlBFcldWQ1VjL1JIZTI1R2dOQWdx?=
 =?utf-8?B?SUJHNFlubkZheDNlbzdkSWFqd056a1pDN0owV3ZXRlF0eTNpTzNpWnNZTGZz?=
 =?utf-8?B?V0dDZ0xVQlVvV2NEZWtSOG1YUnEwWWtWenZxRGJCMlhGZ3ZZVWlqbEh2N2hM?=
 =?utf-8?B?ZFhUbEliZkk5VmRKVUMvWmV2UW5Gall4WEE0amFpc1FKdVNvNElmWjAyblU1?=
 =?utf-8?B?KzM5dTJUU3hxT1dLV3BsN01oRWt5V0RaRDlsNWk3ZmFtNW5mRENlYkphOTFu?=
 =?utf-8?Q?YmjUX2d89WvfWLN0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3478f7-d5a9-4d2b-7348-08df2ac5cfb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 14:08:39.0118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u64vVtsSwXFcA2ZIONrDKrb1psjfxSm6j8VzUgfmX9k6hdIVW6JDaBIU+Z9paiX6F7CdlXv6ugqIVCYcUY/9TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR03MB478273
X-purgate-ID: tlsNG-d62444/1792073320-BFA6E757-24AD928F/0/0
X-purgate-type: clean
X-purgate-size: 6192

RnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCg0K
RW11bGF0ZSBndWVzdCBCQVIgcmVnaXN0ZXIgdmFsdWVzIGJhc2VkIG9uIFBGIEJBUiB2YWx1ZXMg
Zm9yIFZGcy4NClRoaXMgYWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3QgdmlldyBvZiB0aGUgbm9ybWFs
IEJBUiByZWdpc3RlcnMgYW5kIGVtdWxhdGVzDQp0aGUgc2l6ZSBhbmQgcHJvcGVydGllcyBhcyBp
dCBpcyBkb25lIGR1cmluZyBQQ0kgZGV2aWNlIGVudW1lcmF0aW9uIGJ5DQp0aGUgZ3Vlc3QuDQoN
CkV4cG9zZSBWSUQvRElEIGFuZCBjbGFzcy9yZXZpc2lvbiB0byB0aGUgZ3Vlc3QuDQoNCk5vdGUs
IHRoYXQgVkZzIFJPTSBCQVIgaXMgcmVhZC1vbmx5IGFuZCBpcyBhbGwgemVyb3MsIGJ1dCBWRiBt
YXkgcHJvdmlkZQ0KYWNjZXNzIHRvIHRoZSBQRnMgUk9NIHZpYSBlbXVsYXRpb24gYW5kIGlzIG5v
dCBpbXBsZW1lbnRlZC4NCg0KTm90ZSB0aGlzIG9ubHkgcmVtb3ZlcyBvbmUgb2YgdGhlIGdhcHMg
b24gdGhlIHdheSB0byB2UENJIERvbVUgc3VwcG9ydDsNClZGcyBhcmUgbm90IHVzYWJsZSBpbiBE
b21VcyB1bnRpbCB0aGUgcmVzdCBvZiBpdCBpcyB1cHN0cmVhbS4gVGhlIERvbVUNCnRlc3Rpbmcg
YmVoaW5kIHRoaXMgcGF0Y2ggdXNlZCBvdXQtb2YtdHJlZSB2UENJIERvbVUgcGF0Y2hlcy4NCg0K
U2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1k
LmNvbT4NClNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJhaUBlcGFt
LmNvbT4NCi0tLQ0KdjMtPnY0Og0KKiBlbXVsYXRlIFZJRC9ESUQgYWdhaW4NCiogYWRkIGEgbm90
ZSB0byBjb21taXQgbWVzc2FnZQ0KDQp2Mi0+djM6DQoqIGRvbid0IGVtdWxhdGUgVklEL0RJRCBy
ZWdpc3RlcnMNCiogcmVwbGFjZSBpZmRlZiB3aXRoIElTX0VOQUJMRUQNCg0KdjEtPnYyOg0KKiBy
ZW1vdmUgVkYgcmVnaXN0ZXIgaGFuZGxlcnMgY292ZXJlZCBieSBpbml0X2hlYWRlcg0KKiBzZXQg
Z3Vlc3QgYWRkciB1bmNvbmRpdGlvbmFsbHkNCi0tLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvc3Jpb3Yu
YyB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3ZwY2kvc3Jpb3YuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvc3Jpb3YuYw0KaW5k
ZXggNGUwOWJkZmJmZC4uMDI0YTA5OTgyMiAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kv
c3Jpb3YuYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS9zcmlvdi5jDQpAQCAtNzksMTkgKzc5LDgw
IEBAIGludCB2cGNpX3ZmX2luaXRfaGVhZGVyKHN0cnVjdCBwY2lfZGV2ICp2Zl9wZGV2KQ0KICAg
ICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGZfcGRldjsNCiAgICAgaW50IHJjID0gMDsNCiAgICAg
dWludDE2X3QgY3RybDsNCisgICAgdW5zaWduZWQgaW50IHNyaW92X3BvczsNCiANCiAgICAgQVNT
RVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgmdmZfcGRldi0+ZG9tYWluLT5wY2lfbG9jaykpOw0KICAg
ICBBU1NFUlQodmZfcGRldi0+aW5mby5pc192aXJ0Zm4pOw0KIA0KICAgICBwZl9wZGV2ID0gdmZf
cGRldi0+cGZfcGRldjsNCiAgICAgQVNTRVJUKHBmX3BkZXYpOw0KKyAgICBzcmlvdl9wb3MgPSBw
Zl9wZGV2LT52cGNpLT5zcmlvdi0+cG9zOw0KIA0KICAgICByYyA9IHZmX2luaXRfYmFycyh2Zl9w
ZGV2KTsNCiAgICAgaWYgKCByYyApDQogICAgICAgICByZXR1cm4gcmM7DQogDQotICAgIGN0cmwg
PSBwY2lfY29uZl9yZWFkMTYocGZfcGRldi0+c2JkZiwNCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICBwZl9wZGV2LT52cGNpLT5zcmlvdi0+cG9zICsgUENJX1NSSU9WX0NUUkwpOw0KKyAgICBj
dHJsID0gcGNpX2NvbmZfcmVhZDE2KHBmX3BkZXYtPnNiZGYsIHNyaW92X3BvcyArIFBDSV9TUklP
Vl9DVFJMKTsNCisNCisgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19IQVNfVlBDSV9HVUVTVF9T
VVBQT1JUKSAmJg0KKyAgICAgICAgIHBmX3BkZXYtPmRvbWFpbiAhPSB2Zl9wZGV2LT5kb21haW4g
KQ0KKyAgICB7DQorICAgICAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhcnMgPSB2Zl9wZGV2LT52cGNp
LT5oZWFkZXIuYmFyczsNCisgICAgICAgIC8qDQorICAgICAgICAgKiBBIFZGJ3MgVmVuZG9yIGFu
ZCBEZXZpY2UgSUQgcmVnaXN0ZXJzIHJlYWQgYXMgMHhmZmZmLiBUaGUgZ3Vlc3QgaGFzDQorICAg
ICAgICAgKiBubyBQRiB0byBzeW50aGVzaXNlIHRoZW0gZnJvbSwgc28gdGFrZSB0aGUgdmVuZG9y
IGZyb20gdGhlIFBGIGFuZA0KKyAgICAgICAgICogdGhlIGRldmljZSBmcm9tIGl0cyBTUi1JT1Yg
Y2FwYWJpbGl0eS4NCisgICAgICAgICAqLw0KKyAgICAgICAgdWludDE2X3QgdmlkID0gcGNpX2Nv
bmZfcmVhZDE2KHBmX3BkZXYtPnNiZGYsIFBDSV9WRU5ET1JfSUQpOw0KKyAgICAgICAgdWludDE2
X3QgZGlkID0gcGNpX2NvbmZfcmVhZDE2KHBmX3BkZXYtPnNiZGYsDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3Jpb3ZfcG9zICsgUENJX1NSSU9WX1ZGX0RJRCk7DQor
DQorICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHZmX3BkZXYtPnZwY2ksIHZwY2lfcmVh
ZF92YWwsIE5VTEwsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9WRU5ET1Jf
SUQsIDIsICh2b2lkICopKHVpbnRwdHJfdCl2aWQpOw0KKyAgICAgICAgaWYgKCByYyApDQorICAg
ICAgICAgICAgcmV0dXJuIHJjOw0KKw0KKyAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3Rlcih2
Zl9wZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBOVUxMLA0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQ0lfREVWSUNFX0lELCAyLCAodm9pZCAqKSh1aW50cHRyX3QpZGlkKTsNCisg
ICAgICAgIGlmICggcmMgKQ0KKyAgICAgICAgICAgIHJldHVybiByYzsNCisNCisgICAgICAgIC8q
IEhhcmRjb2RlIG11bHRpLWZ1bmN0aW9uIGRldmljZSBiaXQgdG8gMCAqLw0KKyAgICAgICAgcmMg
PSB2cGNpX2FkZF9yZWdpc3Rlcih2Zl9wZGV2LT52cGNpLCB2cGNpX3JlYWRfdmFsLCBOVUxMLA0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfSEVBREVSX1RZUEUsIDEsDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkICopUENJX0hFQURFUl9UWVBFX05PUk1B
TCk7DQorICAgICAgICBpZiAoIHJjICkNCisgICAgICAgICAgICByZXR1cm4gcmM7DQorDQorICAg
ICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHZmX3BkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMy
LCBOVUxMLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQ0xBU1NfUkVWSVNJ
T04sIDQsIE5VTEwpOw0KKyAgICAgICAgaWYgKCByYyApDQorICAgICAgICAgICAgcmV0dXJuIHJj
Ow0KKw0KKyAgICAgICAgZm9yICggdW5zaWduZWQgaW50IGkgPSAwOyBpIDwgUENJX1NSSU9WX05V
TV9CQVJTOyBpKysgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHN3aXRjaCAoIHBmX3BkZXYt
PnZwY2ktPnNyaW92LT52Zl9iYXJzW2ldLnR5cGUgKQ0KKyAgICAgICAgICAgIHsNCisgICAgICAg
ICAgICBjYXNlIFZQQ0lfQkFSX01FTTMyOg0KKyAgICAgICAgICAgIGNhc2UgVlBDSV9CQVJfTUVN
NjRfTE86DQorICAgICAgICAgICAgY2FzZSBWUENJX0JBUl9NRU02NF9ISToNCisgICAgICAgICAg
ICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3Rlcih2Zl9wZGV2LT52cGNpLCB2cGNpX2d1ZXN0X21l
bV9iYXJfcmVhZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cGNp
X2d1ZXN0X21lbV9iYXJfd3JpdGUsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUENJX0JBU0VfQUREUkVTU18wICsgaSAqIDQsIDQsICZiYXJzW2ldKTsNCisgICAgICAg
ICAgICAgICAgaWYgKCByYyApDQorICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQorICAg
ICAgICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgICAgIGRlZmF1bHQ6DQorICAgICAgICAg
ICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIodmZfcGRldi0+dnBjaSwgdnBjaV9yZWFkX3Zh
bCwgTlVMTCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQkFT
RV9BRERSRVNTXzAgKyBpICogNCwgNCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodm9pZCAqKTApOw0KKyAgICAgICAgICAgICAgICBpZiAoIHJjICkNCisgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByYzsNCisgICAgICAgICAgICAgICAgYnJlYWs7DQorICAgICAg
ICAgICAgfQ0KKyAgICAgICAgfQ0KKyAgICB9DQogDQogICAgIGlmICggKHBmX3BkZXYtPmRvbWFp
biA9PSB2Zl9wZGV2LT5kb21haW4pICYmIChjdHJsICYgUENJX1NSSU9WX0NUUkxfTVNFKSApDQog
ICAgIHsNCi0tIA0KMi41NS4wDQo=

