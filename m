Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3010606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=B+JJdynY
Received: from list by lists.xenproject.org with outflank-mailman.1470358.1679157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILF-000221-DS; Tue, 03 Nov 2026 17:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470358.1679157; Tue, 03 Nov 2026 17:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILF-0001zk-2r; Tue, 03 Nov 2026 17:30:37 +0000
Received: by outflank-mailman (input) for mailman id 1470358;
 Tue, 03 Nov 2026 17:30:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILD-0001ik-KB
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILC-00F7AL-VS
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:34 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a36-bab6-0a2a0a5309dd-0a2a450498fe-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:34 +0100
Received: from [52.101.83.140]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a3a-b57f-0a2a45040019-3465538c3297-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:34 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:33 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:32 +0000
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
 b=JmB0OawuMNHPtDKsb0hox4fYgyDgia5r1xbv+nbknovn6DYPqZ5/HQYqaskOXxADbq5U6SlkzRSUcYfJPJzGu2q+efW9pBsA70xGofkWdGvgGoXpuO3diKeXfPmSELVBMafSdHdYxbzKFVg+OEPT85Vb8K+eJ2Q6e2nRUTdzRnOSFfwYsq4Y5leQcWn0m3vbLU/vINoxcWVFHojAg0zN1FJ9Fo/SFrG6kZOO/kPCzrChGXdp4CR67QPlQnME1i2xbu5Vzs2Jo9KR0DasWDR5KG5F521lPY0th/NA4+op8HqpvoZciGK/E09081flsUCgptRCl20/j3XIPZPElefivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUXhi2FmOcD1qpvabmQIRGtPrND2M2ONfxDnBn4m6VU=;
 b=XdKgOXV9nYDTo1zzi4afqWpL7ZxgWayQltZCuxevgCACN7TVVqzDzy3/zom6Xc8gRmPi9ibMh4bIIGgmiZ7IV/OONFzlBXv3ruI2wKtQwsG9ajZnywSIX2NfjbxjyZrE5IUnYfmnJFjvNJOr/EOogzzyDT1RmlRtjFS54lLcm/S5n36oxbsTr49AN4MccIpclULxQIoXxamwm9slziXbKOVhOjgrA/tfU/nX/nDas27sv6RF8NY0SCvSDonGG94NceZ0e9cLXYLfRDLI5/5n4a9Hh4JGM7CbVz9Ih21m/lOfSTZnWdZJcNTTz8u9PfIY2675XTuv0FUla88KhB7iFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUXhi2FmOcD1qpvabmQIRGtPrND2M2ONfxDnBn4m6VU=;
 b=B+JJdynYaNMr0JW+Yi8nxTNbXgx7HYi8fiHTkrKTyxKhBYHqPM4h2JSWawQJntpYcAvEQK6UARjmTsgDxJclqfz7FGh24744sH7kV9arj8O7cbnsV6UuZz8NqxT6Iv/kT1nbObx2Ou3IjJa+AkyCDy8m3RVgyy8R/kq9tyLACjVRZYaqukUZj5PabFjt5Ru1AAN6Bwl9Ley7QVuy6oz3I0nBF9JYg45ff8K8c+rqhAKggLRHAAdXkHJ17w4sFPpmlVZ0qyMh2qnKImmK4TlJ/6+p7tO6wKALhfpgquz0MK5fMeow0CZ8HLtZQFjkYMqx4Ku/7RV9W7GOCbBsseOdiA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 12/22] xen/arm: vsmmuv3: Add support for event queue and
 global error
Thread-Topic: [PATCH v5 12/22] xen/arm: vsmmuv3: Add support for event queue
 and global error
