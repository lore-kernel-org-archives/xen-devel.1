Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5680CA601D
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 15:40:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444519.1661354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFChu-0001sf-3s; Fri, 09 Oct 2026 15:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444519.1661354; Fri, 09 Oct 2026 15:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFChu-0001sW-0W; Fri, 09 Oct 2026 15:40:26 +0000
Received: by outflank-mailman (input) for mailman id 1444519;
 Fri, 09 Oct 2026 15:40:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xFChs-0001sM-SD
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:40:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFChs-00GT3h-8t
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:40:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac90abd-8faa-0a2a0a5109dd-0a2a450c835e-42
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:40:24 +0200
Received: from [40.107.162.132]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac90ae7-f479-0a2a450c0019-286ba2842f7b-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:40:24 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by DBBPR03MB6795.eurprd03.prod.outlook.com
 (2603:10a6:10:208::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 15:40:22 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 15:40:22 +0000
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
 b=MougUdDwCDdCVvCIesZd+/cKJKCd5KbHmMnyiPt0jd7+jMhjBaj0R8hu1F+VLJGZZOGVX7j96H2WPHR/HQ3TszFYMmxbegfkiaaakQDIhYNxYxkVwtsutvxH9lSkBRW3Huw3KxDMvTSNhYV4+OEvbYUWI3G9J5ezb0uYCQ7jntneX24yyaG7DifyJx7lDOErehXrmd+AFFbIRCGgzM5FSsQZOwBJjr6z6Egts76VKJn6Jlq/mBqLVPL+uAIFwZRstp6WKYYOjHcjcP8JwuyGkW5p9X2WBsuy1qhsneOiRAHBIHispLq05Twjg+m4V32JF+6cUx2dR82BIwLVOfzAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7AkEXxkYnQf5bNggObmHFrCevrPyJMQJyi4cQp4h0I=;
 b=tvDVYcelTTir/Jf8Y+Uou67PbOvtr7/ZAUS0JneWXJukre3X7DBPEl6ykhPabXtGUayjp2EkeImsbYvxmHMCO/Yo7yLNHocMmQ1CIy85RSGzDmenuRSyWx4La4En87bH5y2rGGeS+pOSE8wdgVuLPY4pVAH5qcepU4Ojcuq0O0rB+eZkI3PxNPtxMr02VCt5L1k6dCC2EgojaF9InleNLG7AbmgFy1Z3ywSCTh1Z1Tn900CDEE59LrSvNnG/LLkrLmMnvQKndHle9MNZbk1fT4GYFJEzT2B6RilvOkx96H9OK9A8brnw9JaTy/7e+lkbdnoWJVx9muOqnzsbKxFdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7AkEXxkYnQf5bNggObmHFrCevrPyJMQJyi4cQp4h0I=;
 b=TaO/Xu+W+wCVW8prLjRbWR2kH/qxG+Z3yRSnRIjFo6Z6niRzAwHeMSVE6ANn928rIADRlynIejLZFqLdjqePKYCivNdxU5jZC2XIlrqnaA6mVtpHYEKes7/I0ngC+vtmXqoa0uQkUrluXcefWSqB015G7VbYDNNRBn5yeQuZjafeNY9K1oJhAkkJyJwfb18lZAAZRJz/D/cjyw9GOCwaNdDQMcbdJsN2aP7WDrwQZRDtgGyY8XDrurckcvMlvhEQ/KTZ27BeAUq9/ye8k3cM9RMiX2Bybmv36L6Wetdc9HFQijAFFDtrgUb8dtD6qE05SrzJN5eQy3GgdM48z1Qchw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 22/22] doc/arm: vIOMMU design document
Thread-Topic: [PATCH v4 22/22] doc/arm: vIOMMU design document
Thread-Index: AQHdVe/9FVgp3UFZEkGVTDxicRcCh7b1XRyA
Date: Fri, 9 Oct 2026 15:40:22 +0000
Message-ID: <c8100dab-d389-48a6-9d2a-398f2beea4d1@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <da2b9469ffb63d8bb63c2b9bf14ebecfd56dea22.1791328190.git.milan_djokic@epam.com>
In-Reply-To:
 <da2b9469ffb63d8bb63c2b9bf14ebecfd56dea22.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|DBBPR03MB6795:EE_
