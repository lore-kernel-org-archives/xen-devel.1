Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDB606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=BEWyiaTN
Received: from list by lists.xenproject.org with outflank-mailman.1470382.1679191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILR-0003m7-Hb; Tue, 03 Nov 2026 17:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470382.1679191; Tue, 03 Nov 2026 17:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILR-0003l3-Bj; Tue, 03 Nov 2026 17:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1470382;
 Tue, 03 Nov 2026 17:30:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILQ-0003ZN-AH
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILP-004K9k-N1
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:47 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a33-8faa-0a2a0a5109dd-0a2a4509c172-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:47 +0100
Received: from [52.101.66.97]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a47-be1a-0a2a45090019-3465426192d1-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:47 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:46 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:46 +0000
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
 b=OSz5PxkAXF49pK6aOBPd3atbvMm8x0roefzkNGEF1b2Uxus2M72DDAAoDmgcB3ThEZ2VzKAI0DGRdQexBY0VIb0A4HTee7ugE8UYqxqVWr70fLpiyuiwlvUDOjmIR4CJxWbJ34qSxWPbfLXXPauuX/cFktaWmd31NbC9yIwdUv/jERj8sjWqAze8EF4uCBxuXwgWvpHZd3AGkilEXPvZP9OCdWS1g8p2nRXAl2mwuTjJN/fSDOaWA3laoqlhq1tqHHr3ME+bjSvlg1mcD2eJQjQpZk7jpWUFKI/z3d7igOuHwSFWRHtB+8BNZSDbCI4aZ6GTKxlaUmo+JTtxI/YWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8rvJB23hgC6QtKcIzJWqTYQL9iVgEmz3jpXtZehG6I=;
 b=Mi+H8Ul7n2+r6CQF7TZcIbyw9AsvUJbzhY3iPQML6/IwK8M2B160GwPrmRkMfwOaQd1apiIg9vloIU1OGVtmF4mpPWqIGeFJqrlSqFWlzyN5dQxyPAFPgBDb6fJ+V6MCZ13kvTgEhdOMQEKWBxfXItFrvcecCZA/Rq8szAUaNEKj89JhQtWp7f73FiWPaG/j/RKbsYGrrxsatODrI31MzqhPhcStGgoHH9kl3LMMSO24wuJev6K5YbaocgHoLBtMJ0lMDc68PZ3uJ67yrqq1BU+WXjJAHQPGLsgjF3K5NONfImtvdEsKIwGZi8QdrSCiE3n65JcCpewGBclwRVBj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8rvJB23hgC6QtKcIzJWqTYQL9iVgEmz3jpXtZehG6I=;
 b=BEWyiaTNb0BBuLrk53ekCEOJpDj8yqw25W0wcH/EOJDlNA7wyGIkaOBs3lJ7RNfX6vLGWssY8E2jQJgJ2qDl9EjQejVMYbol88xicBgevsz7xY7FIzdO25PmbZihmV6RXrNxQ4jvsNJXZqi4y/cDOEM7Bw1w2EDDrxGw5FjFFMeWwMKLQINxSPGeyO10tbkCUgsxqfY1Zpon2cnhXmhiljcii79y3tbkJuVxmxV38ADN/z/7NE7eHqLCg+unQL5WLuq2NCgYATkP4GjO0DuimCFeVBmE8/KQJYbdSn7W8UA7NKfsG0b0TIC8vh278yVflmH0RQpIEBu6zWLnHZOb3Q==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v5 15/22] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node
 in libxl
