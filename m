Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7860A3826
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=bLxUrUEr
Received: from list by lists.xenproject.org with outflank-mailman.1455214.1668773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jl-0000lG-Bt; Tue, 20 Oct 2026 09:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455214.1668773; Tue, 20 Oct 2026 09:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jl-0000l9-98; Tue, 20 Oct 2026 09:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1455214;
 Tue, 20 Oct 2026 09:39:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xJ6Jk-0000kg-89
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jj-00225F-LB
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736d6-2eae-0a2a0a5409dd-0a2a450882cc-2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:35 +0200
Received: from [52.101.83.127]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736d7-f659-0a2a45080019-3465537fb3bd-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:35 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV2PR03MB8750.eurprd03.prod.outlook.com
 (2603:10a6:150:ab::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:30 +0000
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
 b=Sub0qD6tLH5BcfaUcWApBX2667l47BmJ0pUhwAxyr4mYnbMLU/qFcsny0HsnCFpeQNKlPzmU0Akarr0JwWjzuwT/hwKNSNR8rPq1Xg0TuaYfei7cd/5SrMDRpE68d9nOM809svfTHmIxDddYr8Ixj0FgPMbNDRNr86LjelYvSWDeuPFh3F+eNl5yYHySKnyom4wXOhhzL6l4uZLHpyV+RJNrs0iJSefhTdnDfIBbp+CWmlh3tjYsjfjdQsWSJagM7hMSTH2/smkJZw5nagneUsNRpjbNKCLlM9BTBEKDzQW0V2LyTCrp93/aS0PUbti/64xEdq1943UOBxkfR4FRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdTcdhGeUFmFSGj+TanNgCix0RM6shODJJfkVdvycEY=;
 b=nG5fY7CQcHk1wMVEEu8Ty7NjlJTbRHp9E5+bAnTFJJzNDhFWKcg/tKeHhNruC5Aecx6lUA9LVJzL78n+9mmEtgXo01t6wQkY8vdqEnmHVJWheXDcMqMQWzDfa4RxWJYJIJC0qBH32StnyjkuxzEA4J0xEg67Ej/UsHHe1s6uCsUd1EC5TBvEMY8MROdC6lG2mZ01tD3sydM3iIwVP2WiXCssLg9pNR6UKS8Rg+AdEeQcxqT1EAlr2ZSYPIE2d+7LiLWsbuFSWj8OoAPWZOV0S96WDQp+x4kCAOmVPEKOzcb+lSRLsbZT/+qFRtPymErjcIF5h1Kl4l2JO0BCnsmYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdTcdhGeUFmFSGj+TanNgCix0RM6shODJJfkVdvycEY=;
 b=bLxUrUEriVMOSdjzdZixLNZuJzzhsNR4rbefgL9QtM/WHQecJgKhYrWVXoAy8AckhSSVPGoIyx/SrPYpwqQzmlI9Zhw821vlQUZRMn6l0OAxcAO0xVyUmMi+F5odYTEj6zlbyOTzFlhccGsVi7Y9jN6GfEM4Dkl/yJujRwbubb3rGLBHExI13MuSNP+M7out4A0cEztLv/P2/nWIoSDQ1chi1hoVMk0MfgymN8sfY/b4MqZb9N9ljv96UF5ueSIxtQxvVdbqheYfd1p6pKQ+jiwvFa4LwJTbbLm59lYgeiWkNS+9tBBJgX/pE3X8hYmKiJFbEnrNmfjPmTdlPtRa6A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 1/6] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v10 1/6] arm/irq: Keep track of irq affinities
Thread-Index: AQHdYHbnTjLdfq2txEihb/QFQv2VIw==
Date: Tue, 20 Oct 2026 09:39:30 +0000
Message-ID:
 <27ccdfb942a02de88bc0d384de899da229622366.1792480416.git.mykyta_poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV2PR03MB8750:EE_