x-ms-office365-filtering-correlation-id: 6f7904dd-8124-40e7-25b3-08df261ba151
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|42112799006|38070700021|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 gJ6evktQOHYKu9QzqxCaSvGeOMnx5Gm++R3vkWuoEvg/Zj4nHOMvcjGvo26ruVokG/utTuWVJtm2zq9mcPqr72PNwJVbYykI97ftFJRusM1I++N+E4Q+AkQcE1hyIX0fLn2sd1+ljXkiu2wdqBJhipP5bIw6cA4lFqCZO3NQQsbLlCTOh9VsZGwDchr6gc2O1/Ke2L6Dq1Sd69kOfmpdOsJQ1s8d+xteQBmRVyO/+I+PSxVGczxoxlecPgLOytfu8BT0IfqSQtofQHTtBdR0n8ykGix8zvnV6a7oDTcPUnfpeCASTkduLOFJd/na93L2HN/EbiolXQSqcJmLKxfg5K8/pKRWR0wUgwkR9dflZvbxK9Ot8ehA5VoarFvONUEH8TGCqSRLORlmTj5HXd8j28+2MeiZg7uxwKIKXukkq3nqL/yEPOdW8SzX0F26yLk2ZZs8dLfFN+/te4tCdg/KI2EQS14Ci6605Dh8iLB6YWhkSh/Ok5LKLlRUtqOC93i+olpBZ4CMXLvbTqfLWz8/Xhy3i8bLtfSNyphtL1VPCkHLJDc4va9yyLtSJ8lbaCCzWGV056NdxVwoXYhx+5vOHlFW99gwXPGbwdOShhZjmAzHLqUVJW1mSavhTebvBFGJgDvTLs+2gdnzhguzDJat5jBvcR5sW1Ib8uTCR2WWyJSCagHlnOqWLKqNhv/1M2mWDiqA+GQxgVTfpLoZhA3DmNYpg3MNGu4NuP3zdcqRXQ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(42112799006)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDRNcFRFY1g5OGM1SVIyT3BpN1Z1ZmovSVdsczB4OTBKdUtCbWpkaE1PMENF?=
 =?utf-8?B?YkxIY2dGc2xWaEk4SUZFb1dkdVNBRWswcTNiOTNma0dRdG8xdlN0akxNbTBz?=
 =?utf-8?B?TEsxYVNJVEZBb055NllQYVNKM0FEaDRQVnJpY2xSckVyWVJQYWNNWEFveCtn?=
 =?utf-8?B?U096MmpNUHpKTFBpZzNOQVNHWlZKMHBzYU1NSHJoZ0t5ejAwVGxZZURxMzNH?=
 =?utf-8?B?QnE1cWdtT3Zwbi84eVl1SFFIZ1c4ZWdhc2VSZjFFSFZGUjhBZkpzeGNYYi8x?=
 =?utf-8?B?UVRtMyt3c0NTaGF0K0EwRFY0bE11Nmo0RnBuN1ZUYlE3TXZtR1VTaDJINFJk?=
 =?utf-8?B?Tk44aTJ4T0k2T3kzUU5tMzIzRG9GcENsclJVVXMzUTdHaUpCZjZhTnpvYkh4?=
 =?utf-8?B?RytNL3VTOW1ORFB1cWJGekQ3eEdiTzBNV2RzNlJUU3BML29oc2dzTDE4alM4?=
 =?utf-8?B?ckRrVzd6SFdzc1V1Mjh6d0tNQytwQXZRWmNwd2hwR2VDUTdtT1JLa20wNGJj?=
 =?utf-8?B?VmlyWGphVk01ZzNnZzRtSlpib09FaGg3d3paS2V4bk9PZzE3OGlHWG9PeHFx?=
 =?utf-8?B?VEQ5RCtQbmpmcHdtVEdGYTl6c1puWFZGc1pzbU9aVnZaL0w4QnJqbitOZm9k?=
 =?utf-8?B?SEIxNHFYWU5yaEplZzV5YmpyUnhTWCtNU3RZM1FYL3pTbzJ2Nzd3NWdPNGxC?=
 =?utf-8?B?d00zK245QTJTVnQ3a0h2a0JSTGxMMHBudFJEK28ya2ljRlRhakIwampmY2ZK?=
 =?utf-8?B?OWRGTVIzbEZYUnBtNmRrL3drVzNqUlNRRGJMTGV3L21xTys0eWU3Zk9rZ1FG?=
 =?utf-8?B?dXB0NTA0YjVqaWJqUzBXRGxkRzl6bnRtMk54R0NPRlFLNDBpOTE5OVpSKzNY?=
 =?utf-8?B?MU1wRzQxM3BRSDlHM1Y4QjAvOUZ0aHRwRnpaMzhWM3FKVklZTmRseU1DWXls?=
 =?utf-8?B?a0lBMGRjaVBlZGhqazArVDMyNXJ6UE1uOEk5ek10UTl4ZEhTZUVEbnZrYVZR?=
 =?utf-8?B?K0FPT2FzQ0trTDcvTEZDRnk2blJBNkZMZmpZazhhWmhMK2F4L3pnbDlxUjhV?=
 =?utf-8?B?aUZyMXpOYXJLdWFra3QxZnhCOStmSENURDFwVGRYRnFaeUg3NXE2cTg4ZkJF?=
 =?utf-8?B?VTdlUlhYMWV2Q0w1VFlydGpvRTgzc0lCTk9oenArK1BqMXBMbmVKbWJ1NDhB?=
 =?utf-8?B?dUNIeFpTV3FNekFFeFhHcVdKMGNNSEFsdjFNdkNwYkh6dFlNL2krTk8wSEhv?=
 =?utf-8?B?dXJpMnBOS2tTeGl5ZkdjMldCeHdwWVVHYkw3UVpDbzd5OXBpbnFrbEtrM09S?=
 =?utf-8?B?ejhTRFBFZURKUzRoME9uOHE1NUttT1paMUc4bWVLQS9kMDg3YXRPZHk4ZTh2?=
 =?utf-8?B?cTdOTVQ5bFE2a25NSmJHUWhKSjFCQ09RbWJwYldJU0NEMjlqQ3FGTCtrcXkz?=
 =?utf-8?B?VnRkL256UGREN1lPZmdVeHhSZFFXWHd5bGNZOEp0SmZueWl6NUNwK1ZTa0dq?=
 =?utf-8?B?Y0xkcDZ2L3ZyUngwR010a01UZVNkV0VMUklVTVBMTjRkb25tS21ZSGRERjY3?=
 =?utf-8?B?TWZSUWx5NnJScHh6bWpiVWVZNytvZnU2VnNJZ3F2MW9xRzNRWXpLdVJXVlU5?=
 =?utf-8?B?NGp5MXR0TG5DNTlNMnJCSXZXcXNXQ3d2cVJER1g5dG90dTZNT3hsektiNU84?=
 =?utf-8?B?MDFlQTBlK0FkdEQzTzJQSzBGZTM1bUN2dnhadDcrZlkxZUZGOVNRYU9zakxE?=
 =?utf-8?B?SktHdkpuT0JISlZ0a083SFB0a0ozM1ZuTkdrb2VmQW1sLzQ2VndRbWgzUU95?=
 =?utf-8?B?aFVObXRWOGgyOVdaQ0daQlhmcU1XSFdJZi83d1RzN1huNVJ3ZmJVWlpseFRM?=
 =?utf-8?B?b2JUTUNDRWFjMmNlRFpZcHNqWmVaNmV0U0wxSzRnN0JBZGJqTUJ2Qk45a1lN?=
 =?utf-8?B?dlEybVBka3o4Q1NQTXcvM1ZWdDBucTh4SmV0czl1UDhRSUxzOStkUllTUCt1?=
 =?utf-8?B?YnY5Yi95TGlBTnpjWnZxY0NkVGFHOWdHQ0VLNm85elVzMVVZbWtxbDdIMitm?=
 =?utf-8?B?cEdJWm5XZTBIUVVuWnBORW5YdGVLbG8zZ2VUQnRBRzVWeCtXTDBGOWFHcTd1?=
 =?utf-8?B?b25pNy8wSnhCTXgyeUJMOWFyWCt6bXRWa2RaTVlXWDNhR2I0dEtpUWprZzFZ?=
 =?utf-8?B?UWcxOTRLUkhldFF5a0hEZ3dLQVJKUFVmUXdvNEtuWVl0OEFyQzVxbjVlUWN5?=
 =?utf-8?B?Q1VDUTIvZmtoTFA3WTlCalgyK05JQVFIamk0NFBDT2xXakhDMUZaQWxxT3BZ?=
 =?utf-8?B?WG9yYituQWpIT2wyVXkzYUJ1d1NKbkpYRE9uQXR5b2R5amI3bWU2ZEpXYlJs?=
 =?utf-8?Q?P5xUpf2epO4qQc6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DABA10171F0F64FAA67495FB8A2471B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7904dd-8124-40e7-25b3-08df261ba151
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 15:40:22.1192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XACtX0rIvRLaq+Ru4Gk/9h+UJyd1wzHLiZOzBTZIeU2Xw+0d72dGsQOUMu0IrrfQTCwFMD1TNJ5hWVQ5xl/qvIgvux7m6aYx+4AuHiDa/Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6795
X-purgate-ID: tlsNG-d25034/1791560424-004CFA5B-83AB088A/0/0
X-purgate-type: clean
X-purgate-size: 1306

