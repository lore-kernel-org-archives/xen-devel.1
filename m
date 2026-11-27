Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8960A260F
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 10:14:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1504734.1699832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWsyP-0007Dw-1p; Fri, 27 Nov 2026 10:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504734.1699832; Fri, 27 Nov 2026 10:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWsyO-0007Do-TE; Fri, 27 Nov 2026 10:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1504734;
 Fri, 27 Nov 2026 10:14:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Anandu.Padinhare@electrifex.com>) id 1xWsyN-0007Di-SY
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 10:14:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWsyN-009UD0-25
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 11:14:31 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6b0957ff-8faa-0a2a0a5109dd-0a2a45099d82-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 11:14:31 +0100
Received: from [3.110.59.166] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Anandu.Padinhare@electrifex.com>)
 id 6b095805-be1a-0a2a45090019-036e3ba6c28b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 11:14:30 +0100
Received: from 40.107.51.126_.trendmicro.com (unknown [172.26.63.112])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id 87D1FC00030A;
 Fri, 27 Nov 2026 10:14:28 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (unknown
 [40.107.51.126])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 1B839C00042A; Fri, 27 Nov 2026 10:14:24 +0000 (UTC)
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cc::6)
 by PNYPR01MB11359.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:14:22 +0000
Received: from MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3]) by MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c284:c893:95b6:d2a3%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 10:14:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1795774464.112000
X-TM-MAIL-UUID: 2393f0d8-6b52-4af4-b0ac-d7cd6825c354
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqfuC+Ptksi4W7C0YTtSCSvdYIpewiiwfw/O99y3racClAgeW98XLW+wPgoINTImIqpASiajvWtmD9bHdRch2BzMowVCp6VP4brGfcdU4IYEAA/5es0CaGzFZV7XjUJdgFex5YM5K8oOUlUO+NSx2xpRip77Cpolx/sFmdra3TUR51srExYtbVVhugUHz4l+5wYBm06hh799ceBL0yDGtJ6AWj/1m9znUlNIAZDNd3i9rPKLjy13tlgafqEVt0C9LGlE4a4G7dWFP0LoQ2VjqxAy6QkzCUFwwPNAV3bmNLzrJC/y/cTRQHUSZDzezkj+Kl5y7eUI8QYqzJVjt5cwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FHyFniPgp9lfYLYWs8SoPQ3mAegLG/K8Ho1cP0NzCs=;
 b=WFJ2OInve+PB978IYYLfW0fb4rRl//O7aKD6XaM3wfWmmZK/fnYeKw3VtgvdIIZwQdRlTG8aChBNV2RUMKzsY0F0z1tU/jn2PlW5L4vwniW+JzFbBOWXUt0e/OtxHHQvBNUVvxvAAJ1ZcJr7vGttaD+K7dVkZ1RarE/iU0Z4FVkBc7ERbQvbsdt4EMAa89IERaeGPzEpPhuOduivZjflGKXiNiRM9W488c+0D9qs1hqqp/A4V1jfHj6LQAa6KTRS506TNcCrNb4Vm/luCEBQ9EHLwl9ky/pZzw96JhwhGLxV81PfAS8ZRAyUzLHDCWGnnZKt9kPl9yXqij+v5AJwjw==
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
Subject: [PATCH 0/2] xen/riscv: make machine_restart() reboot
Thread-Topic: [PATCH 0/2] xen/riscv: make machine_restart() reboot
Thread-Index: AQHdflcCVjVULQ1VPEqVO8X9w+aVsw==
Date: Fri, 27 Nov 2026 10:14:21 +0000
Message-ID:
 <MA0PR01MB92178FEAFBB95A225781351CFD412@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9217:EE_|PNYPR01MB11359:EE_
