Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62822606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Bc8LYjwn
Received: from list by lists.xenproject.org with outflank-mailman.1479833.1683762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNJ0-0004kU-Hj; Mon, 09 Nov 2026 11:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479833.1683762; Mon, 09 Nov 2026 11:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNJ0-0004jO-BZ; Mon, 09 Nov 2026 11:12:54 +0000
Received: by outflank-mailman (input) for mailman id 1479833;
 Mon, 09 Nov 2026 11:12:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQNIy-00043f-KI
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIy-00ELQW-0i
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:52 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab3-bab6-0a2a0a5309dd-0a2a45029f4c-10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:51 +0100
Received: from [52.101.83.91]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab3-6ca4-0a2a45020019-3465535b34ef-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:51 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by BESPR03MB911570.eurprd03.prod.outlook.com (2603:10a6:b10:147::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:49 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:12:49 +0000
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
 b=ZitsLZufbBAd0mwqxjzdcoip9aPdCo6ZU9Oo70PROQngN2XmK6rbl9CcD1FYqigcXPaK7Zg9N2WRW92XQFizsnRVMIhnDLQtAfw7Nkym/wJlHnD36s8iWJkY93BTKOeqZQ5miSKM0lbVYPYfYk2aXlMsNO0zx+QxzUJXdOj4SgOirAC21jCSSDZh09Q72W/CifI6MutkO1T6R6UA2oEoUnZRyessH/BVHQEbXWvnp9O6XfUNKlhMeeJrQ12Rt3btMZQt2RjsyDDBUbStyHVhgFuA8b0vFNf2smdkROS5vL7qUesZSwUmMcO9YmLAQc+Do6zG8pxmJXvphCrylXjS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjeJIH8/GtXKcRnCgkL9Zuudi1R07VDPB4wvamxUUAE=;
 b=dVqxC6mUfL4AMKbUzWEhQC5Yg5PpR0C9vJNIoT5o5MD+RwUNeIrMU0PXhST/gfvwgCr8hb0XCDAT+IGP8GWszVqHKX4D1/Dkn2um+xZF1+N5/9LdGSVZbv3o/+lbTD+redu+FXoHUEQ9RpG05aXE4RcI02Dgtkz3GTjZrEu5gMjENf5Ko8DiiFlybL/rOLRfBToVsUtio+EPOclWqJRxR+H1nRUP+Fs5NW3vJooShJQxiMMgb4rDG/5uFX3vNmMzl9xwnbdh3p1qHyWhHG1AGAIEHTGfVtZTkgbrHkOw2KWMN1N8JxSyxySrc6BHaRvz07CTK32zpYwRr1YjZYKkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjeJIH8/GtXKcRnCgkL9Zuudi1R07VDPB4wvamxUUAE=;
 b=Bc8LYjwn8eOm/wpyziEIHDLmdqgcbWzoOHdj8T6FOF2YRmPJpBWC/tkVQiJ09bXxnUbzt+vXeaPhLGEcgSRwprqvMwQe9E/36wdTcmrGtZnEStNi9UpP5Yp3PEZz/pBf8Sml/21iT+S5Iy5JCmCIexFQN3jvQrnTMHvzdLBOgNkSu3O2VQWXeR9GbFmQedQWcGvja1OVtMga89s2dzuslGwt77XVfdC9AjSJPUEHG4q6sTJqZW6OW9HhvVKnaoQV1IqCdsLWhoUNdYGbZNmmM55Pmf3L/bxRGIKs1rBBuHrPQopJWl+beItTEpBp5xutLbadhaqKBlYhijCOjkDJqw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v11 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v11 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHdcDtBCGXUV+OFfEeEYvsjcoIaUA==
Date: Mon, 9 Nov 2026 11:12:49 +0000
Message-ID:
 <618fe620ab22e7a85bd74c0c7b762276722f0fee.1794222015.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: da992ccf-abd0-4a0e-0cc1-08df3e5263fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261021123027099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
x-microsoft-antispam-message-info:
 w3j7O1UPmGuhXDcGGAIcnpB524cVyQxZDDvo+t7JI4XS1tHHGP40OynF38VO7jJRua0zPCEoO1GLrYvXtUZ1zlP8zviLDla5uQO98UDAa7EUgpNgFcinrRdbnU42+q4FuYtkjAzLkLg/71lfuBNz+eWurxRochatSO5aWrn0ifHdNRyYHcfeWXcVLWjjeD4sBHuKfVF07xtkl9dxKEixbE9YiLKJDu+F4MOXq+d1acjKlyYN4IjfBjnv2CRgDUcUCX1D2UYBts0q/A2cl2QzEOTTsOIcraphm8yyxvR7GK390vYW/ShYtZhW7B9VgTQr2sQdtNtjeseoN+6AccGRt7dkqUiGVuBwv6/qDGcpCfUOkQTm11iCzl6CL7jCzYSNlmA+8NUnw4DOi9FS59kR2U8Ech3nBU/6038f50/+8xxCY0iRvQeQv7JFVgMhv2BqfNT8Sa6Zw1V2JCszO95IaIVI19A8tdtaTiY/RcIUQnWFfuDc/h5PV59kuwPuzfeWOu1Fn2Ykg9YUFKDfEfcoMiZP+udq9G1FDlyU98e38lgCtg8Xbk0mpmXHMk8K3rYYgWY8sX9oArv+76eiTcGOvM3L1uk2XD7qIK5ZqUAvZICoQePNefKmp48zhPyHh1zoKZJud2lWC+8/ogwLK34vYobrsb12BWS0jfxilPvuvvHce2UqeU+l4ik4Eou5CrstT6xBUKPZ+C2QWP5Iww9n4VVfWqNz8auUg54lyH48z+Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FcIiCdsSpoVCW2NmZgcqp49cq6wX39uSZspXE7k3J7M/Ms6uZCL5571+pi?=
 =?iso-8859-1?Q?E3edkX2nV1FhgaF6Bp6mdkF+fTUevFbQUYGiLOC566kiHuoHdKbwr/EuV9?=
 =?iso-8859-1?Q?12nwcRUPTIiIPrmlR1lmmxT7iNLryLb+YjB+8rhtX8x+owE56B4vKVGdq1?=
 =?iso-8859-1?Q?2YX2j35bTbkEiOFsEOD8l1y9UInIw5HyKLKPhLBCqCSmbzeBJO0XnLRNwr?=
 =?iso-8859-1?Q?tJQMVUXK2UwEvuyTQdrrjkxFYaoKwLlPSTD1LwIxm9L18PcsmlVpR5nCj4?=
 =?iso-8859-1?Q?tc/Eqx3dA8R/eWHXX6fy2BjPDNRbh5ZiB9AVlPE2FgCRnG2FC13oGgfWGP?=
 =?iso-8859-1?Q?Fegm86/hRywrVpS6P7L5Vi75U2a2xX3gZuIkVEkbx3aTLL6yOkCIeMXcIV?=
 =?iso-8859-1?Q?+nddXunEV3GdMt51bzwsng/Vro9Dj5mlhIbWQgsq+sWLd++iMlzlboFUnR?=
 =?iso-8859-1?Q?1Mb4R5IB7EapkiCDx6SuSu4f7wcYoMojQgRgBrDq9w5z6EAwLJWUeOraZd?=
 =?iso-8859-1?Q?CZTNt8jtPBEZgy4kbcPXo/uoBOCXmWyIsSYdoPTPlirHsaqxZuErH/0mLg?=
 =?iso-8859-1?Q?TNFHiHKCyHocTuclwRs02u4jhikbqoQT5e9Il0K/lgJoHuGEGjJyj1jvCh?=
 =?iso-8859-1?Q?62oLIema7S+Sor8BGfsowZLJoqk4XDKwaOilZzf2cCcwmZWZMx7r4yKxY/?=
 =?iso-8859-1?Q?lkXqa2t8F/j1U4dyH3/NvRTl1SON7LNdPs5DPZhsfrXjioOGGh83zyjXhS?=
 =?iso-8859-1?Q?VdFDm36KrcaPXi4dtnhnwwr7KA274Vv71ukbovLZfOpTTOlnrb/o1hhqcn?=
 =?iso-8859-1?Q?k7P5cBoAYRL93qKjrKp6BYebax02VOKrUuULRJhrdzrHe01+EE7IuQ3Vo+?=
 =?iso-8859-1?Q?HVu/vDU8vjUEuhZ3w8k2oe0AmDpyuCPeYTfvKU0bh1FTLQSEoadMdIFo1s?=
 =?iso-8859-1?Q?JAspYkXN0RJW8Bu3FoIeB3up/0JOTdmYn7uX/ctqHZEMyJe0JMsyv8MinW?=
 =?iso-8859-1?Q?iCYpf6xuLq9YtHYyzeAV9BxynLWXp7CudR8Ec9Z9Q02py0015fJSz9yaNg?=
 =?iso-8859-1?Q?nEj5LEE5Qb70eHiQ4B2iZRMLJK+z7S7+iCQMsEiJob5oOCFdxCX4Ex/atE?=
 =?iso-8859-1?Q?E2M9bZOph3+soqO2GXo4o1scDSS8UhpCUFjk5D86TYa8rXLXvmw9jROydk?=
 =?iso-8859-1?Q?aK+z5GaPH0yqJOKA0D/SH6ME86q9L+Qi3IQEnMs7fdqGnMsz1nI8rJyKH0?=
 =?iso-8859-1?Q?IpMpuSN8TzYFIW6rrCT2Jtq2Eku9l99pmuNlIqgUn3AFp6cLysqGvdAOOK?=
 =?iso-8859-1?Q?NOm9WG53or0ywJw4UlSTOyuDfYYH9OhRMVFISKm+GjnZHU2LiOFXu/Ht1U?=
 =?iso-8859-1?Q?Wa8yPmg/YkY0UpbWZNxZEVrtiFqpom3cFjysELoAa//yViV4q2v4p4/h3Q?=
 =?iso-8859-1?Q?2BxzPVQBxLqXrUGLemHZrTtL9L+Uc40iY/3f6YNN8qiYsZIkTXLb7bMBVl?=
 =?iso-8859-1?Q?XfgJumEdPkbjzpDYHORt8mei5IY8VOXSrOkY9qE4gkqIK/A5Jyij2KV2Sn?=
 =?iso-8859-1?Q?Euk7FFMJm6DfiHRYZvK65k/26nWgKXZUUttxdsngfDhmapNtyZzfvViUrv?=
 =?iso-8859-1?Q?G1M67QJ18AeGt/8dxdjl0auZbFdtVjeQCYti9Lb+0YI7nvIrvtH8qhIfEB?=
 =?iso-8859-1?Q?iFFv0YCBzkGqnIcYLD0jqfooDmOmvjPNGWRncubX9Yc8MBnMwIySSuNXL5?=
 =?iso-8859-1?Q?3pPVf+I9e5vWPDWSJ9/Wq9ZP+PKagxyQYvBzKTT+gVE115Y0zH8Wh2pkRx?=
 =?iso-8859-1?Q?FRT8zZktiA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da992ccf-abd0-4a0e-0cc1-08df3e5263fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:49.5424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5Sn+mnuTwGvsmNMQ8gf99SLo/K++X1W0/JZ5+TNffzXLvKh/uVZKHZlaBkMCKbx4CSLfZ3NBMg4xFmu+k2iKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-720697/1794222771-F18AC2AC-92F3E5A0/0/0
X-purgate-type: clean
X-purgate-size: 24567
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Operations specific to x86 architecture are moved into a separate file
and only built on x86.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
v10->v11:
* no change

v9->v10:
* collect RB

v8->v9:
* use CONFIG_X86 instead of CONFIG_MIGRATE
* fix style issues

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
2.56.0

