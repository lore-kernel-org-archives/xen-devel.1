Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4D2606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=oxsQrtno
Received: from list by lists.xenproject.org with outflank-mailman.1490270.1691223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsGF-0006j0-UD; Mon, 16 Nov 2026 08:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490270.1691223; Mon, 16 Nov 2026 08:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsGF-0006in-OI; Mon, 16 Nov 2026 08:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1490270;
 Mon, 16 Nov 2026 08:40:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xSsGD-0006Il-RO
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:40:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsGD-0070BM-7e
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:40:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6afac171-8faa-0a2a0a5109dd-0a2a4502a3ca-12
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:40:21 +0100
Received: from [52.101.72.113]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6afac174-6ca4-0a2a45020019-34654871f831-5
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:40:20 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by AS8PR03MB6839.eurprd03.prod.outlook.com (2603:10a6:20b:29a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:40:19 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 08:40:19 +0000
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
 b=nQ+H+9L6xb0dJ+gqjMShP0nhR+rmvJZ1U6UDX0dJrbWEt/UZSnwWcFXpRzoUhPmJipS7AHiPru+k8fx2Fe+hOk/iR5gme6GdduqctLOjzHHQ3obckNLFmd2FWNB3FMCjcErf0Vr2H0LzU2vUIS2Jgy/sfi1PxsWGo3ietN6NJoxSd2eXozzMebLvQiROPdYWWJbOHnwhjl4g0gsHS4XvoKgvZIATVsZRz8jRcwnvhdJ42dbUotjZCNLaYn282vjjuDfvSHwNwc1EE1kkdySiekXjlphvivYTohBmVe1kLDwu1m3wSvQI2XBYDq6KxpinytmfZvm7d+fOz8tXJaN0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTxm5m4FP+hzQnpGiRPxKxWKCD2d2IuIBmvOjgaaa3Q=;
 b=Yt5fT6cxlEnS0ZbUVCjttq2icJ6/uOQQ0NpmTQQma6d86Fmknrv7LTIiVYJVg6xfMI8CoBjynRik14VWo+FWvBECbqVXKyPTpRdj4QzcUAFGjtx0jPA8Ge6ilJswhjQ1gSgyaOMMmORvMzhHOXudFn25+09G56/kFK9rB4zYR4XMMQF/tQpW/Yhb6UYuUp65Q76ycuDZ6zxA+UekeQqAYzD3ceZ4rGgQXUmmO6sJAQzUiORRKmvC52YwOvBLsGAOEC+Dalkw6OY59TS0kgSBVgcwbnM4Dgzhi72xUSCC81Z90Ru7K5uBwKJnWMUU0gUIBKA2fXvJlxl2Wdi26RpwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTxm5m4FP+hzQnpGiRPxKxWKCD2d2IuIBmvOjgaaa3Q=;
 b=oxsQrtnoMqcF7YNrEjqEhhFekXllVcXwad3Ox2zra3iN32H7RFKTrKiqA7JQmuPOGoYTm5ITdprqthJJ4gq5h/sT6LbjcMOaC194Keihh9Wu73LVYj51Qkz7OhjlHnAI6nyItxFekI0ur9RHi2YyYJ41KNINYbG2I+nv51w1kd+Cgw18Kc47cmd+w0aAe3MWZT2HyZsRwgCu7yb/SHr2ujxB/zHHqtHMWtbZeFG2ocx12nO64qrAOoZNh16+CneQxfuDf+jKM7tv908cDjWzfcOMMO2tIJfwv+6B+A5sLK9YKfqPyc3CJ54aXO1ZeW5A0DEjwwGfvoIs1HAAm7Nu8Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/2] pci/rcar: Add support for Gen5 PCI host
Thread-Topic: [PATCH v1 2/2] pci/rcar: Add support for Gen5 PCI host
Thread-Index: AQHddaYcAIucuvPO/0quJ8il+q1yMg==
Date: Mon, 16 Nov 2026 08:40:19 +0000
Message-ID:
 <2871b83d934f6254fd593ff9fc75de03728b69ac.1794817300.git.mykyta_poturai@epam.com>
