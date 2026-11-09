Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A269606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=PAoeKhx7
Received: from list by lists.xenproject.org with outflank-mailman.1479830.1683731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIy-0003wp-5H; Mon, 09 Nov 2026 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479830.1683731; Mon, 09 Nov 2026 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIx-0003vc-VF; Mon, 09 Nov 2026 11:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1479830;
 Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQNIw-0003q3-Bk
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIv-003aoG-OM
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:49 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aaa3-e002-0a2a0a5209dd-0a2a4507d888-28
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:49 +0100
Received: from [52.101.83.89]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab0-b4ea-0a2a45070019-34655359e23e-5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:49 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by BESPR03MB911570.eurprd03.prod.outlook.com (2603:10a6:b10:147::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:48 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:12:48 +0000
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
 b=ZG9agdtrGxAl5R+R1FGCbKbsoI3+XvDKh4uliVAG1Pv9cBFqFeODKJp6ya0KXoDcMMRqAsTOnAJse8l+/PAroXBk9xzEbDIykLDUweZf8cwYO4qoKvgfvBZbLX3un01rtQXqxBU9d4itME3H9eeK3NuIFQfckLKeCPG7lbUoBHvCEu2lu0p8GUjiVdn2Ufagf+kP1+BJXuPfxxnPCOqtrWlFR9tPdFs0zilqW8ntZ/nB0+6oV/zKnwzXpgqIZOH0QfF+BHFncU/6795CmQYKh6M4yCvvs1ICLS7InL96G6+yRRsnmRHYMJGUiWQ+3MEBsmPzHxd3XqgVEzv9ASJb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAgG82P6VpyxfFPWD1mBEHXFFH7gOBndQxAXp8hw3A8=;
 b=Iq3xp8tHSjA5PD5tsHm0Slbwx456QxYootPjTCvZgETqgnuQSgKw679maMglK88vnhESncFpOATgk4QpK0tN7bTyy3LW04tOBVQfZQPfRxHVuCrmRTVVdGLVs+YTbv0Ge036wDozuYpuWFOD8AhtjHEforMHnPGUEKwpFptbgn8qDHKdkqT2IPMCsCfCRmUE1XTk8KGVDiqa3tTJC9eoEK5/ouv6chg7mRwbeAH9MdhnbVtLNO/DepQbkzdHB4/FJhIQzi5MXcmP6ztPc/ut//c7yFXqAfxRnyydR5rAIb4iTXNEZq0QWb+S6iLMtL271JU9C3T9hbvsvE3AoNaQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAgG82P6VpyxfFPWD1mBEHXFFH7gOBndQxAXp8hw3A8=;
 b=PAoeKhx72clfmSsT+e5Kh0wJLKhU53QvTWXC2iIHR3pP9opr48/vcnT4ycmuZ+QCVC1s6oS26nC2RQ1kkQ8I/RJtcqGTQiUAIH5YajDw6TLK9lgNJxRe1uBbgPKUNYs/WcFp5kzkKyO6BRxOIRKuiX4L+N5bVsSguZZ8+VIlXpB1eEG5EoxXvEsvSPBqmUyji1+87wcH89SZZfcg1p1Ig4YrOq9vAN+yFww7FhWDUrDob9j+5d/BK5/sW7xWbF0U+ya4wV7NV7btinmxrmyBWIVLTNs5RR9TtW8WJ8UcqCgdu6KK/rhtlB+4DPSE5iOsSBWhWejBpsgooJmyZQYf7w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 2/6] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v11 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdcDtABYwI/ppPt0GzgWxLLvu3XQ==
Date: Mon, 9 Nov 2026 11:12:48 +0000
Message-ID:
 <2a7fa3ba892364b755049763d64646d146c692c8.1794222015.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 0cdd4148-6697-4ddd-4b70-08df3e52633c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003;
