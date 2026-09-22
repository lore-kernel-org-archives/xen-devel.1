Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB124C98307
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:40:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429018.1651961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fb-0005iq-9d; Tue, 22 Sep 2026 14:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429018.1651961; Tue, 22 Sep 2026 14:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91fb-0005gm-3k; Tue, 22 Sep 2026 14:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1429018;
 Tue, 22 Sep 2026 14:40:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x91fZ-0005TY-KM
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91fZ-00AHxl-10
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:40:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2934d-bab6-0a2a0a5309dd-0a2a4506e4aa-30
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:28 +0200
Received: from [40.107.159.85]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ab2935b-195a-0a2a45060019-286b9f557f3a-6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:40:28 +0200
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 (2603:10a6:800:33d::10) by GV2PR03MB11837.eurprd03.prod.outlook.com
 (2603:10a6:150:36e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:40:26 +0000
Received: from VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04]) by VI0PR03MB11419.eurprd03.prod.outlook.com
 ([fe80::6717:e4b8:c376:4a04%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:40:26 +0000
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
 b=Bb5HSoGBKYf41+2fpiu2AOe+eAgoee3Tkdu3NpF10DSloMVtg497v1M4vkijxGVrfTuZto7/+f5oQHzp3ajPdoLF7SVPiGm5x26/xZFW+WEqsep2EifMBU24HmnHpuA7P95k75QfhK2LK+ebWjlW4EmPo4UtG+dM5toQEur76VU2hd2WfE+neGW0gs985mcsR+Wgub1VxNlZuiyQqgNM2GTNQCzrdVidOe9Fg2fwzRr7Oo4tPPKodZapB6hAftiJlCLKzNa1oPwGKuxTnZEGHxZk5q1OHTLg4oeZYAOynAtI/krkHMksorqp6BvSghC73AMKf5ykxW86R1Sg1U7jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XV5f3tUGW+mzcug+M+p3lP5Jfj6Y79rIFmhgwSn1QeI=;
 b=mv5GQPFp/AoFRT4KSbZcwUz3Pe4LxHPQvRHiYjzlkvScNEs9AX3japXGsxG0geIGYYauEFdGq+lhC6wpg8q8IBpGMrgetKoNeynku1UGieq674tCCKKE3Rmj8c/IGneW7C2JmmeHx1+HrUzXHnbcGEMn3Cg8nzGRYTGvS+ImuE44GkLaoboxYZxFEJN6+8wE48utI224QzuNq7QWGcuTgOX5mt9Y96+1XE3fB4wHy6uFPgs2RKcj0iFla6dnWTz3k6dwvmmeJ63IpP+4a/AzVEv1OXslKIWPJLj12xYkggcVHSykwLRNmtVcewVV3Pz2yeShuLSsXKX9hFQ5qY5vxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XV5f3tUGW+mzcug+M+p3lP5Jfj6Y79rIFmhgwSn1QeI=;
 b=I4uVZuLmx76+OQh8rILX5k5C/s2GXbecv3RPj0hONQ8Yx1gslFejvkrYulr04xNWmqk/GgVCKG612N5EFXb0Pg/Ga6xGgL7PFjIPuu5nN/EnRxN+7z+8y6hr0laIY0LyYTOdb3rtHXcKbSTTMgjtt0hAKFSe+3lrO52HnEm/7cPNqjwVfhZ+LFetoY6mgBii6f+EXSI4ibcXJ61w6jHPFEnEBeEWeCWJ/sTgFBFoRi9YMu3pZJ7XMlTq2QVKPhKIavkeByLzhIHGsPiKVhf8wjAqyQEmwLxE5wTld33PLHy47TMWymLK6zW1rEA5LO5nu2r7z6zHuJ011JQ5XyyC3w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v13 3/6] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v13 3/6] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHdSqBNWHTiy8oSrE+yfsv9Eam6pw==
Date: Tue, 22 Sep 2026 14:40:25 +0000
Message-ID:
 <89957e49342282942cfe923357287ff63d550cf3.1790087968.git.oleksii_moisieiev@epam.com>
