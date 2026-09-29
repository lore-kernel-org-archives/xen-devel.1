Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1326DC9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 06:22:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436278.1655017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRE4-0002oE-4L; Tue, 29 Sep 2026 06:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436278.1655017; Tue, 29 Sep 2026 06:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBRE4-0002o1-1h; Tue, 29 Sep 2026 06:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1436278;
 Tue, 29 Sep 2026 06:22:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xBRE2-0002bq-4n
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 06:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBRE1-001sCD-HO
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 08:22:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb58fb-8faa-0a2a0a5109dd-0a2a450ae5ca-28
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:22:01 +0200
Received: from [40.107.130.117]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6abb5909-f2d2-0a2a450a0019-286b8275afcf-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:22:01 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB8414.eurprd03.prod.outlook.com (2603:10a6:10:3ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 06:21:57 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:21:57 +0000
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
 b=oeJ2jObAU9CWvHO5WePJa2OA/t8VtsCwEkVGfiQkre3OtwZN2rKdBnMMKk0h6vjDXEw14xHWTJNOLKDqcNoLM0yniAhTnVM1FPt8ng/wChPp7hJFgnRawmHbgGMKuKPkF13Sr7Vnipyx7xToNG5i4xQX9m8Da4zLMC47RltqPdl9tm8GoEnGIuX3uB920lt1qfpfWAz347EAmT2+OwzP8jdMYWJKHDUBVdwu7OIHijZxtwqBk1BEGcnkjIdnmIRrepoBvxDUmz13M9wOOuBQPbe4jKUVaBNom3YEJi0D3/NU9lnpS1WaSYVFZNNKpZAW/NRvF+Hx33CH7iLL8tVNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+bBbXXrQQgnYreXSQHnhXJoTpFLpScx+CAW+F6c7J8=;
 b=l04CGUXLag/e5AI+RF3vjUYMG353Bo4/DjGFxk5gndoN0kede+rloe/5owx58YjhiqCgw07m8kK6wQ6isabIWMNTTjgMX6oF2Cz8XQHTv3yHjL51EeJTCdo174En7z9YF7IDIvaX6+wd66B6W4qTpG1Xfhp37YlPg7Ps4y+CQmAP/bI2umOPwZjGLPermXUCyJ/Wg+UxWi1CFfjOmckGUGYZEgXDJG8gYjWYawuiLSKd78Xb4C3AlVXvUXZJHIFGP8iMfVYArcs/jFqAic33lIDu/1tPNvaApNJ855he3DjFvpYrOQcOamXvE38LtuPolwY+3S9r+dO0eXyO7B/E5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+bBbXXrQQgnYreXSQHnhXJoTpFLpScx+CAW+F6c7J8=;
 b=of/PYsJ3+vt0mmVFq/oH6hDQlvklkp57krBS9fvF76U5lLBgOgkM2eE6Y/EXFRkrs4xmMpRwsxeAo0XkD06zlzfNhDu0iABkrJ4B1I+7KJPmStAMKqsrWeC3XrHCvdQzXS+9Fvixa2rOOwPx9c4X/hX5qZRgmPRL6yT3Yj7bboi2NvrcK5gTPRRwqirNe+4m7eE/f/+X9hguDWuKLR+0D3yArDmvIJAY+DZq4VlzYJUAtVsr1dNgT6atmfQXL+msM2HJ3+yY4jYvaJlIzh0zapM/73mTycyahUUjatrK1Ne+1TTgVAnhoAJQD4jmrdPQSR+3ahewa+Tb9WfZrceytw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>
Subject: [PATCH v3 2/3] misra: deviate MISRA C Rule 5.5 for request_irq()
Thread-Topic: [PATCH v3 2/3] misra: deviate MISRA C Rule 5.5 for request_irq()
Thread-Index: AQHdT9rU6E3vRKiUN0Ozba0H/TAizw==
Date: Tue, 29 Sep 2026 06:21:57 +0000
Message-ID:
 <0d0e8538e9eff76611987172ba5a8982768ff438.1790661461.git.dmytro_prokopchuk1@epam.com>
References: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB8414:EE_
x-ms-office365-filtering-correlation-id: 37f7fb61-4445-48cd-844a-08df1df1f6ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|42112799006|38070700021|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 9xR3dSnAk6bz0CxmlewmBRt5Jbci3hPuTo6GlHPcv6XszJjvHjuXYS4RA/fEka1wLRE+hqxNvROD4twG5hqtw8lZ77hqYOP5F7sk9qOL+d9qPhwd5QafUBBco0mlfYq+qpym3VZRGSJByUqvAw31kbkRM6aN0DUjkXy/VSIneg94YjUlKLfqY3rY29eToCZk6q0nCIJqa5QbxrGxv1B+mjDYrknkzD/B1tGNdEKHEcnqCpiwuR6BVX8cvfVhfUR3Es//zBjqeeAyQ1QeZkxBRI3N1TUbMsi6no0KsSI1M/RRPb5xq9tkUNwRAZZe9m5w2ymPWLdQkVbBjmYiw0/+DSBGHH9fqRamqtAGNez7yhRCwrKyeCQpfkFBN480u4uKh2fUGvQvdaI79L59Sxs3H/gzwomr49QPVjWwFQkNtIZt4A8fV6ZZwNc9Momy+jbhWYWmo9CuOSPVRHqg80+hiyct45s+eLlb3n8kGWNLF7Dq0Fc7xwmS6tP+R8E7pepfYRgI3SmInT8wped/WCauLs6l13JjPNQtdNQKdSEaQNN6OsPmNjUncQ6o2UkZrpguRCnjkviwJNpaj1jOdsfkzCX05G1y/R4ZkyFy17LgEFdyDGusofH9V5b11uu82qbglxx9RGg8LQPPeARPeyxj2iSeFOyTO50veiUtfj/afBWw/mNwZNq+dlIDj4OL4EBITyvetLwvu0pwEZfNVMIkqXUd6Sey6me8OGjDt6IhLD8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(42112799006)(38070700021)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2ZXjMD+egG9W5kPuW0ayjO7mfoI/pX262na7vJ3jt7opFrbTPdEpptjff9?=
 =?iso-8859-1?Q?ui4IjdZaA9+IVkPfaoTW+0WDlBJCoKm1wy4Bkztpqi+uZ5j8OJ9JsfV27P?=
 =?iso-8859-1?Q?DlX2YkEATmIi7tERnLTQe8kvQCVyjYn605/ZAyvioxmNY28iuigeX2SlB7?=
 =?iso-8859-1?Q?WqxIjYas/xt7XAKCgtK1QXqkY/yfaQ8pqbiCSKWv2bk9kJGIdD7k0xZdzT?=
 =?iso-8859-1?Q?dVtbZHQB4hRnPruqo0bZWcs9ZPcC9EiMuX8d7lF5ze/HPWFCwsx5NLWh4F?=
 =?iso-8859-1?Q?WsLmfB+cDVeKjFcU2KA1812pvzrmEwLAtaJzILeBw5+dJt7Odu8iumMncY?=
 =?iso-8859-1?Q?xOeIBD+WoUyyX9wfWyIEeSB8rUHNeRDVISf/2kAcZ5w9swiz0cmFeLHkSE?=
 =?iso-8859-1?Q?ixU1mCgfs4/AvLuv4SvsEKVp3TN88aJkXDB28aQ3CyBnCSqryJXJ+50LrJ?=
 =?iso-8859-1?Q?d/KHPBNnEleDrFgASuSoTXJ7kSqeKY2NKwAgs+o1XjLge6sRl+Ir2Jx2lh?=
 =?iso-8859-1?Q?/vWxjDcggjyc57BcR72NYyCLBFjfNaD90wm8jtmhPBEuwif5dSuc9tOter?=
 =?iso-8859-1?Q?ariewfxzdSwue3ykAHnfYrxNfmnKlxoDd6rSjlC8taQX5V+6C7KfI6YrkH?=
 =?iso-8859-1?Q?/jSXuTtH5kr1UYKH2BWLt2YSap1b6TdHaiAhqWDfpQljVubIkOc/nZEg/A?=
 =?iso-8859-1?Q?/8mqy6UBJLVTtm1IvMrXpkcP8rhe5DvUYjG9EjZPPCNNLAy7oi2dHf+R66?=
 =?iso-8859-1?Q?/1JhBhtQbEDKmtjUAVTw+I13BuJaBxyyTHnY+icVtqNuak2lsUOEjBbFuv?=
 =?iso-8859-1?Q?AqQVFvSiE/32MbXOOsh1xhy5agUJcqG2IvkRefe83gLUIYK1eq9IH0+jaq?=
 =?iso-8859-1?Q?EBEcFfvdG1t5ZlpdfdgMGwcnv7W++t3aNHM0yu+Nt+C8MBcM61IyO3P9XW?=
 =?iso-8859-1?Q?XnlDkTrSQqYWJrIadpNEOBwxubn5LU1qKyG3loSXihciOvSfDr1XsdSiw6?=
 =?iso-8859-1?Q?3Uui5IbdRU476sZA0pPz8MG7W5UW+N3FTV5iSCaSaTuN959NsktiBnxCCe?=
 =?iso-8859-1?Q?o4XVMdIFQo3as5hZH8CAzRCC+/Eboy9BUUeXMMF8dbSNEj9/DAACRq9ngv?=
 =?iso-8859-1?Q?BVmDHTg+NesUiVdw6kcv7CtS3vBnkZS6L6lA4rROnzY9vko0Dvwg39idwZ?=
 =?iso-8859-1?Q?20zfvTj2Z7P63v0vXZGjCwkSaJU70yL5lIXdlwMAoid6/vS1I7qR8bCspu?=
 =?iso-8859-1?Q?NgrErIoL0o9pL+hIKLnfFqZE10+BvkU/qPTERHvojfAzEGqd+KJVwncegR?=
 =?iso-8859-1?Q?VC5JUxfitze+Y6ya2IQrQgcr3uAiCxWTkLijELfAKpH80etHcvfRy5YHW6?=
 =?iso-8859-1?Q?/M9dDRNU74Yqs4c11RdIPi2T7+eHXPp89WEDM7HZHv3f3Df0PhrJ0Gm+rp?=
 =?iso-8859-1?Q?lnpSPHvpShUHjIT7DzADgnhBpkFTE8Izvg+U1lwMWktNt4TYqFq3h5MJOO?=
 =?iso-8859-1?Q?mLAUCt9ptLul9lQhLbn0TN6FdGcXCxJeFOexKV6NhY8mgyJQMzQI9g9+bp?=
 =?iso-8859-1?Q?y8i2ppKa68YRouJfIY7G1D+8xs8eAUApAhZP+GjsJUWZWqdThgI+xH7vBY?=
 =?iso-8859-1?Q?1//f+aSQX5HcQoz/SOu+voWnMXegHvnlVzSiULh+XpTopD/Z2lOq82cxqG?=
 =?iso-8859-1?Q?8SQFiiwFjtuZz+PmIi6xo2TGo88XuID959ltRKeZGzPKufm1omB8dl5JWo?=
 =?iso-8859-1?Q?nMoUkDm9RNm2w2lo9fysrM2ttvZIemPXqmLu7pQzC0cyRlMRgNaMmC67JT?=
 =?iso-8859-1?Q?LsHOoW7Gdw4/uIFHzoZo4XZQuXnyMHY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f7fb61-4445-48cd-844a-08df1df1f6ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 06:21:57.2203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+d5Mp+EvblHRGwXb9pizvXeZFShFTkOYGAwHbdFn5I/rAhjcQ6iIxniRXy3BdGtNadFo9bVV2OB7soIpUJSXteUIyHp3IUl2gfA+/LPeig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8414
X-purgate-ID: tlsNG-4011c0/1790662921-528DDCFC-9AEF6988/0/0
X-purgate-type: clean
X-purgate-size: 3434

MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate identifier and macro name
clashes by specifying the macros that should be ignored.
This includes request_irq(), where the Xen function takes the IRQ
flags before the handler argument, while the macro adapts ARM SMMU
driver calls by reordering the arguments.

Update deviations.rst and rules.rst accordingly.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 7 +++++++
 docs/misra/rules.rst                             | 5 +++++
 3 files changed, 16 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 400413f8f5..d62f339103 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -137,6 +137,10 @@ These macros address differences in argument count dur=
ing compile-time, effectiv
 -config=3DMC3A2.R5.5,ignored_macros+=3D"name(hypfs_alloc_dyndata)&&loc(fil=
e(^xen/include/xen/hypfs\\.h$))"
 -doc_end
