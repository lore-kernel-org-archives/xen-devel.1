Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7824EC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400691.1636332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9n-0007XI-0k; Thu, 27 Aug 2026 14:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400691.1636332; Thu, 27 Aug 2026 14:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9m-0007X4-Pc; Thu, 27 Aug 2026 14:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1400691;
 Thu, 27 Aug 2026 14:32:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9l-0007PG-2m
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9k-009cUS-Ff
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a78-bab6-0a2a0a5309dd-0a2a450ca9d8-42
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:40 +0200
Received: from [52.101.69.140]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a88-f479-0a2a450c0019-3465458c71ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:40 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:37 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4hWQZJI9E/semZdqJCS6Y7/wrCOTSBnselnXjentGxliv2RNbGjIB24AYMMwYhb1GK4YglkbCEjGiMAoAcfsFJpYtruW5GKXcZGM3VYH+vBJawIBQ4/E2nHFICiLPdCd07Z6Guq2TA9Jahpd4TrszJQKX/bx2wrEpqUBzD2CuAdK/opB+eRtfjmftavZJE31uDwch+wI72JuRINqfv3V6MI0ZAjjj2DVC5h2Yx7e9VaUtY2Y1QHGp6mn/YTCEv1NLmEgDq84NdWGAxCJV87KbmfH2ehF+hxg28mdkbNHogMrU9EOhZrC8fiBMeFI8elDGxDzBw0d3mYGEsMtndDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEekLP9yfwz9eetZjI7ftgzci+TVLnfA4bJRa7yah/w=;
 b=YNBCiYlDvUrXZwO0tmcxO48UPsaWs72q65iH4xOebAWrW6kSK2RJI2fOF8xhQf+lC4klCAzAk3qtMWhtXuFDe2fHNVYxQMRjVmTgOQZB9Wta3YdPQLNAgxPYouDIpjo8ptFlHXoU5TR1JpmgZ1oxdxB8VioyTv6dWVpwWnYv3gWwFXpqMsAhS/inX1IwOCgicfOzcSP2d3KK8ovkKAUs30QihlStYdKGRmWVU8wsVJfOudeQjJ9m1QOb5Mx8kEjivcN/1xLVijqM4XaMsiwpw5K8zF57eFFjLpIUiuGSi8fOnTLAZl1rcMLCy3wNhb26sfrimAc5qk79isvHB/sKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEekLP9yfwz9eetZjI7ftgzci+TVLnfA4bJRa7yah/w=;
 b=c1D5C9mkgtoPHMLfnvb8SqifATUzhoLjIZmLRKJ9y5tpJoyVaT51uIMe8qZdMaSV9lzjqOvBwtyXtv07heF7squPTsBu6FmM9TmxHeRp6EBX6zfQr+7uR3B8sRXmdi2adme43cRst1xRWRAO2+bHi6fzWSac+JbY9KUqHPHuEzG4rylDnTIeUB97tN2jfZL4yatEvmLKuyRHSIpLbbfiMOAGLh8fgjB04l9rLYxDTEEalRY908kFZA/7TH0SktSugvGlMlkLP87pESPDMVYLCIvLVGFVJ4ZYJ0A+MD/v/aLsQxDsYRZKHwHqfViuX3BxP4Om2B/1FnbuNae5zsaS0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Rahul Singh <rahul.singh@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v12 12/13] xen/arm: Add vPSCI SYSTEM_SUSPEND policy
