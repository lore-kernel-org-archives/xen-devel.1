Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3896EC5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:48:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393701.1632547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUr-0008Dk-KC; Tue, 18 Aug 2026 08:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393701.1632547; Tue, 18 Aug 2026 08:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFUr-0008AV-4M; Tue, 18 Aug 2026 08:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1393701;
 Tue, 18 Aug 2026 08:48:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wwFUp-0007fC-6l
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFUo-008KNP-JS
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:48:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5b-2eae-0a2a0a5409dd-0a2a4502b71e-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:34 +0200
Received: from [52.101.65.110]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a841c5f-6ca4-0a2a45020019-3465416e3afa-9
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:48:34 +0200
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
 b=LbB4Bki1UDSxb2w5ZS6JHWXeqLqZ6ougu7f7IpvjnaNot7Oce4anrNT4j/V8SFhcVbQsWoa7hal3RuOVFyusRuJHErlbGO9J1MIoyZYTnf4HrOsZz4nrqOMLwoAzQ0+0x8n3IV5ZbhbildfpQzkzrEhxk8lIU/Rs+xh2iu37Y8pTI+WLA06whA34ex0NwLsJBqLNuYdj38HmDhakECYR8bcCjp+p9nIbI6tGpdFRHJWzXZB0sE2sW0ojSy5B+NrPRZvIVJDM3utoTe1ieGnBK9FS4XU6nFMVYJWF1vGdEmoTUV+LHlX+j+Zoy31I4GO2P0h677R2uQV7tQAIOdffWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9FElmracPDBtWbdVP3t7NJG1uYSKXKX5uvMeAKBI64=;
 b=BYireIyh39SkC8+k81cuxMI38w2FIvahHSmh628OXjpV2Rc1/ANnzNF9Ak2EIsDcpVDqTiCiYQbqA0LufyJbMRjFmTnR8a+QY8X+SeWVikLIgeHBtdFrkTxSWTEszXeOHwI51ymiy/QG1N4EmbJ1Lrqkl7PDyzGBY1PDoXLH126dgSt9gRM/dHucWVfE2TBAE6rcy155w6NWsWf16qP/qzScSm7sp+ZqVbHPhklSeBwOzvJcSrSh24e/FXV0HT2Zf/WcdrxRYC3qV39zfu8wlFGSOY6T8zSweLsS2dPzV/zPmaGAcGyNrv0Yzwbokwdp1JFgFNSZSV/Nq5h1vWrYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9FElmracPDBtWbdVP3t7NJG1uYSKXKX5uvMeAKBI64=;
 b=j/6jBMwqPA9ZEqUHy0S+w5F/tbYlouSFvndcTYT7Xrs7MwUTP0WykRctjyYOamZ0iRYeeDAasfFp/rdsSc522ophXykth86aqTAzst4V945IR675RFQaAVvle9M0bV7wQgWstg32HC39m4/IPrl2+8AwYPpCKk7f1PCY2I3GRxcz/nOdku7QJBvuqGjI6E6OkfpUZb/XJ5GCuLpMg1RkjGmv26vIpkeor9mJMR4QmXUldiy2F4iHW9udXi6WCtFBA6vAmpAnx6TXairE6/TQecdyYlTbsJ84lYauSQJErgZxS7Ynp+8tpZMtbuxwc6007tcu2Ex9LQssgqeQUOe0TA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Teddy
 Astie <teddy.astie@vates.tech>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v9 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v9 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHdLu5YSYy+G2Q5nkKDlWjuRtlO5A==
