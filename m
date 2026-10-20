Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141D606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=mZ7wX9Io
Received: from list by lists.xenproject.org with outflank-mailman.1455216.1668792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Js-0001HA-36; Tue, 20 Oct 2026 09:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455216.1668792; Tue, 20 Oct 2026 09:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jr-0001Gw-UY; Tue, 20 Oct 2026 09:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1455216;
 Tue, 20 Oct 2026 09:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xJ6Jr-0001Fp-As
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jq-00225F-Ns
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-2eae-0a2a0a5409dd-0a2a4503a702-0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:42 +0200
Received: from [52.101.66.96]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-fae8-0a2a45030019-346542601808-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:42 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8671.eurprd03.prod.outlook.com
 (2603:10a6:10:3eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:32 +0000
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
 b=CmGz+Agh10uRR4CpcLv9nwevAxuqH0SL/JO2TOVFDRNvyjXgszCdLq6+WvcvbYwRhUmz1a54WJBB92rFaLyQKav3ctNpOaTb/SFy3VocWaZ0eXZbRj/zPGDjiy59jA3/FHW6W+K5ZZkRmoYqpVVH0ffZf7xwBhQkVc5kZ0vH0ex1P045dywR3EJasuFYcEgMcKH4V3bcyjCiyRRtE8KAZb1q7QTyAAj0a5wca+PLkIZUxqaNH8i5ORfkUWauR1SdVztV4YNZ8TdMasA3S6clCAQMNuZsMm/J5XO0Z/b4JIlgtHZlBIOhXls5UWKi83QcOmtQmzyJHLj0ywLhe8wZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkFW2/HddsDstyO/MREni/S0PHm4etAIWuTqD5hYt5E=;
 b=IX2HxTAx3IWHD870xzH79u36Nh/f5TTOZyyUcZJVqVKTsSovTnGuAJHBk8zPjwiTQ9F2n/k28MlPdBN659z7WKPTrSjqMp1JLaevrPNKFYm4+aDAXDvQloGML7n0wLZw/iTvrSKqh6BnTwhjCccqBDJFhEOHKjcnzhWFQcAXp8gahCpGXsKNLyH8IJVxc7K9e1uT7kI0kMbtZPK29f+8j+lyq7r1drzd6uKRS8vZLRd3UXw+2tQfDXW/Jc1bwqe9NUomGYxIzTvK+Y/swuIHZh/iGdeIaVU6/U4Do9y20muy2zHz/7T9lk5eOd3K+IXxvLIciKEA5mGLhE6G2Ly/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkFW2/HddsDstyO/MREni/S0PHm4etAIWuTqD5hYt5E=;
 b=mZ7wX9IowJGh7RxLkT+1oW1vLpsaeH9TmIEVwjK+LWpDb6AKVnqCFQi1wqBhdIzZbvDKufG3/8fUDsklauv+ij9ByX1sBf8uqVhR8ijD2Zpj7lGTypfZFKzfRNX/cbir1dr8dCy1P9dDScoLvR6lwdOke1ieR3Hu9r02X1W1IgYfBFIMGSuRYU+z3ww9xpKBw4KVYiGuGeF2CmRoLK75y1JMfIRjKlYUKQ09tb9asDUUNBC+boCAMLjFMktlVk3ZJWODUe2gzJ7k7FjpvokbS1W9g+7IWTZWhnM+yw5sa76wuBrI/3XxtiAZ4z50HagAOiKZ1bIFnBEzdljRmkVwiw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 2/6] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v10 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdYHbolVxSCaRf0E6Y0uINqp/GGw==
Date: Tue, 20 Oct 2026 09:39:30 +0000
Message-ID:
 <3a880578d558388ab6d033ccc1f89aa4efecdc81.1792480416.git.mykyta_poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8671:EE_
