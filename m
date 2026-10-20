Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD06606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=beMUqv/+
Received: from list by lists.xenproject.org with outflank-mailman.1455154.1668734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RT-0006k5-JO; Tue, 20 Oct 2026 08:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455154.1668734; Tue, 20 Oct 2026 08:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RT-0006iY-Br; Tue, 20 Oct 2026 08:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1455154;
 Tue, 20 Oct 2026 08:43:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xJ5RR-0006Yc-Q0
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 08:43:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ5RR-00EW66-6J
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:43:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ac-e002-0a2a0a5209dd-0a2a4503caa8-28
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:28 +0200
Received: from [52.101.84.117]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ab-fae8-0a2a45030019-3465547526e8-8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:28 +0200
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by AS8PR03MB8395.eurprd03.prod.outlook.com
 (2603:10a6:20b:527::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:43:23 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 08:43:23 +0000
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
 b=GrvyeA4tAnfXLw3xrJPjeNwULwNkmT929UmCwva1Wl74xvv1Wn/uw29u/peNJ7GLf51gld86NcIyKYpq+wDP57vhMNkqLbmoiAV+hY2Cdf7hZ40NzygAkGuGhK5XhGmCrWhbqj7VPRxvyCqPLLVWOS0N+95Ou2kYNY05HwzP0ZH688MC3qymJNC4ZCtUUdTumyR+7icYP1JlI9Le8jWgRkz+j7OAn3VinXqHrZMKctYHyHdrFvG76JRoWRNZcYHQcsx3XdHYDanDf1hKEGle0YTNpRkB80ncySYiOp8ChqIKl2TCnw1kwD37tVfnfzeMb+iIN/NNFGpGkeCLXkMt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGase0MvgQ11xf3D0p639mDVM/bgys3NZwE31QW+lKw=;
 b=EUTEVXBmTKW0N9UQjNaD5vL9CD2SkjyWNdT+ASx1LgHvgzV9Zv4x2Cg0K1z1Upd8TeEsrRzAhXo86qmad2/mD+27Kv3UHVRZq6uPUMMUIh43Z1IrJbhR4PNu/0wuD2Nz2ikAo4VfW45ptlqTRdhqnDywOBPda7HFo5AyPZ6CIQrhSsWw7dRRRCQWycSob+YIt6gstnDtFqTpvGfskUzDwxJo6IhCs1a9ZIMeW94hSQRaqYcuCbPxJiiudE8SOx8ezTvxmAMviJsx044rgZVxe3JsL6Ts/i0cR5epfUCdiKNYioDIYiwT9GD97sXRTKNaLYancjEOx522xPaOUHmCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGase0MvgQ11xf3D0p639mDVM/bgys3NZwE31QW+lKw=;
 b=beMUqv/+PfxUD79s/hqB1CN+SP6qQG6b0Sy6r3qE2mienRrhTiUM/5mK8hUBTvQhlXMxiYyjUIqhhYw7A7mS1BVBL1lOzd94iw65/Sop3jvFfpvAyr41CFNTCBNkpOLbc5cAehUGP+sdloO9PX+5IMheMoDiIOLwy6W/GGpFfR1DDU2BDVhvurgPwjYDYK9GE85JEIcHcqA/9yS/xUubD4ZuTT9XU0BXf/i2dTNSHWMC0ZQ3d1HxbgLsh1cT/E09WIVAVcSrGMPuKcnsoni6S1sae+bxsG55LoO/Qsi5h6IKxVAYOnb0VgbZnyepDmA3xAydjZgYAlIe7A4JQgbFUA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v14 6/6] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v14 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHdYG8Q7qVBhYr1q0OFBlaFyWoovg==
Date: Tue, 20 Oct 2026 08:43:21 +0000
Message-ID:
 <f25d72f7f2c6151c97a068c652ca087367ab3e31.1792485704.git.oleksii_moisieiev@epam.com>
