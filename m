Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD71606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=QIA/69S0
Received: from list by lists.xenproject.org with outflank-mailman.1479834.1683768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNJ1-0004r5-1u; Mon, 09 Nov 2026 11:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479834.1683768; Mon, 09 Nov 2026 11:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQNJ0-0004qK-QD; Mon, 09 Nov 2026 11:12:54 +0000
Received: by outflank-mailman (input) for mailman id 1479834;
 Mon, 09 Nov 2026 11:12:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xQNIy-0004C1-Ub
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:12:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQNIy-00ELQW-Aw
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:52 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab3-bab6-0a2a0a5309dd-0a2a45029f4c-12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:52 +0100
Received: from [52.101.83.91]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6af1aab3-6ca4-0a2a45020019-3465535b34ef-4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 12:12:52 +0100
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::5)
 by BESPR03MB911570.eurprd03.prod.outlook.com (2603:10a6:b10:147::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:50 +0000
Received: from AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c]) by AS2PR03MB9076.eurprd03.prod.outlook.com
 ([fe80::bfe6:8f84:2f09:349c%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:12:50 +0000
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
 b=JCwpAg+Mfs1X5PBewvmCkbcHhZtr4n0lTnMbNCYGOx1/XPDt3Y6Jx/6kq+9y0Aqvm0wEt6/fAO8PVfjxsL93uRLps4fkJlTq1EhtBa5Gi3XkN3MZS2IF3tO4hnBHQObj0LOt8q4SUsc8bc16T6BwLsjs5MR4KlfihQ1wVizYFpkPhwYvMb3ODwzFyfHLEHaI6feS0VzXx3fogCzzOmtFlRv55Qt4Ua0M94/pw50R/IZCX3Yb+jmiOiloDluRG+WYwH8ePB3lQhBTVPEAjXUZKxhAnLjjI0zW5JfoFbJOd41gr5BI+j3CZrTfTENvXZNrnHcw0ZuUXzMJxOnGowgM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So4Usd1efqoEjsORsZeLMMsglUkCSIgwzCwOrZKP+ik=;
 b=ma8tsOaFwIMNyS6I7W1AtABJziINo/hfIwuFpJaxcafTPbtNQ4GM+Zzxo9Va9mmgZxNKFSWRqjfa26y8M9ECXM8yCfL3cp3Ty1VvBDGCk9rqhdFapWqltfJyS7WAAOfsQHr6FTc5JD0kyQXNrNud/V9Gdk1VpJFpNEK/jf1UeNa5sW8hNUp5N6oS3gpEeY+oF4gcfxl+fF6y4S57TpdkZiaJokyOe5q1E4xTkT2y1VYecy1z40UZrWahdoawdZtD9NWBlI0KxFD/nKtm9oubVY6F9EfQhv7P7DJaKQ2jDgOOpRWBWmN4gJIO9WU0cjRMszvZicA8eMm/ekOmtKjikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So4Usd1efqoEjsORsZeLMMsglUkCSIgwzCwOrZKP+ik=;
 b=QIA/69S09xQb8HV2DGk0LxLAsxQff79Jko+/4TiPKhPAr4/BOinajMqQD3FLyBUAU+oShzt4SwRPEvdwFzQf6gpPf4uPxubH4jichPP2+h9FSwAclCiGb/NHNF5AL0V5in0VChwU28UHT8sKJTLxLpP4a00Gr02QAMdvRLXO5Rhb83c+dXPWjUZ+k5l6iApUgwgUFoYZKxoZ3OD3YRJ4K4RH1bArBQIC9GqXmS7V4wI+TZI6NWyY/ArKsAStqYYDMHexyoyzktjaSeWKMmXeebmABdL/pWDQa2WeHlbNorjVkbgzEWFV6oGPyGaAuajT2jaDu/fhThTEnVybMPJRZg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v11 6/6] docs: Document CPU hotplug
Thread-Index: AQHdcDtBxh3En5yEU0GTrBnml38UOA==
Date: Mon, 9 Nov 2026 11:12:49 +0000
Message-ID:
 <b29769962099a9d5ff14b879b87a588ed2e96665.1794222015.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: d0e5d2df-9e01-4d94-429e-08df3e526440
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|10067099003|38070700021|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
x-microsoft-antispam-message-info:
 hN8MfVSGPbS4akZd9Qt7hqJteJkZJr+NuwCI4LgsgW1kdRQDHv6zY6s+BMWxoklklJLwPmwwtyZ7SkoQQdXbrOHvLwh1ZXwP0j1MEYMUfGPy08n6UQig348vbaCalADFN4/PR/Cz30INzlFWqk+8FXBi4D+crdf216xf6p82srPBQh167ATJa4j4LucYByZDKnmLz+Ogm2iyTI8EbYKR5r5hzuYvPn6WLNP7QRWdmyWfAm32nOH5AMVBoaqpizU7ZB2mKvBxicMQTjST9mR2yFxrj6pwJxs5bkvliPSil+bocbycY8gNd27bDKclytW4hpxe/DZWZLGW396I1N3v7DX87VTnv3wsq4u8SN2r7DHllMQNa+fTgF0+7d1luRGCqH2RncAfRNCV/O5Gxeu5X+/IVxx6kGDsbVPsJO1Ve2iqF3v8v54VKHbFlvrHhLNKKe6WWGGK7OYAe562l5j957dPWqp/u/S8DFqbU+lC9Ku2V79rIxVTXZ1Ho6m9RCgfyRHAVeYthS8lybzgskpQ8iCxunIyte88x8PknDL/cF2dybjQNo9tT63FLF7v8kwBOZTaA1fR8CKz7U28CPTvmukNL8mjKBemW5eWbDEoXgh+bbcMxLCj3MTDK0Tjy9YVODgfngdXXylHclRzbMK1NLsH5o8E5C9GQLISEvcu3vqqK4XplR7q57uJSHN2kcsrXJzN/6kjG/dPyilnkKnmaPHGbiGDRLK7KJ5fqYSZNZA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9076.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ISsIXdnyCIenFb6ABUwPEw4CR9uuhNpH5E/DtdTuOkJsDShko2bbjNsCyz?=
 =?iso-8859-1?Q?qAMYe26wnulZSq+pd6g3ew6c1ck/n+iBtZF6DzUVhSRQLBlPcbXR/8Pkfi?=
 =?iso-8859-1?Q?bAGMlStehfjoi7KSoXp8aywVKAMsp+rnGKBhz2mTk8THwewonVJp+c/ecd?=
 =?iso-8859-1?Q?rAZ0nmo7iAR/NVCpIT4juCueE4oqfeEMyZjWn8zI2d86otYzmx5k6B/qLN?=
 =?iso-8859-1?Q?F2JpcNyFHDl17BfZS8S7jHql9t/CYhrE10E6ILv4b0nVIGnRc9xSq7jbcX?=
 =?iso-8859-1?Q?7iGMwyOWhB7MfSY6TuwtC7CvFGyiyMwWxxNfCMpwbdJbc7qfjlenWJdM1N?=
 =?iso-8859-1?Q?WYQfFHPe6ukLh22vIaoBUQ4dEYVvnELLXHUYUAtd7ggV28ww/aNpyKuFp4?=
 =?iso-8859-1?Q?L/MFJ7QLujQL+Uh4H2vBmTI+A1+f9A+9pUNTUHDVgXNinMxcRHG33TpUuS?=
 =?iso-8859-1?Q?z2e0IxQMhsdW2bHes70awk3ei1SbuY3hbDfmbeZ/gM5pbEUDsLTugm2DYi?=
 =?iso-8859-1?Q?LdOf0XmEETjr2V2KaXYdfuMn/i1iQYEnIqGt03e5p9fgD4wVqJysd9Yvek?=
 =?iso-8859-1?Q?pKJulPNX/zwmRGBu1sTWbEcgmDW+AWSfi9QIzBERitQTuvsxcxpflIymQf?=
 =?iso-8859-1?Q?CIvrCqMkWxINzpHdhEU+ZYXl1/H5gm7d4o0EXS48Y6DilYkSCd7JzFh88a?=
 =?iso-8859-1?Q?N9cXYMTAnoPZj7HL7pU8fZTWoHGt9loKISby/Jv2CkYBPVAmI9Wq0grQbt?=
 =?iso-8859-1?Q?vob4ve9sM9/dJ32BbX4NXzFKP+dcHxWL9BbXtL3+5S3lvNc2BiRelqG9Id?=
 =?iso-8859-1?Q?9E/kWGHKhLHwUWMwZH6N0ZjusEqUGkLL8DfOjy3HUGxvAf3e85jD3es79E?=
 =?iso-8859-1?Q?HV3uIPzjKwneDOenoRPdQTdv6Z4IJrj2Rk3KX5hOzGHvmAZRZy1PQi2uuB?=
 =?iso-8859-1?Q?roNc1qFgRuiblszN2RTE0mHTfu6rtPe1JFOxnosC5UTPsSAXBhl/5rwwdw?=
 =?iso-8859-1?Q?yf/21a+ZMD8k2LK63HvHIyLoYOSrb38K4kCiQNUB+Db8iBGMDjOR44qKSy?=
 =?iso-8859-1?Q?hhLmn4kk07XQsHVJ9dIYIx78MSjoUFr58i2+JnZts2pmU5bZKby3o0EXbn?=
 =?iso-8859-1?Q?xw92H/d5VwdjjDBqtlmkf9125Z/o3lzMcobpCFWyBMQyukHhkrAIiC+ABr?=
 =?iso-8859-1?Q?Y0BYwmb6N0biPCtxOi87As49akGTdbJNY38N7nBsAbZFiGaM7WhiXVbnGm?=
 =?iso-8859-1?Q?7k/jqWx+qoLF5QMGzjJz90JQwjgGgJjKbiTK641VkmuC5RFaqJXvf5/aKv?=
 =?iso-8859-1?Q?q0s1/MeHHkos2YIeXTgZpVOY4rPXVn73BUZ2tMUCwnmtizYdW9WEwRZ4UN?=
 =?iso-8859-1?Q?14gsZ/W6c6Q+vQR11J24tnyScIyCAlEBtpbHvS4nOoKoOsjzmQHql/uHkx?=
 =?iso-8859-1?Q?Dya2DRxrxNCHOpXhxMe/Z/O8idx0ur/etkfSBh3UnzLS8O0nlxX/l2+x3V?=
 =?iso-8859-1?Q?/9PdfHotO8MXC8wmMTvaHUMiskq2tsIqBkyefbyQ8p5WMK7E0SaEI+QJQa?=
 =?iso-8859-1?Q?bLaCTOAoyomIY4QUcQ+UuhbgpEHqSWvkJo6wQrx96WrK+dSd3wIOoPK5mq?=
 =?iso-8859-1?Q?5AF3ZcFkB5SVjj9cUh9v/P22fK+Tcu3cg/G8GUcXsAGJ2LuFbIsxjqcauV?=
 =?iso-8859-1?Q?2o4PnZKexjFdP2NQR6w7d5jS98rJjHX6UQKfVyfpiQ++sU+YyfXi2hrwBv?=
 =?iso-8859-1?Q?aBAZjpMW0CNYoVQn08X9q9DoovZ5cP3XIJMUVnMQKpqp63BWURn3F6Ed2d?=
 =?iso-8859-1?Q?H0SPPJPVFg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9076.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e5d2df-9e01-4d94-429e-08df3e526440
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 11:12:49.9790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26PXO57uB2d6SG0Bft+/i2dyrDsezE2DJVEFEPGftQGPGWoRii6ZoILJ6ZdghS0gNC7tkr1TkWlJer0rMt+hoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911570
X-purgate-ID: tlsNG-720697/1794222772-31FD62AC-BF4806C9/0/0
X-purgate-type: clean
X-purgate-size: 4502
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v10->v11:
* sync with latest changes

v9->v10:
* explain the actual ITS incompatibility
* say FFA and TEE are incompatible, matching the Kconfig dependency

v8->v9:
* no changes

v7->v8:
* remove support status update
* update config option name

v6->v7:
* add testing and limitations

v5->v6:
* no changes

v4->v5:
* s/supported/implemented/
* update SUPPORT.md

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 docs/misc/cpu-hotplug.txt | 102 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..e1b474ca69
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,102 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is implemented on x86 and Ar=
m64
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for the boot =
core.
+Sysctl calls are routed to the boot core before doing any actual up/down
+operations on other cores.
+
+If there are Xen-bound interrupts pinned to the pCPU being offlined, they =
will
+be automatically migrated to other online pCPUs. Interrupts used by guest
+domains are handled by the scheduler when it reschedules the vCPUs to a ne=
w,
+online, pCPU. When a pCPU is being onlined, some Xen-bound interrupts will=
 get
+redistributed to the newly onlined pCPU to prevent imbalance.
+
+If pCPU being offlined has some vCPUs pinned to it, they will be automatic=
ally
+unpinned and migrated to other online pCPUs.
+
+Limitations
+-----------
+
+On Arm64 cpu hotplug is currently not compatible with the ITS: the per-CPU=
 LPI
+pending table and GICR_CTLR.EnableLPIs are set up once at boot and are not
+re-usable, so onlining a pCPU a second time fails.
+
+On Arm64 it is also not compatible with the FFA and TEE mediators, as both=
 use
+non-static IRQ actions.
+
+Configuration
+-------------
+
+CPU hotplug support in Xen is controlled by the CONFIG_CPU_ONLINE_OFFLINE
+Kconfig option, which requires EXPERT and depends on HAS_CPU_ONLINE_OFFLIN=
E.
+HAS_CPU_ONLINE_OFFLINE is selected by x86, and by Arm64 when neither ITS n=
or
+TEE support is enabled. The option is enabled by default on x86 and disabl=
ed
+by default on Arm64.
+
+The xen-hptool userspace tool is built unconditionally.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
+
+Disabling a core with pinned vCPUs:
+
+$ xl vcpu-pin 0 3 3 3
+$ xl vcpu-pin 0 2 3 3
+$ xl vcpu-pin 0 1 3 3
+$ xl vcpu-pin 0 0 3 3
+$ xen-hptool cpu-offline 3
+Prepare to offline CPU 3
+(XEN) Breaking affinity for d0v0
+(XEN) Breaking affinity for d0v1
+(XEN) Breaking affinity for d0v2
+(XEN) Breaking affinity for d0v3
+(XEN) Removing cpu 3 from runqueue 0
+CPU 3 offlined successfully
+
+Testing
+-------
+
+The CPU hotplug feature has been tested on both x86 and Arm64 QEMU setups =
and on
+R-Car Gen5 (Arm64) hardware.
+
+The tests included:
+- Offlining and onlining cores with no pinned vCPUs
+- Offlining cores with pinned vCPUs
+- Offlining cores with Xen-bound interrupts
+- Offlining all cores except the boot core
+- Offlining the boot core (expected to fail)
+- Enabling and disabling SMT threads (x86 only)
+- Offlining cores to which guests with passthrough devices are pinned
--=20
2.56.0

