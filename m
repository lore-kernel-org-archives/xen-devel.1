Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDF606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 01:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Lx5WMfhp
Received: from list by lists.xenproject.org with outflank-mailman.1486676.1689194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRgFa-0006oO-Pa; Fri, 13 Nov 2026 01:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486676.1689194; Fri, 13 Nov 2026 01:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRgFa-0006oH-Mn; Fri, 13 Nov 2026 01:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1486676;
 Fri, 13 Nov 2026 01:38:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRgFZ-0006oA-JB
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 01:38:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRgFY-00ETaT-WF
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 02:38:45 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af669fe-bab6-0a2a0a5309dd-0a2a450bb14a-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:38:44 +0100
Received: from [52.101.66.127]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6af66a24-b7e8-0a2a450b0019-3465427f6dae-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:38:44 +0100
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com (2603:10a6:20b:d4::24)
 by PAWPR03MB10043.eurprd03.prod.outlook.com (2603:10a6:102:35d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 01:38:42 +0000
Received: from AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416]) by AM6PR03MB6070.eurprd03.prod.outlook.com
 ([fe80::6498:3539:2e93:7416%6]) with mapi id 15.21.0592.009; Fri, 13 Nov 2026
 01:38:42 +0000
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
 b=vuoBxqNrLe2XNy5jDrNcgvHOKYn526ulmHjF8vZHX38LjzOy/F6eM3jOXTKy5eWD1FneBQTnpgTAX9SaWnJkMDyKhYDXeuQoQBtAFzV/7DwwRX3hJ+/Egr2UQ8eh59Ob0f6yP7nzUzhe/KqGrlCYP7Gs1++lGACXg0Jzu9UFZnmDF6kUTe7E8ivJ37jf4UGNLUigQwRU3v/I4socLTFrhdOe4mttcI7pBywDTkheAPURlA3xaDyimf+FuEcr45bjnvBH7y74Cy67BeUFKJ5Vs/YtNmKgetwfn/owk+g1mCWLEWTf9lwGFbwcjQlsdxE6Dq+rBSa9SN6BDLQbzzKE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txOHt7D5DftPVBdrOiU0NTTUYvT4sKIbzoMy5zDrbMk=;
 b=CvWnDYnZ79TzyKyI35F/T8BFuI5Z3kuaXbBBMB2rs/q0YUMbwbAq1fAx4DBDzLEw93HDToCUr51l5bjr1uSSKgZx9aXUMfb8cwatv4RHxwcstliyTh0f4bVPpYTR3Ekkm8qqG++2/qDi2r/uuVKR2vl0VzQEXDKBcLd86DumKlAPd+8nb6HNlX7+DK3S54siHnx3QONE58vEXt2392RBVZvy36haEGAVvuhZ6w/MMMAgiQQH9xKva2gG6wJNajrSfMSpafSzMjHnuzEvok7AYgVxBNBlGZ+Iyonre8Yp1V1OOMTnlLFsAHasIWFIxa5UnQYoQY8Fc0rrgHnc3A+96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txOHt7D5DftPVBdrOiU0NTTUYvT4sKIbzoMy5zDrbMk=;
 b=Lx5WMfhpAeSXuvTmwGIDXVuYU3lk040+cSSu3YU4euNVfgtYs5H6nMu6TMUxrwrJsc0kQdPavGIRaO4I35JdrZZh3VLuuuykHMv9V8/EG3DaZ1pfCLnyeBhAkt1oG+oRVQr/d5WaLhNbx6BPy5b8EOJBBbL3mp3A9xQuH/5rAIW1riugRt+xXhMStolkDQ2IiIlfjHToCRyjzWhNhm96w/YSfHurwWWzqBdqCVHzB8UrGTNESGvMj3wda6+y1f4gHhYkScIp5SluH39oqgH4Q0SubkoG+9a6V5Wu2zBUp44ij0uqMBl2zTA3/kMcjsBcfZcQme//qAP+kK9f8uw/IQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
