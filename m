Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD1606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=JFGR5ZN5
Received: from list by lists.xenproject.org with outflank-mailman.1458919.1670988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7L9-0000gC-Ru; Fri, 23 Oct 2026 04:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458919.1670988; Fri, 23 Oct 2026 04:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7L9-0000g4-OM; Fri, 23 Oct 2026 04:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1458919;
 Fri, 23 Oct 2026 04:57:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xK7L7-0000fu-O8
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:57:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7L6-00CzBS-QV
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:57:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae922-e002-0a2a0a5209dd-0a2a45069c7e-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:57:12 +0200
Received: from [40.107.74.100]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae925-195a-0a2a45060019-286b4a6428b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:57:11 +0200
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYYP286MB5665.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:295::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 04:57:08 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 04:57:08 +0000
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
 b=vs61KkxE3lmS+y4WraoQ/Gpi6IGQ1kCnO6vFt/AC9Om4uMVbgK2KyY310i6GiE1dtDbPTyyhNwY/ojj8jeWMQYcTXF38Jad+0+Qn6zRIIg7Kdud0crUyKJKLNWaF38fQOeZfWCggPHTC/NZVPoiz7EZkLGsk8LINo9qjxP9NITVjIbpn0BNBRjEGgNzhw57Oq0Y+MNZ9nU9dt73hq+pTgw5UeT7UfAQfgGoN7NmCECAaAV9n4mL6hPhy+tVTywSw4b7m2OF5MUvJW4f5WYX5DcQq6LwVKQzFogUc1SIEjMGwwOoyWEl9Rpht1G2Rt6Hp80Wj13EwFdjGqhh1JN4XBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnKv7oJzltLW6C26HaDuFk/xWeQEgKaGXCvC8U3iEFU=;
 b=AYUrWufR18zBiWjxonLtxk2jGCbrMmTQSQcODuK4JCSUg4XtDW+vyNyAXQi71GsdIy1eSLM1afbz9WfIvStd/OW27yfpmxuAt/BqKeT7XLnMojL10GklCcHohKnWp5UcyFxS4WN0XK0BIsIWK/4AWw6blGwx2xNe0RnJvUtIscJzHh69ShTjn3QuNGHRQVjHibf4T4F5a/9kV5Mns9K9oeZmVPy1IkYRZQLSANzj1aJCRuWXo0ufvxuuEl99zz8c44rmCdYnE5X890tNuG+oqdT7GSqciEqNHcVIi/OAw15ZXjEF7tnW0HftriinDxmpy+v1V0RwGpwkNqJYdapX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnKv7oJzltLW6C26HaDuFk/xWeQEgKaGXCvC8U3iEFU=;
 b=JFGR5ZN5Y6KswXAdU+Is9bs+dd4jEMvOThItGPevB+5/2cEcAP38+cuF/jU45ooDVrmnjpf0IeSqC3yM9vBGF7KUfR/O3hIDuPrCoAL3QCfV8kKRnKOaVOVysAdLkyJTsx3F07aILpR5Xr0TQlm5UBifH3+tBEOEU75043RETQY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC 4/5] xen/tracing: Add a function tracer
