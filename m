Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E344606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=gpOKmf/t
Received: from list by lists.xenproject.org with outflank-mailman.1455149.1668688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RO-0005aB-Fq; Tue, 20 Oct 2026 08:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455149.1668688; Tue, 20 Oct 2026 08:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ5RO-0005ZW-9O; Tue, 20 Oct 2026 08:43:26 +0000
Received: by outflank-mailman (input) for mailman id 1455149;
 Tue, 20 Oct 2026 08:43:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1xJ5RN-0005XJ-4z
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 08:43:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ5RM-00EVzr-Hh
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 10:43:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ac-e002-0a2a0a5209dd-0a2a4503caa8-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:24 +0200
Received: from [52.101.84.117]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6ad729ab-fae8-0a2a45030019-3465547526e8-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 10:43:24 +0200
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 (2603:10a6:150:2a9::22) by AS8PR03MB8395.eurprd03.prod.outlook.com
 (2603:10a6:20b:527::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:43:20 +0000
Received: from GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf]) by GVXPR03MB11113.eurprd03.prod.outlook.com
 ([fe80::13a1:97f6:9d2b:f8cf%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 08:43:20 +0000
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
 b=H6z9/DMRthTt8tPbPTMEJI3hTdoYIjQF119d1z4jsOyZUP2c+IKtB7QV/ks3bbuqtek0H9CwuOlOrJ/zrt1F/ZOY29dp5kV8Cfhfm78+TylazllX6ZC7znphJtp3+Rz0CaHfZZhPBfzZcHmZ3ga8nww7ygszwuCuW27CrnQJEijDMsQEjkg++nZR49qm0DWWA8vi4t8wm5dXa9lpRbvq8qSpI7ujg/ZZg3+QuOVqRu19wf49/FRSldUVAL4l+HApp+AH5H1PY0Xe4BTSKqKGdXLB2fyyND1NVxiLVL2nDBvdVWAELOuugkGI9jnLTxmLGg7DRz80ZPXEu0TQ8tLn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaPlyiQF1WAzVJ67Z+NxO+5WCG19GCRvpAl3HPh9kPA=;
 b=MqkvH2rF7bzzqeHijogXeX90UZWHa+7gN4ux8vPx0rQk32IM3xXsS7NlZAbDvGXYFS3bU6E3x35gq7sr7a9kbIjn0NRSm3uObdGP2arTrQ+sViwrXO87UolrUP6ZNpDbSmahPeOh3kGLuA8Jwz4vUI8o1yoYeMz8OT14hst9X4d5doIN6XeapAMKD/tfFZQH3ML85odIXk3tvUQqQc9VGZc/eRcwitR/GX10MSezBjYGXkXotdpUnZnXcHOTQTuSn+6MFppYB/iB6tVBCsa+LrGDZLR7eZAp+VR1XgtCRmsAilo8zc6dLAkztxJqDn4DkJ8rHnaQsRfcOsIu0jwZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaPlyiQF1WAzVJ67Z+NxO+5WCG19GCRvpAl3HPh9kPA=;
 b=gpOKmf/tG06EMV2iCPEMUKf2Fv3MaPjj4GHIrWCr8DsTWV/JkLsltZOa7wS7olpYSfrZBsMysx5towmH/Gxb8t7bkOkQrvGBQVBSpad2MEinbPeMZJLdPDb7p280J1/TJWFG6uNV+RcfDPOPNE69Ce2e2sCZ4plMMJEVTWTI092GrN+WwqEBD6zMQZFZmkr3jSAzGz1W2bo6isaGUHLYJREFnf9Z2Ct0hn/plo0Gkl/xuLuUj990t5C0XLzvsj8K5mwbdNM6Yk9lqcfxzvHCDZ+eOyNuJxbxGlqK+EX+u96+S4mz/ZX/1JxBSRhf+qscqVTe1x01wPZRbUa/RG2HKw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v14 2/6] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v14 2/6] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Index: AQHdYG8OvUO/mxPUDU2sduaNbQWazg==