Thread-Index: AQHda7kHIstkwkoHG0iW7e6KNO1jCg==
Date: Tue, 3 Nov 2026 17:30:32 +0000
Message-ID:
 <bbed62ef1ad451168223bcd05a9236696afca2d6.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 7ec186c2-5767-4f28-c386-08df39d029f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 NTbZP/tArqbGlCb368ftOAsDqCdN60RXpuyZKoBTrpTi/sbqY3Msck+16q0k7e6lg4/bGQdWyT9Jl/KtaPOh9mkD0zUYXahCxKuooC5pPCoCxdS7eqo32hHVoTUUThALu9sB1gnQ2Uti4P/zz4YA2whqAUvBYaaT4fsmUgK/n+luIroCkM97DLo1mFv8PTsfbqqhcqxfyc/FKuWIVzQhbovNS0aDuUBngBZOwt98YSw6YS9BjEAd+uaGHsJ3Z+8PgOhYthxARMPxKCpm8DOCndgXwNuFgiBdFFkzc6YcdgoNL3CExvCO2wzGatC9iVBcgqG57fFqGFScLF/S4c1o2Hm7E9bb8GpyH+slmyVQuuer6PsytOX5Y23xBv2z0GH1JqfD4wexdwe3Adp7cNTDZzTLVwhkmsLZIokRKFxM06zT/URiYTRu4xdQfMbYyUURUmucrXS3LhwKgM1zMGuvDP8RgKH10etqV+wpdSHEnCww+g1zk5ZQ7E8nym2r1Nzerko2t3uQ8pSb3pMK8zd/fXbJWplSx2SxjEcL8FIkVe1pr9sNdEvCzvuGSuwkkzcf82XGPY55UhVGgxuV3mGw+2/z5X1R1SJHHogxmU/ny0rBfuRXAqorxZpMT4TjJiP0El3scWly7vT8KjHkcHWQAhVT/95MF0JZyRRvn2gK6FkJ6U7rF3pXEiKz/ZsnxCUa4vP/w30S3eNKyhShHCIQ82tHM+PElIsIgaJISHwMHhg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0OOf0H7PynYIF3Iv5UtXem8X4i0+CBi0GKVMmcC4JJr1XHIWNLyjGZYZz6?=
 =?iso-8859-1?Q?ZsnYofNiRiirZrpjySxL3bJYaCHufYQzssRMRcfBTbddBxqP3+HIPC8n5B?=
 =?iso-8859-1?Q?Lw04a9E5gfJfLqlpM82FwtLKK1RgpB55fEPtuh2i4wCpDlD3R9AoPu1e2D?=
 =?iso-8859-1?Q?uGgrJ/lePmiNVR2QIrAtPNl29dcWw4XNF+rJJP0GFucE+ACF/CBUCy16q7?=
 =?iso-8859-1?Q?iZWslvHcoHd74/2WxF7XdU8PG7zadZaE3rnukqQg1FFCw6eu+lw+lehEnf?=
 =?iso-8859-1?Q?3CQEMIhHT/nsKEP8Pt/MuHxfBsm3jiAzDGLlOUG5KuSmdQaociAPGMynj/?=
 =?iso-8859-1?Q?LPuj4sehQRy2kZj+bOp846pZTP3AmZCCLqM7Wk9vcqIez+X0CyJQbmmfkh?=
 =?iso-8859-1?Q?KxLKfCLQCVmExUyKk77MWaONrA87Vc5B9jMlTlv93lZ9s5+BMshi66Wp1p?=
 =?iso-8859-1?Q?pUF86QSxkRiYUoS3ntgz4zELtZDmwItWKMnTIn7r9peqovH/nekU9UWUfI?=
 =?iso-8859-1?Q?J5engSd0C7BhJ1VGQr1kgUJORAnPBg4hv8tDhGIlDTsS4R01dRf5KwDEZ5?=
 =?iso-8859-1?Q?Eex88ZO8MW/xAlR6pTn82J52UID368Je3gwA/7tZafA2gT5GLHKMdvBfRb?=
 =?iso-8859-1?Q?0E71ZFyQ+tW7ao0yIqcoiawPa55YMykgJRqzukgdnE9DPGDhirsISmo04x?=
 =?iso-8859-1?Q?Eepulep+xFBOuy5inL9Wdca7v7h6PrhWulHeQKfysjQ9FLUbAebOrzRZeZ?=
 =?iso-8859-1?Q?ZMgGBXvDC9jisBBgJkB6goNon5yx2NK6IlydLYtrb7+5nEOUSEF/KjIMPw?=
 =?iso-8859-1?Q?aq4TKJCApKlHW+BzYFFENvpqYY1RgdaWAfsDqM+O8vA8iLsSXQF9sep2Sj?=
 =?iso-8859-1?Q?NAXUGZrbC0fuFkPPyzzphkRTQ8Cm74lrcOFPNTtVaya5CwDI93ZeAjFDuQ?=
 =?iso-8859-1?Q?AxMA8kAg/EqR9lblnY2nZ0oUS68daFA5v3NkPMSt0blGJFOlBOzjt4j+oX?=
 =?iso-8859-1?Q?TCa4FDLffXFigSaXvdkZGcWUNYWB5Kaimn3qpcIlpqkMotXOYm64c7ju9H?=
 =?iso-8859-1?Q?+hMKU71RkAq6yItSB/+QaDe/wK2oR5W7Ib889TSCtkEAcYkwYiBJHBHKW8?=
 =?iso-8859-1?Q?gtMghLmyIJ3d1BP6kTBjn/BWZSZkJPm3RrQwbBtUrNNX6K/ggn95PUM/e5?=
 =?iso-8859-1?Q?d7lzIaINthpYA2rNJ9lRMGhC9GskGPmJL5BtWBHVim2Npgn0dFuxXH4XXf?=
 =?iso-8859-1?Q?HFJBGQ7XL0WFnqX5QZpiRiLeAITSLYC7oon55NgKWveOJjMpglvZY/qF2V?=
 =?iso-8859-1?Q?Ir4PfXfblWXjWAThn9BB/kMW4UjXCRJDayrtft0szMax9cBUO9dvtCerZa?=
 =?iso-8859-1?Q?hJjZNmosKsdxS+x9hdYtWHNCFuzFymZNz4C8VtfHkrUbZAl52VHTC/5ebj?=
 =?iso-8859-1?Q?BJIHnKE0HyRMa89I768N3h8z/NupMP46AZBMxl5gHmb7wIp59TGgdqeDab?=
 =?iso-8859-1?Q?n5XuH9IWP1YQQxqqChTZyVB48Ffc0RoeJBtjsBLZN3L+r4iSUG2fl2ldUz?=
 =?iso-8859-1?Q?hgrMhWqV8V+jU/fyH5LOjQiZMJe+MTQeH8HDpPaCC9niJkaNP5UWVIHDjj?=
 =?iso-8859-1?Q?P17Zo05a4q/Hby5BtHX54OkiNsJaSYAys0xjAtTxfUe3NzeAcWkkQ46I6J?=
 =?iso-8859-1?Q?oOM+zQuoBb/k79d7GpmEVRrURbiwnh7pWNLQuoo3WPtDGWpu4yGzOlQtr+?=
 =?iso-8859-1?Q?55XOnre1gBzUBC/KmD30IW6gyQRf5gC04/OP/CIiFqKLuz7ra0QH2XaRwv?=
 =?iso-8859-1?Q?BskCAeZN4w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec186c2-5767-4f28-c386-08df39d029f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:32.8947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPw/tZw2B3PVIcr0R/8aqf89USNSW1vU7NecbD7UE8QsF8TEG4fE4AORgRQxKgsEYb7u1DmEyVBZrKktG/A90Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-ebf023/1793727034-C38C1B50-89595D96/0/0