x-ms-office365-filtering-correlation-id: 779ebdd2-1b68-4d6f-d10d-08df2e8e0bb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|10067099003|22082099003|11063799006|38070700021|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 djjNPdOwqfWnPuQTjkwTiTA8fosmJw/NUY7u+EdpYJLdMZBVHlXPvSWBugTfHsCgtnHGNbIgZV34VVFd9xLKm7RThEOhLWzB7JLGjdMtvc8PGpjQb4ARKUFEkvZonE7+XjfLcPxykseryO8QC+jt0I3alAJkxy+91lbaz0nATnpHWQk1i9o3Kb9ZnnBywEYStq+Z1JXtY6l1nCMY3/IxO6Zp01tXEDnxOPkjU98s1Pn1Epe6lomCGYd7j8+Zh8K1yTkkCf3FNjvqL52IognT2QQGRE0Yq3yw/ruifvmPVvrQJKa0c50KXoedt7UTCTkRyegZRaxo2eXx9JYVWfu6DrcOp5kpSLuarzUewz2zP28J9vOe0+7w4X+wXfgr1UJUh1xLGSK0FlTIR9In2qKqFWJfP+tfAHGtkG/KmOCikVClJnujwwP/aI0XoarUec4vhtyzVYwai8ChDZA/xRs8QfbF+qfPVtrZCrkbqAvOx7vQnMKzLu9eKCxwPjUFXjBCMRJINCdkqfrWVTUqqi63bjbc5v2JbMSOqJ6p3RbuKahHWlKNCgS9DKLjwfOqK/0z91OXusAeR3yZg+lkhitUxDeAYFNSGlUYornTYbqKNqMyKL6SVxuPklU3ZO2bVKn7STDwrHLjFdld2JLb1R9Y+GW97QQtN2l5W5zC4vCLQHZjHmfTKWGuJMinUkGX4n1c0rFeA92diX0mFgLTq/Z5wYCn1vbGucbxDwif6yQOFVA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(10067099003)(22082099003)(11063799006)(38070700021)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lH/VJdqN7JKwon0xNFj0kOoP5AeBQdSsqWze+bEesj47QDYfPMtLwPUys1?=
 =?iso-8859-1?Q?aRANrzd9TLP5SQVuLlXt1azFvOOn34AcebfW/jsJKcWTY6SFVBNT5FwPn3?=
 =?iso-8859-1?Q?8itjABvSVTIzKjO/Ys74Zlt2hn7CUD/SweD9oqUgnaEfcf8Idin3cXr8WC?=
 =?iso-8859-1?Q?J/OAK8MNcBvRVigV8HVMQjxFj7iiNeHy88TxigPAkI12mYoVBDwTvLIEW8?=
 =?iso-8859-1?Q?H5VNln+aaAMNwJ6G9JC2VgBN87dxrQcHwIyQx/Ouqg+ooAbjB7c2m4ZNpd?=
 =?iso-8859-1?Q?5DFdfqp4nOrcY9vfCIaGd90SHO3TEEsKA9G62ZqeN/HiJYWh+6I9BNR7db?=
 =?iso-8859-1?Q?wGmZLe/12PTGOzubZjHtnqnLKh5+LmezYDB2cBOy/Vcjjn7AFzQTd5ncIe?=
 =?iso-8859-1?Q?hXY1Zhgs67tFJ4E2jX40umO3ycXRgOtpO15th7IL1pZTPqv47c36TsK4gJ?=
 =?iso-8859-1?Q?ER8UivO1P+tUUiJlKthU4twm8nrxMditgjmAD2e4uXv8ayolBiBufyT8ep?=
 =?iso-8859-1?Q?EUgrgzTgkcFDObPwXp4GEpUrV6Njp/TsLl2JZiNL4s1TlFCF3MniHd7wSd?=
 =?iso-8859-1?Q?Rh6QIoofI0lJKo7b/TZoxUQwxcOKg9/jgJ4lQc9lZK/s1ywCY3joPBr0Uz?=
 =?iso-8859-1?Q?qIepWjhvFbXHP+sngVaGWBV+FsI7DOnMK/pFulADnBHhf8cXhPW+kKI8Dh?=
 =?iso-8859-1?Q?/4tPBUDeqvOaM3O3juLdbU4S07eAT3nw73Uvo96pkF+LSIlQ96EE/btJ7t?=
 =?iso-8859-1?Q?YeW89wpsQr/3Ij775sUd0hPB2SItxoMIihTpqaN+INjZ/Rqsslv2GIyW+5?=
 =?iso-8859-1?Q?d9CQ/9/Rd+ui0E6X7rxZKoB7CLgDUv7VfWSxiVu+x+ZH6CjyoQKNQl5MlU?=
 =?iso-8859-1?Q?hdqpLZHaxnpsdN5caqyGq++/DdqJsO18yjUhCH/kn1T/h5TnrpL/KqqWmj?=
 =?iso-8859-1?Q?AubHhgSHVaPhuwfIKkEtU06USJ3OiGwUjRTcTBhEQIz9HPdHV0SHPGMxZn?=
 =?iso-8859-1?Q?42PNA83F9zjD5kXkszE84QWlvtgwyW82Y/vOcb6UgTR8wAElHegTYM7VLj?=
 =?iso-8859-1?Q?sKS51amFDuK+PD9WVc65c8yZp+/7/mPR5VgpZsbicas3Up1kdkJxvwuI5B?=
 =?iso-8859-1?Q?rA5yO4wyuKXmH+I/5CVza7KsQNbpvGtidN3vfZjkX3X5R23XhJQGLrn/3P?=
 =?iso-8859-1?Q?1U8R7SftJiA4uNyoDBqWz5bM62TtlwBJW4KfSqgOCy0VXipi2eClaOUP3f?=
 =?iso-8859-1?Q?6V4bTZaCLLXpxKYoEoYZAtCY4vSpTGU2XxKj1ilE8nyVnQCa+mVKnr7v2I?=
 =?iso-8859-1?Q?7SDSPNMmGPOYzkiyKkMyjQy+2E6E6NUs8Tw6TFXVHw+jd2aAeMjh12hq0E?=
 =?iso-8859-1?Q?7zV2DqrfXfZmGQhOke7Sxj0BxH2PdkcwkubKPNcAAuP+3niCmuuhpQMD7r?=
 =?iso-8859-1?Q?jT6dNkZRQW+m1HN6Rv8mJVW+5+Odq5xdVXO9BUkMrsw2ueTT2WKShe15OR?=
 =?iso-8859-1?Q?zQCRquOBf9rS7Q4F/zRW+C6SpNXyQq3wKonTElouEbq0cvaeGdLKmVIfAs?=
 =?iso-8859-1?Q?cG58vKwTxg7ZH14Jr1Cf9VZTfp5dIcAkWB9TKqZjWwpiDER+RPNLjLoDAl?=
 =?iso-8859-1?Q?JTQhGM8sm8XNyBCJ8mAjwEcCcX4vMjZAdTQqZ6kii4Fh12c+adZX+lJCNH?=
 =?iso-8859-1?Q?kxiymHiPY6zkCUlUQzQEhpeZCC+Wt12dQDdB+eL7kdCDhR+hLOW91qNM+A?=
 =?iso-8859-1?Q?ye1ELlWLNGLvAtpl6Upe5bfWzDjtEq0c1UHUUvh4svHUV5vdnW9l/EZT0a?=
 =?iso-8859-1?Q?iAiY+arCZg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779ebdd2-1b68-4d6f-d10d-08df2e8e0bb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:30.8548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6fuf6yNDXz83HUqX9Y7B/05MBEkOdi9ucP9b49npt6sJzOJ2fl1RE49/HAtpdvbMtVW7Yf2EBFM0BJYE4CRf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8671
