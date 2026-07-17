Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD931C44517
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:23:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364776.1615775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcun-0002uF-Bq; Fri, 17 Jul 2026 07:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364776.1615775; Fri, 17 Jul 2026 07:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcun-0002u7-7Z; Fri, 17 Jul 2026 07:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1364776;
 Fri, 17 Jul 2026 07:23:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wkcul-0002u1-UC
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:23:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcul-0086At-3z
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:23:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a59d85c-e002-0a2a0a5209dd-0a2a4509ac4a-22
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:23:18 +0200
Received: from [52.101.56.64]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a59d865-be1a-0a2a45090019-346538403f13-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:23:18 +0200
Received: from CY5PR19CA0100.namprd19.prod.outlook.com (2603:10b6:930:83::12)
 by LVUPR12MB999162.namprd12.prod.outlook.com (2603:10b6:408:3a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 07:23:14 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:83:cafe::17) by CY5PR19CA0100.outlook.office365.com
 (2603:10b6:930:83::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 07:23:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 07:23:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 02:23:13 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 17 Jul 2026 02:23:12 -0500
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
 b=ittTBPQQeiZzGb4Wa0alj1gzJs+MWiU90hFp3ijpwA5RS1YtkSkeSSmh2VHEEP5fUYd/2ouI+SmALj24VSExBuJu1a2pvhuGqtclyyGHUPn4Bly/HXy/z06nUZitXnq0jP8rEeQ/BF/imd8gs6Ml5NEiQPoZ3Xa7JvCjAVR3U1jZZPGIe5PpGSR1qFy4Jlyz4qGV5qfWpFc6dWATEToLl5E5Q6fE4JiMPHhBRbS+0gaBnK+sZu3WjioZSvXwV3jB2Gp219jLK9zNQCHdrw3XB99ObL2UPbRHeu7iEdBioCjxsIYFAlMwiAvJJ6iQdT0FXKxQAcHEnUE1TYJeoIk5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG2sZasIwCGKu2i/dou0Rx3A1ZXNa/zg9x2+F//njLE=;
 b=aaOTM6ez9KmfpTWyzuyFNU36gOzA9ip+aJGb/iFsTpiC9vhs0+w+7ywsdsWyR6B8lcHO6r4p+LB1HOhMgKL82yugB2IXtMdSWFsLDRQz6pk3Xh3X4L/bVK7EwaMLoRa2MzWtDtrRsriV1zZsBugeU9JPq8oyahDvpF0fgJyw7GpeHEQTcsoPb4ZzRvo+eUAo4TmUD6SkK2Gs2DF1QSUTxh2I5rErk9DzOEVKBD8oWKsPP2qPyZo/Y7fBvbqjY0v6FZGr5yeEz9VjQSeSqX8q5K/ECa6PpkDq1NZtX8BnhNE4mk8qqKyUGbEvcsVa/6CN5yJhxDwERXUdQz+EmcAnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG2sZasIwCGKu2i/dou0Rx3A1ZXNa/zg9x2+F//njLE=;
 b=MAzXUeLBMm6YWHbP3wykmJNndrz85/vhx0pvebyHB7s9okfhNaRNlP5oSj6F/jRn9/e1MVX1PEPJFPS/wTon8RvA9gYmqeQVBCmkv4CHLThPY/DJzt539Viuavk/1vDVDz3ln9nZpViWyKfNUIHka42vCyHCGqayKT38bG3MhXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <26721f9d-23a3-440b-a1ae-3348f2eef77a@amd.com>
Date: Fri, 17 Jul 2026 09:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Reject pseudo-domain foreign mappings in
 xenmem_add_to_physmap_one()
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder <ayankuma@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260714191655.155717-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260714191655.155717-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|LVUPR12MB999162:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb5a412-f5f1-48fb-c195-08dee3d443c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2okBDhN8A9NeKw+0I9oVAqJLIK1svo+OaYu2iT60q9WV9LuwMohfG9k6FainZNnIFlkq0C/umNQUBQJ3jEJ+anYmUzb5KQdkc3AKvEbNvmuu9eIArw03MGPi4PvGK8UeVlQOoQsuOd6ZsS1RrVptXz12IgUrKbVoHaBSCFHzO0cvIlrNxZTDZ7wv7xQRoWYFn1wbZv9n07mqdkJKc3+ZyfKgoc/RYjE1n8GIG02cwO2FgyTd2Yoj6moKDBxp0UQt3F2qFWglGIDPF8coBAm2Bz7MX2BnqpbrmSj0u7avsVURclFMNULlokLZtzPk6elS63ALyWb50lQCIOv+pgxKuhTDgUDSb5K/OkM47u3AAWW5zCw1cnbRDXC/4vxjrpkdeZH+9aTy0B3zTzFKFYeaofk4Yk9LxbaFqC+Wct0d5cq3vKagBeVnLvchtv2xJWNWtxtJ+8INbiWQObWoX+PIJ9o4rhJ6wjG8wNIIj2uLLhncnLsoM099CYY4RjVl/4Yzdi/5kxR0y+/NVLQ9MnuGepEbjtXYzwQFePLXHWXwrSBdKwNnXaOOsZCJXkq26l5L/qJcOl8Px9is/3bvwjGTG4qsjuR90PUFRhqdf1Sv+lgZFGSi2mqXxzKD1STzz5a4q7qhR+cpzA1MVHONP5iJAcnnwG4zrMuf40RIcR45LBTmT9/657nClQl1YxnS8x4TaP8E1MJFLNSFlj3uyYilLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2JZGtmVX/Bt58+aMOZI4gbZz2tzAVUzUFo687SEElJc1zJD482Lklli42AIxPFHQhAtSWx67ndOP0bgaJxFatK/bjaYqqNLbk0IUDicsX0sDyxKLA/MxCNApl1cZ8Ze6tutBfBVKydjHFnIn+TgXtS7prSa9pIhTEw6isn/BZD+a15Gb8rjbRRkzMbvC9xl28ANoI1vXEzLcI+RE21e9J4HUBv9DHNDiqc6MLPgVAh4+oTd5qluFG76HujfeZsQojslOba7XblLz44jfj+7+4L8qaIbAgoS+aTyE8Ew+fOMRMbBn5BitIXHdAGhpHa+mLeBGhLIlDGrVozJQB3C9K0M6Oc3dZTzAN3l80Vu5dX6hPIbgb+5vwJtBP4Sd7wOGgX6Fk4sAZ9ion3h/Hixzws86rWSSUQ2x2cz7x3RFwR+NCevEeqAGsTh582fQV9zO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:23:14.2057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb5a412-f5f1-48fb-c195-08dee3d443c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999162
X-purgate-ID: tlsNG-bad1c0/1784272998-FCC15034-E5BE7D3B/0/0
X-purgate-type: clean
X-purgate-size: 1290



On 14-Jul-26 21:16, Oleksandr Tyshchenko wrote:
> A privileged domain on Arm64 can trigger a data abort in the hypervisor
> by issuing memory_op's XENMEM_add_to_physmap_batch sub-op with
> space=XENMAPSPACE_gmfn_foreign, idx=0 and foreign_domid=DOMID_IO.
> 
> get_pg_owner(DOMID_IO) succeeds, returning a pointer to the dom_io
> pseudo-domain. The subsequent get_page_from_gfn(dom_io, ...) then
> attempts to walk dom_io's P2M table, which is not initialized for
> pseudo-domains, resulting in a data abort in p2m_get_entry() when
> it dereferences the invalid pointer returned by p2m_get_root_pointer().
> 
> Replace get_pg_owner() with explicit domain lookup logic matching
> the x86 implementation: handle DOMID_XEN via rcu_lock_domain(dom_xen),
> and resolve all other domain IDs via rcu_lock_remote_domain_by_id(),
> which rejects pseudo-domains (DOMID_IO, etc.) that are not present in
> the domain hash, returning -ESRCH before any P2M access occurs.
> 
> Fixes: 615897bc6c01 ("xen/arm: Allow a privileged domain to map foreign page from DOMID_XEN")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I would be ok to take this patch in for 4.22. Oleksii, other maintainers?

~Michal