x-ms-office365-filtering-correlation-id: 0a476b89-1a59-4d95-29d5-08df4c6f34bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|38070700021|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261021135927099003|261102123227099003|261009223027099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 XA61nrmGA4TiRWpY7jksPathxFBbTxADfahu1iU5hYsL6pGTeyRKnp8lGc1wg7aiy0i6wJ+lB0sXbVv6b2E837ZDaBL+2IebNtNo726KwkffUirtGfmeGkVKQOpPHMytPYivXxV4qGe0b/87oAa4x/mE8zFGp/4teq+pwMsaGDBxP377ROfqB65dLogFPdQ5i/oCJJhp1VV6dW/euofqLRIvij0NytiFhbCNqrTvw5YdiB5PVemrjsELLxY753YH4vg2zEFy+x4QhU/o3K5AzAQQs46Xl61DXE/YUVN/1GuzCf111wyKV3U4Z37jbgZ0LDHsK7zC5WeAKzq/02uK65mpWwImFtYToOIstALviIZC8iykyYh4YqRfusI/fcUy+e1WCphNUJ0nQLrcu2YFWz8vzl7ZmWPaBhhjACcWM9pn7HDFThP+C1vNuUKvucPJJIcNXDZ5sci9aZKfZIX8k/e8UTYLrzEISf5FYzuRXvfqZjOtagmNK5fhMqe/ZcFW1UhXiPhygMz0zchaZyFzRtxOBBxKi65NxbtLq9cb/hIfG1GBjWYmOVAdjC0d2Un6zktDJUHdn8HcbaBXHIEakeF4P58oLDqWneTkcAy4Yqs8u2MEtR/JjBfqrPZSou8H9MQC1zmF3QmK+diKgYf9QJqZ/JuExW76nGy1jqOYd+CdMwVhMeSzixfxmb3BaUHHEraqQLMcZSG5oMi1wp2wlD119mKRqrojrRjMZBw4/6Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(38070700021)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z7+D9c8CsC2v20y3PHZk4oyoPogEJnNuXF3fWfRgyt2lYj6l+N1qwoRl6f?=
 =?iso-8859-1?Q?YjkrjUvOB5hsG8SlQqP4u0IBTYH41XTurwrEUHJzuSd7EFpEZGQrS2mFXT?=
 =?iso-8859-1?Q?zgGcztqwo/1BVCv90caGIKGYt4660GbMKYrjqR/Be37Lh7SQrqNcEQ/eKR?=
 =?iso-8859-1?Q?qYqFzFHCfqon0hso/+N0NYCRbpYjRj75tnwBO65uvTOY/MYUUdupOeLv/S?=
 =?iso-8859-1?Q?cWwADZ6HI2vGeXmdrsiMTaqRy6O/g8wJWCESLEQF7P3pdN8WURXYX0YAFl?=
 =?iso-8859-1?Q?Hm7L4wkiY1BH0ZItnMW3C5dgPxaKijAQ5WNJl1fFEdMsoJuXPpC3pWD7N1?=
 =?iso-8859-1?Q?Afob7HZJg7OcRPlltdh7kblsSf4lrc9MH/O/5C2b3q7ljnKzgVFGa/Jhns?=
 =?iso-8859-1?Q?4dNyW+GEFqFI94lhgM2bgvEwPsfhXkzgUiv4c2m7eqm5UkILzGRyF+W2Tp?=
 =?iso-8859-1?Q?X9o4QePk8uK1nVHmy6THW9ZdFKVLNVPtHn1wgU3sIK+YIbCYa3bHEdhS27?=
 =?iso-8859-1?Q?LfjJh6x28oL0GYhrvglHY1UDxmBIVQ9wo4hAvUL1PpeE6WfEhRC5RKcWj0?=
 =?iso-8859-1?Q?+BCX1Oz/edvusIu4+ddccJoHXWf6jjUavqu5r0N1zPPPDGnD25xOLHlPwz?=
 =?iso-8859-1?Q?qKZnUPzOTwpkVrbiTkavFGgHnc/wF9SD4lwWwOk73mw0gvzoKBWRsOElnJ?=
 =?iso-8859-1?Q?s63saset5JN5uZzudMj8USuPtHCuK5qlYYUFp7w5syidxkUEsAtafTij7X?=
 =?iso-8859-1?Q?x9MHrq3eu09M8TnGM5U43cv6oX8wDcTechtQ9M/TDNZQSffNh5DSo6nDo/?=
 =?iso-8859-1?Q?brZd0+1pjJ8NlHJ4r3bMJF//VKpWcGekLW70GZaYLR7eqm0z92ahCE50b8?=
 =?iso-8859-1?Q?bI1sIVvWwEtuaQv7Fb4+pEAYLalnIqw7mBiT0YX8DKVSpTQXpGMXkXROJi?=
 =?iso-8859-1?Q?tguE6maoHev0AUlVtgbWv6jrr+jj9qaP38NIXIK7gvRE8n36iVlryz2GEO?=
 =?iso-8859-1?Q?E3IPEJXa/593S1dTx8VZY3hLU7h96p85eoYtDzNV7Ln342GOoR/Adj22lB?=
 =?iso-8859-1?Q?bG664OIqP6D4kAfcsVp/Vixlb6FgttkxlXZ2bP7UBkEq06Mp8B6lst44sL?=
 =?iso-8859-1?Q?db70238aaaD/CLzC9D4VlPCVmN0YiT4KhTttJft3sTA0x/0gdmIt86QVQf?=
 =?iso-8859-1?Q?0olV2j5qW6sxr8YPZI537a4B0nZCdyKQoaPtU6E/pydf4rtFoEfk5CoC9Q?=
 =?iso-8859-1?Q?H3BAOvhRiYCesxhNCIwFvzlAx6hjxpuSWfMvGYXUtMAt7rW9RbHl1jtfev?=
 =?iso-8859-1?Q?nYtuPTIpEdNtZP44zymrugYwHPs5Ch3kZYuTxrPlu6JxMTelTvUpWtO89O?=
 =?iso-8859-1?Q?4+NyMKgX7ojX2cm3CrKaZj43k/aL+RfTYBUWjJEDybA9csTI6hb77XvWm8?=
 =?iso-8859-1?Q?KvGJ5XTuBOoTVu05b+5l1n27qAvzuKPCijsiTJTr+dSsoJ4/EYR7slqIuN?=
 =?iso-8859-1?Q?MFXMCeD/Ld/YIXyJJGA04ciVNM0scdj2zGGXiz/2xWbE9a4QuxG/zVbBiD?=
 =?iso-8859-1?Q?ikbfLEJNruI8bdBxVj27X0/eh3F3DugydRvbE7/ypMdEB9dYHETa4cppOK?=
 =?iso-8859-1?Q?Yf56ChdsTgLtZXLBrIEatcwPy9MKwJz6tXokI4kIYXG4iyfQ5PqfSqZH0O?=
 =?iso-8859-1?Q?D33OhO3Almoq7LEO3wHfgk0xfd1ZGWBLDiwmJUB6Z2M4uPTOMraO6Xdqje?=
 =?iso-8859-1?Q?brCkvp/xETCk4f2h92BvfrDejoS583akHibbbVwzVamMBWoDcgllV/kooO?=
 =?iso-8859-1?Q?ziiZ8JCCk8d1NVsyD4v4hFQuXas7iq4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	R6gtf6O4vHeLKupiJMG4jBpBNLQLY4NVW818vkwJe2eDgUOc48H1EfyKoCk/AiCQ4AGN7Fhfbc+eSY/DINTucjxnl+7Ir1cmsPH+6PjsBi3Nq2cQb5BfSxKwloLwdGB8tbPxSw2L+B5SrOQqmMC97KRSIuwkioGjyRwZaDWSPu0/hb8ogz6P1DCmln7P9OsNvm8RAguzEq6ftImIEmo8yw73AEOtiHa5WlZ8tlgeEyGL1DAfYUuaZSI41l0pl8Rz688VkwZrYJ79imS9VfS2JudM16dqFBImi8h5QPX+GbF8J59vskO8pBiRPvXck17cJ/N2s81yJiceoPCKHr8K6w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kGfImyJcasB9drvPxGaVERJ6lJgiixyBtIMB8kVlNtpPJwi9wPt1ZTPoizeH/A1woR/5/3qMGsOWZmc4H3Ca99S+2qQSVfrniknczh2SBaP864l3tZNalNDGjQdC9Ata6baJgCHTVNCUWpsDEAmSWnoD3NReNYWAAg1FAKWTUJU931tgmOO8qorgTre5WVhYKCZ28J8UPylpIDb1pJa++KM1HzxV8BGaijKhl4AdiaDrDv6/nfMDnhdI7ltA3hsJ+bUEphCG+NRaBeHGZKU7M8wz/oHyEqilGtBK5a5dHpzEnrgV9nTISzNdkLTsvJuqX4MfqisrNaiXb5Nvl+JCeKImliT1Wqn4gpfcmI6DxKIdnUKXxjslFstz6ScXc2vbr6oA2pLCr2DLBQdx7/CLoN3Ch26k9YW8kAk/E+JoLtR49pbjA3GZcE3Omt4dOz3F4Ix01hofqXA+ur2tVa5jYLlrFRvBgTwf6b4sHKNMeuwoVLksoY+7J06JebFZ3EuBK7FcbpPSg7N4gLXe7bNrBNFmPdelMiPDUKGOu/xAgzS/k6n4DuTpBidNgAZz9nDBUw1RjzyrC4JWuBBdiu16dvdYTY1gvUmrVQc0cRgRlFM=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a476b89-1a59-4d95-29d5-08df4c6f34bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 10:14:21.9310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FH8mWvNUBXnMYNGV4XzUmFTuudfRw+lHibDICvqyDqcVjLgaO3OHFGq8Y+75oiECS+f8SHb8g3MoCMTUKGV8HgnDFkSyvXim14FpOpmtn84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB11359
