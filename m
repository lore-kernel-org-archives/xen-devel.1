Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C0606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=D8+amlDK
Received: from list by lists.xenproject.org with outflank-mailman.1479829.1683728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIx-0003t5-Uk; Mon, 09 Nov 2026 11:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479829.1683728; Mon, 09 Nov 2026 11:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIx-0003sj-Ox; Mon, 09 Nov 2026 11:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1479829;
 Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQNIw-0003pw-0v
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIv-003aoG-Dn
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:49 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aaa3-e002-0a2a0a5209dd-0a2a4507d888-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:49 +0100
Received: from [52.101.83.89]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab0-b4ea-0a2a45070019-34655359e23e-4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:49 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by BESPR03MB911570.eurprd03.prod.outlook.com (2603:10a6:b10:147::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:47 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:12:47 +0000
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
 b=p4F96I7HoE3qiYwvjhqs1CtNkn5bNwMg43C0oK1lTPlYZzxXWfBy9BwkD3m+FYAOK0kaZGGobbz2rPC/SuyAnA5AaEiHE+6FraUrhIlGSYAgCiOU5ahCTL+UEOXRkixRd3Pq6UC3GiSm77rPWqENVqd8kJttlvN2eDV/cmExIqQMccDe8GQmYVvSclLt8VVPwSgYebCZfpfCFrfqrvXgfIDYptWIE/qqAQGP07Jydv/4FxJgWFmxh0LqzhoPvr359Zhge888oTEoVqLV8z6/HqesT4pVAolCQeuD+TSra7nnUo83diOorsHuHUdVOgg8Vhu9vbP+h7IFGWeXjq3xiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPWsttjC1WUZeRXqCO/27twOSP1g+3ez+TabzjY7rwc=;
 b=b9s59zF7xGDrJMjACz8wzPQPcygY9kpPs9mhdYR58dEO5KFmIgeBK2Nda5e7/MvvKULeiYq1+E0a2P47H0rCFJ1yi9o4aE2WNLklb1+DYcxPCbRAd54+EeX+BWV8anLnRHxw5w6vSawuvp5R7U7KilmJ2PmMCoWuZP7chL/jpxf6DQ7qxkHvKAu05zzHGfV0ccPU7y+w/x4lcNGut3OTQ27Qdujk6g3f5emN9TEjqlvrewBXUxLkXbLoz2fTZyl/+LuubfDx1haY4jpOjMPWVW8KukfPRV0oabFH6HX+K/FWgQ2gJj9cFWU7IRyHa8UwnULaENI3k3igkbdfihhHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPWsttjC1WUZeRXqCO/27twOSP1g+3ez+TabzjY7rwc=;
 b=D8+amlDKgLOiuAgatNEWXCt9FYI7v89aHTYw+e34bmmafJxI9dvR3Ko1qKtlIB3XCfa0UfNYtz4t5Td3KZybISTRazDSTc5eZO5lijczkffwgFJvD4gJ26eoMiZr3WI5AFTJFYar5TvQPojvmvrWx3iph6FCb1mi4rTUCYIR2BhUF1hmLK0ui5Z4kFv/mUfZ3fpvTEVdO6hvD5gjGGyqyPlEp1En4Bs/6/A8eqlDhI7ejfu+X0XGq6B3UJz0vKoQHjCV/uUkf2IIDByoaMjfJUlLz3IaR/ZN61h9Efd1blGdtz3nME88GA3wuAdxegRYavG6lQO5MgboBDqjHyfAvg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 1/6] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v11 1/6] arm/irq: Keep track of irq affinities
Thread-Index: AQHdcDtAju59FhkFYkKpO0VICO+n8g==
Date: Mon, 9 Nov 2026 11:12:47 +0000
Message-ID:
 <238164f06cb65244b1f55f9c9bd2347b62c07439.1794222015.git.mykyta_poturai@epam.com>
