Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD41CA6007
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 17:12:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442591.1660138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVBo-0004gl-Jx; Wed, 07 Oct 2026 17:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442591.1660138; Wed, 07 Oct 2026 17:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEVBo-0004ge-GT; Wed, 07 Oct 2026 17:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1442591;
 Wed, 07 Oct 2026 17:12:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xEVBm-0004gX-UO
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:12:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEVBl-0030VJ-Uf
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 19:12:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac67d67-2eae-0a2a0a5409dd-0a2a450ad4ec-46
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:12:21 +0200
Received: from [52.101.65.101]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac67d75-f2d2-0a2a450a0019-3465416587d4-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 19:12:21 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 17:12:18 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 17:12:18 +0000
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
 b=LbAkSKT1WFQi6uHDWaeq5nksjrAdWsctsQ93y2LucF8J0P7izu/K8Mwkv5egRZo2pnLBnPbSAQy7OKVgEhDKxVijsgOqKpYq8/ykXmS4aEO+xbEFnOUg1ONQmHM3Hhaf5ZmE1wJlOc08FQguxEY4Uf8yUQX7CyRcl2+s5zP4vhnsuYtrb0G6BCvoU/qdccIrsz3/6QtasXMCSoCk8VHTNYFN26JQQRRxxuxNepLADjorsC5Yte3Nn/Y+xGWugxcq0LVU5Cx2yAziNgFldxvi6SjNBHciRkiYZsMkoel3wehJiD/mxVB+huxbbeDFjXOWNvEjVR5bvldgJnlblyiy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8YOGnWnUtt3vkVfHxoh7qJ2JSo9ob0CIBbEG6hibYY=;
 b=oJFtDuCXX/7xPu9KtXdxBoSMTgw0HZ88ojAPjgPl/wjnFkRumMHJihAlui/hpA8AlZykbsL+Ng6mYEEPbwcJaVxgWaf/nto2z8jd9tAciXiXdiA5S9ssuNYRr7z96QgtPhNVtC5DrmiF7VUyZpytNjzMUqLwSXnCBvGws6veonGJMWVwzWgSmqO8rpJeuqsoWYMvcjuo8hsgKeuxNU4fSnzQef9GJpkosI5IjzUAytbjPipaetDY9sSU5J40ALgxiEYUmdng/UxRcN/KjtutprVS0aMqGXOoSaWC/DY/4GFuQm801BmNYOxHL89+FZjAiWtJsiDLBprVhdQCIpsz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8YOGnWnUtt3vkVfHxoh7qJ2JSo9ob0CIBbEG6hibYY=;
 b=E5IN3yn3nXK4JxWQmNB5X7E9WmTQKAVA0zjUh9K5QDNvf8HpF3hggNMYd0ytGTkl90Cw17zmJ6UFOuwfF7UPjUOnMaMvd6DJTuyHsd8MAXyuy2tzzJUHeXAIg+UCKlcbmRwMPvn1nQgjZMOjBKVk0eK3yEHk7uHPL9OhOEw+FsqcJqPbEVibGpMjhTsAJml9w5iO6zm+UPzyTJk8vTJ5/NmBPJ7yA8nJ6dYxxj7TdMvOyTtcqI4XetA01owfUA0DoqzZgctfYxCFT0/TMMRNX/TcWhgjWNjS10QQQ+ZqCXqmc5aTXTKJHSqIWuXV8yJe6R+xDafp8+cOGPthubz01g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] Eclair: scan the last xen-syms linking pass on Arm
Thread-Topic: [PATCH v2] Eclair: scan the last xen-syms linking pass on Arm
Thread-Index: AQHdVn8C9qte4lKYxEOXexEb5NUBWg==
Date: Wed, 7 Oct 2026 17:12:18 +0000
Message-ID:
 <e73c282694e68083305d03219f983bf74a8bf494.1791392326.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|AS2PR03MB8907:EE_
