Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F51C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:09:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393422.1632225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwD0Y-0003bP-N6; Tue, 18 Aug 2026 06:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393422.1632225; Tue, 18 Aug 2026 06:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwD0Y-0003bI-JN; Tue, 18 Aug 2026 06:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1393422;
 Tue, 18 Aug 2026 06:09:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwD0X-0003bC-Fl
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:09:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwD0W-007qFP-PI
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:09:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a83f6ee-bab6-0a2a0a5309dd-0a2a450b95ec-40
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:09:08 +0200
Received: from [40.107.200.53]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a83f702-b7e8-0a2a450b0019-286bc83534ad-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:09:08 +0200
Received: from SJ0PR13CA0146.namprd13.prod.outlook.com (2603:10b6:a03:2c6::31)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 06:09:02 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::cd) by SJ0PR13CA0146.outlook.office365.com
 (2603:10b6:a03:2c6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 06:09:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 06:09:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 01:08:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 01:08:15 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 01:08:14 -0500
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
 b=JmLLfrqz4A1i6NWktH1nDD24T5jyXRX/0lz++52f1PHiM3h1/4eZK0AM8Qwp11mLYnLAOd6I1Nku/8aY8GDh75KWa4/Y4nSldnqSmno9F6Y6AgK5vMxjyOXbXBZU1SUPtI04yh1xgi4C6PPDYKGvpjWaeszpa7xqoYxOt1LLrc64r3YMRdpcHeUGXGRDldI0CYFmV2N3Id1T/3lkkpLma+/nnR6on5zHT/u93/HBMBKIOj1OiG9GSBdRxpaCeKSa3g0E0S+DC3hmBhTxIdh0f3dFJKhfa9t07YmeDuaFXaNaxbnJN/HXZZRFMrLls0yjPn+WJWQGYiAQE6riDFDudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGcbDcYXfhuE0JJ4fFBtDFcKBGtAJuzfkmjZyxbaVCg=;
 b=acprK7vIJaYynTOUTdOnWGAAzirEGeV6VBzNiptt7FqCYzYEQyx1c90l3isRAvtD5eSo9+hPDBpOnVTkyztnnmYvGebsjJblCxKfLb/YGvAzpAQxLSlcbxwrj1FpaSYP/m9AdrFIvDlJexuu/ZsFa5s5TmUb91h0rq0HwwODckLfn7jT0PPMAhKWXwA8nqP6WaIidsmZ/q9gRIz2wGAz/O6Utl009sC7a55XO6w3yeYoujjUuWQ10fgKOq24PGZBivY0JsrybHTuDVW1ThBnly9v2HX9qQsRaouICzzsmL7ljAPl5SGpdsnufUJxDxC7VoBh3dlxJk2N80IL+Yq6dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGcbDcYXfhuE0JJ4fFBtDFcKBGtAJuzfkmjZyxbaVCg=;
 b=A0zwaqr8Jy8/Z8OyKLkpBOC1Iz/xdABX+ZD6qURhOcr0SJDnvygqQ8Sbm3OEf1J7obCKIq3HGD/lDpcc30YP6VuEKYgpHom3PbPfhFWdFenH4Jy1sJFb7IEV1nxal0VzCP6WMYKZawo4x6n0SD7rffhA/gvkYMOdt1GPex8CNaM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b0d66de4-61bc-4c4f-9fbc-57c2a6d1a192@amd.com>
Date: Tue, 18 Aug 2026 08:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Clean up vgic_v2_setup_hw()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
References: <20260817203359.1881963-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260817203359.1881963-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: e60d1b15-df6c-4069-b560-08defcef33b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	oBjW+zmwtQ5/jVx/v/Fy3jm0RTwyJrJmgkllv+IeQedaw261VkEgdetq7l5K/2Gff2TUlNg1iVRAB/N4Mtlcbo/G4KPycKchCJaH4qUl09EwdkQMIyBFEGknxokUIhu/FG9GDvxCRbtMsHCVrjAdW10erH2dHSMvXxGgu3Xm9vqyNiUpwqOt/UHQxWAmFAr4dT9x4+yknBeMtjgK5n5UXCBo2+3pSI2onGqfh8lYGcwNHPUyYVJHfvTETiIfOKwF+sto54IYD/l4iomtEmgiBfbqx16AzZsaLgeyhMT+6paXmirTqpQ8uGWSHrDxx3uCb2pFbD9cuu2WPBIUah9HEetqeRAeBqSRGTAwWwzYQZDix0YBlPgg9I9nK5v8iyrTPTEdD05Jnnat+iQmr1Ik759dkYuU1cUUPihMo3E5PHyvZWYuKdDZN0/8e+NxBDhduU6dHoDmCfUj72yX6hYi//EsmL20DccdFKB2SitP52YQ0ONFhUROtvGUFBxmpoWSSh4ghxVZMmotYVU4f4dTeGEwwVrQ6eHDQV1Z205bU05K+XpKkFQR0S1kXVJq6vT2aC8x7oNaLuYMTsvSyTQPAErOdXwqVD3iKCQIl6PIbhkvQ8nY2tO062EC46xZwgPHRVOg7xMFFF2IBVpzJZ1yx6VloOkqgbWulDqVNBdfCukK5bY1z9xKemWcrrseGsiDnUw1+PVw5HxbVS1XbUQ3/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y7lDLYKRLl8rBx9EAHwVQ/TF723TONs0mBVkcsWaAVjVwKPP0qbBzdEwfC4tDhagZvygdbQMHGAIc64bvhXt/CRy/ycL9aqgYt8tUgLEbzsrQv0LC+GI/5wWkmcRxfWHuAvbSrg7AfpeXk6faehDyu5oG1e0CX9lIp1r8naYPG7QSIhRi9VOn/tEDRgJ3dhZs/q/t+KNhq+yQpgQfVPV8YKzH0zkj3vkAavrBKvsxKOyJh0BMgAuABvYUp4xS9wgKMi5hisOSR4EsknIHrPSzKw8zD2TjcU3exf2HzD1vunLZ8iKIA+YZB8S9Qr75Lg6Dor4+/MhMIknYvA7G8ecDSD5CeHikNEDuHCh8/yISvf1cd2C5kyEQHEoGyFkgYO4TFIzRD2a4oamOzmqLl1Nmjytr1mmw4hT42L9w8M7b+BkMdcPUaLtmKpW+YORFwQM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 06:09:02.7124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60d1b15-df6c-4069-b560-08defcef33b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
X-purgate-ID: tlsNG-42698a/1787033348-184CB9EA-423233C0/0/0
X-purgate-type: clean
X-purgate-size: 2204



On 17-Aug-26 22:33, Andrew Cooper wrote:
> vgic_v2_setup_hw()'s callers are __init, so it should be too.  vgic_v2_hw is
> written once during init and unmodified thereafter, so make it
> __ro_after_init.  Reposition 'bool enabled' to fit in the tail padding,
> removing 8 bytes from the structure.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
The patch is good but exactly the same cleanup should be done for new vGICv2's
`gic_v2_hw_data` + `vgic_v2_setup_hw()` and vGICv3's `vgic_v3_hw` +
`vgic_v3_setup_hw()`. I can do the follow-up in which case for this patch:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
or you can bundle everything in one patch. Let me know.

~Michal
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> Found when looking at the code while reviewing something else.  Only compile
> tested.
> ---
>  xen/arch/arm/vgic-v2.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 642407fd5b05..3446d521de2d 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -25,7 +25,6 @@
>  #include <asm/vreg.h>
>  
>  static struct {
> -    bool enabled;
>      /* Distributor interface address */
>      paddr_t dbase;
>      /* CPU interface address & size */
> @@ -36,10 +35,12 @@ static struct {
>  
>      /* Offset to add to get an 8kB contiguous region if GIC is aliased */
>      uint32_t aliased_offset;
> -} vgic_v2_hw;
> +    bool enabled;
> +} vgic_v2_hw __ro_after_init;
>  
> -void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
> -                      paddr_t vbase, uint32_t aliased_offset)
> +void __init vgic_v2_setup_hw(
> +    paddr_t dbase, paddr_t cbase, paddr_t csize, paddr_t vbase,
> +    uint32_t aliased_offset)
>  {
>      vgic_v2_hw.enabled = true;
>      vgic_v2_hw.dbase = dbase;
> 
> base-commit: ebc00c30c65023bd1498ae20dc511c4e39f6c0f7