References: <cover.1794222015.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1794222015.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9076:EE_|BESPR03MB911570:EE_
x-ms-office365-filtering-correlation-id: 6e6e427a-4d63-4794-042b-08df3e5262e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021123027099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003;
x-microsoft-antispam-message-info:
 iLK/STST+qfGhTcysm+ZQ8hN8Fe6gQQbxbo/fBwgUlGCrBc9p5YLNqGGFJh0fa+iEhi3NVfrZWpTXYH95DmdM4FdiU+VtA/8qpHxC+nvoxJgfzc3Sl71iahcM41Nde1cuXzs/foY0r0nA1iKQ9/VHzgZkKOcppkXWcRqjkrUFuWyuZyItS+WdEciz2TgH5/CpOC1obtbU76bx8IHzwXhHwuNK1RNESyPN96PuxZG8hcX7EOCJieQiAGc4w2GihULRJN2jav6yEenJSXQX1ANrCC5wIeCf0QbPgVixDYTGTlRGPEdUcj3kmHoKUT9hfOOv2iJZK+kQcLtEWj5CGU1MZtx2pdrq7/QNzlRM47p86NshY2vU/L0+qA+K5gJP8D7ldgKtO7hqLpa1xd3eaUwLrkZlot7kA9B9v3ZYkiy/x7WrJdypetoNgwiYlFNvOBYbhY3lnnCP82wd0JjnHrha3OkxbqRnaHZQwgsD4acwF2yBHbp9s/If5irSkUIQXRySYFE9k+13T7mw5XPbgNo1ItQS61v/8JpC6ZyioILejBN3969vHLixob7XhueLA9iCde6v/u/UEhhP0j6ivbYB4lr/xJEASi8qSQUCs9mRFQxUjHatxv5TKrDAB5Luyspkpn5L9zoAvho7r+o0ibBKyvEPMmUTW1lAFFm/dCg+W0v4Gu1QSjSg/bSPUuxU35+mkqesaNsEakiwyu6opIgv5f0cYQC5BGHq504RT44OKg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021123027099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B+V8IYePtPfO/N33RobTPstmgLqpGa4S9+J928SPYsoPT6wX13OqrjIXpj?=
 =?iso-8859-1?Q?6h3jFkOQ3ox9KNIFYAC5Q6/iAabPZLzjcW7vPyBPeW0SnGLwvdIoRAFD6r?=
 =?iso-8859-1?Q?/omhMG3azWm3py/XE3Uhib0gRqS0AhLJQegtRCrtUR3v95tKeewKOi7lOI?=
 =?iso-8859-1?Q?1CNzmwyJi+fG9I+2Wrio9y7cvVMcp1jpyMdwqXZXtRBZb0mJuSWitgmt45?=
 =?iso-8859-1?Q?lqks1wTpzT3VlVa4/5AkXMip/cpYsS+JGqaCqbZMov0z03D8Z3Fb0KJYmp?=
 =?iso-8859-1?Q?ZknDsaQ5t0BqjW/nLaflNAwARpDreHSPjAwHIJcjqsSrsO074BE3GiYLfZ?=
 =?iso-8859-1?Q?mOUbuYOxrTkFs7ltrpIoq6Lv/9f2kafGTXbo9UiPQXOtvBJmSkGW7xoukC?=
 =?iso-8859-1?Q?p7T9NnAJ7Y2jc6vRs1hpCSrdR5YB61pngvZFJNxEet9u/VsfGDAt6/bRgB?=
 =?iso-8859-1?Q?r+OBpy6D7LXwaw4Agj7ep13k+ENm0Ue7gCrpncSOvHxrGeK5wV8gy0mCUL?=
 =?iso-8859-1?Q?1eLtUX+oy6AgqEVGtAzzlI1Pn/U+7nXXf0QOo7X9FTw7utE880pxOQ5zxm?=
 =?iso-8859-1?Q?/4vRntiQvjAyg2WjVcgSEF5ezO2Grcc0COFLqFL5qIGl6Aw5cW2vSmSc17?=
 =?iso-8859-1?Q?7lB7GaqTIlRCuNwny05Sme9RT+g7nYp0OiNU6MBcS/mvEV9SBc+5CtL6sx?=
 =?iso-8859-1?Q?WGMlGaxCA1Kh+gwYuvnWANSoqkvf0uOZUgipStJavOnvhqDwMkNc4+FH8j?=
 =?iso-8859-1?Q?S/etjCU7KdMsMMS4NSJKxiOp+2X2FKed3kQZcb6nhZ8SwuOjaSTQX+OHYy?=
 =?iso-8859-1?Q?xLwRGrWuHtUmV6+oA98c3/hK53fy3x6QXxlGhBs2fH7dmFKNrD7Y07YdxE?=
 =?iso-8859-1?Q?iIFmZE/3pMLUM/Va749N+obSmzxdOVSMoi5KpGX9QwLyc0hcyG3CMwy2JH?=
 =?iso-8859-1?Q?dWOD5yY61RRiqR9p8aUXCaQtmhy47isvTYUv/PKinS5diVQu17+MrEJBni?=
 =?iso-8859-1?Q?0s4vR7320XnZWjVdYweglgjRxPLPww5PCaSJe/QeUGn7o8BhP0A/QnQYnG?=
 =?iso-8859-1?Q?XOyc4jj2bnOIxGiOsHdVOsv/f1umjIbC4/JGpvnDWBqzVakNmgUVuc3S2y?=
 =?iso-8859-1?Q?jVj3x7w53qaBbT2RVTzI+qd8MR2OV3FTALTOW0Rhmcui54bqOsL1rZ7B4a?=
 =?iso-8859-1?Q?JbOs+0gbHpnZDdYQjLd1nvyaxxmnRPelaORfHNWU02dPOP4VwYAu2sp00d?=
 =?iso-8859-1?Q?eeJaysSPGG4RAXxy2IElYFyP+vwMXb9wGLOY3MAxikOPPR4KX+yigMxfIb?=
 =?iso-8859-1?Q?NHUULY5BZ9vl7aTvU92dmVih+gCY4CJp4PFJmh9BXi0LPBoJjPwbtSWgrL?=
 =?iso-8859-1?Q?yjxZZng+zO7G29vT6ndUJ0YoNH8ZJq3w/ZEvtqHn2h8aJ02649VBOelNL7?=
 =?iso-8859-1?Q?MjzLxwS2DgLvsnf9G1MwQBLNhq7KpKJeLX3wy4MvOJ3YtVkOo4rCM8GAeR?=
 =?iso-8859-1?Q?HpXZiZR5K0LbCX5tye5Rl6UphiW94ssgHU5aAGyVLixR9TFsXtDFh11leM?=
 =?iso-8859-1?Q?f8wqUWakbDrbmz5A/2lpGfwbkfpuNANWdWFgvvtJXV7I9ciaF5EbbDDgoG?=
 =?iso-8859-1?Q?O9t63qNe6i9cI4NNtVRBn3svdn3JnuTHpiqKsKFOy+FsO+7MafO0tqgmU1?=
 =?iso-8859-1?Q?qqUSJ2XwamvT5mq4l63Wf2e6o+yM+SgqGq6hzltJGlVDRJfKbzg9xfpfXP?=
 =?iso-8859-1?Q?64K92qs2I5qMPq3faeZ6HnqBR+b3m1QnOF48iD065pGfAPwForS6nUyHD2?=
 =?iso-8859-1?Q?ybYnt74iOg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6e427a-4d63-4794-042b-08df3e5262e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:47.5259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ITjinC2m/UdQUN4AwcAqLK9XvlU9pu+wCVKP20okQFsj4w3Vr1KwL6cAVzENr7PI3Y+9zrU2ri3LP+/TVb3sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-ef75cf/1794222769-368D9AE4-E68D35B3/0/0
