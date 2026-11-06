Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6E606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dBpjsPq5
Received: from list by lists.xenproject.org with outflank-mailman.1477570.1682984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTbq-00052d-VN; Fri, 06 Nov 2026 23:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477570.1682984; Fri, 06 Nov 2026 23:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTbq-00052W-Sj; Fri, 06 Nov 2026 23:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1477570;
 Fri, 06 Nov 2026 23:44:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPTbq-00052Q-0o
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:44:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTbp-004r4S-76
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:44:37 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee664a-8faa-0a2a0a5109dd-0a2a4502a634-14
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:44:36 +0100
Received: from [40.93.196.24]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee6663-6ca4-0a2a45020019-285dc4187f06-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:44:36 +0100
Received: from MW4PR04CA0169.namprd04.prod.outlook.com (2603:10b6:303:85::24)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:44:32 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::ac) by MW4PR04CA0169.outlook.office365.com
 (2603:10b6:303:85::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:44:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:44:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:44:30 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 17:44:29 -0600
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
 b=pA6lnio+yp2XDRhpMrxACnFGpBR6RfsWvqWx8RaoxpAXFD+PZReyRlQhjZC0VFovhLWIJn6fjbGx23LdHgl9yZclJguf7+kSOPqZ8DNYxQMLiwxP59Lu4lQMh7AH95S4HFpWWWmUr6m+J/F5rZvJWi+e8mNvsFtpE7JnPT2CtjExDr7EFiZLjMhxSUjMcvbfONeaxOH8WVbav9ggPoVkHxPsVcMAXHTXICG9h+LW7+38/h6nnvzcb1nzb6+hZ3oHdS7Q2NUcXjPNMsaFDj9hlk8hussnPe5yG86RlxlfA6INajr+d5iIk5FjDw4Btf1H818sLLe/lN7MwPhVMboaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP6Q/DdJ5V7jPEDdOWQPXjI4nlC2dexIFtt3GQhAaPc=;
 b=wMy2Nm2f7nlXv7IQC04cBECWrfDnvhUOQsBszJ1jH5VHRq99QZrTTEVJsfqFpyIK4+xwekL6HEox1jVZ8QuyDqHAYv+iNNxKfnzs5slWVSFXAwb5QQwMLUFOw1wPe40S1R+zOw8uTdYzB1mMrG9klV/Z+bPAL2bkpe8Ldu6WOyIiN1++s24yXOvFjB3VeFCftRTKYK3mEO+3kYqG/MD2BDVdst8mkjdRUJ1ntXkT5jRhFJmXj9i0StGY84zrZdYZP1Hb71SlLoGT47B9i91in93Ybz3dJZ0DaaxFEdPCkzIgfKyKS1/dzjh4ASKaN0OA/gzbNxxqEb9asv0ZoxBQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP6Q/DdJ5V7jPEDdOWQPXjI4nlC2dexIFtt3GQhAaPc=;
 b=dBpjsPq5E8AJekVyg42S6cJNUA4ttGXTwzzu2ekQkYevtItrec3/ZoFfBrstSCVLUiANtI2Lk8e86tiyVGjtKIdEUAvqkEGde5ZcfYSPXlnw8nuRymkWO+sMULGcb2E2gTdhxPy8tkYTsh4UXlRICJY9T2u3YI0ZrGe3tIoH3cc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <00e27752-0049-4112-9ce8-97f0d2788d1a@amd.com>
Date: Fri, 6 Nov 2026 18:44:29 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/cpufreq: allocate processor_pminfo[] dynamically
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
References: <9cd6da48-7a5e-4971-93e1-7d7262ddf7fc@suse.com>
Content-Language: en-US
In-Reply-To: <9cd6da48-7a5e-4971-93e1-7d7262ddf7fc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 7837d898-78a6-4a41-eb08-08df3c5fe7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|11063799006|56012099006|261009223027099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h8Up+UF/JyKlRUhoQ96U2JYGhvoXX9zQQZ7fOeF0YvT0NUqxhBk5QiLu4udpdxurlVOz6NorF35hPtIwM41lszlAHW8WsjG2GGjezfaPSki0vRo/ouSz024p/9mN28WYBTIjfTw+wEmKiBQ/kwiURI7PWFTG8/w4VOf1+zh9L8ubCxz1pvXJKTSDW6haMLCJBZMqIn9qLXmy1i9ESIKBOVySZO5VH8tZSKXNdWgl1izGZEo2GXXYiZo8Q9O6gK2mcZACx5TQg0wjsp2vc5ow+I99N5GfN/cQJt8FLP+xmnntnD5Q4zaRVRa773PP+6CZBkeRoxv51/HSVYyCPB69C8I12hxKFtBwQSQ2urpiK9sBlpEVjyprxmKHFgfYmQydAHZFaBjPZMNYjIN/Uc4F9jveQ9s+7HOtjDPkUOI9wtQBxQxkH1V68MMt9SdcLBKpbtk6SuI+CkJjckWktrKdP1URmSShb8hrRCpkorYijmxK6T6MM8K/2lJxlAaVyWJP6WQy1b4QUjmwchGYfoCAT1pTYuzuvRP4Lxa36mUPy1oHwgjyFJk+FLlPIF21Skl4EjYzqbDKyV5TBWM1k5fqpKIWenDqmxPn9lWnRu/cpAWg0akp2Pelzvid6H3zYrGwZlCV89aUsgQsXw20vl0FWEgUhpMLBQgIhb4AsONaH9c629chHlGE/Bs3+9j9sdzwTfxr1z65d8qdHOeB99+EWA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6hiTafJ0bAPSGBEYpIGA9c0uz0Ij3oBpNoMVFkb/MyuZzMfXF1kfeAlPQCpy5HP0kt4k2PkrzlwuGg1yo0h+LiPrNf3A6fI88/P6IDlChNLZY4R3so3rSumt5a1QrG+IohpQHqzWXqwpnko3eZ0sDheTgDFxBpKlEYx08e5TP+zxFyi10Gfb+vt2ez3B1z8VEgPNx5UbafpmBx69m+/EvxcjWwsH5QVA+Ou+XVliDUtfp0Ny1/DXE2qnEJG1aevgGEeMZnq3hfHueM9LsuAsYkJ0pqvrkFOAc6LeALdqQObEU8dZBQfgD0bRNCXY7znf5TVolkmtOdZuShrKgWpsuwRD6aDxqvSFghqvMlnKLSdmt+aYNEkLRmXKjoDLBBCzBJ98HJtXb0NCaGOFDQXAHkSu8AyQeeWIXBjUWQL05v+goI29oCLkhCqdW3aQrJtF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:44:31.4984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7837d898-78a6-4a41-eb08-08df3c5fe7ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
X-purgate-ID: tlsNG-720697/1794008676-66AB52AC-FD997D84/10/78276251493
X-purgate-type: spam
X-purgate-size: 1011
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 07:53, Jan Beulich wrote:
> There's no need to have a NR_CPUS-dimensioned static array there.
> 
> As ordering of pre-SMP initcalls isn't well-defined, allocate the array
> from both cpufreq_presmp_init() and cpufreq_register_driver().
> 
> Alongside adding a few NULL checks, drop a redundant one from
> get_cpufreq_para().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -104,8 +104,7 @@ static int get_cpufreq_para(struct xen_s
>       pmpt = processor_pminfo[op->cpuid];
>       policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>   
> -    if ( !pmpt ||
> -         ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
> +    if ( ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||

It's redundant today, but that depends on the other check.  Though maybe 
get_cpufreq_para could take pmpt as an argument?

Anyway:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

