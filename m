Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB99606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PYs0v+YT
Received: from list by lists.xenproject.org with outflank-mailman.1454704.1668201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsrc-0006QG-66; Mon, 19 Oct 2026 19:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454704.1668201; Mon, 19 Oct 2026 19:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsrc-0006Q9-3O; Mon, 19 Oct 2026 19:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1454704;
 Mon, 19 Oct 2026 19:17:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xIsrZ-0006PO-QL
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:17:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIsrZ-0008G0-7U
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:17:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad66cc6-2eae-0a2a0a5409dd-0a2a4501b96c-4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:17:36 +0200
Received: from [40.93.196.10]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad66ccf-5984-0a2a45010019-285dc40a99da-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:17:36 +0200
Received: from DS7PR05CA0069.namprd05.prod.outlook.com (2603:10b6:8:57::21) by
 IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:17:28 +0000
Received: from DM3PEPF000265C1.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::63) by DS7PR05CA0069.outlook.office365.com
 (2603:10b6:8:57::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Mon,
 19 Oct 2026 19:17:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265C1.mail.protection.outlook.com (10.167.23.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 19:17:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 14:17:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 14:17:27 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 14:17:27 -0500
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
 b=U5bk+YZ/AOmTuhLDUUqQ4XUsIJwor90tueWqQ+rA5Rws92K3y4NfhixH9wMUFu3peQS/DTrIl/OpYqACzrD/GAJb33kkD6JQ2isya4Bt5zIwwWK5RFgEySI7sE4Xn7pH1qqZCSYQeYUuyin34IHBI8cBEYgqLJaZPpOklh6SKEWezuVEJDuXHm2yKBgLs0MsEpIE11WGB/UXSHO+M8QF7XtGEQfFxgVLzkgvp4g/L7n+eP1tmmz88VaDBwAOTRDOepF7fImpssMb5zMj8H40y7swoUzbPYlEzmMaHaIXB9WMspjqWVW4hKwiaL6P+0jM9GrtA49Fgqr/4bh7FHplcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCAkuRImuKtUiIUpukaEwCtuKwnf8f/9h60I7T0owRM=;
 b=kFS2QE5lzzP1rvPqZNhtf8FCGzcJPC4EUGnEi/WzTBbobG+vP3mfY/WU5Vwe/0sUc79gTxeKWCItDddfgDGmImYl6LnyKJFVx5Nddj2mrsCqBSkDxlQvCwYieFYRC/xbuP77q8d+FbhPosrVvLgWq7Cp/LC89LSv6vI5J/URLVSO2BisXijusZauFFR2QyNUrr+oY3//4onzWEG24W4AIMGFIJHPDLG40QyGXuhGzAlfiu7Z5L+9Cf+ZxqUJobrZ+CKU/9ZkQG3P4Y0HsVKfIk5Qoiu8vamc+9Ziy+ovwOdtgsprqyyxBPT05XB0dZDBCovhTmUjRsodD001qMPWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCAkuRImuKtUiIUpukaEwCtuKwnf8f/9h60I7T0owRM=;
 b=PYs0v+YTCEmrSZ05RpOvRUIGdzPVKuts1G2JY7sU/TV6ANzNLqsZz4+rm3ROAujDyJD8yew8S7DEF5C4CjXRfkCUZ33LLU3B5z1b2JVNVGjh2g5JK6bkgOcUuxNM7vwJjg0gUrWp3m0qqtfxHH0ZM0cLN46ApZsI/GXFJoELXBo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <ddd26f66-34ab-4bad-bb4e-96d7c15b7f6c@amd.com>
Date: Mon, 19 Oct 2026 15:09:33 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] vpci: use a local variable for the BAR rangeset
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <4bce74f6f5d2fc7b58c62acfd377956a9fee8651.1792072426.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4bce74f6f5d2fc7b58c62acfd377956a9fee8651.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C1:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a89b2e-67dc-4e39-ab41-08df2e159dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a0/OIuGq7bEf3FlyO5tvKqg5shuNR2HBxgfFIm/OLdBA4GG5FN0kyM+8wyiuUVXyrwEykMs72D7QzRjAnonszz5owyii8oCCw7G+cLIduixITUjPuzKNOjPuOoN5LQVUVGHjTby84EBtXD10/enh5tUq4ajPS8OuzgAgvM1KmHauVPldF9ibbk64dGgN3YfQcA7ndNFLxXewB7ri/uTZRzNF2iLmkpEcSxnlkN3MXp1pAJ2Wl6ZpxgiCO15+MQ/aB/ZrGo4en9rthXzVK3CYD3sPNeGajkTVe7PKFRY7gn+Vrs9cra5Ma45vamUHcLI+NFiut4aitfz4VdSNwfz+padg+kmvDFKJzWTIifceYBQhNOfJCsdxPiwRfNeuhW7YIWK2/FDqGUfeaOzj/w+NxvBR52AxcuRADIsKhPnPks0s5YsQEJ9Y0Sk1T5N95KJbErGe5+OmPC49ufo0/UFn9IjVjtbA6DPFlM1oFlSPHuemmbHWacFSgWGxKfL3+NxBfnT6WIs43I1eJcqiQvLpUsIFZIeD/eUKn/6PV+7C4sXVGhDhbNt1uJpZ6XGIC9lt5w+cYDWVvF02/D3ROkiHqqYBONjo76IH3WXT6sE/XoMp466qfb5ndIKK9590mPHW0Tct7UpkOPiziL5R7YePuoa0xorC7CvYxQlxFU86ywnLgqhvl5pFwvHRuv5+Xx+embrx+4FVUXJa/QVNDFePQg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U9mEnPOIWwYU+0uC43BKbuRrWGPnGfkzxxFsEzpVbT+KMBDUY0TjGCsH8AXmCL6XezrGQVYg3oS8auJP2G14PwDSSp0TO+fNkoYn0cuMMVwARhnfEujw9ArveN/Iznbd0fY+oh09E4qRn5tK8GzgbSEbkbQG8TJeYWmiWBEc/+tcVBc5w5OHc425yi/b2pfJG01kAqU0q9T08eq2mx/yeXs1WHXd6OQFdXvd8E1bgEq4y7E/V8Z3DZPZ/UD1tS93yJgQKIvX3ptQz7VdX4+dJFzRvbgRTe0NgmQ5grjyA2Ocr2exANN+Re1vnTznLvL/0McRJW5cYxd0PjgibAroy+KAGWQOsaiQw9gWZiRW1M2097i9wIKAtwhmMsHtrMHMvEQIND9FcJJmNDyvOGnIeYiZllJwHhpcf4nWYNKxA9l1R1eJzC79uaNoHMi/ZefE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:17:28.4664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a89b2e-67dc-4e39-ab41-08df2e159dbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460
X-purgate-ID: tlsNG-d62444/1792437456-1D272757-3546B433/0/0
X-purgate-type: clean
X-purgate-size: 1424
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-15 10:08, Mykyta Poturai wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> In the BAR (un)mapping paths latch the rangeset of the BAR being
> processed into a local variable, instead of dereferencing struct
> vpci_bar on every use. Preparatory work for moving the rangesets out
> of struct vpci_bar.
> 
> No functional change.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I guess you need a second S-o-B after Stewart's since you are 
submitting?  Unless...

> ---
> v3->v4:
> * new patch, split out of "vpci: Use pervcpu ranges for BAR mapping" so
>    that the non-functional churn is separate from the functional change

... it is something totally created by you.  Then you can drop Stewart - 
I think.
> @@ -218,8 +219,7 @@ bool vpci_process_pending(struct vcpu *v)
>           {
>               spin_lock(&pdev->vpci->lock);
>               /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> -                            false);
> +            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY, false);

This seems like an unrelated change.  I think you should drop it and 
incorporate into the next patch touching this line.

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

