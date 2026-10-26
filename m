Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B1606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=K5YCvv8r
Received: from list by lists.xenproject.org with outflank-mailman.1461355.1672355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKi0-0004jT-Bb; Mon, 26 Oct 2026 13:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461355.1672355; Mon, 26 Oct 2026 13:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKi0-0004jL-7i; Mon, 26 Oct 2026 13:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1461355;
 Mon, 26 Oct 2026 13:25:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Leonid_Komarianskyi@epam.com>) id 1xLKhy-0004iW-8i
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:25:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKhx-00DNay-KI
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:25:49 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Leonid_Komarianskyi@epam.com>)
 id 6adf54d6-bab6-0a2a0a5309dd-0a2a450ae88c-30
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:25:49 +0100
Received: from [52.101.69.96]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Leonid_Komarianskyi@epam.com>)
 id 6adf54dd-f2d2-0a2a450a0019-346545601e59-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:25:49 +0100
Received: from DB5PR03MB10049.eurprd03.prod.outlook.com (2603:10a6:10:4a0::9)
 by DB9PR03MB7212.eurprd03.prod.outlook.com (2603:10a6:10:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 13:25:47 +0000
Received: from DB5PR03MB10049.eurprd03.prod.outlook.com
 ([fe80::9240:92cd:d9da:bf9e]) by DB5PR03MB10049.eurprd03.prod.outlook.com
 ([fe80::9240:92cd:d9da:bf9e%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 13:25:47 +0000
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
 b=dgf5hGDG2z9AWHJvv7+rkd3cxYkTwudQrWwJBy22gvCCXf6LkionpXEbw0XxutZ6QPUPvtPlDYf2y/yVfrD7464vQPupIK4QwHTONZ0MYNGmYToCQ0WG5UGPfUPFebb8g8ZYTqvT+FDAsFTBg/OB+PmLG9lEX25SydQ+CqLjb8T0DjJLfqXxDm83j9ZmpEXzJZcrsu4GeFEx0rUuYkT6uR466tW1Olx3HoVEbEqjtwtVQk/uBZnErv70ntqB5tQXsO7/ncObyny5bo9DduuPumMHHhlvTWzEfaD6+nSQi1/9RAF7WoyMUcEBCQi/UjwyPQ7Gt0ZGn/syANAI3oWIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+MYzgUOpIBvdKGtiejpP31vPoplzCjuNPQukK5VP10=;
 b=ZZMiLGz+mpnFgEVRjqZnXrYnv1bG9DpDwOnmefS5G1xFpo0mHBZiebHqi7z3uVej8F1CcIKCVrPrw4WjD2y/AA7uhMnukvXwe/KbvWuepQuec7/G6KLkjQ0bZvCxsNxopembeRODdCRH3zV5BTOoCU6wNidQQPQWkAT+wUpICJ2I+Y07wfq8wBygcuqhs04cYEpsZ1QejATEE5IGOVq3hBhPoe4tjDw4dHJ428RVN70uLmZbNpq5TyBntWGk/Nws/1SeRRtvF/IW9RNtSy8RTwUzmBesOby0HQ4Oc4H8An253ToqzR9MSwVr+BAuVz9sbiKswjdlNkiTs6wE0poW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+MYzgUOpIBvdKGtiejpP31vPoplzCjuNPQukK5VP10=;
 b=K5YCvv8rlyCXOb5vdsuilYtOy2Vjyhq/KKGHi3pCD4a6Qn49035dvL3vTpIivHVgne4ni6LkxvvM+7XQcjz5VbILWfQQCP+rgYGreIcyaFsPbYxo3ofGZSbzsGsWMC3yOAXy/CWc+SAiyAnyGc4Tw1KnYx0Nhnd6+xhyvQxIpqcXhk0NYUnuNiHAMBeZRayvq0AppFQpNDRAg9AwaF0mJfNKmQCjfk3PJotoWkHXNWjztgAH+Ol42T9DguZlXyvIMZDxkEE2WJae4LPPdQH1tl9Rur5lMfRt1nmpk6hKfGhHrNjCcKOgWIvUU+B6wbuWp3vQgdZDRzx0ts0oF8/pUw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>
Subject: [PATCH] xen/arm: smmuv3: invalidate TLB when freeing a VMID
Thread-Topic: [PATCH] xen/arm: smmuv3: invalidate TLB when freeing a VMID
Thread-Index: AQHdZU2CvV133olROUKhJSegs8l4mg==
Date: Mon, 26 Oct 2026 13:25:47 +0000
Message-ID:
 <c8cd6a9046d553f984bb80c69a35b9bb43a11418.1793002976.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR03MB10049:EE_|DB9PR03MB7212:EE_
x-ms-office365-filtering-correlation-id: 905a10e2-a78e-46e9-2663-08df3364a56d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|18002099003|5023799004|11063799006|38070700021;
x-microsoft-antispam-message-info:
 MAqTaUepNbqGERSJsXaqedd+wF6ZhCbOCBAWtD77vfvhrCiRdzKkNA9R8KJhko/9GESZuqR7R6jjCaK88e0STaTGMUl/WtOHyjwiymjM/2HNb7ncAA1jmHPdRzPXT8PFY4pFAkP7yztGL5ICMh4AKqq2IlpqQVMrWj4+EC2MvQd6pG7NAIyN4eZCJ/jEWPZtzI9MVrCR9/VrBBXBdNrJ8eS30A5HcqnnNBcaILClAruFZpkBeDAfLYt2NYp3+rj5gVYHESMmBF3LCgsnSW2FGouBawiggyjfhFtCHmJizG3Saa8cy26Yn+tQQJXlZbC0j15yVUhm7CJgml+v0Q+YyUABwo5hEbJk+fMLzuzv0tFPSoLPVUKc/KBcmTwiT1uZUOC9SqFAarx0Ms6ywjgSlhHci5LtoCt8Rjo6RxjopaSZAnk/9240xp+t+gaBtoqOf1ubYw8czRSwN7dtjSt6m39mrdEgO1HP3GNGiRZ3zHmBIWlfxjbeutjA7eq1qfbSoIohzAEt2PBN/adTBMVJ6jnhmXatx8fVchCbIUn+p+IVpTaZyPInz4w5dCrUDPRjTJILxNt0VIyFOP5nQgq9/QGPzS6nChJjWtXsd7ExEojEYMGt3p3CBHo6DwoBvRE6OdQtR60rpwxlBgBWDjnXtviPAv3Y9UES8YX9cyX53V4sjeiluB+vbHylcmzP2rQcx18oVvEt51KgYSTD8BUVnvNIVPQ4HLA6/TC8kye4aJM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR03MB10049.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(18002099003)(5023799004)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XoiGtppzdq04TD1PcHcgS4gPIr4oZ8Hv2mSVNQ4A/jIApVHK2g/17yLnQK?=
 =?iso-8859-1?Q?TEp8sRrHde1KyC2rQDbXAtRAy0CrKw9OwSk3GOZxj5wy22PgCEMuG6qdls?=
 =?iso-8859-1?Q?b8RnLs2qPQUCxtcEOwRk5PE8O58mPEm5SCkmIUAQgumQ0bNCifn6K5Qiea?=
 =?iso-8859-1?Q?YDbMMD4z7oKBGp4l6z2qNPFGGg08gTrv5TqcmrZlZOgpzg/83t2f1Li3RJ?=
 =?iso-8859-1?Q?wwTJc8sXxd+SZXkvaU0ngJRfKVR/UL9kbeezolnt01DbOD1THQdecE0YEz?=
 =?iso-8859-1?Q?cfO3p+THFFSV9ADtKcmhL2T4tEc+bVTQ6bHXNUuolMdsbrYWh1IIOMBTg2?=
 =?iso-8859-1?Q?wfM9t5zQwzOZMHAjKLe6TSY/A4b4/U4kIau7td0AiR6atGKaK9D5GJ+jYZ?=
 =?iso-8859-1?Q?WBF1s/tn/v0SicRY1gQQ1TKws98B+G82VyS8exePovotxgJkLzuTxbIUp2?=
 =?iso-8859-1?Q?ggP+DFTTfB77rhzrlVqNH7q/c211byOKZ+SctsS9Urgp2d9Z/Mmt/RMFey?=
 =?iso-8859-1?Q?KdAt3tOdBR9cDKgTXnmdHECqRcTfCJx7BzqS8yeCSlut20wtIV6ro4IgE9?=
 =?iso-8859-1?Q?0FoNE2fWprpd+74ny0/wGRhQBeNQeJ8RfeDdcx7y8lQN8Bo8CoOXI/aL4p?=
 =?iso-8859-1?Q?k5SAYtlrqoMPhAR3HCYuDmRiBKbg64TxTX81lDxiqQrdFVBv+cCjJf95t/?=
 =?iso-8859-1?Q?r7OVD6lPOhUnINFxcHARD5fV0JIIlVlRaDAOuOWW9Obj3YuwAWl67CyUj6?=
 =?iso-8859-1?Q?7fIRYpgz3EoRqAt/5Ip59asD857kBeye8gI5pOTe8S/OmpPYAtUzbZ0Sid?=
 =?iso-8859-1?Q?42tIIbj6OPuWWdUCfrL3oScEi9X+odCX2WHe4sUSkf5C/620vTWVPtA3fe?=
 =?iso-8859-1?Q?SHcU/b/xo3+/3E3sPwHgc9fKSd9agkZvpEpWBpzV1jR5B52dcjdtAHBO6x?=
 =?iso-8859-1?Q?VS7sGqwvvHl9KwR6XCoEenwZtTqHR+boIxZ9Wa674BP6+eqpGnJUj2UuCg?=
 =?iso-8859-1?Q?RAXer5Dy1/TFDiaYnbp5OPkt7XPjZRLxv+I15vE9sHI7ChqSPLYHjb6u55?=
 =?iso-8859-1?Q?gdFLhEMPSmjNN2MYMcF638HV9zd4LtTc7Mu/o/cyC6NWUsFzUnGNy1ncs5?=
 =?iso-8859-1?Q?ye6id8WhvSC1Xnb/yaARfhOpOk3Q2iZ4Qb+53lRkEwXwEOKMSupWpXG/OB?=
 =?iso-8859-1?Q?gjA1+Q+F67MI0BiD1laKNk7EP+01LufclGk80g5xpnAeTbeBHotlbJSm6F?=
 =?iso-8859-1?Q?ivB/v7C3RJirZ7SxbiIhyr3xXmLpVqeYpIcLjOZONwEl67YPKSZpJ9uB0M?=
 =?iso-8859-1?Q?kGC5ezhXcrHpUW14ci+Pk46NyrJ80rqUYk75iHgPEflCc/mpcc/hPNKHSb?=
 =?iso-8859-1?Q?QXWPAxDEkjxrxul3zmWHNZfaImGYoNNTGgp6FKYKF0uvCHheWu+Dt5OqU1?=
 =?iso-8859-1?Q?HZKECMDcxj4nZHBbiHmNI9Y2UHYcq4HTudANxtP8sGjULQXvj0Lnyu/wDp?=
 =?iso-8859-1?Q?JAXRpIZE92yKJ4cHRQnVPpF+yxZ9yYeIHmsotFUGRE0C/f/J1jNoA3l5eq?=
 =?iso-8859-1?Q?OCblcX+rQhT0gv/5IFBWLWIPu+BFDATVymcyl5od8hNN4me3VEN9E7RUiu?=
 =?iso-8859-1?Q?HpZJ5Bj2gCYe6gPZ3/5HXfZ3ZYuBbGv3YDg59xIF0athZyKWuohX/4uNGn?=
 =?iso-8859-1?Q?q/7nDwO4pBlzLSdqnG8x/meTD0kcOkuKHnDUcogYJo6zgM/LHJNqYZW1vD?=
 =?iso-8859-1?Q?RumdPTrurYwPPQdREC9I4qMPKd9eBKssH39GljEh1piDygSpGH5wIYsqNm?=
 =?iso-8859-1?Q?t8uhbfDtF9Bjwp4OrxxjWwHf7Kvmbl4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR03MB10049.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905a10e2-a78e-46e9-2663-08df3364a56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 13:25:47.4927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6HtMPT4ml98pKsvRJuwU5WkWQzNELWBsmkbqcPOjbilj7zeMji6lzhPmnZbcD/kSfbCkt9DgnYh2EtAK7Rmk0d5/nCYq8p0flnpkx5iupg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7212
X-purgate-ID: tlsNG-4011c0/1793021149-58DC7CFC-2E9C5313/0/0
X-purgate-type: clean
X-purgate-size: 2292
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

arm_smmu_domain_free() releases the VMID without invalidating the SMMU
TLB entries tagged with it. The VMID allocator (arm_smmu_bitmap_alloc)
always returns the first free VMID, so a new domain usually gets the
same VMID as the domain that was just destroyed. As a result, DMA from
a device assigned to the new domain can use stale TLB entries and access
memory of the old domain, which may already be in use by Xen or by
another domain.

In Linux, this invalidation is done by free_io_pgtable_ops(), which
calls the tlb_flush_all callback (arm_smmu_tlb_inv_context()) before
the VMID is released. The call was dropped when the io-pgtable code
was removed during the port to Xen, and nothing replaced it.

Linux guests that modify their P2M early in boot (e.g. by mapping
shared_info in the xen_guest_init initcall) hide the problem, because
the resulting IOTLB flush clears the stale entries. However, guests
without Xen support (e.g. Linux with CONFIG_XEN disabled) do not modify
the P2M early in boot, so the device keeps using stale SMMU TLB entries.
This was observed as GPU rendering corruption after "xl destroy" and "xl
create" of the same guest with CONFIG_XEN disabled.

To fix the problem, issue a TLB invalidation for the VMID before
releasing it.

Fixes: b3be6ffb009c ("xen/arm: smmuv3: Remove Linux specific code that is n=
ot usable in XEN")
Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227dbd..93176e2fb21 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1153,8 +1153,14 @@ static void arm_smmu_domain_free(struct iommu_domain=
 *domain)
 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
=20
-	if (cfg->vmid)
+	if (cfg->vmid) {
+		/*
+		 * Invalidate all entries tagged with this VMID
+		 * before it can be handed to another domain.
+		 */
+		arm_smmu_tlb_inv_context(smmu_domain);
 		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
+	}
=20
 	xfree(smmu_domain);
 }
--=20
2.34.1

