Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D293606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=lngRCQJY
Received: from list by lists.xenproject.org with outflank-mailman.1470397.1679218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILY-00055T-Eh; Tue, 03 Nov 2026 17:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470397.1679218; Tue, 03 Nov 2026 17:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILY-00052a-0K; Tue, 03 Nov 2026 17:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1470397;
 Tue, 03 Nov 2026 17:30:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILW-0004Z1-81
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILV-00BtPP-Kg
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:53 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a4b-8faa-0a2a0a5109dd-0a2a4506a38e-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:53 +0100
Received: from [52.101.66.105]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a4d-195a-0a2a45060019-3465426992d0-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:53 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:51 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:51 +0000
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
 b=QgrkpV1dJl/37EqJCm5BW3jQc4KD3bFFjwu+hXRGvGI4r+WyouRWbjSRhvf29YUmJ28uyJWKJiFFdIHxa4SVve+imh+xg9ecMWJFOZ5LGPcNJ8OHF7gIimuYZAMV15Z2ZCA+js7WacIt2ukS9iv0FW6HLtZfXFpMy4lbXNhX78zwTUxbJmcdFCty21I415i9KSFml6bLNL6kF1kbWURlktJLPErXDm8RmJ5RViRwQ1kZ2c3xwWRr8vcrvUzSYJLKa5XumRHalQx8XBqXZ02Vqev7QkVmgqDIPrH92YG8i/sAAzIMO3OP0L91oOabb0q+HWjB5mc7+6pC1t/xhjeQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXv7mO4gOhCAOcGu3jVi+t8HReanW2K0WNYLDUyVoOo=;
 b=IDf2y89Lx1+CuzpsLGwy7Wqdj0RHMLcpHvi8UmOaBmIwJ9CuAbQ+d0qLLUv8XgFxDHO+UatVekVwdm64ZpkD5XWwo9DXT7HC+Hai9QhSUtPVGAa7vO2r2BOLsNhYY1KxObEVUI9ywbUU5C4yDT1RfaYWUBaQXV/Tk4vbLYDtzfLZk8XybO00+LpPs1BJrGT2OnKh0ltWQ1sdFyxZPb0iBNRTdxldFqnSfHnVuWRS/XcIT2Oyhyo9+DpzEnDBwZtwFK74iOPudUYqC44ORQeoUcTefTildIvUEnk9IsUVZsS3nFrx4lVRrFa8uU8bCfWp+YUPKY79Al+cG1j2VTEAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXv7mO4gOhCAOcGu3jVi+t8HReanW2K0WNYLDUyVoOo=;
 b=lngRCQJYL4Rihz2Ze7VKVsO/yuKhhidSL5nw352KBfRNd/4ncOmv7pAj9mfJcGkcIyzzwuALUe/3BHRH5VWEISY+zNMZF6QIi7zA8QFWuCgbi+xEO6iAFpTTdyQjlZKZEVnYFUw0T5GzL/WnMcOhKwzkfv0gt1T1CMp8m4l4uXgLqkuWKNiMNbwi+RK8poCHZY8WZl4C+FJKKFOEr1qmLk9Z1nMFrMmIJ9iR0fCIc7AhnoHLxfZ+IjBdhXqI/yRCKKkeWcFnUtXKBIjkPVd58m0a7q1fyZvK+1+2eLbK1ygDWolWsZ/q1HvMkd/o90DQDwjMOHo9+vzzH/VB9xwD2A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v5 18/22] libxl/arm: vIOMMU: Modify the partial device tree
 for iommus
Thread-Topic: [PATCH v5 18/22] libxl/arm: vIOMMU: Modify the partial device
 tree for iommus
