Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B764606A32C
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=BNGMjTsC
Received: from list by lists.xenproject.org with outflank-mailman.1470351.1679134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILB-0001D2-Nj; Tue, 03 Nov 2026 17:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470351.1679134; Tue, 03 Nov 2026 17:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILB-0001By-CN; Tue, 03 Nov 2026 17:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1470351;
 Tue, 03 Nov 2026 17:30:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIL9-0000yP-Io
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIL8-00F7AL-Vk
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:30 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a36-bab6-0a2a0a5309dd-0a2a450498fe-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:30 +0100
Received: from [52.101.84.141]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a36-b57f-0a2a45040019-3465548d7ed2-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:30 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:29 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:29 +0000
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
 b=YjFXjqDH3qLHU/BXyMVIK21QjNWSX2A/J66g2v8M8NZNf2+7+ZvbTL1S0FoGoduTfbH+G6gCACjN6iCwJ9wbp/eU9yhGkTrZK3QSE1pO2Bt2QJ3h7kDwa9NYbfjjLbQKxLchjG1NMpARMdn/DcOBSo4qLORAoPG1bXJqkmVxec+yOUs+pMqzrMGbNXWj49kEJFcjZHrooxZNos6VIoboJu0AUPsp4UsGGFvEywPF7KgaPTrHrZ0RiqDhGVkgs1J2wQyRArdF21VW76oXArlcaNKE5N6B8niOagWxMtt7e9sHQoZdtVfX7DmiIzNlmB1XR+QFeHWzMYn2leVN8iH08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aSmDKvTyhhBE06rL9j3vIfp1l/Y0pxqK6QYGI4W0tE=;
 b=DP1udCdRpk4ORffCnmMr0KxZCk1e/+quFZfJ3mhxKbXCz4ILgE/oKUJB4XXJC03uNncBxXhRSP9PeOdL5QDfJAuo9MKteWUOHexCSId0M7eMVVr4ZT5s4yUdGztP81sGxtAqkOir3v6KakoPpv0S+6v6iNM7ulXerg5PhB8tjrsIMtUJ6/NsbBqbQLu90iuv6kG2kjoJieVzW+ZuOT0s9tJB8ZPeO5stRSAZm9WT4A8eFakL0SVgXwlvI/dsK5E5rCE1fhsG4igDxbeh/c2T7G+6trBIH79Zuxgjt6QY7yRY8LOx+cJGgK9fT6iwKjqHhBBAR/76Ae0vba9a81oDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aSmDKvTyhhBE06rL9j3vIfp1l/Y0pxqK6QYGI4W0tE=;
 b=BNGMjTsCcA6D3QTU4HWlgI/HoXQAjjYKBijDlwbGBxjg2kXWj0qq/I5X8Ppkub3fc+V/hfSdGqncTVIgozlXlTb4ITMdV3KoxSrPksEd9kYjZOOFfib1o/3AdvPeHXKFUmuCgXpkf1cr1HQwEcJcjPKFAPz8UJKOESDxapVpBc5gosnRBpZeHTfptLXz2VidP0h8RbkwORXBlmXLz/6C7+Gut4FsJ+FkceYX7ThFm0Sy6koFwznh7iV9Ffd2fYE018EZMF+7TqG3PuIejNkvJjm+emkqQvBle8GVB+KGLWI/RsLTlqyZBhKhB6XSwRs2JhKjhpDAAISnpK9hBwjwBw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 09/22] xen/arm: vsmmuv3: Add support for cmdqueue handling
