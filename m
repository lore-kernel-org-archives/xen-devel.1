Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FADCC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 14:32:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447955.1663898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdXl-0005Xb-Vh; Tue, 13 Oct 2026 14:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447955.1663898; Tue, 13 Oct 2026 14:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdXl-0005XU-Sp; Tue, 13 Oct 2026 14:31:53 +0000
Received: by outflank-mailman (input) for mailman id 1447955;
 Tue, 13 Oct 2026 14:31:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xGdXk-0005XO-1e
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:31:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGdXj-00A336-AX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:31:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ace40d6-2eae-0a2a0a5409dd-0a2a4507df2e-8
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:31:51 +0200
Received: from [52.101.69.98]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ace40d6-b4ea-0a2a45070019-346545621ffc-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:31:51 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by ZR6PR03MB911381.eurprd03.prod.outlook.com
 (2603:10a6:910:cf::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:31:49 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:31:49 +0000
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
 b=cgx1x790IPBdiAKuOqWzN3noTh0IGfl8x6HEEh74FM5X4WUg3xP7SX6u5gaRt7jM9t9Bx3Iy/BUd9ycKTBi1VdgEHyvcLBeQ0LWpPrLpoYV6IynXdopWhAjavRCyXSIUPZYyfy1qZHsB7CcUINNp3fzuMsWaCsdGpBGRCRerm9I08i1arjktn2hgrOBvepxdtRoAUxqBcXpKwndGFhNG0k5F75v/kVnDOc/OAvdtiVmaYXxRS+cWMVOwiQE3msEwHVz+35/lZe/PNsE/aJ56DFTVbrQTzx/nXS6eJGdEhOFWJylUkDcGNDIuFHMPNxGPhAWPhJDE3Iv8bfGWp/0SFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3Uhm2zvsPCAbaSM0CKwi4QtczOfzsFD9QcZ3PO/kHQ=;
 b=Jc4ShCWlDwyF6/ppK3eiUbIs9HjLhw6XtcBZlpUkO7y/2lIqw7LvGhbQTpBhNXmA75oCjfPLbKNErcnGWTTafLlLrh9YBKQkhiczrs+6UkxYOnhB+iqiWgvWQ2SFAlagHZoXrympiIo0cQ1PXy/FRZkkZPB5lLyH/trYVG7B92A6jHdBd5TxZUK0yhpnTPuDoPxgVaaPQRoQ3EAP9yY/mxvQWO9y8heOyQzKrINxMSsLwURuKouaU6IstoiWpA53+/yc13gQoZ/nARUoAVw6v7JXeoa6NUGxEaIY4NB4b93bmYLACoCMHcJmFvwqg9mGWj1JXuIsRLMojlkmwnqhWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3Uhm2zvsPCAbaSM0CKwi4QtczOfzsFD9QcZ3PO/kHQ=;
 b=rfYrKrRi8Xc5i/NdsbGzAuhO/D5iWExj4gqgKzLVYvv4gHqHI7J+vREiHFdZoS8efV8cRFX9Egg0ZLedNHXPifzwBVyVhQNz/nRJkIbi6oWMeDVmbOtYqJdOycvVy9HjLLsXhHm2ow8amTXKrwD9LYLZ+hemuBahmsHUIxYNWPGWjFMwYmCnjAm1Pe78tXmK6ZM/NjVYnFfKHFlFtVo3b4a4PnDMLzPyQQ+z+E8n8belsYBo0RNXxUhSvxiwdXaOdU8WHxQnJwOAm+TGvm9vuF349yo1Km9Zv18IQwlLKTiNiLdrabcdJTZvvh4TRXlDABnoeLJxwSD/6jmOZEJ/6A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jbeulich <jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
Thread-Topic: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
Thread-Index:
 AQHdT/FUuEZ9j2ZjeEWRZmF5vcrM7rblkEmAgAAVJICAAARVgIAALQ0AgALNOoCABURJgIANtvMA
Date: Tue, 13 Oct 2026 14:31:49 +0000
Message-ID: <5d4ea9f2-6340-4c3d-a8d1-a43171e73bf7@epam.com>
References:
 <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
 <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
 <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
 <e67e84f5f619c38ed8269ebe5464ac6e@bugseng.com>
In-Reply-To: <e67e84f5f619c38ed8269ebe5464ac6e@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|ZR6PR03MB911381:EE_
x-ms-office365-filtering-correlation-id: 801b30e3-905f-4fa0-8a6f-08df2936b7aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|42112799006|1800799024|23010399003|11063799006|4143699003|38070700021|18002099003|22082099003|56012099006|6133799003|261009223027099003|4133799003|3023799007|10067099003;
x-microsoft-antispam-message-info:
 mqzb8uPzYdCCf9gfixImM9gnHaKxaREsT1WHnYJUKMH1p9tI4YoD2YpN7P0TZXn7jPrwTWjWfXVh++8ry0QHip6PI6ScrlsguHZpQJQGRFEpLYcSR+sulMyAOm0+tKWUCQZxXto50xneTPS1XyykEfUWHTpc5K3XLh6mp9G09SHpw15SxzfJ7diT+O5uP8N5oQxq0lVCWfHnFcidMTsDxOyPDs7cPQ38rSTIVn6HGoc3mkxft0iuLNEaHgASVWTkjtdXAxhOIYMt2MmuFkpjuaJesSlo25prlrJOSvkWVYeVnPrAotXypuau9YD2EgAqNvWckQ32gC59O41CTs3ZpKQA0uRQzMFlB+53k5j4iAebslf/HNIj+qeaXzxpzlXPVfP4GtIhSdMaP5WsJn1N4Hd0z9xKTjhBBiRkp7wl3tp8HO+KzIpuE+BEhpQnB45T9H/CgKhHqLExRZLUIEgbuOvwzhrK+wDgm6bl+a6iD1BhP5lxo28bHdlxG57XwUg9dggsTfCug3e+Z/oncaND5iQZpl7VxbSGzeGnK8HySRxdzatNbaJA3JKpusMln2cJR9DeiNcmXSEyPsf2uWQy6PHyLly3KXnDZkDU4Lj0qcGF+qZndYwx+Mva/guoxeR6AvS5oLpk8oqdYsnFL3lEcLPKgQwPrTwQcB+vO54Oo0k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(42112799006)(1800799024)(23010399003)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003)(56012099006)(6133799003)(261009223027099003)(4133799003)(3023799007)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnRqUUgrb1hUTTdGL1BSTTFyZkd4d1hObTJoMnFUdElYdUJReUtjd1drampy?=
 =?utf-8?B?RXBZQy8yUGtGT09ZRGNCOXlmOEhPc1pmSS9qZmJKbm1oTEdFOUxXWmNEWVNq?=
 =?utf-8?B?aUxmTVJvTXVXc3FjMWhpaDBBUzNCQTZTYWg2NGZuanU0N05nMnZWenNIQXBU?=
 =?utf-8?B?eFBpdEo1dVhabGh6UnRaSkFxTmp0YVh5NnltVGg4R2RZY0pFT3ZlTGR2V2Yx?=
 =?utf-8?B?UzIraUN4TDBreHVuV2ZUSDFSZXM2akpmU2Izd3NsTlpkclkvd1BQYVRaSC8w?=
 =?utf-8?B?dnlucm02djR5dzdOcWZNS0FHVExGTExIMi9wd0tXWlNybHAwQ3h1OFhaNDJM?=
 =?utf-8?B?aTlPcXkxdGZxSWZHOGhVQzB4NDRwU2UvTXM2N0s3YmlrN09SQ1htNmNHLzJ6?=
 =?utf-8?B?NXkxVHY5RnVtMHp4dkFYT0RDaVM0VG13VktZWWdVTC9qQU9iRUJKWE1INnY3?=
 =?utf-8?B?eVZ5dlU3UmNMYS9PNWZ3ZTVyaGo1d2J5T2NkMllsd3dVdVZHSHFvejl5d1hR?=
 =?utf-8?B?UFlJeFVMRmozRksyazZIMzQwSXBhaGxVQWtjd1JPdkVFZDZkeDVNbjlhU2c1?=
 =?utf-8?B?Yi9zZlpncnV3YUtIUnRzcytSNHlqOUY1ZWQ1by9mYVFueU9GZERqL25mT0dl?=
 =?utf-8?B?TVRyeUgyVkcrY1ArODJ1WDJLZW9DZm5aQUtrelhHTGdyVXMzOCtMNWYxSXlm?=
 =?utf-8?B?UzQ3NzNvbDBIS1JxN1dYNVBwN2FUbGhYeFR2K1pqQXZERGZZZGJZNGh3cUJN?=
 =?utf-8?B?NVZFdU1oaW1LU3cxM2xndHZ5QmZCM3gyempkVWZJRFAxZWxJdjJTSXBpdlJP?=
 =?utf-8?B?ZEpDQlFyMHV3NlM3S3FGQkx6WXZJN0FOUzFCL1F1bUpYYU42WGFGeWdMVkh2?=
 =?utf-8?B?QzRTRlZvWW0ycUwzY1J4R3BxN3FsUGxIRUV5Zkl3Y2RMN3FBZFJjME5pT01v?=
 =?utf-8?B?MlliZ3hZdURIMU5NUENrSmp0alFPN1lZUDA4YUlpY04xNkkzWkE1Tkk5V3dZ?=
 =?utf-8?B?QWZGU01WVDJSdXdXMW80WkU0cXUvclZPZnlrZlhvb1E2eXphU3FEL2g1NkIw?=
 =?utf-8?B?cUpTSHhPUGh6WkQ1ZWZnUUVKSnlSZ3JiVUhidWNwN08yQWJLRGJtNmp0M1FH?=
 =?utf-8?B?Rmdmd0NxeGdmMXdwRXJmWUtQSUZpdGdDUk5sWWdzdXh4d01SNlhzU01IOEFJ?=
 =?utf-8?B?NGx1NjJEOHg3ZW5xV3dvN3gybDYraGpOMGVYZjBpdHA2ZXQ0TnZybEVnSzVD?=
 =?utf-8?B?STNJTWNoTStYa0x4MXV6ekUwaGpjYlNES2NCVkhRRzdjYWt4L01GN3hzNEwx?=
 =?utf-8?B?WkRyZ0dBTVNFaS8rcmZubVcwb1lGTmpXSDYwdzJDcHBsblFDZ0FhK0FtWGh1?=
 =?utf-8?B?M21TWnlmdTFIQVZPWkloVHlVb3hpbkh1T1BUWVZnTGh6d0FZY1BHVjBaSVZT?=
 =?utf-8?B?aDdUa1BwbDFJME4rMDArYkxlNG5hQ2hNOWlKZzJVbFFvUEZuMzgybVErM0R4?=
 =?utf-8?B?NWxRM0thNGhHS25kbE1kc0RRSkE3amp1MS9uU1RZaXZBZElYOVpkTjIrTFIr?=
 =?utf-8?B?cUdpeTBKWDZNUEZyVnhBeUFPeUZBZHI1WmZDdld3RFdRSm5XVVEzU3c2Vi9v?=
 =?utf-8?B?dTlhMVNCZFA3ZlJaUXlpL21yL1gxa29ncHFVdkN5U2tjWDc1TGYvRGdvRnR5?=
 =?utf-8?B?WFdtQm5oQ013aVpuQmhrWlc0dUQyMEZObUI5ZjhEOHVkSnRsMHJKUXI0c3VN?=
 =?utf-8?B?eW4zcW41eWoyQ3lBSVBSSTk5M2o3VDNjVDYzbit0NnQ0dTRqTjNMenh0Wktu?=
 =?utf-8?B?SHk3cE9jYmJoYXZnaUJvZkJJdmZlREZndVNFZTUyOGdNQzMrS0N3NnBoNlBh?=
 =?utf-8?B?VmVrV0dLT1RYdnhUUkNvaVhYcG1hemY2NUo0ajVTc0JaV3pJaFdSanAwUTZS?=
 =?utf-8?B?Q0gvRWY2OHlkOEZyRkFVNzM0TFQrRDBza0c0SUVoSUozU1lHbUNWck5DaUc0?=
 =?utf-8?B?ODc1NGRkMVIxRGtJaG9JOVByWlhLalpwMWFibGo4em5BZmFCeEwwamh4Kysz?=
 =?utf-8?B?RXZmeGV6T3RmVERJS3lRSGlwVUpWeXYzWk1Ic21uR2VPb2I0bGJueGR1YWdt?=
 =?utf-8?B?dGxSM0ErQXVJYXdSMDlIaWFQRWJuZDFJd2FuSlByeVRlNjRkV1VHVEFJYVli?=
 =?utf-8?B?bmJYTGNEbTZQeExWbytqdFgvNGk1SUhSdEFQM09DTVJ1UHhqaXMwZmNDVWw4?=
 =?utf-8?B?cGE5bWRRaXQ2bGxKYlM3TS94UEtIWXlJc1BkS0FVZTJWdStWemZvNkNBcDNV?=
 =?utf-8?B?ZXVGb0JnM2JMb21IQWlIMnlUakw5ZUJ5M2ZlWGtVVzIvOXJnUmp4dXRjblFa?=
 =?utf-8?Q?5lZ8fp/pWd4TCbls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <610BC2F2C5CB874082808713A41E1EBC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801b30e3-905f-4fa0-8a6f-08df2936b7aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 14:31:49.6209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4BR+CyJnkUfIyjdd1SU+lp4NMiUrtvrO2pShryKrbcLK9PyQ8tA43KS5QN0250VexepiMShmfg9fU+sJTQJrhdr+GDNwyJ+pIxh0c28frk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR03MB911381
