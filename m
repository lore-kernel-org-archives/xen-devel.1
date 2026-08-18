Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A1C5DF82
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393696.1632513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUp-0007fP-GW; Tue, 18 Aug 2026 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393696.1632513; Tue, 18 Aug 2026 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUp-0007fI-Cc; Tue, 18 Aug 2026 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1393696;
 Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUn-0007em-OC
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUm-008KNP-J7
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-14
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:32 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:32 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVUPR03MB11425.eurprd03.prod.outlook.com
 (2603:10a6:150:362::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:48:29 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:48:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmNnfxlASyYfuFq2Jjy/pHdGvrRZFQiBZnLXGTUBPpEq1oyrwh5qQa840qCcGvrIUfCRtUBFyJnw1sKdjvqKudR22plGlp11Tk7eZuYZIeqrJWzBIMDOSMok8+hwPbhGE9dnCyKqnkWSAUWpe6t7iTzokSj1nV0S6Ww7odwW+J6TMJgmuG7ilVDZcFMcbTWr6fxYVU09zEWSxsHHQeTSs0YX8Jgas/HGYZq3KBRWY172oJGiOtDYtdwnAMeFaeRS/B8rKV5nvyEdWYTRKnEcYWcN4yBaGF4YfJW5YEsYMSlp+G++10SZVYC9sfFgnfwe9UetQuj7UjH6C5px4uyMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlCHG3dFyvpQr7rVjU5xIUeB5UufTD6urFGufhnw+fw=;
 b=GHZZXYsCXi8sk9pKt1i1GYb3tYLkFBDwF6rS8JCumUbYszoJb8H9/5Qe0vlBHMViaepdxRlGFuGYURXwvQf67raI+eUgVXaUJopZ1QUrOLNf1vx57dhRbBClqW4CZY/Z00fWHF3k+uSuAXtifwrweVTsFCPBrCCZWqE7mENpp/F7mybSlat3wXf62pX1oxd2MrTm5kb3r21jyyKJuU5SBKMWKClJ15CmZQ+f98XryO6+86fs4hcnxK8+efdld/skedU6i9IKC65S+0lthO8thJDYU9H9m43bS+/mgabiY6eYvVMF32MihtlIBsJX+eSwB9PNqxVginH95gPkz0RU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlCHG3dFyvpQr7rVjU5xIUeB5UufTD6urFGufhnw+fw=;
 b=Fw7o+tqIS9lw/1RL1vz7DfmbkRGIuX5oIAjfHNFhmbGZbIHc5ekPwTSKAgK3r4JJ+QGySN3rVAgfp86FeptFK2Jjnkam6AeMNo6ka3mN3QnviiEJe3tFnefs1H8Kz+yTpdz2bJTe9FQHwhUqrcjEFge/9PdYxOGnfas4zzm9da02Xr4IjY99yuqN9DCvPdLbjG0b8lPdqw08ZdwSs98WqWiBo8+UhIKiNw97cETT8+dPUQ8E7/a/7lV7TWG9vaTX37Jb2s8NchVN5CLh+ZnKXJ07OVhSxjDeF46Xb4tDbzvCFnKbl84/bFo1QovqbXRaU7AXBCMqf6dKiabs52aFTg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 1/6] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v9 1/6] arm/irq: Keep track of irq affinities
Thread-Index: AQHdLu5XGAg8SJKpeEauVTuKn5PLYA==
Date: Tue, 18 Aug 2026 08:48:29 +0000
Message-ID:
 <46f51acfd3afed96499e1ad6388d7c6005375911.1787042017.git.mykyta_poturai@epam.com>
