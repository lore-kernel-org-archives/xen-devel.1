Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AECFC44521
	for <xen-devel@archiver.kernel.org>; Sun, 19 Jul 2026 02:15:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365771.1615965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlH3x-0008Rt-QO; Sun, 19 Jul 2026 02:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365771.1615965; Sun, 19 Jul 2026 02:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlH3x-0008Rm-N4; Sun, 19 Jul 2026 02:15:29 +0000
Received: by outflank-mailman (input) for mailman id 1365771;
 Sun, 19 Jul 2026 02:15:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlH3v-0008Rf-4q
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 02:15:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlH3t-00D4nr-VD
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2026 04:15:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5c32c7-2eae-0a2a0a5409dd-0a2a45049e6e-22
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 04:15:25 +0200
Received: from [52.101.125.140]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5c3335-b57f-0a2a45040019-34657d8c61e2-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jul 2026 04:15:20 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB6383.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:423::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sun, 19 Jul
 2026 02:15:14 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.012; Sun, 19 Jul 2026
 02:15:14 +0000
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
 b=LknGb/qyf5vBOd1fCk9UazlRtpVRl8+cfVXgw4Wk4Xjd3wJq83VwN7/jRojWf8NVhY81e9Ayr91FbJorZsKt+HWb/09Qje0pct3WoxKDpjk1GHVX2vGzDbbnkDm4f+MBa8/JWHlvl/0Xv9wgnJPcvYpoWGzx0F21whwRg0A6V9eyyRMPmGGYsTxRrl/D2r4+7TT2yc4MDHHpKrI96XH6Ji5xMnXbCXfm78VUIGFlV4038T5QFiryXfyu4J8GEMCAtx82WsZjfOYVfUPRrV8e+kgJa/NRim2F8cBjTAk+WF9uUgoSEwvaG8AYoLZmwRcuzsQ5hwyVVXOPmdKIoEq5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM/FaKbIxlxUpyXSIcvmURf3x0q+w1RIkxcerdwIumU=;
 b=dPOyzkyXCjtflsYxfseD1y76rSA37x1JEBhqfU56nJBDZQooU+95KTrSFM9sXPYuKiK3tjNl3mVtNOAbinjMOPoWjqmLzwt4RtWbhT1cY1m7IYWOZJNMA216Oqg+A1TvJzjfVtU5ZHDOLUu0qaQvw9vHsJcIa7R751AZYAgx2vhsenegHHUCYhK7oW3xbRjbsBrU7eiDAd4v32GoQuWS9RH8N9pyd4YIT1Oi4SEImW6kynwrC59J6GjzHVIgaKoG4Qb2G/EiFaT3A04yWG9OzROU1LWgOE0URYVgOA6/DFxw5okjfNd3kqJDPnfjCZgrsLCcXJFbuKMJA2GDAqb+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM/FaKbIxlxUpyXSIcvmURf3x0q+w1RIkxcerdwIumU=;
 b=TPRt7KGgB1pV4bL9wMzAMAOee71Sjw4LhYG/j83YmYEwwZmsby54mRQPoMsi2yd7IwY+Acwk2Pl04hgM+R2O2bDb6zXcx+iqt0BegXwp71AkFjK8XuwQqyjHOws9O2PN8zeuLzlCiBeyBGESxJv2XBcHVrx5eu1TXzZFSz4Ebmo=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 2/5] xen/sched: Link CPU topology to scheduler
Thread-Topic: [PATCH v6 2/5] xen/sched: Link CPU topology to scheduler
Thread-Index: AQHdE33qeUxN/5yCh0euzob8dSpsrLZwJoMAgAP6kJA=
Date: Sun, 19 Jul 2026 02:15:14 +0000
Message-ID:
 <OS9P286MB7222280112643BF8873CCB0082C42@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-3-taka@valinux.co.jp>
 <f4c13b73-719f-4d3f-be60-803fff8d0893@suse.com>