Date: Fri, 23 Oct 2026 13:56:55 +0900
Message-Id: <20261023045655.164966-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYYP286MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e9af30-b6ed-44d0-82d3-08df30c21750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|261009223027099003|261021121427099003|261022075727099003|261022105027099003|56012099006|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	/vybvP0qEK5lPKLIzNfDVoWN6dRufC4xq+hbBTUAlWoYtMK1AZwZKQvTb9X6xWAG3zRCftdUxcHxAuD5Ja9XWGECxka+YxJZLNsNBvjct1TV5mn7oPrctChlgq8wCrRCSx15KeFRIYZYdnq/mI6RJzYl35bTxui4IS1uoPfpWb72at59AmlsNR9wxj/lcWdbeZAOYxE1E3uwLLdoz6ZlX5KY/rFjstvdmATTMijF+SB2P8e1arQTD7TVuhAJN/2aRE9fY43+XR1gkkIjy0LcGr+oF/hJL996ShuJ6aVbEGA+E7GtWOtfJosY4hIFoS/Eebh1Y57A1VVesqKScAzImTtSFrg/CmS857GMC2HA8WK7PXXlAvB9rJgKCG58VZOCzHuq40ZWs2Carz8sTfpD/Ckd7LepC6RcyeYLOtClC1SKALflZ/SXpE2I5xvnwADVINpLlW7btgWu0I+bs4grJCcg5AZ3UrWcnMcKPSp89yaWVJCb3F73q3/tpXakG6XpxqbGD4+q/il5C0opHU5Hhc6WC1Wp8LtJ5apitAFXOJLLUCq6XxFcrcnIEsSf4JVgMNN+RQtA7D7EBhssLNoTUkDVrX41pK0OZcY/qOYzx9IMmwUlVhLTE0QfqGGCVFQh2nOyZm/siCGcsvsbqGmY4Xkw9HidT0C1LdZ39dJGlyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ShdadNF6fsCkp0IjVJSbTxujHTzqyS85iAoObGcB9eG9HvsdhMvUFx5wgjnh?=
 =?us-ascii?Q?GECWjbKK8K+ucHDgELWZbeKTOxPBfQMLJfZ2GgTfHDCE/KUXfETHGdCp9/NI?=
 =?us-ascii?Q?6WjIXgynpo59XxLTcAqSpqjyS57Bz2HC6GSYLU2qHHGWpBDevEZnWSqI5MW4?=
 =?us-ascii?Q?kT+js6dSWsO5iSZaZ5DiyMu3oXkTCs1aI1SOYpQLR7lcmqcex6gLJf12nKXl?=
 =?us-ascii?Q?nqtG8GyXH8N3SNiYMVcKYaHaUWPAvB3YDiKfBL6kUh83mKd0/JdxkngkJgSK?=
 =?us-ascii?Q?izdw84F1SV179FzWLwV1QD7xif/K2wzCCMUmHfMyFXCWNniqrdA9Css6prtg?=
 =?us-ascii?Q?Djm53buDemAEAsFP83jkoNNjrpue2CO6w8kz32FEjVQ/HFROpWZZo0NL7oce?=
 =?us-ascii?Q?S5M9Qw6iICEkNRhJrVJo9sGzNR+vL0HOxP2dtitS+OeUMGCmvzbAtYXWFIXD?=
 =?us-ascii?Q?66aPPzlL05/9wJgkpl6Pqcwsn6H/wwnNp6yrcyTjCBT3mEmYYavpZo7uioy5?=
 =?us-ascii?Q?nQyl0hVLU5/0FsmNOJpU1It45EZUCp/KaUWdnWldsHxcykw7rMYapwNCIWxu?=
 =?us-ascii?Q?jN8bvnt2zmg+jMWU7f0I5UEgGkZjaF1lXLh6TNV20LIprCv6NxZiKLk8fDhL?=
 =?us-ascii?Q?Nm8kErL9Xvy4HF1HkV8DTkgCEvYr7J4KnY6usBpvE7m4nXQClCjlT3BqmqMb?=
 =?us-ascii?Q?eJ+oVWjHigbTdZiv2gjXiUg6SpFXuMCAk4D8t6eX4DQVxUrzBNeAiL10iP/d?=
 =?us-ascii?Q?1CWkjNR8zWNYHbN6xQjsWMzdg7X9tdr1IYnfqsXoVoYD7lN87U57gb0jr8TL?=
 =?us-ascii?Q?4Kk2/zJL4UB57mjSmm67tzLitl7dgIZR3JIWPL4CEuU2J+EMmJLwSwsEXsDG?=
 =?us-ascii?Q?J5Ue5RPXbF4zIw9bsLLlEg1XbTjWeYVzDh0mcfNQvViolNIGzXKjilCGWVcJ?=
 =?us-ascii?Q?XwPltGBR+Z4uoV/73QWEif7IWXjiyyplrgawqP+lezaC1BLDe+gCVEV8bW8k?=
 =?us-ascii?Q?g2GaOoEcA/xHnDPLBem0atl8Q94Nz+ICw5xwLq6BIYFeUU4mUf0xjxYsn/XI?=
 =?us-ascii?Q?XIPhF6n8JmFiskDXEjp4oUANhosGfHmEfTjKkuyIAHNTF5mf9nbJpw3tQRWi?=
 =?us-ascii?Q?apzFUDK4OV/IiOFKrp4/eFjMU+6sFI5IJJkuvC4Mb1vN5gm27QAK/N2gHWEp?=
 =?us-ascii?Q?+/Op2azY8bukVe55rfBVfYU0t7NGjbsSbN/2JBk4aVub0SLv6ddXGP2TTwNJ?=
 =?us-ascii?Q?fAF/YBc9vAMLEyma6ZBZUuz4dhab7D61ChVZG/Dps8FqRV4aUUkd717Kigea?=
 =?us-ascii?Q?dMnkxoS+bwenOhQpLYw9TMpgRnQpwgp2XOZT94FZn3WMFcavSSkBMWD5Zb3N?=
 =?us-ascii?Q?fW+2rwJmCMziwe/XLJjg+j9a8d5+wykTTG4GhNBmfKZuhg1nXdMZMAc2oDsM?=
 =?us-ascii?Q?zQZoXgWzvvJTi9PSc7tRBp4UjxHyyO4ni0ShKyhgAxVQeGNuc1AaXRKsDsAr?=
 =?us-ascii?Q?dxmL7Z5MX3S60wR5vXJZvc1WaYZVZTXHN3lM/JvGIEBWyUtaxrupvM1hhtJ+?=
 =?us-ascii?Q?ojp2ZsYb6XR1JLSiWd3juvmcK/+v/uQ2qOktc2NdPxNEC98zTZ54ZY0VEuVZ?=
 =?us-ascii?Q?sEMp6YA2GMKfXXywRimi3ng/k0DQhbDnIyYE9AEMEPema1u0Pwvw1d3VzFRR?=
 =?us-ascii?Q?R5TOhD6918ziceu0ytS+OhZ6WXI540LJH/P04OQopN9+oUT5jO2j6u87gi10?=
 =?us-ascii?Q?iryYFW7t5w=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e9af30-b6ed-44d0-82d3-08df30c21750
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 04:57:08.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z53L81driH+O7GunVu7RvDvsWzAIiV3G484T571yEe+r1FZqpk7GVzCBMbFFe2mMzFphHcUA6Ps/LCQNKop2Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5665
X-purgate-ID: tlsNG-16d1c6/1792731432-FD00977B-79E504D4/0/0
X-purgate-type: clean
X-purgate-size: 11054
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a function tracer which records calls to the selected function.

