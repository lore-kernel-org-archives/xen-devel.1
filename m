Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF53CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 14:09:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450634.1666059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHM8Q-0007jF-Bz; Thu, 15 Oct 2026 14:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450634.1666059; Thu, 15 Oct 2026 14:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHM8Q-0007hN-2n; Thu, 15 Oct 2026 14:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1450634;
 Thu, 15 Oct 2026 14:08:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xHM8P-0007dC-7d
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:08:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHM8O-002ujh-Kl
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:08:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad0de59-e002-0a2a0a5209dd-0a2a4501c5d8-34
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:08:40 +0200
Received: from [52.101.65.141]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad0de67-5984-0a2a45010019-3465418d2d13-5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:08:40 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by ZR6PR03MB911287.eurprd03.prod.outlook.com
 (2603:10a6:910:d7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 14:08:36 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:08:36 +0000
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
 b=SGNw/MbbMqGtTOUUIYKvMkD9w0+xg/pz4LYznNgQtwLCIeWASl+7G8MJz8BKxUt7/u92i7if0rlcrOPEVY4K0iyepQywTfqUJnX2QuEKjELhUxT1Ebo7w2f7e/JTCl8hpWUfRQT4JeRdNivX7M2lBEcsuugH23oWw3FYpAu0GLRL/EgSq0RWGPuRWPqrF2OpKwD+dvoyvOINjzsRETlqrLmsjiyjHDvfzLDS8hCv07TzCOQ8yS96Y1BR8LB2/j4B6svrpupZUMdEd8Xsk4a0NzO8J+gpcAbpdEl3tr4FYuatQlqjKZ6s6F2FonhwmoF/RdNpTnQwZ4f/UAUDufpM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvMlPCObxLIEvCughisWjippOr1t8mmEjUTQZnihfjI=;
 b=vjsMnYkmUuzfoa0UxWK4mKNZiP9LyOW86fBbJXMhmazLu4XO9ClOVh3E/GmJqGdzVot0rWm1kE69TRuqUKEaIdsoQMDd02CFBps7YdsQDZkHBqpr3FkyuFnBhExccVQyCxPZwO8ht7OJMwuR3TRWcZFHyYYAnjM5rWAmqCdA1igyQ7ocwrT4hPVnSSe54VQKV6F/OybHEmYxDQGt9HAFD91NLiT7FQuULAT5vkzr7j61hlnH5E6Bs7cDTxULrEY5aPHznu4t4aPMe4AR6lwpulA0lwbcjRQcuobnliZ/A4Nk9zwnpj2GBwLGKvRMb4nCCBzju9SIqQvUpi2pWruNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvMlPCObxLIEvCughisWjippOr1t8mmEjUTQZnihfjI=;
 b=MgI9XXvDO6nPmJyU37NfCVK08MHYXxSN7t6sBTvd99IDOEH5PO2zdhgmTZaO+i9IR3bgUWz/sGY7xRMYUoofr8IUvXVCC2l8pXVyPyX80Kv9ZyyauCyoJtiSBXsiET8kH+ERfhFCwyW+s6qC68xX7yecc3kscCdHf6+Vaedl4BIBnvbrwQ1HiHLUNEDWA4Gf5PDeYuqVf+DL6lVLxyE5pLwIokhJ6gwfQ9ah1N4gmow+ye3u7T/f++eozOlMyKhDsD0hwB3KF1brXtmdrqQiD8muGnOqFEFPeBduMarFGBoGP6qictUnZvlFHUJzQX80i1U7wXhXmp4OZKCB2CanUg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger@xenproject.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 0/5] Implement SR-IOV support for PVH