Thread-Topic: [PATCH] xen/link: Don't separate .data.read_mostly from .data
Thread-Index: AQHdctfhcr4bwV693ke06QHWrVIraQ==
Date: Fri, 13 Nov 2026 01:38:42 +0000
Message-ID: <87pkw98qbd.fsf@epam.com>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
In-Reply-To: <20261112185824.3302712-1-andrew.cooper3@citrix.com> (Andrew
	Cooper's message of "Thu, 12 Nov 2026 18:58:24 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB6070:EE_|PAWPR03MB10043:EE_
x-ms-office365-filtering-correlation-id: 19a69d61-9385-4308-e07b-08df4126d9ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003|261028144727099003|38070700021|260925022911599003|260925021911599003|260925021311599003|10067099003;
x-microsoft-antispam-message-info:
 V2HQofXv59U/TxFdM9a8R6sGdUMH6SAQF7QUWVJzEw233oOHnCjpcRrwtulDsN92Q6pCfmreTpEcSf9zNV/fKtXUrBZeFpeiejvJiZUpqDq6VFOCxaHt8RK/URmrVSP9WoRNkMqi3GEtsdxry8ZLfiZNyy66YQgcDaVu/ZAdU7uKJ5hDjPWfabLYcT5HlSLlgaKFYpfzm/4/9/tQi/g0Pxalex7oQlTemtyren0oses5CdM4Q4Pldako45HnyarZ6v2z7RtVZ0LRs6iVM5HPCPwn4+q1cM45zwxRKAkjEzALjI3rGUoUMXsG870h0u7d3smyWhryl3LtneML62ZJeych7LN8Y0NcI7Z2Qzu1huX6vlMVD/hjnOBi9uCk0hCNztPYUmlJBVyEXq/AKtVYoalvo2mKeBgVnxaXuaHVtDey5rFTWnSCDmUmgl8DS4H/7XWvu6S1R10vgB/NKccmG+2U3sOMSQ3nP6RxY8cJGy5FrmieQktZQTY+vg8jy7/cw/I369mA8bB5HVkUKnuJD4lzkz9tc3QmZWppztVZtmjccP3d87OfNBI1dekF2BAeClY26gFlVsm4+JVZJYbc4yjxmA4cENi+cpVhL2uHl2QFUQgFCx0GZ3aCePz4jiiZyVoY9xFa3nYNDU5QUu+qkIDYQiwBrJsm/E7JEwl+SSyDke0GttZEUAYWk/JY1E4y9mdl8cgMcuRPDSNyTug+8Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB6070.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003)(261028144727099003)(38070700021)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkJkN1hnMVFIbFRNdWpBQUQyV1RlYnBlQnk4b2tSU1hOaDNNTVpQaTlYRTUy?=
 =?utf-8?B?a0ppdDZMdnpBWS83YXlOeEpHbTZ5aUY0Y0cyN2dJTUFrdEFqMklSbTlodEp5?=
 =?utf-8?B?V1ZkSC9MZFdaYWtKaUd2aUFqeDRnY2VUSUI4V2FGSE5pVUpHVVF3L3djTUZR?=
 =?utf-8?B?YXVobXR2M2xaVE5LQzJBa2NwTEFOWDZWdGwxWDFkN1QyQWM0UGhPWllTNnRv?=
 =?utf-8?B?YzVMdGRQV0d0QTIzR2tvcWJSQStrTFRmeERIaHhUT0NvRlVhOUxDbzR1cnFR?=
 =?utf-8?B?b0RrcnRSakxMU3A5RmYzTjhsMVlwRXhVYTFiZERpaUZLc2xXaytvNFJJK2RQ?=
 =?utf-8?B?NDBteHdSZzdkSitHdDNNSXJHaFFYT3FES0hZWm95RnRXdzVONExmcnhEWHA3?=
 =?utf-8?B?VTlnYzZaeHN1empDTGpPZ2NTb1ZoUGpFZU5PdEt6L09CTi9QcG5rRW5wMTla?=
 =?utf-8?B?S0Z1b3FWV3JicXRCaS9lK1o3L3VPZ3ZNMFlhWFg4aTAvM1gyWGpUMVZzcFJZ?=
 =?utf-8?B?Y2xyVWREQ01RVVMyOFQ4ZGg3U3UxNHFjREhEb1pBdGF3SjU4OXZ3RlBlNHR4?=
 =?utf-8?B?aVNCUnU4TmNSbHZ2RnlzU0JHTDRHOElSUEN5NlJuWDV6em1JOEVOczJoUjBN?=
 =?utf-8?B?SVEycE9JUm92YWxDelo5akRrb3RteXZSNWN2SjFqZTBDMWVvMWVYL015KytL?=
 =?utf-8?B?Z3FLUy9QQjFuNi9EME5RTExlT0pBbURrWlFMZWNJdEFzNGJoMDdjYWhXWlRT?=
 =?utf-8?B?cFFyNCtQYUtZYjJSR3FWTE45T284WUJWU0hFRWFTWFdtQmkvL3A4eUVWNE1Q?=
 =?utf-8?B?TzFSWnNESjRUN1VScUlXM2ptcnl0OGxnaWQ3UW1kck5HemR6U01YZUZCOE4x?=
 =?utf-8?B?TWZBWk5oYXJnNXdsc0JjWUVzQ1NDYU5NdGNzMzZ5VEd5L3hCSUlHUFp3S1ZQ?=
 =?utf-8?B?NjZ0U29KZU5iR0RIZzZTNUs5R05lZUNPTnp0ZVZhbTNWZ0RoM0xxc0J0cGtH?=
 =?utf-8?B?aTFYeWxPRDUxdnVvNmtFai9OSllabHhUSWpsMXBUdTNRTnk1eGIyRzEreXRF?=
 =?utf-8?B?SHpNbG1GdlRQV2dOYXFRUERXTFhPVGRud3J3c2svd1Q4NVJBMXNORFdVK3ZC?=
 =?utf-8?B?bVo3OUxmbnhYQzI1QlQ2bE0vd3RvZVlkTnppNE9wUGQzazZNVEJpaC94d21o?=
 =?utf-8?B?Q29LWkt5V2dPdk5CTmMySnlYa3FZT3lrQ3plZkNpSUlENUxMQzBTUGJrMDhq?=
 =?utf-8?B?U1g1VDQ0YzJxZGdqSWgyMnRuU0pVQk5QTjBwU0xWemNIYkVRQURnTGU5eVd1?=
 =?utf-8?B?VTFoMmRsdzYxZTJkOC82Mk9wbnlSK1FRRFlWd1FETjFtdUc2bG1jYWk4eGQ4?=
 =?utf-8?B?RmZRblB0S1MrOVZUMVN0QXFERHNWVjBlK3pkTTFuWWU0YnBFYmo0bDRkbEVq?=
 =?utf-8?B?NkZMNENJSytrdGJUZEpnS3JwZ1BFSkxpR1NFU1BTUXdRL1JHZHZiY0xldUlJ?=
 =?utf-8?B?VzN4MDkyNVpWeG1tU2NaemNDb2JJbytRdkFIcTdrU0pwVnJKY25ZSFdCVUdi?=
 =?utf-8?B?L1Y4OExBTFZUeENxZHRnRVV5eWNKMEF6OFhNR2R1MTBGbXZTamRydWNKL3FC?=
 =?utf-8?B?RDcxS2cxYWgycW9IVlFEZmVOcFMwT2k0Yk1DY24yVHcxWVhtUXpaakdFZDd1?=
 =?utf-8?B?U2dnRXRscjhnRkc1WHB3ZUg3WEdqdDFHU0U3anc0WUFIbFQ2VEpOei82MGFI?=
 =?utf-8?B?ZWNzdXhiVU5hS3lpTm4rRlErVmNRM0VjRHd5VTNINjNuREJIa3BQTmRxWXJJ?=
 =?utf-8?B?elV1UWFHY0hoMFJiWTdmQy9BM001YzBpRmRSL3YydUxYWlZ0ZTQwcWFVQWJG?=
 =?utf-8?B?ekduRTlDcVRLSzk5M1ZnZWZXcEFyQkJ6Ym9IbkVIanVESHJiVTk5QUloSWtz?=
 =?utf-8?B?VGl1V2tPNXVxVTFibUZ3QU9VZmZhWGM1ZktiTlhMUzh2bmlsQ3ZlVlRFQndp?=
 =?utf-8?B?dllOaXQvNWw3eUpPelAvTDJHRzFXTGNlbVEzSHFWNjQ1NXBRWWRxaXpxK1FF?=
 =?utf-8?B?Q2ZwakVzbTJ4dnBvQnN2Q1FIRnFYOXBXUCt2Q1E0aFlnUkpvMVRoVUxZeGZW?=
 =?utf-8?B?YmdxclB4V3lXR3J2bTlreDd3VXpYQmpRbzk1NG8xbmw3b1RuOVFPaG5iZW9T?=
 =?utf-8?B?TkZMUk1kNjdOeFVGY3F6ZXZYWFBkcVBxODI2RnRSMHFxN1g2MVJUdDlEdnBQ?=
 =?utf-8?B?SUFIMHRkd003d3VYMHcwMWxPeHlxcWtzQmtna0hLd1BYc2hWVHUrbHRsYnVG?=
 =?utf-8?B?Zzk2MnZDQzE3UmJJWGlROEJuOEhIdE5DUHl3ZEg1VEIvOUZ4bXpVaG1JbUVv?=
 =?utf-8?Q?JnuLkp8V0pmTtJVs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDD1CD09E0A32A41AB56215C025F33C6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB6070.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a69d61-9385-4308-e07b-08df4126d9ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 01:38:42.6140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZG0DrCdkW3Q4TLsk3suVB5xsmJ7Ww+PgCxPRx4RkVvVLlKYuP5PyZBSW7tWf3AYWYgBs1cnZwPFvqNOjYYWKF7Y1jvpvTw57WbFr0MrIys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10043