x-ms-office365-filtering-correlation-id: 98b65a35-36a3-4513-3c89-08df24962499
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|23010399003|260925022911599003|56012099006|260925021911599003|11063799006|10067099003|260925021311599003|3023799007|5023799004|38070700021|18002099003;
x-microsoft-antispam-message-info:
 MwXuzeNvRFOR/lOa7uxD3X1J3U3O+cxeRy70PK3SW3eXp0E9PikDDNYGzMKps0VnOd77uQ4joMa4fMlxsfPv6cL8mB1MN/3thORCgCpQX5G/7+w0S2xQFwneEbeqQwTMONOgn4yQzuKes3XV6l0+y8HYJK5cW3fVG7m1h9sQdE5Pk/d31K/4+xjclk2dk/QWy47LAZIp4GwugIJPskBxK6Hc1y2EQdvXowYEtGXWjUkM6m6PT8EKL2uJdTA8dLBMa+cG6q2RwCRgPlKiFH6ccKJPscJDhLuMXaVcslLP/UlkUkjWNbLG2hebduluJ3xN6HiJ3PRVbwBj4eo+e9kRaHRhXNTTdGIsVNRiQp0lA/3+YdPnMLLJWL9sF7Z8vlIHFAhQoiw2JbB8Tdybj+ucrMHCPkI0oo+o1KaRO3n+/HlfIj6SKckGEE5b4oCK87+RDwwwTozVfzIELt/cRBTcWQePyPAtW1ghJrSJwVsYWAPbDoVbLdZGkLlLoPJ3VeW/TKPflFRk13+QZT2sHc8vuwY8TY3oRMa11afr79VJbbyzPLxCEqQXbAsw4BG//7AOW1VlC9+S9XaWt/vV/xVyJLS6XyhJwdAe1FpE+5hszqCAY8LmXRMOoJsyD8hi2vdSDG7WV2OGL68WF7e5IrRff643jU2wiDHFJjb3L6olQI4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(23010399003)(260925022911599003)(56012099006)(260925021911599003)(11063799006)(10067099003)(260925021311599003)(3023799007)(5023799004)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1FkcklWcHNxaHA1dVQxcXZGOVdiL0xsMUZjSUxXUzZrODFwbjR0Vm9mN2VE?=
 =?utf-8?B?Ykw5Y0Vhc09wOXBickw1WGYzQ2xRYmRvaFFSQjZ6SVVQcHovMFBMVW0raVds?=
 =?utf-8?B?dEhVaUFqUVBOdHJuSkN4empsbWZKdk1nTFcxcE95dEl1ejBPUlJ5Y29BZnZm?=
 =?utf-8?B?anp2NnphNGhHblRjdTBnOXh4RUtCaHB5cXI4TjMwSWZCK2NkK2pqRWNxenRs?=
 =?utf-8?B?MEd5RjQ0Q1F6QWVWY1ZtOUJXRGdlWThpbzZoQUJsUFRuUXAwN3N2eDAzMm5s?=
 =?utf-8?B?WnlsN0lqeDhSa1hxeks1ZHh5aHlZME0wSFUwaGd1SXp3aUZ0YkQrRVBBY0ds?=
 =?utf-8?B?QVFtS2VncTc3WkhsVG5oUjFSaWFzRjNUMGpiWm1uOFY2ZVF0bG9sd1ljREw3?=
 =?utf-8?B?NmlVU29KVFYzZnJ5QnpoaTRWcjR4ZEVLcUhENEl5Um5FcmtPcGhOcTJnSzNQ?=
 =?utf-8?B?WWt1b3VUWjloMGZDWFFzVlh1Zm41dEFBMWlRZWlnNXVib0NzeUY2ZjRUaTNG?=
 =?utf-8?B?eTB2MXRiUFM4MWxqTnErU0NoeE9aYnlnSzBENTdXQ2JjcnhNbDNWd1NoTVRB?=
 =?utf-8?B?dko4Z0EwbE1uWUZsTkdmeVdkeWMzN1QrMjBaWXZqU3VoTXRrOUhXbisrcjE1?=
 =?utf-8?B?ellENjMvVk9QYWJRNk5rQWNRSzhCend3bXNaL0ZlczV0bkhNTGFSNVNDdlpu?=
 =?utf-8?B?czZna1pHbi91TVJaMlJ0STRJanVZeHZpSm5OTzJOQTRlU0RmZ3E5NlMybUtp?=
 =?utf-8?B?VHZZVHdUenJVRUdUMEtaaVhRZGpOUUYxbGUzWGlZTTdxejc4WVRXUlFJWllI?=
 =?utf-8?B?NDBpWVNSQWJLcUFwdkNaU29abFZPK2lGRmlYTVQvWTZsNDQwN2dKS3BGSk5R?=
 =?utf-8?B?VFJpeU9uVnk1cFB0RUtyNjZNTjc5dXFSajVmcE1IRm1Pd01vYUtkVzVtNXZZ?=
 =?utf-8?B?RWFwckJVcFBzdExiOUdkZ0t2VkwrUitjKzl5UExFSy9mZ29IdXFNdFBDTmtT?=
 =?utf-8?B?V3d3VTFQaGxlanpxbjVjSFhmVE9pQTAwL3VkR0dnazVmMHpDZzdtTWJNclh5?=
 =?utf-8?B?ejQ2NjlKa1BxSGs3UHFuTkdvVmJ5WlJINXpWZ1pyZE53Y0FINFJKckh6bTFt?=
 =?utf-8?B?cnBRUkxkV2Z5VFRKVFZuUHdFaG9La25pbFBWanVSQ2dNTGthc3JobkVuMFBO?=
 =?utf-8?B?elIvZnE0ZzZydHlUc29wNHBWSlk3NGRKUjl5YkVGM01kblFLeTdaS0xHL1Zw?=
 =?utf-8?B?UTZNL3dUZElvQjdxU0ZiRElWRDlRWHBHb01DMk05K3pUSGhDMlk2a1ZJeTBI?=
 =?utf-8?B?cFBlRi85enNHU01YdGtHdmpITTZWZ1VuaXZaSWRKOXJ4N3ZYOU5QUjNSOGF1?=
 =?utf-8?B?T0J4UEh0Tm9uVlprYmhUeEROY1F6YnloeFAwbW5Pc0tqVTRBNnVmUThFUURz?=
 =?utf-8?B?UXRMRTFCTWg3UWtSTGQwOWRtOW1NbjBQTGtuL0xZZmlGeDBSZ3dsOTlJeG5S?=
 =?utf-8?B?SEE3ZFBUVzZrb1FMdEc5bmdweWtzUmhCeDRySVBUOTQ2WmR5TDJPNlpyK2hu?=
 =?utf-8?B?R1plN2Y1VmpWK2NVc0VCY0JmaGZRaDQySThiNmdxM05sOTl0OE1xSzRuSHNv?=
 =?utf-8?B?Q1QwQStuUWd5UkViMVE3NGF0Z2hRT3k5eVFEOVVyTFVJRFVkRGgxWWpmUmtW?=
 =?utf-8?B?MUxOR0x6elFzN1RxRzRIRmRXZlZuY2VxeDVsYitsaVhsaUFiamVtMW13WGRJ?=
 =?utf-8?B?L2pTSU9xZnJLaWlDMUVFL2poczRWZDVmR0RPTkRoYnFLSHNaYU5OeFEwamdT?=
 =?utf-8?B?L1EraElRZGVyVk1WWTVVQTBJdmdoenJjaWMrVnVtR3IzNTluZmx5RmxXaU5l?=
 =?utf-8?B?WVNscktteVhnZkxoVWIrSFlXMllSdkVFbzhMcmx6UjFEalgzQ0JUM21uWThj?=
 =?utf-8?B?c0VBTWFmNVQ0eWdGcW1uMTB1Q252ZHQzOFBKbmZFUis4SHlxdHFsSklRYTFh?=
 =?utf-8?B?dU5IenlyVURicXEvblNGZnBsRXl6bTV4TjlwS1ZCajZWT1VXUERvOTFkbzlE?=
 =?utf-8?B?ZWwrTDdycVliNEl6VzBQT212WUdmQjJRbkY5K0R4Tk94NGN5OTFlaFpIL0Q3?=
 =?utf-8?B?MElPNkw4T0hPVTIvWlZwaWt2SEhCakRHZTAzSGNFc0FxUWlXVUo0WldFck5p?=
 =?utf-8?B?TW51NzNQRWZjOVkrOGpkYXAzTjd4RXNPN3pEbDJibUxGYld2eW9URWpocEtq?=
 =?utf-8?B?OWhpNElVb2h0VXB5dFVnY1dNQUh4ZXA5Tks0Mk1CV2xsZGdxN1hrK0NCK0Nr?=
 =?utf-8?B?UkJoUjhoY0xoUmVaRkRNSjBDYWhiZk9VV1RLTUhXZTA2WkIrNjZwMU5rdnV2?=
 =?utf-8?Q?F/bAbg9q27MRXVB0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b65a35-36a3-4513-3c89-08df24962499
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 17:12:18.6961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q10cqTmUrCx2vWROnxEDuOXIIGE6QXXDQ5RlIRJ3AzcvkmdlMu3ksB3EDIhPukWjLRuya38js8TxMyoVGm74y72m4C54r05brO56fxrF/rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8907
X-purgate-ID: tlsNG-4011c0/1791393141-51AC4CFC-C5899A99/0/0
X-purgate-type: clean
X-purgate-size: 5148