X-purgate-ID: tlsNG-33051d/1792489182-7488A4E9-E1D0BADF/0/0
X-purgate-type: clean
X-purgate-size: 3865
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move IRQs from dying CPU to the online ones when a CPU is getting
offlined. When onlining, rebalance all IRQs in a round-robin fashion.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v9->v10:
* make cpu_next static to balance_irq
* move the offline path to the CPU_DEAD notifier
* make rebalance_irqs static

v8->v9:
* replace CONFIG_CPU_HOTPLUG with CONFIG_CPU_ONLINE_OFFLINE

v7->v8:
* check only existings ESPIs

v6->v7:
* replace ifdef with IS_ENABLED

v5->v6:
* don't do any balancing on boot
* only do balancing when cpu hotplug is enabled

v4->v5:
* handle CPU onlining as well
* more comments
* fix crash when ESPI is disabled
* don't assume CPU 0 is a boot CPU
* use insigned int for irq number
* remove assumption that all irqs a bound to CPU 0 by default from the
  commit message

v3->v4:
* patch introduced
---
 xen/arch/arm/irq.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 594aaedd22..d5145a4723 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -166,6 +166,58 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+static void balance_irq(int irq, unsigned int from, bool up)
+{
+    static int cpu_next;
+    struct irq_desc *desc =3D irq_to_desc(irq);
+    unsigned long flags;
+
+    ASSERT(!cpumask_empty(&cpu_online_map));
+
+    spin_lock_irqsave(&desc->lock, flags);
+    if ( likely(!desc->action) )
+        goto out;
+
+    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
+                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
+        goto out;
+
+    /*
+     * Setting affinity to a mask of multiple CPUs causes the GIC drivers =
to
+     * select one CPU from that mask. If the dying CPU was included in the=
 IRQ's
+     * affinity mask, we cannot determine exactly which CPU the interrupt =
is
+     * currently routed to, as GIC drivers lack a concrete get_affinity AP=
I. So
+     * to be safe we must reroute it to a new, definitely online, CPU. In =
the
+     * case of CPU going down, we move only the interrupt that could resid=
e on
+     * it. Otherwise, we rearrange all interrupts in a round-robin fashion=
.
+     */
+    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
+        goto out;
+
+    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
+    irq_set_affinity(desc, cpumask_of(cpu_next));
+
+out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+}
+
+static void rebalance_irqs(unsigned int from, bool up)
+{
+    int irq;
+
+    if ( cpumask_empty(&cpu_online_map) )
+        return;
+
+    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
+        balance_irq(irq, from, up);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_BASE_INTID + gic_number_espi=
s();
+          irq++ )
+        balance_irq(irq, from, up);
+#endif
+}
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -180,6 +232,15 @@ static int cpu_callback(struct notifier_block *nfb, un=
signed long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_ONLINE:
+        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) &&
+             system_state >=3D SYS_STATE_active )
+            rebalance_irqs(cpu, true);
+        break;
+    case CPU_DEAD:
+        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+            rebalance_irqs(cpu, false);
+        break;
     }
=20
     return notifier_from_errno(rc);
--=20
2.55.0