Each record includes the timestamp, CPU ID, and domain associated with
the call.

~$ xenhypfs cat /tracing/trace
# tracer: function
#
# entries-in-buffer/entries-written: 5/5   #P:1
#
#                      _-----=> irqs-off
#                     / _----=> need-resched
#                    | / _---=> in-irq
#                    || / _--=> preempt-depth
#                    ||| /
# DOMAIN/VCPU  PCPU  ||||         TIMESTAMP        FUNCTION
#      |        |    ||||             |               |
         d0/v0 [000] nnn  0           442.074071: xen_extra_version <-do_xen_version
         d0/v0 [000] nnn  0           443.160035: xen_extra_version <-do_xen_version
         d0/v0 [000] nnn  0           469.897195: xen_extra_version <-do_xen_version
         d0/v0 [000] nnn  0           471.295576: xen_extra_version <-do_xen_version
         d0/v0 [000] nnn  0           472.052187: xen_extra_version <-do_xen_version

The tracer is inspired by Linux ftrace's function tracer.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---
 xen/common/Makefile         |   2 +
 xen/common/function_trace.c | 274 ++++++++++++++++++++++++++++++++++++
 2 files changed, 276 insertions(+)
 create mode 100644 xen/common/function_trace.c

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 303016f250..435423f694 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -80,8 +80,10 @@ obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_LIBFDT) += libfdt/
 
 obj-$(CONFIG_LIVEPATCH_TRACER) += hypfs_trace.o