X-TM-AS-ERS: 40.107.51.126-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-30346.006
X-TMASE-Result: 10--13.688500-7.000000
X-TMASE-MatchedRID: ujgZRN8RQFOK11wqj6Pyo1OLy7rRXaBmE5QpfytbqHGO06yKU0pqA7IZ
	G8c0DCJeDDbp/UbYJ1MfDOXXRVuDk+yqSEMnDCYinRTJpY7VAKfi8ghUJg9lgfXgOYCe7IMPvdV
	LOIGpI2bDD8nIKIAif5IfyqcH9mYZL438Dpufpk/HsH7t2PqYsFcZWcaHu3QWuH0X8ZTfo0GKda
	QxmZ0hcEKVzzaKe4kbMhf2mvgSdBrLULYDu+Fb7OT5AnjO7TXtUd1JKREWJmTW6I4Shu1jquihC
	Tu0kel4rOgtKN46VjcLgXaeIFHdZeerSjt0aAEbgngGSNsNcydaOxpgjiWHdTudE/QO+BwrthRF
	AcCnfMrd7bP/BLYr+NYgufRa9c3ts4VVx0PVCkEI5tTAN4sn8UzFnT6N+iLh
X-TMASE-XGENCLOUD: e26a8032-ce8c-4873-ac15-6868e8fe838c-0-0-200-0
X-TM-Addin-Auth: 4lSsRWGOH7OAYje6bUo9MCqwLJQiWLhnRbBCepFJDiDnvgLxoTI3zOLlaz+
	Nfx1tEYQSbKVS6sq/VuO+aw57fP/cfISQYeLVNRD0+q7J/3Jaae29W6ZYonXw5XPdgK5CPgb5Jn
	mTj7LMJ72WgFoxL4W2IgMqt9dvJXn+e1SSvOp7xlqlHhCnStM/pErziJYSmCFoa0WTP7jvuiGz+
	y06+E3Udl7i3bYbUXev7lgwcfXcFQPPMja/ktzrYiIPMETLpOvRanU2cISg9uiMSgpENUg7ch03
	3F3AxcwtzbGASN77AKaKjajifa0swcZhkvA3J4/ltRhu0uEnXjgHxe+Rjw==.IfMPvFpUuMtpt4
	C8X4HczGuttdsDJm/+aRA9mARyggX8bR21Cua8aOzvHZJdPTU3oLHecnFDprg8IhmkDwLuJ5Qma
	QTAr8QKlL7GTOqpisl3EEDFHr6XALTvjT6cVwm2oqwFngwXj/l/7G8pEJi8bp4AdoPiyCaWM2Jf
	21SbAtbfpEXSqUJvM7PlkRva9VD1nccKnjOsQP9cnX9r8Ac05X5s1S+rfi346So7EGxv4LC9d1S
	zt8mzYIY0Ru5IjYoOpX7GYqihilHBBE2+kgm7jBbfP13WTEc0jqQXH+VbQrVlgde9XU3++IMPg4
	RHDOCLuh+qchVoyzTipQk6Gzns2A==
