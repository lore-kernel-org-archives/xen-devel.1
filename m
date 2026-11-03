Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C391606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=u96BLSQm
Received: from list by lists.xenproject.org with outflank-mailman.1470353.1679147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILD-0001id-Ia; Tue, 03 Nov 2026 17:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470353.1679147; Tue, 03 Nov 2026 17:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILD-0001hN-9s; Tue, 03 Nov 2026 17:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1470353;
 Tue, 03 Nov 2026 17:30:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILA-00019p-SK
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILA-0082tl-92
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:32 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a2e-e002-0a2a0a5209dd-0a2a4505e898-24
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:32 +0100
Received: from [52.101.84.84]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a37-4cb1-0a2a45050019-346554544431-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:32 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:30 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:30 +0000
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
 b=Wxa/SOdVdzaI5gPZQHilsL3toVVJQ2WNaOnl4bVmF5cVYHL4zp/JFzt8zm2UyRrKeoVLdS3XXm1w9sPYYjEa/K29rrad3hOVBTJ5wjz+oypemvWGrSVJ+7OCyEvQvdBKXWbe/ieisIC0StSmW2VlIPyNDPnhmVGMOf4OGwn3UsIv61H6nc3Og3KDM8Uu6hLUBYmpOPncRdNatcNvsGQ9j37AzdzWbC6TEJbO6R/dBB2aY5sDVtzS4WeGElzMmkeoOq0tTs87m+NgvpAfdlIdhah8ePWTkmSo2qqEbIodY314N6hdLSpz3VFs0M3qzujSag4Z6WJV068NGHZnmxIQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQqvSYKNnxmeZPyhAtojPUrZ/aYqrWZ2IKk5By6TK9o=;
 b=FFdQOZIvP5Owr3iJ1r6cI/uD9HulrTH3IkqcZSnHrghiI3DbQ7XLqfzsK/YKmwvmQ4vx2NFPgUrzj+5oGLr+uLIarnLtGTT3Gw3r52WEyQNrtS2jOkokS2ZahRg70zndIYJ1rXqeEPpHK0H59uK/SqAkExnuEVB4g7w84xrnbZyzghrqZ8qUVPcUztSiyJ/mkp938qKV0HKOnkcWywQAJYLBwjJz7y8smYsBpEbV4CBQt8pL8+lcDpislmzXW3qTPlpUaMKvwfmft9PZ4/XM36jaolIg1RoHZyHVoMJV8EQDutX3G6FCJtXjmHMy4ucSS4+qxgkNbVMGDmE0Zi05gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQqvSYKNnxmeZPyhAtojPUrZ/aYqrWZ2IKk5By6TK9o=;
 b=u96BLSQm1N+RRf/jN5NgETxQfRHjNYY9YGc8KF+YIXMtdDfLjXL+efv1/Zkm4kzN58ia8vm85+qnknqc3ZmJ2VSN+tkMVmkRGo0/Pxm3XgHxu0fY+B7TRGlTIl3cfuOMOJP9frwNpR8dIJ38bKQsLWf/hhdlHbrdMZbnUhsgxbvqrvNR0r0ABmLTQHH8IdUAP4SeFrcQz1m8OV6TdbvlJptTHg5rUOryD/6wtkgCl5az3QpzpMgX6Ekrvtd8vzt74emPd6WPzOTA31W7JDk+9aGSRi7qAweOqooucwK3rk6f7unNkk5/mqHVs2Ls31o/AySUkdUgjigShqav2+rLZQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 10/22] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Topic: [PATCH v5 10/22] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Index: AQHda7kFKiHvf38fDkWF/z0n7zJjLQ==