X-purgate-type: clean
X-purgate-size: 7590
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently on Arm the desc->affinity mask of an irq is never updated,
which makes it hard to know the actual affinity of an interrupt. Fix
this by updating the field in irq_set_affinity. Changing desc->affinity
requires desc->lock to be held, so add an assertion to ensure that
callers of irq_set_affinity are doing so correctly.

With desc->lock now being required for irq_set_affinity, add locking
around calls to it where it was missing.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
v10->v11:
* no changes
v9->v10:
* no changes
v8->v9:
* no changes
v7->v8:
* no changes
v6->v7:
* update commit message
* fix possible locking on null desc
* collect RBs

v5->v6:
* add missing locking around irq_set_affinity calls

v4->v5:
* add locking

v3->v4:
* patch introduced
---
 xen/arch/arm/gic-vgic.c          |  2 ++
 xen/arch/arm/irq.c               |  9 +++++++--
 xen/arch/arm/vgic.c              | 14 ++++++++++++--
 xen/arch/arm/vgic/vgic-mmio-v2.c | 11 +++++------
 xen/arch/arm/vgic/vgic.c         | 21 +++++++++++++--------
 5 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index fae80e6cd2..28ad4903b4 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -232,7 +232,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
             if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
             {
                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
+                spin_lock(&p->desc->lock);
                 irq_set_affinity(p->desc, cpumask_of(v_target->processor))=
;
+                spin_unlock(&p->desc->lock);
                 clear_bit(GIC_IRQ_GUEST_MIGRATING, &p->status);
             }
         }
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 8d3517e761..594aaedd22 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -224,10 +224,15 @@ static inline struct domain *irq_get_domain(struct ir=
q_desc *desc)
     return irq_get_guest_info(desc)->d;
 }
=20
+/* Must be called with desc->lock held */
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    if ( desc !=3D NULL )
-        desc->handler->set_affinity(desc, mask);
+    if ( desc =3D=3D NULL )
+        return;
+
+    ASSERT(spin_is_locked(&desc->lock));
+    cpumask_copy(desc->affinity, mask);
+    desc->handler->set_affinity(desc, mask);
 }