References: <cover.1792485704.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1792485704.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|AS8PR03MB8395:EE_
x-ms-office365-filtering-correlation-id: 200f41c2-79fd-4fa8-3e5c-08df2e863341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|7416014|6133799003|18002099003|22082099003|3023799007|38070700021|5023799004|11063799006|10067099003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 6D8Ql9kkXrHMd27JfmtTQMHhimXYcRubpILox8oC1lI29u5TMR42iKUGwMSufEFr+CcT84byZ/u81b9mjDqNveQLzARStSztWA21HlxV2aVbvEQB/YXu7t0i399aqvCJs3VDtFnfVKMsEjpRESthtJQ3Mmn/uSTKkao7r344PbvyZeyQfiAmKbIUYV/mfWqrc7RhyiubKahvYXp5YLlQYS5WSOal2YXGSs+x8ONdknJe5bP31FHPWLR1F5nQO+q8Yl3Obr0oRs5knl8vpD0SDDNWm9V5F4t/oCRSqqYQ9ompNNznAuobTFjHwbbIzUJL/WraIr7c8XCZat/rIDDjJHTedkaUnBwfZAoUMZCtlz4DNglX5Rq8sMwp4HWXkkEEOsoXN8phNqJwnruitG7kqwldlfTKg+J6MUd5D2O2TZCH01/R2Fc00ne1aiDbOXjjznJQt/vBPe9cRQsahFC8aSDM5KcIQn4AMFzN0KFpaWodRYH+PYdLFBr6MC3DZumFGqAHM/u1muH6/xdCNHC5LngM2UYDs/L3jeY85lpz9nd2R20FbUd2O5T8cKFEN3T+fhiBt6dsDSJ2DD3/Idv4/LySWYxKska9zt4bkmjaO9BwHHSofUvW3hJ1sjw2J4LD2Fna7SIfUM4LiqlOguEds3npruAfMP3w6ch8RYOQo40=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(7416014)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021)(5023799004)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HjFhtTt2h2EJcH/4B3LMXLGrg5bdTV9yIaUH7+64F2aYtBL3k5B6SngEv/?=
 =?iso-8859-1?Q?LCvb83yfKaCO60AFjFmICFV5yTbVJvKdlkJMStfcEh6/ekF7sYFp0l4h00?=
 =?iso-8859-1?Q?AAR1wU/eY1SQ4EsidSsJrKzdnuy2pfhjb1jJ/U1O2hwlBgLbc9fMNLHJUK?=
 =?iso-8859-1?Q?dxt6ykdnualTpUbYmL9fygdgVgwZ8bYPVAWdguPOyWZiyHVpC1eKDuq+NH?=
 =?iso-8859-1?Q?g6sz94QfBaiNejnsGWPJAk6mjEl9nDSdzvUvVvC2cQVaFTb7LWR0TuIkWJ?=
 =?iso-8859-1?Q?UiQ4hztKVuL9HyfHsM3w78t3XKTZSlRnj8bXD7YB2eeSHB0sutj/gPz3In?=
 =?iso-8859-1?Q?LLV1EL3CkM+tnZ3guod4UXZZ8wuE4M6tgkgTXsOm9vvLMToclukL30VUOx?=
 =?iso-8859-1?Q?jSBA1LOj9gDEAM0HA34sjOLBeY8eyEoJzDyGSfT6AuJexjVxcSG6uf4EOs?=
 =?iso-8859-1?Q?mJk14ufYK2kNvVBJ2tqWMk1/H+CSl6/GQwhtFiQ/jdJxJWiqNRN6KQxgzK?=
 =?iso-8859-1?Q?dlKN6FYmZkc8CgUPGvNwCzxUMlL/aclQeZquWjDNKylNz5dBbCmVtZedy0?=
 =?iso-8859-1?Q?CYXO32LuNQdBX9n4j601rfKGAr6/P/vEfeYm/OGLXqu61dcnMb6U452hg8?=
 =?iso-8859-1?Q?Hr8odS8GLYAl1H07VX3l6OcxLgLjmzKlpChg5leOCyKziH2vecsq2S5Rw+?=
 =?iso-8859-1?Q?r+B+NAhhxRHr8h4lQIY4R0mw22CKpr0ZSVkvDGxsmuKqXx47SES5L1SwoM?=
 =?iso-8859-1?Q?RQbetcrS9FB3YbXr1LjFR1SeuSS7S5ZS14iW4ddcwtLUL+6gMe0m5DABgZ?=
 =?iso-8859-1?Q?AB9ae8BOxAvAkgCk52+zKnW2FKbOO1hOaHLLSuo48s4gIlAD3YUO3fvGEL?=
 =?iso-8859-1?Q?Yj2MJU3Z7+OBQc5ceCDSEkyblLRxXw30on/z2FsoYHeQN54HwA/OeZgVvm?=
 =?iso-8859-1?Q?SutncRJ2Yct26bA25/NkxTB5GgIFL32WtMSopVAKoHSfORFfB33q2WpGXy?=
 =?iso-8859-1?Q?CW25NDkMs04QRWQzlHdNYsoi80pjgfgGjjwfrTJQRZvTaFYg0FjTIxQRAo?=
 =?iso-8859-1?Q?Ba4O+SwX6PCkqiUbTW4KHHvx7TucAmQkMy6og8+Mb39JNlSOYv91h4ckKy?=
 =?iso-8859-1?Q?zEY3QYBy3kq8avdEl4O9oXFtxlDEnkljSNkXxtJakxzDo2mJpNVgrMf8D2?=
 =?iso-8859-1?Q?tjCWy0YFFoXGDB3tvxSzeFk5/zjRdftnMmMdlrijKkhRWAERswledJrSbn?=
 =?iso-8859-1?Q?H1CpMusTmlwcuJPE451TR8RrN1Ykw5oj2fUv/dgWwc6L0IIJB/HQlJmVIY?=
 =?iso-8859-1?Q?Hqp196FHGLAB/1Wnezw2p8RTH8a8/gAYrccsCEY0w5NbBn70A/zZJiYbCW?=
 =?iso-8859-1?Q?xIr08GfV9t+MfEe/7aXa3mBtVdnYHgL3oU+wrIi8MFXeQ89HIhYq4K6Tmq?=
 =?iso-8859-1?Q?DwxtqxwFwTLr9DaluDtWGNR+UuOIfn5PFtS69gt8fifPRUhjtH1uBGdz2E?=
 =?iso-8859-1?Q?j2R1+MofdycBxFQqw/pKcrFiZpIQwxxWmiaxmFAbRNO9QWAUUle42G1KDr?=
 =?iso-8859-1?Q?vTQs+uCRxKFn+wBeB60a/pP9MX+6MPZL8rGPXdHT1j6z7uvosj18TaqTVo?=
 =?iso-8859-1?Q?FjpNR5n9dSG4KRSmF+FKIwp6YvoHZMOv9CskxEwSfPuB5nRFEt+o6+xZNE?=
 =?iso-8859-1?Q?J6gT1vB05jqJjCID15Np0Xyq5BdWiXJ7ft/EegncxlLqy3HDc5tgJkL2sr?=
 =?iso-8859-1?Q?TebiS+Ga+kNpnqCGYjoRGBhkFdC6Huz8YkFRG7pBOAbBUzPmeZM7Mt8vNT?=
 =?iso-8859-1?Q?mE3TPsc/Rqo4X9KNenRKT9n9T6oOyI0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200f41c2-79fd-4fa8-3e5c-08df2e863341
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 08:43:21.7628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUgTEU4PjjitsExOgQ2vGzuvAx3b+DSuf9LDCnq6E2wuTqbrPNTqTvp5CSNV8DsS/OHJjj/7THHgQv+bpShOi1YETwhnkdaVAnRvDv4JZzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8395
X-purgate-ID: tlsNG-33051d/1792485808-7448C4E9-A951EE2E/0/0
X-purgate-type: clean
X-purgate-size: 18995
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add SCI SCMI SMC multi-agent driver documentation.
It includes a detailed description of the SCMI multi-agent driver.
This document explains the driver's functionality, configuration,
and the compilation process. The Xen SCMI multi-agent driver is
designed to provide SCMI access to system resources from different
domains.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v14:
- describe secondary agents as xen,scmi-agent nodes under agents
- update host, discovery and dom0less examples for the child-node format
- clarify shared-memory placement and platform RAM reservations

