Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F56606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=vjKR1YCn
Received: from list by lists.xenproject.org with outflank-mailman.1458812.1670845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7Cj-0008Uq-Vc; Fri, 23 Oct 2026 04:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458812.1670845; Fri, 23 Oct 2026 04:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7Cj-0008Uj-R7; Fri, 23 Oct 2026 04:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1458812;
 Fri, 23 Oct 2026 04:48:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xK7Ch-0008T6-UN
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7Ch-006ryP-0R
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:48:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae6fb-8faa-0a2a0a5109dd-0a2a4506a352-38
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:48:30 +0200
Received: from [40.107.74.107]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae71b-195a-0a2a45060019-286b4a6b5a71-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:48:29 +0200
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYRP286MB5946.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2f0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 04:48:25 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 04:48:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwuKZQ01gcMAnezMGltDUUaqrnwtnoz0R/cawn/hLIcGlkmOOEr7WFnqqLd7C+T+fcgGuSK6jkGCFMC8IwHs0THiV3BHA7oVCw2MvWxKytY1DLKOW6HZUpRq3SdwyzH4565OGssaJqlQuB6n/CBZocWFCvTsjp6giHLm6lItDyWF8N9pJxyvHugbmE+GwonLMC6mOhKdRPYusPXoZagFSMgxG2Awfq13asD0uL/WqcPal6yLbCx28d/XFJ+EhkLWX7fBmq5GqBdssK3A5ybPMsz8xa0xjpNKEEFmRHdPm/ROGmHVNTzyoroI1JmOj6mDBxS9B5YXZMYVp6AHl9UJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwHOlk5cGD/ygVVQmfIA8/k+P+ZJhK+XztwkDguMums=;
 b=KWzlNkNDmYPvQ5omI8Jtnr7eVNI9y89Nxdjbl0KiKJQ5uSBhasyaO+yYpJh7nWyBa9oGBNPWzUHOM3n8TUma431Ji+cS27UoI1q13vri5cEWl5I5Qk/gL528ubWIGle2hZuYzqNPNZ3Vgt1GoVMzyRrxkKqqkNtyQsCTLlx1x1bTaziLZhawNk6ueqZmaN9x80KmrSJr9uLhZKxY80hoi4dx1yx+XjFuDLVgKIChiEkkAWfgup3KwnSqJ3WSpeHbJ16C6qlt3XKS8CRBXBzyl5A8Pxq9tVm6MmlMshmv9Legh0HbvrpweXOirmBmxA8qChm55/DE8U3PVjrGs2tawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwHOlk5cGD/ygVVQmfIA8/k+P+ZJhK+XztwkDguMums=;
 b=vjKR1YCnVWE2A1OIQfnx38Sl23zm66kfWnG3pCARSjfXxxDxKu03Rpqnr2LwUEAWdGIidv4PKaDHNimjDkcbqWCNObCa+vLTZ+UD2rbVK1FbiBe3wo0o5UK2mL8on+Dz/ZznwKfu4ioowJQLOYiU5i4wOrKNxUQfoqovAZ3kbEg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC 0/5] Introduce dynamic tracer using Livepatch
