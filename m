Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58BC60A2600
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=fb7T5v8L
Received: from list by lists.xenproject.org with outflank-mailman.1480649.1684415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeUc-0001MM-3d; Tue, 10 Nov 2026 05:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480649.1684415; Tue, 10 Nov 2026 05:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeUb-0001MB-V7; Tue, 10 Nov 2026 05:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1480649;
 Tue, 10 Nov 2026 05:34:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xQeUZ-0001M5-HB
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 05:34:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQeUY-004jDx-FQ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 06:33:58 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6af2acae-e002-0a2a0a5209dd-0a2a45088a08-32
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:33:57 +0100
Received: from [40.107.74.121]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6af2acc2-f659-0a2a45080019-286b4a79e5fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:33:56 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by OSZP286MB1798.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:33:51 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:33:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6BFL9v8XpJu8lYOqPS7QCGCzYdONAJo14L6p3TV/otzCo0K4iAeF30hCTofkswJAxsmbh6ybIl1Q2Ia2oym3GN9vVLskk1HYY2gh4Y6NC5iVM0+akR3H1xUALvJTiQydEv51rM1+tC7jlFbzgT2yZtAe5CCqcYe0K6ySnNoQmZdJkUvUEVv+HClg8YS4fillMJIfd6xNVQ51Hz0k26AkXP9co07WR/Bz16P2lggIm+Jx0szSsw20+HczAy8WmOj5I3ATcc/IQYYLH8mM9yfzNB4uv1PSbWV76gNVl1AH7sXM+7BhFZbbEe+hIGeIg6NofP7LDhXuL229v3jbl519A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZk5IpXnS8h5R2T4rluIKw2GVXyWFI3Zhl3+ooVncXw=;
 b=HsmU4hjDj0xHMtXuUt9n4iZnZRXyCSVuxxUTRw3+c2m9uq02Swd8u6AGC3ab/g5ADWbu4TI4k10mJLCLsOjAVv/8sUxYqENR1nQcrKcCVyc675yu9tuJbN2ZG+q5nwdJ70lIjFOmdQ7sOwTZkzvpsZoeZd2q108sBWn1GRqkRc1fgImu+ueWY0KEx5w3jDDVIqNgk6DzT+bkBDsPUt6d5GViWawEYnXrJBRZVKaW1mnIHSsMOWAq+TTQrbW+u5jc0RrOcIjrUzM5ptdOPuQX3bR+RUXwZoBtdyyDLvk7rX14yqTiikM0dCQi6GfWrLNtWrfXenJdr/0j397Vqc8l2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZk5IpXnS8h5R2T4rluIKw2GVXyWFI3Zhl3+ooVncXw=;
 b=fb7T5v8Ldo8RpPsGHAIBV5EYfmgK+g1rKjcIdq8YKcTGMlSy0wVUMq96gfVOX6X3pf10R19elQCUtvaWYitQc9LxZoq6ocL6EQEk3VJIRbyMtKW1E4zUuBGjL4jE9xN9raShWDcYR+Q9oZJ9vNRLsfzMnZME3R0bkr133usjwm8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Tue, 10 Nov 2026 14:29:11 +0900
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Leonid Komarianskyi <leonid_komarianskyi@epam.com>, Daisuke Nishimura
	<nishimura@valinux.co.jp>
Subject: [PATCH 0/2] xen/arm: report the correct number of PMU counters to
 guests
