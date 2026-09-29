Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A454CA5FA1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 09:03:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436338.1655045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBTjw-0007Ec-47; Tue, 29 Sep 2026 09:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436338.1655045; Tue, 29 Sep 2026 09:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBTjv-0007EU-Vk; Tue, 29 Sep 2026 09:03:07 +0000
Received: by outflank-mailman (input) for mailman id 1436338;
 Tue, 29 Sep 2026 09:03:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xBTju-0007EO-Qq
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 09:03:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBTjt-00D7oy-HP
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 11:03:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb7ec2-e002-0a2a0a5209dd-0a2a4507bee4-18
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:03:05 +0200
Received: from [52.101.65.101]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb7ec8-b4ea-0a2a45070019-346541658a7e-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:03:05 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by BESPR03MB911500.eurprd03.prod.outlook.com (2603:10a6:b10:10e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:03:01 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:03:01 +0000
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
 b=EvUkijEd+kAejbJXyTTLglW15fuOCveEXRSK/JMtgHmuQITRBvQ9pa6YhSnmWDAEfhtLA2NIDAI+6eYhdu5CUsxfd/FaKlz2ZRTzgKcn9TiYZf5L7uzlOyPPfOwkHMip0LPcCsipYdRAxrWnJgWIJRZozU7xIDVE3PGyGX03EI0SE097/7U8ESoRtFkia617zPLlgDMw/3YzX+e6ky6bELoWBAP1G6OdHmbyKNNW6EeFPegJIBy8DUauF1Whq88MH6ILVUFHmFNvnc59fkHxeO8sEAE4JjMfS4W+MXpUgyGIsb/IUiSie3SWOFOffYKsiies91ghDHIr3ykH2d2M2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fafAK153eg918SSKENcO+oeH2Sl9Ie+i4cRFh2vgOvE=;
 b=ob2b87mRaUBokdTEMJju4vOea3TbFAbiYlLZl5uLrPWXd+P1mBJQ1cWmF99rSKqQ1CF4zmfz5+P6J9yCNwVe+hC4DsxvJVTSIKBOSfSjfHaO73DsHtrkVJY7L5R6Y2E2UucNG8J/OhWHowVGsuWhYu+nBIHYHFuRG+mp0L1o3MxGt5KmOORolbzGY3E+W4zswcpbNmD0sDay/MIeK8x2o/W1nILPjgkrMM53EUPyfDQJiorhnCClzrW+8KWUIh+pObOXHZq8r6BLQI1tqbp7AQ8B5B4fZOqpDFz3LuCkiAaZaQGSlkvB9zoVcQXCyp9PODjV40b5M3s8PkSAz5zyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fafAK153eg918SSKENcO+oeH2Sl9Ie+i4cRFh2vgOvE=;
 b=nH3AS5PCK8znLHXoQTLC2QkNdiknb+pr1G/lPTxZVE649tJIf81skG6PNWL77J2IGPobMipGGOMJRR8ouA2BjFU7HHsBRC+vxnl6gASlAK2cdAza03hH1lfWkHDLI4jGuDgtkECaDNy4g7rE481nNm0B/X5LcXYbnxqpybC8Qsau6Zg93lluWdHBpiEMfZmT6Iw7ATxe1CKEbsE2gE93imnVLggUjN//dUfSps5NWo5LcSTCZcIZvBHy7582UTzxgeIwhwdNBN52+jOEb16B5N43QxK8z7xgHg4t/WUHfdX9j6iy0ueSLAtVMPlOKPQuWVM+/23ZcCMvq15JX7YUDQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH] misra: deviate C library-style functions from Misra C:2012
 rule 11.8
Thread-Topic: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
Thread-Index: AQHdT/FUuEZ9j2ZjeEWRZmF5vcrM7g==
Date: Tue, 29 Sep 2026 09:03:01 +0000
Message-ID:
 <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|BESPR03MB911500:EE_
x-ms-office365-filtering-correlation-id: 68b633e8-c311-483e-4f19-08df1e08772b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|42112799006|38070700021|56012099006|11063799006|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 5JRoIF+YyTyWT86LJjyQ4uzwTMcLHn5EEtP6C+KTUUVIUt8CugzlqrrvNh5A0RO40531DKmiPPn6Yof2QjztZ3h1etexbF0b4Qb4N3121SEPC9czC5lX3kspaz14ffBTKehh0xDzpCLbzjXs91ASYZNTtYNxLFRft78SoAZWK5P5dvCCJrt1l3UvG4Z3mcue8+escWHFBXs9YSeZG8/Ebh2SOpz85HgwGpjqqUioRLhjR7JQZFfpOGgam2pgd6GWEt8TxOotWQelWvPeozkzMj/LnJ5UdPjJxZevGFMXLTpzen87/bssPq6pHxGrIWrhIuZT+b352htxv5VLPtB8uqtx8rKcXh9xuRp2S+utsdF8pkEbUvH6GgXElYfYExWD6qt6knW1z3oBkbwQactJAgBql7vk2ZP3BaDY/CcOBKk4C2vI8xGWjnbBU2FZPuEwT+4ejQV0sOyMbjU9sUSF3KkZWIU80Uh7xxiIZ+eeYPpYWDBVISlqIiWpx4cBkzugUHneL1JXwicy8Za+jCl6rHWxmsZByF6GHZ4FCifnpLOa+exV2Eum1NXAm/ODr95k0XMM7l9x7UmbKq1ckK/Eh9UTL7dMPvYA2QcIXjthuqfKXedUrA5pUhU6nS/dlanP4lHvCx8jhiZPvBS50P/NFocNflDReVgpcYg2WQco5DHV99AAVNWg2dmCPsdyy0xkSney7bChUtdIj7nLp6/kocNZYQFlucfZlTReLQQzoAM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(42112799006)(38070700021)(56012099006)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Nx6rZ/yOvRTAjlmmQzUULc0RpB+7gYvLTaM3uhxlvQ+hIPr8d7uie0TF4C?=
 =?iso-8859-1?Q?Boz1ZWVs89VUL8IdR3Lk89+BvRo8lKs9SkCSzbmkLuWPs3xGWgVXbkGXh7?=
 =?iso-8859-1?Q?7NE61+aHNtFrzwK2Vj75xFtQ4jWAA6SbOYJzh4ABCK7KsYL2HH4bCYuRoW?=
 =?iso-8859-1?Q?iZPg+715vG8kX1cgYDVq7JZ9s7Wu7gS9BCITdQ387qDnJ+s/pO1tXct55F?=
 =?iso-8859-1?Q?+jx31dJfj0pOy4QRIVKutf7bh5ny8hsxVkIj67TF8Vrz9/44x7IsAt25S6?=
 =?iso-8859-1?Q?HGpkqR09kTHsojJMknOZ008o8n6oAYetleWOar04Mj/PIMq+RZA2tNmsCd?=
 =?iso-8859-1?Q?Z9rpZv9dBdM08j9aH7y4pGWA7E22jfT+BqgzY+ICE1HcK3hBHMvg3dJYhh?=
 =?iso-8859-1?Q?bxEdyQsujFo25ZbAUPv0wA+1GzrtQAfhnglu1NfPjU8Ej5XiNvr1sblspa?=
 =?iso-8859-1?Q?fjpHJuF5nmmx6vEgdiu4c9YfcMi12pgFUhlKuO3I85I5YFeOSahhbGWYmi?=
 =?iso-8859-1?Q?5o3tyhL92glx7dfOdM8kyJvr/ZgKySvMLZf5kG5S7dJY+sJTyWt/JidUXx?=
 =?iso-8859-1?Q?i6yL3Kqe2lbuP585uvuQSAcHa0iYgu/ZiKNny4Nsid56rqglbVrdogRCug?=
 =?iso-8859-1?Q?X/VIr+5AK5BvSIQvbp/9twgx7AvFj/NWRLhmpc6JtpqEojKS8ht762cP0P?=
 =?iso-8859-1?Q?fAJo8cwiHfdIZuv7sAPNJYduLMQmWPYto7YeEb61qm3d5pxJNNuCOkt10g?=
 =?iso-8859-1?Q?CARRtz+R9tKoStOxCmBmBzNkv/4vV0AM972VnlhX5dUy6iN+pmdXxsayyp?=
 =?iso-8859-1?Q?/qMpvudmp0E4KzSg72bteIbbPy1AyzIMdp9wUtnTANrWzd3tjTwnV8Qn0L?=
 =?iso-8859-1?Q?kaOxYBjsOL9nBPQyM2GdsH2o4jRiyR228BCfYthWWIouCRxehDbWOGXdjs?=
 =?iso-8859-1?Q?8i5Hrg2FATDuWkw0KWNwBDDLMmw+XsegXO98UTbp0vzegkC0K3K3REap6O?=
 =?iso-8859-1?Q?eGSGMLHvKdbbKy1hVjVVKnlRhi6GiNA2PMJeC7IDwEU9ysOpzl9sYwiHVi?=
 =?iso-8859-1?Q?tv4/BoS/DZ8XthyIvKXRwbjq5SsKec6nYKr3bAnRLNZSCJ9phVhXv5chw6?=
 =?iso-8859-1?Q?jUF5A8R6/MPeCH9YHrfNnvWbBigkuUBha81qZCsYNBtfFa26x2tVrAkOig?=
 =?iso-8859-1?Q?HePrPzYwcyE0pUV5TZ7O9zdS4aBq/xkuxNjpyMCxVvTiHynnDjeU0mBBYm?=
 =?iso-8859-1?Q?BoAcaTrATbKnceQYi2Rj3N3Cjnf86QhCTqFPrmLHVPg72VU4AP+VqjXuop?=
 =?iso-8859-1?Q?PP0iL0R2fkNr7QWgjiDMmfvVCQpfJUHO++cyHFafnRAW6luvTuWDudhFxX?=
 =?iso-8859-1?Q?4flYAvxTy+tH29HL/bIgdvnqqYxesQ9a4k0cuWxbISGyLQ0J9XkvAhx7R+?=
 =?iso-8859-1?Q?HCn4m34zmuwi+mBGOY+ggaSBn6A0R/o4LudXTpOzphfsSXUz8HbySTDRev?=
 =?iso-8859-1?Q?lX6Jt301C4AcrgrTo/TC70ERYnpnVATVfIfWT4kNC2Xm69B+mD3Fdubdb9?=
 =?iso-8859-1?Q?p6aVVyMXnwqlFhbAcmxy8pWwpo594KANDVCGul23rXhqo+/NSDNjjzOE3Z?=
 =?iso-8859-1?Q?Ihr7xvCBG9TnUqVu9fkv3QgabiGxfxMho4LoECy5uu1+AZ8ZSqvIkOMsI4?=
 =?iso-8859-1?Q?41LpbsYfJAl70nHWZZZ3dN6Fn2xvdu0oZWGwycQTF506+yBTBAFi2i2jFu?=
 =?iso-8859-1?Q?IB2HGBt1RR4ZLQ/kGtd4R+448ZjIaYHM+SfOe/bMnH7wvnrvrXQkdlzyze?=
 =?iso-8859-1?Q?o10vchLycEBuKNUqaojwxFOMrRsNHug=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b633e8-c311-483e-4f19-08df1e08772b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 09:03:01.7329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVq1TyGEnuMTZavQd0MnjiLCRufRfBi9Rp8ViHHjy4LI0JFRUmvUy6WP0sJyQcfsxvtCwdlslTvtY6rvcqHDgJErtn4HkD5t+pDlxi7LPJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911500
X-purgate-ID: tlsNG-ef75cf/1790672585-A54C3AE4-9D0A76B1/0/0
X-purgate-type: clean
X-purgate-size: 4199

bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() and
strstr() all accept a const pointer/object but return a non-const pointer
to the matched element or byte, matching their standard C library
interfaces. The const qualifier is deliberately stripped so that callers
searching a non-const object get back a mutable pointer to it. Fixing
this would require changing the public API, so document these uses as
deviations instead.

Update docs/misra/rules.rst to note that this class of double-use
library functions is deviated on a per-function basis.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/2892411430
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 docs/misra/deviations.rst                        | 9 +++++++++
 docs/misra/rules.rst                             | 5 ++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 33d508a2fb..0b87bd1d6f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -445,6 +445,15 @@ write or not"
 -config=3DMC3A2.R11.8,reports+=3D{safe,"any_area(any_loc(text(^.*__hvm_cop=
y.*HVMCOPY_to_guest doesn't modify.*$)))"}
 -doc_end
=20
+-doc_begin=3D"Functions bsearch(), memchr(), memchr_inv(), strchr(), strpb=
rk(),
+strrchr() and strstr() accept a const pointer/object and return a non-cons=
t
+pointer to the matched element or byte, matching their standard C library
+interfaces. The const qualifier is deliberately stripped so that callers
+searching a non-const object get back a mutable pointer. This use is deeme=
d
+safe."
+-config=3DMC3A2.R11.8,reports+=3D{safe,"any_area(any_loc(file(^xen/include=
/xen/bsearch\\.h|xen/lib/memchr\\.c|xen/lib/memchr_inv\\.c|xen/lib/strchr\\=
.c|xen/lib/strpbrk\\.c|xen/lib/strrchr\\.c|xen/lib/strstr\\.c$)))"}
+-doc_end
+
 -doc_begin=3D"This construct is used to check if the type is scalar, and f=
