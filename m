Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4922606A321
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 10:25:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1504765.1699839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWt8t-0000rk-Rl; Fri, 27 Nov 2026 10:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504765.1699839; Fri, 27 Nov 2026 10:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWt8t-0000rc-P3; Fri, 27 Nov 2026 10:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1504765;
 Fri, 27 Nov 2026 10:25:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Anandu.Padinhare@electrifex.com>) id 1xWt8t-0000rW-Aw
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 10:25:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWt8s-00E2Vq-Ni
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:25:22 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6b095a89-8faa-0a2a0a5109dd-0a2a45049090-40
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 11:25:21 +0100
Received: from [3.110.59.172] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6b095a90-b57f-0a2a45040019-036e3bac820d-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 11:25:21 +0100
Received: from 40.107.51.131_.trendmicro.com (unknown [172.26.73.106])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id 50AA7C0010C4;
 Fri, 27 Nov 2026 10:25:19 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (unknown
 [40.107.51.131])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 24791C000429; Fri, 27 Nov 2026 10:24:53 +0000 (UTC)
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::6)
 by PN0PR01MB8955.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:24:49 +0000
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3]) by MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 10:24:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1795775093.149000
X-TM-MAIL-UUID: 1fa939a2-f1aa-4d14-a08a-0dab9f786f07
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGPivWpJMenRtb2IL/ETZs937WLBtXrG30puysGppTH98VY0CjDv+BF37SaAFh+m23CyK/kPpfptWTFqtvi97YGq4KWIL/rxX5jK+Tsfh1dFf+JEOsroXySAvTP3PbP6e2VjJKl4+Uy8cf6ygP/4T4Skhs09ZkkqgGIacI1uhDInfBx10pvg+s3XiUEEd5JQ+QQn6OrBPuNr1DOS722fukpRFJoQ/mWCUw7Ld8ovOHPLNlX9vPunpa3xQvvY+I5bEcT+aIh5P6BnQcytoWCE8yVUIgC4I7SHJIZXIcPFLILiDMRAisJX/DgKuruZFDwbVQSdDm7mnDoxUU1zQd1eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwCj/mbhTs/20oQ1imTNvAl881TFCgkXgltm39M5MBE=;
 b=YIbwukEr9/1gPO9yp0nha8qHSiTaoAqKqeyE+kvVW+XvXw0l1Un22eYNjfSz02BJBE7zPnls3DAPcUgQvzH1vW8AyWWwZZo/RYI0DC1mr3N1Y2vTuVl9CE5Yozd5ebnz+jGDTCe5suLRBUmSpY9t+yOo+Ri6PbESFsRrnH/w/iLyiMAshDeGDoGtRRu9pys9jDu0iwsLDOAdA+L/IbKivOjnQZNCgj6GcUlEWDYf+9Z7d3BbFa0OI0eDfRKha+X+zrr9Hx+HZSLDFprWw25R0GIIi5NCRCcgVJYekEPRCIW0SlHkIYaYBlhA2TuLO06nYJ+aH2V0Tv5i8ukZOwAh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=electrifex.com; dmarc=pass action=none
 header.from=electrifex.com; dkim=pass header.d=electrifex.com; arc=none
From: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alistair Francis <alistair.francis@wdc.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, "roger@xenproject.org" <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/riscv: implement udelay()
Thread-Topic: [PATCH 1/2] xen/riscv: implement udelay()
Thread-Index: AQHdflmI5egzTrYqpUm/DU4ZVDt4Ag==
Date: Fri, 27 Nov 2026 10:24:49 +0000
Message-ID:
 <MA0PR01MB92176C8ABCF9CDCDD772D4C9FD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
References:
 <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To:
 <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9217:EE_|PN0PR01MB8955:EE_
