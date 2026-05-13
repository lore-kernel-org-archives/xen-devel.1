Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFB6CD4F24
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2026 11:08:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307806.1579392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7SE-0005fQ-JN; Wed, 13 May 2026 11:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307806.1579392; Wed, 13 May 2026 11:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN7SE-0005fJ-Fm; Wed, 13 May 2026 11:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1307806;
 Wed, 13 May 2026 11:08:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN7SC-0005dT-QC
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:08:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN7SC-00D0ZR-6i
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:08:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045bb2-e002-0a2a0a5209dd-0a2a450ab42c-12
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:08:39 +0200
Received: from [40.107.208.24]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a045bb6-56b3-0a2a450a0019-286bd018b843-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:08:39 +0200
Received: from BYAPR06CA0066.namprd06.prod.outlook.com (2603:10b6:a03:14b::43)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:08:29 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::2f) by BYAPR06CA0066.outlook.office365.com
 (2603:10b6:a03:14b::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Wed,
 13 May 2026 11:08:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 11:08:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 06:08:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 04:08:12 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 06:08:09 -0500
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
 b=fkLONzpW2an0jbCwCd2VPsYBsH8RGxUt/MF5OsCtts7iU00MW7TjMMxtr8F/ZXXPahGQFEZVDcc9UPZ6VxSsTkHvoTuSlplhe6HMLyuwrxFnSBZrLL41iu4PS7qVvpphnJwi36AYMQAMRa6PH0VSNyILXmdaVxx+CjhqJrMzkxsIKRB0BN+Xvh/Qqy906HOnEQEsfketXcfQkUg8JnIUOb2dvPaocCtnVTP0mHSQcmF+vA//50Tmj1ih9OpHU3qfcAO8V3WJRKGCg8NCd4h9eG5sICDL3Gw+JMKPOI1F/6mv31WW4aq3kRbGIoaDG61y8HduuVB5YLqQRdA63YQvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfVx5iqwz5K8cvw+XXqSAEbzC3Qeo5a8zfHEwXV40P0=;
 b=KLP8/8Nva880muQWnLF+WCMlWkuPMx+YnEB8CWAA3U71NCyi864Pr8rVRZnWibhDfBEYx0SKmVgT+TAC/tmLCEocry2UMqbuntlnjw3BIE97InZh9imi8bsxfwmmN0aa6rym6eflHycqyk6CdScFaO+Sx0EjVsPz9Ghz5SZrXcNpe2xvsCdIl4p5LjycwTn9SepSsz3u8bbqunXokqvxClKndY0d27r9wcMB3LvxWg7miV9OtzL4yI7yzaFRHs8/dM+qc8g+69jfUWZv9EAfLFzSAxK4o1Nl/wCSqy7qeF/uIol2RBO8AZ1pinp86Bl3Uthn0Iezwd6F+tNJTFl9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfVx5iqwz5K8cvw+XXqSAEbzC3Qeo5a8zfHEwXV40P0=;
 b=HIZKbtGgNY+/hazZsLHnOU/XlLq/FiFqW9MQdL9tP+Ns6q55OIBDcvqYa9Ebt0OZ4/0w8Hl4cUfMu7mm6GzJGjU2TZpX7Ons57x1xy3jZQso30wCLQ/2gwchQAiJ5BpBHar4SvrHP0LwcpnCtco/1Lm00FNSWms+clw0gMvYCco=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <eaa3ef64-5d2c-4da9-ba24-c488176fa331@amd.com>
Date: Wed, 13 May 2026 13:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] xen: move declaration of fw_unreserved_regions()
 to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <6e79a0cf0a718e8e8c582cc5848ce5221cd56902.1778140240.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6e79a0cf0a718e8e8c582cc5848ce5221cd56902.1778140240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 7559d8e4-e364-454d-5b99-08deb0dff67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|82310400026|376014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vVyvSvdoCGQFRCzAmW/NvIGA5yCYmgY7ER2pADIgv5XLc6LsEH3l8/PdkYzBp6T9p7PQ1vP6kC0iIy8iVVDkJzSsq0dx+JOLTPeLCqVeh4TmadVqYlK2lPq/PHFLwBRmdz9vy+d+q5FmeNNZUa9fEsoOcLs1WoV1gvHJ7WeUuJ0az5nq9WJp7sRiHGfsrm2WBTytsTmQinzZiLWcU7/Z3NR3Jesl4N3DlX5+2X8BBrX6y+2ttTeqEGaINvu+gKYH4w7RzAZeNakxzlZq2193AFDDzxZg5cQzJOR5QrmFe41btbX+9k05q+keuF1DNHtBkpP/IKX8wKYtrfUFK6Q/s9yFtG/MvvLqeQ7xNjSJWj0Z5OnVgOt6P7tOpAWuYw2miHzPnfY8TDFb3v4bHgQ/HMMBWZw+XPzGoJacL3I8w6uuw5UbaD4ShQ1AiJBuwgg9gzux6cSYagvxOYUn7I/vn/DaWP79IElUV29A4aPREDX9zY5s7Ejsz2PIaB9qXWpRRbvtGqX1kfSqHonmj5vjwQqhSE3qvF4bgnnkQl+PTrdCFsdnLd7fTIv/JwuRGPybYyJ6YpT7j4yp2cw4TQLEr/HyXzcPUbkOLnDVyLb5zH4JxAitdA26oqq/OqRjXmZF+dI2MBNBN5dt6FpTKmviZK8mZCbgRgR9YKO9MTSUFXeQ4cowgArgfDnUdHMMWB8x9NS2NYXiYX8sAp86zAXNU1SlS6ZjMwAPpiHFrG/rrEI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(82310400026)(376014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	elwesyRKCeLAGkWBQ0/lVoYOaPNEsmCxI0PZRLkeqiR8IPAIZqXYMqU+UvKmExLWj8rIonLyLVmSTWACv7Cg/X6LQ8Be6moxfX1llGRw1WaJ46hxLxUCzRvC3Ufwlh2CNqgpP7xH4US92sh73UpU+uXvZ94Y5JCpUnkPxEtq5Xz+pbAbxQGngy9SbwFtt1J5Ckymtv/OJSUtO4JB/u1uYvbLDxQsmeTbiv+AheDOLbdNpr4rydQ5YTlAv35hYtNjblzHh2nn12ITMcSzNcl1r4c43spSvbVyT7qdTveiM1UF0xpEhLtuBZGnR4BEPvBSfW6aTpd+qPjhRFoHaYN/rCxSkLEkAoc08eh8aC17OzU3tK7NrLXYkxMApHsoWhDhPATXspfNGLaR9Vtro2C/bo8wWhp3js47+2rxbM09tuZcs3zJOYhOkYfXQ9KgWMAy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:08:29.1377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7559d8e4-e364-454d-5b99-08deb0dff67b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
X-purgate-ID: tlsNG-4011c0/1778670519-6FF598B7-F2059D2D/10/73395122804
X-purgate-type: spam
X-purgate-size: 348



On 07-May-26 10:58, Oleksii Kurochko wrote:
> Since the implementation of fw_unreserved_regions() is in common code, move
> its declaration to xen/bootinfo.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