Date: Thu, 27 Aug 2026 17:32:00 +0300
Message-ID: <1d4cee919353f883f6be9c9de4f317432d61206e.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 330f1a98-4c1c-42da-21e1-08df04480a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zXolfGEyODushOIkfTEjovkeeZCzfUI1yWegjoShm3M7m3y+C+2ZGlx/QX2gE65k5kq4lSIlvptW6dhYGj7JdpOOpl24P4/U6U8vvUFFWO62lXeCw4vUJEx+69jguQ4Xmt4lbAozakoZ9tWJ1uJDpyN/BajRLbr8Lhks3jORLe80fmB5EecU52G7XK1NcYEoUXpDosOshZbLQ1FSBsvzgZKPNomRNDRLu3ZaIXJC8l82fKvfqe+RzMUQx2E6MEpAkCTodVLJfh4Y3Zb5q29ZMD0mqEf/hEQNWdqnSGGQ0xl8VrCRJZ7oCe+25exrVtdEGIm5CKcZNOklcph/wQ1IO4GXVUIJa5uqvIrhRqEDDvyFbUf5WjAW4aoTEzeEHv4A9PRVmdHkRwmP8lJlZUe6E4yO5wFKRGFjGMv3RymEL/aL0/hIJF5OPOr/Fl7TCIkmeBxbwd/2hFfWxTigdoxnGjhUK+oLJ4lkIy/SAi9QUf+m0NNMz7DeGQnU3YPcM7UAik5klp6gJGLxECx4+3dLmlmC3J2NNKsxVW/MYphTAvbOlcyH1KpX6K9crgWONlMukoVn/UfVsOdvHFGO9PFHzv0c950FO6ShhhUKAUocKNQuqppaV/o2kHeaqtNRKNp0BrIyeDjrdHG/8jycsQJYC8NEVJEjXDssdu+sjheGsO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?klIMHZZ5l34wicensofTSHrkWOZzIZcR/uNwFj6mZ+dnC1iZMYt+IN6kL3UI?=
 =?us-ascii?Q?m79f7CoyKRCopDOWxrJ/mIbqy8t7LowYfp3fLvx/6XijIMOIApJBi+XqUQqK?=
 =?us-ascii?Q?uUpw+wzS9VgjzE0hUAFg2NgtjtbNnNYOlNMHtNVR8mHo3iENhns38aDWmEk2?=
 =?us-ascii?Q?uVY8g4BQ+4GkYNYLTeqzJpuM746xxdFnxHqPwfShZHq/zLY9BVIenWg1G5W9?=
 =?us-ascii?Q?w6uDz2zNedVeuUATnkxuSb0NNZLu/QlxSJQ6Mx7DLSMSimIvh9QSXyJGr2PG?=
 =?us-ascii?Q?rbgPnHDhwvgyABycYLaB8hm+olcGnAD7X/TLdbANwKBOO9Daps3b49u2fU6J?=
 =?us-ascii?Q?lijL/hbZq/iSXIigrtsmyQXHTjZ9Upahl2xPmXU+EGNUrPsP4LNezbLkgAVv?=
 =?us-ascii?Q?beBeS7YwNnDrqdOVqs6/LlxBNLAOswXD//32WrrPDBhwaFLzBNNELnbyb2x3?=
 =?us-ascii?Q?DgEGWkvAoBYx0HdlxfWSs1iEmpHuAU4d2AEq2ym9Do5hpdLK+L0p/xwyoO1n?=
 =?us-ascii?Q?WgXYc27iUFGLH15ozSWC07EIpqdxOCSHOkHByXvdoYmyAwtqQsSakO0RK3j5?=
 =?us-ascii?Q?jkocECyhA1Y3L+7xYmyLY9ST427AavsQIeT1nSI9IEUDF0e9yCTzaJwwO159?=
 =?us-ascii?Q?XBA4zTbgbOxYaZmmHXLcwNZjmjOhwbPbuAs+QwoY7tOjr0hlVQVzbVWR6B4L?=
 =?us-ascii?Q?u/Ek2Lk2XibchkaoM4tDwk0plGHh4e0GG2PH4WaxA7fflU1/3/HdNiQPS6Zn?=
 =?us-ascii?Q?3dICgNuhfmAw0tu1Qux6QTSEzyBERvw8rRA0FM+a4cP10l5ap7i3S27vzDmf?=
 =?us-ascii?Q?EKKDRJnrUhdObvAYVG3fnlwrD1h83EYkpmftOY4uvr7KugfDE3MSuADn5m+D?=
 =?us-ascii?Q?x999HobyBoYAjmMS6i3bzPunvCFmk5LrhtqFaLmB0JeOI0TnV9C92+kKnA3e?=
 =?us-ascii?Q?j86QYoGf2HXt3YmI3At+ouPSZy90xzW8oSWw+1Z4whFBG8FNUGGsHDaSm3bu?=
 =?us-ascii?Q?9QWTDUYjH1yisQZfmPuPWre1NHh/9b3R1i3dn1/wsFFvWPTkG4K/w1yq8VMG?=
 =?us-ascii?Q?zllgw/nnRshiFn0tF3h1FUdSnlbTnidtN3a6gTSws80H+jc15jcM3kXibcJ+?=
 =?us-ascii?Q?YpepwYv4Es/4O46v9oESGXpAPw1jEel3EPpGb7ZSopOSymxNo+w65zp6R72f?=
 =?us-ascii?Q?jcklvf/6ks0a6wvkcboJfHdZPspqUvol9KK9jalJRSOrQUiguE9tvk7S+/wT?=
 =?us-ascii?Q?r21KGUz+f5g+eLBRRn34TXu+LgAP55Qb8BPGUt/RQG6OdEpj9+JA22v2zLFD?=
 =?us-ascii?Q?lkV6VVPxlMF37vhmzau0tXDAgj5wRPsSDejS4+1cdhuLUAUCFQinPpJjyiPy?=
 =?us-ascii?Q?sEq4z79+aoVA8HokgJRA0EsEg2IQPJSUEZa0TVRx28NMVyhw488oBFxnEZSd?=
 =?us-ascii?Q?eaY1HTdurCaBHQoKoxNoyDBi+KRUZl/UrxxyLet5+9FkvigdzlPLAph3yTKL?=
 =?us-ascii?Q?SIZvFj4toAWsV9EPWrYNN6qbDmpaYD3KocV9NUQwXtW7Y90uRZjZpxrAXVbx?=
 =?us-ascii?Q?1Y5m2e9lyUQWPSTeK/K2q6UIbKqq2CrYQfbDYjaZHcIuaKU61gOmZgvo6jmZ?=
 =?us-ascii?Q?gXTlteWQQ2A8TUgqOrvE0b5mH0UeuXm2d0QQFJmazR7RSrJ3HFvPn0lVdbP6?=
 =?us-ascii?Q?phKWXRBiP9bdx7kNWLryCaCXoK+4/AHg0FtJnniUoM5MP1s3Fd6t1J2m7Lbi?=
 =?us-ascii?Q?bqsJj4UZQQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330f1a98-4c1c-42da-21e1-08df04480a96
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:37.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjyzeBbecy5cxHJGW7D1+ZLOoBJGw+vbVhDiKVdlpJODya5JDSOIIje+jbl0KaSdiL6PfoqCx8g0X5RVglON9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-d25034/1787841160-03CD3A5B-79120085/0/0
X-purgate-type: clean
X-purgate-size: 18344