=20
 int request_irq(unsigned int irq, unsigned int irqflags,
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index acded6a40f..53f36780d1 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -490,7 +490,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
=20
     if ( list_empty(&p->inflight) )
     {
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         return true;
     }
@@ -498,7 +500,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
     if ( !list_empty(&p->lr_queue) )
     {
         vgic_remove_irq_from_queues(old, p);
+        spin_lock(&p->desc->lock);
         irq_set_affinity(p->desc, cpumask_of(new->processor));
+        spin_unlock(&p->desc->lock);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
         vgic_inject_irq(new->domain, new, irq, true);
         return true;
@@ -518,6 +522,7 @@ void arch_move_irqs(struct vcpu *v)
     struct domain *d =3D v->domain;
     struct pending_irq *p;
     struct vcpu *v_target;
+    unsigned long flags;
     int i;
=20
     /*
@@ -539,7 +544,13 @@ void arch_move_irqs(struct vcpu *v)
         p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+        {
+            if ( !p->desc )
+                continue;
+            spin_lock_irqsave(&p->desc->lock, flags);
             irq_set_affinity(p->desc, cpu_mask);
+            spin_unlock_irqrestore(&p->desc->lock, flags);
+        }
     }
 }
=20
@@ -619,8 +630,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsig=
ned int n)
         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
         if ( p->desc !=3D NULL )
         {
-            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             spin_lock_irqsave(&p->desc->lock, flags);
+            irq_set_affinity(p->desc, cpumask_of(v_target->processor));
             /*
              * The irq cannot be a PPI, we only support delivery of SPIs
              * to guests.
@@ -975,4 +986,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, u=
nsigned int rank, uint32_
  * indent-tabs-mode: nil
  * End:
  */
-
diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio=
-v2.c
index b7c2d7ce99..fc04741ca1 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -159,24 +159,23 @@ static void vgic_mmio_write_target(struct vcpu *vcpu,
     for ( i =3D 0; i < len; i++ )
     {
         struct vgic_irq *irq =3D vgic_get_irq(vcpu->domain, NULL, intid + =
i);
+        struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
=20
-        spin_lock_irqsave(&irq->irq_lock, flags);
+        spin_lock_irqsave(&desc->lock, flags);
+        spin_lock(&irq->irq_lock);
=20
         irq->targets =3D (val >> (i * 8)) & cpu_mask;
         if ( irq->targets )
         {
             irq->target_vcpu =3D vcpu->domain->vcpu[ffs(irq->targets) - 1]=
;
             if ( irq->hw )
-            {
-                struct irq_desc *desc =3D irq_to_desc(irq->hwintid);
-
                 irq_set_affinity(desc, cpumask_of(irq->target_vcpu->proces=
sor));
-            }
         }
         else
             irq->target_vcpu =3D NULL;
=20
-        spin_unlock_irqrestore(&irq->irq_lock, flags);
+        spin_unlock(&irq->irq_lock);
+        spin_unlock_irqrestore(&desc->lock, flags);
         vgic_put_irq(vcpu->domain, irq);
     }
 }
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 84212bbefe..663fa16995 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -815,22 +815,27 @@ void arch_move_irqs(struct vcpu *v)
     {
         struct vgic_irq *irq =3D vgic_get_irq(d, NULL, i + VGIC_NR_PRIVATE=
_IRQS);
         unsigned long flags;
+        irq_desc_t *desc;
=20
         if ( !irq )
             continue;
=20
-        spin_lock_irqsave(&irq->irq_lock, flags);
-
-        /* Only hardware mapped vIRQs that are targeting this vCPU. */
-        if ( irq->hw && irq->target_vcpu =3D=3D v)
+        if ( !irq->hw )
         {
-            irq_desc_t *desc =3D irq_to_desc(irq->hwintid);
+            vgic_put_irq(d, irq);
+            continue;
+        }
=20
+        desc =3D irq_to_desc(irq->hwintid);
+        spin_lock_irqsave(&desc->lock, flags);
+        spin_lock(&irq->irq_lock);
+
+        /* Only hardware mapped vIRQs that are targeting this vCPU. */
+        if ( irq->target_vcpu =3D=3D v )
             irq_set_affinity(desc, cpumask_of(v->processor));
-        }
=20
-        spin_unlock_irqrestore(&irq->irq_lock, flags);
-        vgic_put_irq(d, irq);
+        spin_unlock(&irq->irq_lock);
+        spin_unlock_irqrestore(&desc->lock, flags);
     }
 }
=20
--=20
2.56.0