Thread-Index: AQHda7kS2ZcHsTrIxUqGMSOQ4IqfJw==
Date: Tue, 3 Nov 2026 17:30:51 +0000
Message-ID:
 <41dd6cb889d346b8c922a6cc4fee8ce69f58280c.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 28efc3a2-4a75-42dc-0e43-08df39d03510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 N6CjC5mAPtHayxuMKeg5sNTLZhuhRrVXKBW7O3ESKh87bBcLXsc/csX1ajeq+TIe3wlULYCsDfJaWaKPxIn7s8VOggm+3w/e1g+ts8/w4VIVEzfMecZjeAvaQW+OUXfHwI5sTPMgnTtdKtO0tSp9T+pgJWwvLUzKVg75BA+HK+ootNH4lPrMhCSmrH31+iM7CKbJW6qjMg5ZdPnY2YfX/Pi92ZR6SV+pBojKb0jFjkyWd6NH5KdaQ7Yedi7MsHK41AJZ2OMxB+OZ3Gd5SX6FgPvseMKh/JM9Oz8OmYIN5VR1uhy5TXXvhNCFgkawtL8ojhVDoZc0HtEis2YzS5UMdwZokXfFMNIbwafFQ1K799LPBTBpRdSHLfwOT/SzxqgXeNB8UAAs4bKeX9uq16NKcESKnY7hABDEXSPwWpqy3RHt9gBAcFS/qc2/6FkKlrl5WoeFHwkxFY3/9pnw2NKCJKAT0wBKWrO2eke94yzGReLVZXeMD6IytX+skVz+WcDb+kBRPqLhZ1TKA5/U8vST1+OZrkdZWbMHNogPSoEC71xcH8gGvSCoxAcVSaXCvqnIKu5iHl7ZTURlVaS/L20iJxJyxTWKa8z5L4ugb3APd+8E38wYnW+qSBteHFLwS8X4yI/EUgz5aZMwcWR7q+y1qjuncdoDxkHcSeuWEXp30QUXyO58hKg4fy+puK9nbLsHBC8QpwOs54qLaHdQwpYWfavJABkMbPpIDvIPLrEJUMI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3ihjdg8gp3nVGdjksPNDd2B7Xq0StlFqojg2OiKtdCC1o/Mykb0Yi7hyRS?=
 =?iso-8859-1?Q?2sVAM2I/6e8fVh8g9aSQx3SZJu0S3uPjz4Rw+OxfHHkNL/Wl2zFve8afym?=
 =?iso-8859-1?Q?SLjTB4+j4wLowTtLoYJeEsIxztvtdyRn+BOJ/fKxkd0WVbcffEGkX5HFLX?=
 =?iso-8859-1?Q?t+Bxe748dw9HQOTDvL5q4TKNgLnaT3z7QDeofiYf3svaWleHk1mT5rSjpj?=
 =?iso-8859-1?Q?ZUPhI6h+zkaq+7EW0dd1TRhHa8rVijdHjoxzu3D343EXBU1oihBaH9LWCu?=
 =?iso-8859-1?Q?9zgaS/p19ozUM4NBgBZcDIhWTaSDsDzMxZsCSSYZ0MtS81eEUsh6mTJXny?=
 =?iso-8859-1?Q?T7JesH8c2r4NOrnOArfaGYRfGsNiII0W44zUG2T+6f4QBREZVh16975xAq?=
 =?iso-8859-1?Q?JhzRA0Df6A2QQH7rWH2WcxchnIqmdYlUxG7+Ju1mehHmTtymBFKO9vSv+a?=
 =?iso-8859-1?Q?was12jCvu77B9MlM6EXwIVTIoVbgPaVTkrTj20PjLuFU1oNa0N1kcgbEQN?=
 =?iso-8859-1?Q?P+MmPoVubp+Cp1e6fwNUKw7RRdQb++1KMg2UQDwa243R3dr+3nNJ+QYaBW?=
 =?iso-8859-1?Q?l9cBwmDL9rpY7ZrBJVDlPmRqPqjByEgjD3v/ARaLZwnORxMYMAiAgRliMO?=
 =?iso-8859-1?Q?1rVbSfqoaJZm4W1OGqzkw3OgmmsHWLcEUIB06UfkQ0D/InXNBixGFoX9/5?=
 =?iso-8859-1?Q?8WlCtUr/RkcsgaRbTHe7Hun1aa02G02hKjem4q/9C2TaRl9b+keQ3ci0gR?=
 =?iso-8859-1?Q?qZouZ7oEbY7zUTx4BleLHcaHC42Y4Gu+SwaBYiGHHMMN3TnEBL9evLgD3H?=
 =?iso-8859-1?Q?ngEIxvk0AfJu52UngwxZ9Gul4+shEbJBoFWdj2DJyBuzYxD0XT3G84sgaE?=
 =?iso-8859-1?Q?Lv3iKPDaB5j9YCRiGGMLJjSjG/kAdzPn6W7x3pcfexGyXjrQPAEVG4ph+X?=
 =?iso-8859-1?Q?EiH6LUXUEFsjSJtnjMR1GUH5sYOIngltaX5QQ2VVFIlQPNSZF4qM/0J4Q1?=
 =?iso-8859-1?Q?q6d6Mb0hSnEjZKNxSTr9/WXLsWFO2khkxcUue/mLDlP3mA4WGSEFGDD5pu?=
 =?iso-8859-1?Q?3KhnJibROJfEpW9zk1dNiWfhxuTLb47ExCTyz+Hg06Vik1uGGtrf38AHEd?=
 =?iso-8859-1?Q?ssNivYrQduNDFgTD5JQIyW3JtJZ0LN56Zir7Htdo9USipEfki82fwUiJfI?=
 =?iso-8859-1?Q?/B6NdSndeT0uyDcqG5drQnPsTqR+piGieP2JQfPYqjij/QdJ2DK3dN+A7C?=
 =?iso-8859-1?Q?nLEdBqYiTWjzxyO009GZWZf7a7okIr3wWvJfM+ejPMo9bt9VEivUVU8N2f?=
 =?iso-8859-1?Q?AGdqY8LmMHAjuet1smrvgY7WvzG+73031dbx0Fi+Wh6bjbhhz9u4G+n266?=
 =?iso-8859-1?Q?nSZVhpIJilPVwP+YM5OhLDj1o8bQ7a9m2hcLXDcLHp8acKO299FnceNftN?=
 =?iso-8859-1?Q?RBPSULxNbnPSyHI9XFzj0Ni1IeKds9NhCyvpa0qnhS89hIg8V/FoMfU5Eh?=
 =?iso-8859-1?Q?UrO2aGNJncVt6h7gcNOP0d1G09uIu8i+mmtDHp7iJoo4oV4YdwSaX05EbJ?=
 =?iso-8859-1?Q?+G5cGJwM2lO2fCJKdjQ6zLdQwM8ZKERidDC6YhgHQcQsnCNG4nJc/X0hP9?=
 =?iso-8859-1?Q?yskbeepaOwX9RuoiEHjvbFw4yuTz0WY+XIeRpbqDYIEBb81BxI5TJzQEV5?=
 =?iso-8859-1?Q?nkMNDLcD/lQDz9x6iEcyXr63j+lb2gmkpKrnf4yyRezhtJZgKS/t6liaQN?=
 =?iso-8859-1?Q?I3hjvz8tPG2GoFiuF7gD2lCxDBY0eXwYDTrqpJwuwu0vip+niHPSxfrJX9?=
 =?iso-8859-1?Q?yCPobin5kA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28efc3a2-4a75-42dc-0e43-08df39d03510
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:51.4974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brKz0XZSc4SX6lXky9UsA5WZW18PieRXHuDSQuc9B8fYcGpjyJqxoa2oiZwvgIy+gAI3cec1d+tMdpHJpxLK4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-16d1c6/1793727053-F5E0E77B-4D7EF206/0/0
X-purgate-type: clean
X-purgate-size: 2973
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to configure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Singed-off-by: Milan Djokic <milan_djokic@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/libs/light/libxl_arm.c | 47 +++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 72b19d68af..0dc3789d08 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1342,6 +1342,41 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return 0;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    int nodeoff, proplen, i, r;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
+    if (nodeoff < 0)
+        return nodeoff;
+
+    for (nodeoff =3D fdt_first_subnode(pfdt, nodeoff);
+         nodeoff >=3D 0;
+         nodeoff =3D fdt_next_subnode(pfdt, nodeoff)) {
+
+        prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+        if (!prop)
+            continue;
+
+        prop_c =3D libxl__zalloc(gc, proplen);
+
+        for (i =3D 0; i < proplen / 8; ++i) {
+            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        }
+
+        r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+        if (r) {
+            LOG(ERROR, "Can't set the iommus property in partial FDT");
+            return r;
+        }
+    }
+
+    return 0;
+}
+
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1360,6 +1395,13 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    LOG(ERROR, "partial device tree not supported");
+
+    return ERROR_FAIL;
+}
+
 #endif /* ENABLE_PARTIAL_DEVICE_TREE */
=20
 #define FDT_MAX_SIZE (1<<20)
@@ -1482,8 +1524,11 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
-        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+            if (pfdt)
+                FDT( modify_partial_fdt(gc, pfdt) );
+        }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
--=20
2.43.0

