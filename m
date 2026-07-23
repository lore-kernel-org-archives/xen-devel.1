Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6A5C531CC
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 23:59:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369744.1618300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn3K1-00019F-4D; Thu, 23 Jul 2026 23:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369744.1618300; Thu, 23 Jul 2026 23:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn3K1-000198-18; Thu, 23 Jul 2026 23:59:25 +0000
Received: by outflank-mailman (input) for mailman id 1369744;
 Thu, 23 Jul 2026 23:59:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wn3Jz-000192-6p
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 23:59:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn3Jy-00H4h7-9i
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 01:59:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a62a9d5-bab6-0a2a0a5309dd-0a2a4502dd36-14
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:59:20 +0200
Received: from [52.101.125.140]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a62aad5-6ca4-0a2a45020019-34657d8c8971-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:59:19 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB5663.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 23:59:14 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 23:59:14 +0000
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
 b=d2zj00JxiSnkIe6YxPhbaj73QVIp8XqaMqzYI+d46gIOlzA2q5ZzdSnAW/jpCG1YLdiXVvM+UZWpe/T4WcgK3O70tn/H2gugj+8Ywdlrv6T/n/x4We4UutRK87gNokbDAHbqRpci4lNoDg76vuYPWzS6o4CgLr5wigJ3vgm+fl7Ev9zFJcvbb5FFfDMKMphyloEO9CBRI0+cjmWa9YOAqombSRE5Sc4BLnzS+wVs+GDrCwarjJPGZdEh3ZlOc5GbdVaPwDRAI451oS+v+oHle8rF4P6DenDuyrTMqXY7Iyz99WJOfRGVaWbup9TaszQtZnJrgR7StJ1H2GW+jCzQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13dEvq/ewY/xexku2x0QJbrao3fVtokZRbReHLDqpNY=;
 b=SAQpWusMwKLyKdTeRa9qtzPof4rNxhBD1BtCJuf8JKWFewBea6ov2iKxufuJcf5ilQ7AByEA5/9HfZllr3Wx6LDpajYp96N0hNCqalzeP11e3wPxyIV8wGhu+Bxg99wUnFGghtoffB9TXKq51ER9Dq18SlFGb1ir9rc57RYwmMrS7wQG93nehsZt1SnZRGuy2pXACgfnn4u0+4j1zmVqzp6/RzGv4fE0RDEBLh3WuVaNV5Jb2IP5IHMC+OjYl3sKv6oMazqs8FeWZUf21jARqa4McSUEiVt2eFvkbT2BHL5OitlV3FCNq9xiVwS5oP+UXrZ6Na1Lv9ovO511rcPWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13dEvq/ewY/xexku2x0QJbrao3fVtokZRbReHLDqpNY=;
 b=FHTj4dBeoZBnE/WnR8Qz3zNP86rEzIDo3+CJVPNiVhwxgEITppzIawZvy28e/geTmwf4CPFa/IuI4Ho7PHDH/5/BlGNwAAy8LrXs6PSulIeYuNTGzujPs+UAMN0f4i9DQtTsMnGETiZf1xi/3niR5tb/L8ICc3u6QVWJqmXLSSQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v7 1/5] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdGGUCLSiIMXaUSUq2V68Fo2g2DrZ7KGyAgACkGPA=
Date: Thu, 23 Jul 2026 23:59:14 +0000
Message-ID:
 <OS9P286MB7222C0714304BA316DD42A4382C02@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260720162819.308326-1-taka@valinux.co.jp>
 <20260720162819.308326-2-taka@valinux.co.jp>
 <88b09f24-13c6-427b-b7a9-aa631e59420a@suse.com>
