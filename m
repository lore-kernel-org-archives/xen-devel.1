Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD0CCDB46B
	for <xen-devel@archiver.kernel.org>; Sat, 20 Jun 2026 11:50:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342839.1602727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wauCr-0004Pw-8Z; Sat, 20 Jun 2026 11:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342839.1602727; Sat, 20 Jun 2026 11:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wauCr-0004Pp-4s; Sat, 20 Jun 2026 11:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1342839;
 Sat, 20 Jun 2026 11:49:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wauCp-0004Pj-BI
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 11:49:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wauCn-004p8s-SK
 for xen-devel@lists.xenproject.org; Sat, 20 Jun 2026 13:49:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a367e36-e002-0a2a0a5209dd-0a2a45059eb6-16
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 13:49:45 +0200
Received: from [52.101.83.79]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a367e59-ef3d-0a2a45050019-3465534f3a5b-3
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jun 2026 13:49:45 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB8389.eurprd03.prod.outlook.com (2603:10a6:10:3bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 11:49:43 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0139.018; Sat, 20 Jun 2026
 11:49:43 +0000
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
 b=ZUeiX9jAbBl133WEfkwpHIJOauchUn6BvBE44sPjzhkSChZ8eM6brqnwD3HHrMg8sazCciPuBcAgYgOn/AFbkoqDTtBq4ncMyyDr5CqMJ/7joSLdYzHkcYoNblP9WQPFrVI3f8jToyCZ5QkhnY0jYVzGEMRzW/ak+GDzRA6h3M4IOUG3XnBbMyc44QalVruoqnqc7DamMVAV/66ry0kG926Tke5jsB07k8Yj+Aca6a0kcFcd8JePPO8WzMEduNyCBo9OOY95UmzF4dllygpHhquKTjkUuu4HcnA2qIxyoVh9p/hgFR/lNBg4k0ahBh5/AIjsGBO4vavn01Acf6IZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgOJD8ntZfOlkW/kijKbSf5fRZRO2WfY2Wuakesj53M=;
 b=DFJ8oBbXbKfcwNw244P7IjNBZa63V7IzFjIGqTcGBP+FuxkrIagsTxdpw/jdBRGlkDVi4E/HZ/+xYYtjzDGq1JTGVzPCm4IsaHI/uWsQhBufsHzE1wrAvd2zwR8/d8mfbSLR4p75Oq/Jl+PsOAWb+zVB9JdAz9vluLKe7HYCWwqSUar+4vvSza1CsBe+M3ziKAThuHZaNaJPu7B+yPP/YO0/V8oqwtYh5F8h+axqP5T5u2oXL108sw6ZoEO7MxC7RI//Xt+kKluNVNvACix6yQCSuM2OG6GOnl04Qi+xXD7Xm+/2bGI2FHwg+oZLbfmdiSNy75lNiHOug74UxIb3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgOJD8ntZfOlkW/kijKbSf5fRZRO2WfY2Wuakesj53M=;
 b=WMYvY4iaNsyURhPi+CrDxCk6ZIEUexXMgPiG7nBpPAbvG/r6rdedcdOhvZUh/JVBBDFd6klNXMQMJp47jsGSjeJ/IIZswXI7VeHpQYei4Q5/qIB1RK94VvpgMsYH2oXupwMTBjvbBrsNjVROAYKbdBsM2Ml79z9Z9PLbKKgeBXuIchBdPGPy9kQMK4m9DaO8En5d/C+1pwAIz0Z/QJNLqMzptLVCX6kh5udUDD+7S5kuKoMAaEVQsvK2wweeFCznXyK9XafzbZkSnYg+kpMHG5MnHPS5GTNJWoaLJ8mnk2DrfeL2LqT5bXZ57PRVRQutc1c+NfL7NqzJTF0Q5v1h2A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] bootfdt: Fix infinite loop in device_tree_for_each_node()
Thread-Topic: [PATCH] bootfdt: Fix infinite loop in
 device_tree_for_each_node()
Thread-Index: AQHdAKriIPevU8UYiUCGOtgPRNoJOg==
Date: Sat, 20 Jun 2026 11:49:42 +0000
Message-ID:
 <8836494cb51f6e1f4b094fc690876d344adb47f3.1781955521.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB8389:EE_