Introduce CONFIG_HAS_HWDOM_SYSTEM_SUSPEND as an architecture-selected
capability for platforms where the hardware domain can be parked with
SHUTDOWN_suspend without calling hwdom_shutdown().

Expose PSCI SYSTEM_SUSPEND as a vPSCI operation for all domains. For
non-control domains, including the hardware domain when it is not acting
as a control domain, the call is handled as a guest/domain suspend request
and parks the domain in SHUTDOWN_suspend.

Control domains need additional sequencing because their SYSTEM_SUSPEND
request is used to coordinate host-wide suspend. A non-last awake control
domain may be parked in SHUTDOWN_suspend without requiring the host
suspend path to be available. The last awake control domain is treated as
the point where the request becomes a host-suspend request, and it may
only proceed when all non-control domains are already in SHUTDOWN_suspend
and the host suspend path is available.

Keep the control-domain sequencing and domain-readiness checks out of
PSCI_FEATURES. They are per-attempt runtime conditions rather than stable
PSCI function availability. Advertise SYSTEM_SUSPEND as implemented by
vPSCI and report attempt-time policy failures as PSCI_DENIED.

Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
so that SHUTDOWN_suspend from the hardware domain can be treated as a
domain suspend state rather than as a hardware-domain initiated host
shutdown. This does not by itself imply that host-wide suspend is
available.

Add host_system_suspend_allowed() to combine the host PSCI SYSTEM_SUSPEND
capability with runtime blockers reported by Xen-owned subsystems. Add
runtime blockers for registered serial, IOMMU, GIC and SMMUv3 MSI IRQ
paths lacking suspend/resume support. These blockers are runtime based,
so they only apply to drivers or paths that Xen actually uses on the
platform. For SMMUv3, the blocker applies only when Xen actually uses the
MSI IRQ path, since resume does not restore the SMMU *_IRQ_CFGn MSI
registers yet.

Add a struct domain forward declaration to xen/suspend.h so the generic
header can expose arch_domain_resume() without requiring a full domain.h
include.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
---
Changes in V12:
- handle missing is_shut_down, change checking to call of
  domain_shutdown_completed

