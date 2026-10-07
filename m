Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9742CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 17:46:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442611.1660146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVik-0000hV-1m; Wed, 07 Oct 2026 17:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442611.1660146; Wed, 07 Oct 2026 17:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVij-0000hO-Uc; Wed, 07 Oct 2026 17:46:25 +0000
Received: by outflank-mailman (input) for mailman id 1442611;
 Wed, 07 Oct 2026 17:46:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEVih-0000hI-Tl
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:46:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEVig-00EYXC-DX
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 19:46:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac68543-bab6-0a2a0a5309dd-0a2a45098e14-42
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:46:22 +0200
Received: from [52.101.84.119]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac6856d-be1a-0a2a45090019-346554774639-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:46:22 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS2PR03MB10155.eurprd03.prod.outlook.com
 (2603:10a6:20b:64d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 17:46:20 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 17:46:20 +0000
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
 b=GVctzl8Je3zIkFAINwci3stlEMkX6ndJ2tDkfOEzAhN1vP4JZaWKLj8LPiIPe7oNnGiTpaHk14RLPwRLxZVYskG15Cr70kUjkTOXK2NCKyfbdCnGdSyrrDOtWVeCp4y+GLylPCEx+ITRod8Xp6j7xmmygicHUODV3pWhptCmIwzJNc1ZHfhqCa/6SMhm9lZMzueJW5Rrwe6Z+2+nG7kvzQ/oJSRBNbqOkoPZ+0iU78d2xXeYxlmQ7EiMQ5GpsDzmkmHSmpNoK1LbqOSL8pwN9N/tylQHWO5tdrsqpJPZaOVCQ4FrymWfFFP/wkMAR0umOsNuEEdnAu4w+RenkD5v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etNi6/tzL0jNLVy4LsgM26NsX76EYCqaVyyNtm3ZzvI=;
 b=DQ1KYllYZBWAPlaA89vy/ZSYn5eUe4y5hjGmQ5p44ubezXFsbdJrTqANhOOEBHOYaiTPLKdIXA+Ix9ajuDwV3Wxu9C2XWoUAmwdEgwr7QlVBD6LD94WPNEmpmKUu374at36v91A8+qtgwZvXMsjeunapS8ejChkCSpvqzPO8oxRat/ep5bkzM0JGJyKUvkwZQ7I7DsuBu+m7CLy1IduhJeErqsha9wdX5vkc6DppvZMw++5vGixCpO8uqAaTwaUewD3Rwm427ht8Ew+52Sp79FO8Ug6xTCPKOVNWljZXraGelIWS3Msd7SxoC8ATClh/xqZKEderlWxtwMuHkzyxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etNi6/tzL0jNLVy4LsgM26NsX76EYCqaVyyNtm3ZzvI=;
 b=X8U5U3IhfUd2mbcoa566mFCpJ2R233RO+X3CopHYmuSDFqEBwRweIu0Ylgfxyh7QjT76jv1sepfdXFw/uje3rYA5eqlgYKslFl+eqatg/UN8NQK+p38e+Isquh3kVy9b/j0C7FiOxuHgPjRAjkMZPnBJC3+YtnDrtHpKv1T5jSxbcUMLroQ7IECckhjPMpUnUd48rHGjLAc4UB+GsNrb5rRX1VBc0c34nfVOiIRvBKE1pq5CNyRQDt9bcrtDqtKKyU5hRMQ3SlCLY1QV4A2CmwyoEihONmISg7JngIJWpvsSDKdq8cjr/mX1gsbtefORTsWhEuKPx5hoxqj/pznTZQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/6] x86/alternatives: adjust _apply_alternatives() to
 comply to Misra rule 18.2
Thread-Topic: [PATCH 2/6] x86/alternatives: adjust _apply_alternatives() to
 comply to Misra rule 18.2
Thread-Index: AQHdQFsfe75+NzGtXk64qzkN3mSrm7byhs6A
Date: Wed, 7 Oct 2026 17:46:20 +0000
Message-ID: <c49923e9-a773-4d2c-ac3c-75e5168bdef7@epam.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
 <6e503818-3446-4bdc-8b65-d61169667b7a@suse.com>