VGhlIGhpZGUgcGF0dGVybiAueGVuLXN5bXMuWzAxM10gbGVhdmVzIHBhc3MgMiB2aXNpYmxlLiBP
biB4ODYNCkxBU1RfTElOS0lOR19QQVNTIGlzIDIsIHNvIHRoYXQgaXMgdGhlIGZpbmFsIGxpbmsu
IE9uIEFybQ0KTEFTVF9MSU5LSU5HX1BBU1MgaXMgMyBhbmQgdGhlIGZpbmFsIGltYWdlIGlzIC54
ZW4tc3ltcy4zLiBQYXNzIDIgaXMNCnVzdWFsbHkgb25seSBhIHN5bWxpbmssIHNvIEVjbGFpciBz
YXcgbm8gcHJvZ3JhbSBsaW5rIGFuZCByZXBvcnRlZCBldmVyeQ0KdHJhbnNsYXRpb24gdW5pdCBh
cyB1bnJlYWNoYWJsZS4NCg0KQmVmb3JlIHRoZSBhbmFseXNpcyBidWlsZCwgcmVhZCBMQVNUX0xJ
TktJTkdfUEFTUyBmcm9tIHRoZSBhcmNoaXRlY3R1cmUNCm1ha2VmaWxlIGFuZCB0aGUgcGFzcyBu
dW1iZXJzIGZyb20gdGhlIGZvcmVhY2ggbGlzdCBpbg0KeGVuL3NjcmlwdHMvTWFrZWZpbGUubGlu
ay4gSGlkZSBldmVyeSBwYXNzIGV4Y2VwdCB0aGF0IG9uZS4gQW4gZWFybGllcg0KcGFzcyB0aGF0
IGlzIGEgcmVhbCBsaW5rIHN0YXlzIGhpZGRlbi4NCg0KRml4ZXM6IGE0MDFiNWM5ZGMzNSAoIkVj
bGFpcjogcmUtZW5hYmxlIHNjYW5uaW5nIG9mIHRoZSAoYWxtb3N0KSBmaW5hbCBsaW5raW5nIHN0
ZXAiKQ0KU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVr
MUBlcGFtLmNvbT4NCi0tLQ0KQ3VycmVudCBwYXRjaCBpc24ndCB0ZXN0ZWQsIHNlbnQganVzdCBm
b3IgcmV2aWV3IChpZiB0aGlzIGFjY2VwdGVkLCBJJ2xsIHJ1biBwaXBlbGluZSkuDQoNCkNoYW5n
ZXMgaW4gdjI6DQotIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KLSBnZW5lcmF0ZSBoaWRlIHBhdHRl
cm4gYmVmb3JlIGFuYWx5c2lzDQotIHJlYWQgTEFTVF9MSU5LSU5HX1BBU1MgZnJvbSB0aGUgYXJj
aCBNYWtlZmlsZSBhbmQgcGFzcyBudW1iZXJzIGZyb20gdGhlIE1ha2VmaWxlLmxpbmsNCg0KTGlu
ayB0byB2MToNCmh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuLzJmNjdlZjdjNDU5M2QzYWI5NGI3NWI1
YjgxOWU3ZTA0NmUwNTU3OTYuMTc5MTI5MzY4MC5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVw
YW0uY29tLw0KLS0tDQogLi4uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHlzaXMuZWNsICAg
ICAgIHwgIDIgKy0NCiBhdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHl6ZS5z
aCAgfCAgMyArKysNCiAuLi4vRUNMQUlSL2dlbmVyYXRlLXhlbi1zeW1zLXBhc3Nlcy5zaCAgICAg
ICAgfCAyMCArKysrKysrKysrKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQogY3JlYXRlIG1vZGUgMTAwNzU1IGF1dG9tYXRpb24vZWNs
YWlyX2FuYWx5c2lzL0VDTEFJUi9nZW5lcmF0ZS14ZW4tc3ltcy1wYXNzZXMuc2gNCg0KZGlmZiAt
LWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9hbmFseXNpcy5lY2wgYi9h
dXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHlzaXMuZWNsDQppbmRleCBjNmUx
YTdhOTVkLi5kZjEwMDZiY2FhIDEwMDY0NA0KLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlz
aXMvRUNMQUlSL2FuYWx5c2lzLmVjbA0KKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMv
RUNMQUlSL2FuYWx5c2lzLmVjbA0KQEAgLTM3LDcgKzM3LDcgQEAgdGhlaXIgU3RhbmRhcmQgTGli
cmFyeSBlcXVpdmFsZW50cy4iDQogLWRvY19iZWdpbj0iRG8gbm90IGFuYWx5emUgaW50ZXJtZWRp
YXRlIGxpbmtpbmcgYXJ0aWZhY3RzLCBhcyB0aGV5IGRvIG5vdCBkaWZmZXIgZnJvbSB0aGVpciBm
aW5hbA0KIGNvdW50ZXJwYXJ0cyBmb3IgdGhlIHB1cnBvc2VzIG9mIE1JU1JBIEMgc3RhdGljIGFu
YWx5c2lzLiINCiAtZmlsZV90YWcrPXt4ZW5fZWZpX3RtcCwgIl54ZW4vXFwueGVuXFwuZWZpXFwu
KFswMV18YWx0XFwuLiopJCJ9DQotLWZpbGVfdGFnKz17eGVuX3N5bXNfdG1wLCAiXnhlbi9cXC54
ZW4tc3ltc1xcLlswMTNdJCJ9DQorLWV2YWxfZmlsZT14ZW5fc3ltc19wYXNzZXMuZWNsDQogLWZy
YW1lcys9e2hpZGUsICJraW5kKHByb2dyYW0pJiZ0YXJnZXQoeGVuX3N5bXNfdG1wfHx4ZW5fZWZp
X3RtcCkifQ0KIC1kb2NfZW5kDQogDQpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL2FuYWx5emUuc2ggYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xB
SVIvYW5hbHl6ZS5zaA0KaW5kZXggMjM1NmZjNDAwNy4uZWY1OWU4NzIxMiAxMDA3NTUNCi0tLSBh
L2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9hbmFseXplLnNoDQorKysgYi9hdXRv
bWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvYW5hbHl6ZS5zaA0KQEAgLTc4LDYgKzc4LDkg
QEAgZXhwb3J0IEVDTEFJUl9QUk9KRUNUX05BTUU9IlhFTl8ke1ZBUklBTlR9LSR7U0VUfSINCiBy
bSAtcmYgIiR7RUNMQUlSX09VVFBVVF9ESVI6P30vKiINCiBta2RpciAtcCAiJHtFQ0xBSVJfREFU
QV9ESVJ9Ig0KIA0KKyMgR2VuZXJhdGUgaGlkZSBwYXR0ZXJuLg0KKyIke1NDUklQVF9ESVJ9L2dl
bmVyYXRlLXhlbi1zeW1zLXBhc3Nlcy5zaCINCisNCiAjIFBlcmZvcm0gdGhlIGJ1aWxkIChmcm9t
IHNjcmF0Y2gpIGluIGFuIEVDTEFJUiBlbnZpcm9ubWVudC4NCiAiJHtFQ0xBSVJfQklOX0RJUn1l
Y2xhaXJfZW52IiBcDQogICAgICItY29uZmlnX2ZpbGU9JyR7U0NSSVBUX0RJUn0vYW5hbHlzaXMu
ZWNsJyIgXA0KZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9n
ZW5lcmF0ZS14ZW4tc3ltcy1wYXNzZXMuc2ggYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9F
Q0xBSVIvZ2VuZXJhdGUteGVuLXN5bXMtcGFzc2VzLnNoDQpuZXcgZmlsZSBtb2RlIDEwMDc1NQ0K
aW5kZXggMDAwMDAwMDAwMC4uZTM3OTVlODIzNA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvYXV0b21h
dGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2dlbmVyYXRlLXhlbi1zeW1zLXBhc3Nlcy5zaA0K
QEAgLTAsMCArMSwyMCBAQA0KKyMhL2Jpbi9iYXNoDQorDQorIyBIaWRlIGV2ZXJ5IHhlbi1zeW1z
IGxpbmtpbmcgcGFzcyBleGNlcHQgTEFTVF9MSU5LSU5HX1BBU1MuDQorIyBUaGUgcGFzcyBsaXN0
IGlzIHRoZSBmb3JlYWNoIGluIHhlbi9zY3JpcHRzL01ha2VmaWxlLmxpbmsuDQorDQorc2V0IC1l
DQorDQorY2QgIiQoZGlybmFtZSAiJDAiKSINCithcmNoPSQoZWNobyAiJHtYRU5fVEFSR0VUX0FS
Q0h9IiB8IHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSAncy9hcm0uKi9hcm0vJykNCitsYXN0PSQo
c2VkIC1uICdzL15MQVNUX0xJTktJTkdfUEFTUyAqOj0gKlwoWzAtOV1cKS4qL1wxL3AnIFwNCisg
ICAgIi4uLy4uLy4uL3hlbi9hcmNoLyR7YXJjaH0vTWFrZWZpbGUiIHwgaGVhZCAtbiAxKQ0KK3Bh
c3Nlcz0kKHNlZCAtbiAncy8uKmZvcmVhY2ggbixcKFswLTkgXSpcKS4qL1wxL3AnIFwNCisgICAg
Li4vLi4vLi4veGVuL3NjcmlwdHMvTWFrZWZpbGUubGluayB8IGhlYWQgLW4gMSkNCit0ZXN0IC1u
ICIke2xhc3R9Ig0KK3Rlc3QgLW4gIiR7cGFzc2VzfSINCitoaWRkZW49JChwcmludGYgJyVzJyAi
JHtwYXNzZXN9IiB8IHRyIC1kICIgJHtsYXN0fSIpDQorDQorcHJpbnRmICclc1xuJyBcDQorICAg
ICItZmlsZV90YWcrPXt4ZW5fc3ltc190bXAsIFwiXnhlbi9cXFxcLnhlbi1zeW1zXFxcXC5bJHto
aWRkZW59XVwkXCJ9IiBcDQorICAgID54ZW5fc3ltc19wYXNzZXMuZWNsDQotLSANCjIuNDMuMA0K

