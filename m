Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABEBC4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 13:59:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366573.1616506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloWA-0000jo-SD; Mon, 20 Jul 2026 13:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366573.1616506; Mon, 20 Jul 2026 13:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloWA-0000jh-P2; Mon, 20 Jul 2026 13:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1366573;
 Mon, 20 Jul 2026 13:58:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wloW8-0000jZ-Gr
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 13:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wloW7-006rcI-88
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:58:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e2977-bab6-0a2a0a5309dd-0a2a4501ba9a-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 15:58:46 +0200
Received: from [52.101.125.86]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e2993-5984-0a2a45010019-34657d561bf2-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 15:58:45 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB3628.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:39d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 13:58:40 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 13:58:40 +0000
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
 b=NV19UG1HN/wyso/4gmKi8fttUh+ZHKttaJ1qfJNe+sH0y18IVbzXEVyxHJwd/QXJjRQyrZbTnh+qscw2IKJ9r/gtherLQ9FYaiU+GdVaYU6SLXfjqNSUQvRCoeEG0lFuOUreH+ufPhPuJUBMDK7fEipqC4tPF8SgZeHcTF8+eiE5HJ/diqc9kyQG/mEowQ9LnRPsAmAAZgd+04SzFdURF/9jVkfx14JQLMEHgzDkpYBR86Fg3jtK/eFRDTDIPXnla+uhFgKa78EQH9B6JkqH8YYr2uI4T7TeS5kCAPKkEA27HmvT/LdFYrsRnWjHddFo+UEJqjr6jvnzrNyWyJLrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSYn3GTdMh9uIo67hUNajliknLF5kASQdRj+mh5V/QQ=;
 b=sGvglbrkq/Mr9YNyschz9kwH+8PdIM0Xh9HtUGtVJgZyicIAOsv6xU5nQjBssZO1s46eDnAdu1eBug+9099TFd/6hopkh1wyk/GM7+k81iz/dSGA2OQ0d/HIAcKLwKIu8/3gvfgENs8o7g95xA8etMKhu9nJhAunfjFnCcX0p+//KHaskhWhpiRY2GBsuRgw6Sv0jmpn9yiBJP8QeZU9VkKjK7Gxa/KxzSlP5smQqsRUGXRBRMy4ieJpCIbLMoKl3NSkJKmhFK/cNRvlGZCm1YF0TaulEvgSE1ff/49CmUywYSaKo0wyvRY+AY9GAWBCbetCSJozvy+mAfericyJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSYn3GTdMh9uIo67hUNajliknLF5kASQdRj+mh5V/QQ=;
 b=jG4jKZAkpYMeLebHFqKq8sdmQnhGP3gxqvw6sz8ZHmJmaUCz1MhGnHiGMCyJSsEJDXboKPLLZeNoZQ2Z3RMK0YOPGCJ7RMD8IuJmuSX4wHghabkCFSoyWlnYnjXJxBj2c6sJIJI/WphRhC5qQhpBnd2yKZWymVA2Ab5FI00oZ/Q=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v6 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdE33lRSerj/u3kU6sfibELhxcvrZwJ2MAgAPosBCAAmbKUA==
Date: Mon, 20 Jul 2026 13:58:40 +0000
Message-ID:
 <OS9P286MB7222F9243B20CFE5FE145A9182C32@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-2-taka@valinux.co.jp>
 <f2f3572c-6a77-4f65-bf8e-82298d145a6e@suse.com>
 <OS9P286MB722280A3A0E6E36B8194501B82C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To:
 <OS9P286MB722280A3A0E6E36B8194501B82C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYTP286MB3628:EE_
