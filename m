Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046BB606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=ms4S90o+
Received: from list by lists.xenproject.org with outflank-mailman.1479831.1683740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIy-000450-Ll; Mon, 09 Nov 2026 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479831.1683740; Mon, 09 Nov 2026 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNIy-00043G-E3; Mon, 09 Nov 2026 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1479831;
 Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQNIw-0003qE-MM
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIw-003aoG-2r
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aaa3-e002-0a2a0a5209dd-0a2a4507d888-30
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:50 +0100
Received: from [52.101.83.89]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab0-b4ea-0a2a45070019-34655359e23e-6
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
 b=cump2jZ0c588s3cOZPAvc0I+v9GNG0p2VsoO6rFFL9/hJ3LgH27l4iEUttf6AtmJtaYpowu4rRHNSzwB579THp7Dnm7WYvHMzJ/0CTRG90DlWkxAfRbrQNBJsmGz4bvTcShjHbps0HycTvBb/bhxJcTm7+XcIdEWZxWdfPkymP9itqgAn9TSAUawAFu8wzaBYEGTy7WASXbLzmmtdtD8NLxI0XkwsAy6sFw8pbHqNP4RoKSA3pMecjjdGTPb8lKcHOiTk8XxPJAWkKg0OkMqMRZFYaq6BLnmD2pfN3VzHy+vdJDvu6sXOqhfbg7cnWCrkXUk9IR66pbkfsXvf18r3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j071lkv/T9MKGKKRxrfVTvQM3R2BSkqTGwzSgXyNeIw=;
 b=ZQmoJmkgc9oi6/iukZCUs5WSDvTdcOFY31B1r58SyXhyoLjOgN4Rk8F0DAGXdEpwtgeBIRH3n1Gaf26XwCeOw0loPzWPvja8Lt0oA9aFCNXnY35Sz20aU2VXHw4/sLvK0jR0Nln3O7lYf+r2OergL2M9hdVxBKqCbADsnIuAWHITdRKPOoZjAhs1wfTKxfzBpgwEBYPrj+ntKOiJPWVi2HHrPtuGd0SjtjgNlE3P3r5KF+qw3vtDAgngyEjxPi5WHrb4iPaikzbx1zqfQ+1JFOmRfEVYu3Rp+TNRbrfYTY4NxTQFe6ZVwF8GMv7NPEO9cyGV66a75iCv34saXo/8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j071lkv/T9MKGKKRxrfVTvQM3R2BSkqTGwzSgXyNeIw=;
 b=ms4S90o+1pbfeP2o1Aq4RGb3RDV9jtJH7F3DU1/7IU0OgV1FnUICT+5Utn+j3FaB3A+IOgBvQZNWllWp/YdBFJ7kNXjTS+BlatxsRDh4h6CjARyy9Gx3UBB6FZCprg7ZFJuwq9RbSH0qcgdHKbOmOekvIfft6RerZi95b4lk3JJDyUoAe0iATP5SBN1RKm3cynLQ3tNr+mqRtcmtmqb+U6ex3Km2oaxqJTxkaYJONwuja3UTjk3Rrm4za9Vn0keFTnS4w0XncqjJS2ZIYCmUTHQtd2xvTTDFKsgpQynQMGNQ9d0rLlOR2pYhgztqB60W2/9muVDDeTSs99aYgaFHRA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 3/6] Kconfig: Make cpu hotplug configurable
Thread-Topic: [PATCH v11 3/6] Kconfig: Make cpu hotplug configurable
Thread-Index: AQHdcDtAh71ivUKJ/UmfMX2hXYn9Ww==
Date: Mon, 9 Nov 2026 11:12:48 +0000
Message-ID:
 <eb7fa68092bad4d0db6e1693451e905b081ee9d6.1794222015.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 03da3311-469f-4fb0-2305-08df3e526376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10063799003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003;
