Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2A7C4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:21:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364156.1615494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMxA-0007jZ-5C; Thu, 16 Jul 2026 14:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364156.1615494; Thu, 16 Jul 2026 14:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMxA-0007jS-2b; Thu, 16 Jul 2026 14:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1364156;
 Thu, 16 Jul 2026 14:20:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wkMx8-0007jK-Fz
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:20:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMx7-006niv-Lb
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:20:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a58e8b5-2eae-0a2a0a5409dd-0a2a450bb9be-18
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:20:41 +0200
Received: from [40.107.159.137]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a58e8b8-b7e8-0a2a450b0019-286b9f8991ce-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:20:41 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DU0PR03MB8575.eurprd03.prod.outlook.com (2603:10a6:10:3e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 14:20:39 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%6]) with mapi id 15.21.0202.018; Thu, 16 Jul 2026
 14:20:39 +0000
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
 b=L5Y3xmiwg/82BVfOdSZBunK2tQ8tACJrVqDHCpMqTi29Sbr6T7Ix3IesiV1B0X9jCrGdd4b0+kUV1axMlrcLQ2/8dgsLesjLEK4zYmi/ChQHie0aajMot+Ru6Hq624Hk5h3KHzC47lVrqR4wCG5n/G5g9799+98aGbuyCq+FEuTs3AuVC9HdbLBl5bDPBgZ686C7JDPxO1AmW36g2FfFsmzZcOcWJD/VMHsUPdPD9uAWsHCRmnI1gllT3xkjuvix5OmXTENo24I7pa02/KWYEpcpqDqTGSsvZqk4rhvQzKr6HCEAPiGP4Ic7rSikDH1t2+v4mPu14dWGen/TP8z/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+mCsMiInq8NEJ/T0ETRjd5+WVO02lw0DT/cOeD67x4=;
 b=fp8i2ksFZcTMRi0rbBtYACh7gL++JjVObi8zaHQTbUK8DmpVgndiaTfdcO1FCTld1QlMl7x3/ZFvo3bus1W3+0/LI/16k83UOkPeCDdJ9D+5RYc9tBYed90uktv3CveupmxjQosJGdVZBpdDUzH4rP5jvp2SZsQBLPXmeTHTZoF9vmBniBo4G1Sasc5qqOPPAKGmzF1mqhrRBhrJUIi6qikDnRdf6zAMS2ZLZ0u9vOWJaK1CepEXck/dbGQvHDIA493Jgyy0HNHEAfN9AVrVMKKzCJrLdasgkUo8Dkfl8bWh8rZDEzvnPiEdpo9F6a4YglnU1p22LRBrooFmu4zutA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+mCsMiInq8NEJ/T0ETRjd5+WVO02lw0DT/cOeD67x4=;
 b=Jhezi53oi1JnxSQTu9gCEaM8SO1oFILun8wsHKgmpfWivFqBp0LRlSlUuxkXZqGRZXXMHZ/NVCtvOL87+ZCxs9dByUoHgEMm/Pq2r5TnWYJpULI0AxvpXIJqRClFV5jhi/4dSTxS7CUI2jPrbhN3J2JfFLea0Od3edQxxw1AesDxPZUQ8OM8Dxj8M+Wr6PeXZwUqnXi9eWHRI+blrFSr4GYjY0Wi0WGPLJW3vzTOeDDMA8xxqYb88l75oVK/NaY2XwPwEMeM9XYDq7dvQy5hvdXE1eHlObvQ3qrcEN4wn1P9Pgf6V5u/L6gQJw66kY7wX4y2oaO1dhx5dkKpZcZv7g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
Thread-Topic: [PATCH] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
Thread-Index: AQHdFS5GI2vrNSoeg0mZ8r0I1QFdPg==
Date: Thu, 16 Jul 2026 14:20:39 +0000
Message-ID:
 <38cc09ca49bb020d4b13ead36e4c9f04da2d00e5.1784211528.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|DU0PR03MB8575:EE_