In-Reply-To: <f4c13b73-719f-4d3f-be60-803fff8d0893@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS7P286MB6383:EE_
x-ms-office365-filtering-correlation-id: 58a827e4-51e2-431f-1b00-08dee53b91da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 oOO2pcl5qyFwhktwIhnSkYTbj9QsASFEJgD0QkWtIbrAMO1ZIxVlJEWeTquLx9MuKyf3iJ0vIymur8u3Ij8mfBwmUEkEbkvaxMzgZkL/KqMh9oe4slUs9O4sJgqtWzXYarage5KJ8a7ENKRFOytNxnjKVDE+rjyQyA6Ey6nb81IXreoZqxw+MyvukChGx3rDniXA9YIeVAWrPGeFHJJuwxVkgBoOePbM6YhJuunYJ8I+5W/a1fD+GZWS4bdH5hFeVIr3tEx8EA2oBqlL2cdEH+a3NeM86tasUaKZCQ/fJH0DlbbV4Y1i4Tzda8q/oPTosihgnTeW/OzKqfA4NeCazSt6PERrT8Vpqzt3kwKGb7k4Z6O0D9LedOMJGmU6I/AphOL2Wxvyy+/92MrQnGx+TkYcl2/sdul7b4rqr/8/5PPgcu7NJnjs1fl0SbqJz3/h94Ng0w7Uvoaz8crM0Qztdb9zG31NzrOGiuJLYyoZiHQ7y+L9vnx77lr9Cs+6VnmYRg2strnzzLapwTQv2x+Klw8bRWlf73DoxZH1ywDZdkA+d3h8UBgO1sdW8mCvTiiRIPZ24133YIP/XU5zRlHrZFyAIx6ud1OGRLHXtJ9XW17bp3uk+pxesj2W6CiY4HbCFiieu6LRkFMisFH0OGTd8MzGxd1vqzHTtiuea7MOS2UIYXxQ547wmLV0zun3YwTVoTDiK9Gi1qr12nHXV5jmVgu/QVMU79e9U7MSlD/E1TY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXNsQ1B2RHBuUURNRUo3Z3hJNmlQM1JWNVpSek1lN2NXcmIxaUV4d00rcU92?=
 =?utf-8?B?azUzRi9McDFIQUlBWWUxNjQzdDg1VHhVbTVCN3VKUlRMNWNhaGZMVkppTmI0?=
 =?utf-8?B?WFBmY2hkcVhqMTlXTU1SUjl1bGdmbkVvbk84aFJNL09JVThXS0pVWHorc2lW?=
 =?utf-8?B?aEMxMnpUZHRMVXJnbHlQLzBQVTZ3T3JWUmNrdVlFNDhpaHR4UjhLNEkyaGhC?=
 =?utf-8?B?dWxFMDYrV3Buc2NjSjAvT09pN2p2TlB0U0RTYjROemZoUzJmWHJLRUNmdWpl?=
 =?utf-8?B?NVdUUGxvVWZLYUJKWGZlUkV0eXBEKzdHNFQwQ0JXYUZEV3h6VmJXTFUrSkkw?=
 =?utf-8?B?QlFSQ29YUitVOXpNOENTQzlXWXVBa3R5Y3luZythTEhsUkF5Qjl5eDZFdndX?=
 =?utf-8?B?NS9Oa1U4RWw3NVFSQ3RiQnNaVm5kZlNpNmxWdnhWSG9rQlRDOEI4eEdld2FT?=
 =?utf-8?B?Qmd2S2ViN1NTRFNCSzFzeVN6cHBVRFgrNEY2b0FmckpIcWJ3SFJUdHZBcnlH?=
 =?utf-8?B?c0pJcHlyYUdMYmZlaG9nQitiVndia1lpcnI5bitZeVdwTEpVV0NxM2E2KzhR?=
 =?utf-8?B?b3JmWTVQQlR6amM3eUdQb01NVldSZ3JJaWNwM3JFQ0VMSFRBUWJsdUR6YkVL?=
 =?utf-8?B?dTMzbXBtL3lSTHpLbFRVUnVYTDlGY2pmWDFmamtlNFVJZUwzeEYxTFNFdkZv?=
 =?utf-8?B?M1ZwMzRNU1ArOElNVlRDeU51Z1ZTN2RjdGR0WlBPenROM1IwSkt3MS9sWURU?=
 =?utf-8?B?eHFWYVpCa0NZMUsyOGw2dUh5RkwxU2V5bWFMMVdKYlJLcUdvTVJIWERRcDR0?=
 =?utf-8?B?NTNEMEovb3NRci93d3F2Mzh2QUJVUzB4ZlNINDIyanhRMUhGbWUwTEExMSty?=
 =?utf-8?B?M0p4Z0ZQMTNyTXhaR0VJWWc4bVh6Sm5lSkYxQWxDUzhRUyt1WVVJM0ZXNmdD?=
 =?utf-8?B?UEpnZGE2clhtYUw3VHd1eFArL210K3J0U3l3ZmwzU0hMc3ZKMFNuQUtUbmtT?=
 =?utf-8?B?dGE1L2FVT1RMUDJ2NXhuTWpWTThHMGNUTHBvYW1lMTlKT0lKQmFBRGdTTmRl?=
 =?utf-8?B?djFFd1o5cGZUay9kMW9tMnU5SlFlVngzWktDQUZxVTJPU3QwRmJkS00yblNV?=
 =?utf-8?B?NmtPV3h6elkwYzdGaytZdWFoVEV3Nis4MCtaLzFaTmx2VzV0NDRLMzNCRHlz?=
 =?utf-8?B?ck9KOURrT0RUcTNvR3hZei84bnFlUUtlUnBjb2ZpdEpCYTgzWTVlcU0rRERB?=
 =?utf-8?B?bkhIWFN4cEVBN1h1YTJTa0hBV20vUVdETExhdEdWWU1haXBmUWNjdkt6V1pU?=
 =?utf-8?B?RndjV2pCRGpYOG13YUkwVjY1eXM5RUVsajZyaloyZWg5ajV6Zmx0Y0RrZ0th?=
 =?utf-8?B?YkNWMHBEcmp0d0NqaFAvUmtpMzVhaEsrRHpWZ0JvZUh4aGw3VUNJQWJ1OGJ5?=
 =?utf-8?B?M2tuUVVYWnlTYjNZMjlTSlFZaTlJNEVyL255NVdjWVpkNWJnamh1UCtOOVZB?=
 =?utf-8?B?SmhIYWEvMlFubkM2alZRNHBBTW1QK2grM3JhRXBBNGp0ZTdpK0pZc0N0RGlL?=
 =?utf-8?B?aGxIekExSU1HbGpnQTVSVGY1K1R2U1l1UEpFQUQwbUdmSlNYUGd4RlRnZWRo?=
 =?utf-8?B?bXRjaG1sOVBwcE5YNTdVRUlUUDlDV2dFL2RHQzRzUkx3cllmVXMyeVRVLzE2?=
 =?utf-8?B?QjlYVTRpK1pMd0ZkMVJGM1RlQm1zSFZwQ2hSN0dBTVpnNkZEQU95aGFOak9v?=
 =?utf-8?B?aEphbFhudzdkTGlick1qVVZ5ZmhGY1JSYUs4ZHFiZ1QrZHJoaDFTN1Nya0s5?=
 =?utf-8?B?NnQwSDB1Q2I0YklYbUQxaG1NMTQ4ZXRLcmFPbTVLalhQRjJHbkhTN3dUNC8r?=
 =?utf-8?B?d01PbnBrb1VMMkhhZHptZHgrOThxcCt6R3RQNWtmdWZKcVVFMnpoblZEV0cy?=
 =?utf-8?B?Y0dsTUpCOWhhWUsvdkp0QjVqcEJldWw4SHhBRmE5ZlQ0SmxaVnMwY1E1SGhv?=
 =?utf-8?B?Z3ZBSjJ3WjV2azRobCtnaWlob1dWdVZZSFJxcUFHWnZxb2ozS1Q2TWQ4ejdy?=
 =?utf-8?B?OTJ0U2drY2ZFb0FDQ3RKb3NOZmpFcXNvUDJVSkoxRVVISHBTTHNCLzJ6OHgy?=
 =?utf-8?B?RDdPWlZobGtIWElnb1hyODVZT3JwZnBnQlRjTjF5ZmhpREQzZmRncHRXcGJW?=
 =?utf-8?B?YksvWHdpdWorRUJSd0ZneERzUmNPZmRsNTVSZ3JEdnVQcXVib2ZNTzZ4Um5I?=
 =?utf-8?B?VmZGZHJvWHdZUjcyRTZKRHJzUE9TOCszVVJGS2dhczgxK2hPK3VNbnVZVW1G?=
 =?utf-8?Q?zDP1Q2fc0+ugHHdYwJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a827e4-51e2-431f-1b00-08dee53b91da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 02:15:14.5540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P2qZaHMaQeizOqH9OJUgAZO912viwg0lMZKsLpPu6JvIQkFVhRFQz6Malz52W8O7KpE41xU8hqmbt7Nx7iPUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6383
