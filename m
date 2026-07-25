Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51966C531F9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 07:46:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370477.1618585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnX4i-0005D8-HG; Sat, 25 Jul 2026 07:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370477.1618585; Sat, 25 Jul 2026 07:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnX4i-0005D1-Du; Sat, 25 Jul 2026 07:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1370477;
 Sat, 25 Jul 2026 07:45:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wnX4f-0005Cv-S7
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 07:45:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnX4e-00CH2L-Uo
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 09:45:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a646994-e002-0a2a0a5209dd-0a2a450cdc48-6
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 09:45:32 +0200
Received: from [40.107.74.121]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a646995-f479-0a2a450c0019-286b4a79e127-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 09:45:27 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB7261.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:44b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 07:45:22 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:45:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+Yytyr0xhOgg9+3ViFKZ3c4c6fUyLtOjIaaH844Rr9TkxEa8y/UnGNTJ39RLFnLD14ISl66K5hlS1dapIbGprkWx9aJapiAtGJklTx/iX6dDbay02BCfGEnpVnSP7Opu4egvlZIiD9d//dQSYxP5sye5HxhLuUjoDIbJ96kIlWq+TXKbj0+WaEYGu20SR2RHQa3u91rhrVwFprGqtWLOns5/QRLcMLEVMQlHhyfNUybzQPCJypLMSQdf7bL17eIqdFN53DG3dk7yUQO9HU42C/vnFd6pxRhC+kTLG6ucPwbTjCOt6j9WRsQIP919NPZULaRPNSJE434sI0Nv7Wjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8a7G4QUlLhL64z34KSEucbUQ5kcfbKAYyVNW+iqL6o=;
 b=em0AyaExRWF81z55R77VS2zCb0+67hZjD5TO63zcdq6oKdK4opqVgaZ8hi5C3oLz1xlGhLGPnLePmNq+/8WwkNiFONEsFXxsxg8TXztMhFfsbFDkkJP8HQLD+DbNyojSYKdTdPcOWCzJ9OUABBLaPZitcnT7LJwYYTupblc7f8/MSYld7MEmQsn2xbaFCuUTuTifFifBn2oem5ovjz+PT4e+3YAhSaSl/3UnEOpez7TmOoTsCm2iGB8+ehz6FX5LcYNvc0v3//rr/qNxy0shX+nvX8QHvoipKNHUuUz2BrxQoJIohUKjUHbLduYW8BsEG2EhcKAhczMiW3AD1Eq9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8a7G4QUlLhL64z34KSEucbUQ5kcfbKAYyVNW+iqL6o=;
 b=mGNmmddbBt5KsLj7zoDru/GaoSWlOJhvSUkgK1PL4SUDAHCvBWRGEhduBvTEZWWMjC9yQr70+gLJYm7I6X6A4k6ZMCQoyG6u+UFWoOgCy0i7PTCgD/r+0GXSbHmipvmEsRtMTWDPi2moMW2Ho7IqLfofniq/ZbkQVp5PJJrXlTA=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Topic: [PATCH v7 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Index: AQHdGGUJxRKGqVdhdUeL5+uGF+qgy7Z7MHsAgAKpzwA=
Date: Sat, 25 Jul 2026 07:45:22 +0000
Message-ID:
 <OS9P286MB7222DF4703BA2371D9D27C0482CE2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260720162819.308326-1-taka@valinux.co.jp>
 <20260720162819.308326-6-taka@valinux.co.jp>
 <60128094-5cf5-4fce-89ba-646e9790b27f@suse.com>
In-Reply-To: <60128094-5cf5-4fce-89ba-646e9790b27f@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS9P286MB7261:EE_
x-ms-office365-filtering-correlation-id: 8334214b-b376-4f85-0390-08deea20ae91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 jhHbDTAD6SOf+B29f3/EqprkDE/+Ldg8yXT7iY6gK9ULG1ZNS7Chs+hcDAkdkG8SZX4afn1YSpmVZnRVrU5eXp2ev5wxKKvrJLp9gOjWb8zZ383ElyxFy29dfsrefFGI9HXfQRh/y2sAXCvEKkzugNxZE/0X6N2ZkKzC/Hchgy3xKDDfKGNE9Ud2mah/AmJyVRg9RtKa0ed6zCK4q187K782cA5ulxg3XwRwU4ANJCgJM4jSxGW2BHOOAFnQinHkbtlymj0qVeZo3BovrdjJTVCPiJD+wp+duoDR/TBEi97ckDXtCoFS1/CTT9DhJLp7P5+H10IbBayRvQIE2o+Jv2BkNcT+zxUE6tKRCFD4SNzUyydDlLDbPn84/ligdzkXSf4oyRdc5OZt6aYEWloIxXpWd0ZmCYyu3PbTvvD7ZKkPW2MctX7xGGEDcMe0XmikOq5aa1qjlHMROjgCUscC/+hm7MCnG95T9XThj1TdUVWVnhPZhyiMeeoozu1mnmu7J3cS7sukHqrHUeofYG8vpUonmi1UrE+fr/2XWd5VuJKK+9crfS185Eh+oWcjnzt7Ow2LoQvHb5A/GmLYFGR44VtblmZ5sYB76+10iqaDM02wXdV59CAQSxiuCoosvsgjkw5hnz9+fQAu1v6wUbBKHkuFUrClwwgxN1AGXAxQ3M/ZRc6AZVpPkdjAvxHv+zF2dOhJ4eEgE5rzYB5X5feLog==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFBXK2FnQkZVQkptamF1ekRqWGJxTGM5cmlCcmVWYkhCemhOQU1rdmc0K3do?=
 =?utf-8?B?R3ZDOHhKaldZWnBjdXZHbzg5MWd2c0JNQU8vV2R4QmZMa3NlTjZLTUxSUklD?=
 =?utf-8?B?a0RDN2RWM1JnODZ0Qm1meWRjcWxsbHo5RnpiaGtZdDFKV1o0eUVVRnVVOWdu?=
 =?utf-8?B?Z0FFSzlPWENCd2VQdnY5Qm9OUE0rNGxDL1RMMjBqazhGUCtGc0hSU0d4MWVp?=
 =?utf-8?B?NWhDcVJIcTlUeDQ0RWpXU1JYa25xaGswT1hURHNhMTZCTFEydlJxVTBjYjRn?=
 =?utf-8?B?U1VscDhJUEdCa3RIVkZFNFhuTGtsV2JYZ3NPYytaNVk5NlRaMXYzTHI0ODlu?=
 =?utf-8?B?MXFkeDN3TDZNU1hxNXpHR2hYaTZqRnB3dkNaU205TklxVlV3VFlLSWR0aTNG?=
 =?utf-8?B?TkNCWW02ZzUvUUVGeDUzU3AzRHc3bE1IYytHaTU0Y3ZXZlBLbXltR2szSVdU?=
 =?utf-8?B?Q0RyckYwalFPeWtab3ZUaDNFSVhHVm1rZWFqOTZOam9OOGZML2dBcGdGVUR4?=
 =?utf-8?B?NTNUU0RQZ05kd3NUd0lHT29JcnNpS0htZk5Sa3pleXluRktxT0ZGN3crR2Rs?=
 =?utf-8?B?b0ZWNW5HeUxxUGRKUFhYTDAxZ29tS1Z3bWZ2aHk0cmtMcUVGNUtrdkdIaVQ3?=
 =?utf-8?B?ZE5XMkUydkpNQ1RzRDEwVmpSaWpZSlMxKy9iWnQzTjE1aGxzNWNPaGE2QWlh?=
 =?utf-8?B?eWlaR09DM1pGRzFGY2lzS1ZSazhJMVhKaXY5Wi9wU0RRQ3JjQVVJVm80WVQw?=
 =?utf-8?B?QlgyRVNJdHJpMk83MTczNEl2dXVLZVVteXhzdElCdHZ4c1UxNEY5VUd0YXVr?=
 =?utf-8?B?MnZ4WlJocEpqa2xtbXhGT3ZlRnA2M3o0aWNzVklra0pyZlM1OE01SHU2UHFK?=
 =?utf-8?B?SG5IaWtuRjBzdjhmWXBCM3VyZmlveUhyRE9LbFVKK2oxZDVuWmZIa3c4cjdS?=
 =?utf-8?B?LytjWDdEYVhKRnQydmh6OW1oUklURVVKUXZ1bllyL2FmaDZFb3QzczIzdE5w?=
 =?utf-8?B?cTgvTVRuMzNjdDlMdkRmOUpTZnlqZFhiMEE4MC9pZGw2MWx0am95UmZkdjBq?=
 =?utf-8?B?UzJxWWpBNmtRbWo1c2tub2JsUlpTbWFhdlNVc3JhVkRFRmRQKy94eTYwRzkz?=
 =?utf-8?B?aHM2QUx4dXN2cWhydnhoOVRQbkdjVTZkbktFOVlRTFFxUG4vQklTK09SSWJw?=
 =?utf-8?B?cUZReGZFU1FINmhDbXVBekdKR1BzSkoyZ2I2am5HTXArSkh2OWZjamU2dHFS?=
 =?utf-8?B?SUptLy9RM3dwa0Q3MDBLbVdBOERtTU1nT3YwM3hFaFNhbEh3NWVKS1p6M2NO?=
 =?utf-8?B?a2pyNUY4SlJ5VVI2OC96Y1Z6Y1N2Qk1sT01VMVQvVjVNWXBhSENsQkZqdFhj?=
 =?utf-8?B?V3A3RGxtbDc3ZUtpcTlsTWhyNTY2L3JUMEFzZzdhdVAxS3JuSjdyTG82WHlM?=
 =?utf-8?B?UFFMZTFodklMaE5tWjR3amxsdlEvb1B6TUZBdTZmajI5aE5leVk0VDd0RktY?=
 =?utf-8?B?WXNtWDBJOVhoakozaDh0eWY3OTFhZVNENk40MExqMTdLRk5sTzZQcmRpRnp0?=
 =?utf-8?B?UFBoMkJuc3YrbjlybkEvZkNnSnNVWWp6ZW5nZHBVL1dyOFJFWGc4S3Mrbkpq?=
 =?utf-8?B?ZkxxcmdVTktqbUZ1emVpR1BHc3FDSmg0WlBBUTRTNlhIWkplWnZDTjExQ01I?=
 =?utf-8?B?QUlvNDVKZ1Z2OUlQYXZPOGpBYTM3bWhoamxqdTZiRXg5L3MrTzNvQVVQbmtK?=
 =?utf-8?B?ZXhOOUpEN0xKRGNZRjU5dk0rQm8rRXc5TmJwaVN2NnFOV3dpL2dzcTR1UUpI?=
 =?utf-8?B?UFBRaGJLYTNIQml5QWRiL1cwdzNKV3hUQnREUkpkOFkzZEpTNUpockN0SCtV?=
 =?utf-8?B?M3JKRVdQSVdYUXZGWDFTTUl6Z0YxTmVtcVNkRWpaWWtGdHBYSWFTaHhSbnpo?=
 =?utf-8?B?Q3NXOTVTYUJvLzRZTHkza1ZNNWJhNW04c2x4NWdnWjdDNkc5M1YyN21NdUl5?=
 =?utf-8?B?N3ZZSzdYOURrOVdjb2wwTlNLYW4wQkhWZ3phbWtKcFJmU1V3V1JObnVSZko4?=
 =?utf-8?B?S3A0QnZueXRqdVZ4R05aa0tyREFNVWhKWWFMalR2bDBxRXVwQVpkUWRadGdo?=
 =?utf-8?B?NjhhY1krNTVKV1BUUHZZZU5LUHhIcU81M2sxZmdyNGlpYkdURFUxZ0JYSUl3?=
 =?utf-8?B?Si9PYVZTMVJhTnNqVndrcUdzaFFSZ1lEdU5KS0d6ZGxWRzU0emF6cFV1ZE1H?=
 =?utf-8?B?ZVd6NFQ2anhnWnJxWVVQZG1xdjZVQTVISlllZG96c0VpTFI1N1IzMWlYVFFX?=
 =?utf-8?Q?piuq7GHCve6nSBTMvd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8334214b-b376-4f85-0390-08deea20ae91
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 07:45:22.1700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BbJorNVLfCCYGR2hOCrTVLEbu3O1YyXrmkF+S6N7Vybu/yO8jdujP0HXOIuPCXHkpeeIOZ6Fn7+SvH3ADutaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7261
X-purgate-ID: tlsNG-d25034/1784965532-036D6A5B-2F371533/0/0
X-purgate-type: clean
X-purgate-size: 6064

SGkgSmFuLA0KDQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FjcGkuaA0KPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hY3BpLmgNCj4gPiBAQCAtNjEsNiArNjEs
OCBAQCBwYWRkcl90IGFjcGlfZ2V0X3RhYmxlX29mZnNldChzdHJ1Y3QgbWVtYmFuayB0YmxfYWRk
W10sIEVGSV9NRU1fUkVTIGluZGV4KTsNCj4gPiAgICAgICghKGVudHJ5KSB8fCAodW5zaWduZWQg
bG9uZykoZW50cnkpICsgc2l6ZW9mKCooZW50cnkpKSA+IChlbmQpIHx8CVwNCj4gPiAgICAgICAo
ZW50cnkpLT5oZWFkZXIubGVuZ3RoICE9IEFDUElfTUFEVF9HSUNDX0xFTkdUSCkNCj4gPg0KPiA+
ICsjZGVmaW5lIElOVkFMSURfQUNQSUlECQkoLTFVKQ0KPiANCj4gVGhpcyB3YXkgdGhlIGNvbnN0
YW50IGlzIGJlY29taW5nIGF2YWlsYWJsZSBvbmx5IG9uIEFybSwgYnV0IC4uLg0KPiANCj4gPiAt
LS0gYS94ZW4vZHJpdmVycy9hY3BpL3RvcG9sb2d5LmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9h
Y3BpL3RvcG9sb2d5LmMNCj4gPiBAQCAtNCwzMyArNCwzMTkgQEANCj4gPiAgI2luY2x1ZGUgPHhl
bi9jcHUtdG9wb2xvZ3kuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+DQo+ID4gICNp
bmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL3h2bWFsbG9jLmg+DQo+ID4g
Kw0KPiA+ICsjZGVmaW5lIEFDUElfUFBUVF9NQVhfTEVWRUxTIDE2DQo+ID4gKw0KPiA+ICtzdGF0
aWMgdWludDMyX3QgX19pbml0ZGF0YSBtYXBfY3B1X2FjcGlpZFtOUl9DUFVTXSA9IHsNCj4gPiAr
ICAgIFswIC4uLiBOUl9DUFVTIC0gMV0gPSBJTlZBTElEX0FDUElJRA0KPiANCj4gLi4uIHlvdSB1
c2UgaXQgaW4gY29kZSB3aGljaCAoaW4gcHJpbmNpcGxlKSBpc24ndCBBcm0tc3BlY2lmaWMgKGl0
IG9ubHkNCj4gaGFwcGVucyB0byBiZSByaWdodCBub3cpLg0KDQpPa2F5LCBJIHdpbGwgbW92ZSB0
aGUgZGVmaW5pdGlvbiBpbiB4ZW4vYWNwaS5oLg0KDQo+ID4gIC8qDQo+ID4gLSAqIFRPRE86IFBv
cHVsYXRlIHRoZSB0b3BvbG9neSBpbmZvcm1hdGlvbiBieSBzY2FubmluZyB0aGUgQUNQSQ0KPiA+
IC0gKiAgICAgICBQUFRUIChQcm9jZXNzb3IgUHJvcGVydGllcyBUb3BvbG9neSBUYWJsZSkuDQo+
ID4gKyAqIFRoZSBmaXJzdCBhcmd1bWVudCAnY3B1JyBpcyB0aGUgbG9naWNhbCBDUFUgSUQgYXNz
aWduZWQgYnkgWGVuLA0KPiA+ICsgKiBhbmQgdGhlIHNlY29uZCBhcmd1bWVudCAnYWNwaV9pZCcg
aXMgcGFzc2VkIHRoZSAndWlkJyBmaWVsZCBmcm9tDQo+ID4gKyAqIHRoZSBBQ1BJIE1BRFQgR2Vu
ZXJpYyBJbnRlcnJ1cHQgc3VidGFibGUuDQo+IA0KPiBUaGlzIGNvbW1lbnQgYWxzbyBsb29rcyB0
byBiZSAoaW4gcGFydCkgQXJtLXNwZWNpZmljLCB3aGljaCBpdCBzaG91bGRuJ3QgYmUNCj4gaGVy
ZS4NCg0KT2theS4NCg0KPiA+ICtzdGF0aWMgYm9vbCBfX2luaXQgdmVyaWZ5X3N1YnRhYmxlKGNv
bnN0IHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqZW50cnksDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGFjcGlfdGFibGVfcHB0dCAqcHB0
dCkNCj4gPiArew0KPiA+ICsgICAgdW5zaWduZWQgbG9uZyB0YWJsZV9lbmQgPSAodW5zaWduZWQg
bG9uZylwcHR0ICsgcHB0dC0+aGVhZGVyLmxlbmd0aDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGVu
dHJ5LT5sZW5ndGggPCBzaXplb2YoKmVudHJ5KSB8fCBlbnRyeS0+bGVuZ3RoICYgMyApDQo+IA0K
PiBQYXJlbnRoZXNlcyBwbGVhc2UgYXJvdW5kICYgb3IgYWxpa2Ugd2l0aGluIHx8IG9yIGFsaWtl
Lg0KDQpPa2F5Lg0KDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
IkFDUEk6IFBQVFQgc3VidGFibGUgbGVuZ3RoIGlzIGludmFsaWRcbiIpOw0KPiANCj4gTGlrZSB5
b3UgaGF2ZSBpdCBoZXJlLCAuLi4NCj4gDQo+ID4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+
ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggKHVuc2lnbmVkIGxvbmcpZW50cnkgKyBlbnRy
eS0+bGVuZ3RoID4gdGFibGVfZW5kICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGso
WEVOTE9HX0VSUiAiQUNQSTogUFBUVCBzdWJ0YWJsZSBleHRlbmRzIGJleW9uZCB0YWJsZSBlbmQu
XG4iKTsNCj4gDQo+IC4uLiBubyBmdWxsIHN0b3AgcGxlYXNlIGluIGxvZyBtZXNzYWdlcyAoYXBw
bGllcyBlbHNld2hlcmUgYXMgd2VsbCkuDQoNCk9rYXkuDQoNCj4gPiArc3RhdGljIGJvb2wgX19p
bml0IHZlcmlmeV9wcm9jKGNvbnN0IHN0cnVjdCBhY3BpX3BwdHRfcHJvY2Vzc29yICpwcm9jKQ0K
PiA+ICt7DQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIHRhYmxlX3NpemU7DQo+ID4gKw0KPiA+ICsg
ICAgaWYgKCBwcm9jLT5oZWFkZXIubGVuZ3RoIDwgc2l6ZW9mKCpwcm9jKSApDQo+ID4gKyAgICB7
DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkFDUEk6IFBQVFQgcHJvY2Vzc29yIG5v
ZGUgbGVuZ3RoIGlzIHRvbyBzbWFsbC5cbiIpOw0KPiA+ICsgICAgICAgIHJldHVybiBmYWxzZTsN
Cj4gPiArICAgIH0NCj4gPg0KPiA+ICAgICAgLyoNCj4gPiAtICAgICAqIEdlbmVyYXRlIHRlbXBv
cmFyeSBjcHUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gZm9yIG5vdy4NCj4gPiAtICAgICAqIEl0IGFz
c3VtZXMgdGhhdCB0aGUgY3B1IGRvZXNuJ3QgaGF2ZSBTTVQgYW5kIGFsbCBDUFVzDQo+ID4gLSAg
ICAgKiBiZWxvbmcgdG8gdGhlIHNhbWUgc29ja2V0Lg0KPiA+ICsgICAgICogRWFjaCBwcml2YXRl
IHJlc291cmNlIGlzIHJlcHJlc2VudGVkIGJ5IGEgMzItYml0IHJlc291cmNlIElELg0KPiA+ICsg
ICAgICogRW5zdXJlIHRoZSBzdHJ1Y3R1cmUgbGVuZ3RoIGFjY3VyYXRlbHkgYWNjb3VudHMgZm9y
IHRoZSB0cmFpbGluZyBhcnJheS4NCj4gPiAgICAgICAqLw0KPiA+ICsgICAgdGFibGVfc2l6ZSA9
IHNpemVvZigqcHJvYykNCj4gPiArICAgICAgICArICh1bnNpZ25lZCBsb25nKXByb2MtPm51bWJl
cl9vZl9wcml2X3Jlc291cmNlcyAqIHNpemVvZih1aW50MzJfdCk7DQo+ID4gKw0KPiA+ICsgICAg
aWYgKCBwcm9jLT5oZWFkZXIubGVuZ3RoICE9IHRhYmxlX3NpemUgKQ0KPiANCj4gSXNuJ3QgIT0g
b3Zlcmx5IHN0cmljdD8NCg0KSSB3aWxsIHJlcGxhY2UgaXQgd2l0aCAiaWYgKCBwcm9jLT5oZWFk
ZXIubGVuZ3RoIDwgdGFibGVfc2l6ZSApLiINCg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGFj
cGlfcHB0dF9wcm9jZXNzb3IgKl9faW5pdCBmaW5kX3BwdHRfbm9kZSgNCj4gPiArICAgIGNvbnN0
IHN0cnVjdCBhY3BpX3RhYmxlX3BwdHQgKnBwdHQsIHVpbnQzMl90IGFjcGlfaWQpDQo+ID4gK3sN
Cj4gPiArICAgIGNvbnN0IHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqZW50cnk7DQo+ID4g
KyAgICB1bnNpZ25lZCBsb25nIHRhYmxlX2VuZDsNCj4gPiArICAgIGNvbnN0IHZvaWQgKnB0cjsN
Cj4gPiArDQo+ID4gKyAgICB0YWJsZV9lbmQgPSAodW5zaWduZWQgbG9uZylwcHR0ICsgcHB0dC0+
aGVhZGVyLmxlbmd0aDsNCj4gPiArDQo+ID4gKyAgICBwdHIgPSBwcHR0ICsgMTsNCj4gDQo+IE1h
a2UgdGhlc2UgdGhlIGluaXRpYWxpemVycyBvZiB0aGVpciB2YXJpYWJsZXM/DQoNCk9rYXkuDQoN
Cj4gPiArICAgICAgICAgICAgaWYgKCAocHJvYy0+ZmxhZ3MgJiBBQ1BJX1BQVFRfQUNQSV9QUk9D
RVNTT1JfSURfVkFMSUQpDQo+ID4gKyAgICAgICAgICAgICAgICAgJiYgcHJvYy0+YWNwaV9wcm9j
ZXNzb3JfaWQgPT0gYWNwaV9pZA0KPiA+ICsgICAgICAgICAgICAgICAgICYmIChwcHR0LT5oZWFk
ZXIucmV2aXNpb24gPCAyDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHx8IChwcm9jLT5mbGFn
cyAmIEFDUElfUFBUVF9BQ1BJX0xFQUZfTk9ERSkpICkNCj4gDQo+IE1pc3BsYWNlZCBiaW5hcnkg
b3BlcmF0b3JzIChhbHNvIGVsc2V3aGVyZSkuIE9uIGNvbnRpbnVlZCBsaW5lcyB0aGV5IGdvIGF0
DQo+IHRoZSBlbmQgb2YgdGhlIGVhcmxpZXIgbGluZS4NCg0KT2theS4NCg0KPiA+ICsgICAgICAg
IHByb2MgPSBmaW5kX3BwdHRfbm9kZShwcHR0LCBhY3BpX2lkKTsNCj4gPiArICAgICAgICBpZiAo
ICFwcm9jICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0df
V0FSTklORw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIkFDUEk6IE5vIFBQVFQgbGVhZiBub2Rl
IGZvciBDUFUgJXUgKEFDUEkgSUQgMHgldSlcbiIsDQo+IA0KPiBQbGVhc2UgcHJlZmVyIHRoZSBz
bGlnaHRseSBzaG9ydGVyICUjeCAoYW5kIGRlZmluaXRlbHkgcGxlYXNlIGRvbid0IG1peCBhIDB4
DQo+IHByZWZpeCB3aXRoICV1KS4gQWdhaW4gYXBwbGllcyBlbHNld2hlcmUgYXMgd2VsbC4NCg0K
T2theS4NCg0KVGhhbmsgeW91LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