x-ms-office365-filtering-correlation-id: 9301d547-48c7-4a2d-f0aa-08dee6670104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|38070700021|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 GwbHJPt3kwHsEzLe2ut43ZuWMQ0M7CdlknUmDrAWnisIT0w1qOKsotm8pUEMcqZXytkCB4fJFpGwe1LPf9J3ZiCZEXrm2exfhq8qL/MSrUkPFg2dLiRUIZVm84DIdXEARMnHZcuHoSKgLV+woc+orFjNOLQ8vy9PKgaOZSyW5PEkdlGeE0SKgdjZBCNdkKWK6b4np+VAJmSJYZJKQEF8TmOdXAfmklTuWM/o+qGpTLcuWXe0Z45Mw/9f1PQFnLq8YDIe1YxT1SNiU/3/juRhnxxNAcujvRD6DcnmGSanlKPJTvCcy/vq826d8/6sVCUSGAX/JiiJeNW6DR6jq0TLF5QANAmo5QtR8RLeWP0M4vA/gW155qZ5Cgi56TTy9xS4nsWpzyJswy2Rtsw6ujYOJVtsiEsiFLqxS9v+rWgpaJVYq/RafMq6NRH8misfexAkUJ6GsTSchQnErB+BbahnkG4tVu3lLgUekWTJrxvDhWZl2FAb7QiFojAXdYmul9mDiu/j2we7xb/+05g4k/bWd3DLW6l1nGHO2y8NWyi+UOZcrRwb8vpVRzyuCyA5qAyxA4qqJcGNqNgcY4ibTCiak3KSCF8Jv4Wp8d++MjCtmKgL+3300EEuf13zUk/Q930ozCd51nt3OuZe9cD45cqJbuHdfPL0YMez/ieKoxni5HkgJBvhSgFo7kaMIANm+g+Ha1w3rUFvFSD9GU9d+Aq7laekaeKhapJ+EQRPChxdZ4A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2k2dXU1Smo3SmVkbWRVZTBadmdva2N4MHN2Z1dsVkc1ajh5SWhvcko3MVJZ?=
 =?utf-8?B?cFNkbEF6MzEvWHlUTjFOWSttWU9qSHNZVjZmUG9pbVZxQU02Sjk3aEluL1cr?=
 =?utf-8?B?Q00wcmVDSEJRUkw1VFkya0R1U1IrU0RDaHVkTzNrbWhrN29FK0hPcjhzc2JY?=
 =?utf-8?B?L0ZTZHlCZDJBK3dBcHIrOGVXRi9DVjRWa2ZjNkd4Q0MwSVVDVzdFSnQrY3Mz?=
 =?utf-8?B?cG55Tzh5YmU1RmR3Y3Q0bHc3V0VZZWJCMEN1ZlBPNzVFN1YzOHY4T2RCd2Q2?=
 =?utf-8?B?dGZ2ek94bWFBTDJLY0FXNXloRWkxcW56alRUMGdjR0NmTUJzZWlLdkU5OXE3?=
 =?utf-8?B?QnBqemZiY1ZZS3JNcVJQeXBxUk80NFc1Z3JOVE0rTDJKRHgyNXE0N21yVDJj?=
 =?utf-8?B?dUZkNmNINkRxaGtKNlo1ZlA0ajBJUnJPQnU0NnVCYzRSeDE1Ylc1cmZiNkFv?=
 =?utf-8?B?aCsveFNtYVU3UVRiZm5uVGFJNW9ocFFnNXoySVNUTTZIdkI1a3loU05Mazd5?=
 =?utf-8?B?LytOWmMySlZhZWMxaXJBY08rek9RdWI0V0RPbk5YZUJmRkR1S2NqZVNQbzU5?=
 =?utf-8?B?NFlMdVZXNk56UkZTTEpRWmhuYTIrN3JacVhpdzZCaXE0OXUrRWlqcW5sTDdx?=
 =?utf-8?B?cWJwa1QrbW0vQUJmckd5aEp0U1BHM3JBWld5d2tWZG5wZjRBTU9jbVJpbGJ1?=
 =?utf-8?B?MHRJQlVWMndxTHhXTFlwdmQ2VlpKSXQrNXVTV2I2MlNQeFBlTlNvUUxQM1c1?=
 =?utf-8?B?bmFJcmNPbkJvVklBd2d3RTVIQVZHUzFubFFCWFFMOUNDU2NWRlNJV0ZzeUx5?=
 =?utf-8?B?ZU9uaDhabW50anlSeDVTaUZiQ3JqQ3d5bFR0blpEZEZ1dnVzaE9jSE1TZllJ?=
 =?utf-8?B?YXlEL2lwUGpCaXVTTUlxL3kzSHA4VkNxcitoSDU5Y1RjQXJyOVhFZkM5MVJx?=
 =?utf-8?B?MXFkRDFXN3R0Tk9zdWJSd2s5QTdVMStBZ1RWc3dMalFjZGJBTllJdndYUC9N?=
 =?utf-8?B?T3hDWDZFb1VSbnh6a25mcG1FaUhXTzlBcDQ4aHBmdkh2cFFaakE5ZzRVWVRm?=
 =?utf-8?B?TWp3TmtkYlhvZ3VRTkxsS285OWFENE9sNWoyREFvVzVtQ1B2WFY4THdia0JT?=
 =?utf-8?B?WWJ2TTNvQklMZ2pQUXpLbkErSXZhRGR6cnJ6M1BTOWI5RU13eGtaR1NYTVov?=
 =?utf-8?B?d3dOL0hreUJ1WGNia1l1VEhHME9ENzZ2b3k2bkpzRmxoSEVRS2ZicFR2RVA1?=
 =?utf-8?B?TGpmRHgwK2lHSGJkZlkzT2lDV09lUDVObld5YTI0ZVFQdHdMV0Evck9VNmtk?=
 =?utf-8?B?Tktna3VPMVFjQ1VrTFVqQldrWDZQV0N6WnhabHk2U1drVTBWZzF5cTZQYlZ1?=
 =?utf-8?B?ZUJFdCtYSHVqNExncW5LU0tGRGlISXFCV2N3VzZTNUhYTTJLZVJNMEpaT1Zo?=
 =?utf-8?B?ejlWcktxZGJmbkduQVhrYXBoY2Q2UUVrRHo3QWNaQ2JqZ1JzVVdHVGh5d2ph?=
 =?utf-8?B?Q2U5S2RJdlZQcEFqQlI5TjFVeG9yMVVpZkxMVC9JZXUzUGQ0cThRUjdWaWNU?=
 =?utf-8?B?cnNTbld0UmMyanBmVFc1MEhlbFZPYkY0MWtSR3I3eGtDdlZLaFc3cmc3VW9j?=
 =?utf-8?B?MUJpN3dqUk5ibGFuSi91RWRTa2ZWQTVPWEVWWGxVdEZjQXpPWTVnSGJqcmcv?=
 =?utf-8?B?NThxcWYvRUV1SkNPdDExUlJTeXBpS3A1bEVEYWNCTGxCZ1NjZlRHNHN0Zk5P?=
 =?utf-8?B?bmVyVDdFeHFVempqRDVabXlNVEtXSi9kbzVFU0VjU1M4bGFBMXVUQ092ZHpK?=
 =?utf-8?B?bE9rODJwYmZ3MjA2cTVya0RLNVY2alk1R0t0UHUvMWZQa0JyUFNVUXBDbHI0?=
 =?utf-8?B?NE0zWkh3UmFtVjBDckhFK21BeFRrMVFESWowRG0yN0hReUpFMGhpZzNlclVO?=
 =?utf-8?B?VnVuWEp3VUFzeUFsZGd4dm0vQ3pWOG01bnB2a3pnYU1kTWhVTEQ1SmNkbHBZ?=
 =?utf-8?B?YW9LTHRJbE5mNGhobEFFM0RNQnpINmd1T1drc2MyaGJvTjI4Yit0MmV4MFgr?=
 =?utf-8?B?c1c1UDh6WUxYN2FiNXdWbXYwSW5aeXVpZDR4eWkxUllxZVZHMk1UdVBiMXVJ?=
 =?utf-8?B?Q2hMdTkxVVBGWTFoWWJ1N1BQM0hxblM4QTlOc1h1eklFd2xyRTNvMEdFRDJD?=
 =?utf-8?B?TzlKSzZ6aVkrV0V1SEt3UWdJU2VSWUhON0RHeDY0UCtSOVJRbUZMWHRxRlJT?=
 =?utf-8?B?N1YzejBPM2xBdS82S3RNQS8rWi90VGg3ZVR3cEtoSEorYW04WExkMUJnc2lr?=
 =?utf-8?Q?fHfwg+PctPPceNbBxZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9301d547-48c7-4a2d-f0aa-08dee6670104
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 13:58:40.5762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEdoP+v06oTranLKO+QYyaCc0q3AuYNmogW4PLw8tAuz1JoP3lcy2mgzq2RN6U4zM7F16yH+0sxFwO0IWIopkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3628
X-purgate-ID: tlsNG-d62444/1784555926-1DC79757-9AB5C4EF/0/0
X-purgate-type: clean
X-purgate-size: 2160

