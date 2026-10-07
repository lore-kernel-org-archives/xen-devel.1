Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C579CCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441865.1659470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBu-0005Gf-7e; Wed, 07 Oct 2026 00:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441865.1659470; Wed, 07 Oct 2026 00:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBt-0005FL-Rz; Wed, 07 Oct 2026 00:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1441865;
 Wed, 07 Oct 2026 00:07:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBr-0004kq-TR
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBr-006Hhb-AD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d31-2eae-0a2a0a5409dd-0a2a4502b47a-8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:23 +0200
Received: from [40.107.159.102]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d3a-6ca4-0a2a45020019-286b9f660fa9-4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:23 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:20 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:20 +0000
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
 b=b/B52BE2llkfVBCIIdyUKyD/CRJI2fJpIj1zdRnBgjCiJ7rBI14mdZ+V1oL7VuAkL5kpkzLSuzgXsQptHqGy5/LLDLELC8CatFx21evWl7lEJtEhIwWwhZpPSZZEPrhdaZJQWjCvD37sFj7PUbSvFhe14p6ZmOqwwOtP7DpYHwi1vAPlBq/g61Y3bO4hiwz52xdhDVMoPMN6dswCcVzaSNqJUN0kNaZvgWlofVuAlQ/IJRBL4oatAz/G06VCqSUhD7egFC5ML+eocsa0GxEo5VaSFpnu+1f7JDD5NtnFxqYzTQoJ9Doip0kSDPzcprSep37SlRLpxdxn8irkRoe4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QGjg9ezIGvEpFCVh2gO3DGpM70Awc+cA84nC1Wmbgc=;
 b=ejytKZBfbB2JW4x+WYIvAp9CucuFku0GFcimI3T985JFcEVWokutDaZIbWnyQVqWNvCHYHr4lEuwfeT672jO3c+BgJa2+QZBCcU3Vp8TcvdBAbJio2RZe0FxeQvNcDacpsnqkwav9KIPsyrUs+K7TBxWJzi+OQA81tfxToJkzEdnq+C3bWndYqVVZas74g01Wv7PLeW+q354+x+8SbGiG1EqKAf0bqT9Rg8DBEBL4qUPnq/XlrzVtIBcz0/l6X6t01459sxTJ07rjlkjbSoQxY8J07KQqV2JI25hvJ+mDCW8Dt+26n7dFHEh1n3u/7T8L2XwmYks5iJAvG4BPF6QZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QGjg9ezIGvEpFCVh2gO3DGpM70Awc+cA84nC1Wmbgc=;
 b=Xx+rfEgs6f7zdJ9D9Yq6sj9zETCbSTo0Vm4eSyM72IcE5u7DUMz8fQF8K0s+KC3U+RR2m2vwv9QABYmPta/xBSKQT6393UrJsDIwsJrQQ3Tj/5KrVAMy3/498smc5jrwcOtpEGVKKFWAMszWhoMZw/2XnX59H35n2y0Ov5VsPiXDOSeKGHZqMjWTY3bKvjKNfNNJ/LtqpPl16YtUVC1cHm6fv1BvctwZVjW+2SWaUVmhQ4pzZ+Gv24k8MlM18aSufKB/qPjbbtb72WO7uGTvDWB3x84RRLDxpsmj9dH16bBCURNbNUXkoetztEsqHzDM6gugOF5YAoKWK4xQPwJDWQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v4 19/22] xen/arm: vIOMMU: Modify the partial device tree for
 dom0less
Thread-Topic: [PATCH v4 19/22] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Index: AQHdVe/RXw5lTx+Dsky6l5wgBOVJ2g==
Date: Wed, 7 Oct 2026 00:07:18 +0000
Message-ID:
 <9e31544f751d8a9708e1e6385da1b3ac6a438153.1791328190.git.milan_djokic@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
