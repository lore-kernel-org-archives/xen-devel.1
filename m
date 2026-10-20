Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF3606A320
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=abg5CwKm
Received: from list by lists.xenproject.org with outflank-mailman.1455224.1668828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6K1-0002Pd-I3; Tue, 20 Oct 2026 09:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455224.1668828; Tue, 20 Oct 2026 09:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6K1-0002PS-DM; Tue, 20 Oct 2026 09:39:53 +0000
Received: by outflank-mailman (input) for mailman id 1455224;
 Tue, 20 Oct 2026 09:39:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xJ6K0-0002MN-9j
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jz-00228c-Ks
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736de-2eae-0a2a0a5409dd-0a2a4503a702-30
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:51 +0200
Received: from [52.101.69.140]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad736e7-fae8-0a2a45030019-3465458c04f3-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:51 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10766.eurprd03.prod.outlook.com
 (2603:10a6:10:590::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:39:41 +0000
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
 b=Mxz2MIm1Er+Fs26AWJheLEEoya9PYfzfBy2F+V777Hx3ecTZT8o6XCloklGHEUzrMRX2uzNcnTrDuCjbBkNeMYZXatRRWIpmoQ467eHYx8GCG/xB5FWFlxqf7z6Mqj5Q66yZcIwvcwVQx8ZWzD+bILzFP61PsY+qCl0leynhW4XVvMViCgV+kIMxxmX+c4HH8ytgOdScJ8sdX19XBhkzpDgTf2SGEA5idLE10HqB7NaLuc7e3s+AMUeiBziybsCqn4EsP1aFsoaQmfHjzGCrKyytu+YZ/VSOT9oy799y/iwThOBzzUELcxKRzLYKofRQrfT5zY8gsGpmtwCWCR48pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMyhBAE/7rfHl01UzJ57fXgvKA/wY8oU49dZTVpWZpw=;
 b=KvjskuKIrxs30i+czbO9A8lqFsr8tlfQBnZc3QKwsFny903wm6+E+wJrse1Oej34LZqbQzu2k3P9w6CZ+i6PGSPFKVjcLCRW0VIevbwAHRZVL7EyUaumJ2Yef7af2W+lXLRhsaSSVRuSyrgLEaiZJWEUYBB2T+88Ce2NdTVh+QiEfaNg1DxalMhqcuixZq3aGgoRXrzjC63ti0YweHx0J9rwvgOE7t2xknwbU58muuVxbTbvsFuz4HtGE7rl2Nf8xDkx9p+MT7/45TNhFzbqcxxEhky1jKiOFP1Y1qM2pcWm+EIjbosUzAhOaM6TB0XrYX5UF8qcGSSf+O7NVLRnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMyhBAE/7rfHl01UzJ57fXgvKA/wY8oU49dZTVpWZpw=;
 b=abg5CwKmUx2qA0/EbuhsbLnZQxypnPG1hz+uTTRbIrErquGknS7gtXGI8cg8CCd+Amw2a0Sx6/5SnYgd5PN45F5TWlg8wBwJgMCwEfMhBbUb+1CIZs3b2JnHhLfLNAZv6hc4ty5AgANvAwNVnOWUmFe7UBdxlBhFieiBtUaxuWTrddLzTIobdLx1GgwQ439who/aal19Q4wgLV79NUKVev/deqyV/oXY5mOnHmZ9MA13kTZidjSF9u2V9dw4z0+q/9rwtd6tXKRtkc4Dj2xTV3zMYlP8NS5XNOAlaiedw6e9ppaSHYN3nF5qHgOEMGMM1IM2XXdtD94Q8Zgoxd4iKw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 6/6] docs: Document CPU hotplug
Thread-Topic: [PATCH v10 6/6] docs: Document CPU hotplug
Thread-Index: AQHdYHbpsQDcThpgWEa/HAWZdfZsGw==
Date: Tue, 20 Oct 2026 09:39:32 +0000
Message-ID:
 <be7167bc313540ef826b6fc91ae9c2357f8ebc5f.1792480416.git.mykyta_poturai@epam.com>