In-Reply-To: <6e503818-3446-4bdc-8b65-d61169667b7a@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|AS2PR03MB10155:EE_
x-ms-office365-filtering-correlation-id: 847d593b-f527-4bf1-8c40-08df249ae58e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|42112799006|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 QrsFY5Ee00zrhATjFHany3SizBtQA50rXb1flXZRwLurZ4RvZ95cacyfrizOKsTiA1YLfzurc92suJ+yQCa4xpdyo+/IlQeDQ+Po3OMsuBVvIdPrNFubnh4LAKFITmqyHuy7oKDIQQflbXE/MZqzbHN+ZrKA8LeoWD8A1FVorByMLj64UULUdBrf9+owdsDkOxq7y4ht0byN5alBhGUCs/yf2mnDz5YuCaY8yk9Xq7oCu/sD5oH1bOxg3sKhOfE/Ep7B5UdhYMuGRs1/+V+qzDPGkEnRCTTgN4g+Tj+397/6NrMYAoTun8CSXSPzQHlRA/ylbdKtW2Rl067kAnNCJDuOQZqlVKrn8hJRIxNCFna1Da32scbt/atgzx4ZeZo/zVsBj0u7AmlCe9rUvmTlPcvsXUNFGeyqrn/ZnEndYYesJ+RceKq//ZP0haqHPQXtITVE9EtXqDXMHK5vfmFA8y8w4A3px4eYWbFpm6u4dVa10cYGhTFMJ4dCgGyIdc8yVSmC8uaVR0ZI/xnxwA9VsWq5+2uX18gcRKKCZdFSnXTaS7mc9moeIB6M/+/QehxqO7cFQs6LAgXBapKJilHpHvibQfTXp1Xh1xsEfLBLorarO836JRGR9D7zcStmQaBxx+fuo34RF50ER2yeimonQF7V0H5i/PpJCOm+YVJqOONzmKeQ3ihgcWiPFxH/V7tPrlsZca8l+eLfk0pfEs0Mzw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(42112799006)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUp4aExKVVFuaVZ2cVBCR2pWdVAwak1teklnMEJkbkVTS2Vmc1VHYnp6dllt?=
 =?utf-8?B?ejRXUlpzSGwxaHdWR28rbGNiNmg4aHM4VFVwUXFWQ1M2L2JHRFdmWUxBMWFR?=
 =?utf-8?B?VzlybXU5d3d0ZW5ZRUNPT0Q3Q0NhSnZTLzNJcDZ2VWFncnBwYTlxb3BPZDBR?=
 =?utf-8?B?MXRlOGRGVGZFaG5MdEZ4ZHc1UGVMa2Z1U3VER0RpeCtLM3hjUGZLOTQ3aVdH?=
 =?utf-8?B?RHMzOVRRY2pqNGFSTE82bC9GcXJkVGdYWklDWHdsTlNleFh5bHJ2b1h1a3dC?=
 =?utf-8?B?cTkyL0lUeDhUcDNJbGlBaXg5TDZBVHBSOHRWcUNZN3JSdHNibEsyalBnWHlt?=
 =?utf-8?B?enJqbldhU2g2M0VaSGlRVHBvelI3OUF2elpJUFhoZEt3VmdzWVU1V0pacGpG?=
 =?utf-8?B?K0tYbHF2cFowYmZTK2VET2JRQ1NBQkFJWmxyRE1Gc3RBRU1WS1RuUk9iSnNx?=
 =?utf-8?B?QzVVbkFtSWRXQ2Q4NEkrajlNbHplblhHNlpMRDJlaUNyQVNoQXJCeTVVS3Iw?=
 =?utf-8?B?L3dNRmVXMzJkOXdQVlkwWEx1RDV6VDEzKzlQV1A0VURuTERVUVlGam54MXpw?=
 =?utf-8?B?c2l5dFFHZHIzbHZ0T1E3UlplcmY5azd0RXZTSU4yTk8yb2JFQkx2VWRqalpZ?=
 =?utf-8?B?aDY1cUxwNjYwSU5SU0lBY1JJT050M2sxU1F3amlnRTRGeHFUK0dCVWQxZ21i?=
 =?utf-8?B?WVZxMHp3VUhGRmU0WHBHYVFtZWxkWWpLNll2QnJJNnFOVHlOcXM5NllaTjdn?=
 =?utf-8?B?SGtETSsxODZwMThuRmk2RC9rU1dZWERxN3QzM3lWajdvRFh5eUI5bVhHVnc4?=
 =?utf-8?B?U0ZCWHhOUm9ldy9JcG0vcW11aHlucXQvZTAzcHNVVXF6K0hpNnhWdVZkcGtX?=
 =?utf-8?B?Rk5KV1FMQUExOW55RjR6REMzRFVpY3BEcXU1d3FNL2paazNHcUZIbk5rb2sr?=
 =?utf-8?B?ZmQ4L2FtbzdSZk0rU0hXZGVXNUx4QUQ0MFVreGVveTVVWG1YMkpQL0lxNWUv?=
 =?utf-8?B?K2tFc201Y1k2V01xWUVHNVVZTmFPWE9VZ3psZ3JCVFJJMTlmc0xyUHpoMGRM?=
 =?utf-8?B?cFhjZVUvQ3dNTGR5TDZDc3ZjUDZvcDZEakdab1podlVKUFEycldPYWZyL2lZ?=
 =?utf-8?B?cmZwWlg0b0JkZ2F0b0EvSGUzeHl1eGo4LzBoU1c3RTVZblRNTmlLc3dLWXU1?=
 =?utf-8?B?ekJMdGVMOVd3RnQ4bm9VZjQwZUZmcXdINnhQa2srRWpxSEhHdVZuV01ySFhW?=
 =?utf-8?B?bmhiS21uWmcxa0t0MjFrRlBXWTBmUVpQZFJ6QUZ6ZXBpVDRXM08vQzJZRlNz?=
 =?utf-8?B?dWZqWFNjVW5uZTJLejVBYWh3M0d0aVhxZnZYV3lVeXIrSnV5b3daVmNESExE?=
 =?utf-8?B?Y0hJM0JUOFhCakI1Z0lHcTlYNk5XOXVYS2pXemdzaHFCME00akdWZThLVnow?=
 =?utf-8?B?YzgvM05LZGE1Z3VCanJuOHYvZitvY2xuaERXcXJGdUlZbXk5KzlTNGZFQm9V?=
 =?utf-8?B?dVdFdXJINzQ2UVFTL1BIMEdZNHdHemhaa2V4dDk4SFBQMGtQUHU3OGdtTUpV?=
 =?utf-8?B?Z3o4bHlGRGtWTGVQUEE4aVdlYmo1cmtNWlZQSk95ZHhTZVRGYUVWSkxDenNG?=
 =?utf-8?B?SmRyQU0vYWU5QlY3eWpQd2hDUFlHNGhDVjZtRlBMdmNLR0lrVXZoV2pYaHJO?=
 =?utf-8?B?OW5DdmFiU2VYejV1WmoraHhTYkxMNHMxYjFkbnptSFhDRWRvQ2NwSUVzVGNZ?=
 =?utf-8?B?NUxhN1orZmh1bHhWbHJEY2JQSW5HWVJvNFI0WUVFelJGenRwNyswbDZxeGM5?=
 =?utf-8?B?bkE4NFlnNXZRZ2lkanU2UGI2NlYvdDJNbW1pVTRLc0d6YTdFQmdxOVlaakd4?=
 =?utf-8?B?dGFDeXQyNmdGN09lUG50c2xSU25yZVJ3ZjRyZ3p2Y0hBdUNmem5qVmtRN2p6?=
 =?utf-8?B?bHV0VUswZWxFTXRXdGdrc0gyUDRjdTQ1VW5jSzRzZGhSZWp5bE5HZHRySkVp?=
 =?utf-8?B?RjVobzlOMDJYWCt0SE5MK2dYbnN6eU4wZnZHSXlwbmxoUlJrbUt0YXRNYTJj?=
 =?utf-8?B?SU9kK3JIbnhlQTR0Yk0vdldnTzVGKzkrQnF1V1FsRlpoejg2R3pjZ3p0RzNm?=
 =?utf-8?B?NE92bXJTUGlYdjdFdlA2N3dBNjNuSWVrMzEvdXdLYldnbHZpQ1ZRZmNTb3ky?=
 =?utf-8?B?VFdvYWZIdmQzWFIvdUl5ZXNDVnRLYkVUQlZBNXhQSDJwYksrdHNoQWVFTHRM?=
 =?utf-8?B?Z1BhYTBNRVFtaFFyYXFia1FBWEtCTk0zY253cCtkTzBpVS94N05reXhBckRi?=
 =?utf-8?B?RDZyZC9jem1LdllkUGR1eDdua29weTVBaTluN3VuemJLOW9wM2JEaDRicHFL?=
 =?utf-8?Q?00iyIdvvSHPaNy2I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32905446D955154D8E52D0BF18CF2A6D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847d593b-f527-4bf1-8c40-08df249ae58e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 17:46:20.4521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZpj3R8LFMo8G1vqXTh2ZfBSIWn+bwwvKCb2VJNHGzd2DHhucLw9rAG//e/SozcvxlSwYqaKCrfdSqHfVzgrEcqVftYiD47Tq1xCZuQci1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10155
