Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C4606A329
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=r6Htc9az
Received: from list by lists.xenproject.org with outflank-mailman.1470393.1679207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILV-0004SU-Rz; Tue, 03 Nov 2026 17:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470393.1679207; Tue, 03 Nov 2026 17:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOILV-0004R0-Ep; Tue, 03 Nov 2026 17:30:53 +0000
Received: by outflank-mailman (input) for mailman id 1470393;
 Tue, 03 Nov 2026 17:30:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOILU-0004Kk-Lb
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOILU-0082xo-1w
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:52 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a28-e002-0a2a0a5209dd-0a2a4501986e-42
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:52 +0100
Received: from [40.107.159.108]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a4b-5984-0a2a45010019-286b9f6ca2a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:51 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:50 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:50 +0000
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
 b=SXJe94yEhT+FQ7Mx/GEmy5YfQsRvWCAOc6KmTX/qXtoNHDv7jr2NCJehiQJr051lSqqEHG95K+iX7YXwPRaUVK9ounbY9wU1kRe2e2eNR8XqgTgXrAXECXUJixaodi52ttbcjqr49bCNdvyMTpfBjj/O6FS+iEtsyCBm1yzTx/ghNmBv0uY4HJGwe+mmgEAHVVOgIjhnC99JEpiOMFkTBLZTWWTOeG2FdZt5gvXUmSc3GYxpMORQ/waDNp65SXd3YhWMWGjNXWmRNViGycK+57L4CCU2ssSOeE1YFXPW464nv1mNWZYau6u7BeRjIverYJ8hALTTaFf45eFbHrjFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KCpdXRKAXdQEdm2NQv0CErWiAD2OMKxubJ598FQNOM=;
 b=DJWjaCD8reyct6VsBzzihmqxYJ4hDeu5ME3ho2505WdJcNedt1yOi89HKZUdU9n6UKg6TYL6b6oOcaiN5GVi+z9mvvUhxN/wjlMfaRmc9Twv+yKgF1ADKjdEPsPMU7FPovEha0u7mN7dWNVhoXOh5vuRGTcPdiGYyZv098021afFKHdiUD/MwqKcbW/nF3a+rBaiI41AneemVpNQxw8OvKOI0KNypB+Vc64ex0RTS/VWYFYhh89+BDO8xJf01vhfvEO3J4Gnpo9IM54RnDS387UlQPy/tMZM8HurL2YvloY2eDaahOmWNUTpDU6qJsgcP6dEJK3pA7LpNRq6YcMSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KCpdXRKAXdQEdm2NQv0CErWiAD2OMKxubJ598FQNOM=;
 b=r6Htc9azGMoLF5ZcARS958YkzZt+XUV6WeD+vZRe+g4bpkGE7HNIJ71584dxLaXU6pGOqwfrA6YcTNLcJWDbErqH10lszWHUt4Oxti4rbjNY9tn8chRHsxfneZ6ZFFDS2HuhnXzQraQZH+f9dz+rRr+X+O+Atj0G0jDwSFe+o82E9wmB6GW4eIGKk59mfH+VWWhMtq0X3xWzfSx9hjsMLQ5GN8Sa01BSf2sQVcx2Rmb2J6Rau67g8RXMh1Vsx2EARglyjvi0udQr3y9rlq7mKke9BEl6/ZwUZNhoDyb5eAu5QS7xS7kj9d6s1IjC7hhQsjywg3iSRkdDAgaFWO3qNw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 17/22] xen/arm: vsmmuv3: Add support to send stage-1 event
 to guest