x-ms-office365-filtering-correlation-id: f598d417-bdbc-4cab-dc82-08df4c70aad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 u5qBBIWPVpIHIfqRx6eQvCqdIHnHp3w3LfSkr41a+IVUwPp5ELSu3bjJGKtsXgrQkGSF0uh8L10GpJJ6UiGLTX694K5hnkhw0tyOuxevbEdPRsByIUzBVDycs+oHYxXb+uoLnlImwi2tzKnzkAYg7wjpq6OMJ7QoFOPtTPt6vgPIotshcDWMA2HEYLVBOwiUK2syoPQKDL7+AP94/6UQV3UWeMaCRiMRBU5E10RgHxo2P7VKieVApj9+d954NDa35mf6Jj5rsOimNxJPglTJsCo3vT0qTxDvdHxrwmZGOuVDe7aQY8oZZE41oAjqTg0E3sTtI3P6PD+NKRq6jAwoCPvUs6LtGs+2RsvqmcATOb1T7lEqnpIDW/oGgv0lSLg7mZDlGkixBs/mG7EoJKW0sFgo97yqRY5iKraJF/Aq1uNamxY7GmeJOND7mumGNGp5dStvtUnUrykg7DlT96y1eE2TKHyXq3PsJP6V8CSqxlovBFbxs1bsdp/8KiDnEkQFSIwfRbE+X5FcD5qDuf+yoo/7tGGLIREioA77VxH4HdLqQ7/39zed62cMAwb6xi1GAAuOw0rwyRklcE1O3ibrPXWuxZJodVnsw2pdmhKeVz/otyEAIzyDqHAlHqwNvxT6Tzj+lIzM7+4jr+vpb1IGPo8NKHUMtFFJ/b/0qM4AW35L0UC+VQF3qtXX3YxOPXSl86PV4uaoJ8zTKL4nlMLZsW9G4EfpZ6iqm21YyMMeaU0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0gy6z8GfiJATQwqlmrvsqjSmntxhPw4rnJ3v0EZARs0OLC7a2k52xU4guz?=
 =?iso-8859-1?Q?qsV/CQjJRItdF7j8aYnQ0j1+ngP2gQPaPI8k29BMV9mPh0NiP5ifwpq6jq?=
 =?iso-8859-1?Q?bWOt8o9LUm2J4Xe0Gj6wmZxgXcLTNjS8TyHMFZcZYADled7o6F3zKxKL9O?=
 =?iso-8859-1?Q?lNS25+qMiN5bT/1pnkeWobdrlnkCSqT4kWReDydn7BX7MCxWSH559Y69px?=
 =?iso-8859-1?Q?wZoGY+ZKAgXLAd5sSpncpD1/YG1T4+ikjRtXVv/ueA/eeaJS+z+L0pSGVP?=
 =?iso-8859-1?Q?lRJ4lWvNn0L+AVKiHrzhIqgR88uLMZtZyQi+3c6M95wruynvl6rowjqUTt?=
 =?iso-8859-1?Q?SPlAh5V0Pplai8OSpBUP1sjs6eWAE72YlBabCKG7wxQU3NCFeiSvL2ct8C?=
 =?iso-8859-1?Q?1HbsYQm6LshjE3TcIDUjCnK/QQl7P3m19Wci7OZ/LP2lAPlrfbZop8VDg3?=
 =?iso-8859-1?Q?bQ1/y/m38OlrDUpGTCd0TY4yjysNaKbnYGAVbzghE9QOh/RVwszt3zSrL+?=
 =?iso-8859-1?Q?LscAx1Vhb65h9wlQ9E5ZDvMT6lVnA+BGufx1Z433UtDobVS75d1Vn0I1wZ?=
 =?iso-8859-1?Q?iMlQE11phqICdugLLi5uyUyELlWYnmJlGlJe90dudu+TsNq3wW5wpSU7TC?=
 =?iso-8859-1?Q?2eSjdzGI5g6VXmKE0AuFElCZwLVHeEecvnyZEWn/NcEYuSqX1ha/4G5mEO?=
 =?iso-8859-1?Q?sRSb9Pu7lxioLQMuBFOwLUjp17+TdC4KIBIeaV5di5sBpLvRse7eEX2qFy?=
 =?iso-8859-1?Q?fsDiv/oWXCrs3kx5MveioOhoxovcpFIYQac++DJ8vrOhlDPBSaISVOOe4a?=
 =?iso-8859-1?Q?ZpDMCBfiWBgLdmppZTTH3VsvL/dJeNhioX9O63kpMdvNRQEag3qFG1J+b8?=
 =?iso-8859-1?Q?m/I9YA4vNZRlmpkyOkZKNW6Bh1PnbeNPXAxZ+/zc/ByNvDTgNqksf7ohYq?=
 =?iso-8859-1?Q?5D5QHNpWMf6U8DEJzLB/FZIPpICW7g7wxVOWdCY4pHiGxozXb2rVAmBJcs?=
 =?iso-8859-1?Q?LxqSgmWcHOBdoujSR/b2SwaDsOvjzs6HEy4IugZL6smOTNDHaa64kccOmx?=
 =?iso-8859-1?Q?wAatHa/qO2XvFloftr2XrSnrjPZ3SfOo+VeC523fSpqMuDuGdq5Yl3eai/?=
 =?iso-8859-1?Q?6/0i3ULFLEX5P0ncINiPmoexpFFK7pziXgQgzkfnbaUgBviskJkrIHaD+u?=
 =?iso-8859-1?Q?G6D4jC+CCwKtgvudY/noMd18o0T7g5F+yeuN3x038GQx4CmzXxpfcfrQgH?=
 =?iso-8859-1?Q?kMhidc/ziTUwWN6+t/Ozpg8yxlHGb7O6UANGOExgRmVJZ3STf3WSicG3cX?=
 =?iso-8859-1?Q?CKCeo5+M6jplMt6mMXOoPmB8hR1K6DUYtZ9TxLfrjr2i56jUm7sj51q94O?=
 =?iso-8859-1?Q?7HintX/uNOb9ibI+jSUxnB6aDsrssFXphnCecaao6wI/6SSY9t0I/9GN4O?=
 =?iso-8859-1?Q?2YEiOFn1KO7zbZEdoo3r8hxW1oMXfKWzgp3O7/afp4g9y8zDrZl4L4Cb2u?=
 =?iso-8859-1?Q?zhVSuDcBUtAGZDTmA+Vr+desvA5ehTAZlDiD8iJH1XjPZ9FKrK9sVJMtsV?=
 =?iso-8859-1?Q?TqSwWBjdS4VQ2cosqN8AfsnyZVKT4HiCTvbakGJatmImD0G0wJ1Zi8E/oi?=
 =?iso-8859-1?Q?y/2YfJ/wxQoI2KhqmUwk4/JFn9gGfEAH5sMRX0WDOkMg6bAc4FqGRj8pLI?=
 =?iso-8859-1?Q?aMK9qjwnZs11ZivOWp68VBcC6EComuj5netKk1W9g/s34pvXPlrIf0cuKz?=
 =?iso-8859-1?Q?NnXyEc/Ekju6BLJsXD7WJu0NtBG956NxnvbTJ0kAufvi7Fiy7PsZk2iH39?=
 =?iso-8859-1?Q?NmkedZzwkq53FDu3OGqKYyUTTjdnR7g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	D23GFXq+HISdGswPbWTvPyp47LqSC8xaFWdDrfZA8mI/3Xhrz/s7z8thYlIV1Z0TEeZwKBycEzsL9TPAwa/qaA5njks1tRMVD/lkOOu2fuIiDUSM2dWlzqMdjKOyMAPM+jtiWJaq6HcI/VkO2qqiOoL+A06AHcWaWdPdNl0ddJE+TsAM9Gkuh7HrS4EsZmYkluaovYATn9QFlPXfZ+BnQkptJ2pHJAQAHurlh456JUrYcY7Jvqe3N0kbEipk2fDXA+Xie1cv6fA1wKfM095rtePssm9kv4qMoS8oAcazzq2YZbq6CNUESHx3As0vAgDs5jGDdX06VBpPUwTqbBKlgQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PikSizoLT+2VfPiourcNS96s4oxr6FYtuNODBK8RKsy0yiSgmyiXHPyLHLWlN3cFy/gK87Ks/NpXkNOYBOEOThsPRXGNexqIYKo1i+c8/oyCGA83Q76YsbTvT23GbfSCPKem6l7sYnBySTAxWqRq4sDankzmO4ZsvIL2SB3KwBotrtDFG/XD1fnLWv6hP9+iRVB/gD97xe9P807a2pCnceFc9Liqhhzcgmay+TgL4qeklkb88+6Kc7BT8vGzeJ3WPsdy2lOKnC+rauM851Zflldba1tPzZtMuNIn+eCKlyL+i3eQTrf0g4wefm/YA83U6JpyEdGCrQoEgZvW/ev2yXQy2GcixYGsxRXbtJaPfH/u5erEV8ThZu/i/jwVlZM6TzLErtM4CmXlyE3kiSLt1RhTEKB5uJP2RNJG9hKjsTBFBtjHrSNMJ0Jd4hALhyZP5ybuHgdmK20UMWZlJj0oMlRIJTwjfXBiyFrikX/U8HOS8ns1NRtpMO9tP6j+XHQ9FGv/U/DA/4Q9qQebTpdKdq//YsTpu2qufVbZyuTRo/qfbR42ghv1Bl032iyCqmzOAZbhPxXf9qdXh69bPHobbKL+OffFP8u7jys3hFEsZ08=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f598d417-bdbc-4cab-dc82-08df4c70aad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 10:24:49.6084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Sp9cke04SZScSKE8icA5zh3ueZ+G3KauvokOSxY0bV6fgChuB2PNWDxPbe5iP4WnrnASLFPqv/ERSOhM+Sac8I9ZspW6s9bWwZhSCX8CCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8955