x-microsoft-antispam-message-info:
 3ABTxXqQCJ20Lv1Q+YQGMo/NtXiaYJLai+smYnxyyYxQDgKw3avF+EojxPFIuiMHWLlBN7wf8E/0vMJe8ncNfWVn6w0ykRkNsb01X4JyhBPEgOv0rKuMthJx2MLopFaIPuTapcd5ILBCO47vID8lE+EqRZMLi/ajmOEPkakCOR+ha5unZ4NuhSCKCpq4ww5H9qSHB4S54aqaDJgxin21Uwytm+e6VUBoOT/OL98OH6e7HeACyiXdGKfm/FFror7Kfz0vkzwlXCTpu4Grj48ShyiJPEa4Qgl6pzAPECOXvz7wZbeHZuwIkmxh3y+2IKxk2LqVOHq+YB7CZTfxZCGEdYlHc1nVTc/HplH/ul2zgjyv/oCOHhuC55mAIOuGicAPxlkVNLp8Kj5JNikg/VNkcBVc/7RD050Vzi1CIiCACORxv+b65OGTLOX45oyArJgQmi00NZDtYHtxbQXgQjVZZY96MPESH0Z9Xkj4JLuN7yDPPjNaIcMReFMDC3r/+fZkZvW3/NwKoy+2Yz4QMsST+i25SaGxs6fp8Hy7kqHZbjaY5MwLx9d3WK1Muv1r1ADmU+9gst5ezqZnClZ3up3K0FNcaWtehNKKwhMfzBhidwpZmgE3gs8NWsxKmhDzaiqZB5Bpl5EOUpIBnd1FTL+5VLm/vQI+8Z33brPWbPPBpq5v9JC/LpgCG4wm6fOnMo1MSZ4gsAgrk81BE9VVd2XtyiA0TnNeG53p74G2Hra2yN4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10063799003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7v4PPdJxlisFb7OFzwgcaHRcbMZ5B6iBD3aKwD8qIenADFkPp+RQYcv4zA?=
 =?iso-8859-1?Q?v/D6736w9aMq5VUrdr+JwE2oM/U/AUOiUUJeAeIJauqp6bFlV6AxB1F1Dx?=
 =?iso-8859-1?Q?6ptDahUwp7mnh44qQkhmwxvR0a2iX6H7BzmMMNq46jq56TGsLOn3PYVxOj?=
 =?iso-8859-1?Q?F0xWwPbCU4feqIvvhRhZr80D3dlJpU+WS/X85KjafcuRGlaq1JNAzVbab/?=
 =?iso-8859-1?Q?LinOsbD1GxilE7FBd+qMUnwXapaNGuTonMQ+G2Z7M67CrRIDEx2eFlUABM?=
 =?iso-8859-1?Q?AGYIEmgdNn1LmlNp36NkqTYKSfzcSmPiqOHw3vMBPFdjCDImn67C9AOAEJ?=
 =?iso-8859-1?Q?XXtF5h7ToNoxokGq03I2zsAOdk9JA0qWZxZgT43uPYR/NBjLzQi53wiEO/?=
 =?iso-8859-1?Q?hJdQ0NHkcVmojyvxqorYChdD2acbpHhZ2cQk0LzXHczjNBLQ1jK39qo87M?=
 =?iso-8859-1?Q?Kaq9Gop+8CV1di4c7LdiD6v+G6ubg10FKD2JyGgC9lnn08VH+v5mgBq9mJ?=
 =?iso-8859-1?Q?e+QAr424tB6Eb6Qlrn77JnxzmgU41lebWyglioTAW8FOJwl2/WQJbasko+?=
 =?iso-8859-1?Q?pkQILAlZ9daKskr5qTmGnIy+g/ID7vR3bUqIEVut3fSDfkAOPMLNNXyt4N?=
 =?iso-8859-1?Q?/Cz/L+t0kpQBB77K/sqjQ8c5tDKnmFuvpGnbXqRI+ucg0yrGEJV36s+yor?=
 =?iso-8859-1?Q?M4wD/ypQeb4owL6KIt62IPT+V39wzeeyYiUxcQpEeG1C2Pqw061vIUQ6Li?=
 =?iso-8859-1?Q?uq+AF8mFJ9qo9mOx89oiDVPtVjojCfDJ+qvl+t7ITF+6Qp3SDI9IH3ChbU?=
 =?iso-8859-1?Q?28Fe5mzrvidK2YjyTsn8vxTkm04OC+6x4RXIrJo7d5H3trI3tbMgIQEHPI?=
 =?iso-8859-1?Q?P06awC7lbJm4raQ0GH1MlK3+oIONgGc2ptQIflgCxD8FZoXm7pbh8+kOBF?=
 =?iso-8859-1?Q?VM5fpZHYs6DbvbHomPYnokkU8HtJe5jOrZDS7KyS42erq1pC8mlEbeUmDV?=
 =?iso-8859-1?Q?w+9NhZM0B/hiPwOKoqVyxj4pfM425xzZe6M7auroMo1YQFIHNvY2xMCwi/?=
 =?iso-8859-1?Q?WMqIWiY4YzaBfdCeFYgDGXnunWvC7kl937vjbwYf2O0s0Uek2sx0uK09hq?=
 =?iso-8859-1?Q?VcKlA9kq1fUCa8dTGY5lJLYgVOUj5CSqondqswmnuK0p6j9PvkfbUi0Who?=
 =?iso-8859-1?Q?Kir4uXRysYyz1E0bwQ/GE43smkYcA62yO4ot+PpWCw84rG4/RcBb1/yAtl?=
 =?iso-8859-1?Q?8+hY7TjPfkk5VzuPEshY+fpbgo2Sa6zkN7+rIvZftsZ+C99TraOBQdf4YU?=
 =?iso-8859-1?Q?+ljDBqNUOzFmjmczNXimi4XmTsF9kdCJj+rKmdhhZjBz97kbbkEE7TI+4d?=
 =?iso-8859-1?Q?ioZvGxCaKCd2srNlTfhwp3udE0qg68NIoZgrpcdavD2SUtbmNm7GKyi8zp?=
 =?iso-8859-1?Q?jTHbn3sc1cMWZE0kE0rCkDP/UNiiENfbGwcQ/iqBOQHkBTVMmRHr8tIVxK?=
 =?iso-8859-1?Q?4q0/qhf9Qg8Ba01MRbGZVgHboQcNCwx16rvN3HiVmhYi4oQ1HtpR8L35Jx?=
 =?iso-8859-1?Q?vTzwHyVPK8FElJF5j7PihgPZD1+9LyjCtBoUoy5bmlNztiSAKiNn6FSJF+?=
 =?iso-8859-1?Q?o9lmvbRRLVzhUKwhbTC9ot443T7m5omBiRBj3LfthK/FlRxVeqPlAxufEr?=
 =?iso-8859-1?Q?Nhub5AmQLz91Ja5Y6DeURijtygFKFt28i6o0Igt/oH6kDamRqDZD/T64MR?=
 =?iso-8859-1?Q?Pw0nDrrxDGKipwgQ9ArR7hroU+qOx+wC+sLmAc6l4wNd0N8LfKfRm/6Pxk?=
 =?iso-8859-1?Q?sscHyUMGDQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03da3311-469f-4fb0-2305-08df3e526376
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:48.6804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOt9nkce1xvEhfkI/5/ewP8EcNvGtaW1ct+R8W8PAZ6IY3c88FInEzQiBOn04KOF3vEuv7xkif9mwjm/b56fEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-ef75cf/1794222770-348C9AE4-D8B96799/10/78276251493
X-purgate-type: spam
X-purgate-size: 3713
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For the purposes of certification, we want as little code as possible to
be unconditionally compiled in. Make CPU hotplug and SMT operations
configurable to ease the process. This will also help with introducing
CPU hotplug on Arm, where it needs to be configurable.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v10->v11:
* no changes

v9->v10:
* no changes

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
index 0f3c791fc2..2d43d20143 100644
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
index ae4e5a66d7..e3c4c0d5e0 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -416,6 +416,7 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
 long cf_check cpu_up_helper(void *data)
 {
     unsigned int cpu =3D (unsigned long)data;
@@ -443,8 +444,10 @@ long cf_check cpu_down_helper(void *data)
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
index 5b289e444f..5713dc1f9c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -646,6 +646,14 @@ config SYSTEM_SUSPEND
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
2.56.0