SGkgTWlsYW4sDQoNCk9uIDEwLzcvMjYgMDM6MDgsIE1pbGFuIERqb2tpYyB3cm90ZToNCj4gVGhp
cyBkb2N1bWVudCBvdXRsaW5lcyB0aGUgZGVzaWduIG9mIHRoZSBlbXVsYXRlZCBJT01NVSwNCj4g
aW5jbHVkaW5nIHN1cHBvcnRlZCBmZWF0dXJlcywgc2VjdXJpdHkgY29uc2lkZXJhdGlvbnMNCj4g
YW5kIGZ1dHVyZSBpbXByb3ZlbWVudHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWxhbiBEam9r
aWMgPG1pbGFuX2Rqb2tpY0BlcGFtLmNvbT4NCj4gLS0tDQo+ICAgZG9jcy9kZXNpZ25zL2FybS12
aW9tbXUucnN0IHwgNTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA1MDIgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkb2NzL2Rlc2lnbnMvYXJtLXZpb21tdS5yc3QNCj4gDQoNClRoaXMgZmlsZSBoYXMgbWFueSB0
cmFpbGluZyB3aGl0ZXNwYWNlcy4gUGxlYXNlLCByZW1vdmUgdGhlbS4NCkUuZy46DQoNCmRvY3Mv
ZGVzaWducy9hcm0tdmlvbW11LnJzdDoxMjogdHJhaWxpbmcgd2hpdGVzcGFjZS4NCitUaGUgU01N
VXYzIHN1cHBvcnRzIHR3byBzdGFnZXMgb2YgdHJhbnNsYXRpb24uIEVhY2ggc3RhZ2Ugb2YgdHJh
bnNsYXRpb24NCmRvY3MvZGVzaWducy9hcm0tdmlvbW11LnJzdDoxNDogdHJhaWxpbmcgd2hpdGVz
cGFjZS4NCitpbmRlcGVuZGVudGx5IGVuYWJsZWQuIEFuIGluY29taW5nIGFkZHJlc3MgaXMgbG9n
aWNhbGx5IHRyYW5zbGF0ZWQgZnJvbQ0KZG9jcy9kZXNpZ25zL2FybS12aW9tbXUucnN0OjE3OiB0
cmFpbGluZyB3aGl0ZXNwYWNlLg0KK3RoZSBvdXRwdXQgUEEuIFN0YWdlIDEgdHJhbnNsYXRpb24g
c3VwcG9ydCBpcyByZXF1aXJlZCB0byBwcm92aWRlDQpkb2NzL2Rlc2lnbnMvYXJtLXZpb21tdS5y
c3Q6MjE6IHRyYWlsaW5nIHdoaXRlc3BhY2UuDQoNCkJSLCBEbXl0cm8u

