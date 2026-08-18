Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F56C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393697.1632517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUp-0007i5-Oa; Tue, 18 Aug 2026 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393697.1632517; Tue, 18 Aug 2026 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUp-0007gl-Kh; Tue, 18 Aug 2026 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1393697;
 Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUn-0007en-VF
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUm-008KNP-VM
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-16
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:32 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-5
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:32 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVUPR03MB11425.eurprd03.prod.outlook.com
 (2603:10a6:150:362::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:48:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:48:30 +0000
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
 b=kfy3x0iVGg0Mzf2XoI4PQmYPEQYy7ELnmjKVMJU3Hxz2RHuiNfPT6GWyDukfQiQKB9S3VKtMMrtE8iTdm0oTA3bwsHA1o1tHl2YNcSHU8Kd/AGeJv6ZZ8ev3MrUqA5mYYFMtNKgyl3spWxmRflolZ/WyE8G1H+AfR1++skkR4HTlnSCzYme0yTDAD4drmNAvJU44v+YfcQBK2KnrgRvWfh9VqoNJK7AR2LqR6HFI5A9yffaA2fGrX7ItO7+yVGzl7TUIayfuhuzsov6Z9buVCvwTFuWaV+JOMC9k0yZ3h6ZI5Wd3CgNB+duEt6CbOc8W/wVX46wSK0OLL/Udwe8YJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7EAGySORphYMfpI2/c0B+nTzcv6FJOsXy1zCeip318=;
 b=t0qVdjDjCWKPLsMKDxTTr2VKWYIG63eIEh4tuiqJp9RoRf5akDa5jOf07runds1HTbChhiWD8NBa4SyHOq33Z5uahF9sbyBvzQJhCBF32pHS4W9Pqd06uWr06qI6/MEq23QuX6dM5lg9HBmkhSKb6Ba11sX1/XyF4DcK4CNMCEh231QCM7R7sjVlY+qNqw+gfm6Jm0LH0qmDtJIHqRcsbeDLH8PzZXNGVnM5mP8kxruokMwHgfKhgHNQF/gJ8fBMS2kKLvhq930ROgVcitMrnM71nrBoZOwHHZSfMqjSjGbeAWkAGtRX9R6C3Td0hPScEWEaZgPJt42OAKjeBywYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7EAGySORphYMfpI2/c0B+nTzcv6FJOsXy1zCeip318=;
 b=kt5Kb5QB+vtU1qh806pqrh3J3UoctSGotk9+6m1JWDtJgXy6cCPJ42mQLvAEah0vTnn0VmXv84QkSnkn30B3Rcdj8MaP+hnRnkvKjbyrbO+DYRbLNmElC9B3ZCnvKztolsNTOPAMEjCuE7oMwl6VMXTIMG3yVNaQmn0fLozjaGvb8KfGYrBrtmyZZfTubRN0EyhBT/gFso4qTQKUorsn5nwZPO6NPmPi5Qpp36v8J92JAJlyoTphL5MLuMBUoynkxTlgntmQ5lM8ui8KyBM5yZKSWDU2JwPjgnRZAEysal2BPaigTUSgZ1SZZwaOgdS2OeT7LSEugu4xCg+/OxNoDg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 2/6] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v9 2/6] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHdLu5XyuKK+Q2mBU6sZp5cWKKcAA==
