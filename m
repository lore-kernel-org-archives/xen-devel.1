Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC76CA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 20:23:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446590.1662707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGMYI-00019R-PQ; Mon, 12 Oct 2026 20:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446590.1662707; Mon, 12 Oct 2026 20:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGMYI-00019K-MY; Mon, 12 Oct 2026 20:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1446590;
 Mon, 12 Oct 2026 20:23:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGMYG-00019E-Cx
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 20:23:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGMYF-00AyZD-Ly
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 22:23:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acd4196-2eae-0a2a0a5409dd-0a2a4503ac6a-18
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:23:15 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acd41b3-fae8-0a2a45030019-34654848c5d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 22:23:15 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by VI1PR03MB6525.eurprd03.prod.outlook.com
 (2603:10a6:800:199::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:23:12 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:23:12 +0000
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
 b=YG4JMSfH/bnvpfs2WoTd/5WOZiXwK/RBc1KaDQG6zz+VMtRpN4UoGiuuyqKbI1mEEKW/jaLg0/XUQte2C/ZViXRbbrO2IKEecvLWjaMOvVFJHaXNFEN+KVeZec+lTquTPbFhqOY2UhkLkLUgjHw5fRfNMcN+oyVcheDLam/QxOF+IG1jdW+D61NkisvHTjrlhn4bGFjJJb+Pe1biekwLSZ6NOWGTmnVG1ahWjq4xvo/BGDgrzPg7xjS5hSLHgrFsmYY6Hz8F9KYgPBXhHVY+nNhRzal1qN+hVYwtwWu7/tewaH81uP4gcZF/iOIYXMS1BLROX6J/l1jvV780uGzKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md+Lhsj9yCG295s24srLu2uJb8GGrTGsiItMkltFnns=;
 b=Am6/+ycH4vcsTBVUti7HDvfsj3E8QoBdW4GC9lBGIsaBytBhBDibutYoEBRnwo79fIx5piL0Ve8k4+hAgiUfrBGvyz8xFytuDyeIcbjsskTab5f/IYNcy/GuXzdjNOIPetNpzdq+u8jn0jtKclRyOwvqdRw1Pcgwag/3cOHzlcGf96u+C64BHBSkV3PldHoHVnn5nd2k1BeUFaIFvFBo1pVAbA8zwjIT1Xkf7FSmSwDpCSQkJhkELpblyhNqD+LvdCtOLCutWHUviJgkoqyJZsfSa3H040myvdLStGgks2Blf92rmufjwBdhZxSdfPHRGfw5FB1SM0gIEPjfKKG7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md+Lhsj9yCG295s24srLu2uJb8GGrTGsiItMkltFnns=;
 b=kIVIn4Yyfsv94B2w5h6jRBg2Cx2ZjKEe+uDgAr6qesGBR7HAdrvjgnOkPaLzAwwrfGGz3a3OMvSCspyzCRo5vb/mEBbX3JAlLGCVa9np5f8wX8jTu1/nnd+R5pAjJGvvwjRvBuqJzzqjFQ6Z2g7aUQ0I1W5jNchc8boeVjtW9NeoSs7XCzJ6fgwiJad/gBQnJoVzt3inZsJ47opzS58QQkRP12eiqcfBFWm8xdhv516KQD4Kx6x1n4Nc1gATt4UNMxbRjnE+qzO42Gk7TC45JyNYADmU+jo0NS6P8KtaFyjJx8cn1LA6CmvXlLzuLkBqHx9EO0ucYbWLWkYebWYIvg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH v2] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdVn8C9qte4lKYxEOXexEb5NUBWrbyYIQAgAgBfQA=
Date: Mon, 12 Oct 2026 20:23:11 +0000
Message-ID: <811e7879-ff47-4c87-bb55-53262eedcd71@epam.com>
References:
 <e73c282694e68083305d03219f983bf74a8bf494.1791392326.git.dmytro_prokopchuk1@epam.com>
 <bbc500e1808a7bca4385189e35eb6434@bugseng.com>