Date: Tue, 3 Nov 2026 17:30:30 +0000
Message-ID:
 <a7b09076eefc9c15044b1ad656f2dfa504ce4e5b.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: b58995bf-30f3-46bf-38ab-08df39d0287a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 FZ4asv6T6bo/Q2SoJ8T0/cqfcBPxlqnbydYuugfkwyvIaWGyQ/GPw6uGNs6LhySNd9VTq4RkDp/RLll/bDUUMm1mK5yy8fpZEA66dXdwq9nlaHZTu2bN8QpvqYSeKhMkL8W+uDWyc8941rwCdou83v7r4SQwmou2d2J38C3w4YMYM5KLz0jBebjxzgVBLz05dFULqp2DvsV4elMlG2Ot+A7CTXMx0RxJwkvBCu8mETEZqZF5DzotacgLeAdTdtdLB0neNQx9wymPtar2Q1oSOLunUH7i/eqB3EMKsK6CwA5pWFH4Gxk/ZRFhcxjIiZ7Ssl8VAjzpGFv3LhZVi1D8SojnFNoPpJx9vHmH7A5QplL0KYmB3nmfhGadY01htwrd8VjtTGw/HrrBf5saF456Pf0sflZlpWy5WL+60m0nogSJhpx1eeCeBKHRfxLawbpV9BOXcs7uK1Si1bBB8yWqSlLm8Pxatuq11Ns0MrQtpqCQKJJ7FPqA4bb+DebcUmmF9KLoeAwrRRwRBk4wN49gXNSV6x1bDPiU/VL7YCPY79GxeZ5GlNmTwCv9o5slsf872gYovpN8NGuCEmVw+48FB9ztQ10EJ1nb/mCwOztXo9TUY/LkVy0FPh2csBALMp9bi3560lfbQBJAWyjFcvDa87p6kbdCjBw4DkXyF4OqJBL5cOKHsr5PaiorvU8ZLNt5wrVEvR0v1sRH+IB0k8ORTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Q/4el3qU6melKXn+FBMr0VU29yXgTepkXTbzTbcN3jVEP8/YDHHVUhAo+x?=
 =?iso-8859-1?Q?OpJ5SsPH0rCw6CMMfOMBfk1JiIOQ4QoTDxj5nhzxoZte54xpHRbEqkN/Ik?=
 =?iso-8859-1?Q?PxT4KfJpHtPt713NV852a3Dn+wYYOIsYWL3shGmaSphoV0fPuyXgdRr2Z0?=
 =?iso-8859-1?Q?SuJQ01b0xx2ESzvG1B8BRlNH7dM7eoorlZ4zG5a/TFLfPYb5V7A32fjywi?=
 =?iso-8859-1?Q?Qq3bW5hGVGoQxGNt9Bcs+iDGP8dw+/KvzahRF3EW2aUY8RKJQaB5XhOgr6?=
 =?iso-8859-1?Q?9Z0IfWwzthIvifVaTaELi1dy0u37qatqjH74wzVvKYinIuAtVYH19appPZ?=
 =?iso-8859-1?Q?uIK+nHvDFJ/sdRsPp6aWP5HBoNtEjBytRV6waBjoLIUy961Oza2XR8ze9W?=
 =?iso-8859-1?Q?/wLosX8rwmjpE52z34AavdlENy9NyXKdxcdvOGRr6aNkhzcsm9ZT/wh8jR?=
 =?iso-8859-1?Q?Oa3+JiOinN7G+LK5N/aeP4G2yBdmBaV+SL3tFvGyDG+Te4PiNbJxnlsUKh?=
 =?iso-8859-1?Q?jevR8YAD3UAZGel6UavHmUp1fBuhVro//mOtCJcPa0evP94E7/KuOW1Mkz?=
 =?iso-8859-1?Q?8zjq9An72z2YN8UvfzUmpsz1xMPRx7rcaIVoGkac+/zLv/Gut1D4R0VKjo?=
 =?iso-8859-1?Q?iRWXBbKANTBGrKDjCei6MxfNkXMAtt1v5r84/UPL0y161qxZOh9rltlx8Z?=
 =?iso-8859-1?Q?/1nH517mhqfatWGfwyjUMn150qrIHPnCvcbXP8SDI6uF7cgA1sj6mXVSZS?=
 =?iso-8859-1?Q?T7/rjORi3S+2pHloXDEa+zPJEdpgeSX+rGpvNw8QXUM90dFzkv+z+EohMS?=
 =?iso-8859-1?Q?wxv4eMiWM628rbwzyTG0EYw9ZD6D2+nZgERaSrzHCB/w10pcz8UFkPJHlY?=
 =?iso-8859-1?Q?ZzPYE0+X80m7RUhD0YH7wIdK0IIhPFNjEwOX9+a2W+aQCF+MalgdbeCiTX?=
 =?iso-8859-1?Q?EnoNwTyNQE7gQNco9mzX8ndrxYiL0gPDhREHRhLPyfJcgdMNzSHgHDSilP?=
 =?iso-8859-1?Q?4B7IDWwLb/PABt/QzjDveQ7yEhm4euISd0KAZXFTAbGX4ZrtxAhlwIRrcC?=
 =?iso-8859-1?Q?mB/dRLGyX9jCYWku5X54xCPGpnpvyqU6EMZ6wW7ob290cqCL77oi9edJ3L?=
 =?iso-8859-1?Q?ND2GGiDC3l5rPkMPUBcUmOBGG04I9dvL8vK79nlASh+5mu6f2DxNlzeK4u?=
 =?iso-8859-1?Q?Ij6ENCxt/38u69yOkZbPbB9A+lZQOvj031L/TuuEwBIKFDOxXHzvGVNdQO?=
 =?iso-8859-1?Q?LOw37aqBQ7aVt4iuXkki1cohh18prYiuU1ZqdnXciU5Jf0q3Y64yntNzA4?=
 =?iso-8859-1?Q?Xy/MjMQGzqzQ+XxboLkT6g8bRBBiVswnSwhelS5zH/9IzX+/YC/HHHaBEX?=
 =?iso-8859-1?Q?LXyBJyShOwxjZ8Xxqie2UN7f9C2W2HsixayFgYjdrEKh/4AlbEuTym2lh6?=
 =?iso-8859-1?Q?cSbpRVV0k8GxYyQBSULov8vPvEIuCWD9niO6n4Fbu9fhvmo+CLqv5F4/4z?=
 =?iso-8859-1?Q?VJcejJD8cI8KHgBr1SiAp5Ezv4P5jKX68Rq0ss9POad4MMHTyOI9RHU+2p?=
 =?iso-8859-1?Q?m0WNt+K1ZcrOP5rE5zyHZJ7hfLlI48u96TX1Ed+65PnP95tScuyZObqdw8?=
 =?iso-8859-1?Q?NNipiZBOKTDHJDkU9/Y3bsyzjJ5tLB2rp0MvZJNvYl/tD/H/xuJHPrIxau?=
 =?iso-8859-1?Q?ygQOg3q6WXvh64j5mI3OPH6gwell4dt14NE9tutGV+pU+92FKiSm6Qwr2n?=
 =?iso-8859-1?Q?jg9kt1Wv6Vmeqk4+AB2AIJ9u95GIEueJVZxW8vbHbtXoBsDHtdzmRRBSxD?=
 =?iso-8859-1?Q?AfltkxJQaQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58995bf-30f3-46bf-38ab-08df39d0287a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:30.4364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/EDBk7VVQ0SU/O3GZItqdXom0SDDOV6YP5DlT9ZvwYn+TD327SqP2TBez+Dk0usfTinKU+QpoLp0ndZz5aI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-c201ff/1793727032-72EB12A1-868FCF69/0/0
