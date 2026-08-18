Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A218BC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393700.1632540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUr-00088Y-2B; Tue, 18 Aug 2026 08:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393700.1632540; Tue, 18 Aug 2026 08:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUq-00086p-Ot; Tue, 18 Aug 2026 08:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1393700;
 Tue, 18 Aug 2026 08:48:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUo-0007fA-R8
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUo-008KNP-7l
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-26
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:34 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-8
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:34 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVUPR03MB11425.eurprd03.prod.outlook.com
 (2603:10a6:150:362::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:48:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:48:31 +0000
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
 b=uLvNoI0KfGoYRIKf3RcwhpIiCsYq9/7CV7seDvjeLXhNT3ugvRIzqOv7TyAkAkgg+zCACE1b6XVG0ZkEsQ6F3/PPmsK4qBkVlBzCj5hA0gYUyaqHQDIIR1Q2s+blBbvdSmG3WZ/jJfBvR+a2o7OhgHcBa5J9GNhc+8JZ6oUw6X80BhZHRzFqx+IBbdKbA2/ec5DosvnJJcsiDRQdU6lq7ZvjN+kIWfq+uBs2cKCpQZM1S6o1z9I05Wb4qUgfMB6aRP/xGB1xN5+mffpu0RC8PHFCo3srPkocOC2g6IUtQs7CoOK/fKc+04A2O71TWnLenyXiat8jLJoJEfA3e6nXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLub64GgmKZmKLFHh2VXjwdM16NT1jk+aUcCFVSJs58=;
 b=A7lSTPYmvkzAx8wo7HJ9cxfJk5HZH9t0PYGA2C6d2ZlPMdov9SvtUrp/emEiFSLRSw2uMG76jQwe1CxXvK8bLijcG8Q+yhxvWnU6M5NLk48noRvRa+pKwZ6YvqzhvXdIcK8ltUTcmrumX0BEmiuHq2aPIn3Z7e8RfJKKWYJH6u7b6qu4RiUkX53e1PJaHV4jLrw7/ImZSMtuxmYDFUo60LOy2oIGvH8zn8twUy4KofHtUoyPnZxZTy178wQbzQS5WrT67DExUMB1kdC4AqUHvPHMOY8oFZwRCBoNTkZKIlZsD8m/bbXFi7lRWcbvN3El5Td9PPVqF3GwUE0+sDp68A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLub64GgmKZmKLFHh2VXjwdM16NT1jk+aUcCFVSJs58=;
 b=r5bXTmIBAP/BF3wyVW/RZVgTfq5M5v79OFWn5dD/mELGXuJ1a7+GbohhlvjkBqV+HP5GDwwtGKTKVex5UEIbK+XDkZzc4sM06g617eOTzoTEUVY05SOvB4uW4VdMVGJZkofX+HzdNVIbQ4DqLzF73HEZZWafgHPycYx+Rb2fh63y7aMP+AhPpJ3kLopWURER3+9Lf9JZaVjF+4fUlTmxWgjAxCsoRQDjMAEvwGNMoA4iqheoMDLOOlcaTogx6WQKBORz55wKrg2K9vAvMst8NgQpDCwqpo5stHsON8AWamnDhfUq+ya8Bx6AdiUMQ4nlvI54brycohS6MlurDsaPOQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v9 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v9 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHdLu5YHRJt4YkHAUu41q6KPLRZ9g==
Date: Tue, 18 Aug 2026 08:48:31 +0000
Message-ID:
 <c1f410ccb1469f1c46d2df94cd76546bf3db00b9.1787042017.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: f5aab0b0-03e4-42f5-4652-08defd057adc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 zHNK1Z+9GI9IiPsW2OmuiOy+bCj48BlpG1iT3TvM8PzIL2UP7MrzXBPU7NBUsGhhthhMm4xqlIh+iG3ushF6OErk5lHy02Um0SVIdGdCKt0rpsIzJ3jukCHTSORLVbZCP4nBc/wakPSPfoeC+xtB4cLaAJqWIyQieSn2woVZ0aJtUwCTw3g1t/doi7kOVt6ef2hLWZGyEGqhZXil3v4rZ+ibJ0diKswQTtbDr+dhRAUO6XiaxyyndP/L88C6HZxhHNHktCyEZV0s3dOKD0FpII4Kg6EXO9N/9PHz+7YNvKdU6euQnru2gDP35wM12z2UsRWGYOUfQzeU0LltWRGq/Rh2NmkwT79SsbkSdOrXihYG/MJhDMK/MdgRj5imsUlcsWFJ+OVb3z7aeWDOyeeqTVz4rteIpIalNf1fMI0knaFXxRYB3lgWnBZ9+UhhXYOG4dphZZ+xqY/7kOPArOe84+r81gRX4q1IZmArdp0RBBT7LFG75Jz2BJmF7wKpvNgSPS+Kss1xicfoVH6Fcdm165y1//udnSHNbRpsXCuwCXOS38mT2oVkCMIucK5e/xyx1XWLLINGlgr5pd9/6ricnhSx+xuZbLhaO1vS0w9fTgo/E1OR3yK6+V/BRvjuabC6TpfSOEQHK8D/VUtP9whXm7EdTBR2+HwHF45PmGxm+EXixf/cbPTNf5J6zaNSRDRkhBNDAsg9R6+4gIu79iLQvZ9KH5oUSlh/6k+R75+eVos=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UhmRKVlEkGdcH/8WueyQ25sFOttLizLRdsv0NDqvwjifIK7p9Oi9W1trz8?=
 =?iso-8859-1?Q?s2CtP6vVqD0bKcec1b8H5iE4SsSV5tmiZkPrhsTTobKKKavCG05JHCpOdu?=
 =?iso-8859-1?Q?S3Mf5//25vA3IAEH6r5aONA9PENdcavoG+6PwBT8jE7Vmsa7O+/JDU+ycX?=
 =?iso-8859-1?Q?tkJtLATFdyi2RFgNXgArm5+8C4kv70Tgo0U5whqNB4yNdMq+9H9B4BDf7U?=
 =?iso-8859-1?Q?VpquvxLUfMgI3QtVtKjSIosQTUgeMGjo0N1N8013GiL2LkY+3s2KCfKzmH?=
 =?iso-8859-1?Q?SJ+PxZVQtznOsdGq44wZV2cF7uJEyr2mysZPXQyHRYbwN7lL3TJMeDpUma?=
 =?iso-8859-1?Q?EWK0OBDzQzQNt2Tb5ke+PInQcJT3e6y4BNUlIHjsp+m46zQPmavAaGlUYH?=
 =?iso-8859-1?Q?vmnPi1p6vsZyhssvTewnBMqlH54nthSpQAV2P/hPxS7tEQ8OcxFKXOCJsY?=
 =?iso-8859-1?Q?ybuKxCB3SFwahupTB8GfPNaJJx1El7LnmObxv+Ck9I9yeFR+Gpe9qOkSiN?=
 =?iso-8859-1?Q?HlfzptWJb/eZhDIFPzLrmOY93UgtOwdq9UswnuXJ0LXkcw7CSMUXGB6mVf?=
 =?iso-8859-1?Q?cutqwYOBbw+0KqIpXSTuk0MeSlnNHOvqtO227rm8Eh7Qafg9dkGN+KIk7C?=
 =?iso-8859-1?Q?dUVZVWJis1haO/TZC2xZqmdpE4G/9Dy/WtYNZThytHwkj3z+a5sWuUtpHk?=
 =?iso-8859-1?Q?Kwm6DrOwgB2IgTtyaPssBIp0VbKDaAZlPB7CCPfesmRzOjuTlj3Yw0h2fi?=
 =?iso-8859-1?Q?GcV6TEqb+v7MDo11vps49EKGhPItVTP/m1YYvP95ZRdYKBHLUdv5yClUan?=
 =?iso-8859-1?Q?K20FfzuGQ7CxDj9h076nAEdvo/8082g9Z2Y6w5tH5aSniMeYabeegd79Vt?=
 =?iso-8859-1?Q?Y0N8i7Zg95pPHEFuyP0T7cGTECzZO/hmNuXNFyQYlLkDsLWY6kX43ncx7/?=
 =?iso-8859-1?Q?8OHC6DwrCRM1Y6cRqCv+/H0UsjK/MPVLiyU77kgOWD/SuhEIhmdmGlupwm?=
 =?iso-8859-1?Q?yczsBHcNVkU+UPl15GwG/ZXL1AIXGQy/0fHaRcTcuiSYOZEHrRw/rW2+HZ?=
 =?iso-8859-1?Q?Dc4TB3VcKQLe/PMo/cxXNXa/5T8ep4mgKA6j5VpNL6SoNrHfhtF9F5xs/Y?=
 =?iso-8859-1?Q?XICWHeD6sBsLXJ5oZ2SfrvPYfo7oI36HNoa5hDht0Hkve3KW+IHB4UcuNU?=
 =?iso-8859-1?Q?zlebNfQ3MNG2BS6E/BqcqoT8x4BPf5vf1ArkQrjpZQLLXBmmCosq/DJILg?=
 =?iso-8859-1?Q?rcYG2HTCUBeBm3VUTb0mdQCK8bXOjrYXHDljfkr/XhFRLJ0auCzCq7tPlM?=
 =?iso-8859-1?Q?Oj17X+t5cgMpnXi1HuKtcI4WJCOMinajj9povtMWtxe0po309cR+8X5eMT?=
 =?iso-8859-1?Q?/HQCoBwnX0wcx622NxFlebOQZFxHXM2+Ujv2W6vw+/Ql7EEZQt6vuhvVPU?=
 =?iso-8859-1?Q?EA+BmaCvVuu8+Rpc3mFK3+pRwJOc3Zwth2R2WCPARE7SRwkaXUwpvSCfE6?=
 =?iso-8859-1?Q?eXUX8dL26XrT1xpI2dJlvaUoyml4gCiYyohJcDFqXPXSoMSql1xjVgs0Vg?=
 =?iso-8859-1?Q?Au+xV08ZnXsm/MhufSVcF8bZ623n8rtrdSWVTuicHuGIi/hjAZVU8G5/tW?=
 =?iso-8859-1?Q?V2n7b7CZBtSubEQOEYaT+C+SGdPqdyUCQNGFrHUx2FMijoGb11uJYSpx3+?=
 =?iso-8859-1?Q?QHWuqPg8i+49V0+KUUx5pODLOvSt16TqNHK3QNpGrpJnjffFOXy1X198cn?=
 =?iso-8859-1?Q?lfppgwRvTrmGIJk/zhWmzwo1op9EEvDuruX/+pjTNjdZQjYOclLfRMIwcw?=
 =?iso-8859-1?Q?wXmRY4JLy2ddDozfZQhT9US14wV/0Q8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aab0b0-03e4-42f5-4652-08defd057adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:31.0596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKoFFHis06NgzcaAKcqYT98BwTcQs3Z8k7Ssbz+4S4Pm2MqE7P15OsUqQ9Ju3SjB/r4DCXIlA1X6EFbS95kUwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042914-668B42AC-6FF6DE56/0/0
X-purgate-type: clean
X-purgate-size: 24478

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Operations specific to x86 architecture are moved into a separate file
and only built on x86.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v8->v9:
* use CONFIG_X86 instead of CONFIG_MIGRATE
* fix style issues
* add SPDX headers

v7->v8:
* move x86 specific function into a separate file

v6->v7:
* no changes

v5->v6:
* don't change order in Makefile

v4->v5:
* make hptool always build

v3->v4:
* no changes

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 tools/misc/Makefile         |   9 +-
 tools/misc/xen-hptool-x86.c | 278 ++++++++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c     | 293 ++----------------------------------
 tools/misc/xen-hptool.h     |  15 ++
 4 files changed, 314 insertions(+), 281 deletions(-)
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 6ee783f43e..064ab7c4bd 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN                   +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
@@ -104,8 +104,11 @@ xenhypfs: xenhypfs.o
 xenlockprof: xenlockprof.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
=20
-xen-hptool: xen-hptool.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(L=
DLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
+hptool-objs-y :=3D xen-hptool.o
+hptool-objs-$(CONFIG_X86) +=3D xen-hptool-x86.o
+
+xen-hptool: $(hptool-objs-y)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(L=
DLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
=20
 xenhypfs.o: CFLAGS +=3D $(CFLAGS_libxenhypfs)
=20
diff --git a/tools/misc/xen-hptool-x86.c b/tools/misc/xen-hptool-x86.c
new file mode 100644
index 0000000000..95a7e05990
--- /dev/null
+++ b/tools/misc/xen-hptool-x86.c
@@ -0,0 +1,278 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <xenevtchn.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <xenstore.h>
+#include "xen-hptool.h"
+
+int hp_mem_online_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Prepare to online MEMORY mfn %lx\n", mfn);
+
+    ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
+
+    if (ret < 0)
+        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, e=
rrno);
+    else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
+        fprintf(stderr, "Onlining page mfn %lx is broken, "
+                        "Memory online failed\n", mfn);
+        ret =3D -1;
+    }
+    else if (status & PG_ONLINE_ONLINED)
+        printf("Memory mfn %lx onlined successfully\n", mfn);
+    else
+        printf("Memory is already onlined!\n");
+
+    return ret;
+}
+
+int hp_mem_query_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Querying MEMORY mfn %lx status\n", mfn);
+    ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
+
+    if (ret < 0)
+        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, e=
rrno);
+    else
+    {
+        printf("Memory Status %x: [", status);
+        if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
+            printf(" PAGE_OFFLINE_PENDING ");
+        if ( status & PG_OFFLINE_STATUS_BROKEN )
+            printf(" PAGE_BROKEND  ");
+        if ( status & PG_OFFLINE_STATUS_OFFLINED )
+            printf(" PAGE_OFFLINED ");
+        else
+            printf(" PAGE_ONLINED ");
+        printf("]\n");
+    }
+
+    return ret;
+}
+
+static int suspend_guest(xc_interface *xch, xenevtchn_handle *xce, int dom=
id,
+                         int *evtchn, int *lockfd)
+{
+    int port, rc, suspend_evtchn =3D -1;
+
+    *lockfd =3D -1;
+
+    if (!evtchn)
+        return -1;
+
+    port =3D xs_suspend_evtchn_port(domid);
+    if (port < 0)
+    {
+        fprintf(stderr, "DOM%d: No suspend port, try live migration\n", do=
mid);
+        goto failed;
+    }
+    suspend_evtchn =3D xc_suspend_evtchn_init_exclusive(xch, xce, domid,
+                                                      port, lockfd);
+    if (suspend_evtchn < 0)
+    {
+        fprintf(stderr, "Suspend evtchn initialization failed\n");
+        goto failed;
+    }
+    *evtchn =3D suspend_evtchn;
+
+    rc =3D xenevtchn_notify(xce, suspend_evtchn);
+    if (rc < 0)
+    {
+        fprintf(stderr, "Failed to notify suspend channel: errno %d\n", rc=
);
+        goto failed;
+    }
+    if (xc_await_suspend(xch, xce, suspend_evtchn) < 0)
+    {
+        fprintf(stderr, "Suspend Failed\n");
+        goto failed;
+    }
+    return 0;
+
+failed:
+    if (suspend_evtchn !=3D -1)
+        xc_suspend_evtchn_release(xch, xce, domid,
+                                  suspend_evtchn, lockfd);
+
+    return -1;
+}
+
+int hp_mem_offline_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status, domid;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Prepare to offline MEMORY mfn %lx\n", mfn);
+    ret =3D xc_mark_page_offline(xch, mfn, mfn, &status);
+    if (ret < 0) {
+        fprintf(stderr, "Offlining page mfn %lx failed, error %x\n", mfn, =
errno);
+        if (status & (PG_OFFLINE_XENPAGE | PG_OFFLINE_FAILED))
+            fprintf(stderr, "XEN_PAGE is not permitted be offlined\n");
+        else if (status & (PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM))
+            fprintf(stderr, "RESERVED RAM is not permitted to be offlined\=
n");
+    }
+    else
+    {
+        switch(status & PG_OFFLINE_STATUS_MASK)
+        {
+            case PG_OFFLINE_OFFLINED:
+            {
+                printf("Memory mfn %lx offlined successfully, current stat=
e is"
+                       " [PG_OFFLINE_OFFLINED]\n", mfn);
+                if (status & PG_OFFLINE_BROKEN)
+                    printf("And this offlined PAGE is already marked broke=
n"
+                        " before!\n");
+                break;
+            }
+            case PG_OFFLINE_FAILED:
+            {
+                fprintf(stderr, "Memory mfn %lx offline failed\n", mfn);
+                if ( status & PG_OFFLINE_ANONYMOUS)
+                    fprintf(stderr, "the memory is an anonymous page!\n");
+                ret =3D -1;
+                break;
+            }
+            case PG_OFFLINE_PENDING:
+            {
+                if (status & PG_OFFLINE_XENPAGE) {
+                    ret =3D -1;
+                    fprintf(stderr, "Memory mfn %lx offlined succssefully,=
"
+                            "this page is xen page, current state is"
+                            " [PG_OFFLINE_PENDING, PG_OFFLINE_XENPAGE]\n",=
 mfn);
+                }
+                else if (status & PG_OFFLINE_OWNED)
+                {
+                    int result, suspend_evtchn =3D -1, suspend_lockfd =3D =
-1;
+                    xenevtchn_handle *xce;
+                    xce =3D xenevtchn_open(NULL, 0);
+
+                    if (xce =3D=3D NULL)
+                    {
+                        fprintf(stderr, "When exchange page, fail"
+                                " to open evtchn\n");
+                        return -1;
+                    }
+
+                    domid =3D status >> PG_OFFLINE_OWNER_SHIFT;
+                    if (suspend_guest(xch, xce, domid,
+                                      &suspend_evtchn, &suspend_lockfd))
+                    {
+                        fprintf(stderr, "Failed to suspend guest %d for"
+                                " mfn %lx\n", domid, mfn);
+                        xenevtchn_close(xce);
+                        return -1;
+                    }
+
+                    result =3D xc_exchange_page(xch, domid, mfn);
+
+                    /* Exchange page successfully */
+                    if (result =3D=3D 0)
+                        printf("Memory mfn %lx offlined successfully, this=
 "
+                                "page is DOM%d page and being swapped "
+                                "successfully, current state is "
+                                "[PG_OFFLINE_OFFLINED, PG_OFFLINE_OWNED]\n=
",
+                                mfn, domid);
+                    else {
+                        ret =3D -1;
+                        fprintf(stderr, "Memory mfn %lx offlined successfu=
lly"
+                                " , this page is DOM%d page yet failed to =
be "
+                                "exchanged. current state is "
+                                "[PG_OFFLINE_PENDING, PG_OFFLINE_OWNED]\n"=
,
+                                mfn, domid);
+                    }
+                    xc_domain_resume(xch, domid, 1);
+                    xc_suspend_evtchn_release(xch, xce, domid,
+                                              suspend_evtchn, &suspend_loc=
kfd);
+                    xenevtchn_close(xce);
+                }
+                break;
+            }
+        }//end of switch
+    }//end of if
+
+    return ret;
+}
+
+int main_smt_enable(int argc, char *argv[], xc_interface *xch)
+{
+    int ret;
+
+    if ( argc )
+    {
+        show_help();
+        return -1;
+    }
+
+    for ( ;; )
+    {
+        ret =3D xc_smt_enable(xch);
+        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
+            break;
+    }
+
+    if ( ret < 0 )
+        fprintf(stderr, "Unable to enable SMT: errno %d, %s\n",
+                errno, strerror(errno));
+    else
+        printf("Enabled SMT\n");
+
+    return ret;
+}
+
+int main_smt_disable(int argc, char *argv[], xc_interface *xch)
+{
+    int ret;
+
+    if ( argc )
+    {
+        show_help();
+        return -1;
+    }
+
+    for ( ;; )
+    {
+        ret =3D xc_smt_disable(xch);
+        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
+            break;
+    }
+
+    if ( ret < 0 )
+        fprintf(stderr, "Unable to disable SMT: errno %d, %s\n",
+                errno, strerror(errno));
+    else
+        printf("Disabled SMT\n");
+
+    return ret;
+}
diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 590810b6eb..7b886e2304 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -6,8 +6,8 @@
 #include <xenguest.h>
 #include <xenstore.h>
 #include <xen-tools/common-macros.h>