x-ms-office365-filtering-correlation-id: a0c850a7-f119-4c84-b04a-08decec204a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|42112799006|38070700021|56012099006|18002099003|11063799006|6133799003;
x-microsoft-antispam-message-info:
 1UiVP4i7EA7Gzc/Uawk4uclc3Y+vSmPPxNT3s+GKTxJDuhtTv+rvcdLV/QVaG032B94sqFFCpgEbNuH5aFgd4z4WYFjQufyIpyDlJLwo9cAB7b0JZB0jKCX1ibT88n+xhxRVeY6dbN3tAlNIHSZmASq3RlQhOVpkjdT5X73cV7RKvhmOBsiKUT29235GiiU5voCWr1J7SCEZbEkvOnPwNuxso1QiS7uSWpL7PkQpA4hCGKYJTqcQpfJ1Dgm0juLqptuFDASrP81KgtHsy/9lqen9Aoklk4sEdorX3RrumV8zJ+JmbssIiMX6VPQ9vaS6pHNIUXyQS7+zK5o1lv736ZWJM+tZKfvpCXHA4147/zDgCJCZj21sWeGU13+SBvNtbUwByEaO34GCV707iyf7TBAti3IaH+CHZsINyqIgiWAgQGhio6T9L/vuyGheMRSRmRu/kaAd8ZujOvbKZ8hCxP0Hyu6DVQJQGVyEdAJHVy+2W9xYlG2MlxAT+aMcHJoNNEi2lCU7jA1N2YatW/NHGeMKEdy6K4wOSHWLo4NN839Txk87eqpm66yFPflmsAXhorMeV8dqaVR5MRTVhnAsauK03XJTdtTvJsIbJtUkmXHfTYw5vDVDvgckROHlRXTdVMw27zBRZqEYJlcT1XpanV4FRFAGHpOV/NP1B7YFNZYJBFd7Zjw+DOtmsalh5cKVF2wZu12+YPvC5C06269wUEqzwPmH7v4Ep1rZjCx2EJo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(42112799006)(38070700021)(56012099006)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EVs6wyQif7105Jgj3gqhgsup5I/9cGsznAsvNLWNzl5gmTfpqqQm7mOKc5?=
 =?iso-8859-1?Q?wlCsURaBusXt8LD3v++etuDRHmpR6iiH2D03sNvNRUKX4aoGvx3iypKd//?=
 =?iso-8859-1?Q?ZdYN1OYwdV9P9LxOlc8aFVQgdkZbc5UH21XrLQvzC4si5k6uGb6CjKuh9B?=
 =?iso-8859-1?Q?pf8RCEQUEtMvvo0sSmG4cKgae9R/NsTHkwrmOjIccrHLv0+UQDGKZHfqdV?=
 =?iso-8859-1?Q?y4Zpak05CZ0hYSYkMxVpnpDArPWAJ/dxjht8jg2jDAPjfnKmFPjHbScCvN?=
 =?iso-8859-1?Q?GoKE9RQrj0nNWrm21kzKUdtEFXPYXl/+AB1vI2Q21Av+zkQfSV3SspcNB2?=
 =?iso-8859-1?Q?aMFeUiveT9bxNpcQsLdyaLkHKTzwKXznQFqvjMeFufyDV//mAo1jUckrND?=
 =?iso-8859-1?Q?5TqAc+Rxkw3VF7wUxX00yUDt0CTWJF03PTr2TK1R5CYrKu7Da4jjYDf1Sh?=
 =?iso-8859-1?Q?gAbjnH669nYNYlu6Qvr7gY//iSQy3NaaEivWK+i7mkvAQm/ivX30W+zjtc?=
 =?iso-8859-1?Q?j2AgxJh0bp9UplNNLQKNppIDOT2FbOxtzdbqkLKLz9VpicCTuIlcaGqZ5m?=
 =?iso-8859-1?Q?mdJB6Z2indnBs5WDp1kHaZyC5whR6J/LV81H/CznvusgaUaDESSTphV4dw?=
 =?iso-8859-1?Q?+ZahHEb9yGkFDfOvSaCmo8ldKCmMfWIkb17vIAZgPgt22pBSM06DnwIfzT?=
 =?iso-8859-1?Q?+OpXKjgjbMIWAqxWwK79qgtEczVhUWO502qzJre99AW6N2feEb3TJLEwj0?=
 =?iso-8859-1?Q?dEVj1Vd2oWmQYWiRmLrkSroVHslnXIQtCyHnCA1lhorocGDmEC15Bimenq?=
 =?iso-8859-1?Q?3G7u5bjnDQwTMEayxosfl0IhjRmpP5/CpKN9tn+UTMR6p8WAW0vUhJdmF1?=
 =?iso-8859-1?Q?6Ilq1PnGLVb81WiH7a9O8j+5y11q/xxriwjYCKkmTQgafFwp8EBALbvUJK?=
 =?iso-8859-1?Q?1Av1S0C5wYR2E003MR2l27QgoTc5w9J6m3ZzSSFmAfvv7jNDx7uEJ+97et?=
 =?iso-8859-1?Q?A9EOsOmIdCCrm0SG1GRIbPVT7bzuadaJFrkhLKNwLzfwRRe6I160xvVnEC?=
 =?iso-8859-1?Q?wo+ALjCDToMdOrPBadU6rGdvh03E3cWRAxSYu/WJIkqcKIx4U1//KU/nTp?=
 =?iso-8859-1?Q?ghT+l6zze4EfwFQuwlOHbe/loVCeFY8Nncss91RcETUb719j07sjJB2VVu?=
 =?iso-8859-1?Q?Hyic0xocEQ/XNunJL8SjdcGQWtyVLDtpHcr7rb8C4tVJj+t3ZwD4/9go7i?=
 =?iso-8859-1?Q?dBBYst21SATuSMhSnrdp7ZmA7fKJNrLQKpSwearnX44m6+IMZaGy8Zqlq0?=
 =?iso-8859-1?Q?lRnTL+lxRoD2WFS8V2gVNUFthgiUiNlgpFyPxVO+QTws1lGAUkYo/kFYeU?=
 =?iso-8859-1?Q?Z/4E1pRtFGXcMN9GOO5UhwPvGydt3yl8p+ObtqQegjpQmeuW9RBq6WsZli?=
 =?iso-8859-1?Q?FENjM+VNvSzD+HI4r0pnq/aDyv6BCgVf+SOQW4qEoUSc8X0G40NJNRdhmh?=
 =?iso-8859-1?Q?7VYJ2A5xy6UTgxxdMBRasCIh3SbAQ8rGvpa2DH3u1cXDS2MXcuA4m0Y3uj?=
 =?iso-8859-1?Q?Y5M0EVCa4T06SErzPdAS29bvTKQjPU61y0tP9DEWdQmJWZ3VzkU7l3UO7w?=
 =?iso-8859-1?Q?cc2oOTobRxByp5eClSfb+DC66qW3r91N6xiHHMGJm1b2Ad4VsgGOBdIdeW?=
 =?iso-8859-1?Q?PGSz+jZZk+5TAk2cLr8cyaR5xtIv5r1tY1SmR5aMrkcGc1nKrKCnsWLRh8?=
 =?iso-8859-1?Q?wBCYeJOzyRF9b72jrV5S9EjJHaJ+6zHd/8c4QuLQ6/BtsURAnKxOetWOoD?=
 =?iso-8859-1?Q?FnIPiCf62Hz7Y64qtuWHi+8mVQpuIA8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c850a7-f119-4c84-b04a-08decec204a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 11:49:42.9284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yueg3I0I4u9PIjy13sZoexOHZrPH5GuZTOER3cvqe5iv/8IHHcbNzBTcWLQbyaC7WSEhpv0BZXi5vGdwPbDdYOESkyolmXkh5eznuJ7hDIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8389
