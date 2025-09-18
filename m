Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0855CAC5A8
	for <xen-devel@archiver.kernel.org>; Thu, 18 Sep 2025 12:17:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1126024.1467753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ3-0002DY-PE; Thu, 18 Sep 2025 12:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126024.1467753; Thu, 18 Sep 2025 12:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzDZ3-0002DR-Le; Thu, 18 Sep 2025 12:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1126024;
 Thu, 18 Sep 2025 12:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kqio=35=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uzDZ2-0001YH-69
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 12:16:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5370327d-9489-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 14:16:38 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8720.eurprd03.prod.outlook.com
 (2603:10a6:10:3ef::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 12:16:35 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:16:35 +0000
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
X-Inumbo-ID: 5370327d-9489-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyK3FUYbMAeu5yWXorF4d6kmWs93NoCWQM8zwf79WZg5Mz0cp0iqsbKqrZheGRfcGtUA4zA+VsD5NyAknS212rVlb0NkOey8ayRLVG6Nej94uqDR5av4EKAY7r1qn82MMVjNsb579cN/Q/kESsDS0KTGP2YWUo6Cctv8fnPHx/s4Gn6eGG4BKP9UdbAISOas+O3XN1s3l5l8XWg2VoOM3LFBuQRWOdKsbEIe4aH2JjTy/ylmeRhgzXANU2iUQJZ2SIWljgmerCwI2W5e5gwreYjc+C/fV+lg2QNMoO8lQA/u/HQUsLGQldHB9fbM7QZNXWh9IizaUHMYeEeWw2jNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuWio91C+xwkw6tYgTKTQsH+XEeYXYKNaFzCjkYa/oE=;
 b=FQAVncwxQTsCFC8yfQ/JgsHQidcOhvACXWnQ6uhkWlLMynvTU9tfkjs92alQtCpP28WFLOlgyRRNZoxoZrg4wy+zh1/lfU/xJxWbxq27o+wY/yS/hMU/7g3HfIveLcZsKyIBlxROVy0/pE0FbnsKMO42CIQXViQY5OEQf8/esFiKPcVEX0/SJ7/44JXOktRetZtfPs/ZJZnlF1NL6lJVO/nmZhDbyOVTu0AMxY8Sa6tt6altpUt5+Tq+yxCDLH+yE8elJkQkVuGIM3gbAQH1A5ZH9EvvHWlVMwQv//dvTzTbrQLWf+YfgNn46B96dR9ZI7nRZnBc3fPdBvQpM+FJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuWio91C+xwkw6tYgTKTQsH+XEeYXYKNaFzCjkYa/oE=;
 b=BZvTHDDRHnZfKoiRQhjTbROHQm+1hp9zSlfRhd/UeQukSinGbpQBjLFgIzC0VKmOVe3Tuq6quYRkMz84MOwu1VC2n6E7QPTVrso0ko6PKCnvdO+BmlljqTAWy6Tkcl0vkTUIcCiIHFggqkVGOorGmL1uROeQxYLys4G/XIbp0ZBOxsHiTbthR83UnFZ5XdWQsAAD4YLpA62g7TjTk8k4KOIe8a8d+Eo+w4lGnxvLVOy0rNpbPpM55vgvcrmaV8C7ToTzUvB1M/CmX+Mtzcra4joLVLpF5xZfoSrA6S5X6bhvonkuJ8TE5F5Fp1fFIvstPhcaNsFEW4GQ/h5ql54G1A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcKJYTkGTrKHgw3E6UlX6hg7Or+A==
Date: Thu, 18 Sep 2025 12:16:34 +0000
Message-ID:
 <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1758197507.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8720:EE_
x-ms-office365-filtering-correlation-id: 80a28292-0cb3-46c5-f841-08ddf6ad35de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rjOiLWoZgbnVVasupUXar9tanyBkeBgHAPjZLzMgV+6cIiiJZwmlNNEIr+?=
 =?iso-8859-1?Q?x+uniu4RvoA6CeQyXLtiU6CHG+W5x0nc7JXpRHyWimKzzD6rJDKkJb7Fe1?=
 =?iso-8859-1?Q?5gunxf8BcCHVFPl1KxuLTrFfOR24xGik+pxi62+1GQLRWe2HwoZzOqlG4+?=
 =?iso-8859-1?Q?2A/ZB8VImxhx5q1GIpjnl2anLDLBeYdMEfFDDjXVT547oPGzjzn+2vQEl/?=
 =?iso-8859-1?Q?FhgTC2AilJ8lEg680e5rekG2qxlHMKxHNvSSgXjMYKGX0YOgmKw24IIK/w?=
 =?iso-8859-1?Q?yStEx6mueEUXE3akyblrKTc1L9EzKV0kR+qJoa1bjQub+9GZzvma4hx5uI?=
 =?iso-8859-1?Q?SnU6/b1ca8LyCuDKXn310qddn+BslrkngFqymp+x6doT+b5PuFTQgRmNdb?=
 =?iso-8859-1?Q?w1Ii8wF241S6PwaaWRCEsZi2fX286EoR7eghxAkdNfz+aASlX9YFZRLTWK?=
 =?iso-8859-1?Q?iA91T4QywBYUDnGUH7Ci17j8Q4y5Mr/g10HokbP9nEyfIS5D0lREHEQq9C?=
 =?iso-8859-1?Q?FEgaVts1cMRpGrTCB7XHDkPaPHxyWFC6goYqsNVHJqgsc5GF5d0tItf5Ap?=
 =?iso-8859-1?Q?4m80Zc7fd7rEBj+pl3dyqr7MOdqA0TwrFajooNg4K/k7oG7rFpg6ADmlwk?=
 =?iso-8859-1?Q?0BCV0/BkbEeN83APstowzjJu/LOXieYLw+RPqSMmZ8sNSnLM7Pm3co6N7d?=
 =?iso-8859-1?Q?16UGm8T730JEmjPyAee7g9fYepRvwYsxiwXlSKkUb1jm4v9Aws/27ERDWV?=
 =?iso-8859-1?Q?z/HSCM75XVQLxPPCEDcLvs94OYZ6/M6fPKRL25N1eSB40hq9eIeL4A9bjm?=
 =?iso-8859-1?Q?lgvkdaGFC4Tq8Dby5qE0Kzf1Zj/pv+uOC/EzYOkjkyVr96ie6ytgq5546u?=
 =?iso-8859-1?Q?C+3CpGRLggk7WX0zoR74iizjaZ754YxjAf8wvez2qYKC886q1gAEfxeVyg?=
 =?iso-8859-1?Q?sx6vfOY16A7X+9VP1DEh8Mi8DcjX3FLYI2+sei4MwlNJDJI4UIOmavo/Bq?=
 =?iso-8859-1?Q?tMU26GdasegQ2yTCOpr/ayWQ7FMnyNHn7V84ALDmXSj7P1M+CpMBgeNJuO?=
 =?iso-8859-1?Q?YhXw4Kr4ClI4IsXRjjGakTsqIN+L15IbNXFSJqx6NmcLyjDqUQNWiR8tip?=
 =?iso-8859-1?Q?mm/eut6a+PAl6badwzt5b+M4iDxdn9UwTb7ueM+z7QDPguKlS3iynIaTIb?=
 =?iso-8859-1?Q?tl1BLRM0lJfQ9vmz2JBD8qcq31TUBJnxQ65tIeuRg33o7Fh6DkbFCyuZ1U?=
 =?iso-8859-1?Q?6nQtsUSLTyWkcn3ia83lt/Toc+dH74ElamA8drtM5XwtZy4YtPZh2It89Y?=
 =?iso-8859-1?Q?zU0bUA7OohNBgZWsOTbsaZme4P+7g1+KQX1omww0hbxFapd7g2RdBy8JPB?=
 =?iso-8859-1?Q?4GFvYpvk+4B24SAvWhoNfxX/gLsx22po93yLuX84vEOnbI85cGowEOANs0?=
 =?iso-8859-1?Q?FZ1oEXz16shouCK6x+rVyD1QA6Y7WPeTpYBt2Ed5b2IxRP43scsUevrhNX?=
 =?iso-8859-1?Q?DEqAh+KTgKixgqjZgcmAynUmfUPKdNDRquSissE58l+A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?83SHEnBvnrYm4d0maDrXfZwy64TwRjXKkgMmtHwd8ZhUwo8Gt7ajROzIJq?=
 =?iso-8859-1?Q?Z2RP9L5bUfS94Hgq2WuO9o2cmKRuGKR1GltthLmjXvsmbdVYRmSaDEx0/P?=
 =?iso-8859-1?Q?VOEqxVuPQUq0tJSUkoMJnQaWQUltotupPtpfMy2hYZILc24uw/PreM9MQo?=
 =?iso-8859-1?Q?Nmuqd+a8V5GVTLm1ff2qnplsZNrJ1BX7QLh1zDVySvwDCVTWAz6J/k06Hi?=
 =?iso-8859-1?Q?J2zNufn1HSdM7q3qMdU4hUc+JTIihtZOFZvdJw6TwBqhl0gSDdWs7BAfYJ?=
 =?iso-8859-1?Q?jVpEL+T/Qrhd9JxX4EO4GntjDiSgu6Sdt6CS/LU07a69QxUwYSmq/QbPVy?=
 =?iso-8859-1?Q?+DScujj0zrNKVZmXHPcmf57eENHEk0urFlzpfQL1ymuGoZIuNe613zGbe4?=
 =?iso-8859-1?Q?LOe+b/xlnAfS/LrdCxIGENqaLg5qSz2S9USN7LT+BAmGWlc+EPvYUtsNXS?=
 =?iso-8859-1?Q?+M7Zq0kmL7QcOOP3ieGGIsrnf/QUL244zV3j4nTMjMHTp8970JSXKbT5Z5?=
 =?iso-8859-1?Q?ZvfEx7x1JdVBC2RSiPjiUKItiap3ZRzJctc+OlBivd+USTogJ02RAk9qrE?=
 =?iso-8859-1?Q?QixVozUIENztrPG2nZ+2OC9NV7OuifsR66S2lkJswpmnsIOTaJdtH/W3/5?=
 =?iso-8859-1?Q?zWjMpLjjdD1tqHi20quDADSsyqH7X8U4OkXEPADFlIVspYouH0zXGvezDi?=
 =?iso-8859-1?Q?zALcT6Sw5f288Yrhel5dlJQP1Pz0Fc+8Emn5D7nozZs3w/r8gIf0idjqin?=
 =?iso-8859-1?Q?kxHXQ5LD3vHljWCmoImJGsrPLCdi4/HhL+peNge+YslI/UUQZgJJc4403o?=
 =?iso-8859-1?Q?qysvf3h4OUpKmm53Mg4kIv9/sb1H56W51+YoRRcKfd2FePxpK5aC5JW8co?=
 =?iso-8859-1?Q?gSJiGCnIi4dhDZydOuBJA/zOTBsjdAUapEYpHQf3gn1aq8N7tTxlj7fhNR?=
 =?iso-8859-1?Q?WaoWTVY1NYCATF1fjrlzrgNSWGbXxIICGCE4nhxeFRJoZn54un+HfyEAnX?=
 =?iso-8859-1?Q?aHmETRXm07082q9SAn46eJBl1cbxD0JLTtrUGKC4epNTl2boT1acY3Zdm6?=
 =?iso-8859-1?Q?VHMVfrQA6n9xa55M6YofrCuxsF/6VUlj5Og79AUyT6tFhah0wteBMNn9qa?=
 =?iso-8859-1?Q?cMVyighzP/pWmBROmswuJuxuqadbQNUxyowwI6yzENDVHw/ShsYfLad9PT?=
 =?iso-8859-1?Q?p+8F6YLNR6Unc2otbz1iPVA6cHbYXrWRyhvAldGoCjwH4G//McbDQ0QPw8?=
 =?iso-8859-1?Q?Hj+UHM2AxyzMOCkMFl+iF3JX3gu2N7vMSl4VawS7IJ0OBxGTPIPT5/6X8v?=
 =?iso-8859-1?Q?nfDVzsE5s3KgAI9RNX5dW5ZsUlKntL32J+ZnXsIcF/ZHHh3V6uZNyADb8R?=
 =?iso-8859-1?Q?n1UnvnVKrrc/T81VPVK1DWV0K88+ka5fVL+1QKZfWAMn+oZrzZFy6ekQA5?=
 =?iso-8859-1?Q?Hu/zYjL+zr3emDJHI/esGhsNwJY9sj6UWWCeNQEQXuO+BoRhuJUJcyfGOe?=
 =?iso-8859-1?Q?3j2GPWdbpKFydh27RNBqq/uetPhjydzpxicyOlrsfWVjJe+eqkQWA1xDF7?=
 =?iso-8859-1?Q?CyCbJsWitLFuAc3ZOIy+b2LZYgIAnNR4+aeM+M7uHEOjzyjVuD6Tuysl1z?=
 =?iso-8859-1?Q?dhKh8WV9Cz4glu7OggmU2S5FZ1SAbkVjlpnRCMWy47UKvmh66127GXnQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a28292-0cb3-46c5-f841-08ddf6ad35de
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 12:16:34.9888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqegHt7Xic3y2SaZSJiZuU0LZLeaywkJmkYVzP0OOgDxz0QdclrEEFSmBZqERYdswhh8NHb3c9MKbbiOEQHVlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8720

Implement XEN_SYSCTL_CPU_HOTPLUG_* calls to allow for enabling/disabling
CPU cores in runtime.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/sysctl.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..ca8fb550fd 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -12,6 +12,7 @@
 #include <xen/dt-overlay.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <xen/cpu.h>
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
=20
@@ -23,6 +24,68 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
=20
+static long cpu_up_helper(void *data)
+{
+    unsigned long cpu =3D (unsigned long) data;
+    return cpu_up(cpu);
+}
+
+static long cpu_down_helper(void *data)
+{
+    unsigned long cpu =3D (unsigned long) data;
+    return cpu_down(cpu);
+}
+
+static long smt_up_down_helper(void *data)
+{
+    bool up =3D (bool) data;
+    unsigned int cpu;
+    int ret;
+
+    for_each_present_cpu ( cpu )
+    {
+        if ( cpu =3D=3D 0 )
+            continue;
+
+        if ( up )
+            ret =3D cpu_up(cpu);
+        else
+            ret =3D cpu_down(cpu);
+
+        if ( ret )
+            return ret;
+    }
+
+    return 0;
+}
+
+static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
+{
+    bool up;
+
+    switch (hotplug->op) {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            if ( hotplug->cpu =3D=3D 0 )
+                return -EINVAL;
+            return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug-=
>cpu));
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            if ( hotplug->cpu =3D=3D 0 )
+                return -EINVAL;
+            return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplu=
g->cpu));
+
+        case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
+        case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:
+            if ( CONFIG_NR_CPUS <=3D 1 )
+                return 0;
+            up =3D hotplug->op =3D=3D XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE;
+            return continue_hypercall_on_cpu(0, smt_up_down_helper, _p(up)=
);
+
+        default:
+            return -EINVAL;
+    }
+}
+
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
@@ -34,6 +97,10 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
         ret =3D dt_overlay_sysctl(&sysctl->u.dt_overlay);
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+        ret =3D cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
+        break;
+
     default:
         ret =3D -ENOSYS;
         break;
--=20
2.34.1