+#include "xen-hptool.h"
=20
-static xc_interface *xch;
=20
 void show_help(void)
 {
@@ -18,239 +18,25 @@ void show_help(void)
             "  help                     display this help\n"
             "  cpu-online    <cpuid>    online CPU <cpuid>\n"
             "  cpu-offline   <cpuid>    offline CPU <cpuid>\n"
+#if defined(__i386__) || defined(__x86_64__)
             "  mem-online    <mfn>      online MEMORY <mfn>\n"
             "  mem-offline   <mfn>      offline MEMORY <mfn>\n"
             "  mem-status    <mfn>      query Memory status<mfn>\n"
             "  smt-enable               onlines all SMT threads\n"
             "  smt-disable              offlines all SMT threads\n"
+#endif
            );
 }
=20
 /* wrapper function */
-static int help_func(int argc, char *argv[])
+static int help_func(int argc, char *argv[], xc_interface *xch)
 {
     show_help();
     return 0;
 }
=20
-static int hp_mem_online_func(int argc, char *argv[])
-{
-    uint32_t status;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Prepare to online MEMORY mfn %lx\n", mfn);
-
-    ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
-
-    if (ret < 0)
-        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, e=
rrno);
-    else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
-        fprintf(stderr, "Onlining page mfn %lx is broken, "
-                        "Memory online failed\n", mfn);
-        ret =3D -1;
-    }
-    else if (status & PG_ONLINE_ONLINED)
-        printf("Memory mfn %lx onlined successfully\n", mfn);
-    else
-        printf("Memory is already onlined!\n");
-
-    return ret;
-}
-
-static int hp_mem_query_func(int argc, char *argv[])
-{
-    uint32_t status;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Querying MEMORY mfn %lx status\n", mfn);
-    ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
-
-    if (ret < 0)
-        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, e=
rrno);
-    else
-    {
-        printf("Memory Status %x: [", status);
-        if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
-            printf(" PAGE_OFFLINE_PENDING ");
-        if ( status & PG_OFFLINE_STATUS_BROKEN )
-            printf(" PAGE_BROKEND  ");
-        if ( status & PG_OFFLINE_STATUS_OFFLINED )
-            printf(" PAGE_OFFLINED ");
-        else
-            printf(" PAGE_ONLINED ");
-        printf("]\n");
-    }
-
-    return ret;
-}
-
-static int suspend_guest(xc_interface *xch, xenevtchn_handle *xce, int dom=
id,
-                         int *evtchn, int *lockfd)
-{
-    int port, rc, suspend_evtchn =3D -1;
-
-    *lockfd =3D -1;
-
-    if (!evtchn)
-        return -1;
-
-    port =3D xs_suspend_evtchn_port(domid);
-    if (port < 0)
-    {
-        fprintf(stderr, "DOM%d: No suspend port, try live migration\n", do=
mid);
-        goto failed;
-    }
-    suspend_evtchn =3D xc_suspend_evtchn_init_exclusive(xch, xce, domid,
-                                                      port, lockfd);
-    if (suspend_evtchn < 0)
-    {
-        fprintf(stderr, "Suspend evtchn initialization failed\n");
-        goto failed;
-    }
-    *evtchn =3D suspend_evtchn;
-
-    rc =3D xenevtchn_notify(xce, suspend_evtchn);
-    if (rc < 0)
-    {
-        fprintf(stderr, "Failed to notify suspend channel: errno %d\n", rc=
);
-        goto failed;
-    }
-    if (xc_await_suspend(xch, xce, suspend_evtchn) < 0)
-    {
-        fprintf(stderr, "Suspend Failed\n");
-        goto failed;
-    }
-    return 0;
-
-failed:
-    if (suspend_evtchn !=3D -1)
-        xc_suspend_evtchn_release(xch, xce, domid,
-                                  suspend_evtchn, lockfd);
-
-    return -1;
-}
-
-static int hp_mem_offline_func(int argc, char *argv[])
-{
-    uint32_t status, domid;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Prepare to offline MEMORY mfn %lx\n", mfn);
-    ret =3D xc_mark_page_offline(xch, mfn, mfn, &status);
-    if (ret < 0) {
-        fprintf(stderr, "Offlining page mfn %lx failed, error %x\n", mfn, =
errno);
-        if (status & (PG_OFFLINE_XENPAGE | PG_OFFLINE_FAILED))
-            fprintf(stderr, "XEN_PAGE is not permitted be offlined\n");
-        else if (status & (PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM))
-            fprintf(stderr, "RESERVED RAM is not permitted to be offlined\=
n");
-    }
-    else
-    {
-        switch(status & PG_OFFLINE_STATUS_MASK)
-        {
-            case PG_OFFLINE_OFFLINED:
-            {
-                printf("Memory mfn %lx offlined successfully, current stat=
e is"
-                       " [PG_OFFLINE_OFFLINED]\n", mfn);
-                if (status & PG_OFFLINE_BROKEN)
-                    printf("And this offlined PAGE is already marked broke=
n"
-                        " before!\n");
-                break;
-            }
-            case PG_OFFLINE_FAILED:
-            {
-                fprintf(stderr, "Memory mfn %lx offline failed\n", mfn);
-                if ( status & PG_OFFLINE_ANONYMOUS)
-                    fprintf(stderr, "the memory is an anonymous page!\n");
-                ret =3D -1;
-                break;
-            }
-            case PG_OFFLINE_PENDING:
-            {
-                if (status & PG_OFFLINE_XENPAGE) {
-                    ret =3D -1;
-                    fprintf(stderr, "Memory mfn %lx offlined succssefully,=
"
-                            "this page is xen page, current state is"
-                            " [PG_OFFLINE_PENDING, PG_OFFLINE_XENPAGE]\n",=
 mfn);
-                }
-                else if (status & PG_OFFLINE_OWNED)
-                {
-                    int result, suspend_evtchn =3D -1, suspend_lockfd =3D =
-1;
-                    xenevtchn_handle *xce;
-                    xce =3D xenevtchn_open(NULL, 0);
-
-                    if (xce =3D=3D NULL)
-                    {
-                        fprintf(stderr, "When exchange page, fail"
-                                " to open evtchn\n");
-                        return -1;
-                    }
-
-                    domid =3D status >> PG_OFFLINE_OWNER_SHIFT;
-                    if (suspend_guest(xch, xce, domid,
-                                      &suspend_evtchn, &suspend_lockfd))
-                    {
-                        fprintf(stderr, "Failed to suspend guest %d for"
-                                " mfn %lx\n", domid, mfn);
-                        xenevtchn_close(xce);
-                        return -1;
-                    }
-
-                    result =3D xc_exchange_page(xch, domid, mfn);
-
-                    /* Exchange page successfully */
-                    if (result =3D=3D 0)
-                        printf("Memory mfn %lx offlined successfully, this=
 "
-                                "page is DOM%d page and being swapped "
-                                "successfully, current state is "
-                                "[PG_OFFLINE_OFFLINED, PG_OFFLINE_OWNED]\n=
",
-                                mfn, domid);
-                    else {
-                        ret =3D -1;
-                        fprintf(stderr, "Memory mfn %lx offlined successfu=
lly"
-                                " , this page is DOM%d page yet failed to =
be "
-                                "exchanged. current state is "
-                                "[PG_OFFLINE_PENDING, PG_OFFLINE_OWNED]\n"=
,
-                                mfn, domid);
-                    }
-                    xc_domain_resume(xch, domid, 1);
-                    xc_suspend_evtchn_release(xch, xce, domid,
-                                              suspend_evtchn, &suspend_loc=
kfd);
-                    xenevtchn_close(xce);
-                }
-                break;
-            }
-        }//end of switch
-    }//end of if
-
-    return ret;
-}
-
-static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, int), int cpu)
+static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, int), int cpu,
+                          xc_interface *xch)
 {
     int ret;
=20
@@ -265,7 +51,7 @@ static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, i=
nt), int cpu)
     return ret;
 }