x-microsoft-antispam-message-info:
 M/ioYeLeWH2NWgaZn8RY4fullVKpjLRF+OvdBCP9CIqf5G3RokMzIKaG1KVWqFi+6TNubL0Wuc0JKZzs8mvexAFoOP0llmieO0jPwtT+XdABJJKpxfNGSY54F8L8bkbpcKSE2x34JdrybnxH8s3q15iTTQv14prR62qom+6aPm7ycMqrgZUcDaSiEmwoD0dgYyovwM0YZMZ98QJx1DKwtEGBq/JRFEuRyF65i5ucHakus7Qad5PKVlDp96P4Gaxsl6wPUzhDhMEKP24BuG9v554pdKpUSVuDga906LLv89fbUflkZAjeJEB3eV8TwwfDGW/B4OlgReSNdLit2bKqKWcjVX690LRF77nbduT1mICqd24XU73naZ1VBJVnGjrRr7BMdevLeM5vOqhFR4dzD8kbfsmKRmxyGA4aoYawEcswhdOHIoGdQwyQhzuMG8GahcDTLzmzs5C3N3w0ynq0Avj32LullZUhjFTgLq9jhFfDjohJ60v2dV/UEPejMrxZzJkvwbYdK/H8eCYY16Sks9rogsA7i/2cqwWZLakVlHL9e3msT0g9NTtdUAThjS5pykkyE6izpPMOJ02Qi9kwH677kcbdl/w2WsHag/uiCjkFl9MKurgOQJbKxjys0j/AOwU4DLLcWSZltrUoRw/oe5UeDqiP5ICERMxv7Eh55bUQw8MZXe6TVHp53TYG726xpyS21XXGEz3rj6rUovR5yBIoPBDqEoxM8xnst2CJOwQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?piohtuZ0NOeEsnfNLqoOgydSR2s9ovh8wop3LFjiMX18I5j+u1tz/P/BQH?=
 =?iso-8859-1?Q?zFZQ1BRet/aHMw1xhH+7QLb0frAXgv5+eOVEf19+2bplyzWd/Yr8kmvZup?=
 =?iso-8859-1?Q?YsbQ8Zofyi8KL1cT9o0tjlrI+jKtkyJqQMNnNiXgHmaX6ZuNAUxwnhN8ai?=
 =?iso-8859-1?Q?tR0iyBc0k4sNckiNCWVAOaV5z/8I7TejGovcIb4St4y/1ZOvdz4V6kqNgd?=
 =?iso-8859-1?Q?QWXl/bwHpQ0KgKDoC5oXGD7OP3imuMyfXL+YAwl8BBmVusnbGS6638EQ50?=
 =?iso-8859-1?Q?h0IoJvfGymZ90xkdfTfwXO51OGMw6POY1MNOPZ55W7vsPXb3V2utUMjaWW?=
 =?iso-8859-1?Q?fB3jG7Yc2IJLKnLhWTb4mfYRnzNR918APAI/KksWq2oLtJp2XR91a0DRsu?=
 =?iso-8859-1?Q?lwsG9Jsdi/9JnGdevGz6MxP+P66sMZtb3E1mEfHHoA+62bA5hYNTeXk6B2?=
 =?iso-8859-1?Q?4Fb7qaAZeTJDPbMpCzK6emcm5cIrT6o8b3YR5onRprC/s03Bt1xvRGAL3c?=
 =?iso-8859-1?Q?q1a55vkPwtXB4f6+6PFqNWBXYUd3dl2ahji02nqK5Oi5ZykDhdhpwd70/3?=
 =?iso-8859-1?Q?xZjhVc3Qwx1CPhyZq7gdfmVscCukaHbODHpGgjMoq51AVIIUzyaWO2FSXW?=
 =?iso-8859-1?Q?ZdQabop2cihwqZpsDi/NG9mynNPIjqddQdCSu7zj8C+ZaeQc0BwDYSKps2?=
 =?iso-8859-1?Q?0fpO2ih+gc3yy/b/uR/pIL71XfvHFO07tm3xcxP13hXLj0SVDsBZ4mloGI?=
 =?iso-8859-1?Q?3yfLuz/5Ik1POrEAtvsPGQWgAahfnj90tSm5v26Q4CMvrWKKWVMWntXnnn?=
 =?iso-8859-1?Q?GgiNedZDhc1WJnB4WeFWgtmYq2DVoO57kV0tMrv2e7NZox3HbvPsKjQOFj?=
 =?iso-8859-1?Q?ypY8140Ysh6bY9WNaHhRLlpEwMcSMZkwo7JxI0/kuiSYXbNM5DV7ktmNsV?=
 =?iso-8859-1?Q?hnLLW5aZm2e8xI2XT4WGrzNlA/3YcHL+Bh+BMTj/6jQnaxRLgo6XYH+aXw?=
 =?iso-8859-1?Q?w6x6zqX2tHmKIqTdSrnuYBK1NY1ZhD12JPiASMvZt+gfaeiT7KoON9WEWt?=
 =?iso-8859-1?Q?J0x/nGsMjgo3yI4aYGn9xzeU/wPuMo1YkTfy3d8m8eOyTwIf06ctMp/gmx?=
 =?iso-8859-1?Q?sLoVmnUal5WJlCznPCr5A8Bwsn279b0R/6AF9UY1vDu65DGEilmg467tr9?=
 =?iso-8859-1?Q?MEB+IpiMDC9zp73f84qIyPVX3f2rukTXZFq/p7eGozx+hCClPQubMZxdZS?=
 =?iso-8859-1?Q?+6DPhP+z3lJkH5qhAISeckNkgYm+6urWwuMaaFK+EE3UXChwGZKSL66i90?=
 =?iso-8859-1?Q?2P+Flso0VTenfimFsfXuAUH3m9yKZe2FYk8MZIRiOXna0KfrcL18N2ZjA5?=
 =?iso-8859-1?Q?p+2GiOEFfWD+eqKDGWkZTWYLaEx0YX1wsGvARM++zK6WFiDReWAN+GrpW0?=
 =?iso-8859-1?Q?HEj9w9SDo/XqHerGPaWYycZxpv9K2ZrPG+1/4DRC5NPw5p//oCckt8CGt+?=
 =?iso-8859-1?Q?Sz6o9BdwqLSaJmlEbtRUvvxIDsHNZdT7rCfonac9hAQcAqm8bYYGPdpGFh?=
 =?iso-8859-1?Q?l2zfVvxUu5z/AiZqrm3uoISCUC4C3spqT36uEtMXL3Oaai2IjToN0erE/r?=
 =?iso-8859-1?Q?4zg5T5H8LCUKlG+2UtOjtecmnqGyYqeDzvjOmkATWjZNEpzoGW57vfqLwE?=
 =?iso-8859-1?Q?AXtzzO61Al6Vnjje/B2K+5wvDiMg56ek+YwDAtJNvSn4FPCbElj5Xk+5sr?=
 =?iso-8859-1?Q?WPOzCAQ8+oVXF7MR+TETHZ+7zY+CEPMS9MPbzdJs3MEsLoMOT84tGQXRN0?=
 =?iso-8859-1?Q?o59ilOjLYw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdd4148-6697-4ddd-4b70-08df3e52633c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:48.2055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wjKMvgJfrkhx6gusWDnv8S1sh5IQ3tdh0PSPrrEmKSM2w6iGlf291tkx0+64gW8f044dwzK1Ixb/qQMmDPJFFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-ef75cf/1794222769-A76D2AE4-63C14133/0/0
X-purgate-type: clean
X-purgate-size: 3953
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
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
v10->v11:
* collect RB

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
2.56.0

