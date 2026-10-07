Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECCBCA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 17:09:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442584.1660128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEV91-00039J-4y; Wed, 07 Oct 2026 17:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442584.1660128; Wed, 07 Oct 2026 17:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEV91-00039B-1X; Wed, 07 Oct 2026 17:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1442584;
 Wed, 07 Oct 2026 17:09:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xEV8z-000395-Ky
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:09:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEV8y-008nCJ-WA
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 19:09:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac67cbb-e002-0a2a0a5209dd-0a2a4506a7a4-32
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:09:28 +0200
Received: from [40.107.130.79]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac67cc8-195a-0a2a45060019-286b824f34da-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:09:28 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 17:09:24 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 17:09:24 +0000
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
 b=jxa5SaopmgIf50+28UcDQqo5veFlBzfIpYVVbxUY9aF8+jtpZTDd57ll2E6SkARl8QoW45IQdlG483nmfTuliyB0xE02ub6rnrtttWugtdbBHOeWXV3/MY8Tu3lDTOf7kxboiDi813JvMO0neVzlWw0J2cn2YyEyGJCDQ/QCVnT6Q/SoDKkh0441TzgUtBF5lP9RSaI2QsxqTL/bVjCfABNMjG/kA0kpy2stozgxfL0vJ2ap7CDxP8uikp4ez5ZPf/qyHHfFltNQu9SdAN3XF5CCq+y77WH1eFym9N9wqn7oJ9J+VsGRJclTfYxJAsEQDKKwv4svRUhLCVMGWaPO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4p6tVk0AAfZ2qiQHiUWiyFlFnENM70hfHdz8Z4lSV4=;
 b=Uu/MOgj1pcBIGN+4Mgl7Ud7alAmDQUzWwx8gwAz1mRcESTAPQ+2vc96p8cft5YcAmM3vv0rFgGA20NqTZgdXErYT8OzZlLgPgRuAosceUviaKLjBwmRKGOz1uzeQdhF+DO1qH+CAvRRZSt9s3RJSEdyOVcXschTsMUlyFsNfxW94xS3ig5col5JWjhhY8EGaPPLns+IVQOrCrJ4jMklawECY5cZSe8PdkZ9fobtQtwTPiFrKmSar1jtU+wdIV070e5E8VMEXub+9FE4IKypc0GHs1iGJRm5vk0/LhP8+LYvPa5PxK1UvyaaGTgEL/F9l+K9qqgR3IFb26qsFswGZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4p6tVk0AAfZ2qiQHiUWiyFlFnENM70hfHdz8Z4lSV4=;
 b=t75R+Zs7hNWqfX5Zbxo5+pbuIdp9/wDxDrP5entLbQRkFca6QjFAaJhYoHWrcfN+7QopIyjqlgkwuo+TnrwhxH4+uf+ua0gAsfdZVODn49wpT58hXODrtVL4h8fbJlSCnhOFAHX3wSBgB3oAsj40/6JbJdMx16inGfxWGH8yW42rB7inAVkkRUfsTTtJDMIRrNXSftguTm+LYzdCkHcvAhRTWR/N72wdhgzzSd6HPEONb8fUhfFhA29eXb73Ui1s9AqQVUGKcStB5HlPhoblhBzYJT9yX16WzTUjg/T/QIAzsjUE3YptzvEZH3MSD+1LtKHaOtfmmkWn1Ox8Sd7C4Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdVZ47rgN8qfc/LUyZracn12XLU7bwnI6AgAASYQCAAOP3gIAAL16AgACPsoA=
Date: Wed, 7 Oct 2026 17:09:24 +0000
Message-ID: <8e6cf8dc-7b93-4dba-b290-d41858a6fec8@epam.com>
References:
 <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
 <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
 <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
 <22ed9e39767c74e820e964acc2e32a32@bugseng.com>
 <7cadeebd-3ba7-4d8e-9874-aa5f4aeef93e@suse.com>
