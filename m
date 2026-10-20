Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619EC606A335
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=riQGNllE
Received: from list by lists.xenproject.org with outflank-mailman.1455218.1668810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jt-0001i0-N8; Tue, 20 Oct 2026 09:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455218.1668810; Tue, 20 Oct 2026 09:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jt-0001ga-HF; Tue, 20 Oct 2026 09:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1455218;
 Tue, 20 Oct 2026 09:39:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xJ6Jr-0001Gb-Qr
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jr-00228c-7a
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-2eae-0a2a0a5409dd-0a2a4503a702-6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:43 +0200
Received: from [52.101.66.96]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-fae8-0a2a45030019-346542601808-5
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:43 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8671.eurprd03.prod.outlook.com
 (2603:10a6:10:3eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:41 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=li6WnMCS4yYj2DFfG9X5HgBqz1NHd18ZHV6D8cmInNGvPznlHzoCL2EFoz6ITt/JEd/rtkqr7lis9Or6mNkHh3B8QECev7lyyAZMNeQNHxTOwRulVg9BD3lxKQHqbceJhTUxrqgazIrHdGP1zRiTTZSqdGMTrqR/hlOsnwlwVt9NtGwMkVfWv2afDQ0PE26qfPCS8oQQ1G67svABFP0isk6SjytHnuTSlAMrnyZX2efOm4DyXJkTcg5GRjBVe2vEQVeRg+8+Bu+rE1gNhzUpZzcLCuBIMwN69PyRFdMqmu8NMxecLtCJ8fM7pWinaKrTV9SApDqEk41ELOcbNE5vaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP09p0XgjdqZOlb1RwpfsNkWYXOT6ydA7eId42t90eI=;
 b=tiN8EmoR/n+nLiuque2kfi8dMPKya3wf5gz6lrfLABpXOGas+Al7xZUb57/zz6LEf5Jv3rR/KfzFP5kIS9DTMRzujGLl+lWntzA3PVDCgQ69C3/UxAULySzDguRNRK6kkr/TsrojMYThJhC6wBxYwKXrJ9+F4w1o2fwpYvRfNIequA3OhqO7VjJjXwhHy3mwMzk10CvVqfO773Ti1fU18LLVv2ZCovMPIfSzX05CY76TyBSTOd0dxTYNvDCm5scumXNoVe+znxr8iNNngztXdcC/04HWgnoB5qIPXI4n8022Fr05c1EoOsTqydZbygwK/QUQM8Gsm+RgBM03uTbgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP09p0XgjdqZOlb1RwpfsNkWYXOT6ydA7eId42t90eI=;
 b=riQGNllEEZ5VAN34bKrGKgQqDI8sJ9p6ai1rjeULgryr6JEV1ztYqEbDlmgXVwetYdZ8cOVfTPv1bYml/Lia71rn3uuRwBlfIYkjLrOiY4Qx//ZUC85m5Q/7Pqh3vLFDkzJ+lXiKU2NbInj8KZvqq0j5E/ZLq6oPk52tVHX4M/u9SWqVh6YgV28FnfT3NzywUeZ4jVj8XY3XsR7gdshIbLAx9M3gHyohyinFudsvsaLl0KeEy+FOv4DXCglptqjroWRdFKDPjh4aoiKVeYWPh4+a9lrAPkRtejPnuVtXUnbdiD9lxAZ2SSllo8pUdfo5ReSgzW3vL1MJjc5qtZBdJw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v10 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v10 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHdYHbpwvfZ+lGiaEOW2pVf4XluEg==
Date: Tue, 20 Oct 2026 09:39:32 +0000
Message-ID:
 <d80165e573f1be6c10fa54f68038389a1bb47625.1792480416.git.mykyta_poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8671:EE_
x-ms-office365-filtering-correlation-id: 1d912ddd-2351-4aba-28d2-08df2e8e10ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|10067099003|22082099003|11063799006|38070700021|260925021311599003|260925021911599003|260925022911599003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 D0DiKADtSiyj6sJbaFq6ZIjLfMMry0Qp91JZAofUtBvRUMJKRuWg7CQCFKRs05H599ww/5b4Z7h62SMI2UXeWSzqgo6cZY7mfpr0f/qIDoacckzRxZ+hWIViLP1UesLOHPfHmWJsEhs+Q92Hj2z4RMT8T9AfDw/ml7VbSqBNrSYfpA2CHJCEtxKZQ7jYkAnMKsdPX56Js8XX6nADZeFplIocCXlHQPxFflpZ/nt7y4z4E9g/Sb1plMFB561CBIx5l34Cc6Yj8TkcGj418WAwT+RYmQyW9blwpgkePlG7/c3XRZAi5DvxpD1/ykHR8ojPWVjMS64tZXBsRxQ/EF9jJ2bcJFitbiBZnv1XOL52MH/gAVo5pgFkObrQtHJUwkWejVUpMIfrBF6sP+ipj9Djx67OZfQ9KaUciQ8EhH+1WIaEEgclz2xxd8JbeH1HF8Odx80ecLWTqpBe/V/6oewM1UaOhbpNBI4q6/6py0QSFR1qSoD9A56Se2kbOhM3enzAdFmVFeMfcFlYCIPonEQkHL6vKIkcKCwQiz+zGDt3bFqo0Ocsj918QTHOmPmDLKvYDMu9BvYZUDYFoc8g5k1HEgUxUVMzT9y6K/Q3/kS5xpbEJ+50SBiN1dacJrJvtPJrzt2YU2rxYyHFV2TciRNd9dCm25Glnilknx2PFbd8Bga3hDrSoYBqk4DlkkmIblZiSczuOPwzlV4/jsY1ulj2jF0mABp3m/buz7jj7YANCS0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(11063799006)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zvnngu0tiLg5vnn9c58k6n56MgbsIisro/psHNwQUfUKGGp97VL1h09j01?=
 =?iso-8859-1?Q?Vixdd3OAUOwz0vYD0OF/6QW7OxOifml2Qxc7Ar/uRMEX/y/Pk/Q13PMCoh?=
 =?iso-8859-1?Q?ttzEQaOPuU6Kh5cIA9keSi6q4ZnnmiTw0eC1Ug+BwNsTc7iKE+dx9o3VJS?=
 =?iso-8859-1?Q?ax0bbrcVCdPRZ83/IEv8EvGRRccaBnn1l7OJa5hXlfW/PUf9eEx7n0NBe7?=
 =?iso-8859-1?Q?cF+5oCC2yhH4ajp74ys3vMtQqFCH/uZMxwqSar0ilMHzz8PT420p9D93eR?=
 =?iso-8859-1?Q?I24jIqRjSaN6R3hwQpBNO1YTUlmajSjoOPQOTeBPkdbjMcJTrz04PO05gi?=
 =?iso-8859-1?Q?kYdSgdBcHoSpLyAAx7Z+BdEZd4/riEwH02qC8cIFnNP0W4WJu/eCBZPRYt?=
 =?iso-8859-1?Q?upMLV2eqPCmyomzj1cGBZmG8J4GADeiPhdc7bW/C/bEnjIRexDfcRvBywX?=
 =?iso-8859-1?Q?6XaHyLWsCIgq7YFSSSUFcYX4ARYsNbwwx9GrPWzWvSGACLvGrc2To21UDB?=
 =?iso-8859-1?Q?mzMSDfV5GrCnLsJ/63YDQjA7aC4Yty0ZZUKka9OqVFSgM3VGyEdnSaRNiV?=
 =?iso-8859-1?Q?FrOK2dHjem1fGMX4c2/gbBU3IqIkYQ9DX9t5KViq2XxFOIz+lqWO8DZ0Cb?=
 =?iso-8859-1?Q?1iTLj2LoQ1Quxz5k37okjGILv91qH/KPLHmMXLBGAaib5Jt9LpfComKS0B?=
 =?iso-8859-1?Q?stO9k2iw617PWzyPUCKYnCqmiN/w6dCKLJGP97cUtAyHvWGneI0qy0/Jxf?=
 =?iso-8859-1?Q?+bn0mrKlYHdOKApzkvOQH5apnN+PTzIYRA1g6Z3Rgah12ASuRMY9AgvucM?=
 =?iso-8859-1?Q?MoRhl2uwqNPBJQVdZQUTOikBUmH4sLsYk2g1I2MPGpCsLaylI1kH2S3y0P?=
 =?iso-8859-1?Q?qrZcFVe1EoqhTId5iXpjiNIE4LyX6jSHpUMJOdJ4qCzeouSMTGE0AcqvaM?=
 =?iso-8859-1?Q?3s4yrL0Vx3Z9s+XwozwGlK8K1zIAhC3B0EW2IH1C8NwzSxoTX5+c+b7yne?=
 =?iso-8859-1?Q?sx5Q9XWmRrb+kiWcrJmDP5VznGKVpaatCZXHxQgsQmOss6rxd11sAiHTf8?=
 =?iso-8859-1?Q?07QXRB03eMb1bzI4D1085og6NQOtBlzgbqJkSPKsg2DSyGfD/8n1tBZmk8?=
 =?iso-8859-1?Q?dxMfoVM7J6vLCl8bFRC0Dr76pQZPMRsRyOsjURGbE7Q6jV6cmJ35WPZ0a4?=
 =?iso-8859-1?Q?kketk4EFsVLd/XzfT9v3GTNDJxCJ2ku4avzZweYg8IurlDewuWjX4jHnrF?=
 =?iso-8859-1?Q?ncluf4N/8TqU5e4B5ijvYW/Mm4imWRzR3SZmc5jWVuxT8s1DWvTbLq9auH?=
 =?iso-8859-1?Q?MH5UZhAAo+lkCjQ8VbGZUZ9kNu5Kdf4uPsOJJkA/Sl2fa+LpAfdTsszG2K?=
 =?iso-8859-1?Q?iViwhOBkKOaYWfVEfkoKOcMfI5QjVBfOvnbgbCmADpMmkJkbTq0k2W1nPF?=
 =?iso-8859-1?Q?dX0vqVlXa8/P7b/gALJDnr/GgG1n0etVNxufKDgAX8gpKTI+TtF3FfpLCT?=
 =?iso-8859-1?Q?s8Bkqi7auksfQ/njbV4xRLJND0dm5FhdHt6JdGr2ZxoKed1uXbAXwRELdT?=
 =?iso-8859-1?Q?FvEOLRZmRgPbUPUvnefMKNlxWk23fE8zSXv5wcYRZr6LYuhrJNUJvZ4ke0?=
 =?iso-8859-1?Q?muG3b8pPNQaTOnl9gQxd/531BIfT3ryzBHNosCYYErBHEv12TxhUhCTjd1?=
 =?iso-8859-1?Q?Qh8N81vG0NNQyZiIb9tdOixKF3sApevGgg8PKZk1aJCfJRg/f3IwQ4Y9+o?=
 =?iso-8859-1?Q?FabXLrI5a/wPV+p6i+z3w8mI8d6lz5m6WofA0nMIuDs7YIsCzSfJPUWweq?=
 =?iso-8859-1?Q?t4wpV4chDw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d912ddd-2351-4aba-28d2-08df2e8e10ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:32.3138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFFLPGlojdKOBVECxzZQyrdYsqzG2Zg2bLnUv7JJoEIqTedkfQi6qG43Q2Z83hAKmNuU7DagGiHNtJxJJ4xKag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8671
X-purgate-ID: tlsNG-33051d/1792489183-77CC34E9-E416ED60/0/0
X-purgate-type: clean
X-purgate-size: 24541
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Operations specific to x86 architecture are moved into a separate file
and only built on x86.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v9->v10:
* collect RB

v8->v9:
* use CONFIG_X86 instead of CONFIG_MIGRATE
* fix style issues

v7->v8:
* move x86 specific function into a separate file

v6->v7:
* no changes

v5->v6:
* don't change order in Makefile

v4->v5:
* make hptool always build

v3->v4:
* no changes

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 tools/misc/Makefile         |   9 +-
 tools/misc/xen-hptool-x86.c | 278 ++++++++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c     | 293 ++----------------------------------
 tools/misc/xen-hptool.h     |  15 ++
 4 files changed, 314 insertions(+), 281 deletions(-)
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 6ee783f43e..064ab7c4bd 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN                   +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
@@ -104,8 +104,11 @@ xenhypfs: xenhypfs.o
 xenlockprof: xenlockprof.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
=20
-xen-hptool: xen-hptool.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(L=
DLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
+hptool-objs-y :=3D xen-hptool.o
+hptool-objs-$(CONFIG_X86) +=3D xen-hptool-x86.o
+
+xen-hptool: $(hptool-objs-y)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(L=
DLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
=20
 xenhypfs.o: CFLAGS +=3D $(CFLAGS_libxenhypfs)
=20
diff --git a/tools/misc/xen-hptool-x86.c b/tools/misc/xen-hptool-x86.c
new file mode 100644
index 0000000000..95a7e05990
--- /dev/null
+++ b/tools/misc/xen-hptool-x86.c
@@ -0,0 +1,278 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <xenevtchn.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <xenstore.h>
+#include "xen-hptool.h"
+
+int hp_mem_online_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Prepare to online MEMORY mfn %lx\n", mfn);
+
+    ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
+
+    if (ret < 0)
+        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, e=
rrno);
+    else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
+        fprintf(stderr, "Onlining page mfn %lx is broken, "
+                        "Memory online failed\n", mfn);
+        ret =3D -1;
+    }
+    else if (status & PG_ONLINE_ONLINED)
+        printf("Memory mfn %lx onlined successfully\n", mfn);
+    else
+        printf("Memory is already onlined!\n");
+
+    return ret;
+}
+
+int hp_mem_query_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Querying MEMORY mfn %lx status\n", mfn);
+    ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
+
+    if (ret < 0)
+        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, e=
rrno);
+    else
+    {
+        printf("Memory Status %x: [", status);
+        if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
+            printf(" PAGE_OFFLINE_PENDING ");
+        if ( status & PG_OFFLINE_STATUS_BROKEN )
+            printf(" PAGE_BROKEND  ");
+        if ( status & PG_OFFLINE_STATUS_OFFLINED )
+            printf(" PAGE_OFFLINED ");
+        else
+            printf(" PAGE_ONLINED ");
+        printf("]\n");
+    }
+
+    return ret;
+}
+
+static int suspend_guest(xc_interface *xch, xenevtchn_handle *xce, int dom=
id,
+                         int *evtchn, int *lockfd)
+{
+    int port, rc, suspend_evtchn =3D -1;
+
+    *lockfd =3D -1;
+
+    if (!evtchn)
+        return -1;
+
+    port =3D xs_suspend_evtchn_port(domid);
+    if (port < 0)
+    {
+        fprintf(stderr, "DOM%d: No suspend port, try live migration\n", do=
mid);
+        goto failed;
+    }
+    suspend_evtchn =3D xc_suspend_evtchn_init_exclusive(xch, xce, domid,
+                                                      port, lockfd);
+    if (suspend_evtchn < 0)
+    {
+        fprintf(stderr, "Suspend evtchn initialization failed\n");
+        goto failed;
+    }
+    *evtchn =3D suspend_evtchn;
+
+    rc =3D xenevtchn_notify(xce, suspend_evtchn);
+    if (rc < 0)
+    {
+        fprintf(stderr, "Failed to notify suspend channel: errno %d\n", rc=
);
+        goto failed;
+    }
+    if (xc_await_suspend(xch, xce, suspend_evtchn) < 0)
+    {
+        fprintf(stderr, "Suspend Failed\n");
+        goto failed;
+    }
+    return 0;
+
+failed:
+    if (suspend_evtchn !=3D -1)
+        xc_suspend_evtchn_release(xch, xce, domid,
+                                  suspend_evtchn, lockfd);
+
+    return -1;
+}
+
+int hp_mem_offline_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status, domid;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Prepare to offline MEMORY mfn %lx\n", mfn);
+    ret =3D xc_mark_page_offline(xch, mfn, mfn, &status);
+    if (ret < 0) {
+        fprintf(stderr, "Offlining page mfn %lx failed, error %x\n", mfn, =
errno);
+        if (status & (PG_OFFLINE_XENPAGE | PG_OFFLINE_FAILED))
+            fprintf(stderr, "XEN_PAGE is not permitted be offlined\n");
+        else if (status & (PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM))
+            fprintf(stderr, "RESERVED RAM is not permitted to be offlined\=
n");
+    }
+    else
+    {
+        switch(status & PG_OFFLINE_STATUS_MASK)
+        {
+            case PG_OFFLINE_OFFLINED:
+            {
+                printf("Memory mfn %lx offlined successfully, current stat=
e is"
+                       " [PG_OFFLINE_OFFLINED]\n", mfn);
+                if (status & PG_OFFLINE_BROKEN)
+                    printf("And this offlined PAGE is already marked broke=
n"
+                        " before!\n");
+                break;
+            }
+            case PG_OFFLINE_FAILED:
+            {
+                fprintf(stderr, "Memory mfn %lx offline failed\n", mfn);
+                if ( status & PG_OFFLINE_ANONYMOUS)
+                    fprintf(stderr, "the memory is an anonymous page!\n");
+                ret =3D -1;
+                break;
+            }
+            case PG_OFFLINE_PENDING:
+            {
+                if (status & PG_OFFLINE_XENPAGE) {
+                    ret =3D -1;
+                    fprintf(stderr, "Memory mfn %lx offlined succssefully,=
"
+                            "this page is xen page, current state is"
+                            " [PG_OFFLINE_PENDING, PG_OFFLINE_XENPAGE]\n",=
 mfn);
+                }
+                else if (status & PG_OFFLINE_OWNED)
+                {
+                    int result, suspend_evtchn =3D -1, suspend_lockfd =3D =
-1;
+                    xenevtchn_handle *xce;
+                    xce =3D xenevtchn_open(NULL, 0);
+
+                    if (xce =3D=3D NULL)
+                    {
+                        fprintf(stderr, "When exchange page, fail"
+                                " to open evtchn\n");
+                        return -1;
+                    }
+
+                    domid =3D status >> PG_OFFLINE_OWNER_SHIFT;
+                    if (suspend_guest(xch, xce, domid,
+                                      &suspend_evtchn, &suspend_lockfd))
+                    {
+                        fprintf(stderr, "Failed to suspend guest %d for"
+                                " mfn %lx\n", domid, mfn);
+                        xenevtchn_close(xce);
+                        return -1;
+                    }
+
+                    result =3D xc_exchange_page(xch, domid, mfn);
+
+                    /* Exchange page successfully */
+                    if (result =3D=3D 0)
+                        printf("Memory mfn %lx offlined successfully, this=
 "
+                                "page is DOM%d page and being swapped "
+                                "successfully, current state is "
+                                "[PG_OFFLINE_OFFLINED, PG_OFFLINE_OWNED]\n=
",
+                                mfn, domid);
+                    else {
+                        ret =3D -1;
+                        fprintf(stderr, "Memory mfn %lx offlined successfu=
lly"
+                                " , this page is DOM%d page yet failed to =
be "
+                                "exchanged. current state is "
+                                "[PG_OFFLINE_PENDING, PG_OFFLINE_OWNED]\n"=
,
+                                mfn, domid);
+                    }
+                    xc_domain_resume(xch, domid, 1);
+                    xc_suspend_evtchn_release(xch, xce, domid,
+                                              suspend_evtchn, &suspend_loc=
kfd);
+                    xenevtchn_close(xce);
+                }
+                break;
+            }
+        }//end of switch
+    }//end of if
+
+    return ret;
+}
+
+int main_smt_enable(int argc, char *argv[], xc_interface *xch)
+{
+    int ret;
+
+    if ( argc )
+    {
+        show_help();
+        return -1;
+    }
+
+    for ( ;; )
+    {
+        ret =3D xc_smt_enable(xch);
+        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
+            break;
+    }
+
+    if ( ret < 0 )
+        fprintf(stderr, "Unable to enable SMT: errno %d, %s\n",
+                errno, strerror(errno));
+    else
+        printf("Enabled SMT\n");
+
+    return ret;
+}
+
+int main_smt_disable(int argc, char *argv[], xc_interface *xch)
+{
+    int ret;
+
+    if ( argc )
+    {
+        show_help();
+        return -1;
+    }
+
+    for ( ;; )
+    {
+        ret =3D xc_smt_disable(xch);
+        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
+            break;
+    }
+
+    if ( ret < 0 )
+        fprintf(stderr, "Unable to disable SMT: errno %d, %s\n",
+                errno, strerror(errno));
+    else
+        printf("Disabled SMT\n");
+
+    return ret;
+}
diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 590810b6eb..7b886e2304 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -6,8 +6,8 @@
 #include <xenguest.h>
 #include <xenstore.h>
 #include <xen-tools/common-macros.h>
