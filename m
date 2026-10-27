Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACA8606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=XTu37wpU
Received: from list by lists.xenproject.org with outflank-mailman.1462592.1673657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNV-0008UT-GH; Tue, 27 Oct 2026 21:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462592.1673657; Tue, 27 Oct 2026 21:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNV-0008Sb-5v; Tue, 27 Oct 2026 21:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1462592;
 Tue, 27 Oct 2026 21:06:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNS-00085c-LD
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNS-007u3c-28
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:38 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11233-2eae-0a2a0a5409dd-0a2a4507c680-42
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:38 +0100
Received: from [40.107.130.85]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1125d-b4ea-0a2a45070019-286b82552197-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:37 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:36 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZRdjOFKhawXkfnZhLJDsafjLBDIu6nf+o8x/PLSgFHj4CZ7dibFD4bFAluCqxuAP/qIg9A9W/4UBXHGd6z48DefumYHHdtuxPyJo+pPERGVfWtxIENl6sX/8tZk0zXRmtovgiFN5Ji5MRm/d8fS0WbQN/OtUID5b4ZM9s5SW1sKcL8DMDxut8SFz2WEgV7ECiVjOIBWWxWMY2c08npzPhz3xyhOx19yC+/zyDM7ePlc+P49gT6Gj28aw8o5mJyB8U13U7DfHcZz7JNvknrP1kAP60LK877o+ZXhR4OvyoQNfkVr1ondUxYUlVXg/Hw9NCpr9pHzvIOi2iSBf8vZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQmpjK2V4h/9sztcZmJlhw/is8rEdP0Ax+FFiJZjMgo=;
 b=t15H9m/S5R8W0q7Sxpx3M/gQajtB8JuvrI7TEIac0JjAaaPlyVZ+wohm7+ASNlsSQMaOhdeh4VGERNK7H1fQt1TPuevQLaX3SHbIDrWKkvghvElayXuw7AggYO4ZvORwGYffiCqE38HQnZsisQihs5L62k06tCpf4OlXlBtC3orbpNr6eZlUjob83J7D5yqrYnr3HT/6uTQdcA4m1IuLZdWZJnf/1rba+w8nCVc6lflpqFYpme47MI7cPpjUghuulmJB9igGwvKEpcF2k+tDUmxBcs+0Rb+6dGszO2MyphxwYmm+LU4HbK2NkqgRKFbKzq+OGqt9IYLDeejRK0pJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQmpjK2V4h/9sztcZmJlhw/is8rEdP0Ax+FFiJZjMgo=;
 b=XTu37wpUEuJrUH0Uklxj+FF993BR50y9iD6Wx/yK1F+8AIwUl/9YzRJPgmFzMSer8kSzJexdc2UZGLF6QwvazJGzNYPCWncdrjkMp51bhDiL/ULVu4IkfHMJ9s4bJyzjXZ0BD+k9KrIzE5uHui4OdySKwKvsaYGyKr7lT/Nfz92yCCBG+HgSlM66So2vV9XzRk/2lh41WIMzi9xofuZKXAOYHeiuZUcDaGo9z+Geho0gjj/FhhlSwh5Leef2x0aJSZIqyhjbd8WAQoy0CEw/iouGPxcoAue7fu39oemh3foEs3a5arfekse5WTHZULBZ/llJT330+3Ga0A6P6pVIKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v13 14/14] xen/arm: Add host system suspend backend