In-Reply-To: <88b09f24-13c6-427b-b7a9-aa631e59420a@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB5663:EE_
x-ms-office365-filtering-correlation-id: aacdc449-0891-4497-5995-08dee91665df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|18002099003|22082099003|38070700021|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 H4VoKmpy89gmaIUUqZczVHV4h5vHY57HJhFGhq7Yeexgtws+oeIv4uUgrlYrZ9Uv4497f1QF9sp0Sxpkp8UkXzFSUHfhiyO8xjdkmHrZBzb3t8lnzbiKpVcl0j2adx70GWby0WX/Wf8yN8QZxKEYa7TiBRZx1hlAZBF7pataNexQaNxTb7/OXYGbmk5atlhTeX8k8axjKPPeMCIXNXnQxFT6HJFlg59DaW16TXCUJMkRn+pA2KO9C29U24e+rYJrvJqrEySD9rk0cnUjWqR2RCKuX7JjygzQZOIkfxrPeJUOd/U++fRWttXZbXqz0Tq9brrqpUuGOzVN8p8rHnGkX8hd/RyXpEhwUVk3xttlvhkaIVUmgwMY5+e4DaU+gRjGjy82EVcYFbHr4MJ1UDgXSWylgQlGOOysRnVzX5ueAThnYv1a5ByyJiAYSqoJ3uYOKJH+38XFNRVxc5MYypeZMRyBRZewcmCVRvREgsfpx/dkGYmgpDJ0rEsuhA1UOtHq7IvMylkBVulVGMXK31qWl3dprOYqtpUOxqWPK2Lxg7mNK5L7HqOKx/T2CgteAzv8xNFnY1EhWTiJVrV+mAlL+lE72mBU7yJSB7wf9An7Mv5Hbb+wb+yztgDavxU0NAwBWfqJnz40koj2B6Lu1PmaBjaFJWC2GlVd9ERyAQYonHB78mQBk5emV98J2thwcCuTD8VlHWwVW6b7vOgA4HPJkR31u37dnSiCgtV/7k0wf1s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGlvUi9CM2tEU3M2SzNpemdjR0dkL2JrOFM2aGgydVhleHowUU5nNmRhczR4?=
 =?utf-8?B?V0kySm9Xa1ZGVHQ1VWZVbkRoTGx5Y1FEc0RKSkRhd1hVQ2VaL0cwd3M3S3Yv?=
 =?utf-8?B?L1ErYVIxdm9NWGpZVDJpSXdYMkRMZWJKSVhjV2JNTGNJZjNDWVFIbXpTNTNK?=
 =?utf-8?B?ekNpbmN6dElMSkRXY0FTVDJscHcvdk42dnJvdE02bzliRk44NWpBcHFWaDA1?=
 =?utf-8?B?bTN5M1pITkJlZkdnQ1BTY3dONGxWbkJnWEJQOVpwMVpUL28rYm51MTI3b1B5?=
 =?utf-8?B?dmo3V0VpN1ArbmhlbUQ5SnRlZ1dVYlFhTm9pazlWdGxUWUhKSzlib1VKcWFq?=
 =?utf-8?B?RmV3dmpPRCsxTy9UTnN6ejlZTmRQZ3IxcUVMek5pUGZjSVN5bWF3bXRYSDJi?=
 =?utf-8?B?c092RTNZcUY5MGI5QXNrMjVyTDhNcElJRWszc3lXQkRydnNTV0ZNT1Q0ODl5?=
 =?utf-8?B?ZkJZQU5XN0kyZmh0bjIyK2J5VUNOcTZIS2JPYkhBdzRvZzlJR05ZSFY2OXBh?=
 =?utf-8?B?YU55cHlhdXZJbmJqbmFRR3hjZmd5YjNKMTZDYmpFSmg2T1pjOHQ3WTN4Q0g1?=
 =?utf-8?B?azNSWDlYSThZZW1Nb1RTTHhpc2duR3BLaHNlYUxNZTdqU0VuaGltVkRJK0tV?=
 =?utf-8?B?UTN5cGlyZUdEb1dPV0xYS2NwdkhsYmRmbGxCT3RaTU84eDlzcXQvbTdZa0Ft?=
 =?utf-8?B?QVNvZWxFdUJGTEgzREJYZGdIRXR5SnRTTGp4YnhUKzRkUXEwcW1OZWZtdGdX?=
 =?utf-8?B?Z3pIQnEySmtLZndNejFHNXJPajB2OWx5b3dRbUF4cTNuZFJaN3pmdE1kK05M?=
 =?utf-8?B?SEV5NkhIQU9GdjU1NEs4ZTVhVE03ZGlVWWx6QzFLd1BaSER3L2ZEYVBjbm8y?=
 =?utf-8?B?NjMvNklEYW5CeVJNZG02L1BjMFNxMlQ2WWZHckhiUWt0N25OcGZXQTlJbEd1?=
 =?utf-8?B?UExwdHZvYU9JbGFaRmlUZ0ZZTFh5UWh5MTJoeFljdmNIM29yb25TaGlYNDZK?=
 =?utf-8?B?U3ppSng2VWZVcjhHNll1SU55allRWVIrWHg0ZW1GeVNBOUMrTWdOcmxaRkI0?=
 =?utf-8?B?U050eHVtVC91RzhNR3lhVG41cmptK0F4TGtGV0RYMVpvajBvQW9RcWYrVGFz?=
 =?utf-8?B?VTJRRksrL2VRVFBFKzdiNHFMbDN3QUQ4clczYUR4Q3EwcU0yN05UZUppc2ZU?=
 =?utf-8?B?U3RjRHU3cWtvOS9GbG92VExiRTEzY2hVbEpJWXBRcDk4RUtJQ2FSeEYrUWhP?=
 =?utf-8?B?RGhOYkJDWjFUMVJZOU0wYVRETDVJZ2lLUnhYcjdWNWlYUHk0Z0RFWEVDYkZo?=
 =?utf-8?B?MkErMzFSY3RxWXc2UXBlWUp2dDkzK0NSUXRsVHIrdEt5NjU4ejU1dm4vZDlo?=
 =?utf-8?B?OEliZ3lDdUhmNk9MRFJhckJmK01IV1FVdlFYQVR3Qyt6dSs2R1BKLzRzdjJZ?=
 =?utf-8?B?U29xN1crVUpZclpFaHk5V1VRVDhFb29RK0VveUhSdVBaNlY1WVN0VVVjVWVD?=
 =?utf-8?B?eUU4RmNuL2ZiZjlrUSs3elhKNEpJVXpUK090NitPNzVSVklWbEhjQ2hkci9Z?=
 =?utf-8?B?S1JNOUdERm5MZW1KY2NXZWprUUFWRzJtM25VVVBoYWVCalFPMlNHK1VGS25L?=
 =?utf-8?B?RU1xVS9Kei9laFhGRFluakN6SHY2ekk5amJ6MHBZRE9ERHhaN0FkbUhCcGxX?=
 =?utf-8?B?Mk1ZTW0reW1aS0oxWDVjTHNMNUp6dWlxTFJGQ2lEbFc1b1J0NUsxMm5rblE3?=
 =?utf-8?B?RFFCNkFZZUhtYXYraHhpdjAyaFVKYWRyK1hWMHlLdUdvUTkrRk04d1V5a242?=
 =?utf-8?B?VU5vOWF3anJXb2lhKzdsVDlaZjJSYU13WGEwV2N1dTBQZG5KUzlVYWtxMnk3?=
 =?utf-8?B?dEZXSWdzQ1RsSHpQNUZNVzkrejFUMW1VM0p6bmFtaFRnanZydFRhZ2IwYUlO?=
 =?utf-8?B?c3M3Q1BWK3MzdjVtbUloQ2dtODBiVnBiTDk3Wlc3M2svUDlsRm9nbEFIdi82?=
 =?utf-8?B?RFFXVHgrMXIrVHZpN0VwbHVXU0tvL1FnaUFjRXJVeUtjR0U3Y1lXUjB2VTFh?=
 =?utf-8?B?TG1tS0NGZHV2M3NYdDZjSGgwcjZIalJPWlNkcm14K1NNTEVrNFNvZW9SbG43?=
 =?utf-8?B?WTlTcXlFazNnN1FENlJ5MXR1eTZHSlRHL1BMNDlJYzBtOVk0U0JrRW43V01m?=
 =?utf-8?B?RHF0SHZOZGtZNmlJNkxSKzM4OUdtWXVES211NlJ6dFNqczdESzZxWUhuYll2?=
 =?utf-8?B?RUljWEp3RXgyaGdsMnI3N1dTMmVyMG1lR3F5dkVIbmxqd05TTi91SWpGQjVY?=
 =?utf-8?Q?vXJ/i8d+paV+rbeDDE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aacdc449-0891-4497-5995-08dee91665df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 23:59:14.0244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CwYdD2JMpGps0l/tAfU6iNH7uFw3sKct3CMDqwZZjSxJOYF+SUAl5wB63ONvIzJgLg+3twdAf0ZEc4NKzI6pjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5663