Thread-Topic: [PATCH v5 09/22] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Index: AQHda7kFdgqbLxwgaEeMi2KRx7G61A==
Date: Tue, 3 Nov 2026 17:30:29 +0000
Message-ID:
 <0488c1435bfadbbf95e0f17f3a2a62ea26d1aa85.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 0d73df7e-2a14-44c9-97d1-08df39d027be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 Su9gskgiLnH8l/WjCqV4Wq3P1FaCQKb5LOunhJQpa10V3KxNqDLwdj+yAHv6VRJ5Fhh2bWPu2RVBvOAi8TTnyaXKhhJ4AAIJDTItdWzShw8unY2WRctz+Ruhvkul2Sce9nWQeg7SUp8r7tmehnSoi15j3/aURZLxuCUlNcolIb7u+VdvITc6M8y9R1j0UNkoy05Fh6a6mY2AE86wkXEfVAX9B9qbgOZx4yfDKIwQiuk6veFbzX3ip3E4YHkdshBtTk5AKZ/4O0eRhg7khXmA9lIXXwJqlcFYNde+VE0AMyhwspvDGvIw02D7+dnFOhEJKONliz7eDbdy/RR4tCjJgDvue7Ts+7v7OAvhSyWvap4DzA4aIgTh+qc7FKYpHNOJI2vvnttpKUe85/ai6fz3fhV5DKv7OxspMVfRGiyMJZHZvFRN14lh7S7tSCc6ucUj2IsS9ioyJzJ8iXqiGNq1tLPOHFbcuyrZQHwgvOljitcAMpxPqwj5ZFL+FRm/HFXNxb5fl3lb/IqLJYqFOUjB+2cmpKLFRBi8Cqs/Ylyt8eGmBRZPcLpmAR8OFqHOVWm6Ls9gKI4NNM2o+FXSpiJdxsN6f/T9EckXiVNJ9pkr/UkH7ekEJVdG/vBmnDypqTXwjqGZ59aPdL/oGtIIOG1ENJFOSvUaEWkfs+nmAG9/lx6K56EzzHWBxDCv5ajbcdPzhA65X/uwvuNIlo57SI5lM0uVmuiCQZRydONpW5dy+SM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?h4Qd8YrPBzn88lh4RS/ZMNaCEUuTGhD33l5acUWGJP2BP0g6CS2SJjVDL7?=
 =?iso-8859-1?Q?52KFl7cBCncfBwa6T+3Z666e97RO8yIQ/K9OEORq/N0Pz+JKo6LBUQoIzM?=
 =?iso-8859-1?Q?Zl6+sbinVLotWsrC4nkYe3VA9ByW/D0PxP1yv1/ejF9I/69lWs6MKP9RUx?=
 =?iso-8859-1?Q?tbh17yEqhaVifmR3QniUJJkfbwStbRVIL5auGeOhVsRiy6fWCmongUQnyu?=
 =?iso-8859-1?Q?Wc1St5/GQodIm0qoEjmMSPjKNc7p0WeGnl9HYoDUKvIkGuNfJJBi6+euH5?=
 =?iso-8859-1?Q?FseWvgGWtbrgd+2ulE85exIorOJw6x3xec71TLG2E6/GU5EmTj3VNRWlWs?=
 =?iso-8859-1?Q?Ncs7jruVIWZm/ObSTvo+s4yFptky8gtp1RPcjaVBoA+Evr8Re4WszEfXW2?=
 =?iso-8859-1?Q?T6Xd0WR5Qak/KOfMEj8G6ZG2zptofn9phCjwWyN3Mb9DUlh2uW8ug5DEFa?=
 =?iso-8859-1?Q?l5d7KcxeryqvyRRx51TILTfASp0XsI9HNZM2c7rWwwkD0NBwMjUR1elVM3?=
 =?iso-8859-1?Q?l20Mk4IGRdW/A+qmso7p70buhiEvjekqiNj13HivNBAEGfZYM2kQ5guO6X?=
 =?iso-8859-1?Q?5dmIgynhAHUz+kwID1c8Q1/LvjeSvuefy9aucNqRQs/z+G+HN7bXNXze3W?=
 =?iso-8859-1?Q?wyEdb0mc+arUlrsdRlzW6FBy3upp+bDvxjKEkU07hqzpEYyOlAsAejNb6v?=
 =?iso-8859-1?Q?X2Fz4oaVt73AX/FT6+kRhbzuXpfZeXCM28fHNFnl+LDXtXOVdQbLT/iJqn?=
 =?iso-8859-1?Q?VmbK3/TDkPqpArHfYkONe6w9wPOyskcPjGj5hqq3iM8QZ/Q6/1Ixjg3QIo?=
 =?iso-8859-1?Q?WhYDhFzilofYCPcw4y8qS417ThFI9wRlF9cXnvs8LzwXnTZOT7GAeJSHmt?=
 =?iso-8859-1?Q?qsoXIHKUgGiYgGObSuxhvj3cR7oUPzQOBp1K/ZfmSfGHeJ2CjkXA4JPh8a?=
 =?iso-8859-1?Q?qyADGnC45fsXnhQLPYMC6laowE46eJMr9HFDaggxsQvhxKdIgrrOuiTweX?=
 =?iso-8859-1?Q?wIluR99Nk1lCl0O1RA31vAFegiBCuFeFAQbMY978lse6OarV888hB5b4tt?=
 =?iso-8859-1?Q?Tnx+aPczwR1PCZn9eb+cupN3+iZ+dhmfV3DZ0lo8aLLfn89O9zn4gUWvK7?=
 =?iso-8859-1?Q?M8Lu24sFGlbFQq39X0X1rfg9jfWkaARL6xeuYm52OCgcfW4uy7dp67jk1+?=
 =?iso-8859-1?Q?hAWYZNk+n10Mq/aJUELyEhmfvJzqLCGpiR2I3LfYjIpYK/MjNqJYJs7iZr?=
 =?iso-8859-1?Q?JpsIb0//E0SQKehWgNpGU6GA6Nfy95UzRV5bM2kaZiXmVR0irXZWIy4a4q?=
 =?iso-8859-1?Q?Tvut2Rcv+am7l5Nw1NJkM903sTi7YAutUYIW7uA/QXeZKoBR29BvEHmKbE?=
 =?iso-8859-1?Q?HVvEli+aZw564qvtB55aHMT3WmMpGYB/+TBK+xOIBcvYIEDNlilBeuzYvs?=
 =?iso-8859-1?Q?ZpbILx4iiGa8qPmxbeWD7GarIJMpNbZnJO5X1eQ2JGmRt2m3N6w+MVyIJ0?=
 =?iso-8859-1?Q?05t3+ew0j4VNFh2O3bIzKvzJjqOKCaVVOxXAJf4Sh/vvyMMdJRCfGtLZlt?=
 =?iso-8859-1?Q?t3OVAp7F2/AOj9Bil4sSO4MWihSVgqy6P/+z4u3oZe+BiBnwqXw2kbuRJl?=
 =?iso-8859-1?Q?uTRMLMi6PLoiATEq/VoV6Sa7W1XB+9/G4WlhxDp2F1Ly3Nw5iXf9Cm+3rt?=
 =?iso-8859-1?Q?1tocQ/i3GWu5llOftnTj4yGe/20nj2WSDQDF6MHMaIc1DGXkOMFgeLIkI0?=
 =?iso-8859-1?Q?7NsynqDwkwXB/KGXAcKPMTnoIQFoE6yGdoboxlCiY7dX4/nF5bWjko3PoO?=
 =?iso-8859-1?Q?ZBqbrNZvKg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d73df7e-2a14-44c9-97d1-08df39d027be
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:29.2369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: upiEiZTJ80Ph1Wq+AIIN6mfPCbhRoMLW0btQdecOKjDOdtN6c+vv8uXfnpggMdmhSEgM/BYEYjDroe5+8s0/zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-ebf023/1793727030-C20D5B50-1860F9AC/0/0
X-purgate-type: clean
X-purgate-size: 5766
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Add support for virtual cmdqueue handling for guests

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 133 +++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 070fe7af79..780f36bf2a 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -8,6 +8,7 @@
  * This needs to be fully handled in the future.
  */