or this purpose the use of 0 as a null pointer constant is deliberate."
 -config=3DMC3A2.R11.9,reports+=3D{deliberate, "any_area(any_loc(any_exp(ma=
cro(^__ACCESS_ONCE$))))"
 }
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b048309596..e3ad3545bc 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -427,6 +427,15 @@ Deviations related to MISRA C:2012 Rules:
        readability.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.8
+     - Functions bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(),
+       strrchr() and strstr() accept a const pointer/object and return a
+       non-const pointer to the matched element or byte, matching their
+       standard C library interfaces. The const qualifier is deliberately
+       stripped so that callers searching a non-const object get back a
+       mutable pointer. This use is deemed safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.9
      - __ACCESS_ONCE uses an integer, which happens to be zero, as a
        compile time check. The typecheck uses a cast. The usage of zero or=
 other
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index c9bbab6c08..644e897558 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -469,7 +469,10 @@ maintainers if you want to suggest a change.
    * - `Rule 11.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_08.c>`_
      - Required
      - A cast shall not remove any const or volatile qualification from th=
e type pointed to by a pointer
-     -
+     - Some standard C library-style functions are inherently double-use,
+       accepting a const argument and returning a non-const pointer into
+       it so that callers searching a non-const object get back a
+       mutable pointer. Such uses are deviated on a per-function basis.
=20
    * - `Rule 11.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_09.c>`_
      - Required
--=20
2.43.0

