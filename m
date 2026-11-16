Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBC606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=H9iZwNge
Received: from list by lists.xenproject.org with outflank-mailman.1491038.1691987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxu1-0007SB-Sn; Mon, 16 Nov 2026 14:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491038.1691987; Mon, 16 Nov 2026 14:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSxu1-0007RC-IE; Mon, 16 Nov 2026 14:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1491038;
 Mon, 16 Nov 2026 14:41:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xSxtz-0006qa-Sm
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:41:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSxtz-00CLkE-14
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:41:47 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb162a-bab6-0a2a0a5309dd-0a2a450480f8-2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:47 +0100
Received: from [52.101.66.113]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6afb1627-b57f-0a2a45040019-346542718d39-9
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 15:41:46 +0100
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by GV2PR03MB11211.eurprd03.prod.outlook.com
 (2603:10a6:150:30d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:41:41 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0592.012; Mon, 16 Nov 2026
 14:41:41 +0000
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
 b=DKRSTlLHB34f/UGIJUoHlf/aTfbHv5vi8VItiX5Au3K2b4ZtfVTLEYr4raazgevLjPfsTuhtwyKRR4gCvSp3aN0elJYAY5CSq9a0TR8sQpMnplBqbo9bUD2mlJ+HyP20QpFjnWKjjA33Ll0e4pg5uvW3xLlgNm7Z77XQuI8yib61rulwFF2E/31SmpuhrCtErONCPIIp948Towmb4y6i++SXSjBCEHaVNNHNY9GufwzCC/ZD07yMC+wGQ76qzsYcMqyHD1beqyZjY4lJqpHrRqGln/c99v3hArPSx5tKjOucTDkM22gbUGgMb/hzCwFC/YSq2i7wPKeSSlyuN86SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLhF0hBdemMrW2peTwRF7QB9sqnYHb9jGDObsKmUmKw=;
 b=XBn5mjU0eAoa8zcDb2ndhDrS5+izrSEGnjJAJSZvFwiobEP1OsUoV4Wf3+pXA7m920xqZFX1ylB6+Pp4dtvyx3tzjgDeGrexVHIBIp+fNic07yGh5p1h3Iby7xJzFu5xnZ/xWhU6SMgwzJilUJonalfK2OSej+qchajZu6yMvNXPLxvCju86Uc6lAaAtgLi5ceNux9vYbf8E3sHvMdHl1huRm2K0TyqJ3nZvAsQ6FypBGinwAGEdpKz8wi5nHj//MubmYvx1hC7LoyayVoCrRBVlv81qTICkyEuMhP2bZRyN4xdZDW4A4QX++YO6Mm01FbmTgGyEy25UlqCniEBMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLhF0hBdemMrW2peTwRF7QB9sqnYHb9jGDObsKmUmKw=;
 b=H9iZwNgeYTtX+zMOZqvHyCrwmSk17fwEni4WgOdSCtCUZiiKM5+fb0ajIf0sFAXN31zy4PGMaDMpxTziL3uKTe2bg2Vxuq7urbnVccL6I5/GoEm9Dbs+FV1uX4v7ZfWQKTc8GZPEdZoJCBmmFxXvKWmDp2GKtru3WajtkdSnP+6DMuU/ZBuXqoG9NWIYrAuDcLBPXzAdQK5qmnv5ZmUPnqfwDJhBPvDzr7cF2HeWLRaX+PSpnecq5TnXTgFfogK0b47sUIVyi+lJx367a4kD2wM76T9KU1ZO2stKw3ghsXnxJCLAqLWzciTNtFOht1+l4sba2JHJfO5G0SLUE8cf8g==
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
Subject: [PATCH v16 6/6] docs: arm: add SCI SCMI SMC multi-agent driver docs
Thread-Topic: [PATCH v16 6/6] docs: arm: add SCI SCMI SMC multi-agent driver
 docs
Thread-Index: AQHdddiX44qIri7HQEq7yHsaIFo3mg==
Date: Mon, 16 Nov 2026 14:41:40 +0000
Message-ID:
 <b591454d5fe2a9bb031a021b73480bfb86b6f185.1794839953.git.oleksii_moisieiev@epam.com>
References: <cover.1794839953.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1794839953.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR03MB11113:EE_|GV2PR03MB11211:EE_
x-ms-office365-filtering-correlation-id: 7eea6744-8c31-4b6f-5739-08df43efbaa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|261026140227099003|261026121527099003|261028144727099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|38070700021|5023799004|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 QETWzJffiNvvjaMD9kZxiVmNAeFLrzThdTXM3N6IfKmxu6k9/lEoWtW+cLmVNZIQdXb+8mit8DUu12QZXDL2Z6+Xjdi7DabwqmMBDO7xh2Koi8e6nERY3MUAv7j+tIVjThsjsOneztR5DrOgeNTRTOTyh4xvapD+zXFt4M2lyEj54ivqhbTfUQSjp4Q8TmYbWtKnj1UXi8NOUjS9ACsCJdQFBp+AMI4X9MWWSFJ6M5QJl4yxYhbN35WJVqGzjxb1xFGhyCzaQ9o63Hx6lKzUkqm71Dnhiv17p9PsY+5wMxBIiC/WNvxg6Cx5T31czKXVn985G5BmWyX4httZPckp4UjkjgA63w3mQ1sbDZmEKlcMfJ6AHCtAU8nTgjplnn4k4aKIwSB6OYvsOUc3zyx3ygOr+UUjgvpttpXUx3jVMgsPf26QdikrAds0yImFdzLMHlUIUTJlsOziBRrIdCN7ldnYgkjah1K+xnoNzpf4h3pHDcblI3vHHKPETBb2pz7lBxIKB00PhBf7ST0TBHQaRPA9WxjRIowL3Bgu2m1ZuQQhbZhCwsOMyXGiyB+3jQN6o88DZWWBrFHlr66JlqsuLOZ9/0Rcodh1pWUBNtppIeBhex9laYvV+1I+GvOLEt9zOSk7//GBZOA62vpQRFcUM6uXJv/myti26fOyybzX/8o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(261026140227099003)(261026121527099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(38070700021)(5023799004)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OHwwMZiNd++DP2rRwMT0xI6yxxBu2ZiQ7e4zpyxvf1dcuLzUeMHdc9rMCF?=
 =?iso-8859-1?Q?26mHn6gCz2Iio5NWtvfEP1qt71ByfoB5rkuESx+RWin/aaPYOpsm4mbo5e?=
 =?iso-8859-1?Q?0NcjV51T4uHDfshdWQlK+zQ/VPxe91ZzyNFhFw4US5w6yq7S5ekp7EJR1z?=
 =?iso-8859-1?Q?kjzsxcmk3dDUAjQJ8usmVmkgsf1h5JUt3mPCUvR8Ezlx4NOYd2f/k2wdLI?=
 =?iso-8859-1?Q?BhUpmyqi2UerHPRNYyGmsrjGPHqSsrtijiR3nRZ9GdQGgiR4cFGaDolvWE?=
 =?iso-8859-1?Q?75+ChrI9lX3AP8VJ5unAdM7bxlHeTX8lsVPV2lWsgpoI2ERCj8UYYocqFd?=
 =?iso-8859-1?Q?r5+c1oCDlvTXG5QIDe50c5m3Ssr29v6eRKxL/81HDB/efD0efkXr6AjkPC?=
 =?iso-8859-1?Q?Bgv4gDkkkV1y/jaJiheolRkxodMtbmeshZfFvHVUA0u28X/DkSEQax69e0?=
 =?iso-8859-1?Q?MA4ffitMbTmKC6SvLb/RSURxr6EfsEWCvQIri8fjpL14gEpWnXU+iUYzL0?=
 =?iso-8859-1?Q?pHbf67jL7DeAFQ/qFlJsQUL+GQYm9+Kw7Zv93OBmeMFJIoqXCcbV4TLuwi?=
 =?iso-8859-1?Q?kKnQ9kTZiXhzfrokDRWXCj1NQRg/gnFaklR1cG/8ADHSlAe+EUFTokrAa9?=
 =?iso-8859-1?Q?0v/MHFcyGYKLUq9ZesfKYXmMIHch5HsisERYyJtD1VW5kfnmGNfCEEnXYr?=
 =?iso-8859-1?Q?9UkIa/n/U1CSzMbKKk/pniTguetB4Ka26WxYjhAOHI5I4A4aS2Slv6sXZE?=
 =?iso-8859-1?Q?j540ZzoTgyyET5Cu61h9IY7y6nNKCbn5pDDded5chAJt9Rkva4YPSnIYv2?=
 =?iso-8859-1?Q?rl1SWFWof1Dcooyg5W3+LYePRtRO5kFlulokMBPetUENpUMgjxZBNMffjr?=
 =?iso-8859-1?Q?8xwZG6mIJc6uXRCNpR53C7AGPcU/rssZXS5KHzsx2mWNqAeGrlopmBMf/W?=
 =?iso-8859-1?Q?ByspgFcXZAFrXOxhk0P/v8g6FREAhIy/xGMWK0OUKEcWEeYyRUj+vt4ica?=
 =?iso-8859-1?Q?1UPFVtTeKxp10JMZVAQRDp+A0/ZzMBWZsYa8NzjKyRxfcKwHEfovlsV638?=
 =?iso-8859-1?Q?7tGBPY4dTi0LaCQfXMRakHMFbadEwJ+BMZ/Pjf1o++9mCDY91ofRCeoTHE?=
 =?iso-8859-1?Q?NYcK+/xtPFuG37eAdPrDRCmOxETWxjQmpBWHckymn2sA8TIcy3SVCHYGkv?=
 =?iso-8859-1?Q?5veVCx/oieZ0JocR9ZBgz2+a/erpiJQJHi4D3wKJWkTNNH24w96zXlTChL?=
 =?iso-8859-1?Q?pqMohUeXQP2l92wp1Jt8sFo1g1XSXqGgqdaf3gak7fDRUQKPXBPb8NbwQf?=
 =?iso-8859-1?Q?fTC1nyAE9XimPeLetLy8vY2qFBNSQzWEDQeVXjeA/uHzjfSFMTrzbs2TPU?=
 =?iso-8859-1?Q?Y+dGwfI5IMopm5KSeXlqAtozkyta9gXMMFSnbtO7NsJxsccyaly/DW1oMu?=
 =?iso-8859-1?Q?HlKEdEzaFJS7DA58Sey3nkdcqJkN1sL4S85jBYBX9ty/mjLX8pBMGedfag?=
 =?iso-8859-1?Q?M6t6z0lmwJ3+TmAVuznQztFOkugp173UxeQb11pBGvlUEwdg2qlXRIuVSM?=
 =?iso-8859-1?Q?wvzQXyTBHaA94GjBYBeA9lgo8UbkjA+B3Io7P/D4swuSDMdscd6TXw90/8?=
 =?iso-8859-1?Q?ZNg2WynGUB06RPR8SztZEJJU+kMqBGwnp3EmFGRS99rqznxQuerbxbj3D+?=
 =?iso-8859-1?Q?VJEfI1QUbY3nUHoDzZjtVKRXxTPLRE/jIUCZ4VsWnCB+D5OxgLejG0VxQN?=
 =?iso-8859-1?Q?nGC5iro87g0dvEUmksYOu5+t/S1OcZVj2KH1NZHAsdLBJhPyea+1xHkRq+?=
 =?iso-8859-1?Q?zJ7iHApkjWk3exFZIJcKvJ21Y4zvDJc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eea6744-8c31-4b6f-5739-08df43efbaa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:41:40.4601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gGVrN/7aYoq2iA45GflhOImGCyCQmnwT9sPZb1teDaacSUfAK13TMjabwl/+0r2f2bojETtPEO9sDvDxQqmVrYBg7jShn7ntX42l0kO4N7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11211
X-purgate-ID: tlsNG-ebf023/1794840106-536C2B50-8A5935F2/0/0
X-purgate-type: clean
X-purgate-size: 20900
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

Changes in v16:
- label Xen in the architecture diagram
- document BASE_SET_DEVICE_PERMISSIONS as mandatory and explain the
  warning and persistent-state implications when agent reset is unavailable
- use xen,dom0-sci-agent and xen,sci-agent phandles with DT labels in Dom0
  and dom0less examples; retain optional reg in agent nodes and distinguish
  explicit-ID unit addresses from discovery node names
- explain that phandle selection also works with firmware-discovered IDs
  by resolving the ID collected during probe, and that toolstack
  configuration continues to use numeric agent_id
- correct the access-controller example to reference Xen's management
  node; fix DTS syntax, section headings and partial-DT examples

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

 .../arm/firmware/arm-scmi.rst                 | 437 ++++++++++++++++++
 1 file changed, 437 insertions(+)

diff --git a/docs/hypervisor-guide/arm/firmware/arm-scmi.rst b/docs/hypervi=
sor-guide/arm/firmware/arm-scmi.rst
index d9698f4e4b..06b1e3b3f3 100644
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
@@ -189,3 +191,438 @@ except explicitly enabling SCMI with "arm_sci" xl.cfg=
 option.
     ->        xen,reg =3D <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
     ->        xen,force-assign-without-iommu;
       };