Thread-Topic: [PATCH v5 17/22] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Index: AQHda7kRgq+8QDTpUk6bKfQWFvQtuw==
Date: Tue, 3 Nov 2026 17:30:50 +0000
Message-ID:
 <d2bef93f0883984523de1d7811b764e65a78c7de.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 23e946be-d757-47d7-b54b-08df39d0343b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 W1rjYJSw6dDAE7JozkK6h3v0jhcoPIs51EtIXOCQRRBWs51IvsAt18NZ3uXiAQf7mbXgfubnOtp0/L/Lm9wYyMjmvOXP5NAcqWwOd0cjqmQHYddNBvPdrvJtZnqAuG1nEc3q7bvEf2NZgFqHHwvW6mpDVqZI9cz+tRZl8/Ki4iOegRoOc8uQA0LwgqzGiiSgPUrIN2azNiP6IvLvQcpp+q9RA29kpu3Rw8FPUFdQAAPbhz71NrXr03poZNYd8TnoFDqJ2Vi0112ER2E/OgHqN1xYH7FLlctx92x49XChf1Qa2EtAnKgKYH00nwJ/km36NgirOSswcloOqS2d73klVQZRVjzWxRXMcYPFKOfWKcOtvwZ79NYa8bPLkxOdFxZqcsz11Wf0NUIXQIHJBVXpHLM5sRd2isx5b5MJpeCbR128IvbIicyTTPdBIm374A0nw9mQ4KMsEeQ7HFReQBelwjLsyjkcGU15aCOEcENzfLZbnaDXWzVKRqIUUdBeJnnZ/wkSwNHVNRMOqTgeHG6YgT+hljc+Sp37vOqXgm7m0qcyFbSPHptYa0V/66jt79qCLn54b4DK15jg7DO2qNNUTIilITo+0/nMCiFt1hQcJNS5FoLgEQI+rnNH+fyvBZwetm/rUg+lN9VjJv4sXHueeP0By5B0EKRPt+SmN63MpFL4jtsBh2WU3i4OKifHNu8ffhAMtFdCMTx7bhSg8VHtnmZN+dmc953zTCRQJa+Ie1w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?96DBro5Xf4Jo0qyOQDN7/U9Bj1UanOp27iCgV2A2eXo0rXifMghF5/rEW3?=
 =?iso-8859-1?Q?vU928IFiQfcq2RRt9Aa10kOA3aZgZL/RwFMn2GQtLehZqdLMeZCUM3IEC4?=
 =?iso-8859-1?Q?1olredj/Fpvo1fuVeif7CtOSDiE93zB78N4CE16cHJosSL2dWUt3iiSk/q?=
 =?iso-8859-1?Q?vz3Mvj253OaUw6ZMGcSU75Ak9wGEAP9dKoGwJCPZgfWBdziTvaO4ZtjDzO?=
 =?iso-8859-1?Q?rJCKspd6ydUjsWi+77A6GcfH/x8sxF6Fo5+M4ivphfKzcLYjsjYR9ltZ0B?=
 =?iso-8859-1?Q?rozdP+ybPBRjC55/Aqsb+3y1Osj/Lv/XCV7lfHvpXEcN/GGXKAkKMT8Xwh?=
 =?iso-8859-1?Q?grAIhhzJbBPUHSHw3SHCMza+sxR42OfvqxKBcSO6M+VprvO1fITd9hBZ2b?=
 =?iso-8859-1?Q?MTcY2tCyJzFjcsXxfQfL3R6KNITfyIY2KrBaI5kOzddcg9wNkYsoNs5VVc?=
 =?iso-8859-1?Q?JNfI774ZPg+PogddaJLFywSax0WH5yg6PPquomprPxu/6XJouUijYK1Tb8?=
 =?iso-8859-1?Q?+JA+dRC8vWtv96wswnL03k1JhISlqpkgxQ8xiADzl4lxl0g8JEB7p/jlkO?=
 =?iso-8859-1?Q?Fv4qW3fu7rfJHum57gr1Ib0Wli7s4ZgL+nv6PTZYt3PfK0p7TvMces6hFE?=
 =?iso-8859-1?Q?g4ghIkfU7zLmn3tWqBvYnI1KZsMNrLunqDCZkzNDJiIp+li9Vv3PeMaKOC?=
 =?iso-8859-1?Q?Jgp3ghd+bEwrVKi/tMx0Si3svP07X9uPKQNt3E33B/Qw3R6OFtwBqr6s6E?=
 =?iso-8859-1?Q?7eq0jqxG5zzVFSOs5g5qvzogCivDzxPsH3TxsHDvQjFa/pHieC6Rmt0u82?=
 =?iso-8859-1?Q?OOxnp/bOhmGTxTVsxQcILyTt8efctoMSxfbdPViNlmc1nFeI0ibpqKIoIM?=
 =?iso-8859-1?Q?nlzygoEHSpdvH4sd0KmgJqfPCv/xAmtiKaJpmAel2PDHcgsnLlw4NqKM0t?=
 =?iso-8859-1?Q?e1cep2/YcUqC3Fu96simT7OchAw6gBGJRSoqGJ2aptfAZbdgmtfJYf8AVr?=
 =?iso-8859-1?Q?C5Jtan5Sr5/YnpP+3k9Nl6krxa26Rhxr7FFuUpipKSoLF4NdW4JlgKnhvR?=
 =?iso-8859-1?Q?DWaeE6+Fc/Kz3yBEcaMjAXhQav+RYJtyZoXAcqvpT9mMvEtp7PBow5dk8v?=
 =?iso-8859-1?Q?IL5YcLG32mj6PDM4pufnGyPJF2fg4k+zyb22x6NYA/1F/QpcFETd/err0F?=
 =?iso-8859-1?Q?kBgbJfE3tKbwn/raOXafiW2qsLP61xYVA3+f9cOELwy/Z29f2tOWviIurV?=
 =?iso-8859-1?Q?l9TAyia+6YthI5JqeEc/uOM/e3D1BEhnhZn4p4AcU0E8RxPO8S16D7MTz+?=
 =?iso-8859-1?Q?w5KdMtzNX3aUqAxveCqazW7GvCKdJORVn4kyxbmfxr8qhv4GoruifXBb0p?=
 =?iso-8859-1?Q?JESJO9ZREnVzKVeUvts4PPF3hD8dDm3N4gGDKALXRkXskI160flK0Kwtpv?=
 =?iso-8859-1?Q?6qrHn8uPUZAn8Khe47D0ela5Q5Bi36wEePPvyaW+DndwxWEmnfDTSe3xWt?=
 =?iso-8859-1?Q?OWkmQVGLOGFZkTZPKprd4qU8+EkvKkG+rUiNIwqrI6baANS7u/6QnuWOJ5?=
 =?iso-8859-1?Q?o2V6LVeWkx6h/lER0duVoAOs9bikLiP5cNfC8+KoHMCu6E73Y8c5MnSCmY?=
 =?iso-8859-1?Q?tTqGrVlURsH7M3sVEU/0QprJ9WPdM/gyQm6bJHU6ZTuKq/Ty2gQvXE/Gkc?=
 =?iso-8859-1?Q?VDPE841vyJ+UKTzztyUk6qToYdz6Q/YqjS5gqq2SBIuEjreGJb885uM+Bx?=
 =?iso-8859-1?Q?LxYfkGwJ20OSaYgRif0i2tp1H7nOdfT5djZcfmVSVTzGZ9UySMWfDBVhVO?=
 =?iso-8859-1?Q?xL65xbSX1A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e946be-d757-47d7-b54b-08df39d0343b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:50.1661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Giti2ZelYXpdjvig2V5CfF87/k3phDvmcsz9BthPSXGB3CCeNRquadJAlNXgzVPYy+ayTtEa+6KbV9Ba59Z3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-d62444/1793727052-BDE78757-4A09FECA/0/0
