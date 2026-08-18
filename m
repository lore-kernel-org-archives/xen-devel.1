Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400C1C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393699.1632529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUq-0007t8-A6; Tue, 18 Aug 2026 08:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393699.1632529; Tue, 18 Aug 2026 08:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUq-0007rX-4S; Tue, 18 Aug 2026 08:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1393699;
 Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUo-0007f3-EU
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUn-008KNP-RH
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-22
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:33 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-7
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:33 +0200
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
 b=XA7euOYsHUVqwmqOXJ4CECa1OsyPTZN8QlhRI4iFAs1dDAwZcLbwqhpVJZZKvhVoBuS55URw6rEECrWJl/P9whRxQAPe9w0eTf1mX3ldDhA9dkaCLOQDm6RN/TlB1g9CjKZMWUbEU5NGw0S4zZvnoU4ghINB0r70YV28PGQndvwG1dERUt+h4pikxYeLw/COXDhg/r5yLw+w76t9Cn3Gck71CG6EubWnrHIBXkY/7KLzGU9PI6nDItME3JZh7HRPZ+JBzzUXuyxqrKOe7PJCZo4yBiK94watAsj2rqapJX1IRoKZnJH9qacsDOALzRBlH4A9VLBaOxTnOFyYzfyuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCYQupUGrePIwOZoFAb9n8q7lPaplrW6wSkuZ8P8hMk=;
 b=NuNkRuDN/jjsshObkBB8PeV0tFboncsAStK0/UmMntO0r6IeLlKD62RkLzv701RHhPoN2w4LUfuNowtCt6RuJtXKid3E4wGUWn0dRr+5rrLNzP7tI7n0vYhlaXsUguhbul3Kz+kpwVsBgEcoeNa0sVRJ33PcFx7T60dH1MjoQr6zxhAXRbpB0j1RGY2vWiT0n22iBMY7pPd/9NWINbuKcv9f/x4PzufYSAqlnWn77rdWIObQw56aI/xYeq32SUg5cvYj3fRM4r7GFlJ0XPMDAK5SHVSsWNTCiPkjXcXS29EdVkehXlTU4oASI5ElZ9pCUa5x3+4jbTpzkQzCC72Klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCYQupUGrePIwOZoFAb9n8q7lPaplrW6wSkuZ8P8hMk=;
 b=h+RABc+jFhGt6wY8u0z25aQ+NRQi2Fr3OjEaiW/b1a0f99WeHo1utkbUK0tCDy9Pw6ypwCR0GTiDODbH//EnuWwLvpEguET8YFvaq10cxQ543VTtrxMXIdZzz3j92E6Kb2tLoyJ4SX8seX/kgbt3F4AYnE8xbgtiAydQDUP3j40z5xEiXt2bZ9VfZX+sY2lI8M04Dwx5vHMPAfWTZrZn3qAHW0Ny8E6TVYTtlI6m7KxeMh18Md0/MIkt6rZYrEwXvzx5PjexPfHWVIlsArTHAsjTWrWtXA7JJO9j5bVRatIp0ssPgnFzUFXnSEW4pavAi00xU75avdpEAN6XokRyDw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v9 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHdLu5Xf1tMU9esMkGqVTTU0TAa7Q==