X-purgate-type: clean
X-purgate-size: 19476
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Event queue is used to send the events to guest when there is an events/
faults. Add support for event queue to send events to guest.

Global error in SMMUv3 hw will be updated in smmu_gerror and
smmu_gerrorn register. Add support for global error registers to send
global error to guest.

Add architectural error handling to the emulated command queue,
updating the global error register and stopping command consumption
on error.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c          |  50 +++--
 xen/drivers/passthrough/arm/smmu-v3.h  |  20 ++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 246 +++++++++++++++++++++++--
 xen/include/public/arch-arm.h          |   2 +
 4 files changed, 295 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index b55218d920..6ad2a1b745 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -386,34 +386,60 @@ int __init arch_parse_dom0less_node(struct dt_device_=
node *node,
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
         int vpl011_virq =3D GUEST_VPL011_SPI;
+        int vsmmu_virq =3D GUEST_VSMMU_SPI;
=20
         d_cfg->arch.nr_spis =3D vgic_def_nr_spis();
=20
         /*
-         * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
-         * set, in which case it'll match the hardware.
-         *
-         * Since the domain is not yet created, we can't use
-         * d->arch.vpl011.irq. So the logic to find the vIRQ has to
-         * be hardcoded.
-         * The logic here shall be consistent with the one in
-         * domain_vpl011_init().
+         * The VPL011 and VSMMU interrupts use predefined virtual SPIs,
+         * unless direct-map is set, in which case they match the
+         * corresponding hardware interrupts.
          */
         if ( flags & CDF_directmap )
         {
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+            struct host_iommu *hw_iommu;
+#endif
+            /*
+             * Since the domain is not yet created, we can't use
+             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
+             * be hardcoded.
+             * The logic here shall be consistent with the one in
+             * domain_vpl011_init().
+             */
             vpl011_virq =3D serial_irq(SERHND_DTUART);
             if ( vpl011_virq < 0 )
                 panic("Error getting IRQ number for this serial port %d\n"=
,
                         SERHND_DTUART);
-        }
=20
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+            /*
+             * The host SMMU list is already populated during SMMUv3 drive=
r
+             * probe, so we can determine the highest SMMU interrupt ID
+             * from this list.
+             */
+            vsmmu_virq =3D 0;
+            list_for_each_entry(hw_iommu, &host_iommu_list, entry)
+            {
+                vsmmu_virq =3D MAX(vsmmu_virq, hw_iommu->irq);
+            }
+#endif
+        }
         /*
-            * vpl011 uses one emulated SPI. If vpl011 is requested, make
-            * sure that we allocate enough SPIs for it.
-            */
+         * vpl011 uses one emulated SPI. If vpl011 is requested, make
+         * sure that we allocate enough SPIs for it.
+         */
         if ( dt_property_read_bool(node, "vpl011") )
             d_cfg->arch.nr_spis =3D MAX(d_cfg->arch.nr_spis,
                                       vpl011_virq - 32 + 1);