X-TM-AS-ERS: 40.107.51.131-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-30346.006
X-TMASE-Result: 10--3.227400-7.000000
X-TMASE-MatchedRID: u5vvmxoVVveSCdEIB96XGlOLy7rRXaBmiV3qB2lI8QPUowdNeXQLB8Fm
	OiaR4oJlNUnTdCXKkaxlPpQZC/HmORGGGxrWePUM+DE5zr5ahdzc7b6k5+X69zAsn09lQFCF2oo
	p6Ld8r8GQnF0MmGtKibb+bZWNEQdxdXYpcDl2V52TlNTCzR+UCLRixaJS+AJEojKyNVmXOrtmAB
	j3conxLr6xOUomV0NfzUd9p39pZYDotZZFLzrVX2sCVKm5hjwdo4NJa7SjFsrxf20B5UzKOYmRx
	7OV7pazLQGfvzJ0+VViyuQOZndK/eaOLqeqLSisqqKwdJVawvBRNE+5AxJKXjhnxu/7ECF5mokP
	/0YdqXv/uWIvb+RziQ==
X-TMASE-XGENCLOUD: 606f3023-1a70-4211-a51a-abb690bd8284-0-0-200-0
X-TM-Addin-Auth: pXHe12ODDgp17wusVrOYdXTDi2+jGq2tVXItAmy7T9C5n4CweckJySArfyE
	odqxANZe6wKXwoSGlp4+zVtJFv+YP42TxIMukCzpdy5gy9XaZdHiPvdw+hbnn3sy1McQXStPxaT
	lY7aQcHa1AAhOufEvuaj0gk26/11vch/vfUtxZ7BdS1qgjULHGRdTOdDaCuqfz3WT6htH1r/Bcf
	nUEw9CJRzek5Vf3XwbQE+HG3uQE88VUf79E0pahJrQK04xFKWRQ9TPP1DO5lzY89OIIfg8IZk4j
	CFRNkw9XPnSHO1X8R9rWectZizx89x2SoUQmCaUvDvVqfxjhmpDTq3l4Gw==.X5rqAgsenVuFqU
	YQnxOvRKQytf9ARyMFbupSyzk5VQB+aviVpCS/x8843nBlSzWhn8BSWWmKVlGZrFY1bMhyMWGZM
	3SWgeMKoWX9Tg2Ev3Y8Hkc2ewYQ/3y2MG3WzEvrOSTAwYHe8GWKzw9GQSFbvsD96yzv3OAdP8zq
	Tk/xi9omY385jzdTNDwfQG56NSDsr3hlCQnJVb4DOscDsRrnWvI0IP+Wrl7HYfocRcT3t1tcZIl
	B4GKVa8qLjx1KenYs6EVaVIEzrCS+7KW59lR3gXUnbXaX6CL0PyS9AjuZRrMVC0sFc6s2aNUAt6
	CHt8pWEUidZ4Udbg8GfUIViacoQg==