x-ms-office365-filtering-correlation-id: cbb7bb1e-7953-466b-5cfa-08dee3456940
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 PemxIjbiWRYhbx2ObeR/RjPpZCmtYf3ZE9MeKwLIRHtcWYKTjuAsmG4WPttltc1CUU0H8eVUMD2WZnl4jv4g028BQ83nobqCPYeFBah66jENyQqq1oZdMnKXlNe2ze9eH9ly9ebJZt1kYiu+vpU+5ScchOaU/s8mOBuwhAPgLMVMiReCJ5kNgCuXz/CV1zg1I/SN8eRUwUtFyhsutBlA5IwQ7OjAE5f8vpqOYaWu6s7ujK8doMnQyK5fI9zkGsDkHODtawjbN4wbD+RxGI3wrLCBfsYEY1u9kiNLk27pA1dmIuLTqIDC+YKYisLbYKjufUCLOBsuMNHL5TfMWGDpqp/dKgD4pTr9C3Cf4oDH+lsvBocB17wl+puzhA/70iyga2l9+Xflz5KdhUmMAUAKDbFf1yGsPXNbG6CUKAZMdbAzAo6+WyHjy3uI+k58WaZi370crWDJl+j2XLngT7GUX/5hc97LNE8A49miy26vKzAxDKl8f5WU8yhb8hfx+AmI0Y4ou5CffmekB7c6Y3U5gO9lUiX/oAnQE9x1V1htIzfYRXn2GbDtGZXS9c6flynM7JcUGOB9clKH4ciTHeSKDFCnJNIG+flWCqPjSNp8Y8RnCmtjopYSMI0o1RbEHshofxjXkoXWhjbCe9aXG3S1sWedckyiMhq0Gy1JIRClmkSiqtQDoCiQ2YVdbBgYBBqDSrRzpijcMFAfm0wt6B0ugKUxXkBREh3sPRNVDmM9Up8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GCUW13SomtdUxt9PY5tW7D6xQnVL4kIRx+78SFbo+fyesNwyj1zUv2HyY2?=
 =?iso-8859-1?Q?ty0+WdnqZHmSabcC0KGso9bqg7OT1S9dz+cS38NQRsMhJPO4E39MKS6bEq?=
 =?iso-8859-1?Q?C0o71i0qTUhZ+48FzEgBAUuBKKqZwVZEmZ/JJE0v2l2n9hxipw7HFhFh2Q?=
 =?iso-8859-1?Q?V7zQS5fr49cxlnlcbrBPE3SZmADoOTPmOEKKmjj1qkgZt3XHTn/qrAxrCl?=
 =?iso-8859-1?Q?T4XoB/xuqPBKvcc9k0tMtOJTBE3gm64ImbD6uctbPCo4YlSb+14p3Hawnf?=
 =?iso-8859-1?Q?gPpt2T2qc0qlGlRpWm6cPj82VZzUo+r0o2rxEbd84/TadHRznFsQnjPtcF?=
 =?iso-8859-1?Q?nzZ3wSpat/yH2YJCEQzeouFJOP5WucifsawGaUMqIdy3IE6L8fI9d8FV1f?=
 =?iso-8859-1?Q?+ZqFwhdaurpqEZma5b4nQIwvIqYnhEwqM7WFNJkfMaUnx33ZG5iRVNROv3?=
 =?iso-8859-1?Q?sUK7eeBtGPxRkzZAZjDgMZGt+f9t2YF3q5haTNlFeau7N+IUt+mcjeKJaG?=
 =?iso-8859-1?Q?bWqxWggJUOsCngpzfktPADo6f1I5WpSy+ybfGO5AVi2pY+csy8H47M9EAU?=
 =?iso-8859-1?Q?tVLVJl8+ZzBmJ4VDdtZWu88facwmrkzM9u/h2tW3m55e7VlgrvLpvb8Mcq?=
 =?iso-8859-1?Q?FOBDYmYpHxnesoshoOYvgMnGIgwj+hJ6gK5fc6Ihio9uLBqDX8JDg8oF0B?=
 =?iso-8859-1?Q?MarKUNc/Gn2cUObu3BTwfYb/K/sNfFRFIsGSq9DX/akI+L/cFeKvdG24Mz?=
 =?iso-8859-1?Q?wsUUO+T2dM8QOKt35CSEf/YUZMpKvhAretST8UFIt4qiCk2hA7CGZEaw79?=
 =?iso-8859-1?Q?9HSDgSveOPL0OCb5X7crC4VM3ZVPEoZ25rPkPE8WMlRPw4twSSYxp1OG24?=
 =?iso-8859-1?Q?5rUqFIz5OKuWqArTQomf/tW+dJRvdAX6p2Ateg+pUX1QCVnotAHMxfkp1E?=
 =?iso-8859-1?Q?rp84mroeahnMk+Y+MLDEakscG62mjyxMmItv63E9JIr3OEQdvJIwgZqtXz?=
 =?iso-8859-1?Q?u/ijRqY999Dej4GkDGotJo1AL1Yx9JH8/reMKhGTSAcMYYQzHCHVCGA1TL?=
 =?iso-8859-1?Q?NJa9l9Xlb2MmzVHyOE/nb7TYVzao2nvYjt3DLsBKpjv8D+U0Bda0MepAYj?=
 =?iso-8859-1?Q?XzhxCYCQAnz9uoEudLP26gruQqUeMO0cH53zUfelVGFHTtbQ568Rk3d4WV?=
 =?iso-8859-1?Q?+s+VLMpDsuhd4jUwyQyBWlQjocmz3M2fQpXcQQLJHEGiJaJsTgFB3OVykQ?=
 =?iso-8859-1?Q?S3LMWFFlSeoQVpnvfqj9u/xgFPBe+xs151/gthT91AtNZT3CP4Nw49mnxi?=
 =?iso-8859-1?Q?J4EwO2NuT1PaLyF97L0eZmYNWqoZuBqQfCSPKCbYRhQxz5yMrjuUb2uDvE?=
 =?iso-8859-1?Q?ofBCJ2BaaR3jaUiGk7Gjofw3qXK3W72pxZJxSaqQZZVe2RVNlQ5qEuNN1L?=
 =?iso-8859-1?Q?S185/vbqJk8KlHGCvn2I79DtWxpScNxr+6SxCFtI2qBAEIsBrow6EmR4Sg?=
 =?iso-8859-1?Q?63TXFlDp/2by2H1ESM3k1ixgcW+jVTQACgiQPlTxmNaHc7S5pRz107IkUl?=
 =?iso-8859-1?Q?vBg2MLjYhObhiOEdHxbHKd/hTvtTTX06k7JMqnYho5enU9Aa/svSgwA7mu?=
 =?iso-8859-1?Q?QW2MlqHfgndcBiI8w2EC8wvOMysyXGpyFgH0FG+MVURFXv7U6gBUiLQ+cn?=
 =?iso-8859-1?Q?LviYbH7Ox7+HWTUPX9JzZ07KlHldVfUGfEPEpwCODrOTs65iCJbfFtDdHu?=
 =?iso-8859-1?Q?dWqAhw6GZnAhtSTkrTR4b3V/WMzwkW9MPsbR1pWn+LBcCi9CMJJvyh4VcC?=
 =?iso-8859-1?Q?TKsDt6PQHb9hjSPwHYcmtHRt8tszsp0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb7bb1e-7953-466b-5cfa-08dee3456940
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 14:20:39.1011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Ex4F6QWwsXdiOwbekf7hrMoGTJKA+qKHmU/5jyCuECS2hogkzAN8uCHE40OqKrYU5XIrNDLjxeHmN2hs/FZg+FFsuddd0Dh4xN28xZhQfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8575
X-purgate-ID: tlsNG-42698a/1784211641-2C39B9EA-5E251781/0/0
X-purgate-type: clean
X-purgate-size: 2561