Date: Tue, 27 Oct 2026 23:06:03 +0200
Message-ID: <2299a3912c0491680b15d10a39ec5ec7e041a390.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 0535fc5f-db4c-4188-55fb-08df346e2fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|261022075727099003|11063799006|5023799004|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|22082099003|18002099003|6133799003|10067099003|3023799007|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	gLtR59tFu9U/ZV4CfjQNXR1DKnPOoe6RE5jIlfTtqFo0YYjwM4a+bRgc/oSPDWKk0sSIw23i3o4eo9OXdlwbKksUUSve9xHnEQj4Jx+vm5oyaxlpuSPdK4G8MGMYmWBnQGTPmMbn5IT2yEhuVwrZOK7vnKVqMIR9DJ+S+xrBaIhEQhFFOopV3QaRyKE0Zk4hCZpMV4WNf+C+pft7Uwq+tjvDu2xh2loY1l4WMv8NxfmeNvvUz7iN+oWQ0KqfgXn19b7yj6UQ9Unqxtrei1Xl1ToZNiNs8H7K8Hx7qHLlgqdHSQl/Nq2Ya/cupE/EtzSl9RaRgUH+YDxirmiP1BS6bXZZkDGJb3mABmIgyNas85fky/e3JWgq3izFcF+t5LXtVioj100gIOfgWP+yiBVeKsHES2qsXrsEqUUewO/HIMPSnvF33rQsP9YmY53o6/lz+TEZJ+/lkQvh/clD3MFVTmvgu9jd8id/yQfM88UEzSsk0qngK75hoWgH6ZXSlfmumThR6PQN9Q7bqejLZLOa9v6+zNw2KNAM//U/tZeC4sjOWKQ1o4IQ0sdnuAhH6QlAuhuzpPC5YPzV+1aUH4mzO5fLLoa3Ccsr96crH/vO7zamqgVlqm00g32W8opzs+mApDWrosEGIeBWiJulSRoFok8IaAHA8wasxuCW40LFScE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(261022075727099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IJ+RW1tqbAx50Ul/tN1PsMiwb8A5DXGhEnNTBl6ha23IUz38Oj0SR6u7rUF+?=
 =?us-ascii?Q?GRPrRqorl41jqfosIhniZJCga/d1TWCRkq4/3piD48PQy8OLs/HtFw3DiGpR?=
 =?us-ascii?Q?jDiCX+Uh0R0ARg8h5PI22KNR32cZrNxAmlGrk6xQ7Oub0ns3iS28Q2iTqgYs?=
 =?us-ascii?Q?IqFlzJ1pU1KQLIP0gr+SLGafD9Ku8LaRgLYN4soc1xhpVyWQJ7ZIlSPnxTGi?=
 =?us-ascii?Q?J8hszUJpb5nBPD4z46pMZNIPnArTdJ9UOZ8X6FEbaSq3xi60h91sEzoRCb6A?=
 =?us-ascii?Q?55/d1BNvrAvpGwuHbYu5rBfyETVInaZ6bei6Y9ss/L8xm4y/+63Gq4p1dtuH?=
 =?us-ascii?Q?sBdY2SZW5ER5rmeYA0eui8fiekSbgOSswIStVhXtG+mpfeQbVdlB+qZt9L0o?=
 =?us-ascii?Q?2SA2T6Ato3e4PfhpWVCyBnho3V6Fq640JNOqQOBx6oUpMlmtJ89RjjFyadPj?=
 =?us-ascii?Q?wtnLImRgfTFDx70f++3eb+HimMN9uSTtZzfvjBmsByd3G/LFuLvm8u/qpnzH?=
 =?us-ascii?Q?301wUvhkMbBVMS5+AzGWVHhnzm7trCOnoYk1o9XMFcwC49UDgBnWChzH8AAg?=
 =?us-ascii?Q?A463kvuLECD2CO+DM/6XyrMFQRkU63gQ1hOqkPu4Evzrl1Uy9ckj34Hkh8uS?=
 =?us-ascii?Q?HtsqvSP3CHWz68wIoc91j5yCrN1U/sC7gsRuTeHBKfGE3dY3YVAgruC6FIsu?=
 =?us-ascii?Q?pIznzQtIaE4CabfAXRWTO2dDglJaJxi3H6COReHYNgT0fCq1S2gEvKA5HkUU?=
 =?us-ascii?Q?+5/uWaJxsKc7/Lmpby78WjmdaxejHTJOOqcAHTc/PtTjxma+dZxuJ3iHf5+X?=
 =?us-ascii?Q?TKmtCgDUmJqdGzo7SFSLGC+KhXxuwgVB6/7gQBFrVYtiX0G5RaOz7bapDdrQ?=
 =?us-ascii?Q?1+ft/SfE4k5VPTHjVodnwErpgOKQsev52byCoccyeuXhsIYegrEC4rxEV6UX?=
 =?us-ascii?Q?qePplF4MvSIC0IwJ56PZkR1GRhBDV2TK4SrLnMsUH3mtUzh0q924eSs2UdGg?=
 =?us-ascii?Q?zBdcDv3xU1ifZjCT0+rUgo5DoNkKUB1iGF/G++e0UArjrjGKldQbijCDIgLt?=
 =?us-ascii?Q?cZHP/YNlqVSKbgrb4kHrBiShZD6SfSkTrGoxYyA3pv1WNdXFxYgwmnyk6xwa?=
 =?us-ascii?Q?zT7ERfke4OdqMkD2aaWwkQ61hlHvhCp+E11yGL66vu00KkfhYuYXDRPc+niu?=
 =?us-ascii?Q?4kr4wgi71uUfG4bPJe03Ir/RudDsuz3R6jR8u+cl7Cju4Rrmy3BtnEvYwrPW?=
 =?us-ascii?Q?aseLVu1EGH+v8RveVjUSy3RLFbiI5qVgW/AL4yWQ3e3XM9F4hxvxwscz91XQ?=
 =?us-ascii?Q?r1CwxB4147VfCxTwxDhZdV6iRunE07I3LmP/E+btZBKDcAneoZDQhZLGmPAp?=
 =?us-ascii?Q?RBWBezOnjgW7Yha9ZYcBuT6yxsnvQ3QUMbtYj4pPD8ZwpPHvSxQwzTz3bzx3?=
 =?us-ascii?Q?Y40XX2/pDSiTc9O2rgC8z9taDGUH0KvwcIGyCNY3yNRDCHfEf3lGaSmpBy2t?=
 =?us-ascii?Q?T8gw8Re+QTjclhn52JrNAlttiOPDyIo+D84+5OvHFUtSu0PQo6RBu3LawuGO?=
 =?us-ascii?Q?tGMeSeBKgq7NbHRPJ3chpVT6ksYfqlv7HFB4yBHNrbN7xj0VjgxYqhX1zQgR?=
 =?us-ascii?Q?WxK0UK4DZlq78khOTHgbn+s6rpeWz4O3q/iTjZRvbI35osuludWtgNW7d5V4?=
 =?us-ascii?Q?vLlHESgBt7JjNqEr9DIoQVayyD0nNX8Xmy4UNwoCc6Q5KV581HSL6LlCZv5Z?=
 =?us-ascii?Q?OeaE077/JA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0535fc5f-db4c-4188-55fb-08df346e2fc2
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:36.3462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b8swPxT+NwSkXSzJfWxb2sXjIBU1JIoKLuTbIpULV/vu1VVRjz07NA7GTNtG6ISQ3llBzPQkMab80EKIARLqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-ef75cf/1793135198-348C9AE4-BEC97DEA/0/0
X-purgate-type: clean
X-purgate-size: 13960
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Add the Xen-wide suspend/resume backend used after a control-domain
vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
runtime driver blockers and control-domain sequencing checks are handled
by the preceding commit; this change adds the code that actually drives
the host suspend attempt.