References: <cover.1794817300.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1794817300.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|AS8PR03MB6839:EE_
x-ms-office365-filtering-correlation-id: bba381d0-c483-487c-1ba5-08df43bd3ecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003|38070700021;
x-microsoft-antispam-message-info:
 cLdZIC8pMzXVCVbglBalQ6V7xObPOhLpS+iookp8twnt3DMbFTzYz9Do6bKsFaOQyZPTAgcc34GNZ+Dw1IrDu1h64O86pKpsQZlrBDvz5CTHUyVG/e+SxO5I7yWUH9Vv9t8+cziWlwq/5DkbZW+ZSwPJGsKgG/HwFlJQ4qscRLRoQM38EO/FYlIGdXVyO2qky+qWfth23uITKHeT4dZNg5ebuLUr1+iqDNc9CLzx6iwZmwt2yJiray2/hjPMIgrt9ClUclgBHbL48PmJC7h89BpsoA2xoVmquwG4iinkfXmMcEqTWMgNqCMYJ2062WTXNi/hmZ4yM1SE3sN00lo6SnZvhvSv/9Mcv0LzOY+2JYqhfZZUR4Ky1/2EFq9p2RmkEyMIP8FMh6n7rltRxpeHr77X0nv019VwLC79B+8bzI4nn0CqbY8A8dQ8w5jopD1NAtjWEzBOZKRoSp1CNy7LcHkaXb9xOf5JBTaBbORVpoaHIGJJLKqPPB0QvmzFDseEpteQ3xVllttJrYfvjM9tj30Lm+mC3t0M9cjqvITyp1EGXnZcM5DYkGkoWfjg/IV3w4WADiTNjBP1IuMgA8YIhinXgkNWaIhMwj7jCs8cdz7JW709jfQ1xNLOqEgGhv7x0edBsKEW8ylTbbtAHQOEaMbredu4+xy95sOraiRc+eKJbY4/1fTXr9vKSKsrdlXpkmjI74QUC2VAujZfz0Kz6KoJYqhXc7yGiGZItbiUf8U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nyrE5vXuQ49lutcBO/FzJ9ka2iomWI3RuR5VzboSU/aqXLktSL/KbSgVM3?=
 =?iso-8859-1?Q?1ao9TnYtWY1Rc4scKYsogvmPafx/ZrP12PJvbpzV3KkZHxRVy0gP2pIRCa?=
 =?iso-8859-1?Q?gChSHPg1InCPUmEB2n6NXPNl48vi8JOT7693/HoofLIin7Mvd5cgbPGPg0?=
 =?iso-8859-1?Q?0a5V4dRpI+bk/VaQ7dhi+Yhp/FLTMvZ4MQ6d+TJie99/qRxeBenzK4Oekn?=
 =?iso-8859-1?Q?xUg34BtOTGq85Uwd07OOAahO6feefFKQR5alGUnw2+n14NzSkwlejNqUGW?=
 =?iso-8859-1?Q?IZgw4tbLkbB/IFqloXWQ64InfylCe3HAtuTdjqzs8k5NwlKOioklz+Jq9H?=
 =?iso-8859-1?Q?GKowZT1JQvR+l+by9H9rnpxVETY8WX82AbMQZ06JmwP4yUpflr2+hPpEsk?=
 =?iso-8859-1?Q?2F9ZjIJnbVc7gRWSrMzo+ugHa2jYGJbTBHNLbYKcKO7OLJa8kKEk/ItqnY?=
 =?iso-8859-1?Q?hmtXo+RjKiPVZVU2tt0j+xd9nizqXn9Moj4IriN99+skGTG6iKTsRoIfo8?=
 =?iso-8859-1?Q?WaBpHpxZ4H6IfuNzoopISfqoYiBnX3UN+zoeSK9e16keAQ46p8ModpLj5z?=
 =?iso-8859-1?Q?mvR/WDuFZOa/rKv3PKo9aJHviU8QZuH+8DoWmd5aoQU8/5o3+NzJMaRJar?=
 =?iso-8859-1?Q?b+xRAUWiV+cYHqd32m667eYc2L0/sN2CRcF9L/xUuzNNKdVPzXAedZRS4O?=
 =?iso-8859-1?Q?3/zGewBWkaMCvk4J418SoP4DOH+yaRzkejkdYegV7NYCcZEhfaBd1pesy/?=
 =?iso-8859-1?Q?CmQ8R6A0MJjKzqy8Crz1Mrloltd0aoolt3SkOe5qSDgy98zVsarxOaqo9+?=
 =?iso-8859-1?Q?kD46Xhyj0TxOqgSP/VGD8Va35j7No3ppyyz7YKQRLXtlIY9hPmXlY5+roo?=
 =?iso-8859-1?Q?HsrABL4IqMDmCqn7k5USKtAnkaSWvWBXlbRYgUZM/zwanzdEouu/vPgnDg?=
 =?iso-8859-1?Q?qU37A8nXSK2LoobkmNZug555TXkVZnxNFq/HdgBo6+9Lvw6aUG+G5lhE/W?=
 =?iso-8859-1?Q?rK5eXZibuvljGGW680nNNkXNErZaVNy0IM31fkB40H5ZYhyi6BjvfbGJ37?=
 =?iso-8859-1?Q?458hUB+xWp3lJaB2e2N0jM2wPmQetArKmItULcwQmriAgZNA738KG71b1f?=
 =?iso-8859-1?Q?hX5lM+jVj9ujiiPSa+h+nzN61Bo2vHRAG9FsXdwsb0QrLOfWP2rMEBNtpW?=
 =?iso-8859-1?Q?FZoAdXNpo12hzummXGwsEsZ6jjAJezFjmWGEkEhkTIeEq7Wlzz8lOozTLM?=
 =?iso-8859-1?Q?8oYnO9gOs7UtW/5x8YHCobWNEhwvid4OTBORpFqpJmpcCU5IFpL3S5RFMX?=
 =?iso-8859-1?Q?6EX2kuT5hfe6HscExJmmoZivacllGnPq9GAdoA2SdpkzYmRj4b3m6uUcZq?=
 =?iso-8859-1?Q?XVJz5Pgcdi9W05J6LWkvRYTLiNv6D7zdnC4TLPtA5H9/PssvmWPCP7VAMq?=
 =?iso-8859-1?Q?Bz8UMDR11VFnfKKS3aqBpqfARjbqGLXvAF1+nkbV76RTeqCZj/1+wIIX5M?=
 =?iso-8859-1?Q?r6sRdklxnipWYTNl8AYrQc69mcSFPIXfy5tam2c8D2rnCcsFrA1jK5K62C?=
 =?iso-8859-1?Q?8ocm/ZleZzdi6HZyLMqchdjR/9Ex/oedElRCnEZHERBHUBtT15lWryUIfg?=
 =?iso-8859-1?Q?v8RIENG1l3Q1M66Iy9YsCJy1V6Jzit2YlzXhEcVnmGV6MGTxjkM9K57gU+?=
 =?iso-8859-1?Q?JWuftOhQ7WNVcwCvIEoF4LuqgOU5qcCvxMY8412VeuC9eBIM8efQiiGRAY?=
 =?iso-8859-1?Q?qBsElhIimK1JpT9Y/fmMZW7VlB6x9/YPp6GUpQpJIhw/WfsRDCQstlvYWb?=
 =?iso-8859-1?Q?OQf1uUUTQg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba381d0-c483-487c-1ba5-08df43bd3ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:40:19.1515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9s78dGQJE5ndCR76jn25lIPBkdYWVSQfjBPVDd/rLMSBoeqiCh6U/qisGvM98w3X9jFF5MxdlwC/ZXIBZdscxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6839