Thread-Topic: [PATCH v5 15/22] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Index: AQHda7kPbM9uFpE+4UyByaW6OzZsPA==
Date: Tue, 3 Nov 2026 17:30:46 +0000
Message-ID:
 <4b4f2a9af32e1dd10ff8f21134b4be344ae61d83.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 29c64b5d-7201-4427-125c-08df39d031c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022115727099003|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 tSVhUYFNFs39jtDUINriKImdwiXYED7bAIKEIWn2BP+Ypca3LpD8gEyPzk6SaOJAQPqbLuqM2bk2lKg/veG3ZWdjtHLi2OXTa+7YvwH0EHPG62SnKzEm/wEyFKXbTJY572D61A5+9BvasC+w2neoPFxfVo5AR/DpBXZclPb6AtoqUy8OEX+uxQxuZ4yaz+nC2Z02XG50CFsb7uMeAH034NVLch6ixUUh+6cZ7C7D6ZiFv2D3mn9VU645+ieZLPuPSd/pCkxTNsz8oo/0pn6aAe+4CMrL/Y+ucO/xvjXG1z3/tk8PgxEQmA6h7bxHsmyZgPEPIHzV2Cii70pACHOhUBLd56xGldHDJZvmkvswVJSWg2yvzmol7uVBkvg1xzqCnJ5cpBTGgfAzEAUJ7rtaNh053v3wQWx+H2PgERFewo2RLZi57rOxZO1pZejj1AnTN8xprSLxSyJHuAXtmEnWv3ZDhc0+nmkIOfSFFqkz/cqLuefet/vXkrALIQFfXCkEvVDQz4DziczuGyQtrJ0tmr1DKfcSpoBRG2pRzUcvbOs5OTcbLCvy2yr1vLtpv+EjGPIMK/u+d/IwojW1XSF7f2qGxy9EbkABYgNOCYySuLXmuILlmpanhNg99wX36YQemNvbCKpMOEw945t/YgTFY+ldSRAcyhHDrifkFVzA2ccNuHUIWW6GFWPpOhAROQnOmeeIfnwxEUkalKlSItdCDrJdutUCSkCgBH0eAmLo+RY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022115727099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cyVuQwcljZ/0Qf9CCNf1lPdu7w5UVcm8UDRv6f3l0PasltaOs0c3Mq3vqt?=
 =?iso-8859-1?Q?5P+iq5OaYRv7/cK3SOK1g3z2f+yHWHClZzXbj/zaB5/yDAVeaZTMmD5Kir?=
 =?iso-8859-1?Q?peD/zuGRdguA6Ybg7m0chVkHhWA27Frv8S+xyxXHGPVRyfbZDa1TLQbBxo?=
 =?iso-8859-1?Q?lv40gI+TZ+jyMKjANODkx0XI3StyqPjKOjiAKFXLmf5Wg94QF4hkelHbfu?=
 =?iso-8859-1?Q?kgqH4tQKGlBmieS0HnHoZU6GjFEakf7j9ZKW5+0CWt0zzDW5P1AKDwF91z?=
 =?iso-8859-1?Q?NtkA+hh15t2oOWGcP7oRl8GGWiNGOz7KSP1O9smcicY9EshNDZHGUSPnn2?=
 =?iso-8859-1?Q?RrdlVVhDURxA5I1a0XgRe4R0WKBvvfq8yqFM3FjlHf21pbR3DwPZH3bcHj?=
 =?iso-8859-1?Q?Ysc+XvpdGA/EACe+0eMqDuSEOufrQyC+3SZ0kYbaFZ3lZFiEHSHL15fjKT?=
 =?iso-8859-1?Q?gKu8pjVAicUjuHqjy5EPfyDpxO3llGakw2RDdktB0cvZNhPJ3WMDJr5nIA?=
 =?iso-8859-1?Q?ZaiLsA/dOdxTQ9lwBIk4q5euTLx+FeMU9/rcJlKORVecq+EJjQOYCDnAj5?=
 =?iso-8859-1?Q?XP+opb+M1pYVftoQfUil3DPUgN6atdUF7bs2TVQEI9okBbUJVub2Bk4WY4?=
 =?iso-8859-1?Q?ijiCJLScftzdf7tkyy53qnqUmVkHI8zEcWWyW1lTunsuQQoSL1cu/+Fcn4?=
 =?iso-8859-1?Q?IVDLwbLimvLrAotru3PcpFQB+HIrbxD8862JRUhA+fMNuXTAviGbCiWSwJ?=
 =?iso-8859-1?Q?YeBNriTSLn9G133VXtPuaP4Ga7+zrRVv4l5emAUixBlCy1OL3mNtgi3vdb?=
 =?iso-8859-1?Q?Bu+T8yydR2QC5W/aXChEnqBCb+A2EV2adVWveuV17Vth9ixOmv+TeYWxnH?=
 =?iso-8859-1?Q?PUWkb6GAdvK4CDNJql7RV7AAvYgSrFez5AgrtR5NotBL1GpV2wZehjDh42?=
 =?iso-8859-1?Q?XWIeXkfZAy0HGInzHo4R18lVGj9UQWFxBtXP/VKpob63V2Ay49UDZH9Wxo?=
 =?iso-8859-1?Q?FHYhu1FQ4qFpz5m9vsbOfLM4dTUEDNT8IYL3k/982Db06G1IPHZIv+nSZq?=
 =?iso-8859-1?Q?LEDFsRn3ZwfwnVIED+YM28n9y/tW/CssniBR1PWSJ+BlVo7f5YC45jgiQ9?=
 =?iso-8859-1?Q?y8Ztphr42XzWEoMcSNbHMdqrHG1fiAPt5r1181UFuFg8rqrh1gUGQYkWnm?=
 =?iso-8859-1?Q?9G9D3/vDH7h+UTwNbl+jZqL0Pb8+7/GwfBLtsRvwevHsEguvmmX0eJgfkg?=
 =?iso-8859-1?Q?47EeQgoFFhECL54oO/vxIk6qC5JHb+iSu3WaHYrpiWP6fRy77v54z70BfF?=
 =?iso-8859-1?Q?keL89BvKLC+WnI4poPquvAswyn7IRLa/CXCsku7s6+S4t1VZjvKAPUPIjM?=
 =?iso-8859-1?Q?fkFzkrKCkXDRhNjv73p5nXMp+U2OazDCNLj0SaQdbQfh9ksm3gunedcRxQ?=
 =?iso-8859-1?Q?wZOY4zZ4epRS2eJ7u+n/1CRhjddYcPe4CHSQnEeBtSLOlqyPcCjX//LK8C?=
 =?iso-8859-1?Q?ijaccy46ZKpY5IKU84g94+1S5cLunmrrNHcHvAJQpdNWRnPCRe1O+vlCML?=
 =?iso-8859-1?Q?0X2A1r0yuX9IQ1YrW2UpaQDabfMOp3zaiyaYJp0Nc3OWvqRWXc9l13zlrk?=
 =?iso-8859-1?Q?5s6CAqA6bMbrdwOysc21eTTz1I7K1ZZIJdpJSo3ttdgnCKJga69n+a4RXg?=
 =?iso-8859-1?Q?FFKJzdbqwEAMfkmUf9JYCFdJwr/s4Oot3E2k+QtvJNWRHzq0O6mF0wAnss?=
 =?iso-8859-1?Q?VIgDW60pWBJL4mHB0/NjMGwHdlsU0dj0pWLK1l6pNBMnVq1Z+TGYbUMMjE?=
 =?iso-8859-1?Q?ggwMs5P4OA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c64b5d-7201-4427-125c-08df39d031c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:46.0687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsqN27FlMNfh5o34MEkyojoC2+U1UrMDXqCBwI9nzKtfrLvxUPYkyhj529MxXDFaVpsPmujGYxLaVzaL80EcyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-bad1c0/1793727047-BD4C3034-ADAA9D30/0/0
X-purgate-type: clean
X-purgate-size: 2329
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

libxl will create an Emulated SMMUv3 device tree node in the device
tree to enable the guest OS to discover the virtual SMMUv3 during guest
boot.

Emulated SMMUv3 device tree node will only be created when
"viommu=3Dsmmuv3" is set in xl domain configuration.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7f1adfd79b..bbcc989284 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -921,6 +921,36 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *=
fdt,
     return 0;
 }
=20
+static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
+                             const struct arch_info *ainfo,
+                             struct xc_dom_image *dom)
+{
+    int res;
+    const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, "arm,smmu-v3");
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                            GUEST_ROOT_SIZE_CELLS, 1, GUEST_VSMMUV3_BASE,
+                            GUEST_VSMMUV3_SIZE);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -1428,6 +1458,9 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+            FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
=20
--=20
2.43.0