The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
are disabled during suspend. It freezes domains, disables the scheduler
and then disables non-boot CPUs.

Host-side suspend participants are handled in phases. IOMMU and console
state are suspended first. Local IRQs are then disabled before suspending
timer and GIC state. On resume or failure, the completed suspend phases
are unwound in reverse: GIC and timer state are restored while IRQs are
still disabled, local IRQs are restored, and then console and IOMMU state
are restored.

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems this can leave init_ttbr uninitialized, so set it
from the boot CPU before entering suspend.

Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
only selected when UNSUPPORTED is set and MPU is not set.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V13:
- Explicitly discard console_resume()'s return value. It always returns
  zero in the current implementation (MISRA Rule 17.7). No functional
  change.
- Remove the redundant rcu_barrier() and its outdated comment before
  enable_nonboot_cpus(). Per-CPU areas are kept during suspend, and
  cpu_up() already waits for pending RCU callbacks before CPU_UP_PREPARE.

Changes in V10:
- Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND,
  before resuming the rest of the host suspend path.
- Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
  MMU-specific.

Changes in V9:
- Split vPSCI availability policy, runtime host-suspend blockers and the
  domain-readiness precheck into the preceding commit.
- Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
  path.
- Reorder the host suspend/resume phases so the timer is suspended with
  local IRQs disabled and local IRQs are restored after the GIC and timer
  resume paths, before the console and IOMMU resume paths.
- Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.

Changes in V8:
- Add a pre-suspend check in system_suspend() after scheduler_disable() to
  require all domains to be in the shut down state with SHUTDOWN_suspend
  before proceeding with the global suspend flow.
- Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
  with an arch-selected capability instead.
- Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
- Rename need_hwdom_shutdown() to want_hwdom_shutdown().

Changes in V7:
- Control domain is responsible for host suspend.
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled.
- Use IS_ENABLED() for config checking instead of #ifdef.
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
  function.
- Squash with iommu suspend/resume commit.
---
 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/cpuerrata.c             |   7 +-
 xen/arch/arm/include/asm/cpuerrata.h |   1 +
 xen/arch/arm/include/asm/mmu/mm.h    |   2 +
 xen/arch/arm/include/asm/suspend.h   |   2 +
 xen/arch/arm/mmu/smpboot.c           |   2 +-
 xen/arch/arm/suspend.c               | 149 +++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c                 |  10 +-
 8 files changed, 170 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fd5f0ddb17..c3e32fb683 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 35ad98d29d..5a7f127495 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
     update_cpu_capabilities(arm_errata, "enabled workaround for");
 }
 
+int enable_local_cpu_errata_workarounds(void)
+{
+    return enable_nonboot_cpu_caps(arm_errata);
+}
+
 void __init enable_errata_workarounds(void)
 {
     enable_cpu_capabilities(arm_errata);
@@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_block *nfb,
          * fixed to expect an error at CPU_STARTING phase.
          */
         ASSERT(system_state != SYS_STATE_boot);
-        rc = enable_nonboot_cpu_caps(arm_errata);
+        rc = enable_local_cpu_errata_workarounds();
         break;
     default:
         break;
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 1799a16d7e..b93521326f 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -5,6 +5,7 @@
 #include <asm/alternative.h>
 
 void check_local_cpu_errata(void);
+int enable_local_cpu_errata_workarounds(void);
 void enable_errata_workarounds(void);
 
 #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d..ee73a77777 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 extern void switch_ttbr(uint64_t ttbr);
 extern void relocate_and_switch_ttbr(uint64_t ttbr);
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /* __ARM_MMU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 50dc6e9fdf..889a6509d9 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
 void hyp_resume(void);
 bool host_system_suspend_allowed(void);
 void host_system_suspend_disable(const char *reason);
+void host_system_suspend(struct domain *d);
 
 #else /* !CONFIG_SYSTEM_SUSPEND */
 
 static inline bool host_system_suspend_allowed(void) { return false; }
 static inline void host_system_suspend_disable(const char *reason) {}
+static inline void host_system_suspend(struct domain *d) {}
 
 #endif
 
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b7..ff508ecf40 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
-static void set_init_ttbr(lpae_t *root)
+void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index c7c26bcf03..e6b7f6a6cc 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,10 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/cpuerrata.h>
+#include <asm/cpufeature.h>
+#include <asm/gic.h>
 #include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
+#include <xen/tasklet.h>
 
 struct resume_cpu_context resume_cpu_context;
 
@@ -44,6 +52,147 @@ void host_system_suspend_disable(const char *reason)
            reason ? reason : "unsupported suspend/resume path");
 }
 