References: <cover.1787042017.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1787042017.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVUPR03MB11425:EE_
x-ms-office365-filtering-correlation-id: 046705ea-af75-45a7-7d69-08defd0579ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 zuB6n8qbvSSambOgJmn3YmGiv60AUfXm9xEAeOCKt1WRllSD69vbFp4CtjUy7eWY9Ku39OXcl6pQGI9cUPQ8iAeVTqHKjVhsJxkyPCqyEtezYyr6ykGB5Qrmsy55/0k9jLADJypKqE49N8n87ujvmaYsQOm7+xoCEUpRusrndtHRwjqZVduMltP5lBp4JGb9xt7gYtHLpeYWRf0KkG1j6hzrowK+MXX9LZs3XiLblUTAJG7sxwd+NVefkxoC7PAdm9Rnnlo35/TDXJFFcXExfvpDUXjvD+7dzEWJkFigmlzwj+KsKHIsks7Mg4ehov3KJaJnxdBms6hgh53VzvBBkZwF3uOEnmZX04+5iTdlM3R9n5REaqZk6+hiv1rq95fm0k7y6Hq3IRyWAAeWkEh8cWwyVm4s258kxx3ScGG4n8MiXMfdvyYV63bSUiBZJlLk6PAYtSQ1oqWXapfyD1wIO8RfjqM/vo+xOC2+zrxrWCbIK+DhNKbE8OEf+SxacwB8ewY7JDLYgNCxtcAh8Q7WuPd8qi4WtLuHO1xnL+9jG0mpZ8gsuJh35HK2x21ObceiiUjWE5CulnRb2nwqJogHXkJj5r9zSDKkCh7ep3KMfO8jXKe4w6iwbpcTxmAXnHzn6CdYrjyHiFQ2QpFji5EESlTpwGkvaLYQ8jEA9UwDVUWjneR8fhEIdU21srO6Bt/IJ7OzrNHWqQZmerpf8aRBV+vA4wZna8bClm/y5pt+A7Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?R4WmY+zsjKzBHCtR4Zn7bAOWDtQMDtxZpUTZw5yYFGI86oMMRBINzC5eKg?=
 =?iso-8859-1?Q?3RS/1Lbm/EosOiaxUhsUQoml3RcqRWRQK4cTnZz4UbmAvbgg/YW096hU2i?=
 =?iso-8859-1?Q?p6Tf8PWpIc28VVABFxmoW15mu7R1SDcQfuTKXtfGSaWvAJaPOw2JUidc+S?=
 =?iso-8859-1?Q?aVNLC1usFhLwBqRdTnhYc4sAh8HP1qYQ/L7fkrWYszaR9Hx9ohLAUp0G9k?=
 =?iso-8859-1?Q?43GQJ05ojIAcfCMBGewFwcXYlNUCHXsvmQayxxV3YYReN1SXeQ4qlrrpLO?=
 =?iso-8859-1?Q?LiYb1NeJc3rQQRZjoJd6tRXTS2p7eS952E2MjfR9c30LSdpFXRX2dY1g9E?=
 =?iso-8859-1?Q?V1HGOfD7upNOzsjanWoI4Sbe9O6RdvSXAuTsnizehLpJ3HHdzUC0lFlPQF?=
 =?iso-8859-1?Q?t4CUFJe3dvYADXoMXTvIQyM1YQPrPDvwg/CfHfRHvBUTQ5ykLwkEs0XX4y?=
 =?iso-8859-1?Q?ZCfG4gRzsqawyfPbIRyG/sTEuX4B/MYqHiRqbBbFQ+dQSh73ddRJCWHV5+?=
 =?iso-8859-1?Q?MhsPUmaIDXbzcIEKrTylcMXhSa16cJGMyyFnnno/ige9xWIyN6MllUV7JY?=
 =?iso-8859-1?Q?DJ7O7DVuEWh/kd923TY0qZjs63QYBawtG+CeFlb3uQV/L0fG1/sIV16sd6?=
 =?iso-8859-1?Q?KR/g6N37qHZa2vASqSdyefeJkheaLTF2D7VWXNv+5/Cw9l4mLW9tQ5iJQH?=
 =?iso-8859-1?Q?nbUCZqsPCzExg63sjXASAd8bG3NPOsYOk7i5BFks/e+s2m7B1t6ud7A42F?=
 =?iso-8859-1?Q?N2t64oBy25tUmpJNFB9Vdjx00PsHrUzEMTgpFC7xiGIzp0bYzcQ6L8Pmcu?=
 =?iso-8859-1?Q?gcsE3R5COJcUOqmPYxdHScua1h6j+9vQbXxZv15MBuYxcUptegFw/JVzdg?=
 =?iso-8859-1?Q?baFagX2D4y1Vhup5y1/3tPW/FQq5iPaorb2H84Zbi1t8FPQ88AOBawegKS?=
 =?iso-8859-1?Q?IK2Me5YDvBkGLzPjxJoPtmQuKW9k68pujBMxiJwKTfxatWpuzEs5O918G0?=
 =?iso-8859-1?Q?OQYKJe1+gHe0tUCin29ssRMJ2M8GGpSqSJDa3ujaarr5/G+JsXRfKRcDZb?=
 =?iso-8859-1?Q?kUooODg/DIyoUaPjeLkfrO1z+mATt9y8grWUp41Jy9EwC904ZKMJZkzcHo?=
 =?iso-8859-1?Q?FzvVmjqa6R2FETUea5Ziejo757VHKFXncNT6hs7olX+nrZ/lt9zYZFPdQ8?=
 =?iso-8859-1?Q?PvadkS/ORgYgyi0tBLgJS6ilZxac81kHSafqFlnyqebh75aXRIL262CqYC?=
 =?iso-8859-1?Q?5DJCBUGGOgsKV9GW366xiarwv7EyiAZXbZv7ZJIf7uMHWuFXuWglLr5jio?=
 =?iso-8859-1?Q?+NrvCIq8DKjnT3m0uZ+wChuDzXk5lusi5+1zzHU7h2N/eyPXMov6jWsMy0?=
 =?iso-8859-1?Q?0Xd/UrKmENRpCQbu2dFtbxpZXSCg40rbV3BYK7kzzDnJ008SWyQKZ1qO40?=
 =?iso-8859-1?Q?luGhzq8VzUN4rtGGl3KzGrVIzSJXYov/rG/HCRrLDh7NVE09O2BjT+9Aln?=
 =?iso-8859-1?Q?xNvtJe0fMrsyzIxA105RiyAS9+GXcbcF6KLdfF/iDNAxkrHL3w17biJwd1?=
 =?iso-8859-1?Q?CKWTaWuHCjMAkHIvf3qn5pDZOVfAXSua496I0sN2NKPu4au/gIg6wZruPJ?=
 =?iso-8859-1?Q?GJEuHYO+tdy+7Db5N/tTkDwZyHIZpifPUwjOa2yd5D7DNVRphQ722+95/G?=
 =?iso-8859-1?Q?UeKw9cuZzUnmPknG65yXvxv00lsAsayrNW2vOUMyjl61k3Nlmv+gJ6MTSG?=
 =?iso-8859-1?Q?fVZaFutvBXThI0Sqh4r+axtIXb5OY2efcuFOgIbOrMz1lKmr2afNXdLnFN?=
 =?iso-8859-1?Q?H0fngIng3uj/IoxoVjqlGUDeCyJnIMY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046705ea-af75-45a7-7d69-08defd0579ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:29.4938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIgKR14UjhzweAIabq2UcL5CUZXGRqhCiz1h3JWfIg/AFFH9Kff8ZgBSYXk/O3vBpBWJgiT545ic8bxCf3DSwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042912-66AB52AC-BB66A04E/0/0
X-purgate-type: clean
X-purgate-size: 7541

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
index 73e58a5108..7204bc2b68 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -216,10 +216,15 @@ static inline struct domain *irq_get_domain(struct ir=
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
index e5aca17dcb..7a87bc2c7b 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -450,7 +450,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
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
@@ -458,7 +460,9 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
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
@@ -478,6 +482,7 @@ void arch_move_irqs(struct vcpu *v)
     struct domain *d =3D v->domain;
     struct pending_irq *p;
     struct vcpu *v_target;
+    unsigned long flags;
     int i;
=20
     /*
@@ -499,7 +504,13 @@ void arch_move_irqs(struct vcpu *v)
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
@@ -579,8 +590,8 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsig=
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
@@ -949,4 +960,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, u=
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
index b2c0e1873a..1c44236c4f 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -812,22 +812,27 @@ void arch_move_irqs(struct vcpu *v)
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

