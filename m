Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA7606A32D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=CLU4CGiz
Received: from list by lists.xenproject.org with outflank-mailman.1470401.1679223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILZ-0005JF-KY; Tue, 03 Nov 2026 17:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470401.1679223; Tue, 03 Nov 2026 17:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILZ-0005H8-5M; Tue, 03 Nov 2026 17:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1470401;
 Tue, 03 Nov 2026 17:30:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILX-0004tz-Ct
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILW-003aA2-Ol
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:54 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a4a-bab6-0a2a0a5309dd-0a2a4509cda8-10
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:54 +0100
Received: from [52.101.83.81]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a4e-be1a-0a2a45090019-34655351c1db-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:54 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:52 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:52 +0000
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
 b=ii7VguH65cJ0VecA8UQfz/JmhLY7wKXEAERREYgzxHbK4/J1L7E4HDK+3wdZYIjZNNZ6fh+UmmpKnLCV8Fa+9i+TEhqRgw7g83tZQb1UZNlXmZcJkysyW97HKGzGqy/45f03+X8Cm81hmKpusP+ThMdvVNK8EqroKA7Dc4R0AQO48nCWsye4DQubo2WAIwfzosyslhlzgL1fC+uAGiItUazIiCEpNlgDQ4lE/m/YcnCbB2qlHGLygj/NVvBSqk4JyRe97/rtosILcOAYTS4Qqv4j5bDypabHThEn4cgm96QwVPq49G+UHxHm2o0UaIqoIfTmfqtk9g20pwXVfxBxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04wlLDrCXxRbN44m6Xv1zNQ5EXjCUtM6cx5nIO/iEp8=;
 b=M3qahzUvwAd/7t/mhmQjfzW3WeCtH2wZZP1NtBR8pYzC68z8ivZhsU0gmPR0TCZcCn06QXi5KzilabyEpge/tj0QnJz7r/59O9fHVzPGgJRg5Ku0x05Zn1HDChCJcYmC63Dq7GgbOaNBE5nTeEVFBEbXkY9s9+frLCvHAEQm+R2wPWcnAV9ps9uzUQwSMkX2V6dUgI4DW5Hmqoc+0UFWTvUcJPoSUwT/0MyW57odHr3Gv01Ubgd4/4keMFrPrc3QKUrM+B066oSZQ42o/2IRZ+4pw1O+2+gZD8JEX0zFPp//tU/+WdiljpEK2TVRar8J67d0rOIOog/qLjaoF9KFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04wlLDrCXxRbN44m6Xv1zNQ5EXjCUtM6cx5nIO/iEp8=;
 b=CLU4CGizHPRz/RFg92AVej+gLZUtATFeZJBRwEjlwcOE90mWPH5IxzZ7Ih5jSN+3BebtDI0uRVr7ANCfV/yyRLMJtDVQR8hvhg7K+RHLnGuu+4uhi9bickM+v9n/yfOIa/8j4f6cj+NLt86d63FHq1hEqzbJMy34i0cODgrdrVD+4q3mpaudPlMvQAfDl6ffgji0VpXnyWoALMtl04uco3q2hyGxsSqvT4waLM3DIvHePgKh0xuBq5O1ovSBfO4XRGsSF1cerUu7mbaQA64FuONsCrgBIhb/t+B6dxBQucMB/SqFMFbLyu+SGwWUwuCanFjWxY9xEKUk5PSWf6sCWA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v5 19/22] xen/arm: vIOMMU: Modify the partial device tree for
 dom0less