SGVsbG8sDQoNCkkgc3VzcGVjdCB0aGF0IHdoZW4gQ1BVIGhvdHBsdWcgaXMgaW1wbGVtZW50ZWQs
IGNwdV90b3BvbG9neVtjcHVdLmNvcmVfc2libGluZw0KQW5kIHBlcl9jcHUoY3B1X2NvcmVfbWFz
aywgY3B1KSB3aWxsIGFjdHVhbGx5IGRpdmVyZ2UuDQpjcHVfdG9wb2xvZ3lbY3B1XS5jb3JlX3Np
Ymxpbmcgd2lsbCBpbmNsdWRlIHJlc2VydmVkIENQVXMgdGhhdCBtYXkgYmUgaG90cGx1Z2dlZA0K
aW4gdGhlIGZ1dHVyZSwgd2hlcmVhcyBwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSkgd2ls
bCBvbmx5IHRyYWNrIGN1cnJlbnRseQ0KYWN0aXZlIENQVXMuDQoNCj4gPiA+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+ID4gPiArDQo+ID4gPiArI2lmbmRl
ZiBYRU5fQ1BVX1RPUE9MT0dZX0gNCj4gPiA+ICsjZGVmaW5lIFhFTl9DUFVfVE9QT0xPR1lfSA0K
PiA+ID4gKw0KPiA+ID4gKyNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPg0KPiA+ID4gKw0KPiA+ID4g
KyNpZmRlZiBDT05GSUdfR0VORVJJQ19DUFVfVE9QT0xPR1kNCj4gPiA+ICsNCj4gPiA+ICtzdHJ1
Y3QgY3B1X3RvcG9sb2d5IHsNCj4gPiA+ICsgICAgY3B1bWFza192YXJfdCB0aHJlYWRfc2libGlu
ZzsNCj4gPg0KPiA+IEJ0dywgYXMgdGhpcyBhc3BlY3QgYmVjb21lcyBtb3JlIGFwcGFyZW50IHdo
ZW4gbG9va2luZyBhdCBwYXRjaCAyOiBXaGF0IGlzDQo+IHRoZQ0KPiA+IHJlbGF0aW9uc2hpcCBv
ZiB0aGlzIChpLmUuIGNwdV90b3BvbG9neVtjcHVdLnRocmVhZF9zaWJsaW5nKSB0bw0KPiA+IHBl
cl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KT8gVGhlIHR3byBvdWdodCB0byBiZSBpZGVudGlj
YWwsIGJ1dCBJIGNhbid0DQo+IHNlZQ0KPiA+IHRoaXMgYmVpbmcgZ3VhcmFudGVlZC4gQW5kIGlm
IHRoZXkgd2VyZSBpZGVudGljYWwsIHdoeSB3b3VsZCBib3RoIGJlIG5lZWRlZD8NCj4gPg0KPiA+
ID4gKyAgICBjcHVtYXNrX3Zhcl90IGNvcmVfc2libGluZzsNCj4gPg0KPiA+IFNhbWUgZm9yIHRo
aXMgdnMgdGhlIHBlci1DUFUgY3B1X2NvcmVfbWFzay4NCj4gDQo+IEkgaGF2ZSBjb25zaWRlcmVk
IHRoZSBzYW1lIHRoaW5nIGJlZm9yZS4gSG93ZXZlciwgY29uc2lkZXJpbmcgdGhlIENQVSBob3Rw
bHVnDQo+IHN1cHBvcnQgdGhhdCBNeWt5dGEgUG90dXJhaSBpcyBjdXJyZW50bHkgaW1wbGVtZW50
aW5nLCBpdCBpcyBkaWZmaWN1bHQgdG8gcmVtb3ZlDQo+IHRocmVhZF9zaWJsaW5nIGFuZCBjb3Jl
X3NpYmxpbmcgZnJvbSBzdHJ1Y3QgY3B1X3RvcG9sb2d5LiBXZSBpbnRlbmQgdG8gdXNlDQo+IGNw
dV90b3BvbG9neSB0byBob2xkIGluZm9ybWF0aW9uIGZvciBDUFVzIHRoYXQgaGF2ZW4ndCBiZWVu
IGhvdHBsdWdnZWQgeWV0Lg0KPiANCj4gV2hpbGUgaXQgbWlnaHQgbWFrZSBtb3JlIHNlbnNlIHRv
IHJlbW92ZSB0aGUgcGVyLUNQVSBtYXNrcyBpbnN0ZWFkLA0KPiBJIGhlc2l0YXRlZCB0byBkbyBz
byBiZWNhdXNlIHRoZSBpbXBhY3Qgb24geDg2IFhlbiB3b3VsZCBiZSBxdWl0ZSBsYXJnZS4NCj4g
DQo+IFRoYW5rIHlvdSwNCj4gSGlyb2thenUgVGFrYWhhc2hpLg0K

