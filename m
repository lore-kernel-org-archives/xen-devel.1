Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FCE606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=F45JSyuU
Received: from list by lists.xenproject.org with outflank-mailman.1462966.1673940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzue-0003aW-2t; Wed, 28 Oct 2026 09:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462966.1673940; Wed, 28 Oct 2026 09:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzue-0003aP-05; Wed, 28 Oct 2026 09:25:40 +0000
Received: by outflank-mailman (input) for mailman id 1462966;
 Wed, 28 Oct 2026 09:25:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xLzuc-0003aJ-8K
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:25:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLzub-006x14-LJ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:25:37 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae1bf87-bab6-0a2a0a5309dd-0a2a450a9f28-30
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:25:37 +0100
Received: from [52.101.65.108]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae1bf91-f2d2-0a2a450a0019-3465416c1710-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:25:37 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by GV2PR03MB10950.eurprd03.prod.outlook.com (2603:10a6:150:278::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:25:29 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 09:25:29 +0000
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
 b=FhASpQ24lVmgldzY+WZLTCliob+7FWLqA0nIjq/Ui2FepYUTS+HyhclIbGh1nbjvbc5MMWGWYYBThuOlIWj978ezTnS9kGmdeJcDwCvSYViH+Xtp46rvLVMteI7Ca2MlZrJZ4ZO5MoxmnlprFlDBpGJRGGeED86SniXklHds2aj7xMvQlg357K8PcoBya9ChUA4opArV3jTxz0GQl3owMeJxfWoU3/tOeMFI4++gGtRoBvROY7iwR/dJLbEznq5xfa6L/f6td5N4pkGUGPiIOn6msLZcc259LsgOs7Civtu2605+ODsmswni5mK/6J7CvXawxzr8Cib12quY5F/F3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYoOgMzGNYQf6XwSwHwBRjorRuWKIs+9cKXNfnqG658=;
 b=DNpjbOIrNWa61y30lRcGZ6iyv/lC12jMg3P7mF/nrwFma+a4ljFiaAgVblyetqRGY19bt4v/8fX25ODFkLOXGolnSlZ/dHIfg7xCPiO9B+QbhdPD9DZNyZqAx27e7CkBc+pLjWQhowqOD5ambrF9/mhJ6GBNZm621lMydJ2/nXa8XW9EefG4l7TB4I6oRzrYtWYroca8d79ZybxYRQtW9/hxeHl3nH+bYWmTnqY1uEDKnNpIfd0qcVuoshDndH4W7oiJKf86FZQoPbLppoLXRede5rc/REp1ErOREGY0WRIPcsc/iDwFNjnzEcH7a+zIIHzwBegzhxGgDJTJ8hpeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYoOgMzGNYQf6XwSwHwBRjorRuWKIs+9cKXNfnqG658=;
 b=F45JSyuUyr6WNwOBSWr0Qz2JUaAPk86jp3S969LZdMPxYv3aBNw4RRvyQKUgeVTfTLEs+9pQnO+G4l3SLZrHe7eWuZx26T5t0Q83G2RLTZ27koLJO+8XtHOhJXgdapW5CrzvX8yZjsuOLqi0Lccq5V6uBIaO2tWrbDqnh9xvGFlCxWRJmA92EKBFMX2bWDhCBynnhJw+KF5hDVN8L4u5Vs0s+opvTvtwONlI7vyZKpDBoxWUnicHScYxQp0h1pU/EYuKlxrIi+wujOly5BCpAZcR7puzibM8aTRyJtAC7iWWK5O2DVUFOcPsX9VSCKhAwDEJO64vnuUrS5hZc6VBvA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
Thread-Topic: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
Thread-Index:
 AQHdZUVvbuj2+I/wmEeMfHolzOWTxrcPwg+AgAFhaACAAAvYAIABdxSAgAAEMgCAAAdpgA==
Date: Wed, 28 Oct 2026 09:25:29 +0000
Message-ID: <38abd62c-12b7-4441-ae0f-f2504bf8fadd@epam.com>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
 <ad545e6e-a8fe-458a-a88c-0a290b093359@epam.com>
 <97a123f8-92e8-4ff8-bb3b-a48ad2fe1392@suse.com>
 <a07250ac-263f-46d7-8037-7db2ee17f11f@epam.com>
 <96fdb610-65a7-451a-8d3b-600dfcd7ca8a@suse.com>
In-Reply-To: <96fdb610-65a7-451a-8d3b-600dfcd7ca8a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|GV2PR03MB10950:EE_
x-ms-office365-filtering-correlation-id: a362b397-665b-48f4-4d82-08df34d56845
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|261021121427099003|261022075727099003|10067099003|261022105027099003|56012099006|261026121527099003|6133799003|18002099003|22082099003|11063799006|4143699003|5023799004|261026140227099003|38070700021;
x-microsoft-antispam-message-info:
 G4PEb8cPAH7A9xIgP308ac5gFxTrG2vGfIrr6XF2zdp6HgsTDorrFVi1FLbZOpJLmGPJ9hUNRx2u5Q39gmYEF+owdgIFCTTBDHImL//4bW5xft+JGCrgALQAT93mD8uwyRTP5G5TmwR7DegBv2MESvW2hwAOtpGgCnAaM4T3y5O0sNjJWaAJgWRg2LhPITXQ2rvSqilcj433qF7QpkG7TpYv5InYGyq8kGhMxa6F2i8ZLVEmGN0Xj5FjS8KRw0z7Spg/NXKiOmpZyZ2TEhoI0PnZiUuNzyx4A2Bm8YAL9rp2DjkaEhuClvbn2HAmpEOyjZMv8Tp6lE8KOudC0JfNzbP8RA0i/b03Rq8bC0LSzO6aG8NvLd95avt15obLQulQriFjuRKXrQ+/9xDW2L1hyt58N9m+kDa9qK7qCntRCZOlPjtkZtjKBrpQKO08RpS/etKLc2jOMIuIpgzgeU6bHrJULLUhPKT/ybpsgOLk35tGtoXJ1RReiNOeEwT3TP+mPRR73q754vHIsnqy5lEDcpVduRYba4TPFiblSDYdKXYd+xojFxfkZJaGwa9gPbNZkemMv0hLgZYC5zpWoMVqMoN40NuuQ4cduzuQ1T0DJCIFe6FxfRqET/++EWRwGu/6kU0Hg6M4AArktQCk3icCU6RgwDVrGctfQNglvf2VDym7wA1JGU4ruHas59jAxKoRCddSUDGIeYbJJxwmW/Cy0ieXiGu7FOpV6BMTA/l57g8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(261021121427099003)(261022075727099003)(10067099003)(261022105027099003)(56012099006)(261026121527099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(5023799004)(261026140227099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzVrRHpLdXV4S0Q0ZE1pbmhvUURhUVZnYkMxa2Ewc0JkT0IyRkl1Wkpta1dC?=
 =?utf-8?B?c0t6ZXQ2Qk41SkY5YUE3bmxORFlVcGFXR1dPOFllZVVXRlVkdFIwRFRYKzJG?=
 =?utf-8?B?YXJ5S200SHVLQU5wVGM0MUk3UEtrM2R6eUtpZ05aZ0ViT0ZmWFpQSWQvWUxC?=
 =?utf-8?B?VUdmWVE1MjlZeHJiQ1lOd0tLTzJibFBnSDVPNDV5UWRQRjdnbEFFTDZzd2gx?=
 =?utf-8?B?dkdkcjZFcDhWNjVKSDJienBLRmVXN01PcWkvTy96UzVNQ25hUUtRNTFKOGd0?=
 =?utf-8?B?cUh1UlpPWDZXdmFUanpkU1BsdG4wTzRMOGxNcEI3TWVLbjgrdnlRTE94MkVD?=
 =?utf-8?B?MzFDRXhTM0ZlMDg4VjZCNnc3K29aMTBZZ2pQY00rd3p5VG9OU0dGTE9TbEVw?=
 =?utf-8?B?SVFGaDI4WlNNbUlVMUpxWW0rOXllWGRXQWJiMC9FNkhIRnVpVDQzRkc4WVF6?=
 =?utf-8?B?bGNqanZVT0wvN0pIVm9nRkplWkcrY0FLaHFjM1YzZGZqZGN3ZG95QkFnZ3R6?=
 =?utf-8?B?citFd2xzb2srSjgzaUNtNFk4R1RHSGFXWDgzdjRFcjVsU1lXRWJwcnE5RkhU?=
 =?utf-8?B?K3paTUsrUFJaZ1dQVVdBSTVFVWVWRlFkdGFwcHZNdTQreldPbXdSRWFLM0E5?=
 =?utf-8?B?elN5YUJHd09VK0drdzBFdk5ZTERKbnEvN2FzQm5pNktSbkJQRVY5OHlTSDI4?=
 =?utf-8?B?M1NDdm50QTFKN2tTdWtJekdqMFhJdFJ6bFJaZ0xCak9XY0diRVdhano3TGFa?=
 =?utf-8?B?bGE3bExMZFphakFKQ0FIUjNzWE9pa1BHV2ZTNXpBb3VNMG03eGpDN2VRYjlZ?=
 =?utf-8?B?T0FSbDJ6L2JiNUQ0T3hKQWw1V2h2UXFjZ003TzhGSFVEd1QyMU5RY2tRQnhk?=
 =?utf-8?B?Qy80T0kydHJqRHdXNlBKeWhwcGtHMWlEYjRac3JzcjZXMCtITjFCa3ZhVzBD?=
 =?utf-8?B?bGM3YzRhY2dkTjNBZTlheU9NZDdmMngwcFRJUGRsMnUwalBLQkVzMmNIVmlw?=
 =?utf-8?B?V2VpYXVaQlczMkdCY0hVd1hiVElZMGdKMjhJNnlOOVkrU1VmSWhMaGRzc3hV?=
 =?utf-8?B?QXdtQW5Pc0p0TkV0eGNDdUJxdE9BSEx0RWxicFIyOS9SeEJtMjRKOURxZTFi?=
 =?utf-8?B?dTdKZnFqN2J0N21acHlIVG1veHAzWm0wTlk5T0lvOWRPSjNiemVBVmlQdVMx?=
 =?utf-8?B?dVBZOXd6emFMQmtFWnlZWWxJT1QxUzJENnBJS0tkWWVudjY1cVZsOGkxVkxw?=
 =?utf-8?B?OVVWbEZVUU05SGsveE9CVFlQdW55dmtDN0xPSzZwb2pVRWExK0JIYktob1F3?=
 =?utf-8?B?dlhJV1A5VFpFZENXTTRmNU1temZ0dDREYUdMNXpDemhVTGNxU3lPdVV3YzZD?=
 =?utf-8?B?L0lKeXMrMS9Qd1BuOVVueGhNN0RUejBQb1lhL2oxSkpvOW13MENVcHZQZnlh?=
 =?utf-8?B?SElFcEd3TkxKeTNhS0l3UFhYeGpuRHV2amQxaXAyVG02V0djbjBLdUR6WUJa?=
 =?utf-8?B?aHdPL2FVdUgzVkhybXdyZFlCQXZZQjEwdUVhY000bk50MkRrZFJrRHJFUDVG?=
 =?utf-8?B?bUYwSWJVaW8xM1liUkpvQU9CdEFSVzdMT1AzNzVHZHVRSUVqSkNQUDlYeGhN?=
 =?utf-8?B?Q053bnE1WndKRk9UbXVmRUY1aVBSYkpIZHFuOWtzdXlpZks3cmVmRUxCUW56?=
 =?utf-8?B?clM1TWIyVTM0OWhRQ2Rva2lQekVDNE92Mng2RnRiTC81QlJCUkxwT2c4U20w?=
 =?utf-8?B?d3VmaE1WZnBhWHNsVHEwbFd4VC9yYi96R0FRTFJQMzF1MXBYcm9PdXFaU0Ju?=
 =?utf-8?B?STRWcFl5SUQvczAxc0JsUGtRR2hYd3VqL05OanpXM3RqZUNLbzJBYnEzWHkr?=
 =?utf-8?B?S1oxUXNNWmw5Q0RMRDJDS2hicGpNN2tNMmQvekl3Y2orWnlFeDljY3N4cFR1?=
 =?utf-8?B?aXYxQnhkTVE1c3ZEcFllUVc4VGJWUHdKYmhGTm00Q2IrTHJZRk1WYVg2ZG9p?=
 =?utf-8?B?WTdhREZSWTNKa25lbWUwOUVkSlhWZHJyUzNndnE3VHRCWWp2VFRMRTdmcmd0?=
 =?utf-8?B?cWNGSEt0Z1JvYmVkZk50UFNYbjhxYStNeFFpam5JS21WZkFjZHlUVC9PYytm?=
 =?utf-8?B?NVp3cThCUFIxN3NnWHZvNlZmRzZtRjJkTlM3dXR1Z3k0YnFnMERIRjcxam1N?=
 =?utf-8?B?TGFBY3lKZ0xPTWVqWGdZa0hWOFpxVzBSbUVVU3ArODR2SEhKclF1Q3lCK3Na?=
 =?utf-8?B?K0poc2RRQytoTUJ6QTIzRHRQNjlVbitub0hrVTU3Zy85ajZFRlRsYTVKSXdY?=
 =?utf-8?B?RjVBeTF0Vk1tUmNDcVRob1RPc3Y5TjAzeC9sY2pDQ2dIRTVHOUUvTFdzMVY4?=
 =?utf-8?Q?pHD6V6zHnowTBCDQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10D93A4BF42E0443B09C9447C8A6A5ED@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a362b397-665b-48f4-4d82-08df34d56845
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 09:25:29.1736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCeOZrLPFYJl0koRV2JWkGbahnGSNqdYehdD1VciwSEErUbubf+M1rRdizj6+8yjEfU2p5B9hLXZJ3bUHrwKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10950
X-purgate-ID: tlsNG-4011c0/1793179537-508CDCFC-4EA5CBAE/0/0
X-purgate-type: clean
X-purgate-size: 2558
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjgvMjYgMTA6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4xMC4yMDI2
IDA5OjQzLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDEwLzI3LzI2IDEyOjIxIFBNLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNy4xMC4yMDI2IDEwOjM5LCBNeWt5dGEgUG90dXJh
aSB3cm90ZToNCj4+Pj4gT24gMTAvMjYvMjYgMjozNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4+PiBPbiAyNi4xMC4yMDI2IDEzOjI3LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+Pj4+PiBU
aGlzIGlzIHByZXBhcmF0b3J5IHdvcmsgdG8gbWFrZSB2UENJIE1TSS1YIGZ1bmN0aW9uYWwgb24g
QXJtLiBTcGxpdCB0aGUNCj4+Pj4+PiB2UENJIE1TSS1YIGNvZGUgc28gdGhhdCBpbnRlcmNlcHRp
bmcgdGhlIE1TSS1YIHRhYmxlIGFuZCBQQkEgc3RheXMgeDg2DQo+Pj4+Pj4gb25seSwNCj4+Pj4+
DQo+Pj4+PiBUaGlzIGxpa2VseSBpcyByZWxhdGVkIHRvIHBlY3VsaWFyaXRpZXMgb2YgQXJtJ3Mg
aW50ZXJydXB0IGhhbmRsaW5nLCB5ZXQNCj4+Pj4+IG9uIHRoZSBzdXJmYWNlIEkgY2FuJ3Qgc2Vl
IHdoeSBub3QgaW50ZXJjZXB0aW5nIE1TSS1YIHRhYmxlIGFjY2Vzc2VzDQo+Pj4+PiB3b3VsZCBi
ZSBzYWZlLiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBleHRlbmQgYmFja2dyb3VuZCBoZXJlIGEg
bGl0dGxlPw0KPj4+Pg0KPj4+PiBPbiBBcm0gbW9zdCBvZiB0aGUgd29yayBpcyBkb25lIGJ5IHRo
ZSBJVFMsIHNvIHRoZSBvbmx5IHRoaW5nIHRoZSBkZXZpY2UNCj4+Pj4gbmVlZHMgdG8gd3JpdGUg
dG8gdGhlIGRvb3JiZWxsIHJlZ2lzdGVyIGlzIHRoZSBFdmVudElELiBJbnRlcnJ1cHQNCj4+Pj4g
dHJhbnNsYXRpb24gaXMgZnVsbHkgY29uZmlndXJlZCBpbiB0aGUgSVRTOyBpdCB3aWxsIHJlamVj
dCBpbnZhbGlkDQo+Pj4+IEV2ZW50SURzIGFuZCBhbHNvIGhhcyBhIHNpZGViYW5kIERldmljZUlE
LCBzbyBtaXNjb25maWd1cmVkIGRldmljZXMNCj4+Pj4gY2Fubm90IHRyaWdnZXIgZWFjaCBvdGhl
cidzIGludGVycnVwdHMuIE1lbW9yeS13aXNlIGV2ZXJ5dGhpbmcgaXMgZ2F0ZWQNCj4+Pj4gYnkg
dGhlIElPTU1VLCBzbyBhIHdyb25nIGRvb3JiZWxsIGFkZHJlc3Mgd291bGQgbm90IHBvc2UgYW55
IHJpc2sgZWl0aGVyLg0KPj4+DQo+Pj4gQW5kIGEgZ3Vlc3QgZmlkZGxpbmcgd2l0aCB0aGUgbWFz
ayBiaXRzIGJlaGluZCBYZW4ncyBiYWNrIGlzbid0IGEgcHJvYmxlbQ0KPj4+IGVpdGhlcj8NCj4+
DQo+PiBOby4gTWFza2luZy91bm1hc2tpbmcgYW4gaW50ZXJydXB0IHRoZSBndWVzdCBoYXMgYWxy
ZWFkeSBtYXBwZWQgaXMganVzdA0KPj4gdGhlIGd1ZXN0IGRvaW5nIGl0cyBvd24gY29uZmlndXJh
dGlvbi4gVW5tYXNraW5nIGFuIHVubWFwcGVkIGludGVycnVwdA0KPj4gd2lsbCByZXN1bHQgaW4g
aXQgYmVpbmcgZGlzY2FyZGVkIGJ5IHRoZSBJVFMuIFNvIEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbQ0K
Pj4gaGVyZSBlaXRoZXIuDQo+IA0KPiBJT1cgdW5saWtlIG9uIHg4Niwgb24gQXJtIFhlbiBuZXZl
ciBoYXMgYSBuZWVkIHRvICh0cmFuc2llbnRseSkgbWFzayBhbg0KPiBpbnRlcnJ1cHQgdGhhdCB0
aGUgZ3Vlc3Qgd2FudHMgLyBjb25zaWRlcnMgdW5tYXNrZWQ/DQoNCldoZW4gc3VjaCBhIG5lZWQg
YXJpc2VzLCB0aGUgaW50ZXJydXB0IGNhbiBhbmQgc2hvdWxkIGJlIG1hc2tlZCBpbiB0aGUgDQpJ
VFMuIE9uIEFybSB0aGUgTVNJLVggZW50cnkgY2FycmllcyBhbG1vc3Qgbm90aGluZyAtIGV2ZXJ5
dGhpbmcgcmVsYXRlZCANCnRvIHJvdXRpbmcsIG1hcHBpbmcgYW5kIG1hc2tpbmcgaXMgZG9uZSBp
biB0aGUgSVRTLCB3aGljaCBYZW4gd2lsbCBmdWxseSANCmVtdWxhdGUuDQo=