X-purgate-ID: tlsNG-bad1c0/1791395182-BF2DC034-72F01FF8/10/78276251493
X-purgate-type: spam
X-purgate-size: 1804

DQoNCk9uIDkvOS8yNiAxNTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdoaWxlIGF2b2lkaW5n
IGNhc3RzIHdvdWxkIGJlIHByZWZlcmFibGUgaGVyZSwgdGhlIHN1YnRyYWN0aW9uIGVuZHMgdXAN
Cj4gdmlvbGF0aW5nICJTdWJ0cmFjdGlvbiBiZXR3ZWVuIHBvaW50ZXJzIHNoYWxsIG9ubHkgYmUg
YXBwbGllZCB0byBwb2ludGVycw0KPiB0aGF0IGFkZHJlc3MgZWxlbWVudHMgb2YgdGhlIHNhbWUg
YXJyYXkiLiBVc2UgbG9uZyBhcml0aG1ldGljIGluc3RlYWQuDQo+IA0KPiBObyBmdW5jdGlvbmFs
IGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hbHRlcm5hdGl2ZS5jDQo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9hbHRlcm5hdGl2ZS5jDQo+IEBAIC0zNDIsMTMgKzM0MiwxMyBA
QCBzdGF0aWMgaW50IGluaXRfb3JfbGl2ZXBhdGNoIF9hcHBseV9hbHRlDQo+ICAgDQo+ICAgICAg
ICAgICAvKiAweGU4LzB4ZTkgYXJlIHJlbGF0aXZlIGJyYW5jaGVzOyBmaXggdGhlIG9mZnNldC4g
Ki8NCj4gICAgICAgICAgIGlmICggYS0+cmVwbF9sZW4gPj0gNSAmJiAoKmJ1ZiAmIDB4ZmUpID09
IDB4ZTggKQ0KPiAtICAgICAgICAgICAgKihpbnQzMl90ICopKGJ1ZiArIDEpICs9IHJlcGwgLSBv
cmlnOw0KPiArICAgICAgICAgICAgKihpbnQzMl90ICopKGJ1ZiArIDEpICs9IChsb25nKXJlcGwg
LSAobG9uZylvcmlnOw0KPiAgICAgICAgICAgZWxzZSBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1JF
VFVSTl9USFVOSykgJiYNCj4gICAgICAgICAgICAgICAgICAgICBhLT5yZXBsX2xlbiA+IDUgJiYg
YnVmW2EtPnJlcGxfbGVuIC0gNV0gPT0gMHhlOSAmJg0KPiAgICAgICAgICAgICAgICAgICAgICgo
bG9uZylyZXBsICsgYS0+cmVwbF9sZW4gKw0KPiAgICAgICAgICAgICAgICAgICAgICAqKGludDMy
X3QgKikoYnVmICsgYS0+cmVwbF9sZW4gLSA0KSA9PQ0KPiAgICAgICAgICAgICAgICAgICAgICAo
bG9uZylfX3g4Nl9yZXR1cm5fdGh1bmspICkNCj4gLSAgICAgICAgICAgICooaW50MzJfdCAqKShi
dWYgKyBhLT5yZXBsX2xlbiAtIDQpICs9IHJlcGwgLSBvcmlnOw0KPiArICAgICAgICAgICAgKihp
bnQzMl90ICopKGJ1ZiArIGEtPnJlcGxfbGVuIC0gNCkgKz0gKGxvbmcpcmVwbCAtIChsb25nKW9y
aWc7DQo+ICAgDQo+ICAgICAgICAgICBhLT5wcml2ID0gMTsNCj4gICANCg0KUmV2aWV3ZWQtYnk6
IERteXRybyBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQoNCkJSLCBE
bXl0cm8u