=20
-static int hp_cpu_online_func(int argc, char *argv[])
+static int hp_cpu_online_func(int argc, char *argv[], xc_interface *xch)
 {
     int cpu, ret;
=20
@@ -277,7 +63,7 @@ static int hp_cpu_online_func(int argc, char *argv[])
=20
     cpu =3D atoi(argv[0]);
     printf("Prepare to online CPU %d\n", cpu);
-    ret =3D exec_cpu_hp_fn(xc_cpu_online, cpu);
+    ret =3D exec_cpu_hp_fn(xc_cpu_online, cpu, xch);
     if (ret < 0)
         fprintf(stderr, "CPU %d online failed (error %d: %s)\n",
                 cpu, errno, strerror(errno));
@@ -287,7 +73,7 @@ static int hp_cpu_online_func(int argc, char *argv[])
     return ret;
=20
 }
-static int hp_cpu_offline_func(int argc, char *argv[])
+static int hp_cpu_offline_func(int argc, char *argv[], xc_interface *xch)
 {
     int cpu, ret;
=20
@@ -298,7 +84,7 @@ static int hp_cpu_offline_func(int argc, char *argv[])
     }
     cpu =3D atoi(argv[0]);
     printf("Prepare to offline CPU %d\n", cpu);
-    ret =3D exec_cpu_hp_fn(xc_cpu_offline, cpu);
+    ret =3D exec_cpu_hp_fn(xc_cpu_offline, cpu, xch);
     if (ret < 0)
         fprintf(stderr, "CPU %d offline failed (error %d: %s)\n",
                 cpu, errno, strerror(errno));
