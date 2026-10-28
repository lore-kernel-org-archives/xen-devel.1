Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F4606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=EXEoERHf
Received: from list by lists.xenproject.org with outflank-mailman.1462941.1673923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzGQ-0005lQ-0Q; Wed, 28 Oct 2026 08:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462941.1673923; Wed, 28 Oct 2026 08:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLzGP-0005lJ-Tv; Wed, 28 Oct 2026 08:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1462941;
 Wed, 28 Oct 2026 08:44:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xLzGO-0005lB-LF
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:44:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLzGL-006nrv-U1
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:44:01 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae1b5b3-e002-0a2a0a5209dd-0a2a4502b572-48
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:44:01 +0100
Received: from [40.107.162.94]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ae1b5d1-6ca4-0a2a45020019-286ba25e1ed9-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 09:44:01 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by VI0PR03MB10447.eurprd03.prod.outlook.com (2603:10a6:800:203::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:43:57 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 08:43:57 +0000
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
 b=BabKwu7h+DAEK0ebg0FBuqWIlSEp1Kj7k8tm04VjTyBwxchrnhx3MkHEhDcqOoe9Y9SDAq6WyUoJBnUnLOnCcEf/JqAy8hWjjFoKPA0MQ2Eql8FgRqiIvNfCz/ty1ODfUagds3l1A/+m3oJgs5PWKq15VIz+f+QHd8JbOscQYwO3cnu+i1bo9QBe9y8Qmh125gyzuq0d1sYHLo41NX87nLj6of1GbfKlsdS0gGeReZURz9I7wEhvsvjLMnnlxhaVqK+c49GnZpQ/aLeF/aQ9wt0s/YYSytd84F5IHGevL6S5J2Na95qwW8RZ1tGdCOahdDJT05ri5y3hRLdgoMNIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3k2MgLDCk3FIhsRPvknL2cyyE80gg7qtG6s2Iv9BIsM=;
 b=XgSi73qQE7AH4Occ/eV8WjRhPt57ZHO/js34GG2PO5ne5XG3O4aauBS4MQJfm/I/G//dgkgVJepJhYn4zJq2zAW06jovPo/NOU9Fgnz4kDobth9wlpaGgDn4m4/yJm5dbI5xI95HhYzpuRzxWXbkHFpH9eCOdvDbN/Y3a9BFMP3t/JYlcdXW/Q4zPMdzHp6e0FB639RJ3q1h7K0AUdDkDvRZm0a+s2D+lQo76GpVuvFr3Y3xy5FElYoCcPrXymEu2v9tNPX7050+7jFh8Tcyy3LRfAg5iiW1zJ+8iMFzb8UN90QqY5PAwHHaXUHFUlksiYcPIfPGGj6kXBMvOuY+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3k2MgLDCk3FIhsRPvknL2cyyE80gg7qtG6s2Iv9BIsM=;
 b=EXEoERHf6fVYJLaTmM0/Vp4RancEYRA0iJY4kWsrEuUIdvFIZXKHLDQLg17A9vAJ5PzLrzmM/sNIRGUuXCYIdgXwdK+Ehm4hB+bszDh/41bv7Sw9y0BPyZhEySmqAQ4yOktmzix6ZFacdVKzwOJCKS3XgYk+hnhJGvHC82Eql8jNt4AzIZO5KIQKsBlj9wtfxZgkVb/Apvn/wmeH3n2bXLGaokvwLlrmh5L+sc+B7xnNDgcw3257t7nlnLaedM7lXV6BmceYFK3BIS+x3/014jhmAjIbPFryn6l4fTZaZ1ZXP05YO085VBrNL5bi/mlpW+Wp944W/o1HiFo7l33fkg==
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
Thread-Index: AQHdZUVvbuj2+I/wmEeMfHolzOWTxrcPwg+AgAFhaACAAAvYAIABdxSA
Date: Wed, 28 Oct 2026 08:43:57 +0000
Message-ID: <a07250ac-263f-46d7-8037-7db2ee17f11f@epam.com>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
 <ad545e6e-a8fe-458a-a88c-0a290b093359@epam.com>
 <97a123f8-92e8-4ff8-bb3b-a48ad2fe1392@suse.com>
In-Reply-To: <97a123f8-92e8-4ff8-bb3b-a48ad2fe1392@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|VI0PR03MB10447:EE_
x-ms-office365-filtering-correlation-id: 4801592c-c748-4d56-75ca-08df34cf9af9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|261026140227099003|38070700021|4143699003|11063799006|56012099006|261026121527099003|261021121427099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 7zm8jXLxWeO75+BQnwffOej8jz9/xXl72laOgaPhaZZPIkTT8+2hJ2zwdtC85G/Q++7cWA/Pd0GP556Gow0lk3pSL9IVzvMc03q/zwgoUk5WFfw0PCV8avGaMTebwKPJSBT9zU4dPSjhhPg9SYY5nj9XgneYYVMgKIgkEVbCz+IIyuqTAT0Xga41rqYuxdx5oVKWKWgnPWyRmwA8DZhpZhu1/qNQ2d0oTfdgu0MKjS0vLF3/bHgSvNBJ7f1ZU8+X2EOrWJwcbIHFuPoMhZaioy+BHpubnizAxLmIiF3LDs6whVp9pJ87kaHovSm7X0Op0DLsZgYrqszRAuaC8Sr2TyNQHtzxvhaY316+m6nXYGSbmvzeQB1EAFTaZNuRGZ/KBGwHVD69Na55yy9Wr/t6bx9HLLGXw/qx608jciOW44DCBmCSvG7DHILyTzGtNYbPWGA1NtqG9OVsGgkHRtdia9GES5isMse9MsuPR09LbU1cLQbRVbXZZU+i2lCc1S70LTFxJAOWOiy+3+eq2zRwbIOJY8RV16rBMV2Osy8cJrZ5TprI9CXF533rW6ijjiUmUbRz4VVKOq41w2LK7HWbNH96T/mMA6YRqIIQEar8NgJ3OesIXV+rnIEFRXdI4XW2kJTsd+GNZFDRHvxhNuPGiO1J9WxEWixv9DxTK4D5LmPBozF9rVVTmKMql1ut3DjvPekjedDMaq/hhI40idIfZZws0cax8ZRsibYVPu6aduc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(261026140227099003)(38070700021)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGJuUTNoaElJcXBtMllOMUZNOElnNTI4U3JWMERQSUtLTmpTdVZrYk9seGxo?=
 =?utf-8?B?VjZNZEp5ellLdm5Ocjg1WTdFRHRWUGw2VHltQWlyTnFiaVhCZ1JuSXo2N3U5?=
 =?utf-8?B?NFgvSHBzdjVkamxQbkJBc2ZQQkkyY0UrZ3VxZDZ6ay9RQ1FuVVVnTzlwVzBN?=
 =?utf-8?B?N2ZBakZCWGwxdWZJUU54WEQvdzhlN0JsWlhreWZyVW11M1QzbExNelZuZjBl?=
 =?utf-8?B?YVRXbzVZQnVNTFoxc2ZTSC9zdExzRDdnUkgrSHlSSTRDM2lEVmpFdHRTd3lv?=
 =?utf-8?B?RzVWNFBBU1ZZODNFUHR4Qkd1aWoxc0hiVlliOGhIQmh0bGVzbW8zNjlrdENr?=
 =?utf-8?B?YUJwK3lsTXhGTSsrNm1ZL0gySGJ3dWRXN2tnYlZxUTVaQXV0MTVRSEIxaE9B?=
 =?utf-8?B?SUprcFpHZG5zRFdSL0UxVzdrbUJTTFI1b1V6SzNFQk8vTDQvN3kzVlZwTzll?=
 =?utf-8?B?anNKUDNTRGdrZktFMkowZGxhd3pSaGVWaWhKM1VTUmlWQWdUMEJiSHNmbGJB?=
 =?utf-8?B?MXQrOUFKdUNwWkhzZkIyNytDZTE1dUdyNWZJKzRLektlbDIrR2NKblNwejZ5?=
 =?utf-8?B?c2NKU2tWYWZld0VOK2V0MGxaRzNoRWxkdnRHQUVYb1hLNU9hcXdLZCtjSDBX?=
 =?utf-8?B?WGcvdkszNUF6cHg3cEcvRnByOUhCcDZtZ1lndi9UQ0dPOG83NVlLaDRSRi9Q?=
 =?utf-8?B?NlcxRFNqQWZON2tyMk1KQ2JXOE1Pak0vbDF2bk16Zi8yMU1YVFlTR1JRcUZQ?=
 =?utf-8?B?SkczUFEzR2pVaWEzWlcrTnVHUGord3B2NGhSYVFZMEwxUGV1VXhDVVMxby94?=
 =?utf-8?B?UWJJaExLeUEzNlBpc2dFc0NieWNwSlhZcTRsdXRkQWsyQ1hUSC9xbElnbVRp?=
 =?utf-8?B?UWVaOHRoZmZ0c2JzMmw2WDR3ZWs2VUk3Zzc0SGRnYjFGenpzMjJGQ0NZWkVo?=
 =?utf-8?B?ZzRiems5clBRNlVvSVI2QzlOSW1CTWZJS21CSWUxR2NnY2trNUI1MGxUUkVh?=
 =?utf-8?B?dXhNc2FiazRuQURFVCtOSXVtKy91Z3NyUnR5OUREdkZkcDNmQ0Vxb1U4UStx?=
 =?utf-8?B?MlJxaWZ0Ni96S2FtV2hXWUhxUXY4MUhTNzBsNjlFSVNaZHVwOWh6K0ROUXBw?=
 =?utf-8?B?WGt2UEp0S3lyVWtFeDRMeC9NV09VMVQyTTdvSW5vNzUyRGV1ZXlMK2UxRWR6?=
 =?utf-8?B?ZlRYc1YwUmhTT2lmOXBtZW9odlNmYUFLOExaZmhWWjBBakQrMk9Sb2grY21K?=
 =?utf-8?B?SUNWdlB4TnUwRmtWWk5oMWxSazJDT0lJeUp2R2lZbkRUZEFTdEZGa0VpTWRK?=
 =?utf-8?B?TXRkbmdMRENqVmNkVEhSODVSOFpSYk4wb1ROeTB2enZZdWVXbHVYVU5jQ1E3?=
 =?utf-8?B?SXk0MndiUXlPUmlaU3lhYnFEK0wxUWwxbTg1Z3d5LzAyZ0IxTDdsTXpGeXNV?=
 =?utf-8?B?RjFXaW9CWFY2UkpSaUxIbHJKT0QwbXk5elgzRmFDOFBqRlBSbzl3aHFoM3lr?=
 =?utf-8?B?U3F5MzhCQ3dDMlZjY3BMWmRUd2NFRnJ2YXVXWFVUTkpyRlFycTlPM2VSNTJq?=
 =?utf-8?B?dTl5R0NOUXRhOHdFRjFSeWpJVGpqU1k5dTJ4Z0MvN3k0ODhvZGVveXd3WUVr?=
 =?utf-8?B?VTg5NHBzS0ErKzNuNDFDYUluY0Z1SVVUTGpGaCtTaTA1SXJ1d3JXTC8yKzNO?=
 =?utf-8?B?UnFyamliUE05SEs5WmRVa1VLcVQwS3dtMXlJeFJGUzhDbFgvZTdYbW9pMHNn?=
 =?utf-8?B?Zm5ldy94OTV3cnBrWHBKR0xJdWlkMHpMYjV0RDhla2RaSmtxU1EzZ0ZwTmhZ?=
 =?utf-8?B?KzZUYjdZR2w5dEo3S29jekdKL1RvMVNMRmlCZnhjL1hFMFdHQ2NhaGR1UXRn?=
 =?utf-8?B?RUo2UzIrbnV5UXczR25nODlDMDhlYndWNUtLeE53MVVkTTBQYnVwQzQyOXdD?=
 =?utf-8?B?dG9VU2lyR3pIQkxPVGhXN0ZOTzJFTGxqUVhoY1ZyWkcxQkZMZHBaTWg1NU92?=
 =?utf-8?B?R3hBenNLdTFFWUVLcjNIRFIweXBmRStta1Z5S0VyU2MrYU5kb0twZnpQU0dy?=
 =?utf-8?B?WUF2R0xXWVZqNng0aGJ3YlZyd3REYXlmWmF5bCt4UVZNWUZRazZ0OVBjd1hm?=
 =?utf-8?B?d0cxNVVqZ2wwSGxlQkRZTVhzV0tsRThSdC9tZlFkeDU4YmRzdFgxcVJUUjhk?=
 =?utf-8?B?cG45enRJNmN1NjRrR2ZPUlBhZGdxdnhvYWFOZUhLSFU5OFBEYUZUSkVra3Nv?=
 =?utf-8?B?Y0xxM01JRm1KemNNKzBUa3M4L3ladlpBMTBCY2xRL0U2SHAxTjJQWWtwTE9a?=
 =?utf-8?B?aFcxWE1wcWRDL1lucWhtVWNIaVZQa1dYSFJyRzdDc29TdTZqaGZscTFqRXNK?=
 =?utf-8?Q?YMEhLkfaB0Up5Q2g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A428DABE310A144A0E4A2916A1C5DA8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4801592c-c748-4d56-75ca-08df34cf9af9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 08:43:57.2145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9b8WXePssCdB0jNgDOCt2e4DoDHWHcI1oYSy5VfuFYqCc/Vb2pDxg3mgdgug3joNc3GuSY8T3j19CabRTMUAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10447
X-purgate-ID: tlsNG-720697/1793177041-666B72AC-A031AB95/0/0
X-purgate-type: clean
X-purgate-size: 1872
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjcvMjYgMTI6MjEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4xMC4yMDI2
IDEwOjM5LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDEwLzI2LzI2IDI6MzQgUE0sIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI2LjEwLjIwMjYgMTM6MjcsIE15a3l0YSBQb3R1cmFp
IHdyb3RlOg0KPj4+PiBUaGlzIGlzIHByZXBhcmF0b3J5IHdvcmsgdG8gbWFrZSB2UENJIE1TSS1Y
IGZ1bmN0aW9uYWwgb24gQXJtLiBTcGxpdCB0aGUNCj4+Pj4gdlBDSSBNU0ktWCBjb2RlIHNvIHRo
YXQgaW50ZXJjZXB0aW5nIHRoZSBNU0ktWCB0YWJsZSBhbmQgUEJBIHN0YXlzIHg4Ng0KPj4+PiBv
bmx5LA0KPj4+DQo+Pj4gVGhpcyBsaWtlbHkgaXMgcmVsYXRlZCB0byBwZWN1bGlhcml0aWVzIG9m
IEFybSdzIGludGVycnVwdCBoYW5kbGluZywgeWV0DQo+Pj4gb24gdGhlIHN1cmZhY2UgSSBjYW4n
dCBzZWUgd2h5IG5vdCBpbnRlcmNlcHRpbmcgTVNJLVggdGFibGUgYWNjZXNzZXMNCj4+PiB3b3Vs
ZCBiZSBzYWZlLiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBleHRlbmQgYmFja2dyb3VuZCBoZXJl
IGEgbGl0dGxlPw0KPj4NCj4+IE9uIEFybSBtb3N0IG9mIHRoZSB3b3JrIGlzIGRvbmUgYnkgdGhl
IElUUywgc28gdGhlIG9ubHkgdGhpbmcgdGhlIGRldmljZQ0KPj4gbmVlZHMgdG8gd3JpdGUgdG8g
dGhlIGRvb3JiZWxsIHJlZ2lzdGVyIGlzIHRoZSBFdmVudElELiBJbnRlcnJ1cHQNCj4+IHRyYW5z
bGF0aW9uIGlzIGZ1bGx5IGNvbmZpZ3VyZWQgaW4gdGhlIElUUzsgaXQgd2lsbCByZWplY3QgaW52
YWxpZA0KPj4gRXZlbnRJRHMgYW5kIGFsc28gaGFzIGEgc2lkZWJhbmQgRGV2aWNlSUQsIHNvIG1p
c2NvbmZpZ3VyZWQgZGV2aWNlcw0KPj4gY2Fubm90IHRyaWdnZXIgZWFjaCBvdGhlcidzIGludGVy
cnVwdHMuIE1lbW9yeS13aXNlIGV2ZXJ5dGhpbmcgaXMgZ2F0ZWQNCj4+IGJ5IHRoZSBJT01NVSwg
c28gYSB3cm9uZyBkb29yYmVsbCBhZGRyZXNzIHdvdWxkIG5vdCBwb3NlIGFueSByaXNrIGVpdGhl
ci4NCj4gDQo+IEFuZCBhIGd1ZXN0IGZpZGRsaW5nIHdpdGggdGhlIG1hc2sgYml0cyBiZWhpbmQg
WGVuJ3MgYmFjayBpc24ndCBhIHByb2JsZW0NCj4gZWl0aGVyPw0KPiANCj4gSmFuDQoNCk5vLiBN
YXNraW5nL3VubWFza2luZyBhbiBpbnRlcnJ1cHQgdGhlIGd1ZXN0IGhhcyBhbHJlYWR5IG1hcHBl
ZCBpcyBqdXN0IA0KdGhlIGd1ZXN0IGRvaW5nIGl0cyBvd24gY29uZmlndXJhdGlvbi4gVW5tYXNr
aW5nIGFuIHVubWFwcGVkIGludGVycnVwdCANCndpbGwgcmVzdWx0IGluIGl0IGJlaW5nIGRpc2Nh
cmRlZCBieSB0aGUgSVRTLiBTbyBJIGRvbid0IHNlZSBhIHByb2JsZW0gDQpoZXJlIGVpdGhlci4=