+#include "xen-hptool.h"
=20
-static xc_interface *xch;
=20
 void show_help(void)
 {
@@ -18,239 +18,25 @@ void show_help(void)
             "  help                     display this help\n"
             "  cpu-online    <cpuid>    online CPU <cpuid>\n"
             "  cpu-offline   <cpuid>    offline CPU <cpuid>\n"
+#if defined(__i386__) || defined(__x86_64__)
             "  mem-online    <mfn>      online MEMORY <mfn>\n"
             "  mem-offline   <mfn>      offline MEMORY <mfn>\n"
             "  mem-status    <mfn>      query Memory status<mfn>\n"
             "  smt-enable               onlines all SMT threads\n"
             "  smt-disable              offlines all SMT threads\n"
+#endif
            );
 }
=20
 /* wrapper function */
-static int help_func(int argc, char *argv[])
+static int help_func(int argc, char *argv[], xc_interface *xch)
 {
     show_help();
     return 0;
 }
=20
-static int hp_mem_online_func(int argc, char *argv[])
-{
-    uint32_t status;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Prepare to online MEMORY mfn %lx\n", mfn);
-
-    ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
-
-    if (ret < 0)
-        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, e=
rrno);
-    else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
-        fprintf(stderr, "Onlining page mfn %lx is broken, "
-                        "Memory online failed\n", mfn);
-        ret =3D -1;
-    }
-    else if (status & PG_ONLINE_ONLINED)
-        printf("Memory mfn %lx onlined successfully\n", mfn);
-    else
-        printf("Memory is already onlined!\n");
-
-    return ret;
-}
-
-static int hp_mem_query_func(int argc, char *argv[])
-{
-    uint32_t status;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Querying MEMORY mfn %lx status\n", mfn);
-    ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
-
-    if (ret < 0)
-        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, e=
rrno);
-    else
-    {
-        printf("Memory Status %x: [", status);
-        if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
-            printf(" PAGE_OFFLINE_PENDING ");
-        if ( status & PG_OFFLINE_STATUS_BROKEN )
-            printf(" PAGE_BROKEND  ");
-        if ( status & PG_OFFLINE_STATUS_OFFLINED )
-            printf(" PAGE_OFFLINED ");
-        else
-            printf(" PAGE_ONLINED ");
-        printf("]\n");
-    }
-
-    return ret;
-}
-
-static int suspend_guest(xc_interface *xch, xenevtchn_handle *xce, int dom=
id,
-                         int *evtchn, int *lockfd)
-{
-    int port, rc, suspend_evtchn =3D -1;
-
-    *lockfd =3D -1;
-
-    if (!evtchn)
-        return -1;
-
-    port =3D xs_suspend_evtchn_port(domid);
-    if (port < 0)
-    {
-        fprintf(stderr, "DOM%d: No suspend port, try live migration\n", do=
mid);
-        goto failed;
-    }
-    suspend_evtchn =3D xc_suspend_evtchn_init_exclusive(xch, xce, domid,
-                                                      port, lockfd);
-    if (suspend_evtchn < 0)
-    {
-        fprintf(stderr, "Suspend evtchn initialization failed\n");
-        goto failed;
-    }
-    *evtchn =3D suspend_evtchn;
-
-    rc =3D xenevtchn_notify(xce, suspend_evtchn);
-    if (rc < 0)
-    {
-        fprintf(stderr, "Failed to notify suspend channel: errno %d\n", rc=
);
-        goto failed;
-    }
-    if (xc_await_suspend(xch, xce, suspend_evtchn) < 0)
-    {
-        fprintf(stderr, "Suspend Failed\n");
-        goto failed;
-    }
-    return 0;
-
-failed:
-    if (suspend_evtchn !=3D -1)
-        xc_suspend_evtchn_release(xch, xce, domid,
-                                  suspend_evtchn, lockfd);
-
-    return -1;
-}
-
-static int hp_mem_offline_func(int argc, char *argv[])
-{
-    uint32_t status, domid;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Prepare to offline MEMORY mfn %lx\n", mfn);
-    ret =3D xc_mark_page_offline(xch, mfn, mfn, &status);
-    if (ret < 0) {
-        fprintf(stderr, "Offlining page mfn %lx failed, error %x\n", mfn, =
errno);
-        if (status & (PG_OFFLINE_XENPAGE | PG_OFFLINE_FAILED))
-            fprintf(stderr, "XEN_PAGE is not permitted be offlined\n");
-        else if (status & (PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM))
-            fprintf(stderr, "RESERVED RAM is not permitted to be offlined\=
n");
-    }
-    else
-    {
-        switch(status & PG_OFFLINE_STATUS_MASK)
-        {
-            case PG_OFFLINE_OFFLINED:
-            {
-                printf("Memory mfn %lx offlined successfully, current stat=
e is"
-                       " [PG_OFFLINE_OFFLINED]\n", mfn);
-                if (status & PG_OFFLINE_BROKEN)
-                    printf("And this offlined PAGE is already marked broke=
n"
-                        " before!\n");
-                break;
-            }
-            case PG_OFFLINE_FAILED:
-            {
-                fprintf(stderr, "Memory mfn %lx offline failed\n", mfn);
-                if ( status & PG_OFFLINE_ANONYMOUS)
-                    fprintf(stderr, "the memory is an anonymous page!\n");
-                ret =3D -1;
-                break;
-            }
-            case PG_OFFLINE_PENDING:
-            {
-                if (status & PG_OFFLINE_XENPAGE) {
-                    ret =3D -1;
-                    fprintf(stderr, "Memory mfn %lx offlined succssefully,=
"
-                            "this page is xen page, current state is"
-                            " [PG_OFFLINE_PENDING, PG_OFFLINE_XENPAGE]\n",=
 mfn);
-                }
-                else if (status & PG_OFFLINE_OWNED)
-                {
-                    int result, suspend_evtchn =3D -1, suspend_lockfd =3D =
-1;
-                    xenevtchn_handle *xce;
-                    xce =3D xenevtchn_open(NULL, 0);
-
-                    if (xce =3D=3D NULL)
-                    {
-                        fprintf(stderr, "When exchange page, fail"
-                                " to open evtchn\n");
-                        return -1;
-                    }
-
-                    domid =3D status >> PG_OFFLINE_OWNER_SHIFT;
-                    if (suspend_guest(xch, xce, domid,
-                                      &suspend_evtchn, &suspend_lockfd))
-                    {
-                        fprintf(stderr, "Failed to suspend guest %d for"
-                                " mfn %lx\n", domid, mfn);
-                        xenevtchn_close(xce);
-                        return -1;
-                    }
-
-                    result =3D xc_exchange_page(xch, domid, mfn);
-
-                    /* Exchange page successfully */
-                    if (result =3D=3D 0)
-                        printf("Memory mfn %lx offlined successfully, this=
 "
-                                "page is DOM%d page and being swapped "
-                                "successfully, current state is "
-                                "[PG_OFFLINE_OFFLINED, PG_OFFLINE_OWNED]\n=
",
-                                mfn, domid);
-                    else {
-                        ret =3D -1;
-                        fprintf(stderr, "Memory mfn %lx offlined successfu=
lly"
-                                " , this page is DOM%d page yet failed to =
be "
-                                "exchanged. current state is "
-                                "[PG_OFFLINE_PENDING, PG_OFFLINE_OWNED]\n"=
,
-                                mfn, domid);
-                    }
-                    xc_domain_resume(xch, domid, 1);
-                    xc_suspend_evtchn_release(xch, xce, domid,
-                                              suspend_evtchn, &suspend_loc=
kfd);
-                    xenevtchn_close(xce);
-                }
-                break;
-            }
-        }//end of switch
-    }//end of if
-
-    return ret;
-}
-
-static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, int), int cpu)
+static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, int), int cpu,
+                          xc_interface *xch)
 {
     int ret;
=20
@@ -265,7 +51,7 @@ static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, i=
nt), int cpu)
     return ret;
 }