X-purgate-type: clean
X-purgate-size: 5177
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Stage-1 translation is handled by guest, therefore stage-1 fault has to
be forwarded to guest.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 45 ++++++++++++++++++++++++--
 xen/drivers/passthrough/arm/vsmmu-v3.c | 44 +++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h |  8 +++++
 3 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 4f95b5206e..f213b3de12 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -871,7 +871,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_devi=
ce *smmu, u32 sid)
 	return 0;
 }
=20
-__maybe_unused
 static struct arm_smmu_master *
 arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 {
@@ -892,10 +891,48 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u3=
2 sid)
 	return NULL;
 }
=20
+static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
+{
+	int ret =3D 0;
+	struct arm_smmu_master *master;
+	u32 sid =3D FIELD_GET(EVTQ_0_SID, evt[0]);
+
+	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
+	case EVT_ID_TRANSLATION_FAULT:
+		break;
+	case EVT_ID_ADDR_SIZE_FAULT:
+		break;
+	case EVT_ID_ACCESS_FAULT:
+		break;
+	case EVT_ID_PERMISSION_FAULT:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Stage-2 event */
+	if (evt[1] & EVTQ_1_S2)
+		return -EFAULT;
+
+	mutex_lock(&smmu->streams_mutex);
+	master =3D arm_smmu_find_master(smmu, sid);
+	if (!master) {
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+	if (master->domain)
+		ret =3D arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);
+
+out_unlock:
+	mutex_unlock(&smmu->streams_mutex);
+	return ret;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
-	int i;
+	int i, ret;
 	struct arm_smmu_device *smmu =3D dev;
 	struct arm_smmu_queue *q =3D &smmu->evtq.q;
 	struct arm_smmu_ll_queue *llq =3D &q->llq;
@@ -905,6 +942,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
 		while (!queue_remove_raw(q, evt)) {
 			u8 id =3D FIELD_GET(EVTQ_0_ID, evt[0]);
=20
+			ret =3D arm_smmu_handle_evt(smmu, evt);
+			if (!ret)
+				continue;
+
 			dev_info(smmu->dev, "event 0x%02x received:\n", id);
 			for (i =3D 0; i < ARRAY_SIZE(evt); ++i)
 				dev_info(smmu->dev, "\t0x%016llx\n",
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 17e83dcb1a..24588affe9 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -347,6 +347,49 @@ static void arm_vsmmu_send_event(struct virt_smmu *smm=
u,
     return;
 }
=20
+static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t pa=
ddr)
+{
+    struct virt_smmu *smmu;
+
+    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
+    {
+        if ( smmu->addr =3D=3D paddr )
+            return smmu;
+    }
+
+    return NULL;
+}
+
+int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *e=
vt)
+{
+    int ret;
+    struct virt_smmu *smmu;
+
+    if ( domain_use_host_layout(d) )
+    {
+        paddr_t paddr;
+        /* Base address */
+        ret =3D dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
+        if ( ret )
+            return -EINVAL;
+
+        smmu =3D vsmmuv3_find_by_addr(d, paddr);
+        if ( !smmu )
+            return -ENODEV;
+    }
+    else
+    {
+        smmu =3D list_entry(d->arch.viommu_list.next,
+                          struct virt_smmu, viommu_list);
+    }
+
+    ret =3D arm_vsmmu_write_evtq(smmu, evt);
+    if ( ret )
+        arm_vsmmu_set_gerror(smmu, GERROR_EVTQ_ABT_ERR);
+
+    return 0;
+}
+
 static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
                               uint64_t *ste)
 {
@@ -1142,6 +1185,7 @@ static int vsmmuv3_init_single(struct domain *d, padd=
r_t addr,
     smmu->d =3D d;
     smmu->features =3D features;
     smmu->virq =3D virq;
+    smmu->addr =3D addr;
     smmu->cmdq.ent_size =3D CMDQ_ENT_DWORDS * DWORDS_BYTES;
     smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.h
index 9f4c86abd5..d4b7cf805f 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.h
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
@@ -8,6 +8,8 @@
=20
 void vsmmuv3_set_type(void);
=20
+int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *e=
vt);
+
 #else
=20
 static inline void __init vsmmuv3_set_type(void)
@@ -15,6 +17,12 @@ static inline void __init vsmmuv3_set_type(void)
     return;
 }
=20
+static inline int arm_vsmmu_handle_evt(struct domain *d,
+                                       struct device *dev, uint64_t *evt)
+{
+    return -EINVAL;
+}
+
 #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
=20
 #endif /* __ARCH_ARM_VSMMU_V3_H__ */
--=20
2.43.0