Thread-Topic: [PATCH v4 0/5] Implement SR-IOV support for PVH
Thread-Index: AQHdXK6rQsC6poG5A0eHd+VJtXmFsg==
Date: Thu, 15 Oct 2026 14:08:36 +0000
Message-ID: <cover.1792072426.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|ZR6PR03MB911287:EE_
x-ms-office365-filtering-correlation-id: 85c70419-c5ef-4149-56f2-08df2ac5ce44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|38070700021|56012099006|11063799006|261009223027099003|260925022911599003|260925021311599003|10067099003|18002099003|6133799003|260925021911599003;
x-microsoft-antispam-message-info:
 rVYJXWDhPWSHmcFdGoySDEkVJDEezYPBRDpKYOlrIIwp1RSaSK39ry74aNWw2w0JgqwBW2Wy4wNq6hUmyLKgNNScKM9rVsbJlbiGA7DuLIuW4/Z3V//O1EWkIcTdfnq3tp0UWhjlsw0HoRd4MniQ0vU6U3eTh8nGoA4LYxBlNpZ0cKUWFYzPfSF6uWD77JcEOcGM6PBBE+C2pHzQtD2YDkVBw53P12cZ9Crz2SE3TvAdfyS3CQukUMcyp7cCuX93S8xtAFeoCEQYbBBYmvSRsEkO5qHKfTo+jU6+xC4J0HsnCRtojKlAl8z5IrXeEfYBvY0XEYkUvNyTFUumSlkXOhRAOsgu1kRK1kCGhEXaUhAZ3atbkvmL8rRN1DNR7RkNlQPhxrx90/BfAgrR3tPf1BJzo7F5gJqVmjHcsDsznCh++mj6q0JUetSXhIEwJq3DMlfkEJcA2qRNuJjIKJM3/oxrIzJB3OlbkaO0I6RpMRbuIgif4Yb1cv8/RFYMGbFxVhNuGNDscQbInrmgD4qWCNqoWIS7wFVUALSn1/mdZm1cVWmsdkVn/MaEHbwIDAu07MCA4bXz9FYDvc3r1AVtuguC1SuEcLi2ZJgoOYFyXnBNvKb0fFpNj0nZL/Zip9MVzvqFlxPfRKWRg0p/J1yg4j06vzwsgLwm2tsbap9qZiU+b6/oVVh6+Z3GsrBg2BZR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(261009223027099003)(260925022911599003)(260925021311599003)(10067099003)(18002099003)(6133799003)(260925021911599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bm5KUjluWElKQXZBa0U3blVleXZaNEgyTzNiSjBOVllCOHZ0SmJER1NGR2hR?=
 =?utf-8?B?aElkRHVCUWtNME5sc3dkV0lJK29QWElLczYrYnBLcnlzQVRwOTA1cHl3YXZX?=
 =?utf-8?B?MkVnSGhFd0Y1WUFWN0ozZ1dMVDl3NEdTMEFySjVlL0RodWdLTWoyWUMxeG9n?=
 =?utf-8?B?WVlxY0p6UjZZK3NnOHg4bForQmpHT1poZ29Fa0d6c2g2R1kzMStQKzZiT1c1?=
 =?utf-8?B?R3dxTHlJNzBLL1pybFF2Rmw2Y3FGeGV5cVVYNmdoRm9EWHI1Njc1b2MrUzUx?=
 =?utf-8?B?K0trQ2lVdkIvdWZFT0xvb0lKcEdhbzBQNHN2ZHYvSmtUMzVYM0g4dWZUbzh5?=
 =?utf-8?B?aks2YkR0NmRZMGp1L2prK1hOVXBCaWdhNU5iWW1FOHN6bkNMTkM1bjMvZXlj?=
 =?utf-8?B?czVTM2YzMDNJSW9Mc0RieGUyZU1RR1VlOCtiY2NwdlR5NzJDNWQ0VUNkU0tD?=
 =?utf-8?B?K0FDaTR2RUc5U1R5VHBzTEo1aER4WkQweDByNmg1eTFRTDhtZkt4cGV0NzNK?=
 =?utf-8?B?MGFuME1qdFVrQmtad0RNNUNhTTRpdHAzZlIrRXFpZWlyaUxjSFdNM3MxUC8v?=
 =?utf-8?B?UFh6UXRBbktLemhwS0FpWk9IcFc1YktFSkE5RXd0Unk1RkZSWE0zN3hTSDJQ?=
 =?utf-8?B?Sy9wK0ZnTGV2MW0zTGhyUXpvV0FzS1FuRitSMExPOU5JZGVrK08rZXA1ZlBK?=
 =?utf-8?B?dVhvY3VhcmNkcWJtVzArN28xTUFTWEZwVUN2bU5UeFk3ZXFXbC9JSXd0SThR?=
 =?utf-8?B?am94SkY5RWRGdi9Ha0RmcVJEa2xXT3BZNFIzaC9YOHJQUy9KOGlyL0ZsRVY2?=
 =?utf-8?B?WmRBOXZkY2JuYXcxa1FxOWJab01XNndoS2xhRFdSTlhqbzVtTHZhUlFQOTNs?=
 =?utf-8?B?bmh3SGp6bDFtR1R5aXRIbEo1YUlQbm9waFdyRTlvSjQ1WXdjWEtJL1Nmczdk?=
 =?utf-8?B?R2NIWXVtbDUrRkVQK2FYTUNINm44UEpKTmVmUDhhR0NzczEwNmdDUDBDc2d1?=
 =?utf-8?B?OEQxM2dqUGR0OUZHTHQ0YU8yUDlyNDlEZjFLS0QrQTFnUTRRaFhiZjA4K0t3?=
 =?utf-8?B?M0NxY0QxenpkZGxwNTA4cFRiU2d1OW5xT3BaU3lwOUtKUEZ1SGhteUtkNnZn?=
 =?utf-8?B?UWtna1dES2FibzV6c0FSd0VkTlNPZXhnTnZsU0h6QTFPRVhZR29nQVA3SHpS?=
 =?utf-8?B?NEVqWFpJdE5wYVNlSVczS0NJbFBzRlJIeU5JYkJpTDdHaHFqODB5ejhLSzI3?=
 =?utf-8?B?eHBWczJ0VWllT3VQMmxETlE2cnQ0RHpnMUprdnF1Y25DRTVwN28rNUhlOFMy?=
 =?utf-8?B?bzh4WkgreitpOXk0QVlIU1BxTEFSeU9IUHdSRmtHVEhlRFRrODJ2dlY4Rk9x?=
 =?utf-8?B?MFNnMHpmTmpWeEEvenl2c0FoNW9yY2xTTjRwZjhHS054ZTdRZjFldWt2NlNk?=
 =?utf-8?B?WmJqVS9CcTdBK0ZMSlluMlpkLzNmelpDWVN2TGt6ZHR1U0kyei9LWHN4ek1T?=
 =?utf-8?B?RXBFb2U2cEl4N2VBNGZaWVhlNkpkODY3d0t3VTQrSU5QM1dGS2x6N1ZST3BC?=
 =?utf-8?B?U1luWVpaTmgrVDNvc2dJK1kvUFFvTVNsZlRrZDlGdjZIWW80NENsSTZCWnlH?=
 =?utf-8?B?R284WmJSWG1ZSy9ieTNodjRFUzlGMXY1L1BjSGZwaStzOCtja3E3VW4zWklH?=
 =?utf-8?B?SDZjK1pSZ2ZIVHQvQjdhNTNMeGNIb0t0VlB1dW1ZQlN6VjVHZDlNdHV0bGVJ?=
 =?utf-8?B?enZWdU4wUU9CdFFnL1RPR1RscVFYUmlrelh3dHZ3dkZLaVN0Y2dRVzV2YUdq?=
 =?utf-8?B?cnp6NVlJR0pxMWpRR0hBQmE2YVRxY1l3SnlvRUF2RlRoTkNjM1ZXeEJCdkJs?=
 =?utf-8?B?MW5GTDZ4QVFyTUZXSkowSFVxNUltQ1p4L3B2Smp3S0o0WTlBUE56THVudGgv?=
 =?utf-8?B?emVZV3ZXUkZGcDB6ZG84NHorcDQ1THRpekJrbmZ3RmxHNnY2MnIvd2NLTFoz?=
 =?utf-8?B?V05OS0NlWm92Q1ZxZ1c3VlRWM3lmaVVwbzNrK21DdmVYWERyS0wxaFB6a21n?=
 =?utf-8?B?YjNNcUVCZmFzVnBJYWJxRkVLdW1MbjhYRFQyRkd6ZGpTVzYxVFNmdDJja2pq?=
 =?utf-8?B?MHdsZU5KbUR6anVWTzZIM3lIcGMzT2tkSmxHMk9KUFFMMW16cEhJcWlwQ1gx?=
 =?utf-8?B?a2RrMGJxaE9Ha1ErY0psZ1pOeVpRVzR4cWVRbzRrTU5oa1N1ck1GMmVoeGh2?=
 =?utf-8?B?VC9mSU1aTWdPYlNHUStZUThXMTVxa3V5aGZJSnhWQ2Fad092bkRoQ1BFMWhN?=
 =?utf-8?B?eklIQkxLVTh3eVk2SEdxbVBDQ3JRaTRpdUI5Rmcrd2kwaFdyRXI5c2FaQ3or?=
 =?utf-8?Q?PhSKMf9wrHWyT9ns=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B32FBE64FF719D4C983BE62F684649EF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c70419-c5ef-4149-56f2-08df2ac5ce44
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 14:08:36.7305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zgn3MhUFwtn+YD+0lcX0xPKVYuEhj5L5+dSfepp+MckQLAcPEWkkgaGAeARzP6xP5dc6+zxP36p2n4w7u4SQIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR03MB911287
X-purgate-ID: tlsNG-d62444/1792073320-1F46D757-8784AB60/0/0
X-purgate-type: clean
X-purgate-size: 3552

VGhpcyBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBQQ0kgU1ItSU9WIGNhcGFiaWxpdHkgZm9y
IFBWSCBkb21haW5zLg0KSXQgYWxsb3dzIERvbTAgdG8gZW5hYmxlIGFuZCB1c2UgU1ItSU9WIHZp
cnR1YWwgZnVuY3Rpb25zIGFuZCBmb3IgdGhlc2UNCmZ1bmN0aW9ucyB0byBiZSBwYXNzZWQgdG8g
Z3Vlc3RzLg0KDQpUbyBhY2hpZXZlIHRoaXMsIGFkZCBoYW5kbGVycyBmb3IgU1JJT1ZfQ09OVFJP
TCByZWdpc3RlcnMgYW5kIHNpbXBsaWZpZWQNCmhhbmRsZXJzIGZvciBWRiBoZWFkZXJzLiBEb20w
IGVuYWJsZXMgU1ItSU9WOyBYZW4gdGhlbiBkaXNjb3ZlcnMgdGhlIFZGcw0KaXRzZWxmLCB0ZXJt
aW5hdGluZyBjb25maWcgc3BhY2UgYWNjZXNzZXMgdG8gdGhlbSBmb3IgMTAwbXMgYXMgdGhlIHNw
ZWMNCnBlcm1pdHMsIGFuZCBhZGRpbmcgZWFjaCBWRiBvbiB0aGUgZmlyc3QgYWNjZXNzIHBhc3Qg
dGhhdCB3aW5kb3cuIE5vDQpoeXBlcmNhbGwgZnJvbSBkb20wIGlzIGludm9sdmVkLg0KDQpDb3Jl
IGZ1bmN0aW9uYWxpdHkgaXMgYmFzZWQgb24gcHJldmlvdXMgd29ya1sxXS4NCg0KVGVzdGVkIG9u
IFItQ2FyIFNwaWRlciBib2FyZCB3aXRoIFNhbXN1bmcgTlZNZSBTU0QgQ29udHJvbGxlciA5ODAg
YW5kIEludGVsDQpYNTUwVCBldGhlcm5ldCBjYXJkLg0KDQpbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3hlbi1kZXZlbC8yMDE4MDcxNzA5NDgzMC41NDgwNi0xLXJvZ2VyLnBhdUBjaXRyaXgu
Y29tLw0KDQp2My0+djQ6DQoqIHJld29yayB0aGUgc2VyaWVzIGZvciBWRiBkaXNjb3ZlcnkgaW4g
WGVuDQoqIHNxdWFzaCBleHBvcnQgcGF0Y2hlcw0KKiBkcm9wICJ2cGNpOiBVc2UgcGVydmNwdSBy
YW5nZXMgZm9yIEJBUiBtYXBwaW5nIjsgcmFuZ2VzZXRzIGFyZSBub3cNCiAgYWxsb2NhdGVkIHBl
ciBtYXBwaW5nIHRhc2sNCiogc3BsaXQgdGhlIG5vbi1mdW5jdGlvbmFsIGNodXJuIGludG8gInZw
Y2k6IHVzZSBhIGxvY2FsIHZhcmlhYmxlIGZvcg0KICB0aGUgQkFSIHJhbmdlc2V0Ig0KKiBmb2xk
IHRoZSBkb2N1bWVudGF0aW9uIHBhdGNoIGludG8gImFkZCBTUi1JT1Ygc3VwcG9ydCBmb3IgUFZI
IERvbTAiDQoqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCg0KDQp2Mi0+djM6DQoqIHJld29yayB0
aGUgc2VyaWVzIGZvciBWRiBkaXNjb3ZlcnkgYnkgRG9tMA0KKiBkcm9wIHBjaS9pb21tdTogQ2hl
Y2sgdGhhdCBJT01NVSBzdXBwb3J0cyByZW1vdmluZyBkZXZpY2VzLCBzZWUgWzJdDQoqIGRyb3Ag
dnBjaTogYWRkIGEgd2FpdCBvcGVyYXRpb24gdG8gdGhlIHZwY2kgdmNwdSBwZW5kaW5nIGFjdGlv
bnMNCiogYWRkIHZwY2k6IGFsbG93IHF1ZXVlaW5nIG9mIG1hcHBpbmcgb3BlcmF0aW9ucw0KKiBt
aW5vciBjaGFuZ2VzIGluIGluZGl2aWR1YWwgcGF0Y2hlcw0KDQpbMl06IGh0dHBzOi8vcGF0Y2hl
dy5vcmcvWGVuL2E1OWMyZGEwZDRjNzJkZWI0Mjk1MGU5YThlMzk4MmZiZGVlNjA2NjguMTc3NTU1
NTc2Ni5naXQubXlreXRhLl81RnBvdHVyYWlAZXBhbS5jb20vDQp2MS0+djI6DQoqIHJld29yayB0
aGUgc2VyaWVzIGZvciBWRiBkaXNjb3ZlcnkgaW4gWGVuDQoqIHNlcGFyYXRlIGRvYyBjaGFuZ2Vz
IGludG8gdGhlIGxhc3QgcGF0Y2gNCg0KTXlreXRhIFBvdHVyYWkgKDEpOg0KICB2cGNpOiB1c2Ug
YSBsb2NhbCB2YXJpYWJsZSBmb3IgdGhlIEJBUiByYW5nZXNldA0KDQpTdGV3YXJ0IEhpbGRlYnJh
bmQgKDQpOg0KICB2cGNpOiBFeHBvcnQgZnVuY3Rpb25zIHJlcXVpcmVkIGZvciBTUi1JT1Ygc3Vw
cG9ydA0KICB2cGNpOiBhbGxvdyBxdWV1ZWluZyBvZiBtYXBwaW5nIG9wZXJhdGlvbnMNCiAgdnBj
aTogYWRkIFNSLUlPViBzdXBwb3J0IGZvciBQVkggRG9tMA0KICB2cGNpOiBhZGQgU1ItSU9WIHN1
cHBvcnQgZm9yIERvbVVzDQoNCiBDSEFOR0VMT0cubWQgICAgICAgICAgICAgICAgICB8ICAgMSAr
DQogU1VQUE9SVC5tZCAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KIHRvb2xzL3Rlc3RzL3Zw
Y2kvZW11bC5oICAgICAgIHwgICA0ICsNCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICB8
ICAgMiArDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAgNDQgKysrDQogeGVuL2Ry
aXZlcnMvcGNpL3BoeXNkZXYuYyAgICAgfCAgMTYgKy0NCiB4ZW4vZHJpdmVycy92cGNpL01ha2Vm
aWxlICAgICB8ICAgMSArDQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAgfCAzMDkgKysr
KysrKysrKystLS0tLS0tDQogeGVuL2RyaXZlcnMvdnBjaS9wcml2YXRlLmggICAgfCAgMjQgKysN
CiB4ZW4vZHJpdmVycy92cGNpL3NyaW92LmMgICAgICB8IDU2OCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgfCAgMjQgKy0N
CiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICB8ICAgMyArDQogeGVuL2luY2x1ZGUveGVu
L3ZwY2kuaCAgICAgICAgfCAgNDUgKystDQogMTMgZmlsZXMgY2hhbmdlZCwgOTA5IGluc2VydGlv
bnMoKyksIDEzNCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMv
dnBjaS9zcmlvdi5jDQoNCi0tIA0KMi41NS4wDQo=