=20
+-doc_begin=3D"Clash between request_irq() function and macro name in xen/d=
rivers/passthrough/arm/smmu.c is deliberate."
+-config=3DMC3A2.R5.5,ignored_macros+=3D"name(request_irq)&&loc(file(^xen/d=
rivers/passthrough/arm/smmu\\.c$))"
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6bcc2adf95..1524895dd2 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -185,6 +185,13 @@ Deviations related to MISRA C:2012 Rules:
        macro before defining the real function, so the name clash is contr=
olled.
      - ECLAIR has been configured to ignore this macro.
=20
+   * - R5.5
+     - Clash between the request_irq() function and macro name in the file
+       xen/drivers/passthrough/arm/smmu.c is deliberate. The function uses=
 the
+       argument order, while the macro is a compatibility wrapper for the =
ARM
+       SMMU driver that adapts calls by reordering the handler and flags a=
rguments.
+     - ECLAIR has been configured to ignore this macro.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a59cf1782e..497e393d4f 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -227,6 +227,11 @@ maintainers if you want to suggest a change.
        file xen/include/xen/hypfs.h is allowed because the macro is a type=
d
        convenience wrapper around the size-based allocation function.
=20
+       Clash between request_irq() function and macro names in the file
+       xen/drivers/passthrough/arm/smmu.c is allowed because the macro is =
a
+       local compatibility wrapper that adapts ARM SMMU driver's request_i=
rq()
+       argument order.
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
--=20
2.43.0

