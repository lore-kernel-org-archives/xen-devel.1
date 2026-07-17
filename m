Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C31C44520
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 11:45:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364930.1615793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkh0D-0003qE-DN; Fri, 17 Jul 2026 11:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364930.1615793; Fri, 17 Jul 2026 11:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkh0D-0003q6-7i; Fri, 17 Jul 2026 11:45:13 +0000
Received: by outflank-mailman (input) for mailman id 1364930;
 Fri, 17 Jul 2026 11:45:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wkh0C-0003q0-3G
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 11:45:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkh0B-003tJt-2h
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 13:45:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a5a15b5-e002-0a2a0a5209dd-0a2a4505bb1e-40
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 13:45:11 +0200
Received: from [52.101.65.133]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a5a15c4-4cb1-0a2a45050019-34654185b8b4-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 13:45:08 +0200
Received: from PA6PR03MB10266.eurprd03.prod.outlook.com
 (2603:10a6:102:3cd::18) by AS8PR03MB6949.eurprd03.prod.outlook.com
 (2603:10a6:20b:293::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 11:45:03 +0000
Received: from PA6PR03MB10266.eurprd03.prod.outlook.com
 ([fe80::2cc9:8d65:65de:c005]) by PA6PR03MB10266.eurprd03.prod.outlook.com
 ([fe80::2cc9:8d65:65de:c005%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:45:03 +0000
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
 b=rTWAy/NFDaR4OQoklfPomJn0AazYhRTjPrJS0EWXV8Rgi2b+oDnR6hwRvccVsAsXCkEUdq+uuZiJGZEr6KB63myFQyvINNgxz8BxoQb2X25+51FXhcLB1KHY2tD27obq/j3UxalwfHuHQqC95fECXkxJdSh0X8GyqfMW/XrsoF1C6wMbr/gGu+aPhCn992Pje88cGr+YAPl0onRcyef4P6A5HnIaCRGHgbfCkjrEfiZ9qyudRu/WWVzjNQG5r5dIET072cqh7DpkF/HH84fjxGirduGIm9V3jl9OABEmwjM7zKBcuDo61GlQZWJMw871n2y0eVp2LYzOn/2BFKsVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrTbwqj4aI37Sajy1Vfhv29q4RHLcdz3hbwUtcIMxyE=;
 b=NnK6WQpSjkSz8N6p/G3MXUIIF6uG3mohASvUR69Au/0oWhhpZ3BaH6EeFEpUVySYXCqQCYCv631PLn7UVa10lE7jQbxiFqc/wWc7zZyrOu6CI1/+g8j1FPX+skbHXbAIy/y0t5y2NdVbH0JydKmD8jOra5RhuBWGpyL4930l+Zww58FyLMiqPcjpNcJiIEx8Q0gf7g3y6+D6yRFfyWMjT97FicunzC61N2hr1qOKMOCZllQZZTrEjVuMQ2uxj5eybauoAh9/VjR3hPzo1OrPVqymaKcErlsq0LhXXmH3wvvZ0sQOYtvpJuYCdVuT5GzT3FzO5Xj+LWE4YeQhjwuYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrTbwqj4aI37Sajy1Vfhv29q4RHLcdz3hbwUtcIMxyE=;
 b=sO/JWylD8UE2LFTTbe9Yj0SwcDf6cskNCN6lkWx1n87Mh66r5JP+Zrq8jFL2pm6ESKudw4TsxusSetSxEnv2SGR2+QsHnnjXf3qcpXAOPXRfUJI7I2k0+xCPECxkPzFQU+eGE6lIb/V2zyBKON0TJZbHT+yNKXz2WzjZjw6+4H3FpJ9ROGWzrMzxa4kM4dUkm3ogwGe2zr9BZoSZqVIrD7EnwRCikg0iEYnE25GUFXu8DLLifygyI0xLQdG54/LcsYmUluT7ptP+zTMCI86eIEdvqEngHyyxcfc4Zo2kvRNIJZJk5KR66DHS7gHr7iVFIuz7bYSJfiBOkDoNNiQMRA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
Thread-Topic: [PATCH v2] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
Thread-Index: AQHdFeG00FErvj0nOEaMWTVLFzCjeQ==
Date: Fri, 17 Jul 2026 11:45:03 +0000
Message-ID:
 <f4b75c23400b1a9db44596a28ca9683dbf05d419.1784288688.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA6PR03MB10266:EE_|AS8PR03MB6949:EE_
x-ms-office365-filtering-correlation-id: 4e6edfd0-305c-4aa4-0ecf-08dee3f8d70a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|10067099003|56012099006|18002099003|11063799006;
x-microsoft-antispam-message-info:
 VUogzEupJaadcyg6u5WwmQWshOrUmn/Rp2gMf9wPjA8UfDv4idTKKguGAYFmmR6D2IAQOyq9j5nOOP5kb4xR23akFYgx5YTiFu0rrXf1/FIDO2onoPur/Tv+RKyawFH7mBgDkUaIdg7V6wraTKpi0+X63cjcx5JstaAqglzeeEwcCpaToFZwi5CdsAfGj/X10ppH821JXbKES6jGu1LWK0JatJIt4tsiz4MlEQsoULuc0A379E1okaliBbSA1HTPPNNTd47ve21MzCythXtyorSOnuvXhjYyujIojr/agMLM4aOUwy8kANilqfMGSi2LJgCAy1jbZop640uB7t1iajjMX6VNgLzJGKO/loFoElijn26a2xzzIWFEBwCSrxzhySKzYY7xnKULa+GchEMT8MZjCGEf/G/Fs+8o6ph/immsDP968mA4RNacO4Z6OhpCnGadVwYwTj5zPKF55T1p6x7mv4L/Saz+jGI2/uO/c7bE6Dwv1IcId2Rea8cEVa7/XtxcK3n2wiaq+sJrA968eQSJWnxdsu3rmuqKNZoICfY2MPiHawRXaT602pJz7bhS2+oIWnnRsjP5zUDEPudH63wesA4cyPrDATz3a+DZkwexIRtConyQsKpVvMjBHN2EnXPUgWZfIg/3snx2z2OnV4/CWQ8kDwmArvJ2bed482odCCCVHoDDYGNcrSXHhDLmUcu/xu0TbgpPjEu66zxwOYlyM0nE2jOAA6YJGllk+EE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR03MB10266.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TYecYWQ3FZAgLPyRst8ULGDcRC1ZA9LLG9lBxo9y5rvXi4G4fyw2ROVFb+?=
 =?iso-8859-1?Q?aH2w181F7I/mS+whj2CGuVH66nbez4h2OOvdO7RDLOWZgATBZnaIkUVL7H?=
 =?iso-8859-1?Q?UgjoPPaD1zFeyEAnwfdIHrAmUnqpK6/9QWnE8ygL96uZqCg8OqZ4S6Z1Wz?=
 =?iso-8859-1?Q?d/RGxuX0u/AXV4XqJILrYk+1RcajRWi3zKaDNfTFkJHgaReh7W54N9tYb2?=
 =?iso-8859-1?Q?mtcbKn8XhtnQmCDH8JB3rZrTbSbyV0dtoY60FC23ItU1hB5VZKuEU3w9i1?=
 =?iso-8859-1?Q?2Tz5pMIBZenvvXVObuXGgKMuGkX8h/5rdrfAh4TUFRE7mxs63aluxqq+AV?=
 =?iso-8859-1?Q?Qp9SQ7m8QF57KX8X/Vlv0lSyoaaVtDUWQfa6TbH8jJSard025PZX3wzX6p?=
 =?iso-8859-1?Q?OldwNZFKZirmxGD5sVkodO1z0yHVAZynPKLEH0eFQRBUlKQ0AXYOVdb1tV?=
 =?iso-8859-1?Q?z/FFuUKEjOjt07CWnwBDmTW2LuJWHKnZgai3EP+hPjfESv/sa0SaIc7mRN?=
 =?iso-8859-1?Q?8e6U4Rv+FsVK4af01mVL9kLjfB0fnXg6UYYyp07MbtPOnWdwp/oH+PEPZc?=
 =?iso-8859-1?Q?Xq0E5pVCaHB6DJCsOOZnmf32CYFV0UM9M6WLuDWEiZS2wfAzeNmf9wgVOs?=
 =?iso-8859-1?Q?2Zx755r9iA3yYh/uqbQBOTJMhlXcwqZv9Ujgkta/y+M0Qg0epQLd7My/IT?=
 =?iso-8859-1?Q?Cf/Wrj5c+YHwrRxXAnck2b/F6O5CxWqnKeYTfKIRGythTgLIgydEolvxNH?=
 =?iso-8859-1?Q?FLnbz+ZmGQI1U/ZEJ21lluOdBbKHB23Dbu59fV/5CtHSWI5h3OQ0ItC2nw?=
 =?iso-8859-1?Q?VZz9OVcbj5xooELRhdkF6eJACDBpGZ2+kSrH2eygb4z7hJEbHL6lZJWLTy?=
 =?iso-8859-1?Q?L8ixVyZrY4RMQMHLh/CFFTNBM8XulMbqM21QNLG9BSNU7igDWJAC235XV6?=
 =?iso-8859-1?Q?yhBoYMgSBGI9zuyv2WHVvaTh47KBFAWzv6pKSKEHh2tn0SkeqaCwv5gLup?=
 =?iso-8859-1?Q?ExoJSkH6oV/FNYsrdd/h5uu0m0hkDIYsoUswpqXYFyr74s6f/C7wzkCp/n?=
 =?iso-8859-1?Q?jEYota66JOL6U9NQprUoA4MkTqSvgrj7LNLFu/5FTtrBOt5jrfqUOKNf9q?=
 =?iso-8859-1?Q?pBWXdTBXX53zsFOu69xsBQLmhD9E/O6NY8XASur8sXqAQy9sMrYbrynvQ0?=
 =?iso-8859-1?Q?M/jL86w6Ibikdrx6ToTxriKGIUBYiIRnxC9/9xhKQOTwV0CkZ0mPz37UYj?=
 =?iso-8859-1?Q?BPHL+aFq4oWJxCTBDNnV4VzXHlpqD9CtFDrgyQRZia0dCW/Xdud3aK87nb?=
 =?iso-8859-1?Q?4ai1cYH7TjheXudAZg3r2PKfRjdmSYI/ex55M60sEOr9Iee+YWRw1Dk0S9?=
 =?iso-8859-1?Q?p/tBCS5vexOFzZU7q0TKIoP9Aa0jMCV6/mYfBhbrH/j5Vkt4Pj1ZIQctIF?=
 =?iso-8859-1?Q?XXKUGpmAS2gjx4hkU0FHks3d2YkKeU+eYAyJFQPPtRlO+9mVkNQ/6a7foK?=
 =?iso-8859-1?Q?CpIQBqHFQOVOkoeUUwye2tiFlVEl8WEJLasz/cTcVMVXwtdClF4PtT/Exe?=
 =?iso-8859-1?Q?RhqSlbt7FvT+up22kSRDwAL0u1IzWNJ56lzUqUPfPXiibolwEoKxPlzrJ7?=
 =?iso-8859-1?Q?ulyz++90mn5JrEn4nmA7GNcg/xgtuuSz25s+X/ta6ZMu8UH0RO1UW4ReDu?=
 =?iso-8859-1?Q?Gf1lQunX9GkQW7KZS0rZaJjkPmlwEb63d3hiz1JCnjX8PcmDlwVXpPAWPQ?=
 =?iso-8859-1?Q?9ap2nVCC3tDlYLqdrEJ9GbcxLd7BoYCKF72F+jxoFe9pH7hs9lu/U4VE3g?=
 =?iso-8859-1?Q?6lLDQCrcMd3pDIAj1lkKpbqaFIWDInk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA6PR03MB10266.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6edfd0-305c-4aa4-0ecf-08dee3f8d70a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 11:45:03.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9/VBiPjEcUwC2dUO/uopyNtgEzykaPNHBqEFBkT+0uMqOloqbm6Nt4uwt3+wylLTpm01Ju/vuTszDYU8CTuOeHwRx5fss96dSktEgVK2Zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6949
X-purgate-ID: tlsNG-c201ff/1784288708-F7ABF2A1-69EC98EC/0/0
X-purgate-type: clean
X-purgate-size: 4094

schedule_cpu_rm() clears the cpupool pointer of the scheduling
resource before calling sched_deinit_pdata():

    sr->cpupool =3D NULL;
    ...
    sched_deinit_pdata(data->old_ops, data->ppriv_old, cpu);

For RTDS, rt_deinit_pdata() calls move_repl_timer() when the
replenishment timer lives on the cpu being removed, and
move_repl_timer() dereferences get_sched_res(old_cpu)->cpupool
without checking it for NULL. Removing a pCPU owning the timer from
an RTDS cpupool therefore dereferences NULL + 0x10 (the res_valid
member) and panics:

    (XEN) Data Abort Trap. Syndrome=3D0x1c28005
    (XEN) Walking Hypervisor VA 0x10 on CPU0 via TTBR ...
    (XEN) Xen call trace:
    (XEN)    [<...>] find_next_bit+0x74/0xa8 (PC)
    (XEN)    [<...>] rt.c#move_repl_timer+0xb8/0xec (LR)
    (XEN)
    (XEN) Panic on CPU 0:
    (XEN) CPU0: Unexpected Trap: Data Abort

Reproducer, on any host with at least 2 pCPUs and RTDS compiled in
(observed on arm64, but the path is common code):

    xl cpupool-create name=3D"test" sched=3D"rtds"
    xl cpupool-cpu-remove Pool-0 1
    xl cpupool-cpu-add test 1
    xl cpupool-cpu-remove test 1

The last command moves the RTDS replenishment timer to cpu1 (first
and only cpu of the pool) and then removes cpu1, hitting the NULL
dereference in the sched_deinit_pdata() callback.

Use the cpupool back-pointer of the scheduler instead of the one of
the scheduling resource. It is set by cpupool_create() before any
pCPU can be assigned to the pool and stays valid for the whole
lifetime of the scheduler, so it is still available when
rt_deinit_pdata() runs. Other schedulers already rely on it the same
way, e.g. credit2 in cpu_add_to_runqueue().

Fixes: b6f5334aeaca ("sched: fix cpu offlining with core scheduling")
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v2:
- Do not kill the replenishment timer when the cpupool still owns other
pCPUs.
- struct scheduler already back-pointer that could be used
(see 524cc89c288b "xen: cpupool: add a back-pointer from a scheduler to its=
 pool").

 xen/common/sched/rt.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index f1feb4384e..3896814dfd 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -764,10 +764,16 @@ rt_switch_sched(struct scheduler *new_ops, unsigned i=
nt cpu,
     return &prv->lock;
 }
=20
-static void move_repl_timer(struct rt_private *prv, unsigned int old_cpu)
+static void move_repl_timer(const struct scheduler *ops, unsigned int old_=
cpu)
 {
-    cpumask_t *online =3D get_sched_res(old_cpu)->cpupool->res_valid;
-    unsigned int new_cpu =3D cpumask_cycle(old_cpu, online);
+    struct rt_private *prv =3D rt_priv(ops);
+    /*
+     * Use the cpupool of the scheduler: the one of the scheduling resourc=
e
+     * is already cleared when this is called from rt_deinit_pdata().
+     */
+    const struct cpupool *c =3D ops->cpupool;
+    unsigned int new_cpu =3D c ? cpumask_cycle(old_cpu, c->res_valid)
+                             : nr_cpu_ids;
=20
     /*
      * Make sure the timer run on one of the cpus that are still available
@@ -794,7 +800,7 @@ rt_deinit_pdata(const struct scheduler *ops, void *pcpu=
, int cpu)
     spin_lock_irqsave(&prv->lock, flags);
=20
     if ( prv->repl_timer.cpu =3D=3D cpu )
-        move_repl_timer(prv, cpu);
+        move_repl_timer(ops, cpu);
=20
     spin_unlock_irqrestore(&prv->lock, flags);
 }
@@ -812,7 +818,7 @@ rt_move_timers(const struct scheduler *ops, struct sche=
d_resource *sr)
     if ( prv->repl_timer.status !=3D TIMER_STATUS_invalid &&
          prv->repl_timer.status !=3D TIMER_STATUS_killed &&
          !cpumask_test_cpu(old_cpu, sr->cpupool->res_valid) )
-        move_repl_timer(prv, old_cpu);
+        move_repl_timer(ops, old_cpu);
=20
     spin_unlock_irqrestore(&prv->lock, flags);
 }
--=20
2.43.0

base-commit: dc4342ccd35a8f3fcc8832885453a08179cd0ccf
branch: amoi_sched_7=