X-TM-Addin-ProductCode: EMS
X-TM-Deliver-Signature: FB199E894C1BB209AFC423CDD865F3FD
X-purgate-ID: tlsNG-ebf023/1795775121-52CCFB50-290559E4/0/0
X-purgate-type: clean
X-purgate-size: 2749
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

udelay() is still a stub that hits BUG_ON(), so mdelay() can't be used=0A=
on RISC-V, for example to honour the delay in machine_restart().=0A=
=0A=
Busy-wait on the time CSR instead, as Linux's RISC-V __delay() does.=0A=
Convert the delay to timer ticks once, multiplying before dividing and=0A=
rounding up so that short delays aren't cut to zero ticks, then spin=0A=
until that many ticks have passed.=0A=
=0A=
cpu_khz is only set by preinit_xen_time(). Before that it is 0, so the=0A=
tick count is 0 and udelay() returns without waiting. This is also why=0A=
the loop doesn't use get_s_time(): it divides by cpu_khz, which is a=0A=
division by zero before then.=0A=
=0A=
Assisted-by: Claude=0A=
Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>=0A=
---=0A=
 xen/arch/riscv/Makefile |  1 +=0A=
 xen/arch/riscv/delay.c  | 17 +++++++++++++++++=0A=
 xen/arch/riscv/stubs.c  |  7 -------=0A=
 3 files changed, 18 insertions(+), 7 deletions(-)=0A=
 create mode 100644 xen/arch/riscv/delay.c=0A=