=20
-static int hp_cpu_online_func(int argc, char *argv[])
+static int hp_cpu_online_func(int argc, char *argv[], xc_interface *xch)
 {
     int cpu, ret;
=20
@@ -277,7 +63,7 @@ static int hp_cpu_online_func(int argc, char *argv[])
=20
     cpu =3D atoi(argv[0]);
     printf("Prepare to online CPU %d\n", cpu);
-    ret =3D exec_cpu_hp_fn(xc_cpu_online, cpu);
+    ret =3D exec_cpu_hp_fn(xc_cpu_online, cpu, xch);
     if (ret < 0)
         fprintf(stderr, "CPU %d online failed (error %d: %s)\n",
                 cpu, errno, strerror(errno));
@@ -287,7 +73,7 @@ static int hp_cpu_online_func(int argc, char *argv[])
     return ret;
=20
 }
-static int hp_cpu_offline_func(int argc, char *argv[])
+static int hp_cpu_offline_func(int argc, char *argv[], xc_interface *xch)
 {
     int cpu, ret;
=20
@@ -298,7 +84,7 @@ static int hp_cpu_offline_func(int argc, char *argv[])
     }
     cpu =3D atoi(argv[0]);
     printf("Prepare to offline CPU %d\n", cpu);
-    ret =3D exec_cpu_hp_fn(xc_cpu_offline, cpu);
+    ret =3D exec_cpu_hp_fn(xc_cpu_offline, cpu, xch);
     if (ret < 0)
         fprintf(stderr, "CPU %d offline failed (error %d: %s)\n",
                 cpu, errno, strerror(errno));