X-purgate-ID: tlsNG-c201ff/1781956185-A50BC127-7BD5C2C3/0/0
X-purgate-type: clean
X-purgate-size: 4900

When a node's depth exceeds DEVICE_TREE_MAX_DEPTH inside the
device_tree_for_each_node() loop, the code prints a warning and
executes 'continue;' statement, which jumps to condition check,
bypassing the iterator update step:

    node =3D fdt_next_node(fdt, node, &depth).

The node and depth are not updated, the loop repeatedly evaluates
the same too-deep node, causing a hang.

Fix this by wrapping the node processing logic in an 'else' block.
This ensures the loop update step is executed on every iteration,
safely skipping deeply nested nodes and doing the traversal.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---

Test CI pipeline: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pi=
pelines/2615174670

Local tests.
Tests were based on "qemu-xtf.sh".
In the "/chosen" node were added these "levelN" nesting nodes:

	chosen {
		stdout-path =3D "/pl011@9000000";
		kaslr-seed =3D <0x6ae81a67 0x26e92d62>;
        level1 {
            level2 {
        ...
                        level19 {
                            level20 {
                                compatible =3D "test";
                                value =3D <1234>;
                            };
                        };
        ...
            };
        };
	};

Without a patch Xen stuck printing the same message in a loop:

