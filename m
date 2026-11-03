Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B300606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=BE/V+1Xc
Received: from list by lists.xenproject.org with outflank-mailman.1470386.1679201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILV-0004Ma-5c; Tue, 03 Nov 2026 17:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470386.1679201; Tue, 03 Nov 2026 17:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILV-0004ML-0e; Tue, 03 Nov 2026 17:30:53 +0000
Received: by outflank-mailman (input) for mailman id 1470386;
 Tue, 03 Nov 2026 17:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILS-0003zy-KP
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILS-004K9k-0q
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:50 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a33-8faa-0a2a0a5109dd-0a2a4509c172-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:49 +0100
Received: from [52.101.65.123]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a49-be1a-0a2a45090019-3465417baad2-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:49 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:47 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:47 +0000
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
 b=YScjHfquUkilW05YxEFjmK1AzfPkjq+Bi3bvJK++mNNksvDaLc0SOgXdTm35DM4vhlPNJ1DxLmUZepyHGDdgov1ztterx13YrLXSp1M3AvRbUhFdsU/yM1OhEWUrc+i3QZoKD2g7YLcvuwU/uJ1ZiQpXQvM1ZVIeY/ehgWx1MzcMSCvmSZ9r6MQLvkcFsHEkvOUJjr1qcB41dW5b00Yg8mfiFmjt4thyTKKil0NaWKHI/vS7H8rbk+3fyITkMqltE4sOUsqIsfTG6+8BCtAWNwBVq1LDKxMXtP7pwxBe2gjpROD48vTBqiWUTuSVhKhct3zapFMMbOpB6fiHhK3LMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQQWDYgVBK9Xy0eBL6vz64/IrL5f8shtX7pWHt5PHfI=;
 b=TP+e7Mt1mIS7kJoUlBiT/6jHBd0gZ4++glFCpo/DkXM105CFQ0dTlDkwju9Swo9MHnwL/Z19f9CJ+cMK26JJfj1pRadRZWJOGVXy0U+YSS2j9+bRCxLh/el3FOboHSxCEc7h4/2Z0wF5EH8oSgyY1zybbwp4Y8Nqe0lBDdnZ8Kv2qVlQG61KNb2HpaL0xCM2V0b8F8IBEJEgDE2ALZlEYNwU0Hh/PQfgAfXn6sNDcb8QCka0+ygDTP38dCRh3iforyMGYqHMOCxZUjPQukAnUO6WyAX7RXVKIOZnFuOC9y6toRFE+xQwMzsMT6ceTefAxmtEwAVR646mBIbirfdRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQQWDYgVBK9Xy0eBL6vz64/IrL5f8shtX7pWHt5PHfI=;
 b=BE/V+1Xcr+OOevg4yThCCbENNvxGqnBpF+MVmR0oyZBmXqV9xyBg5ZDwvuwhCrxDjpnBW2TGJ4X0a6fX9l9jK0UZftrZ/C1vCqPZirv+pCmOmHijH+AST0ApKkQOYxUaTY0hiZpX2R8ROFfhgeyK5BkHDEiUmuybIDEsPdw8eH+askJu/sPbU5aOFDp6lxt+fg0IrDzPF2boEGywTrb/2yztoO8ZerHSPsCEeJ59FTv3EvtmTiOig3iJU7YEDtqY8SNmoLOs2dd0OrAQMqy53xGOfXytS54RgTiCb9c+Z98pXwFGLo1FsX9lYyDdT7kJktV/nUrp/MtQILJvHfm81A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v5 16/22] xen/arm: vsmmuv3: Insert vIRQ properties into vIOMMU
 device tree node
Thread-Topic: [PATCH v5 16/22] xen/arm: vsmmuv3: Insert vIRQ properties into
 vIOMMU device tree node