+
+        /*
+         * vsmmu uses one emulated SPI. If vsmmu is enabled, make
+         * sure that we allocate enough SPIs for it.
+         */
+        if ( d_cfg->arch.viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV=
3 )
+            d_cfg->arch.nr_spis =3D MAX(d_cfg->arch.nr_spis,
+                                      vsmmu_virq - 32 + 1);
     }
     else if ( flags & CDF_hardware )
         panic("nr_spis cannot be specified for hardware domain\n");
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index 4a912be740..44ecb5d89c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -358,6 +358,26 @@
=20
 #define EVTQ_0_ID			GENMASK_ULL(7, 0)
=20
+#define EVT_ID_BAD_STREAMID		0x02
+#define EVT_ID_BAD_STE		    	0x04
+#define EVT_ID_TRANSLATION_FAULT	0x10
+#define EVT_ID_ADDR_SIZE_FAULT		0x11
+#define EVT_ID_ACCESS_FAULT		0x12
+#define EVT_ID_PERMISSION_FAULT		0x13
+
+#define EVTQ_0_SSV			(1UL << 11)
+#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
+#define EVTQ_0_SID			GENMASK_ULL(63, 32)
+#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
+#define EVTQ_1_STALL			(1UL << 31)
+#define EVTQ_1_PnU			(1UL << 33)
+#define EVTQ_1_InD			(1UL << 34)
+#define EVTQ_1_RnW			(1UL << 35)
+#define EVTQ_1_S2			(1UL << 39)
+#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
+#define EVTQ_1_TT_READ			(1UL << 44)
+#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
+#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
 /* PRI queue */
 #define PRIQ_ENT_SZ_SHIFT		4
 #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 72f8075e0a..17e83dcb1a 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -86,6 +86,35 @@
 #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
                                     FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
