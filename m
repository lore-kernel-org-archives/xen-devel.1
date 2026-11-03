Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5036606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=nJoqYilK
Received: from list by lists.xenproject.org with outflank-mailman.1470420.1679246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILf-0006YI-CP; Tue, 03 Nov 2026 17:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470420.1679246; Tue, 03 Nov 2026 17:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILf-0006Vs-2o; Tue, 03 Nov 2026 17:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1470420;
 Tue, 03 Nov 2026 17:31:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILc-0005rU-39
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:31:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILb-003aA2-EA
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:59 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a52-bab6-0a2a0a5309dd-0a2a4503a210-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:59 +0100
Received: from [52.101.65.96]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a52-fae8-0a2a45030019-346541609021-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:59 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PA1PR03MB11410.eurprd03.prod.outlook.com (2603:10a6:102:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:57 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:57 +0000
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
 b=eYklx4exUy6HYB8T1h5xABpPFt+iCwMGvNOe9+kwmWLEEEO8dDn1nWTR50KOmtizhvqsNcABXk7zeLhOAvq5X15UvKtaRj0DcnKRsujmolHf9TBAbLeFzlEnEqlBzrgh3DiAcypjF1d1C/xX8vl2OByauJQeutU4M/9bS8aP61ctfdWGs6RaBh2uoKpkiyLVBUhbA52/QYQ9ZXirhEb2td9oSqiej7aig/1tmx4uarwwNa4VbSF393CrIC64+8EjFlASWmH+P05413n5PfEiM8/T/zAuYiVg3XsBcv2y88NsIDj2Oh3AAVOmCMElv4JfTK5l55YtnrWccSwSVq6wRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkEIodyuaVoGtFNd/VYbrgM84e/K/CdcVn4A7A7YZsc=;
 b=fsWryVoC/RgNT/YsCnPs7hE/HTTzEfZHAliYYgEpqS0U8RrAArzxFH5vgvYFZAVFl7P95m10+t9dwZ5LuQPMlDb427bJaZ0AiN89kUfmNNcQTej9l+tkGCSNdZkEIvEhiUMaUhsyHYBTHE58KcJrqMY43mRDeghlBUUbJ7i4pUVT96VlDD/lY7rg2RDN5S2wMHwoTowrPJBap5KAlpn6AUF7UJjXfD84aek7n+t7yrvo5x29reF2dc5iUu0/gzOda6WI8JdN5tVQZg1LU/v+0xCvSC4cgXcp5DIl9orbuf+kVv5LLOVugQPf3j7DrhEpkYluoNsh0LeG5/RGNu8Qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkEIodyuaVoGtFNd/VYbrgM84e/K/CdcVn4A7A7YZsc=;
 b=nJoqYilKRubyMXQxu8ic7WkiwpYqobnPoLTBtuJF+s1SThQef9+Wg/wFNPWdcWtdA4vQQ18ybSnMB9778EDojyCFJtGSLR5a6VDz4auBNWudZxNyYBNa5EPiUPzYqJr+5HMLRca9xoUAvpnOlESj/GpFyJRsS3/mvrvOYAorMsyCRyHoUVSJ9AXmJ+0uAD2xC4mUb1V6/P7V9YXJT1Y0w5Be19Ipr8pkoPA5zg6MP5iA5vOpuPpyEy0jl6G2ndVCBZoK9fEE0j7XqVbz+CI4RHC9lR6y6oKybCROGZYUNg8Lk3llQruvGr8Q+rEQ+Z6aCHM3Ott26v0UaGdLp1DUiQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 22/22] doc/arm: vIOMMU design document
Thread-Topic: [PATCH v5 22/22] doc/arm: vIOMMU design document
Thread-Index: AQHda7kVOQpBk50vJke3sL111cGeKw==
Date: Tue, 3 Nov 2026 17:30:57 +0000
Message-ID:
 <bbbd4955658ef9598b0940136149dd2ac9377d7a.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|PA1PR03MB11410:EE_