In-Reply-To: <7cadeebd-3ba7-4d8e-9874-aa5f4aeef93e@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|AS2PR03MB8907:EE_
x-ms-office365-filtering-correlation-id: ba710202-63be-4772-efbd-08df2495bcb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|23010399003|260925022911599003|56012099006|4143699003|260925021911599003|11063799006|4133799003|10067099003|6133799003|260925021311599003|5023799004|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 K6bzG3i0JVcVdZTSBChsKkYe0aHDGlNH8WL7AO+8swewDpBOLuciTbMLmXKAGNdFp0x4XBt1W6XUmGyyG6TnKEpEBazQoff9HgptZMCdIeTxW3n8xmlJ0rt/m6xNyk1qclnMUaMk1knDdBaS+nSD5S+hFb8Tm73UMq/ijmFeS5ss58zWUABSFG8va16cw65Vw30kb3kr1ox68XNSzW0JvwnxV7X0Mx0Qmrf8IkUwUWy8iSiBukYK/m+dRCdje7ojbf4tMDws6nevpw0pvbvzdpKTYK6/Ts+fAjElnEUo4fp3C14fFJ9hNi0SRB2JxPgMooqXARYVgLQEDprfkE38TdglVCtQ480WCGih2+jMDp8gX80pLJiLRvJ1nPMZ6CJSWcxxDTgfQ9TNIh0uB6eSG3zbGyl1P71Gs121C08dqo2oWKJ3Z9IHS2yn07fbpxmByigx/Mb6vvWkXF8nkuj13NflN/AL07NhChgd0FyhufqJaACJUCYPKwsA9KvWVvEiuRrdKVru5JR7/wJia7cx8hr0mGa7j6SWFBdjq+Ui92sqkZsopJ30hWTOpKNOy4sruojLi+MvXOSkobQRRN87taO4eSnVlXyXp8287YqsjHVfnr5wkSlfUUY6cQ2+Hg7yvxs+3pdRo1YWxk0Gd89iQkhiZEKherFbh6YjK78QKeZHV1AtHef9WQiwVDyjKG/8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(23010399003)(260925022911599003)(56012099006)(4143699003)(260925021911599003)(11063799006)(4133799003)(10067099003)(6133799003)(260925021311599003)(5023799004)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ci94UFBRQlR0alJFZWg5RFJmWWp6cGExalp6TUVuUHd3R2tiSmhFM0ZydnU2?=
 =?utf-8?B?VVdTdmorVFJwb3NpQUo5dnoyZ1QzWHRxeFRCK2VVTWovNldEYTZtUnkrblNV?=
 =?utf-8?B?SzJ6Wm84SjNMcGI4clpmK1MyNXJnZzdIZ01VOFFiQm5VOFhUVCtVTDdvaHRP?=
 =?utf-8?B?OHhJaU5tUEdGQUZCejhVNjEvbjhQZ3FZVjc0Wnp4RFdwTjB2Lyt3Y1BxSHlE?=
 =?utf-8?B?RTBvQ1N6dTlMK1liaVNnc3JRRFRST2xjTldkTkFlaXNuUm85bGJ3TXhMYXpp?=
 =?utf-8?B?WWZWMEduQ1YxdkpBMndZWGtyZnRIYzlFVURYV3NPZFd1ZnJYNkF5by9LYkFz?=
 =?utf-8?B?WGY3N1d3N3JIMk82QUM4YVlyZ2tITnNtSzh3bkR2d0V1WmJuc1ZpekVzcEVM?=
 =?utf-8?B?cExCeSthWjhrZnBVVk0yQ1VSay9LYTZJSXFNakd0SWZqdzRmSW5ISFdpT0pq?=
 =?utf-8?B?azRpd2lmeWpJY2l4T05PUFgrV0h0d2dLV3hhcWdUU3FIaFpSU1R6eGJ4TGY0?=
 =?utf-8?B?OG9sb050eXpWSDErbEhpVnp6RGUxazdPL3U3aThWcWdMZ0xTdEVCNHdtaTgx?=
 =?utf-8?B?akN5eXVpSjl2OWhNNytjanRPWVBLbC9penhNZjByblMxeDYzMFRKVUo1d2RP?=
 =?utf-8?B?V1BvVWZPQnJkdGgrdmdBczYyQ3pkNkhIYTNqcmVPWG9DMytrQ1RnbDZaMDkr?=
 =?utf-8?B?WW1idE82Zy9TSGE1ZjY2V1BsbURkYXlHTkQyOVhHVGdRRTlwaHdWTUZDQ2h6?=
 =?utf-8?B?SkJCV1FFWUNLSzlpak0ySUpHZGtOVXcwWmRxbHRVdkpGQUpIQjZvekwrNDhY?=
 =?utf-8?B?a1JsS1FIajlSejIvNUorY25nckdCTXpxMnhONHBYamJyM05mWFVJa2gvWVZv?=
 =?utf-8?B?VGhzWTJpdmJpK3hGVmZ3TUl4MDdXYkJibzJuMmFaUXNGSGVhV2VpNFJaajhN?=
 =?utf-8?B?T3NYR2I0dDV6akdoVDZpckF5QkUxMENJTkNzK1l3bVl5VVU2TjJtaFlxZ3I0?=
 =?utf-8?B?RktIQUI1SHpZVmhoc0ZTVWZCSG4xUEZsWXVDRVBZTGt6MnhnMzhncm1RT3hI?=
 =?utf-8?B?TXMveEdvUFZRTU0vd1NwUWNKd0kvSll4TWliajdVTFZLQWhrNm8rWWQ4cldR?=
 =?utf-8?B?QjhlbzZ6Zmx5eVJkeHV4VktjY0JHdDU1Nld1UkN5U0lwaFl5YlVJU3NleVZR?=
 =?utf-8?B?UFYrbm5tcTF2d3JGVnN4SG4yclpIQ0ppeGd4RXgwa0dYTHlKQnNmQ3czQWFE?=
 =?utf-8?B?RCtLUlJSQ1hRUkdMWjhOZ2IwOEpvZTI0QWw0NnFlWlplQ0d6WWdEQXE1K1NZ?=
 =?utf-8?B?WXdUbWNJdFdQWnZBbXJSZE9JaXZtMVBwY3JkZW55ZVBvTEpSOTlEU2c3TC9X?=
 =?utf-8?B?Tlk3eGF0aWd1M3lja1krUE5NZWVuY092Y1d4aXVwYVpiUnBnYmx6NmEwZmlB?=
 =?utf-8?B?UlpMRXVPTi9KRzNvL1VEY1hUbVp1WmpSRkI4d3VkYWsveDMxekhUejN3ejlX?=
 =?utf-8?B?UUxNV1cwSHdDZjZGN2tHQkhNNHJQSzRpQjd1R2xoajdycC9xYUJ1bFMwdDR2?=
 =?utf-8?B?Q1NvRTNpdUpGdVRpRGZXYTNJZElyL1NwMFNZTHd6NlFqR2RaVzEzNVhGNGVp?=
 =?utf-8?B?TXJLbmVua3pzUkRBNnZOMCtBWjVWcFZLaWdFY3BzRWRpZjI1L29ETE95MURm?=
 =?utf-8?B?QkIvdTU4b25jMFRMd0xUVVdDbEFCSVFUSXN2RWdtdEtZNlRDOFYrcHRqREF4?=
 =?utf-8?B?UHFDVnlSTENVR1dpdk5XT0IzVTJtRXp5c1huc29JSlVPZTVTZUhBVGRKTStC?=
 =?utf-8?B?V2wwUFlwVkJ5K2hBbXhpY3RWcTVGNFFsbmpyNktCSVZjN1QvbWcwbWUrOU1k?=
 =?utf-8?B?Rk5sc0RiY3Rub2hPTzhaZkV4L0VTc1QyRUpBOWlCcDZxRUtmQkdWVnlPajUz?=
 =?utf-8?B?L3YreGh1WjU5TGhyRVVwZCtCcjEvR2lyZjM0ODU5bWFpM2VPbEpUTUxoMDlY?=
 =?utf-8?B?ckRGWTAyQU5VdHFQQWIwNTJuVmY3STFNQVNJcTJ1MUxVNjMwZDg1WGt6OG1y?=
 =?utf-8?B?anI3UE1Fd3YwbFZFTUYzRHpWbENBWTdWU2dDaUNSVGk5Y2l3czFhSFlsZWJI?=
 =?utf-8?B?TWxhNWpmaEovOFFSTVpzd0tYT05kVDRraUZ5QmpCbjAweUpYZy9iTngwcXdk?=
 =?utf-8?B?QjNaeTgxRmtBR20xajRndGFuaWtVN0ZQV3RlLzh6V0YxclVRcG9kYzBYV1JZ?=
 =?utf-8?B?Yk9vNVNqOWdDRFpmdkxQRDhqNWtCS1JUWnFIKzVCQkJQOGx0blhhVU9McVlq?=
 =?utf-8?B?dGVLLzk2NmRsZ2xnV3I2ekNaTGNkNHZEUlFXeXRWYnVTZXNyZzdSUkY2RDY1?=
 =?utf-8?Q?iC0W3RS5Ex9y/8Gw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48DB5EC13BD6B84F93DFC05EF0707B12@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba710202-63be-4772-efbd-08df2495bcb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 17:09:24.4170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/S5o0w0PIF+TWOFgKYu+NDrMEYdWkuOQY2CObdV8buLB6JzMODDFzCVdQwzhxfL+xcYjixxh7nrZ0iYCaSd5H7vAzylUdhV/Khoodtfz0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8907