@@ -308,76 +94,27 @@ static int hp_cpu_offline_func(int argc, char *argv[])
     return ret;
 }
=20
-static int main_smt_enable(int argc, char *argv[])
-{
-    int ret;
-
-    if ( argc )
-    {
-        show_help();
-        return -1;
-    }
-
-    for ( ;; )
-    {
-        ret =3D xc_smt_enable(xch);
-        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
-            break;
-    }
-
-    if ( ret < 0 )
-        fprintf(stderr, "Unable to enable SMT: errno %d, %s\n",
-                errno, strerror(errno));
-    else
-        printf("Enabled SMT\n");
-
-    return ret;
-}
-
-static int main_smt_disable(int argc, char *argv[])
-{
-    int ret;
-
-    if ( argc )
-    {
-        show_help();
-        return -1;
-    }
-
-    for ( ;; )
-    {
-        ret =3D xc_smt_disable(xch);
-        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
-            break;
-    }
-
-    if ( ret < 0 )
-        fprintf(stderr, "Unable to disable SMT: errno %d, %s\n",
-                errno, strerror(errno));
-    else
-        printf("Disabled SMT\n");
-
-    return ret;
-}
-
 struct {
     const char *name;
-    int (*function)(int argc, char *argv[]);
+    int (*function)(int argc, char *argv[], xc_interface *xch);
 } main_options[] =3D {
     { "help", help_func },
     { "cpu-online", hp_cpu_online_func },
     { "cpu-offline", hp_cpu_offline_func },
+#if defined(__i386__) || defined(__x86_64__)
     { "mem-status", hp_mem_query_func},
     { "mem-online", hp_mem_online_func},
     { "mem-offline", hp_mem_offline_func},
     { "smt-enable", main_smt_enable },
     { "smt-disable", main_smt_disable },
+#endif
 };