Changes in V11:
- Mark host_system_suspend_runtime_allowed as __ro_after_init.
- Avoid printing the SMMUv3 MSI IRQ host suspend blocker more than once
  when multiple SMMUv3 instances use MSIs.
- Wrap the Arm IOMMU host suspend blocker in CONFIG_SYSTEM_SUSPEND to make
  its policy-only use explicit.

Changes in V10:
- Return PSCI_DENIED rather than PSCI_NOT_SUPPORTED when the last awake
  control domain cannot proceed to host suspend, keeping PSCI_FEATURES
  stable once SYSTEM_SUSPEND is advertised.
- Shorten SYSTEM_SUSPEND blocker messages and use %pd when logging the
  control domain.
- Mark serial_suspend_available as __ro_after_init.
- Mention the struct domain forward declaration added to xen/suspend.h.

Changes in V9:
- Select HAS_HWDOM_SYSTEM_SUSPEND independently from CONFIG_SYSTEM_SUSPEND
  so that hardware-domain SHUTDOWN_suspend support is not tied to
  host-wide system suspend availability.
- Add runtime host suspend blockers for Xen-owned subsystems lacking
  suspend/resume support.
- Keep vPSCI SYSTEM_SUSPEND advertised through PSCI_FEATURES and enforce
  control-domain sequencing in the call handler.
---
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/gic.c                    |   6 ++
 xen/arch/arm/include/asm/psci.h       |   3 +
 xen/arch/arm/include/asm/suspend.h    |  10 ++-
 xen/arch/arm/psci.c                   |   7 ++
 xen/arch/arm/suspend.c                |  40 +++++++++
 xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++++---
 xen/common/Kconfig                    |   3 +
 xen/common/domain.c                   |   7 +-
 xen/drivers/char/serial.c             |  12 +++
 xen/drivers/passthrough/arm/iommu.c   |   6 ++
 xen/drivers/passthrough/arm/smmu-v3.c |   9 ++
 xen/include/xen/serial.h              |   1 +
 xen/include/xen/suspend.h             |   2 +
 14 files changed, 208 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e..9027aa17eb 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_HWDOM_SYSTEM_SUSPEND if !MPU
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_STATIC_MEMORY
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ffc11f36a1..0695474432 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -26,6 +26,7 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/gic.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/acpi.h>
 
@@ -44,6 +45,11 @@ static void __init __maybe_unused build_assertions(void)
 void register_gic_ops(const struct gic_hw_operations *ops)
 {
     gic_hw_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("GIC driver lacks suspend support");
+#endif
 }
 
 static void clear_cpu_lr_mask(void)
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index bb3c73496e..142fa1bfe5 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -24,6 +24,9 @@ void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
 int call_psci_system_suspend(void);
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void);
+#endif
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index c848fc6340..50dc6e9fdf 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -39,7 +39,15 @@ extern struct resume_cpu_context resume_cpu_context;
 
 int prepare_resume_ctx(void);
 void hyp_resume(void);