Date: Tue, 18 Aug 2026 08:48:30 +0000
Message-ID:
 <81919da6e316cd22e06f34ccd8826695adde3293.1787042017.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: b8870e4e-62e7-46ad-7552-08defd057a6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|10063799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Po0GifBh7cgp5az8JAVK52TOF6unxWcuStOsIXG0KHnPA6FrSlCuB91pYzqucmQr7X6Bbj6+DYxwxcbK69lhMjdU/TEQpiJ8toasQP16Zd2+7mWquvS7Vk9nvJFBlLnmRlBirVcoOcYBNEZedoo08Xm61ffeN1hQzmhz2WDvtYw+FEEO1DM2K5es41gvd3O0GlOjlkrzMwtxX2IxSnBW8rBmKbUJfTT4u5gx52XE34BAmwuIyDJF8AjKcxD+9eLTTIxuIXu083lhx1MOv0irL7G4f/0II8btsq12RZ1oTJWB5/B9aNv1Zt8+4SUf/L8uTnOEKfHaw3o9WgpU6nNdLRJkI/eppEX000PDRxZfSO4gMOZPolPxQFTLqrEHwxAk029xGnlVeMVPXxI/Y495dfKPcI0ryZMWRL45zxt30L8JT5CtfTfrOR9M+TVoB6qKTiHy8//+t91cIb0zvzkjKBr+4yYKZQvrLAMSj9bCy9dk/9Iwt0sp+Ef92Jhdz0iFu0F5P3JfuyXOGd36qOntRzWN3T183nILdUHSqX3yByct2T0iJeaydRBtjOEVhxFCb0EkWx3iGfyt9pAHS6fKEEejwGw/x6eaLQn/YDeiGZjlivV6TkiWSKJfn9jQimjY3EuEQ4yUqZn9PWzkcBQjtY/RSA4tbE8h28MpIT20bA93apt0+drMD2nk1UzkcjuBcJgZwxcMox0utFwHblwUPL4nS0hngG044tczF7UhAOo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(10063799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1VxlDq+IjzQtAWBqqG4EAI4h7cFCNSqWrMKnQWKy+N7PHesyT0e+L4YcEO?=
 =?iso-8859-1?Q?XTH983gq7yFooDOA7Nah5EX+rb4iTmQPoZIl42IwdCBeinFqugDxuV2KML?=
 =?iso-8859-1?Q?9alTWk38FrKIqqyw8cDC7jA0opcrpwDLvwoUXymCfnxf67tHCEV6cRCQ/w?=
 =?iso-8859-1?Q?feiBNPEv3ku+yvPWyAZckRsaMTj9lNYCAFaV/gWptoDNr9cCqKBDYZKcDS?=
 =?iso-8859-1?Q?0ZgCkdlrn9TgCItUFjBk9KFXn9OVbFRsTTbu1HM7oaX/0ROn/Fd425w59/?=
 =?iso-8859-1?Q?v/QjJadW2puRlWM/dAOYPzM7VzFFuIFIdbDUVDBaY4I/d5tccYVeLoccAa?=
 =?iso-8859-1?Q?wylY3HD0vudzKvRtOiOmablO2BM4PViQacddYKD2DmzZMBJC2n8XWRk7wg?=
 =?iso-8859-1?Q?jcNY6L+tnB5JAtqehjloRWx38f2QJ/VxxUVGKhAprVySXM0ihbD+CBfPU9?=
 =?iso-8859-1?Q?XKbxD8m06F+WV5tpb7g0rT2e0zCyQMdNIjHgar6KOTOIawjW7uvbDryEN9?=
 =?iso-8859-1?Q?GspadPRvcQg4sVBa2c2zNWNVPBrX5zUvYNL/oYIM6HlzN9IzLf0gLBhZSj?=
 =?iso-8859-1?Q?dBr5vnizTi+GbRo7mFXTF1hfg3HOwllyidbu/FJWfzxgBdpmg0q2LaPvua?=
 =?iso-8859-1?Q?RRY5/361EHjrVUqz50YihGBuolqDWfxJGgwsSZwC1XStcpbk4hzAUhT+PI?=
 =?iso-8859-1?Q?uWmCVMqrls/53D9NhERed770wAOjIpOOPJb9ddbiark0q5AY3RzQUzp5tU?=
 =?iso-8859-1?Q?yEySHFSdYg/H0q1GoHPuATPnAq57SsnbsiZnsm0W1uFiaFuw3tCGyawas3?=
 =?iso-8859-1?Q?Sgww1+qlzo8JPxtfWBrbdb0HRUh62JzD8ZXZFvQE6qzjdupi0z2w+g6wsS?=
 =?iso-8859-1?Q?Oy2QLYwUhrtbglqf+qSyVUtjlHrJq0Y4llvcnxZUQfebDSd/+pwDOZecSh?=
 =?iso-8859-1?Q?ET8t8H0EnpfjkQjsph7ahzLDTF2uFQG4bbXzJpM1+xH6rDHERVkeih3+yA?=
 =?iso-8859-1?Q?hxJmbT1A7B1LZe1t2VFvgEyuZBK0dJUwTd0uFybN52Pr45aEi4fMhsJTZU?=
 =?iso-8859-1?Q?iIWmsbCwxSL3uUOxxhWbu+7QaydqRxG+4oEv5AZib4EIY0MZEbt0p9u6l2?=
 =?iso-8859-1?Q?9WbV8PYeJwLdjKeBerAZlHrpVtVjhOLtaKOkNzq3YXAFzh6mRfIuTV0/df?=
 =?iso-8859-1?Q?KSf+NMoCNIN2z6+6tATD2hwRg0Dmu+pVRvUyqFT2KsQ2/d0TNzQNVcHWet?=
 =?iso-8859-1?Q?Jss9AmWDqr+WF7H5s6QNYUiZJjEiLjAZKhgPRW7JuMyOMeYFSLyevI3MbO?=
 =?iso-8859-1?Q?twTboAog/UjyZeEN3qqIawew+aoeMM3+nNM1oYG5i8DqUUXHF/gy6nkWAj?=
 =?iso-8859-1?Q?CebF9Zk3RT5zoXWzjBBz0K4gXaMVhNEv1RlZWkFvQKrStVoYun6Z5JFHdU?=
 =?iso-8859-1?Q?bfbwrOtYjJtjRiodW5sYHn9vrFSz0LPdjJ3qXkbwWmZBiGKBEXlvj1yCjo?=
 =?iso-8859-1?Q?Yq6jlLhrnC1tLxf9jIZvMgbZX8gO2hv7LSZgnse+tb3X9hKOSCrhYvsqIn?=
 =?iso-8859-1?Q?jNay687mOyJaHVHl9kUAfX4gOSope3OOcCFoGebC/PSNtZuHYFaTKnOsjx?=
 =?iso-8859-1?Q?tB/mTrnOFO3rw410Dz4CcOrGYAhndHgAXDZsnWG/woaGQAucQkiEbdwwIa?=
 =?iso-8859-1?Q?G4i1j40QXLNvOevfp16Do41ITwO1VWBt/cc7piusXr3VmPEQL+TO7IAsQs?=
 =?iso-8859-1?Q?2VPsWbiOpFyTlvODMcNfozeUo2vxX96Dq46R10zaBM4kDlFZNo8bsIN+mQ?=
 =?iso-8859-1?Q?pSqtvSf7u2WRc6KlsdG7fFczmU+yYsU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8870e4e-62e7-46ad-7552-08defd057a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:30.1569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8v+Z4m5n6tEJuuc74GyCj1PF/lsHcFu5S1I+lyB0C18Ce8ZikNlGflzQmesJEG7b+qGsvY1G+YG5dUaFrJRabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042913-30FCE2AC-2EB71826/0/0