x-ms-office365-filtering-correlation-id: 1f43a9a5-e576-462b-9aee-08df39d03856
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|260925021311599003|260925022911599003|260925021911599003|261022075727099003|56012099006|11063799006|261009223027099003|261022105027099003|261022113327099003|261102123227099003|261102124527099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|10067099003|32116099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 zh+XvcbqJz3Q+8uYiMPgWAuaN4dksHroodoNmoXnWRSoMthB3wWnjpA4P5/5pDx8vOb5+VLDhSwN/GM5bP66tyijmRGQnfTH05bT6+8m1wa0c4k4HkGOnbvpLvZfh100nTlg5D458b8dhCh1jlLhe7nbZ5KWg96J92ttGynitSgg+JQTGyRTPBjGWfwVaUl2FIKJaQGughXti077lHNDuwt6tJgQWp4+OBKYCJ1d5LawJenHjXJzYjxMVW/BYaiPoyZgtFsGiDVQU/6Hu7YwJFaHbOQ2yL9cEYMhvfARS2WJn7NVpCiL18S2WTXwyaPIopFGEwngM+UNkV6ykyOCI3nRtZ3OH8hm0vqgotveTVZmm2TbNL8ftASnwzvMzIq7aYBKkgBOFdq36rjTMuEqAXdzf68Js1lDEIlf9LHE9uObLK9HgNBUgT6CxhlNfScIAYJxZIlhW6GUon+gfj6MKI1+XWeu0lR4E4yrBqHXMPoN4XUp5Zh4m2dDMyzdR/b1C4WVgGye03mHre6hhgV/qc+aTOr8lZQ6TPfQSHj7dSFdyr/bRV+QpzBGQrP4aTU4ejytC9a5sMfnSBSEV7e/9ne/L5sWKlqeBVzHTSZJHkSW86tn4C++4NvjQDokDe+IU9BwyBoBP34G+DvPt8fOxg8vL4ltWur+KOB3JESOFeo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(260925021311599003)(260925022911599003)(260925021911599003)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261022113327099003)(261102123227099003)(261102124527099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003)(32116099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tmmsENSuuKYpsDW09gaQvGqAOHDxO5OmfzA+bzd7wXGNqT6Mjqb2CiXc7M?=
 =?iso-8859-1?Q?qQXtGmRQXfvJwiTxwKvn8np8TsjiN9kqI77J6YowDb2VaMWVW1Rg32evi6?=
 =?iso-8859-1?Q?Z1xXj52oM2dRmHVt2aNJ4PSqbbZW16FLm6Xcdo/mXnAD9hkqwFigFOriwQ?=
 =?iso-8859-1?Q?OdyeCQnMyZCD7ZECGUMc7V8YZRwFUJbCzB+FBAqZuuUXwbxjUJHgLtVNR+?=
 =?iso-8859-1?Q?/B+28FboO6HprcxkN3Jc44QcLvOH321l3m+r3BVNBrBTn26+7o2dFvrCYq?=
 =?iso-8859-1?Q?oDMYKTZ4Xbco24sWFUZtWDh7Pt8zEVyzqVIlnUqfN25TscAMgMzv90de69?=
 =?iso-8859-1?Q?hlIswSbULNRW8Dj6uxqEx+dOol9Lw9ijMFZVqczZd/3vOqLPDik9BroiLW?=
 =?iso-8859-1?Q?2SxIhsFbO429davlXyCcVQiJIBy1iWk9J1gTak+BdWH/SFj/mPxWJ/GZ/I?=
 =?iso-8859-1?Q?Z9DH6YVd6r14riKneEqCZRFcB0WJpiPI3t+nc+iZscj+0eqJNo+ck+i/e/?=
 =?iso-8859-1?Q?u2FupcJZCLibmjTbCy+ww75SwFicyubvQSO6q+CXYOScDapv5JfbzTy380?=
 =?iso-8859-1?Q?r7wAbug1hNFb9ZF4h8KTuxPqIuU4ZQPafT6I1iU/F9jMgKY/CH4upY2jWf?=
 =?iso-8859-1?Q?CpXfZ79CtPvOukdI1k6BLfbxLFl9wg2WOrAapATnwvJdOc1NwYkWaXNwU3?=
 =?iso-8859-1?Q?jDK/+raZ7n+fl4H7t56KOZMRIZy4u5kUPFsskMHSyjfbq006qHjTdjOOzG?=
 =?iso-8859-1?Q?LRlNBNx9z4I5SlSEbKAcMmc/FclKVl1HAOfRcCO0bXBvKQdtPraBztsJSM?=
 =?iso-8859-1?Q?ntS8b53y5t9PcSWBQMe7RKy/hoOjO9OtP4as/9x6l+78QH252WGVet409w?=
 =?iso-8859-1?Q?fXdzcyO5deAcD8+TwjbageGBrGYymR1ZU2sgw0dZXRPAQTfAniyn5rcZmm?=
 =?iso-8859-1?Q?AN9d6o/6VT9diNfO+L1QHAPfLg0DgxFC6OQgPfTOXthY3uNykHc3RSAsWC?=
 =?iso-8859-1?Q?3ueDO6QyK8arwWW2cHepDbJmQt8yCr4vbffRk5PusKwNVm+/pe5It01MDv?=
 =?iso-8859-1?Q?aA/Ko/7TUbZan8gNg/+mDSRUSeZMJO0HZT+Kxb2aLigJ7l/LxFyjhbIF28?=
 =?iso-8859-1?Q?MFOZ2TS/YmV+8rFNNxmkBzRUqTMlRtHqoSxBu7rQbZaEmQMmXThjR4satn?=
 =?iso-8859-1?Q?C/w4Nf6MJ7odBdunW5zvs/Q7vxhWq3BJBlZTsLJMxg//faboO1teBchVAZ?=
 =?iso-8859-1?Q?aXbju2TnEZALaINxd5unVBIdcA9xiASq4VUprM35MFB3gEp02CW10Qtza7?=
 =?iso-8859-1?Q?ewffhDZcShvDnF1ewSDN6xTZk5/KRF1cyW+NxmnfJXLMIoxf5dXmC981iv?=
 =?iso-8859-1?Q?FtiGuEOcn0tokDYYsVY0TYZF7AAD6RhpTZ/FLahVD6JDUnE4HWzwaAqq4q?=
 =?iso-8859-1?Q?CC1UH3zuIvCU9p6eh3JL5xhThPm+E2+evIW/ivAH3cPch4XSIBQ5uH/sJI?=
 =?iso-8859-1?Q?xhXbzS6bn0nx+Qn0hHzixN0IHK8o0zdHbO8pzLvJx35CZOBb6fDBoBGqb5?=
 =?iso-8859-1?Q?I2IOhh9kFTjjxh8pVsQBkHiV7XCZvN2BzmAByLG7XhZTp6tZpuCnSsPviQ?=
 =?iso-8859-1?Q?hS+zCJYnQ/hGE/gBsQk13FdjHgemkDRsmrQS9zWAQpFfZC6NJ0orqEdxWp?=
 =?iso-8859-1?Q?uIh6xDLtyVnfNUdUZSNOl4774iE5H6wq29pPMmCChsZvHGj7YpurENT8Lb?=
 =?iso-8859-1?Q?rkDhTnPSv5qfh4spBGwoDGhdEWo4vB8NqcDv13J6MMpKIQAYZTRaHretFj?=
 =?iso-8859-1?Q?6lgAGvcUUg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f43a9a5-e576-462b-9aee-08df39d03856
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:57.0568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0el7pwB8yaWjcfieuKCa0nKYvabKSDDcjW+waUqt0w3CnzPGAQ6fNWL7V4gPvph4pgtx7xDtiW5TTB3+roqEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11410
X-purgate-ID: tlsNG-33051d/1793727059-76AF94E9-85FBB6E9/0/0
X-purgate-type: clean
X-purgate-size: 22502
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This document outlines the design of the emulated IOMMU,
including supported features, security considerations
and future improvements.

Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 docs/designs/arm-viommu.rst | 530 ++++++++++++++++++++++++++++++++++++
 1 file changed, 530 insertions(+)
 create mode 100644 docs/designs/arm-viommu.rst

diff --git a/docs/designs/arm-viommu.rst b/docs/designs/arm-viommu.rst
new file mode 100644
index 0000000000..de7bbf6998
--- /dev/null
+++ b/docs/designs/arm-viommu.rst
@@ -0,0 +1,530 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+:Author:     Milan Djokic <milan_djokic@epam.com>
+:Date:       2026-02-13
+:Status:     Draft
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The SMMUv3 supports two stages of translation. Each stage of translation=20
+can be
+independently enabled. An incoming address is logically translated from=20
+VA to
+IPA in stage 1, then the IPA is input to stage 2 which translates the IPA =
to
+the output PA. Stage 1 translation support is required to provide=20
+isolation between different
+devices within OS. XEN already supports Stage 2 translation but there is n=
o
+support for Stage 1 translation.
+This design proposal outlines the introduction of Stage-1 SMMUv3 support=20
+in Xen for ARM guests.
+
+Motivation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+ARM systems utilizing SMMUv3 require stage-1 address translation to=20
+ensure secure DMA and
+guest managed I/O memory mappings.
+With stage-1 enabled, guest manages IOVA to IPA mappings through its own=20
+IOMMU driver.
+
+This feature enables:
+
+- Stage-1 translation for the guest domain
+- Device passthrough with per-device I/O address space
+
+Design Overview
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+These changes provide emulated SMMUv3 support:
+
+- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
+  in SMMUv3 driver.
+- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
+  handling.
+- **Register/Command Emulation**: SMMUv3 register emulation and command
+  queue handling.
+- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
+  device trees for dom0 and dom0less scenarios.
+- **Build Configuration**: Introduces a Kconfig arguments
+  (CONFIG_ARM_VIRTUAL_IOMMU, CONFIG_VIRTUAL_ARM_SMMU_V3) for build-time
+  enablement.
+
+Depending on the domain type, the emulated IOMMU model is the following:
+
+- For the hardware domain, the host layout is re-used. The number of expos=
ed
+  IOMMUs to hardware domain is equal to number of physical IOMMUs
+  present (1-1 mapping).
+- For non-hardware domain, a single vIOMMU device is exposed to the guest =
and
+  mapped to one or more physical IOMMUs through a Xen-managed translation =
layer
+
+The vIOMMU feature provides a generic framework together with a backend
+implementation specific to the target IOMMU type. The backend is responsib=
le
+for implementing the hardware-specific data structures and command handlin=
g
+logic (currently only SMMUv3 is supported).
+
+This modular design allows the stage-1 support to be reused
+for other IOMMU architectures in the future.
+
+With stage-1 support, Xen supports three SMMUv3 translation models:
+
+1. Stage-2-only: Used when the SMMU hardware does not support stage-1
+   translation or when nested translation is disabled.
+2. Stage-1-only: Used when the SMMU hardware supports stage-1 but not stag=
e-2
+   translation. This is a special mode restricted to trusted, direct-mappe=
d
+   guests.
+3. Nested: The default mode when the SMMU hardware supports both stage-1 a=
nd
+   stage-2 translation and nesting is enabled.
+
+vIOMMU architecture
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Responsibilities:
+
+Guest:
+ - Configures stage-1 via vIOMMU commands.
+ - Handles stage-1 faults received from Xen.
+
+Xen:
+ - Emulates the IOMMU interface (registers, commands, events).
+ - Provides vSID->pSID mappings.
+ - Programs stage-1/stage-2 configuration in the physical IOMMU.
+ - Propagate stage-1 faults to guest.
+
+The stage-1 context is shared between streams assigned to the same device.
+This follows the Linux SMMUv3 driver model, where the IOMMU domain is asso=
ciated
+with the master/device, while the individual SIDs are represented by separ=
ate
+STEs pointing to the same translation context. This is considered sufficie=
nt for
+the current SMMUv3 driver model, although the SMMUv3 architecture does not
+forbid having separate translation contexts for different SIDs.
+
+vIOMMU commands and faults are transmitted between guest and Xen via
+command and event queues (one command/event queue created per guest).
+
+vIOMMU command Flow:
+
+::
+
+    Guest:
+        smmu_cmd(vSID, IOVA -> IPA)
+
+    Xen:
+        trap MMIO read/write
+        translate vSID->pSID
+        store stage-1 state
+        program pIOMMU for (pSID, IPA -> PA)
+
+All hardware programming of the physical IOMMU is performed exclusively by=
 Xen.
+
+vIOMMU Stage-1 fault handling flow:
+
+::
+
+    Xen:
+        receives stage-1 fault
+        triggers vIOMMU callback
+        injects virtual fault
+
+    Guest:
+        receives and handles fault
+
+Register access
+---------------
+
+Guest accesses to SMMUV3 registers are trapped via MMIO regions. vIOMMU em=
ulates
+a subset of SMMUv3 registers relevant to currently supported features.
+Unsupported registers are handled as RAZ (Read-As-Zero) and WI (Write-Igno=
red)
+for the register read and write operations, respectively.
+
+vSMMUv3 is a partially emulated resource for the guest domain. Some
+feature register bits (SMMU_IDR) are reflecting what the underlying HW act=
ually
+support while the rest is preset in the emulation layer to limit guest fro=
m
+using features which are not supported by the emulation. Also, implementer
+identification register is fully emulated, providing generic ARM implement=
er
+ID values, to avoid activating errata/quirk paths in the guest SMMUv3 driv=
er.
+
+Supported SMMUv3 Commands
+-------------------------
+
+The vIOMMU implementation currently supports a subset of the SMMUv3
+architectural command set required for stage-1 translation management.
+
+Commands are submitted by the guest through the virtual Command Queue
+(CMDQ) and consumed by Xen, which translates them into operations on the
+physical SMMUv3 hardware.
+
+Some commands are fully handled by the emulation layer, while others are
+currently treated as architectural no-ops because the required behavior
+is either implicitly guaranteed by Xen or not yet modeled explicitly.
+
+Emulation handled commands:
+
+- CMD_CFGI_STE
+- CMD_TLBI_NH_ASID
+- CMD_TLBI_NSNH_ALL
+- CMD_TLBI_NH_VA
+
+No-op/Implicitly handled commands:
+
+- CMD_SYNC
+- CMD_PREFETCH_CFG
+- CMD_CFGI_CD
+- CMD_CFGI_CD_ALL
+- CMD_CFGI_ALL
+
+Command Handling Model
+----------------------
+
+The guest submits commands through the virtual CMDQ interface.
+
+Xen:
+
+- Validates commands
+- Translates virtual identifiers (vSID->pSID) where required
+- Programs the physical SMMU
+- Performs synchronization
+
+The physical SMMU executes the resulting invalidation or configuration
+operations.
+
+Unsupported Commands
+--------------------
+
+Commands associated with currently unsupported architectural features
+are not implemented.
+
+This includes commands related to:
+
+- PRI
+- ATS
+- Address/Range TLB invalidation (currently, all TLBI commands perform com=
plete
+  domain TLB invalidation)
+- Advanced stall/retry semantics
+- CD runtime update/sync
+
+vSID Mapping Layer
+------------------
+
+Each non-hardware domain-visible Stream ID (vSID) is mapped by Xen to a ph=
ysical
+Stream ID (pSID). The mapping is maintained per-domain. The allocation pol=
icy
+guarantees vSID uniqueness within a domain while allowing reuse of pSIDs f=
or
+different pIOMMUs.
+
+* Platform devices receive individually allocated vSIDs.
+* PCI devices receive a contiguous vSID range derived from RID space.
+
+
+Supported Device Model
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Currently, the vIOMMU framework supports only devices described via the
+Device Tree (DT) model. This includes platform devices and basic PCI
+devices support instantiated through the vPCI DT node. ACPI-described
+devices are not supported.
+
+Guest assigned platform devices are mapped via `iommus` property:
+
+::
+
+    <&pIOMMU pSID> -> <&vIOMMU vSID>
+
+PCI devices use RID-based mapping via the root complex `iommu-map`:
+
+::
+
+    <RID-base &viommu vSID-base length>
+
+PCI Topology Assumptions and Constraints:
+
+- RID space must be contiguous
+- Pre-defined continuous pSID space (0-0x1000)
+- No runtime PCI reconfiguration
+- Single root complex assumed
+- Mapping is fixed at guest DT construction
+
+Constraints for PCI devices will be addressed as part of the future work o=
n
+this feature.
+
+Security Considerations
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Stage-1 translation provides isolation between guest devices by
+enforcing a per-device I/O address space, preventing unauthorized DMA.
+With the introduction of emulated IOMMU, additional protection
+mechanisms are required to minimize security risks.
+
+1. Observation:
+---------------
+Support for Stage-1 translation in SMMUv3 introduces new data structures=20
+(`s1_cfg` alongside `s2_cfg`)
+and logic to write both Stage-1 and Stage-2 entries in the Stream Table=20
+Entry (STE), including an `abort`
+field to handle partial configuration states.
+
+**Risk:**
+Without proper handling, a partially applied configuration
+might leave guest DMA mappings in an inconsistent state, potentially
+enabling unauthorized access or causing cross-domain interference.
+
+**Mitigation:** *(Handled by design)*
+This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
+STE and manages the `abort` field - only considering
+configuration if fully attached. This ensures  incomplete or invalid
+device configurations are safely ignored by the hypervisor.
+
+2. Observation:
+---------------
+Guests can now invalidate Stage-1 caches; invalidation needs forwarding
+to SMMUv3 hardware to maintain coherence.
+
+**Risk:**
+Failing to propagate cache invalidation could allow stale mappings,
+enabling access to old mappings and possibly
+data leakage or misrouting between devices assigned to the same guest.
+
+**Mitigation:**
+The guest must issue appropriate invalidation commands whenever
+its stage-1 I/O mappings are modified to ensure that translation caches
+remain coherent.
+
+3. Observation:
+---------------
+Introducing optional per-guest enabled features (`viommu` argument in xl=20
+guest config) means some guests
+may opt-out.
+
+**Risk:**
+Guests without vIOMMU enabled (stage-2 only) could potentially dominate
+access to the physical command and event queues, since they bypass the
+emulation layer and processing is faster comparing to vIOMMU-enabled guest=
s.
+
+**Mitigation:**
+Audit the impact of emulation overhead effect on IOMMU processing fairness
+in a multi-guest environment.
+Consider enabling/disabling stage-1 on a system level, instead of per-doma=
in.
+
+4. Observation:
+---------------
+Guests have the ability to issue Stage-1 IOMMU commands like cache=20
+invalidation, stream table entries
+configuration, etc. An adversarial guest may issue a high volume of=20
+commands in rapid succession.
+
+**Risk:**
+Excessive commands requests can cause high hypervisor CPU consumption=20
+and disrupt scheduling,
+leading to degraded system responsiveness and potential=20
+denial-of-service scenarios.
+
+**Mitigation:**
+
+- Implement vIOMMU commands execution restart and continuation support:
+
+  - Introduce processing budget with only a limited amount of commands
+    handled per invocation.
+  - If additional commands remain pending after the budget is exhausted,
+    defer further processing and resume it asynchronously, e.g. via a
+    per-domain tasklet.
+
+- Batch multiple commands of same type to reduce emulation overhead:
+
+  - Inspect the command queue and group commands that can be processed
+    together (e.g. multiple successive invalidation requests or STE
+    updates for the same SID).
+  - Execute the entire batch in one go, reducing repeated accesses to
+    guest memory and emulation overhead per command.
+  - This reduces CPU time spent in the vIOMMU command processing loop.
+    The optimization is applicable only when consecutive commands of the
+    same type operate on the same SID/context.
+
+5. Observation:
+---------------
+Some guest commands issued towards vIOMMU are propagated to pIOMMU=20
+command queue (e.g. TLB invalidate).
+
+**Risk:**
+Excessive commands requests from abusive guest can cause flooding of=20
+physical IOMMU command queue,
+leading to degraded pIOMMU responsiveness on commands issued from other=20
+guests.
+
+**Mitigation:**
+
+- Batch commands that are propagated to the pIOMMU command queue and
+  implement batch execution pause/continuation.
+  Rely on the same mechanisms as in the previous observation
+  (command continuation and batching of pIOMMU-related commands of the sam=
e
+  type and context).
+- If possible, implement domain penalization by adding a per-domain budget
+  for vIOMMU/pIOMMU usage:
+
+  - Apply per-domain dynamic budgeting of allowed IOMMU commands to
+    execute per invocation, reducing the budget for guests with
+    excessive command requests over a longer period of time
+  - Combine with command continuation mechanism
+
+6. Observation:
+---------------
+The vIOMMU feature includes an event queue used to forward IOMMU events
+to the guest (e.g. translation faults, invalid Stream IDs, permission erro=
rs).
+A malicious guest may misconfigure its IOMMU state or intentionally trigge=
r
+faults at a high rate.
+
+**Risk:**
+Occurrence of IOMMU events with high frequency can cause Xen to flood the
+event queue and disrupt scheduling with
+high hypervisor CPU load for events handling.
+
+**Mitigation:**
+
+- Implement fail-safe state by disabling events forwarding when faults=20
+  are occurred with high frequency and
+  not processed by guest:
+
+  - Introduce a per-domain pending event counter.
+  - Stop forwarding events to the guest once the number of unprocessed
+    events reaches a predefined threshold.
+
+- Consider disabling the emulated event queue for untrusted guests.
+- Note that this risk is more general and may also apply to stage-2-only
+  guests. This section addresses mitigations in the emulated IOMMU layer
+  only. Mitigation of physical event queue flooding should also be conside=
red
+  in the target pIOMMU driver.
+
+7. Observation:
+---------------
+vIOMMU `CFGI_STE` commands can trigger serialized STE programming on the p=
IOMMU
+while `xen_domain->lock`, `devices_lock` and `cmd_queue_lock` are held, wi=
th
+local interrupts disabled. STE programming may issue multiple polling CMD_=
SYNC
+operations, each with a one-second timeout.
+
+**Risk:**
+An abusive guest can issue CFGI_STE commands that cause multiple CMD_SYNC
+operations to reach their polling timeout. This can keep a pCPU with inter=
rupts
+disabled for a significant period of time, delaying interrupt handling and
+potentially degrading the responsiveness of Xen and other domains running =
on
+the same pCPU.
+
+**Mitigation:**
+
+- Implement pinning or otherwise maintaining the lifetime of the required
+  objects before releasing the relevant locks, allowing the
+  serialized STE programming to be performed without holding locks and wit=
h
+  local interrupts enabled.
+- Consider redesigning the SMMUv3 command processing and locking model in
+  future improvements to avoid performing potentially long-running pIOMMU
+  operations while holding locks and with local interrupts disabled.
+
+8. Observation:
+---------------
+The vIOMMU feature supports stage-1-only translation for SMMU hardware
+that does not support stage-2 translation.
+
+**Risk:**
+When stage-1-only mode is enabled for an untrusted guest, there is no
+stage-2 translation to restrict device DMA accesses to the memory assigned
+to that guest. Consequently, a malicious guest could configure stage-1
+mappings to access arbitrary physical memory, potentially compromising
+isolation and accessing memory or configuration belonging to other domains=
.
+
+**Mitigation:**
+
+- Xen allows stage-1-only mode exclusively for direct-mapped domains.
+- The integrator must ensure that only trusted guests are configured as
+  direct-mapped domains with IOMMU access enabled.
+
+Performance Impact
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+With iommu stage-1 and nested translation inclusion, performance=20
+overhead is introduced comparing to existing,
+stage-2 only usage in Xen. Once mappings are established, translations=20
+should not introduce significant overhead.
+Emulated paths may introduce moderate overhead, primarily affecting=20
+device initialization and event/command handling.
+Testing is performed on Renesas R-Car platform.
+Performance is mostly impacted by emulated vIOMMU operations, results=20
+shown in the following table.
+
++-------------------------------+---------------------------------+
+| vIOMMU Operation              | Execution time in guest         |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| Reg read                      | median: 645ns, worst-case: 2us  |
++-------------------------------+---------------------------------+
+| Reg write                     | median: 630ns, worst-case: 1us  |
++-------------------------------+---------------------------------+
+| Invalidate TLB                | median: 2us, worst-case: 10us   |
++-------------------------------+---------------------------------+
+| Invalidate STE                | median: 5us worst_case: 100us   |
++-------------------------------+---------------------------------+
+
+With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
+and configure stage-1 mappings for the devices
+attached to it.
+Following table shows initialization stages which impact stage-1 enabled=20
+guest boot time and compares it with
+stage-1 disabled guest.
+
+NOTE: Device probe execution time varies depending on device complexity.
+A USB host controller was selected as the test device in this case.
+
++---------------------+-----------------------+------------------------+
+| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| IOMMU Init          | ~10ms                 | /                      |
++---------------------+-----------------------+------------------------+
+| Dev Attach / Mapping| ~100ms                | ~90ms                  |
++---------------------+-----------------------+------------------------+
+
+For devices configured with dynamic DMA mappings, DMA allocate/map/unmap=20
+operations performance is
+also impacted on stage-1 enabled guests.
+Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio=20
+write/read and TLB invalidations.
+
++---------------+---------------------------+--------------------------+
+| DMA Op        | Stage-1 Enabled Guest     | Stage-1 Disabled Guest   |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+| dma_alloc     | median: 20us, worst: 5ms  | median: 8us, worst: 60us |
++---------------+---------------------------+--------------------------+
+| dma_free      | median: 500us, worst: 10ms| median: 6us, worst: 30us |
++---------------+---------------------------+--------------------------+
+| dma_map       | median: 12us, worst: 60us | median: 3us, worst: 20us |
++---------------+---------------------------+--------------------------+
+| dma_unmap     | median: 400us, worst: 5ms | median: 5us, worst: 20us |
++---------------+---------------------------+--------------------------+
+
+Testing
+=3D=3D=3D=3D=3D=3D=3D
+
+- QEMU-based ARM system tests for Stage-1 translation.
+- Actual hardware validation to ensure compatibility with real SMMUv3=20
+  implementations.
+- Unit/Functional tests validating correct translations (not implemented).
+
+Migration and Compatibility
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+This optional feature defaults to disabled (CONFIG_ARM_VIRTUAL_IOMMU=3Dn,
+CONFIG_VIRTUAL_ARM_SMMU_V3=3Dn).
+
+Future improvements
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+- Implement the proposed mitigations to address security risks that are=20
+  not covered by the current design
+  (events batching, commands execution continuation)
+- PCI support
+- Support for other IOMMU HW (Renesas, RISC-V, etc.)
+
+References
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+- Original feature implemented by Rahul Singh:
+
+https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.=
rahul.singh@arm.com/=20
+
+- SMMUv3 architecture documentation
+- Existing vIOMMU code patterns (KVM, QEMU)
\ No newline at end of file
--=20
2.43.0