Changes in v10:
- rephrase section about /firmware/scmi. Mentioned that this node is
taken from Host DT and copied unmodified.
- fix xen,reg address for secondary domains for Dom0less configuration

Changes in v8:
- update documentation to match the last DT format
- fixed RST: "... code-block:: dts" -> ".. code-block:: dts"
- update documentation with dom0less configuration example
- update documentation with new param xen,dom0-sci-agent-id
instead of the command line parameter

Changes in v7:
- update documentation in section of the xen_scmi configuration which
is matched by "xen,sci" compatible instead of the direct path.

Changes in v6:
- remove all HVC mentions from the multi-agent doc
- update sci-agent-id parameter description in the documentation
- add missing Sign-of
- minor fixes across the document

Changes in v5:
- rework multi-agent driver to leave Host Device-tree unmodified

 .../arm/firmware/arm-scmi.rst                 | 405 ++++++++++++++++++
 1 file changed, 405 insertions(+)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..25459d22dc 100644
--- a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
+++ b/docs/hypervisor-guide/arm/firmware/arm-scmi.rst
@@ -36,6 +36,8 @@ The below sections describe SCMI support options availabl=
e for Xen.
=20
 | [1] `Arm SCMI <https://developer.arm.com/documentation/den0056/latest/>`=
_
 | [2] `System Control and Management Interface (SCMI) bindings <https://we=
b.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/devicetree/bindings/firmware/arm,scmi.yaml>`_
+| [3] `Generic Domain Access Controllers bindings <https://web.git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetr=
ee/bindings/access-controllers/access-controllers.yaml>`_
+
=20
 Simple SCMI over SMC calls forwarding driver (EL3)
 ------------------------------------------------------