=20
+/* event queue entry */
+struct arm_smmu_evtq_ent {
+    /* Common fields */
+    uint8_t     opcode;
+    uint32_t    sid;
+
+    /* Event-specific fields */
+    union {
+        struct {
+            uint32_t ssid;
+            bool ssv;
+        } c_bad_ste_streamid;
+
+        struct {
+            bool stall;
+            uint16_t stag;
+            uint32_t ssid;
+            bool ssv;
+            bool s2;
+            uint64_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+            uint8_t class;
+            uint64_t addr2;
+        } f_translation;
+    };
+};
+
 /* stage-1 translation configuration */
 struct arm_vsmmu_s1_trans_cfg {
     paddr_t s1ctxptr;
@@ -116,6 +145,7 @@ struct virt_smmu {
     uint32_t    strtab_base_cfg;
     uint64_t    strtab_base;
     uint32_t    irq_ctrl;
+    uint32_t    virq;
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
@@ -161,9 +191,15 @@ static inline bool smmu_get_evtq_enabled(struct virt_s=
mmu *smmu)
     spin_unlock(&smmu->cr0_lock);
=20
     return enabled;
-};
+}
=20
 /* Queue manipulation functions */
+static bool queue_full(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) !=3D Q_WRP(q, q->cons);
+}
+
 static bool queue_empty(struct arm_vsmmu_queue *q)
 {
     return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
@@ -176,12 +212,141 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q=
)
     q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
 }
=20
+static void queue_inc_prod(struct arm_vsmmu_queue *q)
+{
+    u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
+    q->prod =3D Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
+}
+
 static void dump_smmu_command(uint64_t *command)
 {
     gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
=20
+static void arm_vsmmu_update_irq(struct virt_smmu *smmu)
+{
+    bool evt_pending =3D false;
+    bool gerr_pending =3D false;
+    uint32_t irq_ctrl;
+
+    spin_lock(&smmu->irq_cfg_lock);
+    irq_ctrl =3D smmu->irq_ctrl;
+    spin_unlock(&smmu->irq_cfg_lock);
+
+    spin_lock(&smmu->evt_queue_lock);
+    evt_pending =3D !queue_empty(&smmu->evtq);
+    spin_unlock(&smmu->evt_queue_lock);
+
+    spin_lock(&smmu->gerror_lock);
+    gerr_pending =3D (smmu->gerror ^ smmu->gerrorn) !=3D 0;
+    spin_unlock(&smmu->gerror_lock);
+
+    vgic_inject_irq(smmu->d, NULL, smmu->virq,
+                    ((irq_ctrl & IRQ_CTRL_EVTQ_IRQEN) && evt_pending) ||
+                    ((irq_ctrl & IRQ_CTRL_GERROR_IRQEN) && gerr_pending));
+}
+
+static void arm_vsmmu_set_gerror(struct virt_smmu *smmu, uint32_t gerror_e=
rr)
+{
+    uint32_t pending, new_gerrors;
+
+    spin_lock(&smmu->gerror_lock);
+
+    pending =3D smmu->gerror ^ smmu->gerrorn;
+    new_gerrors =3D ~pending & gerror_err;
+
+    if ( new_gerrors )
+        smmu->gerror ^=3D new_gerrors;
+
+    spin_unlock(&smmu->gerror_lock);
+
+    arm_vsmmu_update_irq(smmu);
+}
+
+static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->evtq;
+    struct domain *d =3D smmu->d;
+    paddr_t addr;
+    int ret;
+
+    if ( !smmu_get_evtq_enabled(smmu) )
+        return 0;
+
+    spin_lock(&smmu->evt_queue_lock);
+
+    if ( queue_full(q) )
+    {
+        /*
+        * Toggle OVFLG only if the previous overflow
+        * has already been acknowledged.
+        */
+        if ( Q_OVF(smmu->evtq.prod) =3D=3D
+             Q_OVF(smmu->evtq.cons) )
+            smmu->evtq.prod ^=3D Q_OVERFLOW_FLAG;
+
+        spin_unlock(&smmu->evt_queue_lock);
+        return 0;
+    }
+
+    addr =3D Q_PROD_ENT(q);
+
+    ret =3D access_guest_memory_by_gpa(d, addr, evt,
+                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true)=
;
+    if ( ret )
+    {
+        spin_unlock(&smmu->evt_queue_lock);
+        return ret;
+    }
+
+    queue_inc_prod(q);
+
+    spin_unlock(&smmu->evt_queue_lock);
+
+    arm_vsmmu_update_irq(smmu);
+
+    return 0;
+}
+
+static void arm_vsmmu_send_event(struct virt_smmu *smmu,
+                                 struct arm_smmu_evtq_ent *ent)
+{
+    uint64_t evt[EVTQ_ENT_DWORDS];
+    int ret;
+
+    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
+
+    if ( !smmu_get_evtq_enabled(smmu) )
+        return;
+
+    evt[0] |=3D FIELD_PREP(EVTQ_0_ID, ent->opcode);
+    evt[0] |=3D FIELD_PREP(EVTQ_0_SID, ent->sid);
+
+    switch ( ent->opcode )
+    {
+    case EVT_ID_BAD_STREAMID:
+    case EVT_ID_BAD_STE:
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
+        evt[0] |=3D FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
+        break;
+    case EVT_ID_TRANSLATION_FAULT:
+    case EVT_ID_ADDR_SIZE_FAULT:
+    case EVT_ID_ACCESS_FAULT:
+    case EVT_ID_PERMISSION_FAULT:
+        break;
+    default:
+        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
+        break;
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_set_gerror(smmu, GERROR_EVTQ_ABT_ERR);
+
+    return;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -190,6 +355,14 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, =
uint32_t sid,
     uint32_t log2size;
     int strtab_size_shift;
     int ret;
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STREAMID,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     spin_lock(&smmu->strtab_cfg_lock);
     log2size =3D MIN(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base=
_cfg),
@@ -197,7 +370,10 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, =
uint32_t sid,
     spin_unlock(&smmu->strtab_cfg_lock);
=20
     if ( sid >=3D (1U << log2size) )
+    {
+        arm_vsmmu_send_event(smmu, &ent);
         return -EINVAL;
+    }
=20
     spin_lock(&smmu->strtab_cfg_lock);
     if ( FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->strtab_base_cfg) =3D=3D
@@ -250,6 +426,7 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, u=
int32_t sid,
         {
             gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
                      idx, max_l2_ste);
+            arm_vsmmu_send_event(smmu, &ent);
             return -EINVAL;
         }
         addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
@@ -278,6 +455,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu=
, uint32_t sid,
                                 uint64_t *ste)
 {
     uint64_t val =3D ste[0];
+    struct arm_smmu_evtq_ent ent =3D {
+        .opcode =3D EVT_ID_BAD_STE,
+        .sid =3D sid,
+        .c_bad_ste_streamid =3D {
+            .ssid =3D 0,
+            .ssv =3D false,
+        },
+    };
=20
     if ( !(val & STRTAB_STE_0_V) )
     {
@@ -316,6 +501,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu,=
 uint32_t sid,
     return 0;
=20
  bad_ste:
+    arm_vsmmu_send_event(smmu, &ent);
     return -EINVAL;
 }
=20
@@ -373,16 +559,19 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *sm=
mu)
      * monopolizing CPU time. Implement commands rescheduling and asynchro=