X-purgate-ID: tlsNG-ef75cf/1791901911-378D1AE4-9BB82858/0/0
X-purgate-type: clean
X-purgate-size: 5806

DQoNCk9uIDEwLzUvMjYgMDA6MDUsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI2LTEw
LTAxIDE0OjM5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMjkvMDkvMjAyNiA2OjUyIHBt
LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+PiBPbiAyMDI2LTA5LTI5IDE3OjExLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4gT24gMjkuMDkuMjAyNiAxNjo1NiwgTmljb2xhIFZldHJpbmkgd3Jv
dGU6DQo+Pj4+PiBPbiAyMDI2LTA5LTI5IDE1OjQwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
PiBPbiAyOS4wOS4yMDI2IDExOjAzLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4+Pj4+
IGJzZWFyY2goKSwgbWVtY2hyKCksIG1lbWNocl9pbnYoKSwgc3RyY2hyKCksIHN0cnBicmsoKSwg
c3RycmNocigpIA0KPj4+Pj4+PiBhbmQNCj4+Pj4+Pj4gc3Ryc3RyKCkgYWxsIGFjY2VwdCBhIGNv
bnN0IHBvaW50ZXIvb2JqZWN0IGJ1dCByZXR1cm4gYSBub24tY29uc3QNCj4+Pj4+Pj4gcG9pbnRl
cg0KPj4+Pj4+PiB0byB0aGUgbWF0Y2hlZCBlbGVtZW50IG9yIGJ5dGUsIG1hdGNoaW5nIHRoZWly
IHN0YW5kYXJkIEMgbGlicmFyeQ0KPj4+Pj4+PiBpbnRlcmZhY2VzLiBUaGUgY29uc3QgcXVhbGlm
aWVyIGlzIGRlbGliZXJhdGVseSBzdHJpcHBlZCBzbyB0aGF0DQo+Pj4+Pj4+IGNhbGxlcnMNCj4+
Pj4+Pj4gc2VhcmNoaW5nIGEgbm9uLWNvbnN0IG9iamVjdCBnZXQgYmFjayBhIG11dGFibGUgcG9p
bnRlciB0byBpdC4gDQo+Pj4+Pj4+IEZpeGluZw0KPj4+Pj4+PiB0aGlzIHdvdWxkIHJlcXVpcmUg
Y2hhbmdpbmcgdGhlIHB1YmxpYyBBUEksIHNvIGRvY3VtZW50IHRoZXNlIA0KPj4+Pj4+PiB1c2Vz
IGFzDQo+Pj4+Pj4+IGRldmlhdGlvbnMgaW5zdGVhZC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVXBkYXRl
IGRvY3MvbWlzcmEvcnVsZXMucnN0IHRvIG5vdGUgdGhhdCB0aGlzIGNsYXNzIG9mIGRvdWJsZS11
c2UNCj4+Pj4+Pj4gbGlicmFyeSBmdW5jdGlvbnMgaXMgZGV2aWF0ZWQgb24gYSBwZXItZnVuY3Rp
b24gYmFzaXMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3Bj
aHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiBXaGVuIEkg
cHJlcGFyZWQgbXkgMTEuOCBzZXJpZXMgWzFdLCBJIHdhcyB3b25kZXJpbmcgd2hldGhlciB3ZSAN
Cj4+Pj4+PiBuZWVkIHRvDQo+Pj4+Pj4gZ28NCj4+Pj4+PiBhcyBmYXIgYXMgZGV2aWF0aW5nIHRo
ZXNlLiBTaW5jZSB3ZSBub3cgdW5pZm9ybWx5IHRha2UgZ2NjNSBhcyANCj4+Pj4+PiBtaW5pbXVt
DQo+Pj4+Pj4gYmFzZWxpbmUsIHRoZXJlIGlzIChhdCBsZWFzdCBpbiB0aGVvcnkpIHRoZSBvcHRp
b24gb2YgdXNpbmcNCj4+Pj4+PiBfR2VuZXJpYyB0bw0KPj4+Pj4+IGNvdmVyIHRoZSBkdWFsLXVz
ZS4gT25lIHF1ZXN0aW9uIHRoZXJlIGlzIHdoZXRoZXIgRWNsYWlyIHdvdWxkDQo+Pj4+Pj4gcmVj
b2duaXplDQo+Pj4+Pj4gc3VjaCAtIE5pY29sYT8gQWZ0ZXIgYWxsLCBsb29raW5nIGF0IGUuZy4g
Z2xpYmMncyBpbXBsZW1lbnRhdGlvbiwgdGhlDQo+Pj4+Pj4gZnVuY3Rpb25zIHRoZW1zZWx2ZXMg
cmVtYWluICJ1bnNhZmUiIHRoZXJlOyBpdCdzIGEgbWFjcm8gd3JhcHBpbmcgDQo+Pj4+Pj4gdGhl
bQ0KPj4+Pj4+IHdoaWNoIHB1dHMgdGhlIGxvc3QgcXVhbGlmaWVyIGJhY2suDQo+Pj4+Pg0KPj4+
Pj4gQ291bGQgeW91IHByb3ZpZGUgYSBjb25jcmV0ZSBleGFtcGxlPw0KPj4+Pg0KPj4+PiBGcm9t
IGdsaWJjIDIuNDM6DQo+Pj4+DQo+Pj4+ICMgZGVmaW5lIF9fZ2xpYmNfY29uc3RfZ2VuZXJpYyhQ
VFIsIENUWVBFLCBDQUxMKcKgwqDCoCBcDQo+Pj4+IMKgIF9HZW5lcmljICgwID8gKFBUUikgOiAo
dm9pZCAqKSAxLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+PiDCoMKgwqDCoMKgwqDCoCBj
b25zdCB2b2lkICo6IChDVFlQRSkgKENBTEwpLMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4gwqDCoMKg
wqDCoMKgwqAgZGVmYXVsdDogQ0FMTCkNCj4+Pj4NCj4+Pj4gd2hpbGUgdGhlIGRlY2xhcmF0aW9u
cyBzdGlsbCBhcmUgZS5nLg0KPj4+Pg0KPj4+PiBleHRlcm4gdm9pZCAqbWVtY2hyIChjb25zdCB2
b2lkICpfX3MsIGludCBfX2MsIHNpemVfdCBfX24pDQo+Pj4+IMKgwqDCoMKgwqAgX19USFJPVyBf
X2F0dHJpYnV0ZV9wdXJlX18gX19ub25udWxsICgoMSkpOw0KPj4+Pg0KPj4+PiAoYW5kIGhlbmNl
IHRoZSBpbXBsZW1lbnRhdGlvbiBzdGlsbCAtIG5lY2Vzc2FyaWx5IC0gY2FzdHMgYXdheQ0KPj4+
PiBjb25zdC1uZXNzKS4NCj4+Pj4NCj4+Pg0KPj4+IE9rLCB3aWxsIGxvb2sgaW50byB0aGF0DQo+
Pg0KPj4gV2UgYXJlIGdvaW5nIHRvIGhhdmUgdG8gZGV2aWF0ZSB0aGUgaW1wbGVtZW50YXRpb24s
IGV2ZW4gaWYgd2UgYXJlIHVzaW5nDQo+PiBfR2VuZXJpYygpIHRvIGZvcmNlIGNvbnN0LWNvcnJl
Y3QgYmVoYXZpb3VyIGZyb20gdGhlIGNhbGxlcnMuDQo+Pg0KPj4gV2UgY291bGQgZHVwbGljYXRl
IHRoZSBmdW5jdGlvbnMsIGJ1dCB0aGVyZSdzIGEgZGlmZmVyZW50IHJ1bGUgYWJvdXQNCj4+IHRo
YXQuwqAgV2UgY2FuJ3QgdXNlIEVMRiBhbGlhc2luZyB0cmlja3MgYmVjYXVzZSB0aGF0IGJyZWFr
cyBzb2Z0d2FyZQ0KPj4gdHlwZS1oYXNoaW5nIHRlY2huaXF1ZXMgZm9yIGNvbnRyb2wtZmxvdyBp
bnRlZ3JpdHkuDQo+Pg0KPiANCj4gWWVhaC4gVGhlIGludGVybmFsIGNhc3QgaXMgY2xlYXJseSBz
dGlsbCBzaWduYWxlZCBieSBFQ0xBSVIsIHJlZ2FyZGxlc3MgDQo+IG9mIHRoZSBzdXJyb3VuZGlu
ZyBjb250ZXh0LiBUaGF0IGJlaW5nIHNhaWQsIHRoZSB0cmljayBpcyBxdWl0ZSBuaWNlIGFuZCAN
Cj4gaXQgd291bGQgYWN0dWFsbHkgYmUgYSBzdHJvbmdlciBhcmd1bWVudCBmb3IgYSBkZXZpYXRp
b24gaW4gbXkgb3BpbmlvbjogDQo+IGl0IG1pdGlnYXRlcyB0aGUgcmlzayBwb2ludGVkIG91dCBi
eSB0aGUgTUlTUkEgcnVsZSBhdCB0aGUgY2FsbHNpdGVzLiBJdCANCj4gaXMgYWxzbyB0cnVlIHRo
YXQgdGhlIEMyMyBzaWduYXR1cmUgaXMgYSBsb3QgbmljZXIgaW4gdGVybXMgb2YgdHlwaW5nIFsx
XS4NCj4gDQo+IFRoZXJlJ3MgYSBzbGlnaHQgZnJpY3Rpb24gd2l0aCBNSVNSQSBDIFJ1bGUgMjMu
NSAoIkEgZ2VuZXJpYyBzZWxlY3Rpb24gDQo+IHNob3VsZCBub3QgZGVwZW5kIG9uIGltcGxpY2l0
IHBvaW50ZXIgdHlwZSBjb252ZXJzaW9uIikgZnJvbSBNSVNSQSANCj4gQzoyMDEyIEFtZW5kbWVu
dCAzIGZvciB0aGUgbm9uLWNvbnN0IGlucHV0IGNhc2UsIGJlY2F1c2UgdGhlIHR5cGUgb2YgdGhl
IA0KPiBjb250cm9sbGluZyBleHByZXNzaW9uIGNvdWxkIG1hdGNoIGVpdGhlciBhbHRlcm5hdGl2
ZSBkZXBlbmRpbmcgb24gdGhlIA0KPiBjb250ZXh0LCBidXQgdGhhdCdzIG5vdCBhIHN0cm9uZyBj
b25jZXJuIChBZHZpc29yeSBydWxlLCBubyBhc3NvY2lhdGVkIFVCKS4NCj4gDQo+IFsxXSBodHRw
czovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz8gDQo+IHVybD1odHRw
cyUzQSUyRiUyRmVuLmNwcHJlZmVyZW5jZS5jb20lMkZjJTJGc3RyaW5nJTJGYnl0ZSUyRm1lbWNo
ciZkYXRhPTA1JTdDMDIlN0NkbXl0cm9fcHJva29wY2h1azElNDBlcGFtLmNvbSU3QzM0MDJjNzFj
MzRhODQ0ZmRmYWVkMDhkZjIyNWIzZDc3JTdDYjQxYjcyZDA0ZTlmNGMyNjhhNjlmOTQ5ZjM2N2M5
MWQlN0MxJTdDMCU3QzYzOTI2NzQ0NzUzMDc1NjA1MyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1p
SXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9ME5N
MmZ0c2JFZzk4d0djaTd6Yk55eSUyQm9FU3ZQJTJCcWZVNyUyQno1T1FLbk5jYyUzRCZyZXNlcnZl
ZD0wDQo+IA0KDQpDb21iaW5pbmcgYWxsIGNvbW1lbnRzIGFuZCBhbnN3ZXJzIEkgc2VlIHRoZSBu
ZXh0IHN0ZXBzIHRvIHRoaXMgcGF0Y2g6DQoNCi0gZHJvcCBtZW1jaHJfaW52KCkgZnJvbSB0aGUg
ZGV2aWF0aW9uDQotIGFuY2hvciB0aGUgZmlsZSBwYXR0ZXJucyBhcyBeLi4uJHx8Xi4uLiQNCi0g
Z3JvdXAgdGhlIHhlbi9saWIgZmlsZXMgdG9nZXRoZXINCi0gbmFycm93IHRoZSBqdXN0aWZpY2F0
aW9uIHRvIHRoZSBjYXN0cyBpbiB0aGUgZnVuY3Rpb24gYm9kaWVzLg0KDQpBbnkgc3VnZ2VzdGlv
bnM/DQoNCg0KQlIsIERteXRyby4NCg==