@@ -189,3 +191,406 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
 option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC multi-agent driver (EL3)
+-------------------------------------
+
+The SCMI SMC multi-agent driver enables support for ARM EL3 Trusted Firmwa=
re-A (TF-A) which
+provides SCMI interface with multi-agent support, as shown below.
+
+::
+
+      +-----------------------------------------+
+      |                                         |
+      | EL3 TF-A SCMI                           |
+      +-------+--+-------+--+-------+--+-------++
+      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
+      +-----+-+  +---+---+  +--+----+  +---+---+
+    smc-id1 |        |         |           |
+    agent1  |        |         |           |
+      +-----v--------+---------+-----------+----+
+      |              |         |           |    |
+      |              |         |           |    |
+      +--------------+---------+-----------+----+
+             smc-id0 |  smc-id2|    smc-idX|
+             agent0  |  agent2 |    agentX |
+                     |         |           |
+                +----v---+  +--v-----+  +--v-----+
+                |        |  |        |  |        |
+                | Dom0   |  | Dom1   |  | DomX   |
+                |        |  |        |  |        |
+                |        |  |        |  |        |
+                +--------+  +--------+  +--------+
+
+The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared-m=
emory transport
+for every Agent in the system. The SCMI Agent transport channel defined by=
 pair:
+
+- smc-id: SMC function id used for Doorbell
+- shmem: shared memory for messages transfer, **Xen page aligned**.
+  Shared memory is mapped with the following flags: MT_DEVICE_nGnRE and _P=
AGE_DEVICE, indicating that this
+  memory is mapped as device memory.
+
+The following SCMI Agents are expected to be defined by SCMI FW to enable =
SCMI multi-agent functionality
+under Xen:
+
+- Xen management agent: trusted agents that accesses to the Base Protocol =
commands to configure
+  agent specific permissions
+- OSPM VM agents: non-trusted agent, one for each Guest domain which is  a=
llowed direct HW access.
+  At least one OSPM VM agent has to be provided by FW if HW is handled onl=
y by Dom0 or Driver Domain.
+
+The EL3 SCMI FW is expected to implement following Base protocol messages:
+
+- BASE_DISCOVER_AGENT (required for Xen; required for secondary agents wit=
hout ``reg``)
+- BASE_RESET_AGENT_CONFIGURATION (optional)
+- BASE_SET_DEVICE_PERMISSIONS (optional)
+
+The number of supported SCMI agents and their transport specifications are=
 SCMI FW implementation
