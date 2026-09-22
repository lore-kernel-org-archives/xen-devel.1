Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6628BC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:53:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428619.1651510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8y7G-00063p-6M; Tue, 22 Sep 2026 10:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428619.1651510; Tue, 22 Sep 2026 10:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8y7G-00063i-3j; Tue, 22 Sep 2026 10:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1428619;
 Tue, 22 Sep 2026 10:52:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x8y7F-00063Z-Lt
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:52:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8y7E-00G8kc-J1
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:52:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab25df0-e002-0a2a0a5209dd-0a2a45029b06-24
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:52:48 +0200
Received: from [52.101.46.19]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab25dfe-6ca4-0a2a45020019-34652e13c1a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:52:48 +0200
Received: from BYAPR21CA0023.namprd21.prod.outlook.com (2603:10b6:a03:114::33)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:52:42 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::4e) by BYAPR21CA0023.outlook.office365.com
 (2603:10b6:a03:114::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 10:52:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:52:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 05:52:40 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 05:52:39 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lORNliHhEIQHm8WgUsefxI0I894/81HMUnpr1oQEiBdSb4a51vJaD4eEEdI3xKcsXW4XHljdW3dyDN36bVlHc87cviiH3/RY/lK3zgVpO4zi8NV/i9dM/j3L9V2EPLsbO+1rc+fsNwoplZNsYUQVq0gU+V7dakuGtEetyvIeAuNsPBrS3RbDll9PgGKfAL6FBg1ASrEfIDQRSBM96PE7fAx2bVEj4CYVEDfmzh48DnMmNdLU4uMzjhTRq7UKULG0muyXK8rXCIicKpn7rM5Igmmcmcn12/mY+sp2pmJt9OKSffyfBL1ieHzXc8UycXnAf/dkR8SsJTUnhe5n5hsqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVEbYL0ZEJKb1i/fBd0sHpOSlMSuoxl5jsUjcZAjuoQ=;
 b=o4f2tKIKt7EMkQIrEX9NIl4r8KvguLAo0vmVzPQMRqJnMe8UnaV1kbbwiK3V7wX34MHQui5zkQPwVVge/SqT6bsGLYRL0u8flIjv7fTUPEG4lm7ZaL79S4oauFdGwE9p1EKbF4bqbjfFXqu3vUEdhrZqm5upAK2QRrdovV/jIfaDoBOU9HHdfOMN+/sQuUt6opg+XOUzl6W3lPkxsCWdz1E0otELY0ZScizefqJ8o2eSSTjMVQJTxCwxRws6LwC6fuUSdyFOFfOo1HuboZfwY0EJTebrZXrRaSxaI/bYNWc2y2vSx5yz8GmrCW/EgS5qFERTFg1gQuV7g82BXBq6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVEbYL0ZEJKb1i/fBd0sHpOSlMSuoxl5jsUjcZAjuoQ=;
 b=wG36g6flGu/w0w4fEwKL0t8SXJvHuLiM8Xq5ycQ4WIhuKTzwQPYcOUtMyJIl6HHnSm/QJ5by6AYMeBVydzyjqWWZPLLg6Yj3hdeX09U/duy9maJVL51Jul7O66VPmBjD1f1xiTQy9yFuyhcby8fV2yjPBBGmBG3VsfWoMWL9iPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <fb346f19-9deb-4398-8e71-62e243d53453@amd.com>
Date: Tue, 22 Sep 2026 12:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: drop ENFORCE_UNIQUE_SYMBOLS=y workaround again
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <cfcb65ff-1189-40d7-8880-6015bfccedbd@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <cfcb65ff-1189-40d7-8880-6015bfccedbd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 50798adc-7d88-487b-4489-08df1897a03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JlzYl7SCjZZg9e4dDuydbZfXMzvzDeW0rgTOhZ3J6lvFBorfEyWuf08x6EQqPMmsHg6kZDZEB+Jo4WXZEqGXYIRn8YGm1dYG/OzMBgw7p9E9AuEC/mBHtrbswq3oXEWBehj8jaRD4V9qO4g78Ol26SVyc6wlNNiIUQ97SriE6hv4giVaOVE1xoYuTzXc/NkBZQBUDMG4A7L0Bg4X0nEzL8lRE8SJe4bmtrlLEjIUgemLViqy4Q6RSGXnQP9bCN2Dnd7Xsy6mlvfsoTlCUiWcROZn7ejF2RFdUNcWvQXiVi+pkzXy1VIUmaYdmpIAeaR06zq8L+FQhjQZhpnJXxh6MbXNNHECoPJlFnnzoTH/+AoqAimZCsofZipkK52VhKBxdfIuKm3UbV1GLXAZFOlerKAyOWOUgCpOPHbYlnDwf6FBsTFQZee+FqwR+407PXo9cIn+LOfUxo0hVC6hiPsFi8q3NuhYuPfb1I/fUm+In7UNdkMtkgdkX9858v+Ba2y3nMQq8sb3JPbtOmnzZVi4ga4jZiAQ653q6KEz0N0yV17Br2r5Zxll+Zs2rGZUov+WFeomgPFX2okt4FlN96PpAOH8lrsPDeVJkSDvL5FulS9llm5aQExYhvMoZWPdk5rRwjY7LcQVzlez8iVOf53yf9sgI/mLKuDZBja6Mw5RvnfVq3WAyyGjRh+Z1OqfjXogQEwDXDcmWknPvXAxY3+VhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sg1CQeaVlUTmNNpX00/ZvyYIWwOvx1TuBagYl6zex/0Lbv5HWhhQRI+k2uXLNWFa1fJnzIb4hSX2IYOS7XVrTVbuXtjZR6NuRBRj1CDCXS+elswFnr46oUJYW5bgIAMZAs5Yp54MEyiJWb25vh0Wm5Wu163lwYCsaKJP01EEHB48w0Uxs23KAOODjvW1goxzpfRG02C7TMsG60RrKBILIYwGqdmfoEylS62QmXI+sHbVytKDx8SLyKsfwsAVOcIISjUiHVlkTTFZpIc32RT8qV2MuEDeZn+H3SyztCse4pZlCYCjBi+oHFsN005ORRUyVJuxb81LglifuOO+nYZ3+d8ehjxwNZM5dO1+LSX3oARgIk419uXWcPy3Bo7dlhfAO3cg1BN3NNWvovLe3/IC06xGuNEoihuUp7X3CQBhaF5kwQW4789npzkCGErKmLAg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:52:41.5932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50798adc-7d88-487b-4489-08df1897a03b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013
X-purgate-ID: tlsNG-720697/1790074368-F3ABD2AC-3AE93D97/0/0
X-purgate-type: clean
X-purgate-size: 2550



On 22-Sep-26 12:41, Jan Beulich wrote:
> Both arm<NN>/head.S and arm<NN>/mmu/head.S have a local symbol "fail".
> Without a .file directive locals will be associated with the path-less
> object filename (head.o). Hence the two symbol names collide. Add .file,
> also in arm<NN>/mpu/head.S for consistency.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Likely other .S files should also gain .file, but for now that's largely
> cosmetic and hence is left out.
> 
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -91,9 +91,6 @@ include scripts/Makefile.link
>  # Suppress orphan section checking for the time being.
>  orphan-handling-y :=
>  
> -# Downgrade duplicate symbol errors to warnings for the time being.
> -syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --warn-dup
> -
>  .PHONY: include
>  include:
>  
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -17,6 +17,8 @@
>   * GNU General Public License for more details.
>   */
>  
> +        .file __FILE__
> +
>  #include <asm/page.h>
>  #include <asm/early_printk.h>
>  
> --- a/xen/arch/arm/arm32/mmu/head.S
> +++ b/xen/arch/arm/arm32/mmu/head.S
> @@ -5,6 +5,8 @@
>   * Arm32 MMU specific start-of-day code.
>   */
>  
> +        .file __FILE__
> +
>  #include <asm/page.h>
>  #include <asm/early_printk.h>
>  
> --- a/xen/arch/arm/arm32/mpu/head.S
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -3,6 +3,8 @@
>   * Start-of-day code for an Armv8-R-AArch32 MPU system.
>   */
>  
> +        .file __FILE__
The MPU files are indented with 4 spaces, so please use 4 spaces here and ...

> +
>  #include <asm/arm32/macros.h>
>  #include <asm/arm32/sysregs.h>
>  #include <asm/cpregs.h>
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -20,6 +20,8 @@
>   * GNU General Public License for more details.
>   */
>  
> +        .file __FILE__
> +
>  #include <asm/page.h>
>  #include <asm/early_printk.h>
>  
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -5,6 +5,8 @@
>   * Arm64 MMU specific start-of-day code.
>   */
>  
> +        .file __FILE__
> +
>  #include <asm/page.h>
>  #include <asm/early_printk.h>
>  
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -3,6 +3,8 @@
>   * Start-of-day code for an Armv8-R MPU system.
>   */
>  
> +        .file __FILE__
... and here.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