Thread-Topic: [PATCH v5 19/22] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Index: AQHda7kT4VFqDkiD1UGmccSWBKKiSg==
Date: Tue, 3 Nov 2026 17:30:52 +0000
Message-ID:
 <eda58449cb79816d97f32f79323e98d1f07f923f.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 93818c35-541a-4006-56e3-08df39d035b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ZvbDM+5wapsZoTaW1Rdtp/RMv090ipdRTKmuiwkBaRdHaFQEifzbXOJ6o5g/PMtGGDZevmHff8EcWYBuSKRMjZGw8Mykl8qu9UiEJMLX/BjgkeD3Ls7rEUcCRqgxXBcZWnn3zJAh8QSeEMSGlCJbGf99GouH+c9yxip6d+aAFPjFnjKJkEb5nzdkWKIFxvrmcmWZ+FLFRpVEeboMLlwkHb86+DBEGlfwGqbumfNZOdetBpcYzXGFJwLszrYK4WwQmwkiIZBar5zwXF+9Ublhuz37o+xmXX4D0z5zhIYpTchevC9XFLRe0oJ0oQiNelTIkIEj+GFyCO1u4smgPNcMolw5enFmBVF7RbaWfBDqOQC9vqnQky3QxBOXB7T2pzj3F8WHgO5OQ8tFxkal66304FTILdXiwzCXB5KubN3TR9I6qQmH4IWwNPDXSbrUHWZtCzpH5nIXJa+xHYKDDNVJ+Y3zVJNhQ8DdPvOFhdj9sRRVdDypdZ3A43oF3qXx9YznF0hd34+XIxWFvd7PAuqD77rTU+y+BQ57IoMO7rzOoAbu7o6g6OMq4SoHsRfqzTBVJSengCvTz3WputEoGuOcUONWyboTjdw7+ffAO0uobQ9Gloeq0i5w4xkkqkbGyH5G61GGWuOoxejkXGYVP32mRPsJQ5sWD2f4GtizUh0SiBCNkIRLipbhfOv13yoHh3oISnaLmjAE+LgbR+tDksK4xMxxKHJDFL+CJ/1U/b4/NL0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ufz0SxnTUwrDtKGOt4MnsKmyBQqL+X7qgkbiKyC74UkO87AeBG5z5FWBfW?=
 =?iso-8859-1?Q?qNlct6ozoZMeoqK0dt0cXbBo8W2b3CPs0nnJyPTjNbefPw3zGoJ1m5/uEy?=
 =?iso-8859-1?Q?N1dgwMa5RM4qxfVEg6jY9jpzwlpp/xF8tMNsTZxAw66D1oqkvNiXTAvkTV?=
 =?iso-8859-1?Q?bFjIgo6uAyjG2ykJA+vKbKYl7fzA5hApTEoOz1cnKmc8yD0okKZlF3DqaJ?=
 =?iso-8859-1?Q?YYKThFFaZ1h325vHtmeJscDJaD2gj+rEORhZh7zrEcUGIMPqnvBC+dm1pw?=
 =?iso-8859-1?Q?hl/FWZwfSGUOM0+IVg16nhN82011ocBgSTLWUHrbN6Jsw+iUVoXkXJzNoq?=
 =?iso-8859-1?Q?TGb/LB6BTzXPaDy6eMdy1vZIg+uHUgcm3DLBbwUPgTrIlahmPmd/1yyX88?=
 =?iso-8859-1?Q?o8/qZb92aYVD2FLjyXLGaQuYypBicanL69eZVmJd+f6JQQ4V4SP7i8qnND?=
 =?iso-8859-1?Q?H4enkv8E4UmLlC7qaELd4c1nfQebEfhKhhocLNSNLEPP11a5GGSfmVnld1?=
 =?iso-8859-1?Q?ZciJPdHjcvA3hSrmbWXoWsHeKA9iDzMgK7M047Zi7Ld6NbRrkibC826joK?=
 =?iso-8859-1?Q?Vya5D9n7ySL6HDoUm26HPemfa+SxJ9/csFgnEV9Y7DfF0OpohB/BrWcrqi?=
 =?iso-8859-1?Q?TwLN7128GwbrHIN7JdvGJHtDrb4cZaomIbSuvQui2TpDVUe0oAAMXveTKt?=
 =?iso-8859-1?Q?5WhE3otTSevcnMtUhR29mCehpI6ETeAjj7Pz5JfLkVqr3SOy8pIvnxlM7N?=
 =?iso-8859-1?Q?0JWe+bUFuzzUbcAwMXffcwojO1RbMC4c9Q0EQ/8wI1NpUQxdwc3RQ6snb6?=
 =?iso-8859-1?Q?HZCmi5w2mqCyVv14+6Ly+Yz9iFrlpiaTzuFpNQpE2eJTHTSvFm3fVcSsUV?=
 =?iso-8859-1?Q?YfAmEqgh/JDhq4UjGJTuJny4+gF/3YMOvS4mkDjR/QUs6+AoV8eoqZSt9d?=
 =?iso-8859-1?Q?i9yx0RAnv/pAt/eDbXBnBWd9Nu3rzMOvBgLA61zreTyyVhI54Whq6dV8Sg?=
 =?iso-8859-1?Q?Bj8lUzQXQhBblFO0w1vcuFkem9BN8ZeAfYy3qGZXLdQi9MCUpj8w49rlGn?=
 =?iso-8859-1?Q?Qal8ElZa3F9ZTbbPlAvoIJo5T133xwDOXJtoNNz6A/uIjEeNhCLMjAwfTL?=
 =?iso-8859-1?Q?7Ct3/GZVMc8FP17an52rBo5AIQIZZmlv7QxlWv0sfWeBnEtm0/fBcJlNb5?=
 =?iso-8859-1?Q?CMRahdrxSMu0nhSguegl2VinTxLsFz3DBIlZUQOj5aik+AgWRe/SvpIn8f?=
 =?iso-8859-1?Q?Xu4R5FZ/IxVReqsODR4fTFkc70Ffc56kS49u2GtavF6krv3yS+Ms+1owBZ?=
 =?iso-8859-1?Q?w8h0JyiZklgJGBVm9eJp3EuEgbXhJS/+67AeTNusUHgtg4pLpaK/MnbIZI?=
 =?iso-8859-1?Q?AzNwwGAhnpS8if7+LVldYoNCg5DGdr1rMlU04f38EKX5/yoZ+JCzPAT9K/?=
 =?iso-8859-1?Q?ZchbLS7CykkEdxNAwW2HfZNrGj/Ypp+hhFekJXxIiobDC8eDZRpdO1EO7j?=
 =?iso-8859-1?Q?Y1nFQW4aLyY9antf5e/xydyomlT0WFudV/39t33iCm7d0V6MxhCDTQybyp?=
 =?iso-8859-1?Q?1PfGhzO7VoEPvP9s24ht6Y3hmgvFfWqrjwMncYVyJBXd9u96xUTSkL+0Iq?=
 =?iso-8859-1?Q?xD5EjcjjewjSdEteLg16HIKtMNrI2Cp9T94FEflwYyBzd5TDzUZOxkzOpp?=
 =?iso-8859-1?Q?mtQekgb2jqCEqJAbOC7s+msyyQ3a0FgkswwXCdS06vMp4qwUzyLvKkofTz?=
 =?iso-8859-1?Q?SFP+LshRi/ZL1nFK7TLl7MdBmD7fkrrcilNgiV9gf3mofD2/w0tl0Y4QAR?=
 =?iso-8859-1?Q?Dl1KqxCyFA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93818c35-541a-4006-56e3-08df39d035b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:52.6622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qC5kj2QtJoifbhGi9pfbaj11sZGBwANOcjYv8xn6RUsy+7rw+vjm9jEbZSCsTL6Pq0K4AIzQqRdP3mKDJD02eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-bad1c0/1793727054-39CC7034-5DDA5E89/0/0