X-purgate-ID: tlsNG-720697/1784851160-F32B12AC-00685305/0/0
X-purgate-type: clean
X-purgate-size: 1946

SGkgSmFuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXdpbmcuDQoNCj4gPiArICAgIGZvciAo
IGNwdSA9IDA7IGNwdSA8IG5yX2NwdV9pZHM7IGNwdSsrICkNCj4gPiArICAgIHsNCj4gPiArICAg
ICAgICBpZiAoICF6YWxsb2NfY3B1bWFza192YXIoJmNwdV90b3BvbG9neVtjcHVdLnRocmVhZF9z
aWJsaW5nKQ0KPiA+ICsgICAgICAgICAgICAgfHwgIXphbGxvY19jcHVtYXNrX3ZhcigmY3B1X3Rv
cG9sb2d5W2NwdV0uY29yZV9zaWJsaW5nKQ0KPiA+ICsgICAgICAgICAgICAgfHwgIXphbGxvY19j
cHVtYXNrX3ZhcigmY3B1X3RvcG9sb2d5W2NwdV0uY2x1c3Rlcl9zaWJsaW5nKSApDQo+IA0KPiBJ
biB2NiB0aGUgfHwgaGVyZSB3ZXJlIGNvcnJlY3RseSBwbGFjZWQuIFdoeSBkaWQgdGhleSBtb3Zl
Pw0KDQpJIHNhdyBvdGhlciBjb2RlIHVzaW5nIGxlYWRpbmcgfHwgYW5kIHRyaWVkIHRvIG1hdGNo
IHRoYXQsIGJ1dCBJJ2xsIHJldmVydCBpdCBiYWNrLg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9j
cHUuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vY3B1LmMNCj4gPiBAQCAtNDYsNiArNDYsMTAgQEAg
Y29uc3QgdW5zaWduZWQgbG9uZw0KPiBjcHVfYml0X2JpdG1hcFtCSVRTX1BFUl9MT05HKzFdW0JJ
VFNfVE9fTE9OR1MoTlJfQ1BVUyldID0gew0KPiA+ICAjdW5kZWYgTUFTS19ERUNMQVJFXzINCj4g
PiAgI3VuZGVmIE1BU0tfREVDTEFSRV8xDQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19HRU5FUklD
X0NQVV9UT1BPTE9HWQ0KPiA+ICtzdHJ1Y3QgY3B1X3RvcG9sb2d5ICpfX3JvX2FmdGVyX2luaXQg
Y3B1X3RvcG9sb2d5Ow0KPiA+ICsjZW5kaWYgLyogQ09ORklHX0dFTkVSSUNfQ1BVX1RPUE9MT0dZ
ICovDQo+IA0KPiBMb29rcyBsaWtlIHlvdSBhbHNvIG5lZWQgdG8gaW5jbHVkZSB4ZW4vY3B1LXRv
cG9sb2d5LmggaGVyZS4gSSBjYW4ndCBzZWUNCj4gaXQgYmVpbmcgaW5jbHVkZWQgaW1wbGljaXRs
eS4NCg0KT2theSwNCiANCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9hY3BpL0tjb25maWcNCj4gPiAr
KysgYi94ZW4vZHJpdmVycy9hY3BpL0tjb25maWcNCj4gPiBAQCAtMiw2ICsyLDkgQEANCj4gPiAg
Y29uZmlnIEFDUEkNCj4gPiAgCWJvb2wNCj4gPg0KPiA+ICtjb25maWcgQUNQSV9DUFVfVE9QT0xP
R1kNCj4gPiArCWJvb2wNCj4gPiArDQo+ID4gIGNvbmZpZyBBQ1BJX0xFR0FDWV9UQUJMRVNfTE9P
S1VQDQo+ID4gIAlib29sDQo+ID4NCj4gDQo+IERpZCB5b3UgZm9yZ2V0IHRvIHVuZG8gdGhpcyBj
aGFuZ2U/DQoNCk9vcHMsIEkgd2lsbCByZW1vdmUgaXQuDQoNCj4gV2l0aCBhbGwgdGhyZWUgYWRq
dXN0bWVudHM6DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
ICMgY29tbW9uLCBhY3BpDQoNClRoYW5rIHlvdSwNCkhpcm9rYXp1IFRha2FoYXNoaS4NCg==