x-ms-office365-filtering-correlation-id: 4ebfebe6-d313-483c-7979-08df2e8e0a9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 Kxcr3nRWfGgOPNtShxUoTQPm1O9e+bZQJgfsJIi69UtMLWj5e3A6+aluBfF2XFdk9zHwtppiQxPvq8aBTZm1uTQs2mmcQ3sXUdSATOr/ACAedbzk8Z2nMMKrvvksBYVaqyH2jdBRHvbQykkusVs4F/FRWKBruTdSVt2I5bePHigmrdqfdXc4NyHcl99X6nraIIw6r0YPMwjvuoSqiHVR2sd71nn2y/XDxI+084ACB/BLsAh2RlSJTBXRrtZ1KU3s3WVQSto4MV/7/3DaMzUPxubHWmzHYuo3GmEK23cJaLrmebhCNXMcGuXIfW9+yfMklF7t86T62yt/+vJLk/o/GZo99KK9Dq5F/R/HDqzD6+153WoJ+eG31V8xsY+N/7RCh16xRO1swE29eJBB7jKOIZyUjlTjpCRijHVq9/5O8gx2LfohjMvaj0e2RFMrOFyEAP7ODagPDHKF/OtwXXUNg5N0Z1q9R1Fv71MKS6h0d4YWcH7reJvYUSUreFIF20gsipLfJ1QlMqTaJb+MuM8IsuutMtKUjXwiKjPq30a3kjqjK58nlMTs8zrWJWaw41HFyq8FhxE79QS7z+5Za24o2Ie1pWrYdO/KoYbyl9yFI6NvMpQ7ZUEw4F3tJuta40I6s8YsKHfCgBfkRFHKde4LgoQ/kOKMpJeRIMvvwvXCtTn63XQ4dKq/qIKmIdZpFAkjYqkSSjc6w98xEqxp0uKiYZYfPtpC9X4kl19Da4S+8JA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fUq9oCuUeDUBVhsDKCFHPNKKivC7bjVM4zoK9iF4mnd+WUEN5LXoaopnN9?=
 =?iso-8859-1?Q?NPzIBTq1JOziHqovMcWZO7Byu3ICS2Tqdp/LCz874QTd3kKMQmgs5D197y?=
 =?iso-8859-1?Q?lhVbpWHgkot3B7seNu+18zTGdiz4Yh932yuBlNuRNMsOhkp820Iix/mKIl?=
 =?iso-8859-1?Q?yKzmgC13BvthRr5Md1SfvZpAYeVEbLLZnAu6vAXpFHltNcNf/IkpYjeS2q?=
 =?iso-8859-1?Q?xUj4YBDnLgF5fELhDeXmuVisfOeXqqqbFQtqwA404k596QZbmFyQsQQoNs?=
 =?iso-8859-1?Q?lt2Gw2h9+QtGlTwwfgI13hdiPiOgOAAau2+bvusrUAS0AJLlFuY96/gdDu?=
 =?iso-8859-1?Q?b5qy7o0UmZ8kkIlSZzJg4zLoOAoCEpLbB1Cckdmc9dhPH3dTgOyAbnu/Dw?=
 =?iso-8859-1?Q?pHWZUdTtZ1QhOfo1EfKSlHqDg0v2p3urxXqNxuGXiR/BaKTQFQvFpOkpGL?=
 =?iso-8859-1?Q?fEgIIiLPPcBnmWoOB+fRYxbCYQGFldl/chVGH99rkITlCzcsTBcmVgq6qe?=
 =?iso-8859-1?Q?Y+XnVS7ju+jmDeXipxti678Gig0ZC9kGktWsZL3mtcmLMnDgUdsvi/ckp0?=
 =?iso-8859-1?Q?RXqZK+bcOniffaFoVRRCcxR8hL1eDXunKPPPXX8Nv+TlWy/ioDeSkljkCU?=
 =?iso-8859-1?Q?DpC84yiwPc2Bqbk3WRwBFZzOzgUtOJ96Aq8HYWrr3eKGjS+xtk57nRWnA7?=
 =?iso-8859-1?Q?lBVN4CqW7kIFwX8X3rUeWB9D4H1rsvJHkektwtBkfgv/+U0ZjkiapvVD/b?=
 =?iso-8859-1?Q?PC2q4cnY+rM+XRIP7Uo+8OutMR06vLqqGXbk7daSziccg9emAqCcskTyRC?=
 =?iso-8859-1?Q?UaYZ3F4+jN/XnUBj7ZQYa1trprtxlG1HP3LKeOF/pAz9nel9Atm9gbbrr7?=
 =?iso-8859-1?Q?+rPP3PO9FGAStl+9Sr3YSDX6lFt+ZSwUkDq/M8DR1oNk3P+hWzjnQ35hfr?=
 =?iso-8859-1?Q?Sw92CpziIo5WpzDBE5QzixUvYPjo9S6YWqIXk9xuFQO91kYRsjElByl5g7?=
 =?iso-8859-1?Q?Sd/ZAPtUkvxnyqhG9AG7be8Ue19tsPddzVBhcFl1lh4I5RxDxGjIHOZWPG?=
 =?iso-8859-1?Q?R9Cea3JRGjPOjpSFX3uNu3lZFDY2b75b6y7eaL8lESGF/wRzfwGGb+lh9/?=
 =?iso-8859-1?Q?MMb/BYVd73W8rU9fXIB5Fwg8Shoihwm3VyQXA5k8to/NuyNEZjBkLOILAl?=
 =?iso-8859-1?Q?FWwjTY2tbzSEbKN8eyKC0JpByvu2wEXrlyk1ZpKMYaelNyBuo/6kEbhRa8?=
 =?iso-8859-1?Q?1FGfLmEMN1ScNdByB9oPXoCtQgDRhnqJ7jJTxopOf8F+PG+HQbILP5585f?=
 =?iso-8859-1?Q?T+3BshLnP3fKXFdI1uy64aCLfeIfo5PdQj0ezYpbYguwrs7yLXfxaDG8Q/?=
 =?iso-8859-1?Q?92bCrnkPhFDYxWAKqfZ57qzAOkmW1QGfrET/OYmz/053nBH42ob3r9raJT?=
 =?iso-8859-1?Q?e/VQjDAtBCpMCcczzkjHraq69mQF9cImZlPbtBcQ3SDauYumSXWLg4Pw65?=
 =?iso-8859-1?Q?9xWH8FfYhr251s6JRnEe/lQFki7pi8su3hkKTmj7SqEDd4cbs9tP3B2M54?=
 =?iso-8859-1?Q?84Djwxi8zxbTAcZyL7GZCZN6xZiSM4Ts/tyeo9QASyLoV/pjT467c2lJyt?=
 =?iso-8859-1?Q?Ib3lTff8RGxqWMv2F4KmCFp8z0WXQT59cdZWXbQhmp5VJrMi3rKSA19Gp3?=
 =?iso-8859-1?Q?4SkHXMZym+Mh/62M6LXTH775gWmIQTz5P3HD94kTUCh5BQ1AZNo0jntmvr?=
 =?iso-8859-1?Q?HjA9mnys3iIRct1H5LRecrYMW3eHVwwHvMiyXDzwQKoABBmjS/t1+GlZSq?=
 =?iso-8859-1?Q?9qKfr8rLqQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebfebe6-d313-483c-7979-08df2e8e0a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:30.5337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: koAXXH9B85TcyX4tmN317gsHb4GyjZfB6kQ5YABwRPjX+RQh1ImVX1C07lQ7cdAHsZih4sYOg2wJL3/EOMycCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8750
X-purgate-ID: tlsNG-c1860d/1792489175-D715E87B-5518C772/0/0
X-purgate-type: clean
X-purgate-size: 7565
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
2.55.0