X-purgate-ID: tlsNG-ebf023/1784427325-50CDFB50-10A89AE1/0/0
X-purgate-type: clean
X-purgate-size: 3610

SGkgSmFuLA0KDQo+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgY3B1X25yX3NpYmxpbmdzKHVuc2ln
bmVkIGludCBjcHUpDQo+ID4gIHsNCj4gPiAtI2lmZGVmIENPTkZJR19YODYNCj4gPiArI2lmIGRl
ZmluZWQoQ09ORklHX0dFTkVSSUNfQ1BVX1RPUE9MT0dZKQ0KPiA+ICsgICAgcmV0dXJuIGNwdV90
b3BvbG9neSA/IGNwdV90b3BvbG9neVtjcHVdLm51bV9zaWJsaW5ncyA6IDE7DQo+ID4gKyNlbGlm
IGRlZmluZWQoQ09ORklHX1g4NikNCj4gPiAgICAgIHJldHVybiBjcHVfZGF0YVtjcHVdLng4Nl9u
dW1fc2libGluZ3M7DQo+ID4gICNlbHNlDQo+ID4gICAgICByZXR1cm4gMTsNCj4gDQo+IE5vdyB0
aGF0IHRoaXMgaXMgb3JkZXJlZCBtb3JlIHNlbnNpYmx5LCBhbiBpc3N1ZSBpcyBiZWNvbWluZyBh
cHBhcmVudDogSWYgYW5kDQo+IHdoZW4geDg2IGFsc28gc3VwcG9ydHMgR0VORVJJQ19DUFVfVE9Q
T0xPR1ksIHRoZSBwcmVzZW50IHg4NiBsb2dpYw0KPiBzaG91bGQgYWxzbw0KPiBiZSBlbmdhZ2Vk
IHdoZW4gIWNwdV90b3BvbG9neS4gQnkgcmUtYXJyYW5naW5nIGFjY29yZGluZ2x5LCB5b3UgYWxz
byBhdm9pZCB0aGUNCj4gbmVlZCB0byBkdXBsaWNhdGUgdGhlIGxpdGVyYWwgMS4NCg0KT2theS4N
Cg0KPiA+IEBAIC0xMSwxNSArMjIsNDggQEAgc3RydWN0IGNwdV90b3BvbG9neSB7DQo+ID4gICAg
ICBjcHVtYXNrX3Zhcl90IHRocmVhZF9zaWJsaW5nOw0KPiA+ICAgICAgY3B1bWFza192YXJfdCBj
b3JlX3NpYmxpbmc7DQo+ID4gICAgICBjcHVtYXNrX3Zhcl90IGNsdXN0ZXJfc2libGluZzsNCj4g
PiArICAgIHVuc2lnbmVkIGludCBwaHlzX2NvcmVfaWQ7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQg
cGh5c19jbHVzdGVyX2lkOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IHBoeXNfc29ja2V0X2lkOw0K
PiA+ICsgICAgdW5zaWduZWQgaW50IG51bV9zaWJsaW5nczsNCj4gPiAgfTsNCj4gPg0KPiA+ICBl
eHRlcm4gc3RydWN0IGNwdV90b3BvbG9neSAqY3B1X3RvcG9sb2d5Ow0KPiA+ICB2b2lkIGluaXRf
Y3B1X3RvcG9sb2d5KHZvaWQpOw0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpbml0X2Nw
dV9zaWJsaW5nX21hcCh1bnNpZ25lZCBpbnQgY3B1KQ0KPiA+ICt7DQo+ID4gKyAgICBpZiAoIGNw
dV90b3BvbG9neSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgY3B1bWFza19jb3B5KHBlcl9j
cHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY3B1
X3RvcG9sb2d5W2NwdV0udGhyZWFkX3NpYmxpbmcpOw0KPiA+ICsgICAgICAgIGNwdW1hc2tfY29w
eShwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGNwdV90b3BvbG9neVtjcHVdLmNvcmVfc2libGluZyk7DQo+ID4gKyAgICB9DQo+ID4gKyAgICBl
bHNlDQo+ID4gKyAgICAgICAgaW5pdF9jcHVfc2libGluZ19tYXBfZGVmYXVsdChjcHUpOw0KPiA+
ICt9DQo+IA0KPiBQZXJzb25hbGx5IEkgY29uc2lkZXIgdGhpcyBhbHJlYWR5IGJlaW5nIHRvbyBy
ZWR1bmRhbnQgd2l0aCAuLi4NCj4gDQo+ID4gKyNkZWZpbmUgY3B1X3RvX2NvcmUoY3B1KSAoY3B1
X3RvcG9sb2d5ID8gY3B1X3RvcG9sb2d5W2NwdV0ucGh5c19jb3JlX2lkIDogMCkNCj4gPiArI2Rl
ZmluZSBjcHVfdG9fc29ja2V0KGNwdSkgKGNwdV90b3BvbG9neSA/IGNwdV90b3BvbG9neVtjcHVd
LnBoeXNfc29ja2V0X2lkIDogMCkNCj4gPiArDQo+ID4gICNlbHNlIC8qIENPTkZJR19HRU5FUklD
X0NQVV9UT1BPTE9HWSAqLw0KPiA+DQo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBpbml0X2NwdV90
b3BvbG9neSh2b2lkKSB7fQ0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpbml0X2NwdV9z
aWJsaW5nX21hcCh1bnNpZ25lZCBpbnQgY3B1KQ0KPiA+ICt7DQo+ID4gKyAgICBpbml0X2NwdV9z
aWJsaW5nX21hcF9kZWZhdWx0KGNwdSk7DQo+ID4gK30NCj4gDQo+IC4uLiB0aGlzLiBJbW8gaXQg
d291bGQgYmV0dGVyIGJlDQo+IA0KPiBzdGF0aWMgaW5saW5lIHZvaWQgaW5pdF9jcHVfc2libGlu
Z19tYXAodW5zaWduZWQgaW50IGNwdSkNCj4gew0KPiAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJ
R19HRU5FUklDX0NQVV9UT1BPTE9HWSkgJiYgY3B1X3RvcG9sb2d5ICkNCj4gICAgIHsNCj4gICAg
ICAgICBjcHVtYXNrX2NvcHkocGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpLA0KPiAgICAg
ICAgICAgICAgICAgICAgICBjcHVfdG9wb2xvZ3lbY3B1XS50aHJlYWRfc2libGluZyk7DQo+ICAg
ICAgICAgY3B1bWFza19jb3B5KHBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1KSwNCj4gICAgICAg
ICAgICAgICAgICAgICAgY3B1X3RvcG9sb2d5W2NwdV0uY29yZV9zaWJsaW5nKTsNCj4gICAgIH0N
Cj4gICAgIGVsc2UNCj4gICAgICAgICBpbml0X2NwdV9zaWJsaW5nX21hcF9kZWZhdWx0KGNwdSk7
DQo+IH0NCg0KT2theSwgSSB3aWxsIHVzZSB0aGlzIGFwcHJvYWNoLg0KIA0KPiBXaGljaCB0aGVu
IG9mIGNvdXJzZSByZXF1aXJlcyB0aGUgZGVjbCBvZiBjcHVfdG9wb2xvZ3kgKG5vdCBpdHMgZGVm
aW5pdGlvbikgdG8NCj4gYWx3YXlzIGJlIHZpc2libGUuDQoNClRoYW5rIHlvdSwNCkhpcm9rYXp1
IFRha2FoYXNoaS4NCg==