nous
      * execution as outlined in the design.
      */
-    while ( !queue_empty(q) )
+    while ( !queue_empty(q) &&
+          ((smmu->gerror ^ smmu->gerrorn) & (GERROR_CMDQ_ERR)) =3D=3D 0 )
     {
-        int ret;
-
         addr =3D Q_CONS_ENT(q);
         ret =3D access_guest_memory_by_gpa(d, addr, command,
                                          sizeof(command), false);
-        if ( ret ) {
-            queue_inc_cons(q);
-            return ret;
+        if ( ret )
+        {
+            smmu->cmdq.cons &=3D ~CMDQ_CONS_ERR;
+            smmu->cmdq.cons |=3D FIELD_PREP(CMDQ_CONS_ERR,
+                                        CMDQ_ERR_CERROR_ABT_IDX);
+            arm_vsmmu_set_gerror(smmu, GERROR_CMDQ_ERR);
+            break;
         }
=20
         switch ( smmu_cmd_get_command(command[0]) )
@@ -406,6 +595,10 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smm=
u)
         default:
             gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
             dump_smmu_command(command);
+            smmu->cmdq.cons &=3D ~CMDQ_CONS_ERR;
+            smmu->cmdq.cons |=3D FIELD_PREP(CMDQ_CONS_ERR,
+                                          CMDQ_ERR_CERROR_ILL_IDX);
+            arm_vsmmu_set_gerror(smmu, GERROR_CMDQ_ERR);
             break;
         }
=20
@@ -416,6 +609,15 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smm=
u)
                      ret);
             dump_smmu_command(command);
         }