+
+SCMI SMC multi-agent driver (EL3)
+---------------------------------
+
+The SCMI SMC multi-agent driver supports Arm EL3 firmware, such as Trusted
+Firmware-A (TF-A), that provides a separate SCMI transport channel for eac=
h
+agent, as shown below.
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
+      |              |   Xen   |           |    |
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
+The EL3 firmware must provide an SCMI SMC shared-memory transport channel
+for each agent. Each channel consists of:
+
+- ``arm,smc-id``: the SMC function ID used as a doorbell.
+- ``shmem``: the shared-memory buffer used to transfer messages. Its addre=
ss
+  and size must be **Xen page aligned**. Xen maps the buffer as Device mem=
ory
+  using ``MT_DEVICE_nGnRE`` and ``_PAGE_DEVICE``.
+
+The firmware must provide the following agents:
+
+- Xen management agent: a trusted agent that has access to Base protocol
+  commands to configure agent-specific permissions.
+- OSPM VM agents: untrusted agents, one for each guest domain that needs
+  SCMI access. At least one is required, even if only the hardware domain
+  uses SCMI.
+
+The firmware must implement these Base protocol messages:
+
+- ``BASE_DISCOVER_AGENT``: required for Xen and for secondary agents whose
+  ``reg`` property is omitted.
+- ``BASE_SET_DEVICE_PERMISSIONS``: required. Xen checks support through
+  ``PROTOCOL_MESSAGE_ATTRIBUTES`` during initialization and fails to
+  initialize the mediator if the command is unavailable. Firmware must
+  enforce the permissions configured by Xen and prevent untrusted agents
+  from changing other agents' permissions. For firmware without this
+  command, use the single-agent driver for the hardware domain.
+
+``BASE_RESET_AGENT_CONFIGURATION`` is optional. Xen requests a reset when
+relinquishing a domain's resources. If the command is unsupported, Xen
+prints a warning and continues teardown. Device state and agent permission=
s
+may persist, so platform software must ensure that reusing the agent is
+safe. Other reset failures are reported and propagated to the caller.
+
+The number of agents and the transport channels available depend on the
+firmware implementation.
+
+Compiling with multi-agent support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+To build the SCMI SMC multi-agent driver, enable the Kconfig option:
+
+::
+
+    CONFIG_SCMI_SMC_MA
+
+
+Driver functionality
+^^^^^^^^^^^^^^^^^^^^
+
+The SCI SCMI SMC multi-agent driver implements the following functionality=
:
+
+- The driver is initialized from the Xen SCMI node ``xen_scmi_config``
+  under ``/chosen/xen`` (for example ``/chosen/xen/xen_scmi_config/scmi``)=
.
+  Only one SCMI interface is supported. The SCMI configuration must live u=
nder
+  a node compatible with ``xen,sci`` beneath ``/chosen``.
+  The Xen SCMI mediator will bind only to the "arm,scmi-smc" node that is =
a child of
+  this "xen,sci" node; any other "arm,scmi-smc" nodes (for example under
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
+- The driver reads secondary agents from an ``agents`` child node of the
+  ``xen,sci`` node. The ``agents`` node uses ``#address-cells =3D <1>`` an=
d
+  ``#size-cells =3D <0>``. Each enabled ``xen,scmi-agent`` child node spec=
ifies its
+  doorbell in ``arm,smc-id`` and a single shared-memory phandle in ``shmem=
``.
+  The optional single-cell ``reg`` property supplies the SCMI
+  agent ID (0..254). IDs must be unique and distinct from Xen's management
+  agent.
+  At least one enabled secondary agent is required.
+  With an explicit ID, use a unit address matching ``reg``, such as
+  ``scmi_agent_domu: agent@2``. For discovery, omit ``reg`` and use a node
+  name without a unit address, retaining the label for phandle references.
+
+  Place the SCMI-specific shared-memory nodes under ``xen_scmi_config``.
+  Keep the host OSPM shared-memory node and ``/firmware/scmi`` in the plat=
form DT.
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
+                    xen,dom0-sci-agent =3D <&scmi_agent_dom0>;
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
+                        scmi_agent_dom0: agent@0 {
+                            compatible =3D "xen,scmi-agent";
+                            reg =3D <0>;
+                            arm,smc-id =3D <0x82000002>;
+                            shmem =3D <&scmi_shm_0>;
+                        };
+
+                        scmi_agent_domu: agent@2 {
+                            compatible =3D "xen,scmi-agent";
+                            reg =3D <2>;
+                            arm,smc-id =3D <0x82000004>;
+                            shmem =3D <&scmi_shm_2>;
+                        };
+
+                        scmi_agent_domu3: agent@3 {
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
+``reg`` and the node's unit address. Keep the label so domain references
+still resolve. For example, replace only ``scmi_agent_domu: agent@2`` abov=
e with:
+
+.. code-block:: dts
+
+    scmi_agent_domu: agent-domu {
+        compatible =3D "xen,scmi-agent";
+        arm,smc-id =3D <0x82000004>;
+        shmem =3D <&scmi_shm_2>;
+    };
+
+Providing ``reg`` skips mapping and probing that secondary
+channel during initialization. A malformed property is rejected. Xen alway=
s
+discovers its own management agent ID. Thus ``BASE_DISCOVER_AGENT`` is
+mandatory for the management channel and for secondary channels whose
+``reg`` is omitted. Use node labels, such as
+``scmi_agent_domu``, in phandle references; node names, such as
+``agent-domu``, are not labels.
+
+Neither ``xen,dom0-sci-agent`` nor ``xen,sci-agent`` contains an agent ID.
+If the referenced agent node has no ``reg``, Xen sends
+``BASE_DISCOVER_AGENT`` through that node's ``arm,smc-id`` and ``shmem``
+channel during mediator initialization. Xen saves the returned ID with the
+agent node, then resolves either domain's phandle to that ID when building
+the domain. Discovery failure aborts mediator initialization; Xen does not
+derive an ID from the node name, phandle value or SMC function ID.
+
+.. note::
+
+    Only Xen needs to know about the multi-agent configuration. Each guest
+    uses its assigned channel as an ordinary SCMI transport.
+
+- The driver implements the SCI subsystem interface to configure SCMI for
+  Dom0 and guest domains. Each domain must use a unique agent ID and the
+  corresponding SCMI SMC transport channel ``[arm,smc-id, shmem]``.
+
+- Once a domain is configured, it can communicate with the EL3 firmware:
+
+  - zero-copy: the guest writes and reads SCMI messages to/from shared mem=
ory;
+  - the guest issues an SMC using its agent's ``arm,smc-id`` as a doorbell=
;
+  - Xen checks the SMC function ID and synchronously forwards the call to =
EL3.
+
+- During domain teardown, Xen sends ``BASE_RESET_AGENT_CONFIGURATION``
+  through the management channel to reset the agent's configuration. If
+  reset is unsupported, Xen warns about the persistent state as described
+  above.
+
+
+Configuring SCMI for Dom0
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Add ``xen,dom0-sci-agent`` to the ``xen,sci`` node under ``/chosen``.
+Its value is a single phandle to an enabled secondary agent node. Xen
+resolves that node to its configured or discovered agent ID. If the
+property is absent or invalid, SCMI stays disabled for Dom0 and the SCMI
+nodes are removed from Dom0's DT. An invalid reference produces a warning.
+
+.. code-block:: dts
+
+  chosen {
+    xen {
+      ranges;
+      xen_scmi_config {
+        compatible =3D "xen,sci";
+        xen,dom0-sci-agent =3D <&scmi_agent_dom0>;
+        /* agents, shared memory and scmi_xen as shown above */
+      };
+    };
+  };
+
+When SCMI is enabled for Dom0, Xen copies the host's ``/firmware/scmi`` no=
de
+to Dom0's DT unmodified. This node must be present and enabled for Dom0's
+SCMI driver to use the channel. Xen selects the agent using the ``agents``
+child node and ``xen,dom0-sci-agent`` property under ``xen,sci``.
+
+.. note::
+
+  The selected agent's ``arm,smc-id`` and ``shmem`` must match the channel
+  described by the host's ``/firmware/scmi`` node and provided by EL3 for =
Dom0.
+
+Configuring SCMI for a guest domain with the toolstack
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* Add the ``arm_sci`` option to the domain's xl.cfg file:
+
+::
+
+    arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"
+
+* Use ``iomem`` to map the shared-memory channel associated with the domai=
n's
+  ``agent_id``:
+
+::
+
+    iomem =3D [
+        "47ff2,1@22001",
+    ]
+
+.. note:: The user selects the guest IPA used to map SCMI shared memory.
+
+* Add SCMI nodes to the guest's partial device tree. ``arm,smc-id`` must
+  match the channel associated with the assigned ``agent_id``:
+
+.. code-block:: dts
+
+    passthrough {
+       #address-cells =3D <2>;
+       #size-cells =3D <2>;
+
+       scmi_shm_0: sram@22001000 {
+           compatible =3D "arm,scmi-shmem";
+           reg =3D <0x0 0x22001000 0x0 0x1000>;
+       };
+
+       firmware {
+           scmi: scmi {
+               compatible =3D "arm,scmi-smc";
+               arm,smc-id =3D <0x82000004>; /* channel for agent_id=3D2 */
+               shmem =3D <&scmi_shm_0>;
+           };
+       };
+    };
+
+**Device specific access control**
+
+The Xen SCMI SMC multi-agent driver acts as an access-controller provider.
+It uses the required ``BASE_SET_DEVICE_PERMISSIONS`` command to configure
+the devices each agent can access. The Xen management SCMI node must have
+``#access-controller-cells =3D <1>``. Bind devices to that node using the
+Access Controllers bindings [3].
+
+For example:
+
+.. code-block:: dts
+
+    &i2c1 {
+        access-controllers =3D <&scmi_xen 0>;
+    };
+
+Use ``dtdev`` in the domain's xl.cfg file to assign SCMI-managed devices:
+
+::
+
+    dtdev =3D [
+        "/soc/i2c@e6508000",
+    ]
+
+.. note::
+
+    ``dtdev`` needs to contain all SCMI-managed devices passed through to
+    the guest, including devices without IOMMU protection.
+
+Configuring SCMI for predefined domains (dom0less)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* Add ``xen,sci_type`` and ``xen,sci-agent`` to the guest's ``xen,domain``
+  node. The phandle selects an enabled secondary agent, including one whos=
e
+  ID is discovered from firmware:
+
+::
+
+    xen,sci_type =3D "scmi_smc_multiagent";
+    xen,sci-agent =3D <&scmi_agent_domu>;
+
+* Add SCMI nodes to the guest's partial device tree as in the toolstack
+  example, and map the shared memory according to the dom0less documentati=
on:
+
+.. code-block:: dts
+
+      scmi_shm_0: sram@22001000 {
+            compatible =3D "arm,scmi-shmem";
+            reg =3D <0x00 0x22001000 0x00 0x1000>;
+            xen,reg =3D <0x0 0x47ff2000 0x0 0x1000 0x0 0x22001000>;
+            xen,force-assign-without-iommu;
+      };
+
+* Configure SCMI-managed passthrough devices in the guest's partial DT
+  according to the dom0less documentation. Set ``xen,path`` to each device=
's
+  host DT path so Xen can find its ``access-controllers`` property.
+
+Use the complete Xen SCMI configuration above. Remove
+``xen,dom0-sci-agent`` if Dom0 does not use SCMI. The guest selects the
+secondary channel labelled ``scmi_agent_domu``:
+
+.. code-block:: dts
+
+    chosen {
+        domU1 {
+            compatible =3D "xen,domain";
+            xen,sci_type =3D "scmi_smc_multiagent";
+            xen,sci-agent =3D <&scmi_agent_domu>;
+            /* other domain properties here */
+        };
+    };
+
+.. code-block:: dts
+
+    i2c@e6508000 {
+        reg =3D <0x00 0xe6508000 0x00 0x1000>;
+        xen,path =3D "/soc/i2c@e6508000";
+        xen,reg =3D <0x0 0xe6508000 0x0 0x1000 0x0 0xe6508000>;
+        xen,force-assign-without-iommu;
+    };
--=20
2.43.0