Thread-Index: AQHda7kQMHPRCWWvpUGDZFNoCpKf4w==
Date: Tue, 3 Nov 2026 17:30:47 +0000
Message-ID:
 <cf1f3be236c99fa0a0ed1b25f9e580a0be3c411f.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|DBBPR03MB10511:EE_
x-ms-office365-filtering-correlation-id: 8051eb23-a04a-4ba8-125a-08df39d0328b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 7+x4LDmftXzPMfFzi+/N+3nei7763pJ7GcPNUXjtNKSpSMr7wiU7JixO5ER5YT4Pl6H9+8Iz4Q2lYP8F+k7Qs6iWhse14YsAvlkztGP2C9C5YNKgExHuxTu9CbjewhZAIEjZx85S/tLY0TcohJYCMCPLV7jmIhCA7htzzQYesTytwobPlWnB9+o9ba3WJCriikJqHY6iqGEeLrEDxQb/6VrIiqdDC3fcgeo7jUZuIrs9DmRBX3sbesSHtfEjYaC1gU2Bi7hcUCE+fmASwpZ0RimGvYCPVahE1g0QITNVQ6poK2AdCKgC6JizRoZ9PAGOKQg+RWNhCvEZh/72vKdpzFm9uvVQ6D+0jJe051V9ofWbwh8j/npKsePj7PK6BVpUNPsw1jBxNcNCYj9fWIUHdJ5HbkG6HlT0Uqg1qEg0FZA6bLfsfU6g+KJPZhGAeP8+IrInt4POOsRlWfbJmYExHOMhJH/l8Kt4BRVrFg2OOdijPmQpbsghErZLa2UHZaDdbl7bWn8QgLwTFnwJ9bqftq/8LptLc5JfcIkwJwmi5IKrZNhk+4xBfwD9nMQ8CVW8L5U99CCZxs8iJXPC9nHod07GbXOqZoolyBQwPhwlsAfho/551DZlF/Hgb3diZbOAcLE7roj99ChV9O5tcBiJ+o1FkgjkZbae5H7PfPhm1+CWLIf+ShgpnwS/Lm44q/HIactQlPshs2cKdFqk+dBYIaqRPn8n3HGBDMMH705aniY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+3QSgQYohqGPRFfHYDA14BViwaTB3FZ5ksYvzZXo/WVYnP5kB//J18BC6w?=
 =?iso-8859-1?Q?t9Ab/jKe45OBj06g3dTYK41RHCENFpWJxl6qeiY7iZiTBPkdigSzVJkGgg?=
 =?iso-8859-1?Q?K5MX1kaR+n6UJzGaxAfp2tLr+Vw8CoHT6Qgop4wO0sGbiBsuKZvx655k3H?=
 =?iso-8859-1?Q?fVvzyxCxmiN7GbKTgZw3VKNgYNLXxGceDi7SeD0DcrCToUYg70Zk2F4mmc?=
 =?iso-8859-1?Q?q2I5AR2wt7XScyOEV/b25nO9HJ+B+LF+QYFcIPeJCKtHHoZ6cATqnwviiq?=
 =?iso-8859-1?Q?g+l3+hvONbLcv10CceafBnVfyEFwT0vBbVCIUFdLNEGcWrfaFyjAWaB4bj?=
 =?iso-8859-1?Q?37ellnZ4tltSDGRdOa0yOMBDn5qZd7h//AYz/OpqkmvjlDyCHGl15CzAgE?=
 =?iso-8859-1?Q?tHVie+oZYe2BY7JDGvsCVii2IvO4AmtTZwMGejLTVmk5Gj40nQ57Nykw0C?=
 =?iso-8859-1?Q?O5WeinrtlozwgaJNqaJoHvgsJdoPIFxEQSM4hmVc5AoiKNaqBie0vulRJ2?=
 =?iso-8859-1?Q?G3GBgZwrv8HJfaCPgwsxpBSYmbaT5L2BxqQc5TmNAQyXNNbIUR5pTUWzNf?=
 =?iso-8859-1?Q?/JKwGywhqrXIGmiHpZIeBj9D1Pb4T7Dv6IXv1V2l1HU+u99xTWrYApX+RR?=
 =?iso-8859-1?Q?v1hlLEIkLmqNPXk0GIg9XATLOTjH/qIE2mnxpkOe0YJ5Tmi07C8WZCseFh?=
 =?iso-8859-1?Q?IZFl43odyN5zhwAwoLTlazfPrm7JTUo3njlAm1QP1KJ7GqKVnfB8JRPglF?=
 =?iso-8859-1?Q?NwB4DYC3Nl72EA+YDnyDdjiHg2TqardjuPfxYisJiqC5pXSTwLQVpFH/mr?=
 =?iso-8859-1?Q?5ICYHtJutcseEK5XuWQ7q34kLDxxuBBfyc/X9oX1TH8zBK1ad0Ivt2YAqu?=
 =?iso-8859-1?Q?om31ALRTeTR35pYBFbZATMj3JJrGJKMZb6xEAl9RvXppuYBUWhLyetfngU?=
 =?iso-8859-1?Q?DyNJoMOl9IY1m5iC8Rsfc+Q+JK09meB+7Y1wXXa+WORw1QFAUDQHgH4kQA?=
 =?iso-8859-1?Q?r2R7ubB0aj8zRoL2Xxng5Gso8S7jLxRN9XmP73T9zR1ouk4d0VHGLMkIEH?=
 =?iso-8859-1?Q?CWEOlh5UuQD9tf8/Y/TE/+xAt3M2JnFU4yqPDVoVQRvCJ9bQM5bgK/QGue?=
 =?iso-8859-1?Q?fkIcDD+P8QtxdzWvkSdsiwn81lnB73ZzEJ61l/J9EGJVQFQ783IgsHurlI?=
 =?iso-8859-1?Q?jMgfF2yMVYThjNtp9s48wyQ8bjgiYUlZM4LqRc9f+Folfm7+jPyIKu3cPQ?=
 =?iso-8859-1?Q?4F35X2rIrNRzz92Nc/dS2kAlkJWCScSGtQAGghY8VsqbOR8IodWfdcjSgd?=
 =?iso-8859-1?Q?8g0r91D7/0GfuXJH5/q+iiHOKmaPiGNmyB1z/t05QawjxXcHWfoatCcf0I?=
 =?iso-8859-1?Q?3CWQMu7Bu1ow6CAFM8qRBdkwXwhggst17FVseLhUJXTBHkzv/c7kB6NRkI?=
 =?iso-8859-1?Q?MEl8WJr8yJ8lxhcbmt7vyCqObYgmjA4bJkTLqvsEhaIF4Su0qtdlwQtsuU?=
 =?iso-8859-1?Q?iemC36qUbIyV7SMWGK+4oFzkWEuX5SBEd3JVrpw2qeAQ4hXtWeQ3zJyDYa?=
 =?iso-8859-1?Q?JnHeVhmTp88Ft5A3LsrE/s1sQyOSetAnrYrUol0pJqOBCugeRNOHuEFcID?=
 =?iso-8859-1?Q?j17+nPo9Sw6fsXb6avRLtvsvj+r/bpS+l2dkLfUwJjl4dRlWDP9MeEQ+Ng?=
 =?iso-8859-1?Q?clWxuu1bMQoWeHGUNPbdahJ6zZNNTsM2UwuRZNLKrnhM+gDVoDC6HgjlQI?=
 =?iso-8859-1?Q?NlrJJdq0xF0KhS0y4fYhCV1N0lss/N1lX6De1JsA49ma9bRQCF5jrLDecB?=
 =?iso-8859-1?Q?FUw6ces8gQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8051eb23-a04a-4ba8-125a-08df39d0328b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:47.3380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5vauGrN0gjMw3BF0uqcOwiTLxHi3JgM2CyzAXQnqKG3k+3HpoTktRivi3RY7nR97mgttxCTtpvHa4xOTy4Ruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-bad1c0/1793727049-BEEDE034-69C4ED5A/0/0