In-Reply-To: <bbc500e1808a7bca4385189e35eb6434@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|VI1PR03MB6525:EE_
x-ms-office365-filtering-correlation-id: 9aee6cbe-ab10-43be-b9c5-08df289ea353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|1800799024|376014|366016|18002099003|22082099003|10067099003|13003099007|3023799007|4133799003|11063799006|5023799004|4143699003|261009223027099003|38070700021|56012099006|260925022911599003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info:
 CBuzninQ8PTwQNQ44LCwvvYuQG96XAXRHFUi4YkmSd1t/yWCjcZeRWXGaJhXRAmiSP9wcQmzjvln/FVpIc9a9+ZS0fifgHUqjyW5XIlB62p37U9+8032jaxN2qd2TgYV/msoy8lECjOwoldsXf0XQbyBLtsGlYPPdfCdKWzm3J7Xtp9Rag+rWgpNXVybpfDj0vZoHC8JvJKDkAgxioXkBTD2ADR48FrJnGV8wcQg3ud6Y3t6lfdI9uJAP75ZUnwwTH0aX0zIYbGGOQYwCKmoc4Y1R8TyD5vqcJcPmdqbXt9GZ4UJ1/FAkCz7zwyv0dFRKgUnrbd0r3x94yn/zDaJWrEW7UnD1KQNlVEequF5YSVWV9LDvLaQteRdWz83nsv6gnc4z2gr1CY4U2/zvu3kTxhvWTTddA8y24kK64AAnZnVQNX8T9FD1O8DuodsNzR8Bs4lelFhGghcARsUYsiS52v+6Yn1rEEdSWEVzclqAdpd5G6SSUFkZm6gMXyMk9tHhnK2sNlNIfxHJEFOEQSzQTy9GwQ7qWKGLUU5JL7ukfjpYVlyGwpgo7pZtw8jlhlzvHAWX3yDYKyFjsKjqdDz5syNQFyDUqBdGDGm6MShUMS3hjO0i+LArT7CH9yqqjLAPBd044JJImMijBa3GsfmcGu9rCVa+rK1zNQLR+ohgNc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(4133799003)(11063799006)(5023799004)(4143699003)(261009223027099003)(38070700021)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dThNenA4VHRodDJHendMaG1WN1JSWjI5amRvYjQ5OGhhSXNIbDJxR3hNR3h3?=
 =?utf-8?B?V0R0RU92ZnIvQXBNUGovTkJic2lqcnBlZ21LenNlWTBjL2lVNkFRY2FVZGJJ?=
 =?utf-8?B?OEVRdXFKZGRSRHRWYU50VW5ibW9HanZLYUZFN1g0VVI4N01kT3NZN1QzVkxB?=
 =?utf-8?B?b1JJS2pWTUZNZGlMZkNLT0RvWVV4ZjdQd3A5Q0dNSjBSZ2cxV2pyTXp3eU5P?=
 =?utf-8?B?d3RHRExVbEo2dGFaWDBsV2I1dTdVbnVReUVVbk4xVEdHTUlTanJIc1B5WFVO?=
 =?utf-8?B?ekh2WE1qR3BxU3hXZ21SeWMwOEt1V1lyWk1MSHUzUkp5ZXNYNDZtckFJY1JX?=
 =?utf-8?B?Mm90MkRNcWN4Y1J5TmxzODc2Q0E1OGhVcnlWTzdGd0pxUTlZdUk2T3FVUXpw?=
 =?utf-8?B?bzRjS1BSZFZuZkhGT29lRmNuMnR3bHhZaWZNOW1ycmtjbCtwWU1qUlpmL09S?=
 =?utf-8?B?Z3UzNDdUQnVDT2tZMmE2STgrdWNXc3JDbGpBb1dYOUNEcU9hMkgwRjMxR3Yy?=
 =?utf-8?B?WElTdmluR1Uzd0tuZGNYOUJPb0NvM2Z6ZlRvcXpmTW01M2ZXM3JRZTRVUUI0?=
 =?utf-8?B?SlMrYytMNGNHZzZTNjJMb010eWtMQ0lDUGlBcHh4Y2oyL2orY2hPK3NkTGlm?=
 =?utf-8?B?bjRvQXJic3Q3Sk9KNmp6V2t3bjJFNnBud25mdnJzcy8rSm81VDNJSm0ycEJ5?=
 =?utf-8?B?VHdERW1hSk9ITnlndlUyeEx5SEg4Ukt4dXErbVcrbElwZ1ZrcmJpQWp0UHA4?=
 =?utf-8?B?RkZpUG53NkJId1ZUTzkxQVYzeGdCa2hHeVlWM3c5c2xVOVVUb0pEVkRyTGxJ?=
 =?utf-8?B?c3BXR1VIT1poalE1V1Q5TEpYTlVSZ2UzWmh4T3RIMVVJRk5WS2s5aXhrdmxz?=
 =?utf-8?B?cUtKeHZheWdGVjNpSXNDR2x5VTFZV1pFenV6ZjI0blIrVUNGYlRvWlBLT2Vo?=
 =?utf-8?B?K0l3L0wzZHNRNG9EcnRRTG51SWJBdFNuMzZnT3BEK0R5YzY3dUJ3SkphbTdy?=
 =?utf-8?B?eWZJUUtvTUNFeE9TSHBmeWMyOURIVEUraUh2Wm1OWUthN3lGMzJwZ1c0MkNW?=
 =?utf-8?B?TkxuZEUrOUt2UzFBMnJoWisyU2txb0diRUhKeDA4cUVMU0k2UkNSQ0tRZnd6?=
 =?utf-8?B?UzdIYUZ3YkhmYzBTc1QyUE1Od0R3bi93aWJOVVdoelBWRTc2c2hzVllzZGJB?=
 =?utf-8?B?Mjg0aEVmanFOQStZZDV0NlhFemxmYlZhTTB3QlJGZTI5OEdteFVaMkJFUzNT?=
 =?utf-8?B?V1ZMSjFLQTNLdWNBN3cxVkVlSXJaSlNEVkRsZ3NDTjVlZk5SUUNkL0lnT2Ra?=
 =?utf-8?B?Z1lTdUZUdUQ2dXR5UlowdVpIdVZ0Q1JJb2NuM0o4ZUd4ZkpUWCt2ZWNnelVI?=
 =?utf-8?B?TnlZVnBNU3BLUCtFSXpRNUFQVmV4RDhVbmJtMVY0OVJpd2dUbS9GNGZPVVEv?=
 =?utf-8?B?RmpTME8vOEhmOHhxYzFiUTk1Vndtd1hvQTlSNnVDOGt1RlVBTHVHS3A0OFJE?=
 =?utf-8?B?N3FJVUVZZ04zdWRqbWNDQ0IwUjRjTHEweU0yTWJoU29ZRVBPZ2U2MkZ0N0Ux?=
 =?utf-8?B?WGVCdVU2dmtvcWRVdlpEZCtQU0I2Vk9zekhxTGdJUlVXVGlOS3FsRkFVZVRu?=
 =?utf-8?B?ay9iSEcvV1pXRjNEY3NUV0xrSlNjRTJna25MWnBaNldnVmFIbWdCdzBDcGln?=
 =?utf-8?B?eXYwczVTRW55ZUFXVHNLTUN4bERkdncvZlpLN2JXbDdteWtIY0QvQkdKVll2?=
 =?utf-8?B?K1pTamZjbXdiYlV6UmZuQm1SSHF2T3cyLzRsam9IVi90T04vS2hFeGhmckFG?=
 =?utf-8?B?OE4yUGhXakVxb1pPSmFubnMrRVBabzhSTFdLZDRKV25PbndEUjlKVWJGeSsx?=
 =?utf-8?B?M21xR1RNVG5YWElvcGxyWHFVeklZN0paeldNNlFyZmhvckM5NXBzdm43dStJ?=
 =?utf-8?B?Vkw0YmlzWkpYWGI5Qy9ZaUJNakowRnNHQ3orZHUzK0tVK3d1aDFVQkozR3Mw?=
 =?utf-8?B?cGFhdVJueUZkUW9ncUUxYkdlUDJSSnFQeG9LZ2N1WUpuUVVFeVk4UHVnZlZh?=
 =?utf-8?B?VDJBcUhNQnkzSEY1VWxQa2dKczVFdi9US3VQSVRMMCthMVNRVlEwcUsvenZa?=
 =?utf-8?B?clUzWkgzWWdkMVJvd1I4dXJtV1ZjNDBpOExQR1BIZFU5WkE1a2xQSVc1Yklp?=
 =?utf-8?B?NnpKRmN4N3dSMFhXSVRBU3EyZzJrUEZGVzg3Sy9RNVlkbmFhdTEzb0c3c0lB?=
 =?utf-8?B?VG42b3BlTTVBS0g4WG9ZSVErRVh1bFZZTjVpSUN2QVB4aVROL1ZCYmFuaTRN?=
 =?utf-8?B?a20ySGFiZWNEbllOZnZBM3lmTFFDYm4rT2VZaTR2elMxc0I0Y3ZTSUtVOXoy?=
 =?utf-8?Q?9gsKuR6G5MYHZm4w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34E44B3D7EB39B4699651DDB560D816D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aee6cbe-ab10-43be-b9c5-08df289ea353
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 20:23:11.9647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /C1r+CGw97DtUS2uV0L4+2B1TkRZMQD2qF0/TeqeTIl8BhpzFwlbfgDCRu/WGzxNMQtZm3RNxfeZhzdYYqVGZEE7cTO81CFIf8WnJBNquww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6525
X-purgate-ID: tlsNG-33051d/1791836595-77EC24E9-A80C27A1/0/0
X-purgate-type: clean
X-purgate-size: 7346

