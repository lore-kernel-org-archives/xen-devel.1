Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A187C88E53
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:26:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415790.1645058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veX-0004OJ-D8; Fri, 11 Sep 2026 07:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415790.1645058; Fri, 11 Sep 2026 07:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4veX-0004Nx-5K; Fri, 11 Sep 2026 07:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1415790;
 Fri, 11 Sep 2026 07:26:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1x4veV-0003m7-1h
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:26:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4veU-002rD1-Du
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:26:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad19-2eae-0a2a0a5409dd-0a2a450a8f38-38
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:26 +0200
Received: from [52.101.83.103]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6aa3ad21-f2d2-0a2a450a0019-346553679a5e-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:26:26 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB8025.eurprd03.prod.outlook.com (2603:10a6:20b:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:26:21 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 07:26:21 +0000
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
 b=DAnPOtSGx7rfkqiEb5XuZZGflhSz8mSthuI5CLhffdQLCjR7wBT6hgjAbtbpyLdsrII2exH01/sGWZS7u331Ln2tzIqwLtUfNl1qGD/bNDpZ2IRj3Y9KmOKRyuoUKopa0PUElWeV2XlggPAkuIscP1xFqW0oyuCWG1fQd5jfe8r2auv4e0emTrMMrVKyXwVnAteaFRlmRKEny3fUhRKbvven7H52iryQQPj88Np56YEpcUZ7DnaIfjzRrdgLN1bGcALl9h1ALC7WdhN1mt8lKkxmV8KsWuLqO5BSgRgFMaZp5w3w2uI4WblPjMdgCODDUomYaSo3i1Wlf83SRFatgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5VLDzjGdXZ3fBMESadikUu6melFUxWISeZNonumRnY=;
 b=FRKFlsRVmZQmRKA3STAmSqgvUoeSMmQqRmSV14MW6gY/SgRtfDkoCWjExMhzkcmXCJCvMytjRzNsMLQW63XRm5XL6UKjyUkX3kfiQMaqAmGEnG6JKLy/1CbgEi0uZ4ibF3XOZ/M6P+Xo8vJvQVAaFdSWB0XHtZQ7C7AUE/w/FGCZuYytVx90h6yT9Dgij78JS2G/jiKhJ50DGU5Q8ysX5Ar1xgWJSbu9BYZMXEtvVHlnVMTjL0jkCfRplNNTU0GlIdqnJV9/wWe9oa3NEQr1rS62Lmn7Y7WpqfkmNcCPx98Q1mUcxwb3cwAyu87EHDsD63VT1Z2BddlhhDcGgm+ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5VLDzjGdXZ3fBMESadikUu6melFUxWISeZNonumRnY=;
 b=uXaO5u0Hhod4mzRm5NUeo+vvtpDwu1kkc0otAuWtYYoRAJsDj/oKIyVS49dhwSofVT3fw8rdT1hMQZZJMzNHsB5C0tF8DBxMDf7SQ9OPEaDd1WmwNMdT8cN/GWfT5pmI1ylzTjeftxHK37DN05dyoVtwJDIOTrQmsyEbueIW+XRVNN00W7NX1V5G3d8KTu/euELCsWmQKYDLhUlXwSE12tPygt+xGeN2wRz6QnOHKbW0KR5+3tf6EpqGc7feHRqsSK7NnpBFSOkjV1LCvTAZ0+/CMhJVzdWbVTwScieO3xQA+hEUQ32J5nYsezRMzwBYVlrYQ83LCNkICByO3ExnZw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v12 6/6] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v12 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHdQb7Yffw74dK7yUKE/hVbvoBOuw==
Date: Fri, 11 Sep 2026 07:26:21 +0000
Message-ID:
 <a7c1c0c71f752e217075f4339cdce868c4b6309d.1789055542.git.oleksii_moisieiev@epam.com>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1789055542.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB8025:EE_