In-Reply-To: <cover.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|AS4PR03MB8229:EE_
x-ms-office365-filtering-correlation-id: 49a77cad-c299-41b2-5340-08df2406f502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 e4toScgIDundB/oYEISfpuecXze3CVGZtJ+OMp0Jo2wHNY9yn9hF4W6lOCF8dg8cGZJtAlAqicb0avFXRMsw9Te/LoVy+n2jwNbgeScGuZzypaHeWYCkkO0uFB/IhIKKinhTXHj8oCfmN/CAj8OAiLuM7Vuaq3eBNEXD2KslvMIR4bMna15ouXy+ORfTpp6lsP89/rNU+icWoUU/m+fCTznrC2EunpB6t5H4VZ84MvSsYNtVyq4epMfpFzzAl+M2v+aSu/MYhlco2nZU8hjWU0EAeF8duuM0Gm7TlbgtwKMwNWXv78Uwbd8YEJOu2wOYgMoRs+krf9PXT27Lh4sx+icdUCEN6M0H1Mp4q2u9Ml+Sh4mJivZfW2BWYc2SknjP/hb2ji4XnncYLswaMs6YYx95t4ODjuPglNHe6SKY+oC4i4RIehM75wwFMt4Wm8L1yWK5wLzlfOyV3BwY8AAzeNLsieCytzuOHnyqq9QI8mByXl1kxOF38m6EJtURaeOe7YJNyAfJ4p0n8toXduLFsPZTJ57V3DJuYCnSqhWDMTHSYgsEB2AW0b/bSX8ipWNjOo0hctHAtw1TqTNInBTGdezjF42/45nvutPymV2pKfhzEsMpFOjr7EPmtcmPZPzCTb6gIZRddw81wrJCqIAuKGtoxfUkgaMFXjYqNMkoIPm977uZ1749G/m+1jduyVEKZxO1CTcYUqf3Ad7Bgtdz6szp8dp6IIdAnUXQ26uj4ks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGtjNjlaWmV3MnVNOVRZcFJaSWtGMEFmbWF1VElPMmhVMlUyTWkyZTlJdTd1?=
 =?utf-8?B?MDRLMUVxbVNXV3NJNTRFZWtqbW5FSmltMWdlNVBsQnFmbHJXZTE1VVlXZzBi?=
 =?utf-8?B?eUl5aVo0WFdnOWFjbjJQZGVmWnRTZ28ydHRQbE91NVY1QUpEckZxL3hKMEhx?=
 =?utf-8?B?MW5Vd3M2L2Q1dHc4WExDbG1UODljQXdWUDIxRXpFWTQ5dFJ1MzAyRlNOQWdl?=
 =?utf-8?B?VTZ1N1o1SDRqZDlocXF1MVgyZkNsenpxM3ZJbWZXNDZGY3RVbEg5L09UK3Q4?=
 =?utf-8?B?NVFFcStSYW5aWW5IelAvNEJmZjMvTjdNNXZCL2ZrTXY0ZmF2a05BZEhaTjhI?=
 =?utf-8?B?OEZVdURFNmVPRG0ycG5Ta1hRY1ZMaFBjQ2Z3MzlLMGgyL1g4TzRtc0xiSEpZ?=
 =?utf-8?B?ckkzNTlOcVRmdHNjM1JPU3JFVGlSRXhCWFZvTUZpaExYVmJabEx0WlpWRlZj?=
 =?utf-8?B?TTRjbFgzcXZ0ZzlXTldKM3Y4QjBvTko1N2dCY29jQVkwUGRGMUkycjBhb1hI?=
 =?utf-8?B?MkVQMGRrSVB5OGduRWg2WG5wNWpCNWFEdVI4ZlRETGtkVDBDWHZCdldiTEpW?=
 =?utf-8?B?YnVaV1NyRnhwanBVdVA4d09ncDB0Y05BbGZUbzFPY3crZmNjeFlmRVpjUGhL?=
 =?utf-8?B?cE9WZVVGSU5LaHFnbEc1Nis3UHh6UzdmbWFERDgyV0J2OWMzZElmcEhtaFNv?=
 =?utf-8?B?MG1ZK3VJL29PN0JqTlNhMnpaclZ2bDZpS3Rub21sQjArbkI4Qk1GMGEwcHJR?=
 =?utf-8?B?OW42Nms2WGtnY1NVaXhqbHVQTlJ3L05xekVMNWhqQ2djdzhTMHdSSWI5U1BK?=
 =?utf-8?B?Z1NOUytCeEtyRkZRaFd4cU92Rk5vTWhSQUZKOVlMQU53UWhYYmZ4NE1uZkF1?=
 =?utf-8?B?Y3ZEQXUwZ1pURnMxSlUvV2Jhb1dDUytmSGl0LzFRVSs5Uy9jcXhSNXV6Undm?=
 =?utf-8?B?Q2UzSC9DaGU5elhUN21Wa3ZhRDRvVnlaVDVGRUxPWDNSeWlBVHpsZHNVS1oy?=
 =?utf-8?B?VndjSCt0ZVU2VXd4MmkzTFhBejdWK2pVbytyYS9uWGZoWGpKemtRSzdKbGlQ?=
 =?utf-8?B?TkM4cUNBVmdhZ0xjL1NDUGp2czRxQ1pmM0FDUGVTSHpIcmpyM0EyNDBnRTlj?=
 =?utf-8?B?Nlo1eVMvOU82UjBTOFlzT2ppVG5PUXhCK3VDbWNsa3JURyt3UlloZHhyaUlj?=
 =?utf-8?B?T3l1VXpJWjRKVm9ad1J2SDY2amxzSElpVm5QeW5yUTEyVkVTOGk1bTJjMUxM?=
 =?utf-8?B?N0pmWVdhQkswSFY4bGpZN0xRRXNxYUx6NnpzVThKaVJ6ZERJQU9lV083bDhP?=
 =?utf-8?B?SFRNeU80WkRET2ZkaERvQ3p5ZGp5M1FLK0dlaU5wS25aNjF6ZjBpTHVLakZj?=
 =?utf-8?B?NGt0NlBYK29qZHVFRDdsQ0ZFai8wdDBFSmJGcWhMc0ZreUtoVEVIMDYwNk1V?=
 =?utf-8?B?Q09LQlRBSEx3NVJwdDRxbHJ4YmVoZjE4cG11OWZuNG9ldE4xWVlvQVB3N0JQ?=
 =?utf-8?B?d2JSSlYrVm1PVzRMSWNjNUJQZTdiUXc2eGVKWEFVbmtHNVlBU2lKQjhteEpG?=
 =?utf-8?B?T05vMGxOUjE0VE9yYXl6WjRmclZjTmE4OGszQ1A5bUlpdVoweVlmN0kwUWIw?=
 =?utf-8?B?c2pMeUlrWjdOZ3lMWDlOQTgvYmliaFJKWWU0S2RxWi9BNFpPNUcvbnhnSlNI?=
 =?utf-8?B?dVhUVEZtV1BpSHZQbTNMa0NqUG9tYmpCSk45bW4xQmJ1ekhCWGlUS2xMS2x6?=
 =?utf-8?B?NWRNR2F5U090SHVOdU8xL2lUbEZ1Rm9icVozSXFuWGlvMGZkY2NyMlJVak1H?=
 =?utf-8?B?ZnI1YXZvTEFVZ2V6V3laVXNRMmFXK0hHRE5KVWIrbGVnMmNiOW85MDhUTVlX?=
 =?utf-8?B?ZDdNbVVOSUh1Ulk4Z0x1ekRSYXVhdWViOUZIdTNTMzdxS2s0ajBxWjgyc0sw?=
 =?utf-8?B?K09EWTFlZ1NhWE5aOE1yV3NwK1NmVmdEUWY2bHZLcktkaVRGV2Z4NldYWStI?=
 =?utf-8?B?eVdEMFNGUDdFbXl2RCtHUDNhUExPamhDL3RnK3Zra1lFVzZMOVE1NWJnbHRW?=
 =?utf-8?B?VTcvRWRHVFlSUnVRU2hFdFdibkk1Z2NZMVZzOXNuQkFFYngrelhRcXRobjhG?=
 =?utf-8?B?bHFkZVdsR3NUQ1c5azljc1l2TksxQVRsczlsSDFjRU1jb1lVSlJtU1lGU1hj?=
 =?utf-8?B?cGt4bHBCNFFBT3pqdmp3YnIxTGJKc0RVRHpUUUNXV0FGVVNyWkVlNTJFblB4?=
 =?utf-8?B?N21seXZMQUVUNnBqcVIzb0Z6OSsrNjZCUHdEYlg1cHlCUEVtYW9OTit0WUxL?=
 =?utf-8?B?a2libU9zWkMvQ0wxWUczN0ZvQWZWcDAwUFFKY0RtRWs1Y1p4Q0xiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a77cad-c299-41b2-5340-08df2406f502
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:18.4107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0DC2k6wac7kV+R2zjg9/dNIY4VvSuo2J33GuY7AIcELdjyGt3/TE/90M9x5FUalDcQJMo//iUFdAyfPOP27qSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-720697/1791331643-F34BE2AC-2B895AF9/0/0
X-purgate-type: clean
X-purgate-size: 3568

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNClRvIGNvbmZpZ3VyZSBJ
T01NVSBpbiBndWVzdCBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlcywgdXNlciB3aWxsIG5lZWQgdG8N
CmNvcHkgdGhlIHVubW9kaWZpZWQgImlvbW11cyIgcHJvcGVydHkgZnJvbSBob3N0IGRldmljZSB0
cmVlIHRvIHBhcnRpYWwNCmRldmljZSB0cmVlLiBUbyBlbmFibGUgdGhlIGRvbTAgbGludXgga2Vy
bmVsIHRvIGNvbmZpZ3VyZSB0aGUgSU9NTVUNCmNvcnJlY3RseSByZXBsYWNlIHRoZSBwaGFuZGxl
IGluIHBhcnRpYWwgZGV2aWNlIHRyZWUgd2l0aCB2aXJ0dWFsDQpJT01NVSBwaGFuZGxlIHdoZW4g
ImlvbW11cyIgcHJvcGVydHkgaXMgc2V0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8
cmFodWwuc2luZ2hAYXJtLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1pbGFuIERqb2tpYyA8bWlsYW5f
ZGpva2ljQGVwYW0uY29tPg0KLS0tDQogeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1i
dWlsZC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAz
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2Rv
bTBsZXNzLWJ1aWxkLmMNCmluZGV4IGZjYmViOGFkYmQuLjcyODBiY2Y3MmIgMTAwNjQ0DQotLS0g
YS94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCisrKyBiL3hlbi9jb21t
b24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KQEAgLTMzMSw3ICszMzEsNDQgQEAgc3Rh
dGljIGludCBfX2luaXQgaGFuZGxlX3Byb3BfcGZkdChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZv
LA0KICAgICByZXR1cm4gKCBwcm9wb2ZmICE9IC1GRFRfRVJSX05PVEZPVU5EICkgPyBwcm9wb2Zm
IDogMDsNCiB9DQogDQotc3RhdGljIGludCBfX2luaXQgc2Nhbl9wZmR0X25vZGUoc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbywgY29uc3Qgdm9pZCAqcGZkdCwNCisjaWZkZWYgQ09ORklHX0FSTV9W
SVJUVUFMX0lPTU1VDQorc3RhdGljIHZvaWQgX19pbml0IG1vZGlmeV9wZmR0X25vZGUodm9pZCAq
cGZkdCwgaW50IG5vZGVvZmYpDQorew0KKyAgICBpbnQgcHJvcGxlbiwgaSwgcmM7DQorICAgIGNv
bnN0IGZkdDMyX3QgKnByb3A7DQorICAgIGZkdDMyX3QgKnByb3BfYzsNCisNCisgICAgcHJvcCA9
IGZkdF9nZXRwcm9wKHBmZHQsIG5vZGVvZmYsICJpb21tdXMiLCAmcHJvcGxlbik7DQorICAgIGlm
ICggIXByb3AgKQ0KKyAgICAgICAgcmV0dXJuOw0KKw0KKyAgICBwcm9wX2MgPSB4emFsbG9jX2J5
dGVzKHByb3BsZW4pOw0KKyAgICBpZiAoICFwcm9wX2MgKQ0KKyAgICAgICAgcmV0dXJuOw0KKw0K
KyAgICBmb3IgKCBpID0gMDsgaSA8IHByb3BsZW4gLyA4OyArK2kgKQ0KKyAgICB7DQorICAgICAg
ICBwcm9wX2NbaSAqIDJdID0gY3B1X3RvX2ZkdDMyKEdVRVNUX1BIQU5ETEVfVlNNTVVWMyk7DQor
ICAgICAgICBwcm9wX2NbaSAqIDIgKyAxXSA9IHByb3BbaSAqIDIgKyAxXTsNCisgICAgfQ0KKw0K
KyAgICByYyA9IGZkdF9zZXRwcm9wKHBmZHQsIG5vZGVvZmYsICJpb21tdXMiLCBwcm9wX2MsIHBy
b3BsZW4pOw0KKyAgICBpZiAoIHJjICkNCisgICAgew0KKyAgICAgICAgZHByaW50ayhYRU5MT0df
RVJSLCAiQ2FuJ3Qgc2V0IHRoZSBpb21tdXMgcHJvcGVydHkgaW4gcGFydGlhbCBGRFQiKTsNCisg
ICAgICAgIHJldHVybjsNCisgICAgfQ0KKw0KKyAgICByZXR1cm47DQorfQ0KKyNlbHNlDQorICAg
IHN0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgbW9kaWZ5X3BmZHRfbm9kZSh2b2lkICpwZmR0LCBp
bnQgbm9kZW9mZikNCisgICAgew0KKyAgICAgICAgcmV0dXJuOw0KKyAgICB9DQorI2VuZGlmDQor
DQorc3RhdGljIGludCBfX2luaXQgc2Nhbl9wZmR0X25vZGUoc3RydWN0IGtlcm5lbF9pbmZvICpr
aW5mbywgdm9pZCAqcGZkdCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
bm9kZW9mZiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBhZGRy
ZXNzX2NlbGxzLCB1aW50MzJfdCBzaXplX2NlbGxzLA0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgc2Nhbl9wYXNzdGhyb3VnaF9wcm9wKQ0KQEAgLTM1Nyw2ICszOTQsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBzY2FuX3BmZHRfbm9kZShzdHJ1Y3Qga2VybmVsX2luZm8gKmtp
bmZvLCBjb25zdCB2b2lkICpwZmR0LA0KICAgICBub2RlX25leHQgPSBmZHRfZmlyc3Rfc3Vibm9k
ZShwZmR0LCBub2Rlb2ZmKTsNCiAgICAgd2hpbGUgKCBub2RlX25leHQgPiAwICkNCiAgICAgew0K
KyAgICAgICAgbW9kaWZ5X3BmZHRfbm9kZShwZmR0LCBub2RlX25leHQpOw0KICAgICAgICAgcmMg
PSBzY2FuX3BmZHRfbm9kZShraW5mbywgcGZkdCwgbm9kZV9uZXh0LCBhZGRyZXNzX2NlbGxzLCBz
aXplX2NlbGxzLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzY2FuX3Bhc3N0aHJvdWdo
X3Byb3ApOw0KICAgICAgICAgaWYgKCByYyApDQotLSANCjIuNDMuMA0K

