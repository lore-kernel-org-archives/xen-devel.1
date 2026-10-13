Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86402CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 07:29:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446697.1662795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGWx0-0004Qj-Gc; Tue, 13 Oct 2026 07:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446697.1662795; Tue, 13 Oct 2026 07:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGWx0-0004Qc-DO; Tue, 13 Oct 2026 07:29:30 +0000
Received: by outflank-mailman (input) for mailman id 1446697;
 Tue, 13 Oct 2026 07:29:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGWwy-0004QW-Nl
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 07:29:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGWwt-00EKeT-0j
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:29:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acdddcf-2eae-0a2a0a5409dd-0a2a4508a952-16
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:29:22 +0200
Received: from [52.101.84.73]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6acdddd2-f659-0a2a45080019-3465544935a7-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:29:22 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS8PR03MB10083.eurprd03.prod.outlook.com
 (2603:10a6:20b:62a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 07:29:20 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 07:29:20 +0000
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
 b=PauyRwQhF8JveXxIhaORRZnJMBMjoc+Gw5d5PBuXRyZJN3czVRptxOLLaxiHHpxcohj2dpVkJ9YIl4E7pgKVJdiw+vyWvIN92fjo6/MBc4TH7d6/qR/0OqGacVutF2oaJ16Wyh/C2oT+vJWgNJT3MQPghnyY5lMimsH9tR9akFLlIC/rcXm57Rkt23w8YOx1DoTPUBsGDiKjSPKd4Mj3Z616e1wIgESONA70oqvi1oG9rR2+yH3/kLTVEUfdA1jhmGddGO4cByMvuatZ2pdQ+1RfuK+kUn6p+2juX+I5EzVUKhQ0bmkeLBAt7zmAW8KyukMySI46MnZm9fI2bhUwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICvgrGM4OVsuwr7WIa2lr6J+OXZco05iJnrNESNsDjk=;
 b=iMntE/QcnlUjjz1HLGQ1nZsxMa2QaLpi2loHTVXPwNyFd9tHDbuSoQJelSTwBJmOD0qAXycNjYigXs7eYDoRq+m8TBkkAL/OfSaPKvr9s/oU4JP2yO7sLCrUYNisZY4hqE3XyUjtTD+ovWY/zJMufVUcABN9D5TaiGcrbdPju13faGuu6A5OrJCuyUjYq8R/sMumhIaL/VT8cJAiUUf3NxfWKKpf61zMC5VbVSl3bcrs3VHmAhKpU0FM8hVgm16mRUMzG3mP/2j7bYGgBeUNzc1ohgIA00LWOZOSU1jCktVJqDQT89RO/JYREByav4Vb2s2IrRzi7sH1eByANY0Jfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICvgrGM4OVsuwr7WIa2lr6J+OXZco05iJnrNESNsDjk=;
 b=mEeeZNgH0GJaSjzUUtpcOCO+Qwx0a8C8vzpdi3BLjUXWLp9Hc5zecuTZ/9M6M3FLMHVqSzsydLs2XgZK2cA7E8g3pyh0BQi7R3rnjmCBtFBenuUaAlWKY8kTLI7WjUFVEPoA4huNaNYn7RlDM3PpnzB+ZsJgoX0BLG6cSxzd6LXVqNdQ9RSndowOPhB24ZW2GrRsDrpSmSQvJ8QlVt8bTD4lkngkHEusv7pTwVpGpLxz4loSHrjayQESNJL1wZE4F7OUgSLbYY4gSPx6saRserLRik+izHu/9Edh4cvX6bFWQOtJ9VnatVDOCHmm4MjJCviS/XJHqkPz7WVkYmx2xw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>
Subject: Re: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Topic: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
Thread-Index: AQHdVPs3la7Yb/mPXkSleujSDB++zbb1XiyAgAQkOoCAAZzAAA==
Date: Tue, 13 Oct 2026 07:29:20 +0000
Message-ID: <0836fc6d-e2e7-4977-a0ec-c66671b75a62@epam.com>
References:
 <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
 <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
 <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
In-Reply-To: <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|AS8PR03MB10083:EE_
x-ms-office365-filtering-correlation-id: 8c630920-2dc0-482b-cf90-08df28fbb27b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|42112799006|1800799024|23010399003|4143699003|11063799006|38070700021|56012099006|18002099003|22082099003|6133799003|260925021311599003|260925021911599003|260925022911599003|261009223027099003|4133799003|10067099003;
x-microsoft-antispam-message-info:
 QjyqzuZNK4afMnfOt6SUCHa9gRRQM5BRk5iDiLb+BlLPmN3+wsEPJUkuWx2OChnOmETBsOVJWzoTalEdCUkd/kjrCQLbYTFcsP9EnzakKrRV0vF2enThjNKSNZwX/hnW0K+oFhReN9nEB1GiZzvc9GjNXZg/6QgtNNtvngD4iYrVvAGD2CTp9KUdCj0RNDcEai5g7ogF+zzxSrZWEjapCZ4AG7zlGyUFG8XbfJO9HNxEwuYrpWVVEo9brzIa9Z31fB8HjRGjzDEj6ql+PXQiBoSlr1PiGkAgxVD8g29mYAUALJXryDgJSV0Zt5620PKrGJgFpcmT/7pyvjClo+ycwo5B+biCNVvilVdNCTwfXt/VNEF9NqL3gGT6V5OYG5Vyp/jtnPwQHiIvfnIxdhClpqI54P5a89SHXP8f+i/BuYROIZmv9jroBY7S8Esk89MlMQ0fPSH+mIp4pkj+BFtm0RBGJkJeLfxUa9sAU/J/m8y6aWOiAR4COFyLViNMH5k03LkpozfLnXlOd8aMTrbpn8Grge9EIckFRbXBwx8b8Gz7kq97l51il8c7Agg2u337YkspY3TWC4hK2crraqEHuUbbsxZ/7vfzyOo8S5kgjEyE2NorYoKz1byNrVw00S42pG1QkPnxVJbiXeMCld/5Mge+06DpeVXs2ck26yC9iTc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(42112799006)(1800799024)(23010399003)(4143699003)(11063799006)(38070700021)(56012099006)(18002099003)(22082099003)(6133799003)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(4133799003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YkhWZjM3ZXdjVHB4eTlKbVphSkxMRmszaS96K0I1ZFcyQlRtZllLM3JlVi9x?=
 =?utf-8?B?MnVyNzJwSjJtdXhGc214MjZjRTdzL3NDVHBDdlJqcmNqNlRzQ05paVhHM1dP?=
 =?utf-8?B?ek93Y0hITzBiV0JXbitYMjh4ME8rLzNNWWo0dmZnSGhLbWJMemJ1RHovc1Ez?=
 =?utf-8?B?NVB5ZGdySGx0cFNrV3oyUlVHNEVXdDhGUzk4WTNLSWN2d25IbWhVQUxoSWhE?=
 =?utf-8?B?L1RXM2dmMmh2V3dDRWpDbWgvSGpNa2h2L3p4dGRBaWxVelJaRnJGbjhGeXM2?=
 =?utf-8?B?WDhaSXlqTXFwQVNKcGZKUDdwNjNkUm9BWEk2VFVLRlpaOFBhcnNSeUdmWHlx?=
 =?utf-8?B?bmJSOEoyR3NpRkloU2tadjhObUh1d1BYOEp4TTJiR3pPUFlnR2RjUHFjT2N1?=
 =?utf-8?B?aWZNSEtnUG1vUmZVbWd1Z3d3Zksxd1kzc2RXVnNxbEJ1THNxZlBFOUx6VXJR?=
 =?utf-8?B?b09NcitRSGFUNGlOTWd0Vk8wY09wL2ltRXc2OWQ3L2FlbEhhTG9Zd21UVit6?=
 =?utf-8?B?ZzBEdzFxNXN2OTZKcjhlcHBwR1draWlzamcwUmQ5SVpPem5rd3R1bTZ0UTBU?=
 =?utf-8?B?enV1cDBuMTltSWRBNXpLeTRjQjEzRFc0RURpbDlBeHREaHI4VlBqRmJvV3hD?=
 =?utf-8?B?U1JKOE42N05PRVdGdjd3WEZQV1lKU0lQamxPWjF2ZEtaa2w5K0Z0cFBRcy9l?=
 =?utf-8?B?MG00U2dUOUxDbDhCVWlqZ2hreUhVckFmWTVWTnhWM0dSMmR3b1NNb2tUWERN?=
 =?utf-8?B?RTZjY0VaYmpwb25laXg3My9PWDRmWWRXRElBb2lteVVrY1hiaXdpMnJhSm05?=
 =?utf-8?B?TGl5Znl5Y3k0aUErOUw4MnFYNS9jVXJpcUpPVURDNytFRzVtYW1XWDRCNFVu?=
 =?utf-8?B?NlllMmx5MXJ2eFhvUGs4aUpYUEVYNVc5QXBZVGZ1Sjd3dG5razZnMzljMkl4?=
 =?utf-8?B?aUtQc0hLQTByUVpVbFdjUStvaExIbDYvVXEvMnkvVyswVSsvVFJtU0VPQUJL?=
 =?utf-8?B?N1ZHbSs5MDNmM1dLNmw5bFE1QTBzdDNFOWJlRS9acktpbU9qbVc4TmNUZnlz?=
 =?utf-8?B?QlhDejI1UGdlc1M2U3VBZnFhb2IvVzFtMHVmaGd0Y1Jqb3p1cUVRTmI1cnVm?=
 =?utf-8?B?dVo2ZmFkL3pDNHRSVzFvclRoZzVVanIzZmFHVml1OXV3QTNYc2JrWldITEph?=
 =?utf-8?B?bW5EdGF6K1hSUmFITHlTR1lkcG1ielZsU05hQ3J4VEZnOHYxZW9UVEhHVlZE?=
 =?utf-8?B?enV3YXpleGQySUJLM0NyTzlQbjJZZ0JhUThMYStROVl0YWhUcERKVE1MVzNu?=
 =?utf-8?B?U2poakRSbXJ2RXV2U2VxUmdWZDdEQU9YNFV1RHNIdTNCSVh1RkhTczNZQnoy?=
 =?utf-8?B?WEgrMG1DTlZ0a3ZoQ0hDaVYrUGxIYmRwQ3J6RS9kUzlha0FlM3JwN3BrUGg5?=
 =?utf-8?B?YStOc2dHSm1NcEllZTdZcEVHVEpOVm9odW1oZ2xPQW9tYzFUWTZKVmt0dTl1?=
 =?utf-8?B?dUJJUXh6WmhJbzF2QXZpK1d4UzJvOHZQM0lzWWY3V1U0bEpyNHpralFibUlm?=
 =?utf-8?B?NVJRV2NQZFZMdnMyTlp2UzU3RXhta3krTEYwQWhMTXJ0YzA2NTAyT3lmYS9D?=
 =?utf-8?B?WVlQZlc2c2tWbUxVVWRhVHVERG1aaGdtQWc3bUM1K1B2NkFJVUJFOUowSS9T?=
 =?utf-8?B?blBJMERPMXp3RTJDOUxYeUhXSXdGdXZYWjk2SDM4czVaQ2RHcjF5YkFuVHF6?=
 =?utf-8?B?cXJNVWhOS3NHYXFHMGdoZThNQ2hUWXJOZ0xBbExoNkxoYmJPeG04c3crWUVi?=
 =?utf-8?B?TlhtaTVmSFJXSlN6WEFrNmJJM0xNZEFSamlyUlNpUkxTbFo2TUlSK1FpMkll?=
 =?utf-8?B?Y29mOVc0bXUzeWFQRlVqa1lPM011L2NJeEZFR0puNlFRTGptb3RBdEs1QU5l?=
 =?utf-8?B?V3lIaW9ON2ptakJFdEpmaGJWZHRNWk9Udll2cDhJZ044emRLdnUyQ0ZCVzhj?=
 =?utf-8?B?TTAzbmt4eDRnZnJQVTdTcERYSURmUmtaanFoYVd6cTBzSDBEOXB0S3FLWXk2?=
 =?utf-8?B?bVoxbE5OOHRsSHdDQ0FSTEczVlA2TW9ncTh5UEg1Y0dxNDlla1hJQzJiVE1G?=
 =?utf-8?B?eE9FQjRGK3dhUlRsTnY5WTBOa3NCUjcvbHhLejFEbXpaWHNnY2lXdkN5c1Ru?=
 =?utf-8?B?SVVtQVV5OVZzQVNwcDJpSmVrOUtEaUJkV0lCYUF2RTdNSExrdnZVZFVGNmJZ?=
 =?utf-8?B?UjNNOW4xQXBPZHdRbndNOCtHdTVNNEVSSGJ0K0hQYjlQb1NmeitkZndGZTVS?=
 =?utf-8?B?Nk9LNUxGV0Y1SXBXblFzRDBhUTNLdWRaQkovRm1aV0dsd2pzcmNCZ2VPYkVx?=
 =?utf-8?Q?rk3ebzap11xGu4a0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DC2776268D83544905A49E2C8F152A2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c630920-2dc0-482b-cf90-08df28fbb27b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 07:29:20.5697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRn5LdwwLvLPIdY97tYAqHnKGhiKHJOqHsrMm5rLmFeb71o0DLWI8bes/t8RQ+Pioitvm7O4CMSKr7y2TQRHEZkzwyG18Ym+smDs30tz5Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10083
X-purgate-ID: tlsNG-c1860d/1791876562-D4B7187B-3DADA1DE/0/0
X-purgate-type: clean
X-purgate-size: 3844

DQoNCk9uIDEwLzEyLzI2IDA5OjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMTAuMjAy
NiAxNzozNywgTmljb2xhIFZldHJpbmkgd3JvdGU6DQo+PiBPbiAyMDI2LTEwLTA1IDIwOjU2LCBE
bXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4gVGhlIFIxMS4xIHNhZmUgY2FzdCBvbmx5IG1h
dGNoZWQgdm9pZCBub3JldHVybiAoKikodm9pZCAqKS4gQWNjZXB0IGFueQ0KPj4+IG5vcmV0dXJu
IGZ1bmN0aW9uIHBvaW50ZXIgY29udmVydGVkIHRvIGEgY29tcGF0aWJsZSBmdW5jdGlvbiBwb2lu
dGVyLg0KPj4+IGNhbm9uaWNhbCgpIGNvdmVycyB0eXBlb2YgZGVzdGluYXRpb25zLCBhbmQgY29t
cGF0aWJsZV9kZWVwX3VucXVhbGlmaWVkDQo+Pj4ga2VlcHMgdGhlIHBhcmFtZXRlciBhbmQgcmV0
dXJuIHR5cGVzIGFsaWduZWQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29w
Y2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4+IC0tLQ0KPj4+DQo+Pj4gVGhp
cyBwYXRjaCB0cmllcyB0byBjb3ZlciBib3RoIG9mIHRoZXNlOg0KPj4+DQo+Pj4gMS4gZWNsYWly
OiB3aWRlbiBSMTEuMSBub3JldHVybiBjYXN0IGRldmlhdGlvbg0KPj4+IGh0dHBzOi8vcGF0Y2hl
dy5vcmcvWGVuL2M2NjMyZGQ4MDVhMTE5YWNhNTRiOWQxYWUyZWVhNjhlZjljMTMzNGMuMTc5MDY3
NDM1OC5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVwYW0uY29tLw0KPj4+DQo+Pj4gMi4gRWNs
YWlyOiByZWxheCAibm9yZXR1cm4iIGZ1bmN0aW9uLXBvaW50ZXIgY29udmVyc2lvbiBkZXZpYXRp
b24NCj4+PiBodHRwczovL3BhdGNoZXcub3JnL1hlbi82ZDIxMmQ2MC01YzBiLTQ5MDktOTk2ZC01
ZDZhNDkwNmI3ZTFAc3VzZS5jb20vNGNjYTU4YjYtYjU1NS00MDY0LWFhMjYtNTIwNGRjNGI5OWNj
QHN1c2UuY29tLw0KPj4+DQo+Pj4gVGVzdCBDSSBwaXBlbGluZToNCj4+PiBodHRwczovL2dpdGxh
Yi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzI5MTQ4
MDI2NjcNCj4+Pg0KPj4+IFRoZSBvbmx5IG9uZSBSdWxlMTEuMSB2aW9sYXRpb24gcmVtYWlucywg
d2hpY2ggaXMgY292ZXJlZCBieSB0aGlzIEphbidzDQo+Pj4gcGF0Y2g6DQo+Pj4geDg2L2tleGVj
OiBhZGRyZXNzIE1pc3JhIHJ1bGUgMTEuMSB2aW9sYXRpb24gaW4gbWFjaGluZV9rZXhlY19sb2Fk
KCkNCj4+Pg0KPj4NCj4+IFRoZSBjaGFuZ2UgaXRzZWxmIGlzIGZpbmUsIGJ1dCB0aGUgYXNwZWN0
IEknbSBjb25jZXJuZWQgd2l0aCBpcyB0aGUNCj4+IGZvbGxvd2luZzogaWYgeW91IGhhdmUgYSBm
dW5jdGlvbiBtYXJrZWQgbm9yZXR1cm4sIHRoZSBjb21waWxlciBpcw0KPj4gZW50aXRsZWQgdG8N
Cj4+IGVzc2VudGlhbGx5IHJlbW92ZSBhbnkgY29kZSBmb2xsb3dpbmcgaXQsIHNvIGluIHByaW5j
aXBsZSB0aGlzIGNvdWxkIGJlDQo+PiB0aGUgY2FzZSBhbHNvIHdoZW4gaW52b2tpbmcgYSBmdW5j
dGlvbiBwb2ludGVyIChpLmUuIHRoZSBjb21waWxlciBoYXMgbm8NCj4+IG9ibGlnYXRpb24gdG8g
cmV0YWluIGNvZGUgYWZ0ZXIgYSBjYWxsIHRvIGEgZnVuY3Rpb24gcG9pbnRlciB0aGF0IGlzDQo+
PiBhY3R1YWxseSBhIG5vcmV0dXJuIGZ1bmN0aW9uKS4gV2hpbGUgdGhpcyBpbiBwcmFjdGljZSBt
YXkgbm90IGhhcHBlbg0KPj4gb2Z0ZW4gKGUuZy4sIHRoZSBhbmFseXNpcyBkb25lIGJ5IGEgY29t
cGlsZXIgaXMgcHJvYmFibHkgdG9vIHNoYWxsb3cgdG8NCj4+IGFjdHVhbGx5IGluZmVyIHBhdGhz
IHdoZXJlIHRoZSBmdW5jdGlvbiBwb2ludGVyIGlzIG9ubHkgZXZlciBhc3NpZ25lZCB0bw0KPj4g
bm9yZXR1cm4gZnVuY3Rpb25zIHdoZW4gaXQgaXMgY2FsbGVkKSwgaXQgaXMgc3RpbGwgbm90IGNv
bXBsZXRlbHkgdHJ1ZQ0KPj4gdG8gc2F5IHRoYXQgdGhlIGJlaGF2aW9yIGlzIG5vdCBhbHRlcmVk
IGJ5IGNhc3RpbmcgYXdheSBub3JldHVybi4NCj4NCj4gV2l0aCAiYmVoYXZpb3IiIGhlcmUgeW91
IG1lYW4gdGhhdCBvZiB0aGUgY29tcGlsZXI/IEJlY2F1c2UgWGVuJ3MgYmVoYXZpb3INCj4gd29u
J3QgY2hhbmdlIGlmIHRoZSBjb2RlIGZvbGxvd2luZyBzdWNoIGFuIGluZGlyZWN0IGNhbGwgaXNu
J3QgZWxpbWluYXRlZC4NCj4gSXQgd2lsbCAianVzdCIgYmUgdW5yZWFjaGFibGUgY29kZSB0aGVu
Lg0KPg0KPiBUaGF0IHNhaWQsIC4uLg0KPg0KPj4gSSBoYXZlDQo+PiBnaXZlbiBpbiBbMV0gbXkg
Ui1ieSB0byB0aGUgcHJldmlvdXMgZm9ybSBvZiB0aGlzIGRldmlhdGlvbiwgYnV0IEkNCj4+IHJl
YWxpemUgdGhhdCB0aGlzIGFzcGVjdCBzaG91bGQgYmUgbWVudGlvbmVkLiBUaGlzIGlzIG9mIGNv
dXJzZQ0KPj4gc3VwcG9ydGVkIGJ5IHRlc3RpbmcgYW5kIGNvZGUgY292ZXJhZ2UgZXZpZGVuY2Ug
dGhhdCB0aGUgYmVoYXZpb3IgaXMNCj4+IGluZGVlZCB0aGUgc2FtZSwgb3IgYSBzdWl0YWJsZSBn
dWFyYW50ZWUgZnJvbSB0aGUgY29tcGlsZXIgdmVuZG9yIHRoYXQNCj4+IHRoZSBiZWhhdmlvciBu
ZXZlciBkaXZlcmdlcy4NCj4NCj4gLi4uIG1ha2luZyB0aGlzIGV4cGxpY2l0IGluIHRoZSBwYXRj
aCBhbmQvb3IgZGV2aWF0aW9uIGRlc2NyaXB0aW9uIGlzIG9mDQo+IGNvdXJzZSBub3QgZ29pbmcg
dG8gaHVydC4NCj4NCj4gSmFuDQoNCkhpIE5pY29sYSwgSmFuLA0KDQpUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXcuDQoNCkluIHRoZSBuZXh0IHZlcnNpb24gSSB3aWxsIHVwZGF0ZSB0aGUgZGV2aWF0
aW9uIHRleHQuIFRoZSBFQ0xBSVIncw0KY29uZmlndXJhdGlvbiBzdGF5cyB1bmNoYW5nZWQuDQoN
CkJSLCBEbXl0cm8NCg==