X-TM-Addin-ProductCode: EMS
X-TM-Deliver-Signature: C34E144560C110583159BC3C7F72F266
X-purgate-ID: tlsNG-bad1c0/1795774470-3A6DA034-A77329BF/0/0
X-purgate-type: clean
X-purgate-size: 1844
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On RISC-V, machine_restart() ignores its delay and powers off instead=0A=
of rebooting, so a panic's "Reboot in five seconds..." ends in an=0A=
immediate power-off.=0A=
=0A=
Patch 1 implements udelay() using the time CSR, as Linux does. Until=0A=
the timebase frequency is known, it returns without waiting.=0A=
=0A=
Patch 2 uses the SBI SRST extension, when present, to reboot after the=0A=
delay. Without SRST, it falls back to the legacy SHUTDOWN call as=0A=
before, now after the delay.=0A=
=0A=
Side effects:=0A=
- A panic that recurs early in every boot (e.g. "-cpu rv64,svpbmt=3Doff"=0A=
  on QEMU virt) is now a reboot loop. "noreboot" still powers off.=0A=
- A panic in the RISC-V QEMU smoke test now reboots until the test=0A=
  times out. I can add -no-reboot to its QEMU command, as the Arm=0A=
  smoke tests do, if that's wanted.=0A=
=0A=
machine_halt() still uses the legacy SHUTDOWN call. I intend to switch=0A=
it to SRST in a follow-up.=0A=
=0A=
Tested on QEMU 10.2.1 virt with OpenSBI v1.8: early and late panics,=0A=
"noreboot", SRST missing or failing, and timebase-frequency overridden=0A=
in the DT. Not tested on real hardware.=0A=
=0A=
Anandu Padinhare (2):=0A=
  xen/riscv: implement udelay()=0A=
  xen/riscv: use the SBI SRST extension to reboot in machine_restart()=0A=
=0A=
 xen/arch/riscv/Makefile          |  1 +=0A=
 xen/arch/riscv/delay.c           | 17 +++++++++++++++++=0A=
 xen/arch/riscv/include/asm/sbi.h | 11 +++++++++++=0A=
 xen/arch/riscv/sbi.c             | 21 +++++++++++++++++++++=0A=
 xen/arch/riscv/shutdown.c        | 10 +++++-----=0A=
 xen/arch/riscv/stubs.c           |  7 -------=0A=
 6 files changed, 55 insertions(+), 12 deletions(-)=0A=
 create mode 100644 xen/arch/riscv/delay.c=0A=
=0A=
=0A=
base-commit: 4565af21821a005e8b2e39871c13a4c81c7fb736=0A=