Date: Tue, 18 Aug 2026 08:48:30 +0000
Message-ID:
 <43447ba62f39a46ceeafca58a4212fb8c07497e1.1787042017.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: f61ce5f9-a161-4e47-104e-08defd057a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|56012099006|11063799006|10063799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 G/j6kTgSqTo9kIWHW5zrl4oCIEIxfneTVrr7+EkPEbpxVi1PnTBPyRbSFPF0YLzFhn72tNjZEMOGeOZTTkyNCKhWquHctZiK8lOkDSWvSiyFdvrHwrgJRmHkRfEyJI8Dbiq53TK506J9G3vhkObJs+aZ/sHxNSZ1dzb+UHlBFVcyDH5uci0kE7cCfjAwcs4U0MYqS1hzr+QkBl+cXHZIogLWQv9W4TLTRQo3lrDTSDAt4uo7uDKh/qctbcmXUHmDSui8V7a/lxKGIHNwuM7xBFSmDigeIOQuPXbETVbQOKuaOANmi0jUzbCqkULPtDEyTDO7iZsYWXMQl8tWGAwNZCRQFK4XGgFtP0qvsFKrbJpsysqrFPuFvY5zmtCTn8ryv5zpxLu691LaPNa86oEFRLhH5dIHbI9cyGpj1tf6X6jEpYXGLzlVY3QxFgOp2fpWmQSmY55YfqC/OyeONbm9J0AZP8lc0J2pnNfIAaTCjw+hLkhpgMPqR2dXXbNyWpG6isGEejA1FX6OV1TyioWRpSB9EVDdZjSLg9vay93IbVqgxDocwHs2p8KAARlNKP6XaHjP19GCmpFmebHVMN4Ced4PTULruORYhb39OLEZeZjO4XsKHo8fLObyHShBQ8ynCr+JwckmNabBBeAObRT+rYwoRTI68l5cmDemUKFRBd3Psddbz9OL/mIujjP5ZTcuzN2Dxg6vi7fIVKzWqtEClUbo0sUthX1+HemBB+1lxO0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(10063799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6NLgsTteJXV8hhDhISxTkaOtNYp5ZztXB135TA6M9bCeiu9TOueygPRdpp?=
 =?iso-8859-1?Q?ufoKgtqubRT+FRwtCh68n04U4J4fkHgWSJ5jsLZ4pFkBDyu1Ry6ZYflZIM?=
 =?iso-8859-1?Q?CCS6CkrA+O45qheX2w0M4AYWUXF3cFQ5ioFwJP7ZVAE0jqF7Cz+FtxU1Fl?=
 =?iso-8859-1?Q?XlBqHgoFPiN+9GAvDTd+YxDQ8HBK9Mt3+4ztS81TLk77NqnWIElBgXRKbD?=
 =?iso-8859-1?Q?Zznj4E9kP1+ZNy9ytQhZAh1jXxVtI/GNzB1i93BmG76GiIUTzbf/OCxYZp?=
 =?iso-8859-1?Q?q0q3p8J8RYBtX1H7g+qnLzQDM5ver0u6tQWKuu8Tu+1iGbOpKUiNnPxGy7?=
 =?iso-8859-1?Q?ChzneK6K5pND1/jjWY5uWU/R+c204iFCQ0D5sTuEefsQWfpneH9ieQT+5X?=
 =?iso-8859-1?Q?J80Ugmb+AHmQugChhGntmEdh1Q5M7Hh5XBnyuoLlevLaVayIRpHP4b525O?=
 =?iso-8859-1?Q?F7vT0C0xokwjlTdCetCjbir6Vhz3nFsDHN37QNmIk29M4oZFDCjDAJa/2L?=
 =?iso-8859-1?Q?9gBpoV+WBb2/yO05FnLpXvc5gNWWYv87W0kxvEpRzLeF2WutubuMc43uuB?=
 =?iso-8859-1?Q?GHmspcv0p1xFdbfuwOWPiPzFWJjPdWkYlG0qWRWA0x4sl8lZ49Eh71FYb4?=
 =?iso-8859-1?Q?GzvzjFZLYFWr65I/A/dTJh+QPp1U6cUSbIxenigvIK0T6gzzrH8KIy06RR?=
 =?iso-8859-1?Q?XU880KK1K/o+dr4btjFy0jTk04vJY4Y9nFEreAhmMF8ItFKrA8BsTWcjQ/?=
 =?iso-8859-1?Q?0+tpc1oKqBUc5Oi/6EeN3TD8xgtRTFn+vKdM821x8SCgnCYzZK+EhqLJA3?=
 =?iso-8859-1?Q?601m43rhlk6NXkl85/zZgnRNdx1LoZLJaPi0mmj/HXa9L8OTxxiSy3mSUp?=
 =?iso-8859-1?Q?pte5ecUf68zJgBr79+4GgJGAhw8KSd315DocSmKVDZwD7eYt7vBQobOXD0?=
 =?iso-8859-1?Q?0n6014X7ut3GrcW7nxVYdc/4a4HdLasQYvi3/2p9NIEw+Dqs2TJDgWncT+?=
 =?iso-8859-1?Q?WWThheoMGC4OM3R0XBxYEGdWJ/ATO+k3NWNMJby4saKBTaPYOhTFi1fa1S?=
 =?iso-8859-1?Q?Ragq6UgLEW/yKyNDF/505bSusCiixKg0/aDmP3uRVTjh/YSMsuPRfVkv0T?=
 =?iso-8859-1?Q?K0pOc8x0D7uJQcr2wQxT6WaOs0UK/iQS3sluqCuzYt3A9kVWg+qMNfSWVV?=
 =?iso-8859-1?Q?5xH0pievC74ussa7aUVPDyIwJIT0zZ2yPbLJSsnnJ761cg/agldff1xPYD?=
 =?iso-8859-1?Q?qmXtwKR4MyuXs9Rf9jC+ObMiKQvlUspCqT40nbGYpJevQpo78B5vY8o5+v?=
 =?iso-8859-1?Q?rxiG6SI55fvbQ10irKLb0NUnlRtiDBfqJJBB4yJW+vma/FkgM579hgVyP5?=
 =?iso-8859-1?Q?wiHR9QLawhk0GHNMMyUOF0PC4wH8bPs5CHSnhy2ql/1d9by+R72EvjDMUU?=
 =?iso-8859-1?Q?aQObYHdkPiW0H+4DWjKVs3VTqdOGIVLrM/NLH6Sbv7n7oNL6e//KJuajuM?=
 =?iso-8859-1?Q?DI3XoGeLRIbdEOEVcmMMsAJngGkus2Qv0qGd5Y/gybehTQv2fKXEJgBhLY?=
 =?iso-8859-1?Q?t6qd457N+oIIw3AFF7GtE+VHrEuSNhde8a/8T8MPmJ0FMWi+CSjiDRcjCb?=
 =?iso-8859-1?Q?TPkQUGj2NHsWVkUSEp27pPcmZwnPF54wF4h71mWMSfINAAq1YIURLivlUT?=
 =?iso-8859-1?Q?sFbY2u5/W8W6zBgD47W14G7pY8tE+sCqT5DGe/tE663OjY9zt2UODsk5po?=
 =?iso-8859-1?Q?bdMQ42rBS/EelNxf06OQZd6CDk2T3bXlCBSi+QwRgGgvsp6H3hl3LoBMu0?=
 =?iso-8859-1?Q?naTeFC8MV0m9pRa6RbCMPFS37RlOnVQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61ce5f9-a161-4e47-104e-08defd057a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:48:30.5777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1DzjAG7mKkaFXnmVCZEKGt6s1Je30JQgYxVG0qjBlIRiIBJfOi9EA6eP2BSgNNyJKjdg+LT9+zrRXALGtVFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR03MB11425
X-purgate-ID: tlsNG-720697/1787042914-F20A82AC-B17930F2/0/0
X-purgate-type: clean
X-purgate-size: 10340

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
and partially supported FFA, or TEE is enabled, as they use non-static
IRQ actions.

Remove ifdef guards for x86 in flask, as cpu hotplug is now
supported on more architectures.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v8->v9:
* simplify dependencies of config CPU_ONLINE_OFFLINE again

v7->v8:
* simplify dependencies of config CPU_ONLINE_OFFLINE

v6->v7:
* use IS_ENABLED istead of ifdef in more places
* remove unneded variables
* more explicit fallthrough in do_sysctl

v5->v6:
* fix style issues
* rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
logic
* use IS_ENABLED istead of ifdef
* remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
from the common handler
* fix flask issue

v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm
---
 xen/arch/arm/smp.c             |  9 +++++++++
 xen/arch/ppc/stubs.c           |  5 +++++
 xen/arch/riscv/stubs.c         |  5 +++++
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 34 +++------------------------------
 xen/arch/x86/sysctl.c          | 11 ++++-------
 xen/common/Kconfig             |  4 ++--
 xen/common/smp.c               | 35 ++++++++++++++++++++++++++++++++++
 xen/common/sysctl.c            | 34 +++++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  4 ++++
 xen/xsm/flask/hooks.c          |  2 +-
 11 files changed, 102 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..0ea64d2ee1 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+inline bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index a333f06119..2cd116c2f2 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,11 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 3a7953593d..a8b2f54f3d 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -65,6 +65,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 3f16e62696..cb3e0fed19 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 9046c826f8..caf4411705 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -419,37 +419,9 @@ void cf_check call_function_interrupt(void)
 }