Message-ID: <20261110140828.00001529@valinux.co.jp>
Organization: VA Linux Systems Japan K.K.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|OSZP286MB1798:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d427c6-12c7-4cd4-34ec-08df3eec33ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261028144727099003|261022075727099003|261026140227099003|56012099006|261026121527099003|261102123227099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mfeDWGhvSawBL4UDzQ5kDzflsqcwVtfcahmtYWZCCd/KTbj6iOXjXFGjeD+qvfhKYgdhkTV/GdkVSgxb8HUziI5sLto57vea+Rr04r7bf7PARZmW4cFzEwYzDhedQKZNoXln0LkwNCZMAQxOV9UAORpAsWyBg9yJW3jd6+7Pd4aCVyXvUqopbhiZXJKNm7zEV+VFOJojmUtxVaX2oNHWMhmNiYHSwJ9UrDv+/yoBnZRXl9ATx/p/ltpvyDesks1KCtFHHF8DgbbDd57wWX6/jB1OI7tj72PupRHh+NeVRryLv7ibo65oVJPJl65N7HNf8r5kWhV7IUE8nWIRH8SjrsIRP7fVx/y8d72tcY/2/YNANTnckIVETtf+r1jIhzxs3/hSUC16QMZWr+bLFOEUWjKWUcXPJK6fkHkELwIcbH/jFs7096Z37tuDgI5BzXvLGbUmZYjJMRfnxrA7ta6gvHoE6dVl9asxRyxgutpVDNF34OsZx5dhb+8KjPSYzo7QiWiAnx94a/mPDRsPJ0O3XnQCyLfA3PQXMVSOoAhJAheOCZGUyvNbov5HrqNGTD+haRVChAPEmCt+CeVOSMFspXsoDfLI6D974n09QuU0SK+rDMJs8dLq5ZYkfw575puPIK0bB50pp/A2JbfsBY2bmARAAjeALVfGOPlesffLrQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(56012099006)(261026121527099003)(261102123227099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YF6OMfpUqagZTHHnfUEyTeo65yLsvVHCnLbMRxuEtwqRlPblMg0thQ7UJQj5?=
 =?us-ascii?Q?nr/n8xuBu8suux54SYosfZwS4qFNbSNsDbqiK5rKLd/AUH8CAxiDgCUZQ8pZ?=
 =?us-ascii?Q?reqgIIDt9bHKG8OKJAH5M3ZmlfpbA783KRn/uWoo/Uw+VpTJjY162JHfaWJV?=
 =?us-ascii?Q?qzrWSFnZLbca0h1/lRGcon6brtfGnaaSlicSJvtvC+MrdPlXhj/kQgx5QPZG?=
 =?us-ascii?Q?JeoId1R6HJ5yZq9nQ3S8TgL9GzBHF7KNr283aReaWET+cibO4DQb6Nb//1st?=
 =?us-ascii?Q?7xenWbhlofThhVrWbBYoCDp0/oUNJs+Py8cT4HBA9fN5MPDNob1666vJ1LZ/?=
 =?us-ascii?Q?5B3MeRWny9OmluWnhg8WSGMYBmkIfiIycj11E5FTPTV2j6R6fof0P3Md//LV?=
 =?us-ascii?Q?axD55VGaYzxueO9x/5QUjdnct4PidsN3VgyRGJgNizIQmeRS/jP3ZMq9ZmW2?=
 =?us-ascii?Q?yLPp4XmjT+poLJcfYOzLQRkWzmkGy0EnckHoeyL1UCj78q/eW9eoMqlM1vQA?=
 =?us-ascii?Q?pZFOZ8QiNRyOyIxQZqKGjlRdWPCeSkm6iod7gjTA3C0qIZm9QeaeFD3SorCx?=
 =?us-ascii?Q?nGxUw+TY0fuMv5fkr8S0cXg6ozl0JOwmwqYwtFS9mcnMivEPJjNezQradvwj?=
 =?us-ascii?Q?RFALvsKOz0gCZZSqvc9uJ+mSC4pMU27Xw/YKWS6fLZaOQJBU1iNHtFLBDb3d?=
 =?us-ascii?Q?GK9vR8vfdQYW/uQ2WTshmiMVxEqIH8FAmjedojyRa9F7Dzl7k8froboIBC8l?=
 =?us-ascii?Q?Qn2l9Pk8SVR5Qo9t8URWLfWHWaL4gKikeC9XMcjRtiuSfi8SlV+j6MSXxucN?=
 =?us-ascii?Q?g1JhzXv6riEzSvW43b37lW3clgPPKlr0XXYouacCUFsmn2Mpkxr7ofTxCEAY?=
 =?us-ascii?Q?kvoQSfLJKGO8DKFdJxgnmg1NDUjve2c8FaWqnmxLa+ImBhPJlHEFloBrpWKR?=
 =?us-ascii?Q?IwlPfqdQAAL0o5is8NbG6vHBoCRVB5K85LbTwrXHwbhw/mXMOh4K0MmqmiYp?=
 =?us-ascii?Q?0VebFgCqwyiuE5F9iFfwUDCVL+ogFP7MZyUEB4dYspMUM9dyLmTxMTwwN1XH?=
 =?us-ascii?Q?zmWB3L/Dd8o2E99hB2z4ZleXwmW3TsElpwz9JEz/irapFvhm2gutsw5xCPCl?=
 =?us-ascii?Q?tAYz0ok7waet2w2FxEKccsw7Z2fNkCKPVE6LJPBViIdWcTBEHndUmZL3U9rG?=
 =?us-ascii?Q?D4eRd1G4sZ0EXavi6QXK/F8iUhmQCZnqakjneGpmN9P+r3kuB/hutRBnmbEp?=
 =?us-ascii?Q?KojOLdKKF1mEXpVfwz0GhLtD3u6dXeRg27XB9dNgAeA0cXoaJFotOd6qlAbE?=
 =?us-ascii?Q?aBgcLOVJnlNTKVyX9Bh6Da72Ga+cQWwIiWr0wyTLt5BkIqFlQbrYiUhZ5mJz?=
 =?us-ascii?Q?o7aTCD4ZNm73CkCQlOdhu68F9rmPV/Uz6Voc5lc07xZRbnPCWrgUyKaPWBo6?=
 =?us-ascii?Q?MYrd0Aw9o7oExIayIHj6Ze7BJ5Sq/f6CYp0XU2cRGOZrj4hWwYM98M9cUF3Q?=
 =?us-ascii?Q?3O1WrcG/XInevxvueukdkNeKvnvW7ASAFmDXBWtOXCe+lN338B1/pGQPRQ6+?=
 =?us-ascii?Q?QOwOFDjIG6sZzgHBrcuXFFt9Oe7n4AD25si8lZELjEr7W76FmWeo6pbHYHaX?=
 =?us-ascii?Q?QrRsPM/2uQf+wQoBxT1hg31ISzj4eo5d0+ILtCzoQvx3lnAj6xDZcrVcUAXc?=
 =?us-ascii?Q?JPFJH0Y5C8AjePmJRCB1bt0H3mJqFMjKGowTKMcgzBT/3USsvzcjaLOk0n0l?=
 =?us-ascii?Q?vt3GCdUt5g=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d427c6-12c7-4cd4-34ec-08df3eec33ef
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:33:51.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suESKjn2ASJAoJhGS0VOMMOQM8AMj/qYhVmyndU4we77WlbILpvkKIW1JBUd1tSvTVoXuhSzzIzBemVA29IsPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1798
X-purgate-ID: tlsNG-c1860d/1794288837-CED4087B-49787837/0/0
X-purgate-type: clean
X-purgate-size: 2448
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the vPMU feature is enabled for a domain, guests running at EL0/EL1
read PMCR_EL0.N to discover the number of available PMU counters. Per
the Arm Architecture Registers, such reads return the value of
MDCR_EL2.HPMN, not the hardware-implemented count.

Xen currently never initializes HPMN, so it stays 0 and guests see no
usable counters even when vPMU is enabled. This series fills HPMN in
with the number of implemented counters so guests can use them.

Patch 1 adds the infrastructure: it reads PMCR_EL0.N once on the boot
CPU and once on each secondary CPU during bring-up, keeping the minimum
in 'system_pmu_num_cntrs'. The minimum is used because on heterogeneous
systems (e.g. big.LITTLE) the counter count may differ between cores,
and a vCPU may migrate to any of them. The update happens in
update_system_features(), which runs only for CPUs that stay online, so
cores parked during heterogeneous bring-up are excluded. To make the
code usable from common arm code, the PMCR_EL0.N field definitions are
moved to asm/processor.h and a PMCR_EL0 -> PMCR alias is provided for
arm32 builds, where READ_SYSREG() resolves to the AArch32 PMCR
coprocessor encoding.

Patch 2 then sets MDCR_EL2.HPMN from that value for vPMU domains. This
is a rework of a downstream patch by Leonid Komarianskyi (authorship
and Signed-off-by kept): instead of reading PMCR_EL0 in
arch_vcpu_create(), which would sample the CPU where the domain is
created rather than the CPUs the vCPU may run on, it uses the
system-wide minimum collected at boot. It is also adapted to the
upstream change b836ef686e ("xen/arm: Hide PMU registers from the
guest, when the vPMU feature is disabled"), which moved this code under
is_vpmu_domain().

Build-tested for arm32 and arm64 (x86 is unaffected: all touched code
lives under xen/arch/arm/).

Daisuke Nishimura (1):
  xen/arm: Track the minimum number of PMU counters across CPUs

Leonid Komarianskyi (1):
  xen/domain: Save PMU counters to mdcr_el2

 xen/arch/arm/arm64/cpufeature.c       |  6 ++++++
 xen/arch/arm/cpufeature.c             | 21 +++++++++++++++++++++
 xen/arch/arm/domain.c                 |  2 ++
 xen/arch/arm/include/asm/cpregs.h     |  1 +
 xen/arch/arm/include/asm/cpufeature.h |  7 ++++++-
 xen/arch/arm/include/asm/processor.h  |  4 ++++
 xen/arch/arm/setup.c                  |  1 +
 7 files changed, 41 insertions(+), 1 deletion(-)

--
2.43.0

