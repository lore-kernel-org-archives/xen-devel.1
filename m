Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B575DCA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 06:22:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436275.1655000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRDl-0002Kf-Ju; Tue, 29 Sep 2026 06:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436275.1655000; Tue, 29 Sep 2026 06:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRDl-0002KX-Go; Tue, 29 Sep 2026 06:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1436275;
 Tue, 29 Sep 2026 06:21:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xBRDj-0002KR-Tv
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 06:21:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBRDh-001s74-PD
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 08:21:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb58f3-8faa-0a2a0a5109dd-0a2a4505a6b6-12
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:21:41 +0200
Received: from [52.101.84.128]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb58f5-4cb1-0a2a45050019-3465548034e7-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:21:41 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by VI1PR03MB6253.eurprd03.prod.outlook.com (2603:10a6:800:138::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 29 Sep
 2026 06:21:39 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:21:39 +0000
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
 b=SCzTFs3KsNt2L/ZuDI3N2kpdaB1+vkxqPKcvrRef6VLgE1hO71heK2LotN8HZwYZENfyiQwF6KGcaERlaiHfyk4bIQTquz0v4Xs8aNvqc6y234AxDZHT0wIAwKPMl8RWL7v1bGnM8Z9PoVbU8MyD8hmY5D1TgXxp6m8R88GvNaKQb3BRF+fV8/nDhXoknovkAT993kHYp9x608MmnDUa+h+kVOm97ZQUgyFmHJNqhJrzRvqaCdfW4f90qFc4b7K8TaHOSSDEQOJTVwSDPaEx1+KlyT7WAywBpr1U/cuE9zYOMsNucGl21v0S8XcYNzN0DqJpd1KiWM67QfrNgcLXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tNJt4A/VND/muEEENnRbILZAlhrV1UDwt2M/t/T2Hw=;
 b=DxBoJ+0uXCr6uCSOs4sefD5dLK0cR28mp+9I9VTfYD076r8d4o2IezcKmQ+0bZ70wIdh9sAmBzQj5NNjnux5VvskTEcIImY9Nr4f3+xsrTNq2kZg8RL9Ni+3kqt+fjKQc/bisxiFNCOnsIY4xrJJkkxefxeM/NLl/+1MFjowMstIR2z6yoZAI5cUSB1bT6zk7EruyWd+SmXyaqQXPEvrbVVb5SThec1/TX0cZQYigki9gxfDzbrghkNEIsiLDWbBvm7WtB7WsT0TI7bW8tzFLnpQdyVKB+R0Ws/rQbh9CQmVWE9r1dQl27K/OUM4c77DGnnk1K1EQNKA5XMqhPUB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tNJt4A/VND/muEEENnRbILZAlhrV1UDwt2M/t/T2Hw=;
 b=vjDOQ4dtIINiTc7cMNmbj7/UqgEWDEVRzIccLXpk2O9Gw6K77abHgvUKmbve2tWTgY72TwfLzhsLUVA7TQN3sX+9DlRA5z/HiQZh9gAcgYEgTheua6+yToKkCtjQwL3bqdpodbyCBMdtFmMsJskVrb+D7xuiRESX5NM6euDwSmPGJ4y0LmvY2iUdP7uY0f/EOxCVpJujaUZpYsXNxg02YAINIq23pBsDElXJvgNXPQcJRgFdwCLhJG6LSLwSVmvc4f9zVlFYclsg31RRKYYVDaZQP6sXgIlqqgH+r3nNDVGZBCAPbP+PJsWvex8CkNfJ9aozEhdUEXiG1yaNpmrZDw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH v3 0/3] misra: add Rule 5.5 deviations for macro clashes 