=20
=20
 int main(int argc, char *argv[])
 {
     int i, ret;
+    xc_interface *xch;
=20
     if (argc < 2)
     {
@@ -402,7 +139,7 @@ int main(int argc, char *argv[])
         return 1;
     }
=20
-    ret =3D main_options[i].function(argc -2, argv + 2);
+    ret =3D main_options[i].function(argc -2, argv + 2, xch);
=20
     xc_interface_close(xch);
=20
diff --git a/tools/misc/xen-hptool.h b/tools/misc/xen-hptool.h
new file mode 100644
index 0000000000..34f492c34b
--- /dev/null
+++ b/tools/misc/xen-hptool.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_HPTOOL_H__
+#define __XEN_HPTOOL_H__
+
+#if defined(__i386__) || defined(__x86_64__)
+int hp_mem_online_func(int argc, char *argv[], xc_interface *xch);
+int hp_mem_query_func(int argc, char *argv[], xc_interface *xch);
+int hp_mem_offline_func(int argc, char *argv[], xc_interface *xch);
+int main_smt_enable(int argc, char *argv[], xc_interface *xch);
+int main_smt_disable(int argc, char *argv[], xc_interface *xch);
+#endif
+
+void show_help(void);
+
+#endif /* __XEN_HPTOOL_H__ */
--=20
2.55.0