References: <cover.1790087968.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1790087968.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR03MB11419:EE_|GV2PR03MB11837:EE_
x-ms-office365-filtering-correlation-id: a16d2b97-1553-48a0-8e15-08df18b770da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|38070700021|3023799007;
x-microsoft-antispam-message-info:
 ZG59aq88gfqRBKGU+BiIDiWGzdF0CFuY3Um6obR6tWm5yaNkOG0TQtIv8GdWVJrj/31Jd9Ra2wNjFP7Vd5biC385Dh9qqyatlbrHYUGQHjlrYq5Epj3x/7kAcxfBJ+nAdS53FlD6bGEInhUBM2N9zQgT859AWZdKB83C/XlHin3TJnE1g1aOrB9I0whhNl/OaJxo54NDkv78UOIL/bwZZ1Y0yhi768Lcae8uSzuCWRYpMO+fFZu1AFHGbHcHVNzf8UlY5Z85bgc8YeD1z2TkmKAJcQep5ScgpL0pCSW0iSBGtOp8d6bIqUEDmic1vcb98/3h4PDfgNjWoUdqGiYI6+yaSTXxkeAL8ppOAHmEM6ibbAFAfOlYRdhy7Jh4wynAtW2tJZcRS2O1MHT4ZYhN4Tp9cCsepqDmbzldNrTqWpjBGuU5Wlgj6YEDdmg9zN20F24mhbcm61tcrBgvHWNkbYG8ce93fx0raccFWYMOwgwGFrg0VXsw0QGaNTHnZvhp3mNyVIrK9UzKmZRpuB9D7tFayJPa58s2kPFR+1bX4QETmIwnqdVWjEfd280iAn54iAVsjHZ3e7O0FP6hfeuzNQoz+vcF52g6iGLTBKbnrdlqaxMOHda5Zxz13LGrihCwYmCXdTMC1uAexL89jKn1YAfHrkzt6IB29Igv1514X2dwTcFsBkFzwCZTHJJKY9eOVAkNoTtDh4k1nhUBnZdu2l5b+8NnA58YjaFv9r44r3s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB11419.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(38070700021)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8LgwH6S6CAqJuA09iLrAmV6pZ6T/z0zr2Gxo0fvdX1KNWc0hW5D5EJwnIn?=
 =?iso-8859-1?Q?QiuFo83rXy/oNLQA8kkzAVmv2YF7FaEo5XvNnqNNRYssX1u+zMCuMu2wrg?=
 =?iso-8859-1?Q?0NKo7vszqzizAospCSybHAf/Rxn3QN6CjTlwqnKvE6dt8+cvzVb6OoceDl?=
 =?iso-8859-1?Q?DirbPunAIaTWu9Ig/cCwM6HNz3Xk7Q0i6mjsjn9/TSL5Jwm8+mmPXtxi+9?=
 =?iso-8859-1?Q?/VpZ2UzUWG2FUgoNNewvofANb3rWmOCf0CJbgQf2nnW7iX+aen23/mN/3V?=
 =?iso-8859-1?Q?JMBd7YcRDjpm/714tQXxWBIEDvIW3yj4fR3z4dVUgPDnaW985Vc2/Bi53e?=
 =?iso-8859-1?Q?XnlOE9LcbdyVKL11s4QS3Gqr2m2zFm0Mts3PTdWREMfes88kByeps5UQZK?=
 =?iso-8859-1?Q?ZLFMNGZdXS8NIgwsF7Q8N7HDqefvJdUGRrPLq7m63OvogjFrssa8LJX3kp?=
 =?iso-8859-1?Q?A0xt/mbHM1ABrSRXhUUn2dHUFhdWdIXPirMtf+U8YEn00otnSNfRpwDH+q?=
 =?iso-8859-1?Q?w+BruBptcqvmKIkVUI5mNBmzwwFkZHP9D6HFf9yKPKbyfa6fqNxnxKq+yS?=
 =?iso-8859-1?Q?Z/R64P1/bHbYJRBC9FTbhJj8aD01gq7RCwYQm3dY5N5madnI94HFK6Uipb?=
 =?iso-8859-1?Q?/EPL2zkTheHZu9nQuz/1386a+/dc6Nml4GqwKEge2oCpIYmTPhJhRyyoCo?=
 =?iso-8859-1?Q?wiOPcACZ+chaZsCj3FGnA7CwbA3r6wRG059al8WMywn9X3hV5Z2n1x1Zfo?=
 =?iso-8859-1?Q?eLTfj20aKH3GvO6QRsekOQbCorgDfh9C5cHs97olwP0iA57NfHaauO7pVd?=
 =?iso-8859-1?Q?1uWYY75/6+K8yITOm1xl9wl1BdbKLnyIjnz6g1PhRMHCrHz2KobtwcaHMy?=
 =?iso-8859-1?Q?c4X98R266ipJj6qC2R1WBlZmF+Y3hiAyocB4jXenw3M4ztQwec3QYgbhe2?=
 =?iso-8859-1?Q?yihIcW8v0sC3c7PlMDoY6PhHJM9B6f41pLjWzZyY8YvDzNQorhSpthvtHg?=
 =?iso-8859-1?Q?01rBV0VJC40hzmDNh1+BlKaoDEtSqN8JGwh6WddWvM/+6lqATS9fei0PBF?=
 =?iso-8859-1?Q?QAU/YG8Ka87KPXH+TVHkzlxSt5THnfkek+MuvxNXoCUYdhXMw9+DDN3tBd?=
 =?iso-8859-1?Q?hGSnKdTQcZNbmKacT+M1uwV7YPcecTFuTROY1n63+7d5CKjgn20ru0NgH8?=
 =?iso-8859-1?Q?zMzSdvFrZEBn3PUv+iKyEzs3OeTKQk238djhgI5TmzJlFjJUnUvoeU/6us?=
 =?iso-8859-1?Q?R6ftj9bpJLuqyISPDRbMFAxwoRzcsMv4ouM907hlTKPhEvtehZCuPkszOb?=
 =?iso-8859-1?Q?IVz5s6ZJRgAEjxVyvtDt4jrEtfZfq3BEPBce3gnDtzxWLC625w03JVH6Rj?=
 =?iso-8859-1?Q?CMZc+cY2WNj9vYH1Se54m4JMbYqZnjk/HPwjjhQ+9PeLUuCTL5GUYtgSul?=
 =?iso-8859-1?Q?Q+35FBcsMRCqR+zPGS0t1v/4CTFLh2L39mSp5reXJjIRVzqkpkjwBIxqTP?=
 =?iso-8859-1?Q?eog29FY+KX+6u+GkkHH8IZeLTtqc+SSAhepyP/1e7PH/kiBqNqIYgUaSN9?=
 =?iso-8859-1?Q?Up5Zhi+dktQYi6DbONfN6hW6AheLBohAjcGEiJvw3kGxp8NKjPX2ptlmPM?=
 =?iso-8859-1?Q?9+DT13QOBFhsEWpPx83wx3qbw9QTZ+gM3GI2V3D24lwrpeds78Ssknzd/J?=
 =?iso-8859-1?Q?h/M4RYxS6/fsMj4KYRurqExtnf3i5gbb3sqrH5tgAA0ScVBEf1yrhgkH6r?=
 =?iso-8859-1?Q?TafXkONsZxAdy30e9ybdXMKm4/D9/PJT9KeMgVxEbybc3mz60cF10Dt+gJ?=
 =?iso-8859-1?Q?WX6vK7+XkKANt4LiCVZIEHaSJCOkWCE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB11419.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16d2b97-1553-48a0-8e15-08df18b770da
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:40:25.1077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lScBOep6x0XJOGqiMZP4Sw4x2LhCMFj2+KUecP/Pagmgn7TyC/OoWd1mtZtYdcQ8cTae7ylcfI35Nka2Gdgi4zGcL3najTzyxzoQOfeAQck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11837
X-purgate-ID: tlsNG-16d1c6/1790088028-1F6C877B-2F8E688E/0/0
X-purgate-type: clean
X-purgate-size: 10146