=0A=
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile=0A=
index 665ec26933..a9aa7d1b2f 100644=0A=
--- a/xen/arch/riscv/Makefile=0A=
+++ b/xen/arch/riscv/Makefile=0A=
@@ -1,6 +1,7 @@=0A=
 obj-y +=3D aia.o=0A=
 obj-y +=3D aplic.o=0A=
 obj-y +=3D cpufeature.o=0A=
+obj-y +=3D delay.o=0A=
 obj-y +=3D device.init.o=0A=
 obj-y +=3D domain.o=0A=
 obj-y +=3D domain-build.init.o=0A=
diff --git a/xen/arch/riscv/delay.c b/xen/arch/riscv/delay.c=0A=
new file mode 100644=0A=
index 0000000000..232fe02fbf=0A=
--- /dev/null=0A=
+++ b/xen/arch/riscv/delay.c=0A=
@@ -0,0 +1,17 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0-only */=0A=
+=0A=
+#include <xen/delay.h>=0A=
+#include <xen/macros.h>=0A=
+#include <xen/time.h>=0A=
+=0A=
+#include <asm/processor.h>=0A=
+=0A=
+void udelay(unsigned long usecs)=0A=
+{=0A=
+    /* cpu_khz is 0 until preinit_xen_time(), so this doesn't wait then. *=
/=0A=
+    cycles_t ticks =3D DIV_ROUND_UP((cycles_t)usecs * cpu_khz, 1000);=0A=
+    cycles_t start =3D get_cycles();=0A=
+=0A=
+    while ( get_cycles() - start < ticks )=0A=
+        cpu_relax();=0A=
+}=0A=
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c=0A=
index 3a7953593d..98231e39cc 100644=0A=
--- a/xen/arch/riscv/stubs.c=0A=
+++ b/xen/arch/riscv/stubs.c=0A=
@@ -240,13 +240,6 @@ int guest_physmap_remove_page(struct domain *d, gfn_t =
gfn, mfn_t mfn,=0A=
     BUG_ON("unimplemented");=0A=
 }=0A=
 =0A=
-/* delay.c */=0A=
-=0A=
-void udelay(unsigned long usecs)=0A=
-{=0A=
-    BUG_ON("unimplemented");=0A=
-}=0A=
-=0A=
 /* guest_access.h */=0A=
 =0A=
 static inline unsigned long raw_clear_guest(void *to, unsigned int len)=0A=
-- =0A=
2.53.0=0A=