X-purgate-type: clean
X-purgate-size: 4443
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Insert vIRQ properties for event queue and GERROR handling into the
emulated IOMMU device tree node for dom0less and libxl guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c  | 30 +++++++++++++++++++++++++++---
 xen/arch/arm/dom0less-build.c | 17 +++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index bbcc989284..72b19d68af 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -86,8 +86,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     uint32_t nr_spis =3D 0, cfg_nr_spis =3D d_config->b_info.arch_arm.nr_s=
pis;
     unsigned int i;
-    uint32_t vuart_irq, virtio_irq =3D 0;
-    bool vuart_enabled =3D false, virtio_enabled =3D false;
+    uint32_t vuart_irq, virtio_irq =3D 0, vsmmu_irq =3D 0;
+    bool vuart_enabled =3D false, virtio_enabled =3D false, vsmmu_enabled =
=3D false;
     uint64_t virtio_mmio_base =3D GUEST_VIRTIO_MMIO_BASE;
     uint32_t virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
     int rc;
@@ -97,11 +97,21 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
      * of SPI VIRQ for pl011.
      */
     if (d_config->b_info.arch_arm.vuart =3D=3D LIBXL_VUART_TYPE_SBSA_UART)=
 {
-        nr_spis +=3D (GUEST_VPL011_SPI - 32) + 1;
         vuart_irq =3D GUEST_VPL011_SPI;
+        nr_spis =3D max(nr_spis, vuart_irq - 32 + 1);
         vuart_enabled =3D true;
     }