Introduce memcpy_fromio() and memcpy_toio() helpers to copy between
regular memory and a memory-like I/O region on Arm. The generic
prototypes live in io.h so other architectures can provide their own
implementations.

The helpers copy a byte sequence: byte accesses are used until the I/O
pointer is 32-bit aligned and for the trailing count % 4 bytes, the
aligned bulk uses 32-bit accesses. Only the I/O pointer is aligned, the
regular memory side is accessed through get_unaligned_le32() /
put_unaligned_le32(), so the access widths issued on the I/O side do not
depend on the alignment of the memory buffer. These _le32 helpers pair
with readl()/writel(), which are little endian accessors, hence the byte
sequence is preserved on either CPU endianness.

The constraints on the I/O region are documented next to the
declarations in xen/io.h, the arch-specific access pattern next to the
implementation.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---

Changes in v13:
- memcpy_{from,to}io(): align only the I/O pointer and access the
  regular memory side through get_unaligned_le32()/put_unaligned_le32().
- document the contract of the helpers in xen/io.h
- reword the Arm implementation notes to state the concrete access
  pattern
- drop the incorrect claim about avoiding endianness conversion from the
  commit message; note instead that the _le32 helpers pair with
  readl()/writel() so the byte sequence is preserved on either endianness

Changes in v12:
- Add missed R-B
- correct the Emacs footer of both files, which asked for 8 column
tab indentation while the code is in 4 column Xen style