+
+        /*
+        * Stop consuming the command queue if a command error occurred.
+        * CMDQ_CONS continues to point at the offending command until the
+        * error is acknowledged.
+        */
+        if ( (smmu->gerror ^ smmu->gerrorn) & GERROR_CMDQ_ERR )
+            break;
+
         queue_inc_cons(q);
     }
=20
@@ -454,6 +656,7 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info=
_t *info,
             vreg_reg32_update(&reg32, r, info);
             smmu->evtq.cons =3D reg32;
             spin_unlock(&smmu->evt_queue_lock);
+            arm_vsmmu_update_irq(smmu);
             break;
         default:
             printk(XENLOG_G_ERR
@@ -584,6 +787,7 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info=
_t *info,
             vreg_reg32_update(&reg32, r, info);
             smmu->irq_ctrl =3D reg32;
             spin_unlock(&smmu->irq_cfg_lock);
+            arm_vsmmu_update_irq(smmu);
             break;
=20
         case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
@@ -608,11 +812,20 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_in=
fo_t *info,
=20
         case VREG32(ARM_SMMU_GERRORN):
             if ( dabt.size !=3D DABT_WORD ) goto bad_width;
+            /*
+             * Acquire cmd_queue_lock before updating GERRORN to serialize=
 error
+             * acknowledgement with command processing and ensure that rep=
aired
+             * commands are not skipped.
+             */
+            spin_lock(&smmu->cmd_queue_lock);
             spin_lock(&smmu->gerror_lock);
             reg32 =3D smmu->gerrorn;
             vreg_reg32_update(&reg32, r, info);
             smmu->gerrorn =3D reg32;
             spin_unlock(&smmu->gerror_lock);
+            arm_vsmmu_update_irq(smmu);
+            arm_vsmmu_handle_cmds(smmu);
+            spin_unlock(&smmu->cmd_queue_lock);
             break;
=20
         default:
@@ -916,9 +1129,10 @@ static const struct mmio_handler_ops vsmmuv3_mmio_han=
dler =3D {
     .write =3D vsmmuv3_mmio_write,
 };
=20
-static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t siz=
e,
-                               uint32_t features)
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
+                               paddr_t size, uint32_t virq, uint32_t featu=
res)
 {
+    int ret;
     struct virt_smmu *smmu;
=20
     smmu =3D xzalloc(struct virt_smmu);
@@ -927,6 +1141,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr=
_t addr, paddr_t size,
=20
     smmu->d =3D d;
     smmu->features =3D features;
+    smmu->virq =3D virq;
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
@@ -939,6 +1154,15 @@ static int vsmmuv3_init_single(struct domain *d, padd=
r_t addr, paddr_t size,
     spin_lock_init(&smmu->strtab_cfg_lock);
     spin_lock_init(&smmu->irq_cfg_lock);
=20
+    ret =3D vgic_reserve_virq(d, virq);
+    if ( !ret )
+    {
+        printk(XENLOG_G_ERR
+                 "vSMMUv3: Failed to reserve domain vIRQ %u\n", virq);
+        xfree(smmu);
+        return -EINVAL;
+    }
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
     /* Register the vIOMMU to be able to clean it up later. */
@@ -990,7 +1214,7 @@ static int domain_vsmmuv3_init(struct domain *d)
         {
             smmu =3D (const struct arm_smmu_device *) hw_iommu->iommu;
             ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
-                                      smmu->features);
+                                      hw_iommu->irq, smmu->features);
             if ( ret )
                 return ret;
         }
@@ -1033,7 +1257,7 @@ static int domain_vsmmuv3_init(struct domain *d)
         }
=20
         ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE,
-                                  features);
+                                  GUEST_VSMMU_SPI, features);
         if ( ret )
             return ret;
     }
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 7c76f2afd4..35cdbbb867 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -524,6 +524,8 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
 #define GUEST_VIRTIO_MMIO_SPI_LAST    43
=20
+#define GUEST_VSMMU_SPI         44
+
 /*
  * SGI is the preferred delivery mechanism of FF-A pending notifications o=
r
  * schedule recveive interrupt. SGIs 8-15 are normally not used by a guest
--=20
2.43.0