X-purgate-type: clean
X-purgate-size: 2750
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
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/common/device-tree/dom0less-build.c | 45 ++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index a877e695ad..970f89ef68 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -332,7 +332,46 @@ static int __init handle_prop_pfdt(struct kernel_info =
*kinfo,
     return ( propoff !=3D -FDT_ERR_NOTFOUND ) ? propoff : 0;
 }
=20
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pf=
dt,
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+static int __init modify_pfdt_node(void *pfdt, int nodeoff)
+{
+    int proplen, i, rc;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+    if ( !prop )
+        return -EINVAL;
+
+    prop_c =3D xzalloc_bytes(proplen);
+    if ( !prop_c )
+        return -ENOMEM;
+
+    for ( i =3D 0; i < proplen / 8; ++i )
+    {
+        prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+    }
+
+    rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT"=
);
+        goto out;
+    }
+
+ out:
+    xfree(prop_c);
+    return rc;
+}
+#else
+static inline int __init modify_pfdt_node(void *pfdt, int nodeoff)
+{
+    return -EOPNOTSUPP;
+}
+#endif
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cel=
ls,
                                  bool scan_passthrough_prop)
@@ -358,6 +397,10 @@ static int __init scan_pfdt_node(struct kernel_info *k=
info, const void *pfdt,
     node_next =3D fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
+        rc =3D modify_pfdt_node(pfdt, node_next);
+        if ( rc )
+            return rc;
+
         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_=
cells,
                             scan_passthrough_prop);
         if ( rc )
--=20
2.43.0