Date: Tue, 18 Aug 2026 08:48:29 +0000
Message-ID:
 <55f4839f427df6675a621bb61bfbdac4fb089382.1787042017.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 6490d7db-cdc0-4897-e99c-08defd057a37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 i/77Vl7u/RHdPFMQMvoQLnqgNMHWt/SlBkJ6PZabLm7CgGCei/fFeUF7irU7YNb1gdzg2dBJz4NCT73LU5ZKrrvJSCAqpqIO3TphZloVJUdkkunWXkwZdA7so2ctoKa2hfLdEXaTFyT8WeCYZrCOzPBOtX4WoCZhAKwtZX3zV1cS2aHJyeLBmH7ZEQZSiKQaOSr38g1rPxHtYjIk3crD7utpcPiB1ux89VJqeLNLCzBQcoMFC0Hek0vvOeADA+hqVTRtzTvl1Eqevz1f+8urPkaHkEa35zEnwubup8AkL8dKoxX0+sUsEzDXgrV/SaSmc6iKYKJOyju5zr9QIFOwhihrxxvULrs9y0asZXJDLL/5tm6aJBD+/F88JODUWMcMfDK/C4hmCozwPFZVJwa8M1OXneN7ZPv3hdldMAYodSi+Hg99XFh+Vo2u4xbLxVlmiJIK4+ztij0prnU2pSIFQZLFNLIU88AFpcNsQLUIRGtZIdnODLcLhI55R7d6J0QaXVb03r0Q9ZTP/awrRwQx18SXuFkyQ89HcmSfMK17mbtCkSTuECgiQmmd6XEONIlPF3s9sxYdPftTo05R4HM7V5OugBcNZ/aSgxcldNhPDe897tfHFsx1NCY2Si81Q6fvf3qOTqXL8GD2lbzcWQcQRZZAysGXMSSFCGKYVx2EIBHRwNoqAzOhQIuuvnmNhi5SC1VensMXb76nm36JQkR3GfScoPmc0FNAx5rtzl1VPAg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MeOVwGW1J1ruDsEQAoTw40d/ELX0hROc7ZFSNoOZlJwD/rv9r8LVSrH5c0?=
 =?iso-8859-1?Q?DVGssNuS18UqivqtS62Bin5Zow0LbZ8UFHOZVSE+pq5DbCyiSrj4Va6VpT?=
 =?iso-8859-1?Q?qAqj31mdPqveP/GuXkgRuhLKg35ppmwfJREuLsCarwugbgFiexWCFduFq1?=
 =?iso-8859-1?Q?RrmJRKjjZm/pzA5BsVikfs+ZrmHlDm33TkTfzMP0o0ky+bc9axqqCHYCIk?=
 =?iso-8859-1?Q?ejE7uSSmkz8J2CcsbabrPdINNglt7p76eA9UtfrKeJY3NwG9dfta76QF/z?=
 =?iso-8859-1?Q?gLUDfx7NukQcbrUTJgIwRDjZAWODlSncNZentv0BHT9eE9nXowZrqdP0/L?=
 =?iso-8859-1?Q?PTPrMslMCeFXYFj1Wyisk751HchiKwuF7hvzocC1OfwsTKRV3iW2pb2A7E?=
 =?iso-8859-1?Q?NkH9Kdr1l/UdXfBm6YyXXMSVwr+EX6fYx7Z+IyoHYFsN+HKCjbF8f2dJiy?=
 =?iso-8859-1?Q?tcHSPE9t3n8ajkgJ+xwhbb+6skLwfSEYnWYdcqXIiFIOraCsEdXWFN52zc?=
 =?iso-8859-1?Q?m9YOgk2jT9KsNBFax+ZBef4xNoMYsSKxoV5YxsagjnXtEc0G+5lp2suDbe?=
 =?iso-8859-1?Q?Fpr44wErLVBJVEJfmJYBOswj2SCoDTkC6XeuJSR/LKH6Ntye3aQMY6HbjJ?=
 =?iso-8859-1?Q?HUuecHp0pD0OIvlQbGE6uyTRcNGU9RK/5uvxSE+mn/PTXLnO6uQaX4Yufj?=
 =?iso-8859-1?Q?YFKF7c53bHqsKwYbgiFGzrJEvAaXuCyEleFpjc79P4mjhWFZCD73UxsFFv?=
 =?iso-8859-1?Q?EA7DuIzjEDgDFYjxCeBXb08AJPORANIZIM0DFt40axcXnRZ6gfwsHJ7Kw5?=
 =?iso-8859-1?Q?xBVxqs8N4nU2DEeEuGNEGw5rhMoaBpOTBH90g2cU1ckNlamTHvMiaB1kZC?=
 =?iso-8859-1?Q?zHlrACvQRvKMd4jyDGxm6LDrrinyVZJIELXo6HKqzovliNp6NUpB8ipbfq?=
 =?iso-8859-1?Q?XkujjmEmOESKfDuwqs2900o7iw75uono2rPS7oG3WnRtYKl/Bkkkk86Emn?=
 =?iso-8859-1?Q?bJ5IAi12KLWer5OwLnnD9DDSY7HctW/LFmQ6xdwS9woG4qANl7lSuER4tg?=
 =?iso-8859-1?Q?QFw/WlU6eVcDrETyxcuu6tjmIZpyT0w9pKelCTJI1uqrFxiMkVPOpaODjd?=
 =?iso-8859-1?Q?CH0w9PceScw36hMDVjEGXI3d800bRwBU3NR9UHsb0boTyzznkHLWllOj3N?=
 =?iso-8859-1?Q?BrXddNQdxX16+JWV2kgTHVd40zfNUGbSZAtzfPLmHE0ywn5O/ICuMuCmxV?=
 =?iso-8859-1?Q?+gaDW+14F0uWG/xldloEmTqv5wwSbphVEXLB31vs9EIfaIrNu9ldCh9FH6?=
 =?iso-8859-1?Q?peLutZMuRmwg7YfA+rbX2KRe3K4bf7fHLu2bGzdGJkCjqEKLHvr5SIwgPS?=
 =?iso-8859-1?Q?jOUuFWGf5oxkGDG6oKeOp2TwoNq15VQvJB3k26eW9MQM8QQWWSUTO4Wv1B?=
 =?iso-8859-1?Q?icaKtfkqwzQuIngynRDvJ5ARJaV/RUBpMWzGt8ethVkZmPOuWthMLdnBZ4?=
 =?iso-8859-1?Q?q1xc/wBC150hR4ptuouktSoHIMXVPqtx1HxrOy4BltlV3eDGv8R46B+tB2?=
 =?iso-8859-1?Q?1TgqJg9/lhpGPjxrsrrd68lIIqw2MB52jAEmJHpWgWA16SmjoH1NwJpX66?=
 =?iso-8859-1?Q?1U+ZVmRXYgwIOdQoeN0I7z5pJXD+RpVDioRHMJJl7MEEM+UQGX1WzqfCdw?=
 =?iso-8859-1?Q?D11XXl5fp1QaIwbUNV+aVjZna1bFzd/ct5/1u2JWVqKb9j5id70Do5YrBr?=
 =?iso-8859-1?Q?T5p6srOlFK5P79azEAXp6qYmHxxwdWHXT66jhZnACav7JkJU0dlCTF121Y?=
 =?iso-8859-1?Q?KNOXYaXFb9RHlwuforQqnB7On7eUE8I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6490d7db-cdc0-4897-e99c-08defd057a37
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:29.8078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NErzJOpi23dX9I43DrZOsJ60HmAmK/6DSIIYWT41/RPjxkG1bT4YQIYoqarj9XD4xVVp2ZZgz7C34EsNkj6JAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042912-30BC02AC-34657BF6/0/0
X-purgate-type: clean
X-purgate-size: 4957