Changes in v10:
- removed extra include in memcpy-{to/from}io.c files

Changes in v9:
- reword commit description to refer to memcpy_fromio and memcpy_toio
- ordering obj-y in Makefile
- rename ALL_LIBS to ARCH_LIBS
- drop io.h and move definitions to the common header, fix comments to
be arch neutral
- update comments for memcpy_{from/to}io implementation

Changes in v8:
- switched to ordered accessors to address the ordering and barrier
concerns.
- updated the documentation to match the implementation and explicitly
state the supported access sizes and granularity.
- rename memcpy_* implementation files to memcpu-* to follow naming
convension
- fix indentation to match Xen style
- fix intendation to match Xen style
- move memcpy-{from/to}io to more convenient library place

Changes in v7:
- x86 guidance: removed the speculative note; header now just says
  each arch supplies its own implementation or macro.
- name spacing: dropped the double-underscore; the helpers are now
  memcpy_fromio / memcpy_toio. The header also explicitly allows an
  arch to define these as macros before including it.
- updated io.c to keep 32-bit transfers safe on arm32
- moved to __raw_read*/__raw_write* accessors to avoid endianness conversio=
n.
- split the helpers into separate compilation units

Changes in v6:
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c

Changes in v5:
- move memcpy_toio/fromio to the generic place

 xen/arch/arm/Makefile            |  1 +
 xen/arch/arm/arch.mk             |  1 +
 xen/arch/arm/lib/Makefile        |  2 ++
 xen/arch/arm/lib/memcpy-fromio.c | 56 ++++++++++++++++++++++++++++++++
 xen/arch/arm/lib/memcpy-toio.c   | 56 ++++++++++++++++++++++++++++++++
 xen/include/xen/io.h             | 25 ++++++++++++++
 6 files changed, 141 insertions(+)
 create mode 100644 xen/arch/arm/lib/Makefile
 create mode 100644 xen/arch/arm/lib/memcpy-fromio.c
 create mode 100644 xen/arch/arm/lib/memcpy-toio.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index b7afd3e58c..e448e69014 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
 obj-y +=3D platforms/
 endif
 obj-y +=3D firmware/
+obj-y +=3D lib/
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index dea8dbd18a..009bb22c45 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -2,6 +2,7 @@
 # arm-specific definitions
=20
 ARCH_LIBS-y +=3D arch/arm/$(ARCH)/lib/lib.a