DQoNCk9uIDEwLzcvMjYgMjE6MDcsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI2LTEw
LTA3IDE5OjEyLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBUaGUgaGlkZSBwYXR0ZXJu
IC54ZW4tc3ltcy5bMDEzXSBsZWF2ZXMgcGFzcyAyIHZpc2libGUuIE9uIHg4Ng0KPj4gTEFTVF9M
SU5LSU5HX1BBU1MgaXMgMiwgc28gdGhhdCBpcyB0aGUgZmluYWwgbGluay4gT24gQXJtDQo+PiBM
QVNUX0xJTktJTkdfUEFTUyBpcyAzIGFuZCB0aGUgZmluYWwgaW1hZ2UgaXMgLnhlbi1zeW1zLjMu
IFBhc3MgMiBpcw0KPj4gdXN1YWxseSBvbmx5IGEgc3ltbGluaywgc28gRWNsYWlyIHNhdyBubyBw
cm9ncmFtIGxpbmsgYW5kIHJlcG9ydGVkIGV2ZXJ5DQo+PiB0cmFuc2xhdGlvbiB1bml0IGFzIHVu
cmVhY2hhYmxlLg0KPj4NCj4+IEJlZm9yZSB0aGUgYW5hbHlzaXMgYnVpbGQsIHJlYWQgTEFTVF9M
SU5LSU5HX1BBU1MgZnJvbSB0aGUgYXJjaGl0ZWN0dXJlDQo+PiBtYWtlZmlsZSBhbmQgdGhlIHBh
c3MgbnVtYmVycyBmcm9tIHRoZSBmb3JlYWNoIGxpc3QgaW4NCj4+IHhlbi9zY3JpcHRzL01ha2Vm
aWxlLmxpbmsuIEhpZGUgZXZlcnkgcGFzcyBleGNlcHQgdGhhdCBvbmUuIEFuIGVhcmxpZXINCj4+
IHBhc3MgdGhhdCBpcyBhIHJlYWwgbGluayBzdGF5cyBoaWRkZW4uDQo+Pg0KPj4gRml4ZXM6IGE0
MDFiNWM5ZGMzNSAoIkVjbGFpcjogcmUtZW5hYmxlIHNjYW5uaW5nIG9mIHRoZSAoYWxtb3N0KSBm
aW5hbCANCj4+IGxpbmtpbmcgc3RlcCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29w
Y2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBDdXJyZW50IHBh
dGNoIGlzbid0IHRlc3RlZCwgc2VudCBqdXN0IGZvciByZXZpZXcgKGlmIHRoaXMgYWNjZXB0ZWQs
IA0KPj4gSSdsbCBydW4gcGlwZWxpbmUpLg0KPj4NCj4+IENoYW5nZXMgaW4gdjI6DQo+PiAtIHVw
ZGF0ZSBjb21taXQgbWVzc2FnZQ0KPj4gLSBnZW5lcmF0ZSBoaWRlIHBhdHRlcm4gYmVmb3JlIGFu
YWx5c2lzDQo+PiAtIHJlYWQgTEFTVF9MSU5LSU5HX1BBU1MgZnJvbSB0aGUgYXJjaCBNYWtlZmls
ZSBhbmQgcGFzcyBudW1iZXJzIGZyb20gDQo+PiB0aGUgTWFrZWZpbGUubGluaw0KPj4NCj4+IExp
bmsgdG8gdjE6DQo+PiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz8gDQo+PiB1cmw9aHR0cHMlM0ElMkYlMkZwYXRjaGV3Lm9yZyUyRlhlbiUyRjJmNjdlZjdj
NDU5M2QzYWI5NGI3NWI1YjgxOWU3ZTA0NmUwNTU3OTYuMTc5MTI5MzY4MC5naXQuZG15dHJvLl81
RnByb2tvcGNodWsxJTQwZXBhbS5jb20lMkYmZGF0YT0wNSU3QzAyJTdDZG15dHJvX3Byb2tvcGNo
dWsxJTQwZXBhbS5jb20lN0M5YjA1MDExMDFhZjk0MDAyMDE1NzA4ZGYyNDlkZTQ4ZiU3Q2I0MWI3
MmQwNGU5ZjRjMjY4YTY5Zjk0OWYzNjdjOTFkJTdDMSU3QzAlN0M2MzkyNjk5MzI3MDgzNzM3OTEl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdM
akF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0Ql
M0QlN0MwJTdDJTdDJTdDJnNkYXRhPWdodzlsQTJGcFJvM2ZWN1A4SEJzbG1DRWJTSkIyOUF2S1RI
ZGdXWmZyNnclM0QmcmVzZXJ2ZWQ9MA0KPj4gLS0tDQo+PiDCoC4uLi9lY2xhaXJfYW5hbHlzaXMv
RUNMQUlSL2FuYWx5c2lzLmVjbMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPj4gwqBhdXRvbWF0aW9u
L2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHl6ZS5zaMKgIHzCoCAzICsrKw0KPj4gwqAuLi4v
RUNMQUlSL2dlbmVyYXRlLXhlbi1zeW1zLXBhc3Nlcy5zaMKgwqDCoMKgwqDCoMKgIHwgMjAgKysr
KysrKysrKysrKysrKysrKw0KPj4gwqAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+IMKgY3JlYXRlIG1vZGUgMTAwNzU1IGF1dG9tYXRpb24vZWNsYWly
X2FuYWx5c2lzL0VDTEFJUi9nZW5lcmF0ZS14ZW4tIA0KPj4gc3ltcy1wYXNzZXMuc2gNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2FuYWx5c2lz
LmVjbCBiLyANCj4+IGF1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9hbmFseXNpcy5l
Y2wNCj4+IGluZGV4IGM2ZTFhN2E5NWQuLmRmMTAwNmJjYWEgMTAwNjQ0DQo+PiAtLS0gYS9hdXRv
bWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHlzaXMuZWNsDQo+PiArKysgYi9hdXRv
bWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHlzaXMuZWNsDQo+PiBAQCAtMzcsNyAr
MzcsNyBAQCB0aGVpciBTdGFuZGFyZCBMaWJyYXJ5IGVxdWl2YWxlbnRzLiINCj4+IMKgLWRvY19i
ZWdpbj0iRG8gbm90IGFuYWx5emUgaW50ZXJtZWRpYXRlIGxpbmtpbmcgYXJ0aWZhY3RzLCBhcyB0
aGV5IGRvIA0KPj4gbm90IGRpZmZlciBmcm9tIHRoZWlyIGZpbmFsDQo+PiDCoGNvdW50ZXJwYXJ0
cyBmb3IgdGhlIHB1cnBvc2VzIG9mIE1JU1JBIEMgc3RhdGljIGFuYWx5c2lzLiINCj4+IMKgLWZp
bGVfdGFnKz17eGVuX2VmaV90bXAsICJeeGVuL1xcLnhlblxcLmVmaVxcLihbMDFdfGFsdFxcLi4q
KSQifQ0KPj4gLS1maWxlX3RhZys9e3hlbl9zeW1zX3RtcCwgIl54ZW4vXFwueGVuLXN5bXNcXC5b
MDEzXSQifQ0KPj4gKy1ldmFsX2ZpbGU9eGVuX3N5bXNfcGFzc2VzLmVjbA0KPj4gwqAtZnJhbWVz
Kz17aGlkZSwgImtpbmQocHJvZ3JhbSkmJnRhcmdldCh4ZW5fc3ltc190bXB8fHhlbl9lZmlfdG1w
KSJ9DQo+PiDCoC1kb2NfZW5kDQo+Pg0KPiANCj4+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2Vj
bGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHl6ZS5zaCBiLyANCj4+IGF1dG9tYXRpb24vZWNsYWly
X2FuYWx5c2lzL0VDTEFJUi9hbmFseXplLnNoDQo+PiBpbmRleCAyMzU2ZmM0MDA3Li5lZjU5ZTg3
MjEyIDEwMDc1NQ0KPj4gLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2Fu
YWx5emUuc2gNCj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9hbmFs
eXplLnNoDQo+PiBAQCAtNzgsNiArNzgsOSBAQCBleHBvcnQgRUNMQUlSX1BST0pFQ1RfTkFNRT0i
WEVOXyR7VkFSSUFOVH0tJHtTRVR9Ig0KPj4gwqBybSAtcmYgIiR7RUNMQUlSX09VVFBVVF9ESVI6
P30vKiINCj4+IMKgbWtkaXIgLXAgIiR7RUNMQUlSX0RBVEFfRElSfSINCj4+DQo+PiArIyBHZW5l
cmF0ZSBoaWRlIHBhdHRlcm4uDQo+PiArIiR7U0NSSVBUX0RJUn0vZ2VuZXJhdGUteGVuLXN5bXMt
cGFzc2VzLnNoIg0KPj4gKw0KPiANCj4gSSB3b3VsZCBwcmVmZXIgaXQgaW50ZWdyYXRlZCBpbiBb
MV0gaW5zdGVhZCwgcnVubmluZyBpbiBwcmVwYXJlLnNoLiBBdCANCj4gbGVhc3Qgd2Uga2VlcCB0
aGVzZSBjYWxscyB0byBFQ0wgZ2VuZXJhdGlvbiBzY3JpcHRzIHRvZ2V0aGVyLg0KDQpBY2suIEkn
bGwgcHJlcGFyZSB2My4NCg0KPiANCj4gWzFdIGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vPyANCj4gdXJsPWh0dHBzJTNBJTJGJTJGZ2l0bGFiLmNvbSUyRnhl
bi1wcm9qZWN0JTJGaGFyZHdhcmUlMkZ4ZW4lMkYtIA0KPiAlMkZibG9iJTJGc3RhZ2luZyUyRmF1
dG9tYXRpb24lMkZlY2xhaXJfYW5hbHlzaXMlMkZFQ0xBSVIlMkZnZW5lcmF0ZV9lY2wuc2glM0Zy
ZWZfdHlwZSUzRGhlYWRzJmRhdGE9MDUlN0MwMiU3Q2RteXRyb19wcm9rb3BjaHVrMSU0MGVwYW0u
Y29tJTdDOWIwNTAxMTAxYWY5NDAwMjAxNTcwOGRmMjQ5ZGU0OGYlN0NiNDFiNzJkMDRlOWY0YzI2
OGE2OWY5NDlmMzY3YzkxZCU3QzElN0MwJTdDNjM5MjY5OTMyNzA4NDAzMjc0JTdDVW5rbm93biU3
Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lz
SWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3
QyU3QyZzZGF0YT1yb1pvTCUyQm9pcGhMOWEwaEpoT1dFOSUyRnIzTFNyWXBmJTJCT09nWlJidlo5
SE4wJTNEJnJlc2VydmVkPTANCj4gDQo+PiDCoCMgUGVyZm9ybSB0aGUgYnVpbGQgKGZyb20gc2Ny
YXRjaCkgaW4gYW4gRUNMQUlSIGVudmlyb25tZW50Lg0KPj4gwqAiJHtFQ0xBSVJfQklOX0RJUn1l
Y2xhaXJfZW52IiBcDQo+PiDCoMKgwqDCoCAiLWNvbmZpZ19maWxlPScke1NDUklQVF9ESVJ9L2Fu
YWx5c2lzLmVjbCciIFwNCj4+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNp
cy9FQ0xBSVIvZ2VuZXJhdGUteGVuLXN5bXMtIA0KPj4gcGFzc2VzLnNoIGIvYXV0b21hdGlvbi9l
Y2xhaXJfYW5hbHlzaXMvRUNMQUlSL2dlbmVyYXRlLXhlbi1zeW1zLXBhc3Nlcy5zaA0KPj4gbmV3
IGZpbGUgbW9kZSAxMDA3NTUNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmUzNzk1ZTgyMzQNCj4+IC0t
LSAvZGV2L251bGwNCj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9n
ZW5lcmF0ZS14ZW4tc3ltcy1wYXNzZXMuc2gNCj4+IEBAIC0wLDAgKzEsMjAgQEANCj4+ICsjIS9i
aW4vYmFzaA0KPj4gKw0KPj4gKyMgSGlkZSBldmVyeSB4ZW4tc3ltcyBsaW5raW5nIHBhc3MgZXhj
ZXB0IExBU1RfTElOS0lOR19QQVNTLg0KPj4gKyMgVGhlIHBhc3MgbGlzdCBpcyB0aGUgZm9yZWFj
aCBpbiB4ZW4vc2NyaXB0cy9NYWtlZmlsZS5saW5rLg0KPj4gKw0KPj4gK3NldCAtZQ0KPj4gKw0K
Pj4gK2NkICIkKGRpcm5hbWUgIiQwIikiDQo+PiArYXJjaD0kKGVjaG8gIiR7WEVOX1RBUkdFVF9B
UkNIfSIgfCBzZWQgLWUgJ3MveDg2LioveDg2LycgLWUgJ3MvYXJtLiovIA0KPj4gYXJtLycpDQo+
PiArbGFzdD0kKHNlZCAtbiAncy9eTEFTVF9MSU5LSU5HX1BBU1MgKjo9ICpcKFswLTldXCkuKi9c
MS9wJyBcDQo+PiArwqDCoMKgICIuLi8uLi8uLi94ZW4vYXJjaC8ke2FyY2h9L01ha2VmaWxlIiB8
IGhlYWQgLW4gMSkNCj4+ICtwYXNzZXM9JChzZWQgLW4gJ3MvLipmb3JlYWNoIG4sXChbMC05IF0q
XCkuKi9cMS9wJyBcDQo+PiArwqDCoMKgIC4uLy4uLy4uL3hlbi9zY3JpcHRzL01ha2VmaWxlLmxp
bmsgfCBoZWFkIC1uIDEpDQo+PiArdGVzdCAtbiAiJHtsYXN0fSINCj4+ICt0ZXN0IC1uICIke3Bh
c3Nlc30iDQo+PiAraGlkZGVuPSQocHJpbnRmICclcycgIiR7cGFzc2VzfSIgfCB0ciAtZCAiICR7
bGFzdH0iKQ0KPj4gKw0KPj4gK3ByaW50ZiAnJXNcbicgXA0KPj4gK8KgwqDCoCAiLWZpbGVfdGFn
Kz17eGVuX3N5bXNfdG1wLCBcIl54ZW4vXFxcXC54ZW4tc3ltc1xcXFwuWyR7aGlkZGVufV1cJCAN
Cj4+IFwifSIgXA0KPj4gK8KgwqDCoCA+eGVuX3N5bXNfcGFzc2VzLmVjbA0KPiANCg0KDQpCUiwg
RG15dHJvLg==