=20
+#include <xen/guest_access.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/domain-layout.h>
@@ -34,6 +35,51 @@
 #define SMMU_EVTQS          19
 #define DWORDS_BYTES        8
=20
+/*=20
+ * SMMUv3 command definitions
+ * Some commands are fully handled by the emulation layer, while others ar=
e
+ * currently treated as architectural no-ops because the required behavior
+ * is either implicitly guaranteed by Xen or not yet modeled explicitly.
+ *
+ * Emulation handled commands:
+ *
+ * - CMD_CFGI_STE
+ * - CMD_TLBI_NH_ASID
+ * - CMD_TLBI_NSNH_ALL
+ * - CMD_TLBI_NH_VA
+ *
+ * No-op/Implicitly handled commands:
+ *
+ * - CMD_SYNC
+ * - CMD_PREFETCH_CFG
+ * - CMD_CFGI_CD
+ * - CMD_CFGI_CD_ALL
+ * - CMD_CFGI_ALL
+ *
+ * TODO: Remaining architecture-defined commands are not supported (error
+ * produced), due to lack of support in SMMUv3 driver / emulation layer
+ * TODO: Range / per-device invalidation not supported atm
+ * TODO: Long-running command queue handling is not implemented (command
+ * consumption should be budgeted with asynchronous resumption).
+ */
+#define CMDQ_OP_PREFETCH_CFG    0x1
+#define CMDQ_OP_CFGI_STE        0x3
+#define CMDQ_OP_CFGI_ALL        0x4
+#define CMDQ_OP_CFGI_CD         0x5
+#define CMDQ_OP_CFGI_CD_ALL     0x6
+#define CMDQ_OP_TLBI_NH_ASID    0x11
+#define CMDQ_OP_TLBI_NH_VA      0x12
+#define CMDQ_OP_TLBI_NSNH_ALL   0x30
+#define CMDQ_OP_CMD_SYNC        0x46
+
+/* Queue Handling */
+#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
+#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
+#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
+
+/* Helper Macros */
+#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
     uint64_t    q_base; /* base register */
