Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77D606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Dq3mWjBc
Received: from list by lists.xenproject.org with outflank-mailman.1462165.1673215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhDb-0003Ae-21; Tue, 27 Oct 2026 13:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462165.1673215; Tue, 27 Oct 2026 13:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhDa-0003AX-VF; Tue, 27 Oct 2026 13:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1462165;
 Tue, 27 Oct 2026 13:27:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xLhDY-0003AR-Cy
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 13:27:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLhDX-007vXg-Q3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:27:55 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae0a6cb-bab6-0a2a0a5309dd-0a2a4506a696-46
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:27:55 +0100
Received: from [52.101.62.67]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae0a6d7-195a-0a2a45060019-34653e43b451-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:27:54 +0100
Received: from BN9PR03CA0740.namprd03.prod.outlook.com (2603:10b6:408:110::25)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 13:27:27 +0000
Received: from BN2PEPF0000A88F.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::58) by BN9PR03CA0740.outlook.office365.com
 (2603:10b6:408:110::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 27
 Oct 2026 13:27:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A88F.mail.protection.outlook.com (10.167.248.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 13:27:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 08:27:25 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 08:27:25 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 08:27:23 -0500
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
 b=l93f7Ky9MhjiYbNIItbBhRYmEC5WRa1fT5MU9ee/1Cn9kpn20KBlZYozqeEefBJu/tKp5iH/kldL0HwcEaoIjai/lViqvG+KuEY2ANyjfyZL3BNgqXXseSYWGxUhGnvQe1ybSnSJ7O6PG3k2G1qhPcuJ2QKmAw+VOkEY+S2bUNC/twnOit1Ra6I3LHzBAj83eSS1HWw/6RlDCZaleSrX7DweyGUBd0R8C/IY8SqHNM2zIt0c2+K7oUHxTyrDMoCw3J5tqL4DOI60LWjeS+u2jDjTZIdYNtuNjvbi+sO7WbtkuNWmYaTRuwxJaS1ct8e5Q0tlHE3MsHLS9fgoMGs+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nY8jl+8X9fgjGf++R0V+RqjAbDRWNwf395vyKfYKDI=;
 b=nmVJp1Ry5Wt3z3sN4ZkWnfkdQtRz2x7LNY6FsZCg5KxlHyl7QdE+iVWDLMzca4yVYrvUBaE3S3lL06UnRyujgnBjBw2oZXlqcxTlHcTcdblzS36ktKxaiD0tnA8aA9ae0CV9n1qs7SRKls5/Z7CkS7lE2YE+nPy4/5i1xLkA+ZoH39EvAQQuCVhKAXt8XGcifYaH7RTYvlUif+2QGMbp6EM9T7LPYkasehXETjwSXJoFx+8WFpNeVN+WchLyxDtuLYsFfdUccHK3sjNLUxGZ0H3I4ykMBJ8u0GExx8nlPj436xftQj1cIEzIdO83QiBdDwfUVo3uC0fxeVLaTFStGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nY8jl+8X9fgjGf++R0V+RqjAbDRWNwf395vyKfYKDI=;
 b=Dq3mWjBcH4pSFp9AS4l4SudXHwnElVqSlGBNaP6t48IM3wEfuZ3Fe7MQLWZSiJojD/Ju6iuvs67N/hD5ySTQl7wXMJgpFy38nu+KT2nX6jm6TNLvykEgTQPBOhZZg9EnM6ADkBOZjWqQtHU8kyan7/vw2DYXpkF8HK0L6ukinaQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <75922cc3-907f-4de4-b330-bfd76e0b097d@amd.com>
Date: Tue, 27 Oct 2026 14:27:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dt: Only parse direct child nodes of /reserved-memory
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<marscheng@google.com>, <jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>
References: <20261027031855.2671912-1-visitorckw@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261027031855.2671912-1-visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88F:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d067f9c-bae5-492b-68be-08df342e0a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|261021123027099003|261009223027099003|261021121427099003|261022105027099003|261021135927099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	SvhfBkYgql70mDJKUTyXlmhgqsbAKQCqtvBglcnEGQIGKcAgaE8FSfHhLpGD6Ka/XOZqt2Irn23S70HBEsrH4RdpujtHnvp++KcgvbNSRvHIejVhfPV+KIdXU8QVHdrc87nBHvGC0ZtTzFbn/hX5xY4154fgKk5ZO8MFrxsA+oI9EdVEwChHcyOE36IurrnfYQa6hUA7KmA5oXRewGnr1vSnfGGqsEIAED/UIkscvZUCoMZk3bScVVXvZg61GlaTs8X92wkTE9txjON62/iGJrUwLTVoqOxv+SoAZw6jL2Obi8JidSD5DWOlynE+l9gA3mcF+s2d27JjKxUua7SV0mslWdSbelDA0fhirOVdGLzMC4cUmknlXhCvpbOVYDW5PADqsgTIcQ1UR1S3kq+jRvcDpcUg7LOdSunvcv4yYQJYzy3jyWdlP/rxqm71Yj6sRydwC6m7wkNnjPiLsqN3LRLbXgejAwBneBQ6/4LsOgW+HJhvtstY4FHbyAoKvQTV6rfoqcyRh2JAnnfq+1240MouA8oAQdfiP1eOGJ7Z1kwixkRCAxfod5Ds6hB8ycbaI++qhU/mIc0ylzJdwOvhyIwAvCmwVf7pwIdmWywqxFfmUg5VjyKT6hCgo7cnNubatOmofYNhHH9tn+67NWfXR0PObOAequ1nc/Z/E+5WE5nGTRWDM+oRbNW7HDa7W+c4mOMflGDL0ppsHGfYZyzl0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261021121427099003)(261022105027099003)(261021135927099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	avTog1gqGs0khZC8mFjxJfUNWyi53v35+Z8v6CYmTovQHU33Sq7qOgekCvYEaja4LQQUsbftqCr5wJSMnonCVj3lDFlNLIJiVM5wbHUWzK22veNgIUd4iiLda0vpghdv9770nolmCgbCBMal8TKwo3E28aNscEGpU3Avw3OFEgXPuJr78Nr5kPb1hf88emf9e2DYJ4KqIYaIeQYq9XbGqjtKrAlLQ9h/qNOCLZKhVI5Oz/ECxNk8o2yg05qnbiIT7nN6HbQpyQAjsIfqQqLJBqxbeua9PA1IJ2bcSSFzjCGwBi0OAfW3MO5VBIl2EcamvTJ6K1DsX/ysUxiDEnf1z8ZSeYqmU8zZw0nqzG0Z8Ui90zKswpHJCvHz5RiGK3X8lChFZV62G+u+OphwMFcNWHB/a7Ehs4bbvlD0QS7CBALvGJpR+kdy0DtkcMXFZ1+C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 13:27:25.8732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d067f9c-bae5-492b-68be-08df342e0a7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A88F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941
X-purgate-ID: tlsNG-16d1c6/1793107674-F7ECC77B-9F538EE7/0/0
X-purgate-type: clean
X-purgate-size: 1994
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 27-Oct-26 04:18, Kuan-Wei Chiu wrote:
> process_reserved_memory() uses device_tree_for_each_node(), which walks
> all descendants of /reserved-memory rather than just its direct children.
> However, a child node such as nvmem-rmem can contain nvmem-layout and
> cell subnodes whose reg properties specify internal offsets rather than
> physical memory addresses. Parsing these subnodes records invalid
> reserved memory regions and fails the overlap check when bitfield cells
> share the same offset.
> 
> Ignore nodes with depth != 1 in process_reserved_memory_node().
> 
> Fixes: d96594eef39a ("xen/arm: keep track of reserved-memory regions")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  xen/common/device-tree/bootinfo-fdt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
> index ca64daf4cd..eea35325f7 100644
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -185,8 +185,13 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
>                                                 u32 size_cells,
>                                                 void *data)
>  {
> -    int rc = process_memory_node(fdt, node, name, depth, address_cells,
> -                                 size_cells, data);
> +    int rc;
> +
It would be easier to understand with the comment like:
/* Only direct children of /reserved-memory describe memory regions */

> +    if ( depth != 1 )
> +        return 0;
> +
> +    rc = process_memory_node(fdt, node, name, depth, address_cells,
> +                             size_cells, data);
>  
>      if ( rc == -ENOSPC )
>          panic("Max number of supported reserved-memory regions reached.\n");

I will change on commit. Thanks for the submission.
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