@@ -308,76 +94,27 @@ static int hp_cpu_offline_func(int argc, char *argv[])
     return ret;
 }
=20
-static int main_smt_enable(int argc, char *argv[])
-{
-    int ret;
-
-    if ( argc )
-    {
-        show_help();
-        return -1;
-    }
-
-    for ( ;; )
-    {
-        ret =3D xc_smt_enable(xch);
-        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
-            break;
-    }
-
-    if ( ret < 0 )
-        fprintf(stderr, "Unable to enable SMT: errno %d, %s\n",
-                errno, strerror(errno));
-    else
-        printf("Enabled SMT\n");
-
-    return ret;
-}
-
-static int main_smt_disable(int argc, char *argv[])
-{
-    int ret;
-
-    if ( argc )
-    {
-        show_help();
-        return -1;
-    }
-
-    for ( ;; )
-    {
-        ret =3D xc_smt_disable(xch);
-        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
-            break;
-    }
-
-    if ( ret < 0 )
-        fprintf(stderr, "Unable to disable SMT: errno %d, %s\n",
-                errno, strerror(errno));
-    else
-        printf("Disabled SMT\n");
-
-    return ret;
-}
-
 struct {
     const char *name;
-    int (*function)(int argc, char *argv[]);
+    int (*function)(int argc, char *argv[], xc_interface *xch);
 } main_options[] =3D {
     { "help", help_func },
     { "cpu-online", hp_cpu_online_func },
     { "cpu-offline", hp_cpu_offline_func },
+#if defined(__i386__) || defined(__x86_64__)
     { "mem-status", hp_mem_query_func},
     { "mem-online", hp_mem_online_func},
     { "mem-offline", hp_mem_offline_func},
     { "smt-enable", main_smt_enable },
     { "smt-disable", main_smt_disable },
+#endif
 };