+specific.
+
+Compiling with multi-agent support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+To build with the SCMI SMC multi-agent driver support, enable Kconfig opti=
on:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements following functionality:
+
+- The driver is initialized from the Xen SCMI container ``xen_scmi_config`=
`
+  under ``/chosen/xen`` (for example ``/chosen/xen/xen_scmi_config/scmi``)=
.
+  Only one SCMI interface is supported. The SCMI configuration must live u=
nder
+  the Xen SCMI container ``xen,sci`` beneath ``/chosen``.
+  The Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is =
a child of
+  this "xen,sci" container; any other "arm,scmi-smc" nodes (for example un=
der
+  "/firmware") are ignored to avoid stealing the host's SCMI OSPM instance=
.
+
+.. code-block:: dts
+
+        scmi_shm_1: sram@47ff1000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+        scmi_xen: scmi {
+          compatible =3D "arm,scmi-smc";
+          arm,smc-id =3D <0x82000003>; /* Xen management agent */
+          #address-cells =3D < 1>;
+          #size-cells =3D < 0>;
+          #access-controller-cells =3D < 1>;
+          shmem =3D <&scmi_shm_1>; /* Xen management shared memory */
+        };
+
+.. note::
+   This layout keeps the Host DT unchanged for Dom0 and baremetal Linux by
+   using func_id 0x82000002 / shmem 0x47ff0000 for Dom0, while Xen uses a
+   separate privileged channel func_id 0x82000003 / shmem 0x47ff1000. EL3
+   firmware enforces permissions per agent_id, so there is no conflict bet=
ween
+   Dom0 and Xen channels.
+
+- The driver reads secondary agents from an ``agents`` child of the
+  ``xen,sci`` container. This child has ``#address-cells =3D <1>`` and
+  ``#size-cells =3D <0>``. Each enabled ``xen,scmi-agent`` child specifies=
 its