x-ms-office365-filtering-correlation-id: d60e3c5f-d644-4f52-5244-08df0fd5faa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 xOmW0Q/SdvsGQYsggr53t2A/nrB1+eVnlZBfSCVVuX+Sa+/8teUyn6vomlT2ICa7/kPLhJjpPt6NwwMX4c7ioDWQbG2Zir+p6CSZKR4sjt24yh+54QRyKHJcpIGco7ShqbYS6vDrq+NJFvmtRnwKCETnXB0rVekDD1cH4rUIazY0JeoHnAxmDwn2RiVR7HUas9IhvP3aZ4rn74TtJPW/0FDMnJqMMQEg6V+N/c4tpcnrWWc8Y8JUkvRYklp117Wi0ggP76CfQWjdmxUmB6PJkJ/DP1ckqHcrCk5qg9Cetx/6NmPBH1ACHOnFM7oK4XhBUM9iAV2QlUnPsunSXdtkx/Ws3WVJDcNoseG1Cl/1eNwi53leQ0y1tAZ4PkYSH7i01XBYth+ejZc2cBnxon4pb3u4TCiueG5DPj9GH1KieZio1D33F2/YhTm3hLkvMH6K+LB8jLsf6rVNCThMRxxDobOfB3nnm42RSc9TWa4OIgPFyVjWPl24l9nXgnZVd51kqkXuzMpTtITuexF9idZON78lNe1lHCPPJSbskAn0zSbuRaazjGws+aH+rtv8musDP2v9SRbaYIzSCERvq+3A9PvAzKe6ZoSjMeDCNRhcL2uadrdu5PJZF1tTmrZHRbxoiQLYvm085JoGlkJWG0fWPi/TMyJ9OGXal3j9EXwrBDRSdk4MH2Dz0mLTuYz1p9mCn47QWkEeQZVVpeEh1AW3Qak0upHk7Jx0o1yfzthWZn0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mDcNllQncBwp2CaZuZpmVBsb/WjEuMqOAV3Utq4mW9P1AYRaDIDU9x14n5?=
 =?iso-8859-1?Q?YwGPlW7bpINvYzMWYhR0tSqXKoHbNMCQvSP9xg62Fx2d5tbIO+tLxz0pAf?=
 =?iso-8859-1?Q?2rcmeqa8qUf6U/RevHhpMWgtxxz1FMizgcOfTakVqQwsAQXzh4gJmr9KXj?=
 =?iso-8859-1?Q?+iGT0EK606OetIJDw2rBAgCZTwN9mrDm2pMmqnm6Q/rysQdTZzxe5WqIRr?=
 =?iso-8859-1?Q?5N4A0rMMVY0escTHps3U+CE5DZ5AskPmnapAwwl1r+yaFdBJelej02IwEV?=
 =?iso-8859-1?Q?zpDp8wavELG3+zEeg2UE8Q8CG+hmTHj4oA2RWWhJ9E2ZTT2XQ7auH87RK/?=
 =?iso-8859-1?Q?F82F+B11xUU4MTsHe+0qbO1i3ua3pAVPEQe+AhwY/spTLoHqVW0C/PC3R1?=
 =?iso-8859-1?Q?KMq9IteJIpvibmmYYpTrUxlhWs5YY4msA1NG8qUHRrR3pkc+rFG9yQ1Y1D?=
 =?iso-8859-1?Q?vZrMrJqdfsUdp94qAfnl3Dw4X8HfffKpw92dts36vPJS2+kQ/rqfRmSrjE?=
 =?iso-8859-1?Q?d7Wd9uyt178El3jpwtfFbskKgstg/AymD0b+U6ZnLql9I9Cdw3jFlZnAw4?=
 =?iso-8859-1?Q?jrnZHvGPcWITvT7Mx0dp3avg1cGKfu1XCmhGEVLyZjSWGZWPzOYezm4F0T?=
 =?iso-8859-1?Q?Zd+gHZxOiomuuJnGzzz0fFm9MkcAtMTZUnEhgl3SXVt0bhq2i2SFJhDdiF?=
 =?iso-8859-1?Q?Ia7otDQ1fwIc3FBs5NTW528P9y8iyV4w1ScUnX1mwPA16vSoSEXlwHkash?=
 =?iso-8859-1?Q?28wgrjyp5fb3KsCBqG+VhSmNA+XNV5NXfO1LS841B4qV2dikOhg6cZO9bi?=
 =?iso-8859-1?Q?3r/23RzELEa1/TgRxSHkDfHe/kQXyKzVoZs3R/VPQRaOzJrNDHWj+pDPzC?=
 =?iso-8859-1?Q?/3173b+8hXAHQOnJ5B0PG+O/bWYrsoRoyLSTuc3bwmnxkCvTP61NoQPBex?=
 =?iso-8859-1?Q?ASeP1BiUXjQw+G6amp/DyeD9O/VHlV2uOvdDdF65Lg9fNC+53Wk502ltIJ?=
 =?iso-8859-1?Q?NvO5jPh3m6j7FQicUBBQdk3hyP7OC+uLfJ7sZoGJt/lDeAHx0e6mBBKoPz?=
 =?iso-8859-1?Q?lNXYrNDm4kuBAGjyWnUDZeCNmbqKKnzeVcJ/+/T00F8BsCGOLeZmKVXauB?=
 =?iso-8859-1?Q?vqMucvoMPcRaG7rGmKNeocBe4LF+D6i01ViZ05LG2cdw7+1WKPUuhGVLbW?=
 =?iso-8859-1?Q?/YOTLe2R0sO+oObT+HZyk8aPvlFDbTS2jkAEKdqeHJEGWuEXPASsDXAFrF?=
 =?iso-8859-1?Q?nK0zVHMsyscftDcfB2GrM4DBOG5qYbZiVmy8g7wlz9eMT6VAdlLczrw8HL?=
 =?iso-8859-1?Q?VnGyVfsXIodS5u+uHIM5ANIFrujveifBUqWrq3v7I4ys1nSwiRJ2YJ5Et7?=
 =?iso-8859-1?Q?BpLETg2ZW/W/59XzfkZ/Xv90vMXRHjnROlGnVgUGeRPeWcOnb+R5WBioWU?=
 =?iso-8859-1?Q?otVRill+DsF8nvuRUiyA26XVvbe83LFKV2qgZzpM7nVQ9cvenGvpansjQT?=
 =?iso-8859-1?Q?EwRWyGVJ4z2nIxYizLQl0VTmsrsAuAPE3b5lW5sx0nMrizuuIeMyBMtR3E?=
 =?iso-8859-1?Q?arPAPuG9Q0Ac9xPguGqS3veztJuMs7x5xsTJU2nU1BDGPEg5Syq55yDS6S?=
 =?iso-8859-1?Q?ccFgdP17mObuOIU7mUrnd6hYnHqhbljS8TJt0KnNKxomudA0EYkuU14rme?=
 =?iso-8859-1?Q?7NGr03QBouCoLYYuAPr9IdYXYmxSXYW5C/I9d8mQBYlNza7zDU+Ub9zDM+?=
 =?iso-8859-1?Q?x2fojEB725+r2VkqaVvYvoywjaNXkS7OtvKGXDTN/MwbVb2Cy8bnSvKZSF?=
 =?iso-8859-1?Q?scjvMtgZ1jIITPB3HZ1b6ugyBzrQEc4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60e3c5f-d644-4f52-5244-08df0fd5faa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 07:26:21.4906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PoJzdKdV0Wrc8aPA6zF0Rnbt6o2F1HakwhP+077YJzg6yav/jZYb3yn27n95u/K54OTZMQrJZMSBC8EB0yo6u+WDkpf7DOibBpNXJj7B26w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8025