=20
+    /*
+     * If smmuv3 viommu is enabled then increment the nr_spis to allow
+     * allocation of SPI VIRQ for VSMMU.
+     */
+    if (d_config->b_info.arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMM=
UV3) {
+        vsmmu_irq =3D GUEST_VSMMU_SPI;
+        nr_spis =3D max(nr_spis, vsmmu_irq - 32 + 1);
+        vsmmu_enabled =3D true;
+    }
+
     for (i =3D 0; i < d_config->num_disks; i++) {
         libxl_device_disk *disk =3D &d_config->disks[i];
=20
@@ -170,6 +180,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return ERROR_FAIL;
         }
=20
+        if (vsmmu_enabled && irq =3D=3D vsmmu_irq) {
+            LOG(ERROR, "Physical IRQ %u conflicting with vSMMUv3 SPI\n", i=
rq);
+            return ERROR_FAIL;
+        }
+
         if (irq < 32)
             continue;
=20
@@ -927,6 +942,7 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
 {
     int res;
     const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+    gic_interrupt intr;
=20
     res =3D fdt_begin_node(fdt, name);
     if (res) return res;
@@ -945,6 +961,14 @@ static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
     res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
     if (res) return res;
=20
+    res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+    if (res) return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property_interrupts(gc, fdt, &intr, 1);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 6bd705102f..9e519ff3da 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -226,6 +226,7 @@ static int __init make_vsmmuv3_node(const struct kernel=
_info *kinfo)
     char buf[24];
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    gic_interrupt_t intr;
     void *fdt =3D kinfo->fdt;
=20
     snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
@@ -256,6 +257,22 @@ static int __init make_vsmmuv3_node(const struct kerne=
l_info *kinfo)
     if ( res )
         return res;
=20
+    res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+    if ( res )
+        return res;
+
+    set_interrupt(intr, GUEST_VSMMU_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property(kinfo->fdt, "interrupts",
+                       intr, sizeof(intr));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(kinfo->fdt, "interrupt-parent",
+                            kinfo->phandle_intc);
+    if ( res )
+        return res;
+
     res =3D fdt_end_node(fdt);
=20
     return res;
--=20
2.43.0

