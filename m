Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF43606A331
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=R8mTnEw3
Received: from list by lists.xenproject.org with outflank-mailman.1488213.1690342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRweH-0001Nb-Fs; Fri, 13 Nov 2026 19:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488213.1690342; Fri, 13 Nov 2026 19:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRweH-0001NT-Cl; Fri, 13 Nov 2026 19:09:21 +0000
Received: by outflank-mailman (input) for mailman id 1488213;
 Fri, 13 Nov 2026 19:09:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xRweG-0001ND-9B
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 19:09:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRweF-004r3h-El
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 20:09:19 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6af7603e-2eae-0a2a0a5409dd-0a2a4505cc80-26
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 20:09:18 +0100
Received: from [52.101.52.48]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6af7604f-4cb1-0a2a45050019-34653430176a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 20:09:18 +0100
Received: from DSZP220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:281::9) by
 SACPR12MB803698.namprd12.prod.outlook.com (2603:10b6:806:544::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 19:03:26 +0000
Received: from BN3PEPF00022BC4.namprd05.prod.outlook.com
 (2603:10b6:5:281:cafe::71) by DSZP220CA0022.outlook.office365.com
 (2603:10b6:5:281::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Fri,
 13 Nov 2026 19:03:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC4.mail.protection.outlook.com (10.167.248.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 19:03:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 13:03:25 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 13:03:25 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 13 Nov 2026 13:03:24 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSx+GfpqEPuwgIRznerwsxCw9ExCLH+D6GTmtL0bf4hknexbvJiWSuVFVMO5II8tKun9+3Yw1KMJ5gArZgDhwg8/Dxj7LEfOO6v0ypKLgH0n8LJrgxXr/+9p3shAjIVvk0zaAB6Z8SVFo9ruMT9lpbUA0tCDbOikb59wQcLM2JcJj9dKt0wYkg/T8QSaryiUZpKPeHdEBLbtJchrdxO6yXLSBg+HB4QkvwQtr9e1GZ/8ILrMKF58df206VhxTXw1i8zw7Wehjt5fRTMkOi5uW7PlBOmFKe+nu4ZlTixAXXSSgqGkuqqiW+hVB/O5IivmtqG5GfZZb1XzIcuYALClZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByO4h4zWCC4ocExoF9eL+sE7HdbzaN04WEY0gCFRrEo=;
 b=PdIfyxXaKzCDsGVW5WIU9g531Kd3oBy9XlfLUAqH4Me/kpYBKnILlWi/UIqybQIN7+UVvvkkg0mk3/Tjx7gtV7nmgS2O/JwdFJ1Yji5iUUoCymY0VbD+V+gl9+YQGtMZh4IFPQlTZRyjVBiB8SfwfGsNfDUwIDEKvU4sHLBUfUNRGYGFFsDwfSprr5ldxJDgWBWubVLj247Ifjuh7C/w46M+XMa46/Vtc6vnipxF9J5f1/L73y0UQjBre8XKPMv7xhscHuciro2ulQ1EbgErXhXYxfB0mLTGDJ2Ez7M9GT46fXdp4qerolV9GkLJupyMvhv+YDFjUVSGSMFtvkTHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByO4h4zWCC4ocExoF9eL+sE7HdbzaN04WEY0gCFRrEo=;
 b=R8mTnEw32EOYvh31Wd0AE+x2Miz6ME6Q4jmIHlihjCUWweOlA7YvKeZRKTHl/szPtjWT2RGvJDZVQHBeiyYLx5F9rb5LL5st7uFYr9z4xYV5BN5AhKTrqC2CFTlbsIQg8PQGLYkdTAiVJP67E/phSYe88GR75tbVxXxU+FgnxNM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e914ab5b-8f00-4d41-beb1-0d868529aa02@amd.com>
Date: Fri, 13 Nov 2026 14:03:23 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC4:EE_|SACPR12MB803698:EE_
X-MS-Office365-Filtering-Correlation-Id: ff421fbb-3d84-47a4-e926-08df41b8cc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|10067099003|261026140227099003|11063799006|261021121427099003|56012099006|261022105027099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bonVfGiACo32MCQn8cQua5xg3FTcxGMVzmI1ggsyR67ucRHmof8CtFPASuT+fbOkTQgRv/422xzjxNnJYuivFz4alC8YoclEpFx/jfjafarLXO2sazEowxxZK9I+jQ6FwNTXq5WemUc9YxjkJSqf1LdXb8jllbppQwGJrSS5JZQmGDYob66GCbefR862Pvs9lPGEcEVAt4WicjXXS0STFGspxRdEM9bE8p6EUDmdX0cSDxrsWSC0F7lAVhcF5wWnszFsfVL+vHDSck5SmFYIbE0dv1Gxg0o0wSeTCfNXXamGPrIIONTRUtooM+ArdYO1hnzLiaU9l7pIvw3B0cIDgurjYcISZIIF0q9Ae+7e2OiMR70ygojOa2EJnkKJ7pZ42ceIsBmFPmv47W8tBpElzNZM4NRjyVUPclEpsVfhN94x/Qit4HCydsrIhRY9/acDb9oZVLlMIoApYyL1umOyhHpuxtDo4XJP2f4Kz5i+YqxeGVPZ9qf8qpzyp8Ts+LvZ1lXypedwRrS0KY/q30al6QEcf3dj7vHFu/MMdv9sZvheZHg8S3G8kyVDJWh+q2HdrLz8cSCjifUhVeoiA/W6NczoxXul8c+UaE6LxHhXI9fmwh/+QspOmpdftDX0xMUycVFJ6AuLbSqPT2AHdbua/DyAnp3nR+PzCnIeTQYjMJ5AZyV+hFY0fiK9UQb9etB0guTfCoj74AMzgBmITiY6+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(261026140227099003)(11063799006)(261021121427099003)(56012099006)(261022105027099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gqjcjteZO1z8WajzUxVTVE2KGlFT0zU8Eg+eaRo0X81p0gYn/NsVjFOTIYjLM9ykyabHKFSlwrzHG+apdpsll2rAqETLRBdiVXRUSrkpSKuMLxZpyKgpZOYiWq+vXuiga19UeudCNY0MM2AJDJLB7rP6b9JDblCCJmBsDi6NWhsN8+TN5pVacWx39uv2S6LIR0Kyi3wlX4AYDTghYb6MVLYqcBX22hteFBei73OCFmkhgyYZrnAa02LP2hfidUusjX7AAi0KDLLUMraLlucAzXUO+GtFr05b1ZSDpdeZD4L1b4MKWEUtCKpuq+Ujnzmb0BdkgoIqvuF2D05Oo37L2DzEtU/mZieWnAd8zNQygPFNe86MsBGuezqqVieLVPYh7RKJ+GU59RH8O+HIudHiU262K7veEpUTaRjh1/GY/nTeDiJCzD393t5ZSrWkjdJF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:03:26.1904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff421fbb-3d84-47a4-e926-08df41b8cc1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR12MB803698
X-purgate-ID: tlsNG-c201ff/1794596958-71EA92A1-6A82BC03/0/0
X-purgate-type: clean
X-purgate-size: 790
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-12 13:58, Andrew Cooper wrote:
> This appears to be an error in x86 which got copied into all other
> architectures.  .data.read_mostly is an internal detail, and none of the
> similar sections get exposed externally.
> 
> Simply place .data.read_mostly in .data.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

> 
> This is to simplfy the script checking that xen.efi's section
> attributes/alignments are correct for UEFI SecureBoot.

This is worth moving to the commit message to explain why the change is 
made.  Also "simplify".  Also, also stating the rearrangement of 
.data.page_aligned and HYPFS_PARAM is worth adding.

With that:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