X-purgate-ID: tlsNG-4011c0/1789111586-510C9CFC-7178828F/0/0
X-purgate-type: clean
X-purgate-size: 18936

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

(no changes since v10)

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

 .../arm/firmware/arm-scmi.rst                 | 422 ++++++++++++++++++
 1 file changed, 422 insertions(+)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..8791bc665e 100644
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
@@ -189,3 +191,423 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
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
+- BASE_DISCOVER_AGENT (optional if agent_id was provided)
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
+          arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-id
+          #address-cells =3D < 1>;
+          #size-cells =3D < 0>;
+          #access-controller-cells =3D < 1>;
+          shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
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
+- The driver obtains Xen specific SCMI Agent's configuration from the Host=
 DT, probes Agents and
+  builds SCMI Agents list. The Agents configuration is taken from "scmi-se=
condary-agents"
+  property where first item is "arm,smc-id", second - "arm,scmi-shmem" pha=
ndle and third is
+  optional "agent_id":
+
+.. code-block:: dts
+
+    chosen {
+      ranges; <--- set default ranges so address can be translated when pa=
rsing scmi_shm node
+      xen {
+        ranges;
+        xen_scmi_config {
+          compatible =3D "xen,sci";
+          #address-cells =3D <2>;
+          #size-cells =3D <2>;
+          ranges; <--- set default ranges so address can be translated whe=
n parsing scmi_shm node
+          scmi-secondary-agents =3D <
+                        0x82000002 &scmi_shm_0 0
+                        0x82000004 &scmi_shm_2 2
+                        0x82000005 &scmi_shm_3 3
+                        0x82000006 &scmi_shm_4 4>;
+          #scmi-secondary-agents-cells =3D <3>; <--- optional, default 3
+          xen,dom0-sci-agent-id =3D <0>;  /* Dom0 agent ID */
+
+          scmi_shm_0 : sram@47ff0000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+          };
+
+          scmi_shm_2: sram@47ff2000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+          };
+          scmi_shm_3: sram@47ff3000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+          };
+          scmi_shm_4: sram@47ff4000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+          };
+
+          // Xen SCMI management channel
+          scmi_shm_1: sram@47ff1000 {
+              compatible =3D "arm,scmi-shmem";
+              reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+          };
+
+          scmi_xen: scmi {
+              compatible =3D "arm,scmi-smc";
+              arm,smc-id =3D <0x82000003>; <--- Xen management agent smc-i=
d
+              #address-cells =3D < 1>;
+              #size-cells =3D < 0>;
+              #access-controller-cells =3D < 1>;
+              shmem =3D <&scmi_shm_1>; <--- Xen management agent shmem
+          };
+        };
+      };
+    };
+
+    /{
+        // Host SCMI OSPM channel - provided to the Dom0 as is if SCMI ena=
bled for it
+        scmi_shm: sram@47ff0000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff0000 0x0 0x1000>;
+        };
+
+        firmware {
+            scmi: scmi {
+                compatible =3D "arm,scmi-smc";
+                arm,smc-id =3D <0x82000002>; <--- Host OSPM agent smc-id
+                #address-cells =3D < 1>;
+                #size-cells =3D < 0>;
+                shmem =3D <&scmi_shm>; <--- Host OSPM agent shmem
+
+                protocol@X{
+                };
+            };
+        };
+    };
+
+  This approach allows defining multiple SCMI Agents by adding Xen-specifi=
c properties under
+  the ``/chosen`` node to the Host Device Tree, leaving the main part unch=
anged. The Host DT
+  SCMI channel will be passed to Dom0.
+
+  The Xen management agent is described as a ``scmi_xen`` node under the `=
`xen,sci`` compatible node,
+  which is used by Xen to control other SCMI Agents in the system.
+
+  All secondary agents' configurations are provided in the ``scmi-secondar=
y-agents`` property with
+  an optional ``agent_id`` field.
+
+  The ``agent_id`` from the ``scmi-secondary-agents`` property is used to =
identify the agent in the
+  system and can be omitted by setting ``#scmi-secondary-agents-cells =3D =
<2>``, so the Secondary
+  Agents configuration will look like this:
+
+.. code-block:: dts
+
+    chosen {
+      xen {
+        xen_scmi_config {
+          compatible =3D "xen,sci";
+          scmi-secondary-agents =3D <
+                        0x82000002 &scmi_shm_0
+                        0x82000004 &scmi_shm_2
+                        0x82000005 &scmi_shm_3
+                        0x82000006 &scmi_shm_4>;
+          #scmi-secondary-agents-cells =3D <2>;
+        };
+      };
+    }
+
+  In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to disc=
over the ``agent_id``
+  for each secondary agent. Providing the ``agent_id`` in the ``scmi-secon=
dary-agents`` property
+  allows skipping the discovery call, which is useful when the secondary a=
gent's shared memory is
+  not accessible by Xen or when boot time is important because it allows s=
kipping the agent
+  discovery procedure.
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
+        /* scmi-secondary-agents and scmi_xen as shown above */
+      };
+    };
+  };
+
+The Host DT ``/firmware/scmi`` node is copied to the Dom0 DT unmodified. H=
owever, for Dom0 SCMI
+configuration, Xen actually relies on ``scmi-secondary-agents`` and ``xen,=
dom0-sci-agent-id``
+properties from the ``xen,sci`` container under ``/chosen``. If the ``/fir=
mware/scmi`` node is
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
+Example (dom0less, multi-agent):
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        #address-cells =3D <2>;
+        #size-cells =3D <2>;
+        ranges;
+
+        /* Xen management channel shared memory */
+        scmi_shm_1: sram@47ff1000 {
+          compatible =3D "arm,scmi-shmem";
+          reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+
+        scmi_shm_domu: sram@47ff2000 {
+          compatible =3D "arm,scmi-shmem";
+          reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+
+        scmi-secondary-agents =3D <
+          0x82000004 &scmi_shm_domu 2>;
+        #scmi-secondary-agents-cells =3D <3>;
+
+        scmi_xen: scmi {
+          compatible =3D "arm,scmi-smc";
+          arm,smc-id =3D <0x82000003>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          #access-controller-cells =3D <1>;
+          shmem =3D <&scmi_shm_1>;
+        };
+      };
+    };
+
+    xen,domain@1 {
+      compatible =3D "xen,domain";
+      xen,sci_type =3D "scmi_smc_multiagent";
+      xen,sci-agent-id =3D <2>;
+      /* other domain properties here */
+    };
+  };
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