-#endif /* CONFIG_SYSTEM_SUSPEND */
+bool host_system_suspend_allowed(void);
+void host_system_suspend_disable(const char *reason);
+
+#else /* !CONFIG_SYSTEM_SUSPEND */
+
+static inline bool host_system_suspend_allowed(void) { return false; }
+static inline void host_system_suspend_disable(const char *reason) {}
+
+#endif
 
 #endif /* ARM_SUSPEND_H */
 
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index e05dae1133..e9d78668fd 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -41,6 +41,13 @@ static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+bool psci_system_suspend_allowed(void)
+{
+    return has_psci_system_suspend;
+}
+#endif
+
 int call_psci_cpu_on(int cpu)
 {
     struct arm_smccc_res res;
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 6ea4a0f9cc..c7c26bcf03 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,49 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/lib.h>
+#include <xen/serial.h>
+
 struct resume_cpu_context resume_cpu_context;
 
+/*
+ * Non-PSCI infrastructure can make host suspend impossible even when the PSCI
+ * SYSTEM_SUSPEND conduit is present, e.g. when a Xen-owned driver has no valid
+ * suspend/resume path.
+ *
+ * This gate is checked only when the last awake control domain attempts to
+ * turn a guest SYSTEM_SUSPEND request into a host-suspend request.
+ */
+static bool __ro_after_init host_system_suspend_runtime_allowed = true;
+
+static bool host_serial_suspend_allowed(void)
+{
+    if ( serial_suspend_supported() )
+        return true;
+
+    printk_once(XENLOG_INFO
+                "Host SYSTEM_SUSPEND blocked: serial unsupported\n");
+
+    return false;
+}
+
+bool host_system_suspend_allowed(void)
+{
+    return psci_system_suspend_allowed() &&
+           host_serial_suspend_allowed() &&
+           host_system_suspend_runtime_allowed;
+}
+
+void host_system_suspend_disable(const char *reason)
+{
+    host_system_suspend_runtime_allowed = false;
+
+    printk(XENLOG_INFO "Host SYSTEM_SUSPEND blocked: %s\n",
+           reason ? reason : "unsupported suspend/resume path");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index ac6af6118f..a41355d75d 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -5,6 +5,7 @@
 
 #include <asm/current.h>
 #include <asm/domain.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -219,6 +220,89 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+/*
+ * Serialise SYSTEM_SUSPEND policy decisions with the domain suspend transition,
+ * so multiple control domains cannot all observe each other as still awake.
+ */
+static DEFINE_SPINLOCK(vpsci_system_suspend_lock);
+
+static bool domain_in_suspend_state(struct domain *d)
+{
+    bool suspended;
+
+    spin_lock(&d->shutdown_lock);
+    suspended = domain_shutdown_completed(d) && (d->shutdown_code == SHUTDOWN_suspend);
+    spin_unlock(&d->shutdown_lock);
+
+    return suspended;
+}
+
+static int32_t domain_psci_system_suspend_policy(struct domain *d)
+{
+    struct domain *other;
+    bool last_awake_control_domain = true;
+    bool awake_non_control_domain = false;
+
+    /* Only control domains participate in sequencing policy. */
+    if ( !is_control_domain(d) )
+        return 0;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( other )
+    {
+        bool suspended;
+
+        if ( other == d )
+            continue;
+
+        suspended = domain_in_suspend_state(other);
+        if ( suspended )
+            continue;
+
+        if ( is_control_domain(other) )
+        {
+            last_awake_control_domain = false;
+            break;
+        }
+
+        awake_non_control_domain = true;
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    /*
+     * Another control domain is still awake. This request is only the first
+     * phase of the sequencing: park this control domain and leave the host
+     * running. Host-wide suspend gates must not block this intermediate state.
+     */
+    if ( !last_awake_control_domain )
+        return 0;
+
+    /*
+     * This is the last awake control domain. It must not be parked unless the
+     * request can proceed as a host-suspend request; otherwise Xen would lose
+     * the last domain that can coordinate the system suspend.
+     */
+    if ( awake_non_control_domain )
+    {
+        printk(XENLOG_DEBUG
+               "SYSTEM_SUSPEND denied for %pd: non-control domains awake\n",
+               d);
+        return PSCI_DENIED;
+    }
+
+    /*
+     * Host-wide gates are relevant only for the last-control-domain case. They
+     * must not block parking of a non-last control domain, but they must deny
+     * the last control domain when host suspend is not currently available.
+     */
+    if ( !host_system_suspend_allowed() )
+        return PSCI_DENIED;
+
+    return 0;
+}
+
 static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 {
     int32_t rc;
@@ -232,10 +316,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
-    if ( is_hardware_domain(d) )
-        return PSCI_NOT_SUPPORTED;
-
     /* Ensure that all CPUs other than the calling one are offline */
     domain_lock(d);
     for_each_vcpu ( d, v )
@@ -252,16 +332,29 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( rc )
         return PSCI_DENIED;
 
-    rc = domain_shutdown(d, SHUTDOWN_suspend);
+    spin_lock(&vpsci_system_suspend_lock);
+
+    rc = domain_psci_system_suspend_policy(d);
+    if ( !rc )
+    {
+        rc = domain_shutdown(d, SHUTDOWN_suspend);
+        if ( rc )
+            rc = PSCI_DENIED;
+        else
+        {
+            rctx->ctxt = ctxt;
+            rctx->wake_cpu = current;
+        }
+    }
+
+    spin_unlock(&vpsci_system_suspend_lock);
+
     if ( rc )
     {
         free_vcpu_guest_context(ctxt);
-        return PSCI_DENIED;
+        return rc;
     }
 
-    rctx->ctxt = ctxt;
-    rctx->wake_cpu = current;
-
     gprintk(XENLOG_DEBUG,
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
@@ -287,10 +380,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
     case ARM_SMCCC_VERSION_FID:
-        return 0;
     case PSCI_1_0_FN32_SYSTEM_SUSPEND:
     case PSCI_1_0_FN64_SYSTEM_SUSPEND:
-        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
+        return 0;
     default:
         return PSCI_NOT_SUPPORTED;
     }
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba84..52bd98f7ad 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_HWDOM_SYSTEM_SUSPEND
+	bool
+
 config HAS_IOPORTS
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e16f1ac383..10c358c7aa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1377,6 +1377,11 @@ void __domain_crash(struct domain *d)
     domain_shutdown(d, SHUTDOWN_crash);
 }
 
+static inline bool want_hwdom_shutdown(uint8_t reason)
+{
+    return !IS_ENABLED(CONFIG_HAS_HWDOM_SYSTEM_SUSPEND) ||
+           reason != SHUTDOWN_suspend;
+}
 
 int domain_shutdown(struct domain *d, u8 reason)
 {
@@ -1393,7 +1398,7 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && want_hwdom_shutdown(reason) )
         hwdom_shutdown(reason);
 
     if ( domain_shutting_down(d) )
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index cf0abf1893..1cdf4968ac 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -490,6 +490,8 @@ const struct vuart_info *serial_vuart_info(int idx)
 
 #ifdef CONFIG_SYSTEM_SUSPEND
 
+static bool __ro_after_init serial_suspend_available = true;
+
 void serial_suspend(void)
 {
     int i;
@@ -506,6 +508,11 @@ void serial_resume(void)
             com[i].driver->resume(&com[i]);
 }
 
+bool serial_suspend_supported(void)
+{
+    return serial_suspend_available;
+}
+
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
 void __init serial_register_uart(int idx, struct uart_driver *driver,
@@ -514,6 +521,11 @@ void __init serial_register_uart(int idx, struct uart_driver *driver,
     /* Store UART-specific info. */
     com[idx].driver = driver;
     com[idx].uart   = uart;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !driver->suspend || !driver->resume )
+        serial_suspend_available = false;
+#endif
 }
 
 void __init serial_async_transmit(struct serial_port *port)
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
index 100545e23f..461e01703e 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -19,6 +19,7 @@
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/suspend.h>
 
 #include <asm/device.h>
 
@@ -46,6 +47,11 @@ void __init iommu_set_ops(const struct iommu_ops *ops)
     }
 
     iommu_ops = ops;
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( !ops->suspend || !ops->resume )
+        host_system_suspend_disable("IOMMU driver lacks suspend support");
+#endif
 }
 
 int __init iommu_hardware_setup(void)
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 7f1d00fb81..16947a12f2 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -91,6 +91,7 @@
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
+#include <asm/suspend.h>
 
 #include "smmu-v3.h"
 
@@ -1866,6 +1867,7 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 
 static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 {
+	static bool __ro_after_init host_suspend_blocked_by_msi;
 	struct msi_desc *desc;
 	int ret, nvec = ARM_SMMU_MAX_MSIS;
 	struct device *dev = smmu->dev;
@@ -1910,6 +1912,13 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 		}
 	}
 
+	if ( !host_suspend_blocked_by_msi )
+	{
+		host_suspend_blocked_by_msi = true;
+		host_system_suspend_disable(
+			"SMMUv3 MSI IRQ path is unsupported for host suspend");
+	}
+
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, arm_smmu_free_msis, dev);
 }
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 8e18445552..418b00ead0 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -137,6 +137,7 @@ const struct vuart_info* serial_vuart_info(int idx);
 /* Serial suspend/resume. */
 void serial_suspend(void);
 void serial_resume(void);
+bool serial_suspend_supported(void);
 #endif
 
 /*
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
index 6f94fd53b0..a941331035 100644
--- a/xen/include/xen/suspend.h
+++ b/xen/include/xen/suspend.h
@@ -6,6 +6,8 @@
 #if __has_include(<asm/suspend.h>)
 #include <asm/suspend.h>
 #else
+struct domain;
+
 static inline void arch_domain_resume(struct domain *d) {}
 #endif
 
-- 
2.43.0


