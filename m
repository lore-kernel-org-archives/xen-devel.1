Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1FA606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 05:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=PaM4XOaf
Received: from list by lists.xenproject.org with outflank-mailman.1458936.1671006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7mY-0000Bc-7e; Fri, 23 Oct 2026 05:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458936.1671006; Fri, 23 Oct 2026 05:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7mY-0000BV-4O; Fri, 23 Oct 2026 05:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1458936;
 Fri, 23 Oct 2026 05:25:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xK7mV-0000BP-Qq
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 05:25:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7mU-006x6O-MS
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 07:25:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6adaefb8-bab6-0a2a0a5309dd-0a2a450cba5a-46
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 07:25:30 +0200
Received: from [52.101.125.96]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6adaefc7-f479-0a2a450c0019-34657d60cab1-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 07:25:29 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3230.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 05:25:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 05:25:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHlyzNtgnQJmsIJGgNPnHkb11MzfM6KenXOELPuMhDNAWEOwjF0fY4ieLOUGd0RNi5Xqe7ISoBO3jmM7mJi/8y/dL1X2UGa6K5q60CddlGXXrk/2mEJc2yMIneQ8khC9fm8gzD7flSOWJE05azPvxIYfGDgByk+PkP6S6YU2KkJTs7KLu+qTASFTc4bN64Mm8pl16Fq0XwB1gi8Ia0H7L0q1B491dqLyDm3wZe967w6MAQSa5luvHvI7KYoCHDheFmPZo03EWTyTVpzVGQYxzn83GrT1ZvIfPI985hJokR1+UTY38a004SsRH3+myr5M/jZkzEdvISdbqGGrHWMGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICqv5QkNvvUXkN0vbU1X7eA7aanhGm/joJd7RjGdd1s=;
 b=hIFRWmkXeu6GIaduSJwUdCW7x6icByJyXDRkfiNmkn0zjmeDMBylG5mHBeZhj/+HfQ+vKmcYRJ3vd4k0t7GUl4BFlRYnCrEBjZK6qoYPBxaxuk6ObOGDc96EsWne6elBgFX3XXWWBG8BVmZR/tnH7OAvvD0KgEOem7brPP/fC9EDk7uPtM5kAyAHXxRxtVI5/imo02mb9lqnHU7rSimgdIFzjK6l1/5BPww6zCl5bsb49rF2XRu67bv6BleYpzANuSzA4oEQAym6eEgKXFkaQpr/ZB5s3X0lNWV3JnkGMReYQzKJelNTCH74gvZsu5uM+9fZUIVy2biUOvyAqSOTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICqv5QkNvvUXkN0vbU1X7eA7aanhGm/joJd7RjGdd1s=;
 b=PaM4XOafe70iaeRLHOnz1IgxuDWuAn/8HCI1jn5qfj74ctdYeUvGPlJAnLqrCUZJ1mZl4wKqqhy8jjxp+3VjO4ekRwev1qULC7CyK83khJnYZ1xbyiB/BN0AgFt2kKK/iDen/2NYTwgDUxakm9KHZTgLFPBtI0iqcQiFhPAEYDY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "Mykyta_Poturai@epam.com"
	<Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: RE: [PATCH v12 2/4] xen/sched: Link CPU topology to scheduler
Thread-Topic: [PATCH v12 2/4] xen/sched: Link CPU topology to scheduler
Thread-Index: AQHdX21XXIwRdrvZbEe9C8R0UTfp8LcH/XMAgAKWagA=
Date: Fri, 23 Oct 2026 05:25:24 +0000
Message-ID:
 <OS9P286MB722279F914F32E89CB76058282642@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20261019015749.48492-1-taka@valinux.co.jp>
 <20261019015749.48492-3-taka@valinux.co.jp>
 <0d758d59-1ac3-4833-aae6-8c181d5ec1e8@amd.com>