Date: Fri, 23 Oct 2026 13:48:09 +0900
Message-Id: <20261023044809.162759-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:405:370::10) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYRP286MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edbfa9e-d947-4e17-ad4f-08df30c0df87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|18002099003|261021123027099003|261022105027099003|3023799007|261022075727099003|261021121427099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gyV0CWdoCMsv81PC48jaxe021P1D2ZtdGCK1SJyF4odDebZeafsF0B74yKPLfRgy+6FXfoK+bGy2Z6hhdVLW8cnlbP4VX9qDzrfaFaMhKb6vEZgWYJK1kJrsyl7BOlW70uiJ3vadRjXhybOHjDJVOUiJlH+LUu4JusvkcbLbO1ZppqwQ+SyUjJNstsvnxV13uvRN3w0JeLnMDaz0oJymVivTisGmwpiRjEG2tdClOYq8ItPAQG2TmWYjaOAkDph8MkKlvMPxoHD1Gg5tdsUfTwzPWBAXfGJzYogesfUjQUe2Mvoph0hH3hnlVRqlXYgJkUIfTGMk33zOh8Ob6OP9s91mZ+1VsajtMQbxZqKgfaKoXRgxMplr5kE+hvl5DgE3x0ZUh4051pDC4fnxrcgz5PTIcjCVkASyjnWRHGD+hFGNPlkQDv4eR3gFiOjv8r63mW7mwqDpykkFUoKpDs8dG625DPysAPoRYJr4CfIPvUklNuaWcz1nUuaDlAY0XPy/9/I742YMJaTkadxKIZS6p5bEDSTMxo7HDCV7ZQ4HUMo1wVrz5t4OTRhbfoPI++E22oS6W56Zc+07fu3xOzTjsimscVEiDTdEH5qBYI+KMqj3xbmPPwt4kVpw2DkdCqow
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(261021123027099003)(261022105027099003)(3023799007)(261022075727099003)(261021121427099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DWW1XaStJuupxgC8rTlF60SuSDxpQ5D0vErjV8LIInafP3W0o0X0e9PmTsVY?=
 =?us-ascii?Q?w5EJgp4FeaqBUOSia1H0hT2FpBU9TNrgobE2bcB706rFg2rhboSO8h+T86Ki?=
 =?us-ascii?Q?agDcysgZMPzM/kHje3esdG71kNFvDqZk05qPly0wsaeNprVv53gz7Cm6c+dR?=
 =?us-ascii?Q?qpr0IJVZBSMFZvwxP53Qu4Ji0SldOunJBca4M6V481feKp3+E938dqOwb7LS?=
 =?us-ascii?Q?h3uhv1IKl5RMKoywvf161AxCEJvPtjfa1b4K/pXATzIV34D9E9OEukrzXLGP?=
 =?us-ascii?Q?ZmmHhoK/NDIbuhXomG8D8ytG1as6IMabSiDflN8gvr8rETSsbOAlx7zX7gzM?=
 =?us-ascii?Q?9A6+uhmbMpxeyoPNAV1Fsw3v2GQV8tby0JdXuEWKU9fqbCjxOrZON5ANpOvu?=
 =?us-ascii?Q?p+3ViPeQtr9QRGvAjEQ+UOjzwXtYFsi7QPhuMg9TnIThxkHJyZNyha84+ZX6?=
 =?us-ascii?Q?zePLnjue2zA0j8/evdtxTryhr01nvJOTgyIY5hbeJl+LLXJbw0phn4bIi5tk?=
 =?us-ascii?Q?9oEMJmLNeMNBF1v+M/nPAppQKeAJEd+dXlBdrsW4/AabXb6DU8rins2K8Tn9?=
 =?us-ascii?Q?cET39mAEG/S98GBW0pxK7NEaEbyXLyeXLhe8ntIdodJ/YyJQT22Bb098QyGr?=
 =?us-ascii?Q?FiPD3+HB+JcGbZwXa+1XsEr1OhA3QRWuMOfrgij6WxK1QESOVOr08KVbd4b9?=
 =?us-ascii?Q?N9MqlLpZKwx7rL8Md3UP+PEc+y+Jo8rlnOqdV9LY8MkCqKSXeNO9olwJeaKd?=
 =?us-ascii?Q?gLICD7EqCRu72aAHmMHxYuUZc8ynP37s4fQSyMC8SvNCIAN7u36txSkjzwK8?=
 =?us-ascii?Q?YiFHudM3/dxnt8LD0qpNQSa1k5/vyb+hur7XMpXOVRVj9MiKrZyJxQQN7mOk?=
 =?us-ascii?Q?FJb5LH6JzXTTariyvbGLs5/YeWw4DWXKZ6jDVrSPK7xGgSI+MQTj7F0x4Ls5?=
 =?us-ascii?Q?StIhv7xN/bNj9aTcTn/TTW88UYJeSqCqsCFskBzmI8fcHpzsIpv0/4mosIq6?=
 =?us-ascii?Q?07wKhwHM0nVaPRaXEqxiHfs9Tzj743WwKPP+I2WjV0JI8y8zPmnK35bgnXVc?=
 =?us-ascii?Q?6iiKmE332gEZdje5+gdWG70lLuXhCDtgOKquHHcbWFCstX7RBpzlZUrxWAwh?=
 =?us-ascii?Q?mu5tw483RatEKfuyIwvaz+9fc0NzZ/Bmc9pCfsN1WxPkVEza8A73ZmeOCcTc?=
 =?us-ascii?Q?CZDLWxygfsgbunR7q0fGSHC+zBY/9pTFI3EEUWI5/tlHgGMrIVqw/xKEW0oc?=
 =?us-ascii?Q?zHUdmZlHlJ066akduLp696ippTCtHzerKbTXUjQb16Gls87QfUxUvvUN3oiv?=
 =?us-ascii?Q?Y4cP9XHyP0HLMH6wZFwtdhNlF/Un/nvpjndigrck1dqgPsQtIjLfpO04D2DV?=
 =?us-ascii?Q?1OXSCxdLAgn0aBFkfOIS1hK2ceuHEhfs/ohvqusUMJVtLvhdvpLQblN1HJiP?=
 =?us-ascii?Q?Y5ajbQjBIS6ndW7Li1aFoslLjbqkPfxIU6T2Qj1g5oE0nAARujBPz9nCfoMr?=
 =?us-ascii?Q?ZBAel1r3ZAuIeerexRHmiWDW9AQLgp+EZ1P1/uiy4f2bVGijdEZDZIsBlwMO?=
 =?us-ascii?Q?A/8T99i+6ploaSEFHW1YRs/Lu+8oRGiU+gw/EVnbFIP+3/wVzx71HCdimZ9W?=
 =?us-ascii?Q?Rwtk1S6V4KsFrctBTkkbH1XQfI9gCX0RJim86T2EAlhAJ/b2iiue40isVqR4?=
 =?us-ascii?Q?pF+/gbK6U7e+k9SJ0sjhJ5O89q3x4hV16hcVjpjAyn3Ct4r1ZIBz8H+Dc9GF?=
 =?us-ascii?Q?vhsHise6JA=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edbfa9e-d947-4e17-ad4f-08df30c0df87
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 04:48:25.2532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcAo/ASza4GwFCsyq7Ny2D5Z1i0A6sBbVsvYt1DEFMVbobvXSjRLJWRjQrJ71UFchnSXhlyQsaOxN0AovDKWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5946
X-purgate-ID: tlsNG-16d1c6/1792730910-F540B77B-3976F16E/0/0
X-purgate-type: clean
X-purgate-size: 4817
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello!

This RFC introduces a dynamic function tracing feature
which I proposed at Xen Summit in September:
https://xensummit2026.sched.com/event/2RDr8/improving-xen-traceability-more-than-just-livepatching

The goal is to improve debugging/tracing by making Xen possible to attach
callbacks to its functions. This series implements the infrastructure for
attaching callbacks using Livepatch on x86 and arm64, as well as
HypFS interface for controlling tracers. It is inspired by Linux ftrace:
https://docs.kernel.org/trace/ftrace.html

I appreciate any feedback on the implementation, as well as
your experience trying it out. Thanks!

# Implementation
The implementation follows Linux ftrace's approach of reserving
function entries that can be later patched for tracing at runtime.
Those entries get patched with a branch instruction to a trampoline,
which preserves registers before calling function callbacks.

Livepatch is used for patching those reserved function entries.
Since Livepatch operates on struct payload, it prepares a dedicated
payload which can be used by tracers for requesting livepatch of the
target function. Please see patch 2 and 3 for the detail.

New tracers can be added by defining a struct tracer and
registering it during Xen initialization. Each tracer can provide
a function callback for tracing and optional callbacks for managing
its state and output through the HypFS interface under /tracing.
Please see patch 4 for an example implementation.

# Configuration
In addition to Livepatch and HypFS:

CONFIG_LIVEPATCH=y
CONFIG_HYPFS=y

Enable the following configs:

CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY=y
or
CONFIG_X86_PATCHABLE_FUNCTION_ENTRY=y

CONFIG_LIVEPATCH_TRACER=y

# Usage
The interface is exposed HypFS /tracing directory.
It follows the naming and usage of Linux ftrace:
https://www.kernel.org/doc/html/latest/trace/ftrace.html#the-file-system

available_tracers     List registered tracers.
current_tracer        Read or select the active tracer.
available_functions   List functions available for tracing.
set_function_filter   Read, select, or clear the target function.
tracing_on            Enable or disable recording.
trace                 Read or clear recorded output.

## Example
// List the tracable functions.
xenhypfs cat /tracing/available_functions

// List the available tracers. Currently "nop" and "function" tracers are available.
xenhypfs cat /tracing/available_tracers

// Select the function to trace.
xenhypfs write /tracing/set_function_filter xen_extra_version

// Select the tracer.
xenhypfs write /tracing/current_tracer function

// Record calls to the selected function.
xenhypfs write /tracing/tracing_on 1

// Call xen_extra_version().
cat /sys/hypervisor/version/extra

// Stop recording and read the output.
xenhypfs write /tracing/tracing_on 0
xenhypfs cat /tracing/trace

// Reset.
xenhypfs write /tracing/set_function_filter ""
xenhypfs write /tracing/current_tracer nop
xenhypfs write /tracing/trace ""

Sincerely,
Ryo Takakura

Ryo Takakura (5):
  xen/arm64: livepatch: enable attaching callbacks
  xen/livepatch: Allow tracers to schedule livepatch
  xen/tracing: prepare a livepatch payload and its controling interface
  xen/tracing: Add a function tracer
  xen/x86: livepatch: enable attaching callbacks

 xen/arch/arm/Kconfig                  |  13 +
 xen/arch/arm/arch.mk                  |   3 +
 xen/arch/arm/arm64/Makefile           |   1 +
 xen/arch/arm/arm64/insn.c             |   5 +
 xen/arch/arm/arm64/livepatch-asm.S    |  68 +++
 xen/arch/arm/arm64/livepatch.c        |  39 ++
 xen/arch/arm/include/asm/arm64/insn.h |   1 +
 xen/arch/arm/xen.lds.S                |   5 +
 xen/arch/x86/Kconfig                  |  13 +
 xen/arch/x86/Makefile                 |   1 +
 xen/arch/x86/arch.mk                  |   3 +
 xen/arch/x86/livepatch-asm.S          |  60 +++
 xen/arch/x86/livepatch.c              |  33 ++
 xen/arch/x86/xen.lds.S                |   5 +
 xen/common/Kconfig                    |  12 +
 xen/common/Makefile                   |   6 +
 xen/common/function_trace.c           | 274 ++++++++++
 xen/common/hypfs_trace.c              | 743 ++++++++++++++++++++++++++
 xen/common/livepatch.c                | 137 ++++-
 xen/include/xen/hypfs_trace.h         |  42 ++
 xen/include/xen/livepatch.h           |  14 +
 xen/include/xen/livepatch_payload.h   |   7 +-
 22 files changed, 1478 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/arm/arm64/livepatch-asm.S
 create mode 100644 xen/arch/x86/livepatch-asm.S
 create mode 100644 xen/common/function_trace.c
 create mode 100644 xen/common/hypfs_trace.c
 create mode 100644 xen/include/xen/hypfs_trace.h

-- 
2.34.1