X-purgate-type: clean
X-purgate-size: 3660

For the purposes of certification, we want as little code as possible to
be unconditionally compiled in. Make CPU hotplug and SMT operations
configurable to ease the process. This will also help with introducing
CPU hotplug on Arm, where it needs to be configurable.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v8->v9:
* add "if EXPERT"
* add AB

v7->v8:
* fix style
* s/CPU_HOTPLUG/CPU_ONLINE_OFFLINE/

v6->v7:
* new patch
---
 xen/arch/x86/platform_hypercall.c | 12 ++++++++++++
 xen/arch/x86/smp.c                |  3 +++
 xen/arch/x86/sysctl.c             | 12 ++++++++++++
 xen/common/Kconfig                |  8 ++++++++
 4 files changed, 35 insertions(+)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hype=
rcall.c
index 6dee4922f3..361a4cd37a 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -735,6 +735,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         if ( cpu >=3D nr_cpu_ids || !cpu_present(cpu) ||
              clocksource_is_tsc() )
         {
@@ -757,6 +763,12 @@ ret_t do_platform_op(
     {
         int cpu =3D op->u.cpu_ol.cpuid;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         if ( cpu =3D=3D 0 )
         {
             ret =3D -EOPNOTSUPP;
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 7936294f5f..9046c826f8 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,6 +418,7 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
 long cf_check cpu_up_helper(void *data)
 {
     unsigned int cpu =3D (unsigned long)data;
@@ -445,8 +446,10 @@ long cf_check cpu_down_helper(void *data)
 {
     int cpu =3D (unsigned long)data;
     int ret =3D cpu_down(cpu);
+
     /* Have one more go on EBUSY. */
     if ( ret =3D=3D -EBUSY )
         ret =3D cpu_down(cpu);
     return ret;
 }
+#endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 6bd4e191a7..10d485e633 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -53,6 +53,12 @@ static long cf_check smt_up_down_helper(void *data)
     unsigned int cpu, sibling_mask =3D boot_cpu_data.x86_num_siblings - 1;
     int ret =3D 0;
=20
+    if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EOPNOTSUPP;
+    }
+
     opt_smt =3D up;
=20
     for_each_present_cpu ( cpu )
@@ -120,6 +126,12 @@ long arch_do_sysctl(
         long (*fn)(void *data);
         void *hcpu;
=20
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+        {
+            ret =3D -EOPNOTSUPP;
+            break;
+        }
+
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba84..f029addbfd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -643,6 +643,14 @@ config SYSTEM_SUSPEND
=20
 	  If unsure, say N.
=20
+config CPU_ONLINE_OFFLINE
+	bool "CPU online/offline support" if EXPERT
+	depends on X86
+	default y
+	help
+	  Enable support for bringing CPUs online and offline at runtime. On
+	  X86 this is required for disabling SMT.
+
 menu "Supported hypercall interfaces"
 	visible if EXPERT
=20
--=20
2.55.0