+ARCH_LIBS-y +=3D arch/arm/lib/lib.a
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/arm/lib/Makefile b/xen/arch/arm/lib/Makefile
new file mode 100644
index 0000000000..07a0d9186c
--- /dev/null
+++ b/xen/arch/arm/lib/Makefile
@@ -0,0 +1,2 @@
+lib-y +=3D memcpy-fromio.o
+lib-y +=3D memcpy-toio.o
diff --git a/xen/arch/arm/lib/memcpy-fromio.c b/xen/arch/arm/lib/memcpy-fro=
mio.c
new file mode 100644
index 0000000000..98339a5cfa
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-fromio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+#include <xen/unaligned.h>
+
+/*
+ * Arm implementation notes:
+ * - Byte accesses are issued until the I/O pointer is 32-bit aligned and
+ *   for the trailing count % 4 bytes; the aligned bulk uses 32-bit
+ *   accesses. No wider accesses are issued.
+ * - The access widths on the I/O side depend only on the alignment of the
+ *   I/O pointer and on count. The regular memory side is accessed through
+ *   put_unaligned_le32(), so its alignment has no influence on them.
+ * - put_unaligned_le32() pairs with readl(), which is a little endian
+ *   accessor, so the byte sequence is preserved on either CPU endianness.
+ * - The I/O region must be mapped with device attributes; ordering is
+ *   provided by the accessors themselves, no extra barriers are added.
+ */
+
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        put_unaligned_le32(readl(from), to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(uint8_t *)to =3D readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/lib/memcpy-toio.c b/xen/arch/arm/lib/memcpy-toio.=
c
new file mode 100644
index 0000000000..c0be79586d
--- /dev/null
+++ b/xen/arch/arm/lib/memcpy-toio.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/io.h>
+#include <xen/unaligned.h>
+
+/*
+ * Arm implementation notes:
+ * - Byte accesses are issued until the I/O pointer is 32-bit aligned and
+ *   for the trailing count % 4 bytes; the aligned bulk uses 32-bit
+ *   accesses. No wider accesses are issued.
+ * - The access widths on the I/O side depend only on the alignment of the
+ *   I/O pointer and on count. The regular memory side is accessed through
+ *   get_unaligned_le32(), so its alignment has no influence on them.
+ * - get_unaligned_le32() pairs with writel(), which is a little endian
+ *   accessor, so the byte sequence is preserved on either CPU endianness.
+ * - The I/O region must be mapped with device attributes; ordering is
+ *   provided by the accessors themselves, no extra barriers are added.
+ */
+
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel(get_unaligned_le32(from), to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb(*(const uint8_t *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/io.h b/xen/include/xen/io.h
index 164a20c5d7..0b60be27c1 100644
--- a/xen/include/xen/io.h
+++ b/xen/include/xen/io.h
@@ -67,4 +67,29 @@ static inline bool write_mmio(volatile void __iomem *mem=
, unsigned long data,
     return true;
 }
=20
+/*
+ * Copy a sequence of bytes between regular memory and a memory-like I/O
+ * region, e.g. shared memory placed in RAM or SRAM mapped with device
+ * attributes.
+ *
+ * The I/O region must behave like byte-addressable storage: it has to
+ * accept 8-bit accesses at any byte address and naturally aligned 32-bit
+ * accesses, with plain byte-storage semantics in both cases (no side
+ * effects, no dependency on the access width). An implementation may use
+ * any of these widths, but never wider ones. The helpers are therefore
+ * not suitable for device registers with access-width requirements.
+ *
+ * Neither pointer needs to be aligned. The access widths issued on the
+ * I/O side depend only on the alignment of the I/O pointer and on count,
+ * never on the alignment of the regular memory pointer.
+ *
+ * Implementations are architecture-specific and may impose further
+ * constraints; see the respective arch/<arch>/lib/memcpy-{from,to}io.c
+ * for the exact access pattern.
+ */
+void memcpy_fromio(void *to, const volatile void __iomem *from,
+                   size_t count);
+void memcpy_toio(volatile void __iomem *to, const void *from,
+                 size_t count);
+
 #endif /* XEN_IO_H */
--=20
2.43.0

