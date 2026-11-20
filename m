Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FAF606A6E8
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=X7YngDHr
Received: from list by lists.xenproject.org with outflank-mailman.1498448.1696190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUUQR-0001Cl-DI; Fri, 20 Nov 2026 19:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498448.1696190; Fri, 20 Nov 2026 19:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUUQR-0001Ce-Ab; Fri, 20 Nov 2026 19:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1498448;
 Fri, 20 Nov 2026 19:37:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xUUQQ-0001CY-51
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 19:37:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUUQP-0055j9-Hh
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 20:37:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b00a141-e002-0a2a0a5209dd-0a2a450cce6c-44
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 20:37:33 +0100
Received: from [52.101.65.137]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6b00a17d-f479-0a2a450c0019-346541893458-4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 20:37:33 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAWPR03MB9903.eurprd03.prod.outlook.com
 (2603:10a6:102:358::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 19:37:23 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 19:37:23 +0000
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
 b=pspFkQiN+Si5jLc5HaArYuCVXs6s/Jm8QZuIxfMgLsDjfq/ENtLuD9Kfi6dAcdTwwBsirFTJ718bjjX4ryKDxG3eGhg36cIA42FNG+cBhxW4Efr7OPIOVwnC1ofyXsL6O2uKvTWZh4zu+JmQYc98VyDQ6EYoAM+VcMp5K5FNSp9DUS+IYeP40FTcip1wqzcdP+P70c/BZ7Cnshd5Z+UL2JCCGyX/rBslaJXkR8S2fJiEQkNy5zurXEo3pjBVf97qwnygms3wZyOd8wbxGuZbs5bwvc6PTCMZL9JkByrCe2RcM56Hq9QKlb2KUt9eKFAdrZ+90pOaJszQmBcm0yk3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baXQA/ItfRd6YuaK3WplqYtQ/XUgijoCy5fcI2XamBY=;
 b=iRS+xNPCLoPZ1XYbI0xDuL/L2DW0XTnPSuMKNOKABSJR7HZlz0+zhQvR9HHuL0p9Kp4A9JmyKkp7UXkCkOFkkQfgM4Cwh5khd5jC4lEdnfcP1hlZI9E8xT71holE2k0VhnjK9IbFZ/8UuXyhgAZd8LKhyA7bFx5+OzStfM24qJQyK5T/OMSnb15n5uCFOZP8vzzqwx6Pdu2UVvrNW/tmyOO9c7TCFVE7EOQKSSgFYm5/fgfz7jVq69ZW1R8uxvthCj/xUSxi/4t5o2r9qXLCj1ipG+5PklM3yDfWJYtp/E0PQWsDGMNukVKMOVPPxhxzpGtuuYrsbgZRMObTOMD8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baXQA/ItfRd6YuaK3WplqYtQ/XUgijoCy5fcI2XamBY=;
 b=X7YngDHr6lBF2FJbinW9BEvmleYjjfU0+dMjgV3Sr4M8ZRcINHJ7We3kbf+oUcZ7chd6RQ3aFmMfrPBrNHz4Gp0uHDOB7TgJ1gZBqLHdi52OaJCuX6nImdxpY+UXaBjovWFCwrmMjIhTKA1JSksR1OdSmnI/Ivuqbt1db6D1WWndDuXPJCt6Lcv5O4xr8KjIGH1glrUe8zvQkenFO1nNQBMOXTdpgXTsEbKFbHFXZwr1t2zCqkNIEZ6oWqZ4AnjW4U2dBHeM4CpfVGeRguwEDTMojSqXlFdSxj95bSc7Bp4berqeLvmRrNCSoBOXjyqTB/scf+rTKdkq4e8PKPtEEg==
From: Mykola Kvach <Mykola_Kvach@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vITS: check the target vCPU in INVALL
Thread-Topic: [PATCH] xen/arm: vITS: check the target vCPU in INVALL
Thread-Index: AQHdeSaQaWCX7o4BoUqv0DaFMGf86A==
Date: Fri, 20 Nov 2026 19:37:22 +0000
Message-ID: <20261120193710.368311-1-mykola_kvach@epam.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB9208:EE_|PAWPR03MB9903:EE_
x-ms-office365-filtering-correlation-id: 5edb9b5b-c5fd-4f6b-74ff-08df473db2f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|10067099003|261026140227099003|261026121527099003|56012099006|11063799006|261022105027099003|261009223027099003|261028144727099003|261102123227099003|261021121427099003|18002099003;
x-microsoft-antispam-message-info:
 fglMQP52mHVn0PU4JC1fH6ZGauJ+/pcvkIQrdwcF9TJ7tTCTjFQisrNkalgNBhJ0CY+76Pp4D/T1MOK+DZvTDmEAF185KlU2nvNHSP/t8+jIVVKS3DtZ1mPB1OQ+1CMXFt8pjjpIHZeC5ZWzDiRFnMkUreFeFOZJXlUnVP5uGPOnSoP2qyz9ATzaXLj0KdWZuGZOP4IEVPR688Sp1EhBIBQscGsa255QTta0F9LJa90G6zMSaqpF5wnSyDgxZe+y63v99LF1PcvCNN478iY8uaP09ADzLZVH+RCrD/kyMbZJshQ7tQXMQJtuC4A9sPCIkfsE5oSv0czO0eZU4g+1cBQ3cMXs4+A7GcGVzaew/e9qetYT+iGY8uaCkzJEZlXpun7CtRYL/MvfpFa3C6L+eeByRgiRJ9anrIAtgR0mLE9IsycTyKMy01T2trGVxtSFYRdtJ1tfB8/Ald8qu6qoJrk94gsiM2z18XDOdFwaSmynovX/f8d9IE0B3MV44u4iadBxU+PNalo38ee1sUzAiexmmtKteZ814xH65r4DUe+wSBGuT15rXMqIynuCWwWjY6tKl5cqtQ5Rg+qAUGsVWlgxbpZ3So1fzmkjEmIhkO3lV8CEf0CUGGV5ZHTSMBuR5K8VVEvZmCFtR3yYHG5qpp/Ec5p4LfPpcYZVYPA8Pe5Y13eB7Yu5d7w9t/fGpcM3TN2GpCgI/YWzSJ3Sod+MbxVPNVanjm5yhoJ/d85hKCA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(10067099003)(261026140227099003)(261026121527099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261028144727099003)(261102123227099003)(261021121427099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xr1nvgePV9iG2eUtodUr0V7G5AwD3ZOll0hboVImgcV/K+fJcEOB5eOYnR?=
 =?iso-8859-1?Q?0DTsSggAfoq+cIQBD0HIXbJRRMqhqSjccCNvwJYgNmBZHe6vP0zcR96dIO?=
 =?iso-8859-1?Q?WiQGOQAvaY1t8qiNfwrS5IMIlBVYnKG3zxZUsFF454K96aKRGSTcBFVjtJ?=
 =?iso-8859-1?Q?5UPmZPQBiB+MjzNRqXCcWeOQArWALcP8UjmVegsOj8/UT+PCmnw01oii16?=
 =?iso-8859-1?Q?igVXkGlXmhrJOyZts2TG1DfSIGQoaenNsTDXRvgikcjw7MGl1Pg07kYzY8?=
 =?iso-8859-1?Q?KTZfsXIDemp9ZRUshgZBeIwBomaZ8cND9pb/QtKi1FqTmM1C9ZsSGQhXbo?=
 =?iso-8859-1?Q?oq/EpFF4uHgo10iqRFvHFEsMCrnKnnW72dV+lRf6jEEGwcj3gqEneHPh0p?=
 =?iso-8859-1?Q?ITldsrUhgJXKpuF23kBGDQI0BCZPefQtBXs5zgCX99IF9noo0+X7xZ/1Rq?=
 =?iso-8859-1?Q?wcnMRelp37wEfgdPuK3w4G6INNa88+WT6KNZVLTX6Ua9jiU3/pNUwi9OzE?=
 =?iso-8859-1?Q?JEWgitiNDCSLZxDJJnO5C9FJRwe9aKR34OVNfz6jEhdmgbpCCbIozCRApC?=
 =?iso-8859-1?Q?urc3WhlmhO+bG5RRhcIn08zhZDtSILvBFhKNsNCqnlWqQy7+JyGvwUml1X?=
 =?iso-8859-1?Q?//52O7dh9RsTmO0JBJffGzGPB78TLYA5pI2X2QyU7+ykvhYQO8XBAVXUCR?=
 =?iso-8859-1?Q?QLCdAHoipe8NCgzdStt24sXJbG0skNY61H6ipM9HXr2NLn7Ve1zrGZvPyY?=
 =?iso-8859-1?Q?89QA/PiMB9nmHc5ZCQ2CcMBzuSkb6cJF/LrSEl8yQ/08eVq9U+T3GZUDGR?=
 =?iso-8859-1?Q?djLDpu4PfFmycuueBZHUDDg/rUAwawwOISCY5xvTPKPaR4v3M/tGPPGQ5U?=
 =?iso-8859-1?Q?YVBHlc0CPl1KPPnyjGtu/7fOB/BELyGtsm2YdgEnhk0C7On96SuVgD3SsX?=
 =?iso-8859-1?Q?ZqzmODIhLAEAezDt3ANH1NQQHF8NUBCmwmxxQ9BakS02WecgcslA6EdQd6?=
 =?iso-8859-1?Q?H5KyAXEtGKrWNx6QMlKZ42/1xpzpGsa+9dbzbrTGjxNoIp/HyF1lSkfaqP?=
 =?iso-8859-1?Q?h8CO0N8iZNOapO8/v5i6jgdnNArf7oSlVTXpEmygeo4CEJ0Q0KzR8ej2wD?=
 =?iso-8859-1?Q?S/Cl0B6vBB1fs4RAiOMqNRBzfT8rA3+q9pxWMAkiXxYDhSdgrd0qrrW/1S?=
 =?iso-8859-1?Q?SFe/P1xXtH+SHCL4sD8hdoRqU9YmI/TfMxrh/Q9+zsyo2U7e0wRFL62dEv?=
 =?iso-8859-1?Q?llNCVvH8nq/niW4DpGzOn9SPKIjQ/zHigMo58lJx6qznLUBNDUwjzEqU+K?=
 =?iso-8859-1?Q?8sAM6rmfc2DMf/NQrsh2KXEl9stdEfxSyaASwsSROuQB7KetTmcBqXi0Th?=
 =?iso-8859-1?Q?AvXvRntfvJ8A80V4y1S0CO840zxdGojQSC1MqjAsmkmiPh+Vc4YB3em3sS?=
 =?iso-8859-1?Q?vrKcOCIBtjy/or7sfmqC559D6wyrTaO/Th2Kaeh6genIzXFiwvp97ydzpS?=
 =?iso-8859-1?Q?cH6OqjIVNfM9yl/81YhQT+PYvTSinpAuczJH7pOrJKuLeq4o9j4fwXsmQD?=
 =?iso-8859-1?Q?iSa8XaBPb4IW2r8RgiJU5v4LAYKJIeclAa+zqX9XqWk0tdboSVcaA5R8Wj?=
 =?iso-8859-1?Q?d4cS7x2yiXy8ByC2qeP8lm9pKRDrl6aqvXMEzQajMnUExnY0RlUrRlUBY+?=
 =?iso-8859-1?Q?zerd/g18uQ4O2wlLEG0+UV9bgJwO4EQ3fBGVpCgd/2nsDfS/ndY5LBfZFQ?=
 =?iso-8859-1?Q?k5mKqZTc8FKZucHtrawhKQMYJ7jkN6/VnSZ5XO39YSAnEn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edb9b5b-c5fd-4f6b-74ff-08df473db2f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 19:37:23.0168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6P+bFGxjhQklZJflKKuSdDOZNtVJfr5+U2qwNqJou2GRmSYt3+Ip+W8UapIszL06H3FSVFEmfHMJcEuKx3eUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9903
X-purgate-ID: tlsNG-d25034/1795203453-77ED2A5B-E94A0C1E/0/0
X-purgate-type: clean
X-purgate-size: 1021
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get_vcpu_from_collection() can return NULL if the collection entry
cannot be read or does not identify a vCPU. its_handle_invall() then
dereferences NULL when taking the vCPU's vGIC lock, crashing the
hypervisor.

Return -ENOENT to the vITS command dispatcher when the lookup fails.

Fixes: e975cca32bde ("ARM: vITS: handle INVALL command")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/vgic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 79d056e21a..b2103d820d 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -533,6 +533,9 @@ static int its_handle_invall(struct virt_its *its, uint=
64_t *cmdptr)
     vcpu =3D get_vcpu_from_collection(its, collid);
     spin_unlock(&its->its_lock);
=20
+    if ( !vcpu )
+        return -ENOENT;
+
     spin_lock_irqsave(&vcpu->arch.vgic.lock, flags);
     read_lock(&its->d->arch.vgic.pend_lpi_tree_lock);
=20
--=20
2.53.0