X-purgate-type: clean
X-purgate-size: 7390
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
driver in XEN will read the STE from the guest memory space and capture
the Stage-1 configuration required to support nested translation.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 173 +++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 780f36bf2a..5e12d5c587 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -79,6 +79,21 @@
=20
 /* Helper Macros */
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_CFGI_0_SID, x)
+#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
+#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
+#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
+#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
+                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
+
+/* stage-1 translation configuration */
+struct arm_vsmmu_s1_trans_cfg {
+    paddr_t s1ctxptr;
+    uint8_t s1fmt;
+    uint8_t s1cdmax;
+    bool    bypassed;             /* translation is bypassed */
+    bool    aborted;              /* translation is aborted */
+};
=20
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
@@ -166,6 +181,163 @@ static void dump_smmu_command(uint64_t *command)
     gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+
+static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
+                              uint64_t *ste)
+{
+    paddr_t addr, strtab_base;
+    struct domain *d =3D smmu->d;
+    uint32_t log2size;
+    int strtab_size_shift;
+    int ret;
+
+    spin_lock(&smmu->strtab_cfg_lock);
+    log2size =3D MIN(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base=
_cfg),
+                SMMU_IDR1_SIDSIZE);
+    spin_unlock(&smmu->strtab_cfg_lock);
+
+    if ( sid >=3D (1U << log2size) )
+        return -EINVAL;
+
+    spin_lock(&smmu->strtab_cfg_lock);
+    if ( FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->strtab_base_cfg) =3D=3D
+         STRTAB_BASE_CFG_FMT_2LVL )
+    {
+        int idx, max_l2_ste, span;
+        paddr_t l1ptr, l2ptr;
+        uint64_t l1std;
+        uint8_t sid_split =3D FIELD_GET(STRTAB_BASE_CFG_SPLIT,
+                              smmu->strtab_base_cfg);
+
+        /*
+        * Reserved SPLIT values behave as 6 according to the architecture.
+        */
+        if ( sid_split !=3D 0x6 && sid_split !=3D 0x8 && sid_split !=3D 0x=
A )
+        {
+            sid_split =3D 0x6;
+        }
+
+        strtab_size_shift =3D MAX(5, (int)log2size - sid_split - 1 + 3);
+        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                        ~GENMASK_ULL(strtab_size_shift, 0);
+        spin_unlock(&smmu->strtab_cfg_lock);
+        idx =3D (sid >> sid_split) * STRTAB_L1_DESC_DWORDS;
+        l1ptr =3D (paddr_t)(strtab_base + idx * sizeof(l1std));
+
+        ret =3D access_guest_memory_by_gpa(d, l1ptr, &l1std,
+                                         sizeof(l1std), false);
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
+            return ret;
+        }
+
+        span =3D FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
+
+        /* Validate SPAN against the architecturally defined range and SPL=
IT. */
+        if ( !span || span > 0xB || span > sid_split + 1 )
+        {
+            /* L2Ptr is invalid; this descriptor matches no valid STEs. */
+            return -EINVAL;
+        }
+
+        max_l2_ste =3D (1U << (span - 1)) - 1;
+        l2ptr =3D FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
+                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
+        idx =3D sid & ((1 << sid_split) - 1);
+        if ( idx > max_l2_ste )
+        {
+            gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
+                     idx, max_l2_ste);
+            return -EINVAL;
+        }
+        addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    else
+    {
+        strtab_size_shift =3D log2size + 5;
+        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                      ~GENMASK_ULL(strtab_size_shift, 0);
+        spin_unlock(&smmu->strtab_cfg_lock);
+        addr =3D strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    ret =3D access_guest_memory_by_gpa(d, addr, ste, sizeof(*ste), false);
+    if ( ret )
+    {
+        gdprintk(XENLOG_ERR,
+                "Cannot fetch pte at address=3D0x%"PRIx64"\n", addr);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
+                                struct arm_vsmmu_s1_trans_cfg *cfg,
+                                uint64_t *ste)
+{
+    uint64_t val =3D ste[0];
+
+    if ( !(val & STRTAB_STE_0_V) )
+    {
+        cfg->aborted =3D true;
+        return 0;
+    }
+
+    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
+    {
+    case STRTAB_STE_0_CFG_BYPASS:
+        cfg->bypassed =3D true;
+        return 0;
+    case STRTAB_STE_0_CFG_ABORT:
+        cfg->aborted =3D true;
+        return 0;
+    case STRTAB_STE_0_CFG_S1_TRANS:
+        break;
+    case STRTAB_STE_0_CFG_S2_TRANS:
+        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
+        goto bad_ste;
+    default:
+        gdprintk(XENLOG_ERR, "Invalid STE config type\n");
+        goto bad_ste;
+    }
+
+    cfg->s1ctxptr =3D smmu_get_ste_s1ctxptr(val);
+    cfg->s1fmt =3D smmu_get_ste_s1fmt(val);
+    cfg->s1cdmax =3D smmu_get_ste_s1cdmax(val);
+    if ( cfg->s1cdmax !=3D 0 )
+    {
+        gdprintk(XENLOG_ERR,
+                 "vSMMUv3 does not support multiple context descriptors\n"=
);
+        goto bad_ste;
+    }
+
+    return 0;
+
+ bad_ste:
+    return -EINVAL;
+}
+
+static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmd=
ptr)
+{
+    int ret;
+    /* Only the first 8 bytes of the STE are currently used. */
+    uint64_t ste[1];
+    struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
+    uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+
+    ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
+    if ( ret )
+        return ret;
+
+    ret =3D arm_vsmmu_decode_ste(smmu, sid, &s1_cfg, ste);
+    if ( ret )
+        return (ret =3D=3D -EAGAIN ) ? 0 : ret;
+
+    return 0;
+}
+
 static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
 {
     struct arm_vsmmu_queue *q =3D &smmu->cmdq;
@@ -198,6 +370,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu=
)
         switch ( smmu_cmd_get_command(command[0]) )
         {
         case CMDQ_OP_CFGI_STE:
+            ret =3D arm_vsmmu_handle_cfgi_ste(smmu, command);
             break;
         case CMDQ_OP_PREFETCH_CFG:
         case CMDQ_OP_CFGI_CD:
--=20
2.43.0