(XEN) Checking for initrd in /chosen
(XEN) Checking for "xen,static-mem" in domain node
(XEN) Warning: device tree node `level15' is nested too deep
(XEN) Warning: device tree node `level15' is nested too deep
(XEN) Warning: device tree node `level15' is nested too deep
(XEN) Warning: device tree node `level15' is nested too deep
(XEN) Warning: device tree node `level15' is nested too deep
...

With a patch these too-deep nodes were successfully skipped and Xen
continued to boot:

(XEN) Checking for initrd in /chosen
(XEN) Checking for "xen,static-mem" in domain node
(XEN) Warning: device tree node `level15' is nested too deep
(XEN) Warning: device tree node `level16' is nested too deep
(XEN) Warning: device tree node `level17' is nested too deep
(XEN) Warning: device tree node `level18' is nested too deep
(XEN) Warning: device tree node `level19' is nested too deep
(XEN) Warning: device tree node `level20' is nested too deep
(XEN) RAM: 0000000040000000 - 00000000bfffffff
(XEN)=20
(XEN) MODULE[0]: 0000000043200000 - 000000004337afff Xen        =20
(XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree=20
(XEN) MODULE[2]: 0000000043000000 - 00000000430ef7f6 Ramdisk    =20
(XEN) MODULE[3]: 0000000040600000 - 0000000042f4ffff Kernel     =20
(XEN) MODULE[4]: 0000000040400000 - 0000000040412fff Kernel     =20
(XEN)=20
(XEN) CMDLINE[0000000040600000]:domU0 console=3DttyAMA0
...

---
 xen/common/device-tree/bootfdt.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/boot=
fdt.c
index 7c790b9a4d..4d10013b2d 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -90,23 +90,24 @@ int __init device_tree_for_each_node(const void *fdt, i=
nt node,
         {
             printk("Warning: device tree node `%s' is nested too deep\n",
                    name);
-            continue;
         }
-
-        as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELL=
S_DEFAULT;
-        ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_D=
EFAULT;
-
-        address_cells[depth] =3D device_tree_get_u32(fdt, node,
-                                                   "#address-cells", as);
-        size_cells[depth] =3D device_tree_get_u32(fdt, node,
-                                                "#size-cells", ss);
-
-        /* skip the first node */
-        if ( node !=3D first_node )
+        else
         {
-            ret =3D func(fdt, node, name, depth, as, ss, data);
-            if ( ret !=3D 0 )
-                return ret;
+            as =3D depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_=
CELLS_DEFAULT;
+            ss =3D depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CEL=
LS_DEFAULT;
+
+            address_cells[depth] =3D device_tree_get_u32(fdt, node,
+                                                       "#address-cells", a=
s);
+            size_cells[depth] =3D device_tree_get_u32(fdt, node,
+                                                    "#size-cells", ss);
+
+            /* skip the first node */
+            if ( node !=3D first_node )
+            {
+                ret =3D func(fdt, node, name, depth, as, ss, data);
+                if ( ret !=3D 0 )
+                    return ret;
+            }
         }
=20
         node =3D fdt_next_node(fdt, node, &depth);
--=20
2.43.0