X-purgate-ID: tlsNG-42698a/1794533924-AA8D99EA-3F0894D6/10/78276251493
X-purgate-type: spam
X-purgate-size: 5654
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW5kcmV3LA0KDQpBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cml0ZXM6DQoNCj4gVGhpcyBhcHBlYXJzIHRvIGJlIGFuIGVycm9yIGluIHg4NiB3aGljaCBnb3Qg
Y29waWVkIGludG8gYWxsIG90aGVyDQo+IGFyY2hpdGVjdHVyZXMuICAuZGF0YS5yZWFkX21vc3Rs
eSBpcyBhbiBpbnRlcm5hbCBkZXRhaWwsIGFuZCBub25lIG9mIHRoZQ0KPiBzaW1pbGFyIHNlY3Rp
b25zIGdldCBleHBvc2VkIGV4dGVybmFsbHkuDQo+DQo+IFNpbXBseSBwbGFjZSAuZGF0YS5yZWFk
X21vc3RseSBpbiAuZGF0YS4NCj4NCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IC0t
LQ0KPiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXJAeGVucHJvamVjdC5vcmc+DQo+IENDOiBUZWRkeSBBc3RpZSA8dGVkZHku
YXN0aWVAdmF0ZXMudGVjaD4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4NCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENDOiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IENDOiBCZXJ0
cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IENDOiBNaWNoYWwgT3J6
ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiBDQzogT2xla3NpaSBLdXJvY2hrbyA8b2xla3Np
aS5rdXJvY2hrb0BnbWFpbC5jb20+DQo+IENDOiBCYXB0aXN0ZSBMZSBEdWMgPGJhcHRpc3RlLmxl
LWR1Y0B2YXRlcy50ZWNoPg0KPiBDQzogVGltb3RoeSBQZWFyc29uIDx0cGVhcnNvbkByYXB0b3Jl
bmdpbmVlcmluZy5jb20+DQo+IENDOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0
cml4LmNvbT4NCj4NCj4gVGhpcyBpcyB0byBzaW1wbGZ5IHRoZSBzY3JpcHQgY2hlY2tpbmcgdGhh
dCB4ZW4uZWZpJ3Mgc2VjdGlvbg0KPiBhdHRyaWJ1dGVzL2FsaWdubWVudHMgYXJlIGNvcnJlY3Qg
Zm9yIFVFRkkgU2VjdXJlQm9vdC4NCj4gLS0tDQo+ICB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAg
fCA4ICsrKy0tLS0tDQo+ICB4ZW4vYXJjaC9wcGMveGVuLmxkcy5TICAgfCA4ICsrKy0tLS0tDQo+
ICB4ZW4vYXJjaC9yaXNjdi94ZW4ubGRzLlMgfCA3ICsrLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMgICB8IDQgKy0tLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDE4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMu
UyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gaW5kZXggZDFiYjZjNjJkMjA4Li44ZDA5NTRj
OTBhZmQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gKysrIGIveGVu
L2FyY2gvYXJtL3hlbi5sZHMuUw0KPiBAQCAtODYsMTYgKzg2LDE0IEBAIFNFQ1RJT05TDQo+ICAg
ICAgICBfX3JvX2FmdGVyX2luaXRfZW5kID0gLjsNCj4gICAgfSA6IHRleHQNCj4gIA0KPiAtICAu
ZGF0YS5yZWFkX21vc3RseSA6IHsNCj4gLSAgICAgICAqKC5kYXRhLnJlYWRfbW9zdGx5KQ0KPiAt
ICB9IDp0ZXh0DQo+IC0NCj4gICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7DQo+ICAgIC5k
YXRhIDogeyAgICAgICAgICAgICAgICAgICAgLyogRGF0YSAqLw0KPiAtICAgICAgICooLmRhdGEu
cGFnZV9hbGlnbmVkKQ0KPiArICAgICAgICooLmRhdGEucmVhZF9tb3N0bHkpDQo+ICANCj4gICAg
ICAgICBIWVBGU19QQVJBTQ0KPiAgDQo+ICsgICAgICAgKiguZGF0YS5wYWdlX2FsaWduZWQpDQoN
CkEgc21hbGwgcXVlc3Rpb246IHdoeSBhcmUgeW91IG1vdmluZyBkYXRhLnBhZ2VfYWxpZ25lZD8g
SSBkb24ndCB0aGluaw0KdGhhdCB0aGlzIGNhbiBjYXVzZSBpc3N1ZXMsIGJ1dCBJIHdhbnQgdG8g
dW5kZXJzdGFuZCB0aGUgcmVhc29uLg0KDQo+ICsNCj4gICAgICAgICAqKC5kYXRhIC5kYXRhLiop
DQo+ICAgICAgICAgQ09OU1RSVUNUT1JTDQo+ICAgIH0gOnRleHQNCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3BwYy94ZW4ubGRzLlMgYi94ZW4vYXJjaC9wcGMveGVuLmxkcy5TDQo+IGluZGV4IGNk
ZGI3MDg1NTMwNy4uYjIxNTkyNzkxNjljIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9wcGMveGVu
Lmxkcy5TDQo+ICsrKyBiL3hlbi9hcmNoL3BwYy94ZW4ubGRzLlMNCj4gQEAgLTc3LDE2ICs3Nywx
NCBAQCBTRUNUSU9OUw0KPiAgICAgICAgICBfX3JvX2FmdGVyX2luaXRfZW5kID0gLjsNCj4gICAg
ICB9IDp0ZXh0DQo+ICANCj4gLSAgICBERUNMX1NFQ1RJT04oLmRhdGEucmVhZF9tb3N0bHkpIHsN
Cj4gLSAgICAgICAgKiguZGF0YS5yZWFkX21vc3RseSkNCj4gLSAgICB9IDp0ZXh0DQo+IC0NCj4g
ICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4gICAgICBERUNMX1NFQ1RJT04oLmRhdGEpIHsg
ICAgICAgICAgICAgICAgICAgIC8qIERhdGEgKi8NCj4gLSAgICAgICAgKiguZGF0YS5wYWdlX2Fs
aWduZWQpDQo+ICsgICAgICAgICooLmRhdGEucmVhZF9tb3N0bHkpDQo+ICANCj4gICAgICAgICAg
SFlQRlNfUEFSQU0NCj4gIA0KPiArICAgICAgICAqKC5kYXRhLnBhZ2VfYWxpZ25lZCkNCj4gKw0K
PiAgICAgICAgICAqKC5kYXRhIC5kYXRhLiopDQo+ICAgICAgICAgIENPTlNUUlVDVE9SUw0KPiAg
ICAgIH0gOnRleHQNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuUyBiL3hl
bi9hcmNoL3Jpc2N2L3hlbi5sZHMuUw0KPiBpbmRleCAyNTBlZTNmMzZmNGYuLmQxYzVjZTU5Yzkw
ZCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvcmlzY3YveGVuLmxkcy5TDQo+ICsrKyBiL3hlbi9h
cmNoL3Jpc2N2L3hlbi5sZHMuUw0KPiBAQCAtODQsMTYgKzg0LDEzIEBAIFNFQ1RJT05TDQo+ICAg
ICAgICAgIF9fcm9fYWZ0ZXJfaW5pdF9lbmQgPSAuOw0KPiAgICAgIH0gOiB0ZXh0DQo+ICANCj4g
LSAgICAuZGF0YS5yZWFkX21vc3RseSA6IHsNCj4gLSAgICAgICAgKiguZGF0YS5yZWFkX21vc3Rs
eSkNCj4gLSAgICB9IDp0ZXh0DQo+IC0NCj4gICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsNCj4g
ICAgICAuZGF0YSA6IHsgICAgICAgICAgICAgICAgICAgIC8qIERhdGEgKi8NCj4gLSAgICAgICAg
KiguZGF0YS5wYWdlX2FsaWduZWQpDQo+ICsgICAgICAgICooLmRhdGEucmVhZF9tb3N0bHkpDQo+
ICANCj4gICAgICAgICAgSFlQRlNfUEFSQU0NCj4gIA0KPiArICAgICAgICAqKC5kYXRhLnBhZ2Vf
YWxpZ25lZCkNCj4gICAgICAgICAgKiguc2RhdGEgLnNkYXRhLiopDQo+ICAgICAgICAgICooLmRh
dGEgLmRhdGEuKikNCj4gICAgICAgICAgQ09OU1RSVUNUT1JTDQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPiBpbmRleCA5MjU4
NDg5ODAyMTkuLjk5ODAyYWVkNGUxMyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5s
ZHMuUw0KPiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+IEBAIC0yOTUsMTMgKzI5NSwx
MSBAQCBTRUNUSU9OUw0KPiAgDQo+ICAgIF9fMk1fcndkYXRhX3N0YXJ0ID0gLjsgICAgICAgLyog
U3RhcnQgb2YgMk0gc3VwZXJwYWdlcywgbWFwcGVkIFJXLiAqLw0KPiAgICAuID0gQUxJR04oU01Q
X0NBQ0hFX0JZVEVTKTsNCj4gLSAgREVDTF9TRUNUSU9OKC5kYXRhLnJlYWRfbW9zdGx5KSB7DQo+
ICsgIERFQ0xfU0VDVElPTiguZGF0YSkgew0KPiAgICAgICAgICooLmRhdGEucmVhZF9tb3N0bHkp
DQo+ICANCj4gICAgICAgICBIWVBGU19QQVJBTQ0KPiAtICB9IFBIRFIodGV4dCkNCj4gIA0KPiAt
ICBERUNMX1NFQ1RJT04oLmRhdGEpIHsNCj4gICAgICAgICAqKC5kYXRhLnBhZ2VfYWxpZ25lZCkN
Cj4gICAgICAgICAqKC5kYXRhIC5kYXRhLiopDQo+ICAgIH0gUEhEUih0ZXh0KQ0KPg0KPiBiYXNl
LWNvbW1pdDogNDI2M2ZlNDJiNzM2NTk2Y2ZhNWJmZWM2NjFmMmY1NWYwMjc1OWFhNw0KPiBwcmVy
ZXF1aXNpdGUtcGF0Y2gtaWQ6IDY4MDA3MTE0ODEyOTMyMWZmYWY3YmQ3NDM1ZDAzMTkwNDAxNGY1
NTYNCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