In-Reply-To: <0d758d59-1ac3-4833-aae6-8c181d5ec1e8@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY1P286MB3230:EE_
x-ms-office365-filtering-correlation-id: 613a841e-f2f1-4a5a-ac59-08df30c60a3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|4143699003|261009223027099003|261022105027099003|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 kRFe7QkSxnjLM+94fJiUx/RMqZWb+xdCaFWhF/mzzROXNFFv3FBQToWN0xomnEndg9KY3tMHU79Ck+KJPK3DUyNlFpoCwmX+aAgUpOF7pnOCdd4+NdS57y+m6RVpWSnSQlCE4CCZAqDJX9Mdqqw/9H0fWbgvUpfniyklbUVmqi67Ljk0U3JAGTokPogkQPBvF+n9ox0IXLXtomb4tsu6XpVCM1iGpp2BO95fTPj2sLt8U8jwKXYULeiIRzPTVl0RXFqvutWX9wk4tuYu5ykJrpIlktIh+Z1++kRt+nJFy0dfZsRHYNejTdKBc0XvwTzD58YfI0T6Jd7BacEmFY3xwy5tNwyyeY/54KzBWn2uAxtT8DA0Ujlv24a4Idyl8wgas3nAaF6R3/SmZeio4IhsoKNgTPgVpbbpXY36VHqpWF7IMSAdvcwA5c1famt+XN7dR+uBRuk6M6lrruD+gGV+TTD1o4gmAR1YcjzdKQHubAtu1oxHUajE6JvOZd7YlTgkKs6+ceopl1pQZOkoG4sveNJ6Uws0O5FSEZMa26E68tIwaSsqWQnGq2HiTAmoDq+xyF7ijVGhTxDvXfgf74oW9li7jdnXAK8bUBzenIBOdyQ55/uPPrkDvu+LkM21b6QQFYHFYmwt/2hgnO5IsWZA1R1+Mw1kAonBB7z6YT40UrGhCvIFA30memdbvk3GzkapLyiyLcYXJRL0iNcXsTB+xN+tmaYp5IlBCYJep4cEB48=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(261009223027099003)(261022105027099003)(10067099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFVvYVZzSERzZnpkU052MmsvaEh0Mll0VzB0SGQ4VExBN1BRMCs4ZEEvdGJ0?=
 =?utf-8?B?VFVRREVyemVtSXcxbm9RbHBlR245SklSRGtqTjU3d3Bqd0hSV0dZZ29uTDJh?=
 =?utf-8?B?SFZqaHBHaGlma1RPa01IbVNab1drWGdGS0phSy9vRFVFYXZFeFBwd0pva05y?=
 =?utf-8?B?SGZUektuZHRoSXMrY1ptVVJ1T2hudmd0c1FWZjNRVlVnWnB0TS8wNnM2bm9k?=
 =?utf-8?B?VVM1VTZFb2pWbU15Y01SZktPbDVVSnZyZXo0OGR1MDdTVFVDTXNlR0FGelpk?=
 =?utf-8?B?aG1adXluZ2hydjZDSlpoZURMSXNDd2lqbUQ3bkg2Q2VVZUNuMGpnL1N1Sm9i?=
 =?utf-8?B?enNPNHkwamxzeS9nalhZbjdnamRwRnZqbmptNFdZNjZIanloUld2U2lwMitq?=
 =?utf-8?B?TE9MdkZxbmpnTzkzYlc5cXhaNElrYmUzTlR3VGdSZDlWOGkvOUhUdEtRMWVD?=
 =?utf-8?B?eWh3K2JOV2E1ZmRoSFRYN3A0dUhUY3YvN1VWTnRORm1PK1c4WjZYUzNNMzg1?=
 =?utf-8?B?M2xNU1pTVHJIYzJ6cVBMY1JUUzRTbkRxUGowN0grS1pCTkdROFhWenUweDR2?=
 =?utf-8?B?eFhRc0txaUNPL25QTHgyUnpxeWZaNmRSdzhiMVRScEM1Y2g1V3M2UVpxZzZO?=
 =?utf-8?B?OTFhZUtwM3ZhTktXTkJ6UDVEN2szc2dtUFMzVmRtanBycHgvVEdnT29POFo0?=
 =?utf-8?B?R0MwWVFVR1ZpUmYrbzdzVG9iRGlMbWVCNkFUZHFxaWRmMlpOdlBLVUE4RGVT?=
 =?utf-8?B?WmpyaDZKcE10cFAwQlh5TDVlUDUxbnlwck9RbUxlb011MjdEcHphdStqV25G?=
 =?utf-8?B?Y0xiUTlNY2FMdkF3VUd3Mzlvb1ZOS2xXWmtnS3piaEdZWkNGSUhldUNMZ0FS?=
 =?utf-8?B?YnlUWEpMNktpWWQ0eXBMWW5wTGlmMWxVOWxHSVQ2OWZpa2tuMjlpRHVxNzhR?=
 =?utf-8?B?MzRVMXNKbVNSbjZJWHpaeWFaSnAyN20yc2w0SE9UMEFNOTBVSS9wQ1lONXZW?=
 =?utf-8?B?N015b2JKbzIwR1I5TzdZbXJxTTV5Tyt4bGFtRHRrekp6dlJrZUtYM01iUVJT?=
 =?utf-8?B?a2IyUFFGK1FHNHFKRWVCS2ZpTDJhSUdrVkhxTFFJaUlSMFNQYVNQWDhTOXUw?=
 =?utf-8?B?RVQzSkUvTmx0eTV3YUtSTk1IRDlmVmhOUDRpbXFnakpBZUhmTisyaGN6WFBC?=
 =?utf-8?B?b254S3Q0L1NtMnpOQU1KdVI3ZFRSN2ZaT3hIdGE4WnJTdkhZaDg5bWhEa1dL?=
 =?utf-8?B?UVBhRCt2QkRYOEN5TVRmQ2I3NHMwWmszS0ZvRytVZlY1cll3aVNuMFpaZzUw?=
 =?utf-8?B?STdoZng5dlpva0s3d2c3eTRvQjUzZlJOdmkxSVlEUFVYNVNaZXdtSUZuRVov?=
 =?utf-8?B?Q3BKSzlxYnE3clFEMEYyY2Z2cXdqRTRuWEhtNk5xUitWblVDZjRZTXJMcUxW?=
 =?utf-8?B?RVNUME9ydFowT0xtcFRwKzF0cStRTTd2NFJsdkV3azNpZEMrWERHZEY2Z3Zs?=
 =?utf-8?B?VzNBQkVGWmVSMlpGaXVDWU5lSEdWM1lmTlFXbTY4bDZGZGVSTitZcU1QU3NH?=
 =?utf-8?B?V0MyNitGL01XaHJicnRZVWw3S3YwRk5nYUZMcldMYTgyNkNMS2cwV0tKTEd4?=
 =?utf-8?B?OWhlT1N0SEdGaHYzSlB5VXBlOXI0cEl3S3YwaHA0VFg1T1dGNWp4Q0xVM1BE?=
 =?utf-8?B?YVFzMS9BZHNMUWUyS09BaGlWc3IzWTlNd0ZmRmRGcDlFeG0zR2kzTG5wdlZL?=
 =?utf-8?B?SFUya1dLUHd0dHE4dDhIZUN1bkxGNyt1MktvY0xCQ09OL2FSZUNLZSsvWEcx?=
 =?utf-8?B?cGN5L1BGdU5NUjdrYUg2Y2xvT3NSenlKNGx4Y2NvVDZpNGlwSGNyU1Z5SkFj?=
 =?utf-8?B?QkQ1WmlOR3drSDJqQjA0eWhZWXBYSW13SThDNEF6WXowZmhIQkhnSFdRRTJJ?=
 =?utf-8?B?RldUTTZ6bjZyMFg4ZlI0SU55dlFWVFpOSHFkSkhyWFFKeGd2eWJMb0lmVEhy?=
 =?utf-8?B?NmhWcGRtUGd0dENmVU14NVgyRUdReTRveTQ0Mno5ZTYrMVkzaU1Wa3VYRUhR?=
 =?utf-8?B?Z2tJalYvdmtDbGNuS29zaFNDcEJzcnhON2p1VTc2WHhDR2tLWEU0ZThuOU1Z?=
 =?utf-8?B?Y2pGUDVmOVhqR2VFK200RERVelBsMStzWFcwWDU0aVpuc01Qbk56M0lUL1Ns?=
 =?utf-8?B?bTMvc3B5TkF4WXlNMnA4SEprVEZ4SGtTME9RQ1dkZ2V6WVBLTFQ2QTZiQXVx?=
 =?utf-8?B?dk1XYWZQa0NYMVNrVnFORXI5djd1MEFxVWRRcTBqYmFUQWRlV0lDNjVORGxS?=
 =?utf-8?Q?of/bZP59uCM7sfXAeF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 613a841e-f2f1-4a5a-ac59-08df30c60a3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:25:24.3389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2bohIwLho4boAjXb7NRQ4uneRbpxP3RaceJkeOhj2SK6zvkMp2jYZf3TmvoXC4SljiB00tEj1B2ogbMwXNnHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3230
X-purgate-ID: tlsNG-d25034/1792733130-02EDAA5B-ED11A0DC/0/0
X-purgate-type: clean
X-purgate-size: 5642
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWljaGFsLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQoNCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiBp
bmRleCBkMzQzOTZmOWIxLi5jZjQ4NThlYjM3IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9zbXBib290LmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+ID4gQEAgLTkz
LDEzICs5Myw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfY3B1X3NpYmxpbmdfbWFwKGludCBjcHUpDQo+
ID4gICAgICAgICAgICF6YWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X2NvcmVfbWFzaywg
Y3B1KSkgKQ0KPiA+ICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+DQo+ID4gLSAgICAvKg0K
PiA+IC0gICAgICogQ3VycmVudGx5IHdlIGFzc3VtZSB0aGVyZSBpcyBubyBtdWx0aXRocmVhZCBh
bmQgTlVNQSwgc28NCj4gPiAtICAgICAqIGEgQ1BVIGlzIGEgc2libGluZyB3aXRoIGl0c2VsZiwg
YW5kIHRoZSBhbGwgcG9zc2libGUgQ1BVcw0KPiA+IC0gICAgICogYXJlIHN1cHBvc2VkIHRvIGJl
bG9uZyB0byB0aGUgc2FtZSBzb2NrZXQgKE5VTUEgbm9kZSkuDQo+ID4gLSAgICAgKi8NCj4gPiAt
ICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsIHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSk7
DQo+ID4gLSAgICBjcHVtYXNrX2NvcHkocGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpLCAmY3B1
X3Bvc3NpYmxlX21hcCk7DQo+ID4gKyAgICBpbml0X2NwdV9zaWJsaW5nX21hcChjcHUpOw0KPiBU
aGUgY29tbWVudCBhYm92ZSB0aGUgY3B1X3NpYmxpbmdfbWFzayBkZWZpbml0aW9uIGlzIG5vdyBz
dGFsZS4NCg0KWWVzLiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIGNvbW1lbnQuDQoNCg0KPiA+ICsg
ICAgZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB1
bnNpZ25lZCBpbnQgZmlyc3RfY3B1Ow0KPiA+ICsgICAgICAgIHN0cnVjdCBjcHVfdG9wb2xvZ3kg
KnRvcG8gPSAmY3B1X3RvcG9sb2d5W2NwdV07DQo+ID4gKw0KPiA+ICsgICAgICAgIGZpcnN0X2Nw
dSA9IGNwdW1hc2tfZmlyc3QodG9wby0+dGhyZWFkX3NpYmxpbmcpOw0KPiA+ICsgICAgICAgIEFT
U0VSVChmaXJzdF9jcHUgPCBucl9jcHVfaWRzKTsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBm
aXJzdF9jcHUgPT0gY3B1ICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHRvcG8t
PnBoeXNfY29yZV9pZCA9IG5leHRfY29yZV9pZDsNCj4gPiArICAgICAgICAgICAgbmV4dF9jb3Jl
X2lkKys7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIGVsc2UNCj4gPiArICAgICAgICB7
DQo+ID4gKyAgICAgICAgICAgIHRvcG8tPnBoeXNfY29yZV9pZCA9IGNwdV90b3BvbG9neVtmaXJz
dF9jcHVdLnBoeXNfY29yZV9pZDsNCj4gPiArICAgICAgICB9DQo+IE5vIGJyYWNlcyBmb3Igc2lu
Z2xlIGxpbmUgc3RhdGVtZW50cy4NCg0KT2theS4NCg0KPiA+ICsNCj4gPiArICAgICAgICBmaXJz
dF9jcHUgPSBjcHVtYXNrX2ZpcnN0KHRvcG8tPmNsdXN0ZXJfc2libGluZyk7DQo+ID4gKyAgICAg
ICAgaWYgKCBmaXJzdF9jcHUgPj0gbnJfY3B1X2lkcyApDQo+ID4gKyAgICAgICAgew0KPiA+ICsg
ICAgICAgICAgICAvKiBDbHVzdGVyaW5nIGlzIG5vdCBzdXBwb3J0ZWQgKi8NCj4gPiArICAgICAg
ICAgICAgdG9wby0+cGh5c19jbHVzdGVyX2lkID0gMDsNCj4gPiArICAgICAgICB9DQo+ID4gKyAg
ICAgICAgZWxzZQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgaWYgKCBmaXJzdF9j
cHUgPT0gY3B1ICkNCj4gPiArICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgdG9w
by0+cGh5c19jbHVzdGVyX2lkID0gbmV4dF9jbHVzdGVyX2lkOw0KPiA+ICsgICAgICAgICAgICAg
ICAgbmV4dF9jbHVzdGVyX2lkKys7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAg
ICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICB0b3BvLT5w
aHlzX2NsdXN0ZXJfaWQgPSBjcHVfdG9wb2xvZ3lbZmlyc3RfY3B1XS5waHlzX2NsdXN0ZXJfaWQ7
DQo+ID4gKyAgICAgICAgICAgIH0NCj4gTm8gYnJhY2VzIGZvciBzaW5nbGUgbGluZSBzdGF0ZW1l
bnRzLg0KDQpPa2F5Lg0KDQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICBmaXJz
dF9jcHUgPSBjcHVtYXNrX2ZpcnN0KHRvcG8tPmNvcmVfc2libGluZyk7DQo+ID4gKyAgICAgICAg
QVNTRVJUKGZpcnN0X2NwdSA8IG5yX2NwdV9pZHMpOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAo
IGZpcnN0X2NwdSA9PSBjcHUgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgdG9w
by0+cGh5c19zb2NrZXRfaWQgPSBuZXh0X3NvY2tldF9pZDsNCj4gPiArICAgICAgICAgICAgbmV4
dF9zb2NrZXRfaWQrKzsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgZWxzZQ0KPiA+ICsg
ICAgICAgIHsNCj4gPiArICAgICAgICAgICAgdG9wby0+cGh5c19zb2NrZXRfaWQgPSBjcHVfdG9w
b2xvZ3lbZmlyc3RfY3B1XS5waHlzX3NvY2tldF9pZDsNCj4gPiArICAgICAgICB9DQo+IE5vIGJy
YWNlcyBmb3Igc2luZ2xlIGxpbmUgc3RhdGVtZW50cy4NCg0KT2theS4NCg0KPiA+ICBzdHJ1Y3Qg
Y3B1X3RvcG9sb2d5IHsNCj4gPiAgICAgIGNwdW1hc2tfdmFyX3QgdGhyZWFkX3NpYmxpbmc7DQo+
ID4gICAgICBjcHVtYXNrX3Zhcl90IGNvcmVfc2libGluZzsNCj4gPiAgICAgIGNwdW1hc2tfdmFy
X3QgY2x1c3Rlcl9zaWJsaW5nOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IHBoeXNfY29yZV9pZDsN
Cj4gPiArICAgIHVuc2lnbmVkIGludCBwaHlzX2NsdXN0ZXJfaWQ7DQo+IHBoeXNfY2x1c3Rlcl9p
ZCBhbmQgY2x1c3Rlcl9zaWJsaW5nIGFyZSBvbmx5IHVzZWQgdG8gY29tcHV0ZSBlYWNoIG90aGVy
LiBBcmUNCj4gdGhleSByZWFsbHkgbmVlZGVkPw0KDQpJIGtlcHQgdGhlbSBiZWNhdXNlIEkgcGxh
biB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIHNwZWNpZnkgImNsdXN0ZXIiIGZvciB0aGUNCmNyZWRp
dDJfcnVucXVldWUgcGFyYW1ldGVyLg0KDQoNCj4gPiArICAgIHVuc2lnbmVkIGludCBwaHlzX3Nv
Y2tldF9pZDsNCj4gPiArICAgIHVuc2lnbmVkIGludCBudW1fc2libGluZ3M7DQo+ID4gIH07DQo+
ID4NCj4gPiAgZXh0ZXJuIHN0cnVjdCBjcHVfdG9wb2xvZ3kgKmNwdV90b3BvbG9neTsNCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpbml0X2NwdV9zaWJsaW5nX21hcCh1bnNpZ25lZCBp
bnQgY3B1KQ0KPiA+ICt7DQo+ID4gKyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0dFTkVSSUNf
Q1BVX1RPUE9MT0dZKSAmJiBjcHVfdG9wb2xvZ3kgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAg
IGNwdW1hc2tfY29weShwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSksDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGNwdV90b3BvbG9neVtjcHVdLnRocmVhZF9zaWJsaW5nKTsNCj4gPiAr
ICAgICAgICBjcHVtYXNrX2NvcHkocGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBjcHVfdG9wb2xvZ3lbY3B1XS5jb3JlX3NpYmxpbmcpOw0KPiBj
cHVfdG9wb2xvZ3lbXSBpcyBidWlsdCBmcm9tIGFsbCBDUFVzLCBzbyBhIENQVSB0aGF0IHRoZW4g
ZmFpbHMgdG8gYm9vdA0KPiBzdGF5cyBpbiBpdHMgc2libGluZ3MgbWFza3MuIEkgdGhpbmsgYSBD
UFUgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZXNlIG1hc2tzIG9ubHkNCj4gb25jZSBpdCBpcyBvbmxp
bmUuDQoNClRoZSBvcmlnaW5hbCBjb2RlIHByaW9yIHRvIHRoaXMgcGF0Y2ggaW5pdGlhbGl6ZWQg
dGhlIENQVSBzaWJsaW5nIG1hcCBpbiB0aGUgQ1BVX1VQX1BSRVBBUkUNCk5vdGlmaWVyIGJlZm9y
ZSBicmluZ2luZyB1cCBhIHNlY29uZGFyeSBjb3JlLiBJIGFncmVlIHRoYXQgaXQgaXMgYXBwcm9w
cmlhdGUgdG8gaW5pdGlhbGl6ZSBpdCBhZnRlcg0KdGhlIGNvcmUgaXMgYWN0dWFsbHkgYnJvdWdo
dCB1cCwgc2ltaWxhciB0byBob3cgeDg2IFhlbiBkb2VzIGl0Lg0KDQpUaGFuayB5b3UsDQpIaXJv
a2F6dSBUYWthaGFzaGkNCg==