Move IRQs from dying CPU to the online ones when a CPU is getting
offlined. When onlining, rebalance all IRQs in a round-robin fashion.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
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
 xen/arch/arm/include/asm/irq.h |  6 ++++
 xen/arch/arm/irq.c             | 60 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c         |  7 ++++
 3 files changed, 73 insertions(+)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 09788dbfeb..d043360135 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -126,6 +126,12 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+void rebalance_irqs(unsigned int from, bool up);
+#else
+static inline void rebalance_irqs(unsigned int from, bool up) {}
+#endif
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7204bc2b68..6445183f5c 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -158,6 +158,61 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+static int cpu_next;
+
+static void balance_irq(int irq, unsigned int from, bool up)
+{
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
+void rebalance_irqs(unsigned int from, bool up)
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
+#endif /* CONFIG_CPU_ONLINE_OFFLINE */
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -172,6 +227,11 @@ static int cpu_callback(struct notifier_block *nfb, un=
signed long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_ONLINE:
+        if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) &&
+             system_state >=3D SYS_STATE_active )
+            rebalance_irqs(cpu, true);
+        break;
     }
=20
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 1806c47a08..239d4a7a25 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -433,6 +433,13 @@ void __cpu_disable(void)
=20
     smp_mb();
=20
+    /*
+     * Now that the interrupts are cleared and the CPU marked as offline,
+     * move interrupts out of it
+     */
+    if ( IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        rebalance_irqs(cpu, false);
+
     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
      * scheduler will drop to the idle loop, which will call stop_cpu(). *=
/
 }
--=20
2.55.0