=20
 #ifdef CONFIG_CPU_ONLINE_OFFLINE
-long cf_check cpu_up_helper(void *data)
+bool arch_cpu_can_stay_online(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
 }
 #endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 10d485e633..a4254beabb 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -121,13 +121,13 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         long (*fn)(void *data);
         void *hcpu;
=20
         if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
         {
+            ASSERT_UNREACHABLE();
             ret =3D -EOPNOTSUPP;
             break;
         }
@@ -135,13 +135,10 @@ long arch_do_sysctl(
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
-            break;
-
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f029addbfd..4b74392984 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -645,8 +645,8 @@ config SYSTEM_SUSPEND
=20
 config CPU_ONLINE_OFFLINE
 	bool "CPU online/offline support" if EXPERT
-	depends on X86
-	default y
+	depends on !ARM || !HAS_ITS
+	default X86
 	help
 	  Enable support for bringing CPUs online and offline at runtime. On
 	  X86 this is required for disabling SMT.
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..16f4ed2d4e 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && !arch_cpu_can_stay_online(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_ONLINE_OFFLINE */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 8fb5ff0af3..42ad7accd0 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -475,6 +475,40 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        unsigned int hp_op =3D op->u.cpu_hotplug.op;
+        long (*fn)(void *data);
+        void *hcpu =3D _p(op->u.cpu_hotplug.cpu);
+
+        ret =3D -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+            break;
+
+        switch ( hp_op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            fn =3D cpu_up_helper;
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            fn =3D cpu_down_helper;
+            break;
+
+        default:
+            fn =3D NULL;
+            break;
+        }
+
+        if ( fn )
+        {
+            ret =3D continue_hypercall_on_cpu(0, fn, hcpu);
+            break;
+        }
+    }
+
+        /* Use the arch handler for cases not handled here */
+        fallthrough;
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..04530738c9 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_cpu_can_stay_online(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 11a77f0e28..863b66ec58 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -957,7 +957,7 @@ static int cf_check flask_sysctl(const struct xen_sysct=
l *op)
     case XEN_SYSCTL_getdomaininfolist:
         return flask_getdomaininfo(dom_xen);
=20
-#ifdef CONFIG_X86
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
     case XEN_SYSCTL_cpu_hotplug:
         switch ( op->u.cpu_hotplug.op )
         {
--=20
2.55.0