+obj-$(CONFIG_LIVEPATCH_TRACER) += function_trace.o
 # Do not generate patchable entries for the tracer functions.
 $(obj)/hypfs_trace.o: CFLAGS-y += -fpatchable-function-entry=0,0
+$(obj)/function_trace.o: CFLAGS-y += -fpatchable-function-entry=0,0
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
diff --git a/xen/common/function_trace.c b/xen/common/function_trace.c
new file mode 100644
index 0000000000..5dd4ccdec0
--- /dev/null
+++ b/xen/common/function_trace.c
@@ -0,0 +1,274 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/percpu.h>
+#include <xen/preempt.h>
+#include <xen/time.h>
+#include <xen/hypfs_trace.h>
+#include <xen/symbols.h>
+#include <xen/sched.h>
+#include <xen/irq.h>
+#include <xen/smp.h>
+#include <xen/softirq.h>
+#include <xen/cpumask.h>
+#include <xen/xmalloc.h>
+
+#include <asm/system.h>
+
+#define FUNCTION_TRACE_CTX_NORMAL  0
+#define FUNCTION_TRACE_CTX_IRQ     (1U << 0)
+#define FUNCTION_TRACE_CTX_IDLE    (1U << 1)
+#define FUNCTION_TRACE_CTX_IRQS_OFF (1U << 2)
+#define FUNCTION_TRACE_CTX_RESCHED  (1U << 3)
+#define FUNCTION_TRACE_RECORD_TEXT_SIZE (2 * KSYM_NAME_LEN + 128)
+#define FUNCTION_TRACE_BUFSIZE 256
+
+static const char function_trace_header[] =
+    "#\n"
+    "#                      _-----=> irqs-off\n"
+    "#                     / _----=> need-resched\n"
+    "#                    | / _---=> in-irq\n"
+    "#                    || / _--=> preempt-depth\n"
+    "#                    ||| /\n"
+    "# DOMAIN/VCPU  PCPU  ||||         TIMESTAMP        FUNCTION\n"
+    "#      |        |    ||||             |               |\n";
+
+struct function_trace_record {
+    uint64_t timestamp; /* Timestamp of when the event occurred */
+    unsigned long ip; /* The address of the traced function */
+    unsigned long parent_ip; /* The address where the traced function was called */
+    unsigned int pcpu; /* pCPU */
+    domid_t domid; /* Domain ID */
+    unsigned int vcpuid; /* vCPU */
+    unsigned int context_flags; /* Execution context */
+    unsigned int preempt_depth; /* Preempt count */
+};
+
+struct function_trace_cpu_buffer {
+    struct function_trace_record records[FUNCTION_TRACE_BUFSIZE];
+    unsigned int head;
+    uint64_t written;
+};
+
+struct buffer_iterator {
+    const struct function_trace_cpu_buffer *buffer;
+    unsigned int start;
+    unsigned int count;
+    unsigned int next;
+};
+
+static DEFINE_PER_CPU(struct function_trace_cpu_buffer, function_trace_buffer);
+static DEFINE_PER_CPU(bool, function_trace_recursing);
+
+static void cf_check function_trace_callback(unsigned long ip, unsigned long parent_ip)
+{
+    struct function_trace_cpu_buffer *buf;
+    struct function_trace_record *rec;
+    unsigned int ctx = FUNCTION_TRACE_CTX_NORMAL;
+    unsigned long pending;
+
+    if ( this_cpu(function_trace_recursing) )
+        return;
+
+    this_cpu(function_trace_recursing) = true;
+
+    buf = &this_cpu(function_trace_buffer);
+    rec = &buf->records[buf->head];
+
+    rec->preempt_depth = preempt_count();
+
+    if ( !local_irq_is_enabled() )
+        ctx |= FUNCTION_TRACE_CTX_IRQS_OFF;
+
+    pending = softirq_pending(smp_processor_id());
+    if ( pending & ((1UL << SCHEDULE_SOFTIRQ) |
+                    (1UL << SCHED_SLAVE_SOFTIRQ)) )
+        ctx |= FUNCTION_TRACE_CTX_RESCHED;
+
+    rec->timestamp = NOW();
+    rec->ip = ip;
+    rec->parent_ip = parent_ip;
+    rec->pcpu = smp_processor_id();
+
+    if ( in_irq() )
+        ctx |= FUNCTION_TRACE_CTX_IRQ;
+
+    if ( is_idle_vcpu(current) )
+        ctx |= FUNCTION_TRACE_CTX_IDLE;
+
+    rec->context_flags = ctx;
+    rec->domid = current->domain->domain_id;
+    rec->vcpuid = current->vcpu_id;
+
+    buf->head = (buf->head + 1) % FUNCTION_TRACE_BUFSIZE;
+    buf->written++;
+
+    this_cpu(function_trace_recursing) = false;
+}
+
+static int cf_check function_tracer_clear(struct trace_context *tr)
+{
+    struct function_trace_cpu_buffer *buf;
+    unsigned int cpu;
+
+    for_each_online_cpu ( cpu )
+    {
+        buf = &per_cpu(function_trace_buffer, cpu);
+        buf->head = 0;
+        buf->written = 0;
+    }
+
+    return 0;
+}
+
+static int cf_check function_tracer_init(struct trace_context *tr)
+{
+    int rc;
+
+    rc = function_tracer_clear(tr);
+    if ( rc )
+        return rc;
+
+    return trace_register_callback(function_trace_callback);
+}
+
+static int cf_check function_tracer_reset(struct trace_context *tr)
+{
+    return trace_unregister_callback();
+}
+
+static void format_ip(char *buf, size_t size, unsigned long ip)
+{
+    const char *name;
+    unsigned long sym_size, offset;
+    char namebuf[KSYM_NAME_LEN + 1];
+
+    name = symbols_lookup(ip, &sym_size, &offset, namebuf);
+    if ( name )
+        snprintf(buf, size, "%s", name);
+    else
+        snprintf(buf, size, "0x%lx", ip);
+}
+
+static unsigned int cf_check function_tracer_get_trace_size(struct trace_context *tr)
+{
+    unsigned int size = sizeof(function_trace_header) + 128;
+    unsigned int cpu, count;
+    struct function_trace_cpu_buffer *buf;
+
+    for_each_online_cpu ( cpu )
+    {
+        buf = &per_cpu(function_trace_buffer, cpu);
+        count = min(buf->written, (uint64_t)FUNCTION_TRACE_BUFSIZE);
+        size += count * FUNCTION_TRACE_RECORD_TEXT_SIZE;
+    }
+
+    return size;
+}
+
+static size_t cf_check function_tracer_print_trace(struct trace_context *tr, char *buf, size_t size)
+{
+    struct buffer_iterator *iters;
+    unsigned int cpu, nr_iters = 0;
+    uint64_t entries = 0, written = 0;
+    size_t pos = 0;
+
+    iters = xzalloc_array(struct buffer_iterator, nr_cpu_ids);
+    if ( !iters )
+        return scnprintf(buf, size, "# unable to allocate trace iterators\n");
+
+    pos += scnprintf(buf + pos, size - pos, "# tracer: function\n#\n");
+
+    for_each_online_cpu ( cpu )
+    {
+        const struct function_trace_cpu_buffer *cbuf = &per_cpu(function_trace_buffer, cpu);
+        struct buffer_iterator *iter = &iters[nr_iters++];
+
+        iter->buffer = cbuf;
+        iter->count = min(cbuf->written, (uint64_t)FUNCTION_TRACE_BUFSIZE);
+        iter->start = cbuf->written >= FUNCTION_TRACE_BUFSIZE ? cbuf->head : 0;
+
+        entries += iter->count;
+        written += cbuf->written;
+    }
+
+    pos += scnprintf(buf + pos, size - pos,
+                     "# entries-in-buffer/entries-written: "
+                     "%"PRIu64"/%"PRIu64"   #P:%u\n",
+                     entries, written, num_online_cpus());
+    pos += scnprintf(buf + pos, size - pos, "%s", function_trace_header);
+
+    while ( pos < size - 1 )
+    {
+        const struct function_trace_record *rec = NULL;
+        unsigned int i, selected = 0;
+        char func_str[KSYM_NAME_LEN];
+        char parent_str[KSYM_NAME_LEN];
+        char vcpu_str[32];
+        uint64_t seconds;
+        unsigned int useconds;
+
+        for ( i = 0; i < nr_iters; i++ )
+        {
+            const struct buffer_iterator *iter = &iters[i];
+            const struct function_trace_record *next_rec;
+            unsigned int idx;
+
+            if ( iter->next == iter->count )
+                continue;
+
+            idx = (iter->start + iter->next) % FUNCTION_TRACE_BUFSIZE;
+            next_rec = &iter->buffer->records[idx];
+
+            if ( !rec || next_rec->timestamp < rec->timestamp )
+            {
+                rec = next_rec;
+                selected = i;
+            }
+        }
+
+        if ( !rec )
+            break;
+
+        iters[selected].next++;
+
+        format_ip(func_str, sizeof(func_str), rec->ip);
+        format_ip(parent_str, sizeof(parent_str), rec->parent_ip);
+
+        seconds = rec->timestamp / 1000000000ULL;
+        useconds = (rec->timestamp % 1000000000ULL) / 1000;
+
+        if ( rec->context_flags & FUNCTION_TRACE_CTX_IDLE )
+            snprintf(vcpu_str, sizeof(vcpu_str), "idle");
+        else
+            snprintf(vcpu_str, sizeof(vcpu_str), "d%u/v%u",
+                     rec->domid, rec->vcpuid);
+
+        pos += scnprintf(buf + pos, size - pos,
+                         "%14s [%03u] %c%c%c%3u %13"PRIu64".%06u: %s <-%s\n",
+                         vcpu_str, rec->pcpu,
+                         rec->context_flags & FUNCTION_TRACE_CTX_IRQS_OFF ? 'y' : 'n',
+                         rec->context_flags & FUNCTION_TRACE_CTX_RESCHED ? 'y' : 'n',
+                         rec->context_flags & FUNCTION_TRACE_CTX_IRQ ? 'y' : 'n',
+                         rec->preempt_depth, seconds, useconds, func_str, parent_str);
+    }
+
+    xfree(iters);
+
+    return pos;
+}
+
+static struct tracer function_tracer = {
+    .name = "function",
+    .init = function_tracer_init,
+    .reset = function_tracer_reset,
+    .clear_trace = function_tracer_clear,
+    .get_trace_size = function_tracer_get_trace_size,
+    .print_trace = function_tracer_print_trace,
+};
+
+static int __init cf_check function_trace_init(void)
+{
+    return trace_register_tracer(&function_tracer);
+}
+__initcall(function_trace_init);
-- 
2.34.1