X-purgate-ID: tlsNG-720697/1794818420-67CBA2AC-B0C0FE9D/0/0
X-purgate-type: clean
X-purgate-size: 3003
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for Renesas R-Car Gen5 PCI host controller. This includes
updating the device tree match table to recognize the new compatible
string "renesas,rcar-gen5-pcie6" and ensuring that the OSID registers
are only initialized when they are supported by the hardware.

Gen5 hosts do not expose the "app" register range, so only look it up
on Gen4.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-rcar.c b/xen/arch/arm/pci/pci-host-r=
car.c
index 5f184d5ebc..87b3ccbc1c 100644
--- a/xen/arch/arm/pci/pci-host-rcar.c
+++ b/xen/arch/arm/pci/pci-host-rcar.c
@@ -17,6 +17,9 @@
=20
 #define RCAR_DWC_VERSION     0x520A
=20
+#define RCAR_GEN4    4
+#define RCAR_GEN5    5
+
 /* PCIE BDF-OSID assignment */
 #define CNVID(n)             (0x700 + ((n) * 4))
 #define CNVID_CNV_EN         (1U << 31)
@@ -87,8 +90,9 @@ static const struct pci_ecam_ops rcar_pcie_child_ops =3D =
{
 };
=20
 static const struct dt_device_match __initconstrel rcar_pcie_dt_match[] =
=3D {
-    { .compatible =3D "renesas,r8a779f0-pcie" },
-    { .compatible =3D "renesas,r8a779g0-pcie" },
+    { .compatible =3D "renesas,r8a779f0-pcie", .data =3D (void *)RCAR_GEN4=
 },
+    { .compatible =3D "renesas,r8a779g0-pcie", .data =3D (void *)RCAR_GEN4=
 },
+    { .compatible =3D "renesas,rcar-gen5-pcie6", .data =3D (void *)RCAR_GE=
N5 },
     {},
 };
=20
@@ -182,6 +186,7 @@ void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bri=
dge, unsigned int reg_id,
 static int __init pci_host_rcar_probe(struct dt_device_node *dev,
                                       const void *data)
 {
+    const struct dt_device_match *match;
     struct pci_host_bridge *bridge;
     paddr_t app_phys_addr;
     paddr_t app_size;
@@ -194,6 +199,11 @@ static int __init pci_host_rcar_probe(struct dt_device=
_node *dev,
     bridge =3D dw_pcie_host_probe(dev, data, &rcar_pcie_ops,
                                 &rcar_pcie_child_ops);
=20
+    match =3D dt_match_node(rcar_pcie_dt_match, dev);
+    ASSERT(match);
+    if ( match->data !=3D (void *)RCAR_GEN4 )
+        goto skip_app;
+
     app_idx =3D dt_property_match_string(dev, "reg-names", "app");
     if ( app_idx < 0 )
     {
@@ -218,6 +228,7 @@ static int __init pci_host_rcar_probe(struct dt_device_=
node *dev,
     printk("APP at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", app_phys_addr=
,
            app_phys_addr + app_size - 1);
=20
+skip_app:
     dw_pcie_set_priv(bridge, priv);
     dw_pcie_set_version(bridge, RCAR_DWC_VERSION);
=20
@@ -227,7 +238,7 @@ err:
     return ret;
 }
=20
-DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
+DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4/GEN5", DEVICE_PCI_HOSTBRIDGE=
)
 .dt_match =3D rcar_pcie_dt_match,
 .init =3D pci_host_rcar_probe,
 DT_DEVICE_END
--=20
2.56.1