X-purgate-ID: tlsNG-16d1c6/1791392968-FEC7777B-ACB5E0F8/0/0
X-purgate-type: clean
X-purgate-size: 4504

DQoNCk9uIDEwLzcvMjYgMTE6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4xMC4yMDI2
IDA3OjQ1LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+IE9uIDIwMjYtMTAtMDYgMTg6MDksIERt
eXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+PiBPbiAxMC82LzI2IDE4OjAzLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4gT24gMDYuMTAuMjAyNiAxNjoyMywgRG15dHJvIFByb2tvcGNodWsxIHdy
b3RlOg0KPj4+Pj4gSGlkaW5nIC54ZW4tc3ltcy5bMDEzXSBhc3N1bWVkIHRoZSBhbG1vc3QtZmlu
YWwgaW1hZ2UgaXMgYWx3YXlzIHBhc3MNCj4+Pj4+IDIuDQo+Pj4+PiBPbiB4ODYgTEFTVF9MSU5L
SU5HX1BBU1MgaXMgMiwgc28gLnhlbi1zeW1zLjIgc3RheXMgdmlzaWJsZS4gT24gQXJtDQo+Pj4+
PiBMQVNUX0xJTktJTkdfUEFTUyBpcyAzIGFuZCB0aGUgZmluYWwgaW1hZ2UgaXMgLnhlbi1zeW1z
LjMsIHdoaWNoIHdhcw0KPj4+Pj4gaGlkZGVuLiBQYXNzIDIgaXMgdXN1YWxseSBvbmx5IGEgc3lt
bGluaywgc28gRWNsYWlyIHNhdyBubyBwcm9ncmFtDQo+Pj4+PiBsaW5rDQo+Pj4+PiBhbmQgcmVw
b3J0ZWQgZXZlcnkgdHJhbnNsYXRpb24gdW5pdCBhcyB1bnJlYWNoYWJsZS4NCj4+Pj4NCj4+Pj4g
V2hlbiBJIGRpZCB0aGF0IHdvcmssIHJ1bGUgMi4xIGVuZGVkIHVwIGNsZWFuIGZvciBib3RoIEFS
TTY0LSoNCj4+Pj4gYW5hbHlzaXMNCj4+Pj4gam9icyAoaWlyYykuIFVwb24gcmUtY2hlY2tpbmcg
SSBub3cgc2VlIHRoYXQgQVJNNjQtYW1kIGhhcyAxNzcNCj4+Pj4gdmlvbGF0aW9ucw0KPj4+PiAo
YXBwYXJlbnRseSB0aGF0J3Mgd2hhdCB5b3UgdGFsayBhYm91dCBhYm92ZSksIGJ1dCBBUk02NC1h
bGxjb2RlIGhhcw0KPj4+PiBub25lDQo+Pj4+IChodHRwczovL2dpdGxhYi5jb20veGVuLXByb2pl
Y3QvaGFyZHdhcmUveGVuLy0vcGlwZWxpbmVzLzI5MTY1NjkyMzIpLg0KPj4+Pg0KPj4+Pj4gU3Rv
cCBoaWRpbmcgcGFzcyAzLiBQYXNzZXMgMCBhbmQgMSByZW1haW4gZXhjbHVkZWQuDQo+Pj4+DQo+
Pj4+IFRoaXMgd2lsbCBjYXVzZSBzY2FubmluZyBvZiBib3RoIHBhc3NlcyAyIGFuZCAzLCBpLmUu
IGNvbnN1bWUgbW9yZQ0KPj4+PiB0aW1lDQo+Pj4+IGFuZCByZXBvcnQgZHVwbGljYXRlIHZpb2xh
dGlvbnMgd2hlbiBib3RoIHBhc3NlcyBhcmUgcmVhbCBsaW5raW5nDQo+Pj4+IHN0ZXBzLg0KPj4+
PiBJIHRoaW5rIHdlIHdhbnQgdG8gYmUgc21hcnRlciB0aGFuIHRoYXQsIHRvIHJlYWxseSBzY2Fu
IGV4YWN0bHkgb25jZS4NCj4+Pj4gSQ0KPj4+PiBkb24ndCBoYXZlIGEgZ29vZCBpZGVhIGp1c3Qg
eWV0IGhvdyB0byBhY2hpZXZlIHRoYXQsIHRob3VnaCAoYW5kIEkgd2FzDQo+Pj4+IHdvbmRlcmlu
ZyBhbHJlYWR5IHdoZW4gcHV0dGluZyB0b2dldGhlciB0aGUgb3JpZ2luYWwgcGF0Y2gpLg0KPj4+
Pg0KPj4+PiBKYW4NCj4+Pg0KPj4+IEhtbQ0KPj4+DQo+Pj4gQXQgdGhlIG1vbWVudA0KPj4+ICho
dHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvaGFyZHdhcmUveGVuLy0vcGlwZWxpbmVzLzI5
MTczNzU3NzMpIEkNCj4+PiBzZWUgQVJNNjQgUjIuMSB2aW9sYXRpb25zOg0KPj4+IC0gMTc3IGlu
IEFNRA0KPj4+IC0gMjQ5IGluIGFsbGNvZGUNCj4+Pg0KPj4+IEFueXdheSwgd2UgY2FuIGhhdmUg
aWYtZWxzZSBsaWtlIHRoaXMgKGNvcGllZCBmcm9tDQo+Pj4gYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL3RhZ2dpbmcuZWNsKToNCj4+Pg0KPj4+IC1zZXRxPXRhcmdldCxnZXRlbnYo
IlhFTl9UQVJHRVRfQVJDSCIpDQo+Pj4gaWYoc3RyaW5nX2VxdWFsKHRhcmdldCwieDg2XzY0Iiks
DQo+Pj4gICAgICAgZmlsZV90YWcrKHsieGVuX3N5bXNfdG1wIiwgIl54ZW4vXFwueGVuLXN5bXNc
XC5bMDEzXSQifSksDQo+Pj4gICAgICAgaWYoc3RyaW5nX2VxdWFsKHRhcmdldCwiYXJtNjQiKSwN
Cj4+PiAgICAgICAgICAgZmlsZV90YWcrKHsieGVuX3N5bXNfdG1wIiwgIl54ZW4vXFwueGVuLXN5
bXNcXC5bMDEyXSQifSkNCj4+PiAgICAgICApDQo+Pj4gKQ0KPj4+DQo+Pj4gXl5eIHRlc3QgcGlw
ZWxpbmUgaXMgaGVyZToNCj4+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxl
L2RpbWFwcmtwNGsveGVuLy0vcGlwZWxpbmVzLzI5MTg1NzE3NDkNCj4+Pg0KPj4+IEJSLCBEbXl0
cm8uDQo+Pg0KPj4gSW4gdGhlb3J5IHdlIGNvdWxkIGV2ZW4gZ2VuZXJhdGUgYSBjb25maWd1cmF0
aW9uIGZpbGUgb24gdGhlIGZseSBqdXN0DQo+PiBiZWZvcmUgaW52b2tpbmcgbWFrZS4gU2VlIGUu
Zy4gWzFdIGFuZCBbMl0uIEluIHRoaXMgd2F5LCB3ZSBjYW4NCj4+IGRldGVybWluZSBwcm9ncmFt
bWF0aWNhbGx5IHdoaWNoIGlzIHRoZSBsaW5raW5nIHN0ZXAgdG8gY29uc2lkZXIsIHNpbmNlDQo+
PiB0aGUgbG9naWMgaW52b2x2ZXMgc29tZSBjb25kaXRpb25hbHMgaW4gdGhlIE1ha2VmaWxlIHJ1
bGVzLg0KPg0KPiBIbW0sIHllcywgdGhhdCBsb29rcyBwcm9taXNpbmcuDQo+DQo+PiBJbiBhbnkg
Y2FzZQ0KPj4gaW50ZXJjZXB0aW5nIG9uZSBtb3JlIGNvbW1hbmQgdGhhdCBpcyBqdXN0IGEgc3lt
bGluayBkb2VzIG5vdCBpbmN1ciBpbiBhDQo+PiBiaWcgY29zdDogb25seSBpZiB0aGUgaW50ZXJj
ZXB0ZWQgc3RlcCBpcyBhbm90aGVyIGxpbmtpbmcgY29tbWFuZCB+NQ0KPj4gbW9yZSBtaW51dGVz
IGFyZSBuZWVkZWQuDQo+DQo+IFlldCB0aGF0J3MgYW4gaXNzdWUsIGF0IGxlYXN0IGFzIGxvbmcg
YXMgdGhlIGFuYWx5c2lzIGpvYnMgZ2VuZXJhbGx5DQo+IGRldGVybWluZSBwaXBlbGluZSBvdmVy
YWxsIGxhdGVuY3kuIFBsdXMgd2l0aCBjb2RlIHNpemUgKGFsbW9zdCkgb25seSBldmVyDQo+IGdy
b3dpbmcsIHRoYXQgdGltZSBpcyBhbHNvIG9ubHkgZ29pbmcgdG8gKGFsbW9zdCkgZXZlciBncm93
Lg0KPg0KPiBKYW4NCj4NCj4+IFsxXQ0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L2hhcmR3YXJlL3hlbi8tL2Jsb2Ivc3RhZ2luZy9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9F
Q0xBSVIvZ2VuZXJhdGVfZWNsLnNoP3JlZl90eXBlPWhlYWRzDQo+PiBbMl0NCj4+IGh0dHBzOi8v
Z2l0bGFiLmNvbS94ZW4tcHJvamVjdC9oYXJkd2FyZS94ZW4vLS9ibG9iL3N0YWdpbmcvYXV0b21h
dGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2dlbmVyYXRlLWxpbmtlci1zeW1ib2xzLnNoP3Jl
Zl90eXBlPWhlYWRzDQo+Pg0KPj4NCj4NCg0KSmFuLCBOaWNvbGENCg0KVGhhbmsgeW91IGZvciB0
aGUgcmV2aWV3Lg0KU2VuZGluZyBWMi4NCg0KQlIsIERteXRyby4NCg==