References: <cover.1792480416.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1792480416.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10766:EE_
x-ms-office365-filtering-correlation-id: 9ee29877-8127-4bd1-5e55-08df2e8e10fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|260925022911599003|56012099006|11063799006|260925021911599003|260925021311599003|261009223027099003|22082099003|18002099003|6133799003|10067099003;
x-microsoft-antispam-message-info:
 Szsm+NoeyvwDp69VC4q4NDMFRva4WTY65Be4srsDYUqp/B/gl6MR1wQJjr37umAlYoCEJBPQ1uA4eVwmS5YNrbVwpDJhWmA0cEKG08RJc3IybLubq1WG2lw1jVoA+XMPoZquUn+DQXPdAgQ3h9BZ5u/IU+Q0WTouhJDWvL9VOIiYOs1lHNJDJvDH9Y4g+H2C6p1dK9ApvSq7sd/1MOdBrqo7EttugXFOVVAFNXbobqfuxPRkdiydFZdLggeQPfIi0tbPNS1uUVFOCUdHgOsfktePtDBEQ6LdKNzk5e/hKxJrmD2aEHXADZhGZF7g+LV8dLYliibthN2p0sI06Pi4hoEHk1+bw5vcn6zw6Lthjkm/KOlAH/Jqliid9HAAn5KzWDFIs5xkX7ZCWn9/Ybnmig4iU3j+e2gGiVyzGONa4m/u6DU9oswTFXm//MiJ0W2TdB/fUyo8LcVV9Ufb0WXPb4I6xQp5p8lj42+bTs4RD8uZL+a0x80pngEWmtTehb82KRVKEVWQ0RnKBlspzgE+FTVjIomO5B1ZrBVp1VqNjAIWxbg9ZQZ4n631gU95QpU2aouyyPOhTjtGXMK5xwdwEdPXfwxZXAfKSZG++7qYV569eH7mktntqDl4TTs6Z6MUrbnzAGS+J8jCTxPy6PflvcjmWY3ssxMQQBMhcRksIm9MNgfXtXNLVDZudOmH5EP2QeRN/Ft7kAeZIVLKEucUy2PRh86KmgQ0Gi1epPHBDgs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(260925022911599003)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/w9xUSYCFWXrdD9XF3cHKORI2OqRc/WtcjdbDwiwwWHwzu4h41VrhizPH9?=
 =?iso-8859-1?Q?w6ufnVcXmLeEEVv6KGs6ros4tZguf8ElSTKkgkyr0QfbD158wA0janut10?=
 =?iso-8859-1?Q?bg1KGcfDfNk0FqA5gdcHSFnEsexHUlaZN9ys67kzM4Kjj2n/ofpeB2eCIf?=
 =?iso-8859-1?Q?5bng/NFwdIQZL3wr8qtmxFo87ix/eU1kg6XWSYZcAlLJt372ZEkJdEHH81?=
 =?iso-8859-1?Q?/7g+YJifdXq6YDlsKHrxcCQb5LJijcnOo/cfzfp3SgJhUb98lTApoDTSC6?=
 =?iso-8859-1?Q?OknBpvHVGsqoYRGJrxYOSV30xuoV3jHEoCpUpATxj/zeE/ivFWjjFT/6ak?=
 =?iso-8859-1?Q?To4fc6Vf5H3Pjw2VWV7TW4pevNaSeAhCCIxGtLGYqi57sXDlxKxI1dSxCa?=
 =?iso-8859-1?Q?mUWb+Xml4DadoRG6vbBi8D02eOHH4HI0emGd0DCL7pRkijGtTQWfDL6r7Y?=
 =?iso-8859-1?Q?Q0qKyg6oHx3/SBbkQ0oa+5+Wi0/a4aVPDVNQ3EazLsirrLt4obk91CssER?=
 =?iso-8859-1?Q?0LhVuZT9pN3s740bDssYV7ixuA1ZtF7vlm8y3Hsj7F3GKk7kz49eSy5xVT?=
 =?iso-8859-1?Q?JecdDKj/2QgMlDvXOjs39uX9rYvQcJ2RwXM0f/mfGFMv+v0TKvbMvjsbpR?=
 =?iso-8859-1?Q?bnOgt4OtT0Dq69KV7gNO9axG3VmhudEEOfPohBEWG34nlGOvyXw1uSLW3X?=
 =?iso-8859-1?Q?9GNB2zPInjAYFfzA3Z76ZuB2tAmU7GZW8m1T8dTR6TdobCoPX4vQzmtjW9?=
 =?iso-8859-1?Q?LCiCcXHXSckUyGtIpUy2L6WSxbjikqhgD+bGdJb83hP3t+KGlLnkJYCwUt?=
 =?iso-8859-1?Q?hds+etgRC1/AHK39IJ6I8EgJVJAYRh24FXNZlNkHLNKkBLWy1Z9+H7x/R+?=
 =?iso-8859-1?Q?7hylx1rCy20GQ/BOdvR9m5x6V6KU/Z+Dp92gZqyZ71jVCmaEKBWlSUpuRo?=
 =?iso-8859-1?Q?S5oyeHZlChA3HOYSkyshxX+lH3eCCy0Q3k3YtD563K0WNfnR5L8TUNj8Oc?=
 =?iso-8859-1?Q?/nCHFf/pOZ9nYEjmXdTaJi4wWfGKMnt7tx08cbds9OY7lYSFtcqzYqFVae?=
 =?iso-8859-1?Q?vxlBNNKkcYmv83HUrWqnwngDhnLdSLdCLY6Pd4aKrWvHQnwqc1nH/W+Rpf?=
 =?iso-8859-1?Q?Dxr9hl/kT+D/eEUrFCcuV/sjGFqxorJ4YvTQxx5R/5sAmqgLL2RrLPE03p?=
 =?iso-8859-1?Q?ln0GwIOQC0+WfixzfN/qTSLy4gMlMEInRRWm8rrHIivE38id3nU+Vbkllv?=
 =?iso-8859-1?Q?QuIg7Jj/GuTZZKrh3ROATX5f0J8oqB6D4jcK7G7dCkBQqTgaCp7nGmXxqk?=
 =?iso-8859-1?Q?q/FXApRNcIcDeqBdh26R/qcOayIm5ZisMznDz7+3QmyvJtintxZYzHA/N4?=
 =?iso-8859-1?Q?dxsHKun7Q0g9FabewgQ+Rz69uYGL5U5ojhbahiiE2wcI8eAT4M/GH5AfJg?=
 =?iso-8859-1?Q?Pu5rJ4mwEJjcP1AsamqSi+2XAKbEAMAliDVc+N/9o54IxbsZPrcGvLrwqM?=
 =?iso-8859-1?Q?rQjC3Osc7VFMnTUUEn2pDsPy2rg/j4t+oLo+UuN/CO7nsXZbnVK4Et4i/s?=
 =?iso-8859-1?Q?0gmwDm1JtRZUS1r1NGUCNq/zlRW7WBR96BFzfPhvMmLq6Vx/uLoTQC1VYd?=
 =?iso-8859-1?Q?FPyGjjU3xymVNV4bjhC0bftDrPCJq51hRsXIW+6AmU3MRVcAicNci2/1Rr?=
 =?iso-8859-1?Q?julb4I/IuxDntcuODXj2Sp8bdTzaecES+BR7mIDJxdmSr59Gnw/bSIJhwY?=
 =?iso-8859-1?Q?+wUtU5+DFere92/NHhCOhe4NoFiM1Nh3uRkLA+wIXMmEwm3lWzBXMFZKGw?=
 =?iso-8859-1?Q?9YOY64qo5Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee29877-8127-4bd1-5e55-08df2e8e10fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:39:32.7083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 03qFiOhjMEryhE1H+m94P7UpuxvbWfkvAuJsW5xCLa8xshjO67RULPvhbVQyW4GiLvvdGmDAza+4TG+9bJ/rIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10766
X-purgate-ID: tlsNG-33051d/1792489191-7428D4E9-EC501877/0/0
X-purgate-type: clean
X-purgate-size: 4310
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
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
 docs/misc/cpu-hotplug.txt | 99 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..407f5e202d
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,99 @@
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
+The presence of the feature is controlled by CONFIG_CPU_ONLINE_OFFLINE opt=
ion.
+It is enabled by default on x86 architecture. On Arm64, the option is disa=
bled
+by default and marked as EXPERT. xen-hptool userspace tool is built
+unconditionally.
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
2.55.0