@@ -100,6 +146,89 @@ static inline bool smmu_get_evtq_enabled(struct virt_s=
mmu *smmu)
     spin_unlock(&smmu->cr0_lock);
=20
     return enabled;
+};
+
+/* Queue manipulation functions */
+static bool queue_empty(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) =3D=3D Q_WRP(q, q->cons);
+}
+
+static void queue_inc_cons(struct arm_vsmmu_queue *q)
+{
+    uint32_t cons =3D (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+    q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+}
+
+static void dump_smmu_command(uint64_t *command)
+{
+    gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
+             smmu_cmd_get_command(command[0]), command[0], command[1]);
+}
+static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->cmdq;
+    struct domain *d =3D smmu->d;
+    uint64_t command[CMDQ_ENT_DWORDS];
+    paddr_t addr;
+    int ret =3D 0;
+
+    if ( !smmu_get_cmdq_enabled(smmu) )
+        return 0;
+
+    /*
+     * TODO: A large number of commands could cause this loop to run for
+     * an extended period while holding the command queue lock, potentiall=
y
+     * monopolizing CPU time. Implement commands rescheduling and asynchro=
nous
+     * execution as outlined in the design.
+     */
+    while ( !queue_empty(q) )
+    {
+        int ret;
+
+        addr =3D Q_CONS_ENT(q);
+        ret =3D access_guest_memory_by_gpa(d, addr, command,
+                                         sizeof(command), false);
+        if ( ret ) {
+            queue_inc_cons(q);
+            return ret;
+        }
+
+        switch ( smmu_cmd_get_command(command[0]) )
+        {
+        case CMDQ_OP_CFGI_STE:
+            break;
+        case CMDQ_OP_PREFETCH_CFG:
+        case CMDQ_OP_CFGI_CD:
+        case CMDQ_OP_CFGI_CD_ALL:
+        case CMDQ_OP_CFGI_ALL:
+        case CMDQ_OP_CMD_SYNC:
+            break;
+        case CMDQ_OP_TLBI_NH_ASID:
+        case CMDQ_OP_TLBI_NSNH_ALL:
+        case CMDQ_OP_TLBI_NH_VA:
+            ret =3D iommu_iotlb_flush_all(smmu->d, 1);
+            if ( !ret )
+                break;
+            fallthrough;
+        default:
+            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
+            dump_smmu_command(command);
+            break;
+        }
+
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "vSMMUv3: command error %d while handling command\n",
+                     ret);
+            dump_smmu_command(command);
+        }
+        queue_inc_cons(q);
+    }
+
+    return ret;
 }
=20
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
@@ -222,6 +351,10 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_inf=
o_t *info,
             reg32 =3D smmu->cmdq.prod;
             vreg_reg32_update(&reg32, r, info);
             smmu->cmdq.prod =3D reg32;
+
+            if ( arm_vsmmu_handle_cmds(smmu) )
+                gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
+
             spin_unlock(&smmu->cmd_queue_lock);
             break;
=20
--=20
2.43.0