Thread-Topic: [PATCH v3 0/3] misra: add Rule 5.5 deviations for macro clashes 
Thread-Index: AQHdT9rJdahB80kOOEe43Z2U2hYqLw==
Date: Tue, 29 Sep 2026 06:21:39 +0000
Message-ID: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|VI1PR03MB6253:EE_
x-ms-office365-filtering-correlation-id: f0fb9d09-072d-407e-5e42-08df1df1ebf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|42112799006|376014|7416014|38070700021|10067099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info:
 p9jo2VUZeOlM8kd1KfgUSAVyKAvRxmd8RrdjtIRZN6K13kqrsi7+uOxppeb5OZGkdP670aEDG74dSbRbNwmgoSs4XLQDPrj2Px/Rno0eYioklh7Rpj/4RxoJBML6+t0FehXJrxKconZxosCXrCCoQqjIWATswMa6vrVnQ/trqE7swrdqXEZYf8BjqiQ9mSF5lGp18Klh2gL1wxZWYDKDy0z6p6dyw7UnwLX9i4XMK8K7HQg+whxC8x04Hpz4HPlj7lM6HRDlmHFeH2y43/kLbIlqmFAraaZ5PbA6r4yZbipOX1wrlTsZiMfdpyy8BJnf5d1NpRCpWhhkiZQCoUaKM0nBttz6ipKsJXwtNct2uLQko7shlxDBCNqd555S9msdPAzt2qQuFF2ouFi8Z2hb8soEYlvNfSfHmx7QrECiGMEMbB4hwgdt/W1oE137IUtFqBe99ZxbzWw2X8rBclINXIoRffGvOki2UpOqGOsDNd0Km32KCWie0ACXSaTDmDo00lhU726KRlIjTBmzps6hWQecTfxeG13Aivmvu0osn1N3rY0xw2kU1skk4isJEic2wQKL2Op48+FMkNxOgpqWXVKpKntV2Ug0zx5zkymMa8fgw8EcGgM1770X1aw5nmCQlcCIrnm+C0SffhVwBpKo9+WsZSGrSMx+eH4nmOfQHQMmgGEhqNGj3umsZfg0tIisQMnHxs5z9TmIHu3FsFfgVX9DtHnmx79xsJLyJR1LL84=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oSnlD7fznsPm0adPxb+CGqEpx1mX6knbfxlnfKKA7pplY8Gn6GSH2mqw/P?=
 =?iso-8859-1?Q?kUkwz7A+y09scAiyQMOEK4z99YUOEU4K8hXZDGNyewnkjbq+8tpqErPnUJ?=
 =?iso-8859-1?Q?T2OTrNHUQI/EZgGAEywc83MV3GB5oaYSb74DnqD8RjYWMxJ8v+z9C4IGgM?=
 =?iso-8859-1?Q?b84maQhGcOnodBxT3UxbPDSPJu1EuD3dAKJHsa3qmJ4Cm1swLWmThv9JJC?=
 =?iso-8859-1?Q?p1Il5lhiP749XkT4t5RqmEDRfsnkVuVZFfVBzB++tVeUjWYD2zF1lXA4Ge?=
 =?iso-8859-1?Q?ee/dieOsMbSa673iBWG4C17xKto9sIkr+pnxyBO7oKxQ9RN2gvvqZnnsAb?=
 =?iso-8859-1?Q?Hwqw37627vF7HeKL2ksU+WGJVi5pK9kzsa/HiZ3U+EhoXS7B+qV3KcCFml?=
 =?iso-8859-1?Q?ttIUg2Jdw+ksz/lEyknIi/s25dc/dobd6Y2Fxcv75fDlhod2qorLW6/iZI?=
 =?iso-8859-1?Q?ijCnZq+6M0/LP1S2PxE2xn8N6fSW1zNeDc3PgQidOYBqsHG97tjS/28aNS?=
 =?iso-8859-1?Q?wRGmMxFjAN7812mN/4GF5iHrBgzu87W/8WeL/WRVs1MATq9ehnnPyTCBNK?=
 =?iso-8859-1?Q?RoC+KkK4XC4GjBzXTS//c0fAZDddFcFeowfYNVqM/kGc97LLxq5ygBioqr?=
 =?iso-8859-1?Q?EyEgZvvi4/L4uEcRYIWyindgO2ks6dbykMMa3Y1iSNacrOa4Jjosje+nFe?=
 =?iso-8859-1?Q?fl4ligHkoM6SmP9sHsV8Jfo3i71EXcRrA/HO1F9HODk1mOsRzyBbDHLx5/?=
 =?iso-8859-1?Q?2Y2snHAhfcD4mvU/QrbVmmWv9rkImyfQzxW2xNNM9toMsHGnho/kXWFwOl?=
 =?iso-8859-1?Q?a3O5HwUfp4SyA/v8s3D/icFkg5LyGIILhj1aP4p5js2JyfPOWXVW2juliX?=
 =?iso-8859-1?Q?DwJbKBfFLu2NioQxJC2PT4YOzYZ+GbyPczBHqqeVqgaR3jc1xsmQvWndHE?=
 =?iso-8859-1?Q?/7T7tdgg9Y6XSMhuY4VMu88KBRZvweeecmKkNTuI/hINcoIiVBJq/lD2zs?=
 =?iso-8859-1?Q?PX/wD11ly8/snEUX5jj5pMbH9EbBK4h7O4Nvy7x+L/5sKhccpI1v8NrKc/?=
 =?iso-8859-1?Q?PqOyUqqUQaz0PZ6ycpKlD3aemf7J8d1Mxh2Dl//bO4lKsEkttg50OQA0Pc?=
 =?iso-8859-1?Q?KiUHgZAV6FbO+zXPmVWwsxNTmppPqpMLTGMk3QhQ8fUiXxsgZa6dzmN9lQ?=
 =?iso-8859-1?Q?g6FI1ieVzZmiT+kG9XOoA5QttxUGjQi1BUWWYk715HvduP3SEdUR5+GxVJ?=
 =?iso-8859-1?Q?vzNlmbx8cq/gvIlbrmJ44bNOMGspP/I3SFI3PVyCrPGcv17CsLHTz5T3wI?=
 =?iso-8859-1?Q?KT+raHPqo0Wuz4Y39lJ0DfK3U3xE+THhhTTIYHt2ocCNx942DmwLDNObHv?=
 =?iso-8859-1?Q?oUBvhy5+mBml93yCuLHyo0CKXoLPr257EroAnvLk4C3evvhPhAbM1OXUYW?=
 =?iso-8859-1?Q?oxrgsMbqq5PV45gAFFzg61y98tL3SLohd2ipYBDpeQZIgFAuO8q6dKpA3y?=
 =?iso-8859-1?Q?KMPj2CEGQTaXevdavHH++3WvQH+6WYhtSbh+3bChvaYDajecjN1SZ8ryRA?=
 =?iso-8859-1?Q?YRcBGW+11gukTc+uCtMt4WA3s0DpCAgviv5UKhu9U9+slZlr2yVefEm2AZ?=
 =?iso-8859-1?Q?1wapOykxJAoPB/Fp/2mQe5EGY9lFrmMSRLgLxcGsZ0PYpMWq4VNLXsg+s2?=
 =?iso-8859-1?Q?pmiQglS5Q4E7GWJFu4NWUakNQ8PUW4qWUi/rwcq08KCGSl6XF6BfaXMMP/?=
 =?iso-8859-1?Q?y8Jitxy1ecX9dNrHt2+H2HX+qkWWcg3n1A4xtkiQTcLqlhRCXIToCoptrU?=
 =?iso-8859-1?Q?2SJEPq/jTDVbcXqaIFno3leeALwNEug=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fb9d09-072d-407e-5e42-08df1df1ebf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 06:21:39.2214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4NWvD6qCNfDqPWxS04F07tznczBx5iEIW/UqqcPccM5HonRmgtPPTzM175Y+LsNmBi6xIqnNI7civssOMvAkhazNOqzvmqi29biRt0aH2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6253
X-purgate-ID: tlsNG-c201ff/1790662901-F7CB82A1-881D6711/0/0
X-purgate-type: clean
X-purgate-size: 964

This series adds deviations for function/macro name clashes where
the macro is used as a wrapper around an existing function name.

With these three patches all ARM Rules 5.5 became clean.

Changes in v3:
- update wording with specifying file (constrains)
- add Jan's ack for the first patch in the list
- remove single quotes around names

Changes in v2:
- remove much details from deviations.ecl file
- use word "deliberate" in descriptions
- append "()" to function to avoid mixing style

Dmytro Prokopchuk (3):
  misra: deviate MISRA C Rule 5.5 for hypfs_alloc_dyndata()
  misra: deviate MISRA C Rule 5.5 for request_irq()
  misra: deviate MISRA C Rule 5.5 for ARM SMMU fault handlers

 .../eclair_analysis/ECLAIR/deviations.ecl     | 12 +++++++++
 docs/misra/deviations.rst                     | 25 +++++++++++++++++++
 docs/misra/rules.rst                          | 14 +++++++++++
 3 files changed, 51 insertions(+)

--=20
2.43.0