+/* Xen suspend. data identifies the domain that initiated suspend. */
+static void system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+    struct domain *d = (struct domain *)data;
+
+    BUG_ON(system_state != SYS_STATE_active);
+
+    system_state = SYS_STATE_suspend;
+
+    printk("Xen suspending...\n");
+
+    freeze_domains();
+    scheduler_disable();
+
+    /*
+     * Non-boot CPUs have to be disabled on suspend and enabled on resume
+     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
+     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
+     * platform capabilities, this may lead to the physical powering down of
+     * CPUs.
+     */
+    status = disable_nonboot_cpus();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_nonboot_cpus;
+    }
+
+    console_start_sync();
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_iommu;
+    }
+
+    local_irq_save(flags);
+
+    time_suspend();
+
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
+    set_init_ttbr(xen_pgtable);
+
+    /*
+     * Enable identity mapping before entering suspend to simplify
+     * the resume path
+     */
+    update_boot_mapping(true);
+
+    if ( prepare_resume_ctx() )
+    {
+        status = call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI call,
+         * the code below in this 'if' branch will never execute. Execution
+         * will continue from hyp_resume which is the hypervisor's resume point.
+         * In hyp_resume CPU context will be restored and since link-register is
+         * restored as well, it will appear to return from prepare_resume_ctx.
+         * The difference in returning from prepare_resume_ctx on system suspend
+         * versus resume is in function's return value: on suspend, the return
+         * value is a non-zero value, on resume it is zero. That is why the
+         * control flow will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n",
+                    status);
+
+        system_state = SYS_STATE_resume;
+    }
+    else
+    {
+        system_state = SYS_STATE_resume;
+
+        /*
+         * CPU0 resumes directly from hyp_resume(), bypassing the CPU hotplug
+         * path that re-checks and re-enables errata workarounds for secondary
+         * CPUs.
+         */
+        check_local_cpu_errata();
+        check_local_cpu_features();
+        BUG_ON(enable_local_cpu_errata_workarounds());
+    }
+
+    update_boot_mapping(false);
+
+    gic_resume();
+
+ resume_time:
+    time_resume();
+
+    local_irq_restore(flags);
+
+    (void)console_resume();
+
+ resume_iommu:
+    iommu_resume();
+
+ resume_end_sync:
+    console_end_sync();
+
+ resume_nonboot_cpus:
+    enable_nonboot_cpus();
+
+    scheduler_enable();
+    thaw_domains();
+
+    system_state = SYS_STATE_active;
+
+    printk("Resume (status %d)\n", status);
+
+    domain_resume(d);
+}
+
+static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
+
+void host_system_suspend(struct domain *d)
+{
+    system_suspend_tasklet.data = (void *)d;
+    /*
+     * The suspend procedure has to be finalized by the pCPU#0 (non-boot pCPUs
+     * will be disabled during the suspend).
+     */
+    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 0131c297dd..5d4c31df1e 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -238,7 +238,8 @@ static bool domain_in_suspend_state(struct domain *d)
     return suspended;
 }
 
-static int32_t domain_psci_system_suspend_policy(struct domain *d)
+static int32_t domain_psci_system_suspend_policy(struct domain *d,
+                                                 bool *host_suspend)
 {
     struct domain *other;
     bool last_awake_control_domain = true;
@@ -305,6 +306,7 @@ static int32_t domain_psci_system_suspend_policy(struct domain *d)
     if ( !host_system_suspend_allowed() )
         return PSCI_DENIED;
 
+    *host_suspend = true;
     return 0;
 }
 
@@ -315,6 +317,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
     bool is_thumb = epoint & 1;
+    bool host_suspend = false;
     struct resume_info *rctx = &d->arch.resume_ctx;
 
     /* THUMB set is not allowed with 64-bit domain */
@@ -339,7 +342,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 
     spin_lock(&vpsci_system_suspend_lock);
 
-    rc = domain_psci_system_suspend_policy(d);
+    rc = domain_psci_system_suspend_policy(d, &host_suspend);
     if ( !rc )
     {
         rc = domain_shutdown(d, SHUTDOWN_suspend);
@@ -364,6 +367,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( host_suspend )
+        host_system_suspend(d);
+
     return rc;
 }
 
-- 
2.53.0