=20
=20
 int main(int argc, char *argv[])
 {
     int i, ret;
+    xc_interface *xch;
=20
     if (argc < 2)
     {
@@ -402,7 +139,7 @@ int main(int argc, char *argv[])
         return 1;
     }
=20
-    ret =3D main_options[i].function(argc -2, argv + 2);
+    ret =3D main_options[i].function(argc -2, argv + 2, xch);
=20
     xc_interface_close(xch);
=20
diff --git a/tools/misc/xen-hptool.h b/tools/misc/xen-hptool.h
new file mode 100644
index 0000000000..34f492c34b
--- /dev/null
+++ b/tools/misc/xen-hptool.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_HPTOOL_H__
+#define __XEN_HPTOOL_H__
+
+#if defined(__i386__) || defined(__x86_64__)
+int hp_mem_online_func(int argc, char *argv[], xc_interface *xch);
+int hp_mem_query_func(int argc, char *argv[], xc_interface *xch);
+int hp_mem_offline_func(int argc, char *argv[], xc_interface *xch);
+int main_smt_enable(int argc, char *argv[], xc_interface *xch);
+int main_smt_disable(int argc, char *argv[], xc_interface *xch);
+#endif
+
+void show_help(void);
+
+#endif /* __XEN_HPTOOL_H__ */
--=20
2.55.0