Date: Tue, 20 Oct 2026 08:43:20 +0000
Message-ID:
 <8354d8eb8be9d24f86b2f8d12e5b3a33227c0d7a.1792485704.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: a30fc80f-cb35-4c04-d9bf-08df2e8631ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|7416014|18002099003|22082099003|3023799007|38070700021|11063799006|10067099003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 Kn3MjQu7iedL9fVF9EnGJLPsnYdjNujZzP7kqSM8ScCBVHfNmxy+/vC+EENxsu+LtqxGJJBzqrc/bdrv2tibK0bEOzIhN1biTmhpI5qU1dgoP1JRqL9CAZanzI/fvzKNObyrZOvFpKgrlVy5QaCV5jVjMiMCvEAZE8drUDkkD5NO3b3kJmiANVqgvrez0wf0m3YoLYdZzBEeWEscWujBgjir619IvffaPnbM2hnDRp9WuT2qZo2stTlFN+upryUwTvhEJkx2ZTlmotrzWi1JCkm2Y1owKTt+7o5IHfxipcxj/BD7fiQzni9vcmAm54g17eRxAt9GqUx0GFQyWQoAs2FCa2dlRosrLIiJCiNoi+VExXm2WWpVz9DQQRPDgeE5NEAXoIcjn8pIUdUGoX0IT4CM3yDG0w0vX4dx941uUgSPRK5Ff3Z0aa1r6EOdoAlPDMz5RPAUZxMbU4mVsn5stLlfL9/VrppdsV4agLBphtOr/FPtxcoD+VGGWOXRaYoHIX0MgAGxFU3tLATqpKU3XOgE/j/fnKa/bi6oJKbJ1cVIEzLZvOdw7BA8wDfNjKZEQRcN81O3a3d0UpYe4mtJ7XSgpceOpTgKh1uU46D4OSjJrtz94isfz2IJSgp4bap6ObMdobWlZvDMISKUl+5pjvd5iqCBfqaFToJpsMplye4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR03MB11113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(7416014)(18002099003)(22082099003)(3023799007)(38070700021)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QDrRFoFS/B+B7SDv3U//8kIDNwtBm+gK/QyPobtundoqLVUE3aRLIj2puV?=
 =?iso-8859-1?Q?rD63aPQH7dO8cJvky+dx2jfBDWzWgpwux9Pubfh/dVJpBi8wc7L4oInox1?=
 =?iso-8859-1?Q?U/NgrfB5RlzigMH7BL3/lsxSrLY0LOXR54dN3vQegWOCjZNkgtwnvzGav1?=
 =?iso-8859-1?Q?MNbIPrzeb7TQIhcOw5vFz6nKJxCHpLiPFfQyErdrAKgZxumo9KXOeAE5yk?=
 =?iso-8859-1?Q?PLhMtGpZ7aAgri01wLnaTX4SjSpRqWv2IsvO0aX+OBRdWLo5fbPYiNwqOp?=
 =?iso-8859-1?Q?yxeFolUYKVLfhJuBLdlBF19/qg1v516ljz4OWEQPf8Yrs9y887TZwH7/Wp?=
 =?iso-8859-1?Q?OJBpSiEcEs6oTu/1GjtKO+MryuwbH1WiqDcbWrtK34tribDIcMiPzMppYH?=
 =?iso-8859-1?Q?rL2ZLysKn5k8hSZdzuoZadwdFnUq15ibPKdTs48n25ZlMxKuu+RT0foX7B?=
 =?iso-8859-1?Q?RUzCqvbjBXVOnbzewWMK/cCRTgSke1YcAt/eViMYHXmJpMFvvGxrgUn4DW?=
 =?iso-8859-1?Q?atVId3eP2/OzxXEKfLQuTJ+k1b3qFZ3lL/+Eo6etDUNrCsz2srHJqyQvEy?=
 =?iso-8859-1?Q?We5WhtoKKT1KJ7NHwFDGmVvc1htkEYM7xdE2qmbuKeiKABZxAmYplNr3ng?=
 =?iso-8859-1?Q?TGCOTqqQD3k6rpQmH86pg0wmgfnRpSSgOSbyEgyvzBUkV8ri+MwwXJOSEu?=
 =?iso-8859-1?Q?/DXvgkwoYrpMeCvvUnpvT2CfEYMHmDTFmu5yzjLZtzWwf12YXQw2tCVh0K?=
 =?iso-8859-1?Q?YiyM0EG8UeeFlzz86MDQ8v1uvkBu4m456hjaIagXTxbouAuJzKSEzFRLdH?=
 =?iso-8859-1?Q?8WyyV1hWEagrVy3w+9IZF/oJrxUkFC5WqkbxpzKE1uXQPsuwm7wX2KYjzt?=
 =?iso-8859-1?Q?rzLCs/1PQxuqKliC9xAvi+lCAYpcbMRrRI1m+mTCMQxwQAneIci65m730v?=
 =?iso-8859-1?Q?ilN9UNQr7mZfmv+6dUib22q92wgnkRLWclLLbeaFRuUkm8+7UJqmsnGbwZ?=
 =?iso-8859-1?Q?bQlGpGujWn0n90+xhhQxeBzYTGgNnv1hC/bkiXXm60fKANWhgUOdYZJONv?=
 =?iso-8859-1?Q?RM1jv4UYU3AlwBvrT43ErhB/Dsukm7N9zhTMnomyTVQ+UeBPAQSS8/ZYqV?=
 =?iso-8859-1?Q?d6j7oe39ilW2Ch0mXuyWm642N/Ty9/LY0eKfyZ24FAK71TfsNoHi4DPdvD?=
 =?iso-8859-1?Q?tebH4C/jmzEf3ypPzOwoGGPK0TjLXZ1hCIXc0qwKuObDLDtr5BlYcGnxkw?=
 =?iso-8859-1?Q?piPf9HudB1EYSIUB+hnuqIxel1y7vAKAitI43/Jsv+JamsiC5k5Ko//PIc?=
 =?iso-8859-1?Q?IOIpYon3hl4onTfD+YmZ67S97C+KvovI1EHWSji7NNLmPZiZc856RZbW35?=
 =?iso-8859-1?Q?P8DLMztZQ+R+B0y8YzD7J+9kNyfjtItf+YGKFA14C8OzkH0qP/4c0NzbAf?=
 =?iso-8859-1?Q?VaKoVtNn8PiB940PNoCYjngJ+akGKEQw2cGsUB4TMAWdRvMQbCv9Zcdh/I?=
 =?iso-8859-1?Q?AXc9pKQAlnOK+wn4/Wtydk8HnmWqdPvEPCYq1QcWDCq2fSID4sDs4FZ3HG?=
 =?iso-8859-1?Q?UDR+ogqN5CLvZ3t9XiKkAhbnuxwG5II5tYv0e6cx6ENFhbY+HFe4EJZvO9?=
 =?iso-8859-1?Q?45ZHtcpLoCorbr2LD4JAtJbi0XQe/4ZaBJyDNr9l2zA/w5HP2Tyx6tTS96?=
 =?iso-8859-1?Q?HvW2jTfuQP1EmtsgjUQpHqQfTttX/RvBAc+10GvQzgvPZIIcDoPBVPoQ/j?=
 =?iso-8859-1?Q?J9ZXFqRu8/+1Vj8Xafqe8EaEXb2wMuJuw7kHuLd2Roh9FlH++UMyvGv7xF?=
 =?iso-8859-1?Q?5DJu8lZeqFuhT+vyls1mUc6FRc67Y4E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR03MB11113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30fc80f-cb35-4c04-d9bf-08df2e8631ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 08:43:20.0293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9wkhXdMFGXSTFb4XiiX7lvcxgFLdcjRrjq5QlhRIsypQyRcRdWXZuz0N6MGOkbZWxbv5uYuMMV5Ojis5nloSZfTdmuyT+b2xmpPLtpIpiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8395
X-purgate-ID: tlsNG-33051d/1792485804-6CADC4E9-4A8AC370/0/0
X-purgate-type: clean
X-purgate-size: 1118
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---

(no changes since v12)

Changes in v12:
- add missed Ack.

 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index c7763acd7f..91c9bc1186 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.43.0

