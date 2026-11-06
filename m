Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B1606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vswN9LCd
Received: from list by lists.xenproject.org with outflank-mailman.1477554.1682977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTUQ-00038y-A6; Fri, 06 Nov 2026 23:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477554.1682977; Fri, 06 Nov 2026 23:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTUQ-00038r-5V; Fri, 06 Nov 2026 23:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1477554;
 Fri, 06 Nov 2026 23:36:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPTUO-00038l-VD
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:36:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTUO-007fiz-5T
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:36:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee6449-e002-0a2a0a5209dd-0a2a450594f0-40
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:36:55 +0100
Received: from [52.101.52.46]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee6496-4cb1-0a2a45050019-3465342eda11-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:36:55 +0100
Received: from MW4PR04CA0382.namprd04.prod.outlook.com (2603:10b6:303:81::27)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 23:36:50 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::57) by MW4PR04CA0382.outlook.office365.com
 (2603:10b6:303:81::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:36:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:36:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:36:49 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 17:36:48 -0600
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
 b=KuEISEOXIL9FtfsppweZP7ZfJDJCc8NfktLIXUSzVw8KI2vYkoxplXBUxRj0CWGeJqsWCFDiFF3t6HhH4a/7817p5aG6P39nwOUSZfxRcMfeW0Wystl4CsMTRo9IoxDva8KrqXpnrd+X8c0c9i2gHiHMl8wQ/BVV8dt6l3JaWp7c+tQkYw9UlvgO/vvOPf1UJXmvP0oOLRUR94fApW0H6uul+CpeWERKfHaPkmvHrZTvE9rJFzUKBpcuAoTMy3dlTt4QLLMj/9z3L6QBxhe57L6OGo91oDeMTHhhIXP1lINM8qXno6e8Ai3ldGfwxD4AKoBQH6D/Berj4YJ8Xyn0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UbMA8KwT+v/jWXBocaOx/JAX3SoO+6nvQu8Yzh23aM=;
 b=emP2tHuYiXKKytn+ytJexbUvRDpwXkKNYvI8YY/LoCh3ofTemb5XNxhiyTXd/m0I4uGFhdhXtMPgk7H3UmhdMMy5KOdUEnnQqw44iz4xrziq2ox+jWYf+ZaJcNBwx7pYECsn7unEcKWJYHo2+919Zp1L/Y6IzOm8xBNcnOiwUmVe1JE53qEXu6TxkjwqWHiD0kQC1TaPOI9nYk1yzSAg65Ybot4lFx++Tr4G7ln2/Ca/KNmzBOv7R2fowXMYtUB62X7Yd/mE2oNxHBYMvpwfPxzVnmbYauElAq79H7+vLpHsjCTA6Zwxof10a/10kypDbqPnHyFsW5uUvu3R6F5OMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UbMA8KwT+v/jWXBocaOx/JAX3SoO+6nvQu8Yzh23aM=;
 b=vswN9LCd6kVMCKt0co+zCGfJSa8hEGXJ9iRSWE0oZOsOWBlQi9ocvyL3cuK8Ynu5MKCeYsRqMnTSY+tgt0ZrHfvyosdh9dxphdnZZOPDgtdRy+iVQCOvQmXyVUrLL3PJJc5nCSB1A/WfyssearZPElHcB9Dwcr4tJPfHE0/VYDQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <729bd90c-af1d-45b6-a466-f18845a10daf@amd.com>
Date: Fri, 6 Nov 2026 18:36:48 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuidle: allocate processor_powers[] dynamically
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <4da146da-26ee-4ecd-a747-130ed0783324@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4da146da-26ee-4ecd-a747-130ed0783324@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|IA0PR12MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 591382d3-29c5-4989-c21b-08df3c5ed484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|18002099003|10067099003|261102123227099003|11063799006|261028144727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QJkPbjSjwFT4fRtO5jaeh7zf0MVpRssaZfVuNiXApJYizKNpSsVj25pv/C7Lv4LyX+gOGgxu+hHgUe8EIlnToqlTjM8ZPN9BHRqipN6F+q0ZrAHaqXtFIVneZ/qxCTG2Cmp6TwbYF3IOwMNCQG6zfIRBiBBmz2FJEXn4s7ykwOxorQ+GylLxpqZ2NhGDhte8HKjfgWSw0pY8HRa73CuUrDQKJG9PUOvLhwXxn0/3QniU+lbAxVmf0YV3DWkuoWLIQ1Vb2tQV4z8C+ER0yqM0pWV7mvfEKSFzI1pQjt8VvKP3oZHDyIofU3PExsPgznpX4RgnmWH7KJjii84Q4KhWiHbii71mrJHSeg2NUu+QoWGS77dXh5PKIgkzVl4SQK2AOEqUHMcN/AQ1s6OwpzvvdLUSxS47TkLxoOVyDZqVeReb5XnKVLgk38/ITJ89tdtrHYT/TfdLO+bWwHpf2X4H+0KV6lk5gjQN2V2Pxb6/oMqO4qYjOpDnx4MuifvgD2iE4J20Duq0S8lXNJCsG5yZjPITZhgDRV7nYOEddk0yfFDYY9YmYMGSdL8x6T7GAi/RwvPQ40ChfKo/r8TuhjssDMJ47wJ9TFNPju2h8G1RZGYxbKJEzKhfSVyWGabTTsAfIKdI8xpBJdWe6jho41NFanax9QlfH/epk9kGzkT4c89TyJdOShbXSM018H6WWo9u05CW079jAQmpZkTEwZt42w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(261102123227099003)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SSUsfnOb2BYajTpH3Cph9Oyya4hE2XsHlV4cxflgIB+wb0+ZSklwlV0g5c/dwQk5EcaBt9FupbOZaYebPM9EqBvytnDwt6Q1vOCXwOX8Mkbwk4aatJ0v6RCaT/eQ38XIGtB//UPoNZFjk1NhJ96NP5hHw71q+X4ieKGffUO94mZlaXeyK2Y4l2JNT+31OZQNCVOXkpYO5Q3nlQeJCD06vGaoXvhlcwp+ngvw0zdGaYT1MJ7GiZmD9kyNpsbm1SioLWnCm5zM/GHIV3NoWdkpAb6k8NhlbpTQb228l0DV21+Cir7xyOohVXYyWOZeaSdzp/OklbTIPLsXPFdwvu7gktFKF5wbZ0u1mEYuDyJlMZ0NWRue9D69L8PCOAk9zIfhw5iSWsRbKxdvFKJiIeC79HDAPJpkCUyRhLUttRVrrTcMBsci8yxUvbv3WnE+w2VE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:36:49.8920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 591382d3-29c5-4989-c21b-08df3c5ed484
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208
X-purgate-ID: tlsNG-c201ff/1794008215-728B62A1-AA0C7862/10/78276251493
X-purgate-type: spam
X-purgate-size: 1029
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 07:52, Jan Beulich wrote:
> There's no need to have a NR_CPUS-dimensioned static array there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Some of the new conditionals checking processor_powers may arguably want
> to check (really: might better have been put there long ago) xen_cpuidle
> instead. Thoughts?



> @@ -1694,6 +1702,15 @@ static int __init cf_check cpuidle_presm
>       if ( !xen_cpuidle )
>           return 0;
>   
> +    processor_powers = xvzalloc_array(struct acpi_processor_power *,
> +                                      nr_cpu_ids);
> +    if ( !processor_powers )
> +    {
> +        printk("CPUIDLE: disabled - not enough memory\n");
> +        xen_cpuidle = 0;
> +        return -ENOMEM;
> +    }
> +
>       mwait_idle_init(&cpu_nfb);
mwait-idle.c accesses processor_powers[], too, but that should not be 
accessible since we don't make it into mwait_idle_init()?

If so:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