schedule_cpu_rm() clears the cpupool pointer of the scheduling
resource before calling sched_deinit_pdata():

    sr->cpupool =3D NULL;
    ...
    sched_deinit_pdata(data->old_ops, data->ppriv_old, cpu);

For RTDS, rt_deinit_pdata() calls move_repl_timer() when the
replenishment timer lives on the cpu being removed, and
move_repl_timer() dereferences get_sched_res(old_cpu)->cpupool
without checking it for NULL. Removing the last pCPU from an RTDS
cpupool therefore dereferences NULL + 0x10 (the res_valid member)
and panics:

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

Treat a NULL cpupool like a cpupool with no remaining scheduling
resources and kill the timer, which is the intent of the existing
comment in move_repl_timer().

Fixes: b6f5334aeaca ("sched: fix cpu offlining with core scheduling")
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/common/sched/rt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index f1feb4384e..49a9b76b89 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -766,8 +766,9 @@ rt_switch_sched(struct scheduler *new_ops, unsigned int=
 cpu,
=20
 static void move_repl_timer(struct rt_private *prv, unsigned int old_cpu)
 {
-    cpumask_t *online =3D get_sched_res(old_cpu)->cpupool->res_valid;
-    unsigned int new_cpu =3D cpumask_cycle(old_cpu, online);
+    const struct cpupool *c =3D get_sched_res(old_cpu)->cpupool;
+    unsigned int new_cpu =3D c ? cpumask_cycle(old_cpu, c->res_valid)
+                             : nr_cpu_ids;
=20
     /*
      * Make sure the timer run on one of the cpus that are still available
--=20
2.43.0

base-commit: 959fa8800470e3d757b5a0bcd9394954ed7b923a
branch: amoi_sched_6=