+  doorbell in ``arm,smc-id`` and a single shared-memory phandle in ``shmem=
``.
+  The optional single-cell ``reg`` property supplies the SCMI agent ID
+  (0..254). IDs must be unique and distinct from Xen's management agent.
+  At least one enabled secondary agent is required.
+
+  The shared-memory nodes remain under ``xen_scmi_config``; the host OSPM
+  shared-memory node and ``/firmware/scmi`` remain in the platform DT.
+  A shared-memory node describes a channel location and does not reserve R=
AM.
+  If buffers occupy system RAM, the platform must reserve the entire
+  firmware-owned range in ``/reserved-memory`` before Xen boots. A single
+  reservation may cover multiple channels, including unused ones. SRAM
+  outside system RAM does not require a RAM reservation. The channel nodes
+  do not have to be moved into ``/reserved-memory``.
+
+.. code-block:: dts
+
+    / {
+        #address-cells =3D <2>;
+        #size-cells =3D <2>;
+
+        scmi_shm_0: sram@47ff0000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+
+        firmware {
+            scmi: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000002>; /* Host OSPM agent smc-id */
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+                shmem =3D <&scmi_shm_0>; /* Host OSPM agent shmem */
+            };
+        };
+
+        chosen {
+            #address-cells =3D <2>;
+            #size-cells =3D <2>;
+            ranges;
+
+            xen {
+                #address-cells =3D <2>;
+                #size-cells =3D <2>;
+                ranges;
+
+                xen_scmi_config {
+                    compatible =3D "xen,sci";
+                    #address-cells =3D <2>;
+                    #size-cells =3D <2>;
+                    ranges;
+                    xen,dom0-sci-agent-id =3D <0>;
+
+                    /* Xen management channel */
+                    scmi_shm_1: sram@47ff1000 {
+                        compatible =3D "arm,scmi-shmem";
+                        reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+                    };
+
+                    scmi_shm_2: sram@47ff2000 {
+                        compatible =3D "arm,scmi-shmem";
+                        reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+                    };
+
+                    scmi_shm_3: sram@47ff3000 {
+                        compatible =3D "arm,scmi-shmem";
+                        reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+                    };
+
+                    scmi_xen: scmi {
+                        compatible =3D "arm,scmi-smc";
+                        arm,smc-id =3D <0x82000003>; /* Xen management smc=
-id */
+                        #address-cells =3D <1>;
+                        #size-cells =3D <0>;
+                        #access-controller-cells =3D <1>;
+                        shmem =3D <&scmi_shm_1>; /* Xen management agent s=
hmem */
+                    };
+
+                    agents {
+                        #address-cells =3D <1>;
+                        #size-cells =3D <0>;
+
+                        agent@0 {
+                            compatible =3D "xen,scmi-agent";
+                            reg =3D <0>;
+                            arm,smc-id =3D <0x82000002>;
+                            shmem =3D <&scmi_shm_0>;
+                        };
+
+                        agent@2 {
+                            compatible =3D "xen,scmi-agent";
+                            reg =3D <2>;
+                            arm,smc-id =3D <0x82000004>;
+                            shmem =3D <&scmi_shm_2>;
+                        };
+
+                        agent@3 {
+                            compatible =3D "xen,scmi-agent";
+                            reg =3D <3>;
+                            arm,smc-id =3D <0x82000005>;
+                            shmem =3D <&scmi_shm_3>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+The ``xen,sci`` subtree is omitted from Dom0's DT. The host OSPM channel i=
s
+copied to Dom0 when SCMI is enabled for it. Xen uses its separate privileg=
ed
+management channel to configure the other agents.
+
+To discover a secondary agent ID through ``BASE_DISCOVER_AGENT``, omit
+``reg`` and use a node name without a unit address. For example, replace
+only ``agent@2`` above with:
+
+.. code-block:: dts
+
+    agent-domu {
+        compatible =3D "xen,scmi-agent";
+        arm,smc-id =3D <0x82000004>;
+        shmem =3D <&scmi_shm_2>;
+    };
+
+Providing ``reg`` skips mapping and probing that secondary channel during
+initialization. A malformed ``reg`` is rejected. Xen always discovers its
+own management agent ID. Thus ``BASE_DISCOVER_AGENT`` is mandatory for the
+management channel and for secondary channels whose ``reg`` is omitted.
+The former flat secondary-agent properties are replaced by these nodes.
+
+.. note::
+
+    Note that Xen is the only one entry in the system which need to know a=
bout SCMI multi-agent support.
+
+- The driver implements the SCI subsystem interface required for configuri=
ng and enabling SCMI
+  functionality for Dom0/hwdom and Guest domains. To enable SCMI functiona=
lity for guest domain
+  it has to be configured with unique supported SCMI Agent_id and use corr=
esponding SCMI SMC
+  shared-memory transport ``[smc-id, shmem]`` defined for this SCMI Agent_=
id.
+
+- Once Xen domain is configured it can communicate with EL3 SCMI FW:
+
+  - zero-copy, the guest domain puts/gets SCMI message in/from shmem;
+  - the guest triggers SMC exception with agent "smc-id" (doorbell);
+  - the Xen driver catches exception, do checks and synchronously forwards=
 it to EL3 FW.
+
+- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen manag=
ement agent channel on
+  domain destroy event. This allows to reset resources used by domain and =
so implement use-case
+  like domain reboot.
+
+
+Configure SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^
+Set the Dom0 SCMI agent ID in the device tree using the Xen SCMI container=
 under ``/chosen``.
+Add ``xen,dom0-sci-agent-id`` to the ``xen,sci`` node. If the property is =
absent, SCMI stays
+disabled for Dom0 and the SCMI nodes are removed from Dom0 DT.
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
+        /* agents, shared memory and scmi_xen as shown above */
+      };
+    };
+  };
+
+The Host DT ``/firmware/scmi`` node is copied to the Dom0 DT unmodified. H=
owever, for Dom0 SCMI
+configuration, Xen relies on the ``agents`` child and the ``xen,dom0-sci-a=
gent-id``
+property from the ``xen,sci`` container under ``/chosen``. If the ``/firmw=
are/scmi`` node is
+missing or disabled, or if ``xen,dom0-sci-agent-id`` is not provided, the =
Dom0 SCMI agent will not
+be configured.
+
+.. note::
+
+  The ``xen,dom0-sci-agent-id`` value must match the ``func_id`` and ``shm=
em`` pairing provided by
+  the EL3 firmware for Dom0 (for example in the ``/firmware/scmi`` node).
+
+Configure SCMI for for guest domain with toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* In domain's xl.cfg file add **"arm_sci"** option as below
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* In domain's xl.cfg file enable access to the "arm,scmi-shmem" which shou=
ld correspond
+  assigned "agent_id" for the domain, for example:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: It's up to the user to select guest IPA for mapping SCMI shared-=
memory.
+
+* Add SCMI nodes to the Driver domain partial device tree as in the below =
example.
+  The "arm,smc-id" should correspond assigned agent_id for the domain:
+
+.. code::
+
+    passthrough {
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+            compatible =3D "simple-bus";
+                scmi: scmi {
+                    compatible =3D "arm,scmi-smc";
+                    arm,smc-id =3D <0x82000004>;  <--- smc-id for agent_id=
=3D2
+                    shmem =3D <&scmi_shm_0>;
+                    ...
+                }
+        }
+    }
+
+**Device specific access control**
+
+The XEN SCMI SMC multi-agent driver performs "access-controller" provider =
function in case
+EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control" and p=
rovides the
+BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agent=
s have access to.
+The Host DT SCMI node should have "#access-controller-cells=3D<1>" propert=
y and DT devices should
+be bound to the SCMI node using Access Controllers bindings [3].
+
+For example:
+
+.. code-block:: dts
+
+    &i2c1 {
+            access-controllers =3D <&scmi 0>;
+    };
+
+Use domain's xl.cfg file **"dtdev"** property to assign SCMI devices from =
toolstack to the guest:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    xl.cfg:"dtdev" need contain all nodes which are under SCMI management =
(not only those which are
+    behind IOMMU) and passed-through to the guest domain.
+
+Configure SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* add "xen,sci_type" and "xen,sci-agent-id" properties for required DomU (=
"xen,domain") node
+
+::
+
+    xen,sci_type=3D"scmi_smc_multiagent"
+    xen,sci-agent-id=3D2
+
+* add scmi nodes to the Driver domain partial device tree the same way as =
above (toolstack case) and
+  enable access to the "arm,scmi-shmem" according to the dom0less document=
ation. For example:
+
+.. code-block:: dts
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+    ->        xen,reg =3D <0x0 0x47ff2000 0x0 0x1000 0x0 0x22001000>;
+    ->        xen,force-assign-without-iommu;
+      };
+
+* For SCMI device access control configure pass-through devices in the gue=
st partial DT according to
+  the dom0less documentation and ensure that devices SCMI management has "=
xen,path" property set:
+
+Use the complete Xen SCMI configuration above. Remove
+``xen,dom0-sci-agent-id`` if Dom0 does not use SCMI. The guest selects the
+secondary channel described by ``agent@2``:
+
+.. code-block:: dts
+
+    chosen {
+        xen,domain@1 {
+            compatible =3D "xen,domain";
+            xen,sci_type =3D "scmi_smc_multiagent";
+            xen,sci-agent-id =3D <2>;
+            /* other domain properties here */
+        };
+    };
+
+.. code-block:: dts
+
+		i2c@e6508000 {
+            ...
+			reg =3D <0x00 0xe6508000 0x00 0x1000>;
+    ->        xen,path =3D "/soc/i2c@e6508000"
+    ->        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+    ->        xen,force-assign-without-iommu;
+        };
--=20
2.43.0

