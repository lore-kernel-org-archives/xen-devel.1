Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97157606A32D
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cEAC+eJ+
Received: from list by lists.xenproject.org with outflank-mailman.1488376.1690360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS1PR-00013y-Cd; Sat, 14 Nov 2026 00:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488376.1690360; Sat, 14 Nov 2026 00:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS1PR-00013q-8l; Sat, 14 Nov 2026 00:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1488376;
 Sat, 14 Nov 2026 00:14:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xS1PQ-00013k-B4
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 00:14:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xS1PP-0008gD-OB
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 01:14:19 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6af7a7b2-bab6-0a2a0a5309dd-0a2a450cc54a-14
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 01:14:19 +0100
Received: from [40.93.194.65]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6af7a7d4-f479-0a2a450c0019-285dc241541b-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 01:14:13 +0100
Received: from MN2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:208:23e::31)
 by SA3PR12MB078285.namprd12.prod.outlook.com (2603:10b6:806:58d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Sat, 14 Nov
 2026 00:14:10 +0000
Received: from BN7PEPF000000A2.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::51) by MN2PR14CA0026.outlook.office365.com
 (2603:10b6:208:23e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 00:14:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A2.mail.protection.outlook.com (10.167.248.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 00:14:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 18:14:09 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 13 Nov 2026 18:14:08 -0600
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
 b=p9eL4Ehz12ronxEiogjVYLQhAgG8hSFFU2Q5YWaDInrwGHc4yJu4Dh2SvqBhMqHfLKHEjsauQAJaj+vFisxEwU9SGNHlHrjA0IwAQQowIw001Jd6lw+RwvCP0xVbyiEOATc1AFOkwQIusskGINYZatf/rnqKR4emQMFaUI+5T0NqV6PUnxSmKMFwjQfxV0xL50hIbn844W+SsHZDWXWskJYsHwISdTYYq/jHUFFMfiTXA61CucPwxiB8YhywriFXrPLOMMSRYQe2vflh/KavJw59rpjSU5USGg1OBqKUE9gKw7hddVWSe3zanykDuo7oPGIUCqVgV2L/GJrmIi/FLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG7dYyh7k5/6UKGeVFZ/x74uuALxATgZ1fp5uUSE8CE=;
 b=UEdAKFeiOZvW3BECLGCdTp1SA9po+y+qSYdA3H0EUown9Nv26eSfT3P8VAN7HTb6Kd9siFFeYmBa4obrdMRBqEvgZOn0oCSF+rkx9CXcWaJlnH/b9UZ4PmobRY3ZPU9xlmGQdHJITgkfd84K/Ze7WpGWoO7Yw+RkCgJKCk54SDMqXpnJeoKYqjDWirgizUe6CNIGVvNd6GGzWzfRYtr+dg6DujfwL4vHQBnk//WS0/S//6SvLZK9EQJGoK3smA1iID2nA3CwOpnnuD9DSW4uodem0a50yiQ9YHAxY54s4tYc18KsQeEmhPF7gnBz+k7H+H8cbro3pxyLzI+3e+ufKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG7dYyh7k5/6UKGeVFZ/x74uuALxATgZ1fp5uUSE8CE=;
 b=cEAC+eJ+Ud4xCIOD5tMvJJITj9uoGcRRKJ7JFWaejniYfExLVCIWx5/ti6MsaC+ynVc3MFmVjGhnLUXbZRBpq6/XjZVwmvv+Ma7ZbQ16ymWBBjmWjpnvXBOLrt4zpQ1hOSVG78BgZLbAw+8h7gIzpToxJj3W8NC/m4lysk7EhUw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c0ca5f30-685e-419a-93f1-21ab848425df@amd.com>
Date: Fri, 13 Nov 2026 19:14:03 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libxl: wait for QEMU exit before restarting a domain
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Penny Zheng
	<penny.zheng@amd.com>, <xen-devel@lists.xenproject.org>
References: <20261110100258.490701-1-Zhao.Jiaqing@amd.com>
 <d2ef64c7-0587-4fb1-b119-bbd11b987c3a@suse.com>
 <81087fde-407a-4f3a-8a7f-e2a96945d175@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <81087fde-407a-4f3a-8a7f-e2a96945d175@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A2:EE_|SA3PR12MB078285:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c7872f-0ed3-46d1-9e90-08df41e43484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|6133799003|10067099003|56012099006|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|11063799006|261022075727099003|4143699003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	AmdpQAWn8FQj54XqZibAVwaWAe9ZxqeeXdvdzplI038lwsrrD21cqfAJNKcOPJ0xHjdYihmi7rZCMIAv9v+vLoMGKsJQoL1w36MrGG/d+245Sfj5ImrjCidJxtt5INdhooEzew1tdwh+mxz9kcXmkn3KAFzH92d31Bil6ezq6zAVu2g1F3GxZbhTdM3OcQi2aTfIk/2EkJknkRjOcXdjCQUEutnvvqL5XpPFO9AXkMNSg98a+CIBr2i0N+W+tnKOBH6NPzIZDmcLNUB7GP+LPXNbH+6bc0lVYAZnTFA0tZ27q1mL3s8f6wnv6SJuW3loQfgv2OsK+UR7ZAU1vVOdeK8GXA51YGt7RE01UMA7LNDu75q91ZR1ZQSnlrWZSachBrqp+DCLJLzXL/XKrNUbOa49Dnrul5WwX4JgKP4U8z8u+sVHzyqkA3jBST+IY/aK7W6g5Sc7nX7HUhsjP1HcppSpjLsut4bUsp0vF6QmoMd9qk/RSKM9cDOanmwWRYGfel6Yky0/mq1z42qDKRatH1tdwKDxwEneC6Oaj9pOFkfthezhqWxQ9I57SFfk0AjPYhX5zMxIA0Qb5ByQbZh2vw1wAOemTp8JdDwbehxUQXzCMMLWew3qFR38HY1VspFdsQgy6J6WYt6ZNYAZplivMUYfwUtB4+NoGvlbiQmPDieCgsvuraA0+U4Y3uTOfzuBvf0DWF/dZgtIJeB1ZjAa1g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(11063799006)(261022075727099003)(4143699003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R8Wr/OQTgzfTOnm0i9xa2pVMIKKItmLH4jOQIoVQ44tLr3BEi8jCihCM/m72B92R3Fl6Po0FCBbuUjRX2+Vj0l8o7QTuXhwQWIrqLHzeYYND7KNbGVBMt1MNk47XRNPSpmu0NVSW0iN7NRGi4a49a9z5SNs8PfwdDuIqF8bGgEoQMRTGFmt/jQulL5yFJkd7a4ACgzuZhNM9AcRw/cUB6NlCZnKgn6HlDEkywti7Au/AQrZion70yjDkjkYd0BXce6Ls6McXsnXmqizuPRmqcm/TzULM2cqGKyXoW6t8pm2dtbE47+r1RnACNTykZyNeDkQtKVec59cN3U1Yq/7y6hn2bKLPFg7kVlRKQjwNzMf3rvLJL4kQJ5wUWZXtLKsgUps/8v2hF183AcOFzjS+iibxUmYXnP/p1Ml1hRgTy3pB0yLIpRNbGujLizycroEw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 00:14:09.8924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c7872f-0ed3-46d1-9e90-08df41e43484
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB078285
X-purgate-ID: tlsNG-d25034/1794615259-51339A5B-D7754B32/0/0
X-purgate-type: clean
X-purgate-size: 1616
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-11 00:51, Jiaqing Zhao wrote:
> 
> 
> On 2026-11-10 18:22, Jan Beulich wrote:
>> On 10.11.2026 11:02, Jiaqing Zhao wrote:
>>> The PID-based device model destruction path returns immediately after
>>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>>> port because the old process still holds it.
>>>
>>> Wait for QEMU to exit in a child process after signaling it for at most
>>> 10 seconds. If waiting fails or times out, log the error and retain the
>>> existing domain destruction behaviour.
>>>
>>> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
>>> ---
>>> v2:
>>> * Share the fork, error handling and child exit handling between UID and
>>>    PID-based destruction paths.
>>> * Reduce the device-model stop timeout from 60 to 10 seconds.
>>
>> As per my v1 comments I continue to question this.
> 
> I looked further into QEMU's shutdown path. After receiving SIGHUP,
> QEMU calls bdrv_drain_all() to wait for outstanding block I/O requests
> and bdrv_flush_all() to flush its block devices. These could take
> longer than 10 seconds on slow storage.
> 
> While this does not identify the timeout you observed with SR-IOV,
> my earlier measurements are insufficient to prove that 10s is enough.
> I'll restore the 60s timeout in v3.

I'm okay with a longer (60s) timeout if we think that might help in some 
cases.  It's an upper bound, and normal shutdown will proceed when QEMU 
exits.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

