Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D814606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Elb3rKX8
Received: from list by lists.xenproject.org with outflank-mailman.1473916.1681295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOq9d-0001f1-8D; Thu, 05 Nov 2026 05:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473916.1681295; Thu, 05 Nov 2026 05:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOq9d-0001eu-5U; Thu, 05 Nov 2026 05:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1473916;
 Thu, 05 Nov 2026 05:36:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xOq9b-0001eo-L9
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 05:36:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOq9a-00Comw-UF
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 06:36:50 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6aec15d2-bab6-0a2a0a5309dd-0a2a45089640-14
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 06:36:50 +0100
Received: from [40.93.194.57]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6aec15f0-f659-0a2a45080019-285dc239f33b-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 06:36:50 +0100
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 (2603:10b6:610:36a::15) by CH3PR12MB504971.namprd12.prod.outlook.com
 (2603:10b6:610:34a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:36:46 +0000
Received: from CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7]) by CHBPR12MB780315.namprd12.prod.outlook.com
 ([fe80::6f6:156c:5674:75e7%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:36:45 +0000
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
 b=p09/G4CtcCGmS1De82c5rIJBS1d5pQsRvr2h3oecRLCN1MJGOYHeCaoR2n3glE3ZaTyHwgMoSCFkEuEQqOJSzClmGyGU04PrqvsUrJEv8YguRR6aeFSCXRsJwhy6BvFq9WULYeXzMEGDce94HQJLxIVrB/cyWQ22WzyohgGMRRcJGyIPCJyTXvdWeRmnnhYk8MGYqT/3WAt1sPNYr3yZPKV97iUmbBeKsH5P6AZs2O0cPkcjJmI5Sk4vu9zbn4JGZv4QOxEGyvC7hd7UjhpW+oby53MHxjV0dOiuFEzNV9XoQN5cCNHWSFMELCeoidpBhu/kQg0qx4dNpf5YXA2gSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTdQjIkgwe2il1v3wDnnVUE8kYmkCUg3nXFxQlfrlEk=;
 b=b69tFUlJ/T92O6BtEeD9ZpQaSnwvq48HwHwExyAeSHpmd4Ei4cnbCAcFSXWHwO1jTWafMQpuesRQa5aM2fceVHZTdIggmmGEeULIMqCMGCK6JLo/uNQr27wqOdlkUb3MjN0wh+DY74NoDPcQtETaCNHp5b90D7ZJlvQXY5EBj/rWkWP66P1YxSMvAeG0WZpgZ4TLxZWHo50/J+MGmdcxLkAregmFQfjlzw6QquWL7gZcTCdPiCbfoL73A/96xPKuHHQl0ZNPv5oy+Cfv5ImEzUZyT1WauIxLyvyznMBaN8lbr3ENecPWCQiacqsfsCkDkiZle3cCPX1Tsv0b3cMu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTdQjIkgwe2il1v3wDnnVUE8kYmkCUg3nXFxQlfrlEk=;
 b=Elb3rKX8WIK200ekTtHFgOxEIMQ4KJdENrBhXPpIc5z2M0w05d82j3E+1Gm+BZDEIsHArgnYxSLhQtEOO+4eO3bv7a36qMs5K1edpAAwgUnHlHhA/jABNRy3EEjGRdUxfYjLMI/3XG71+tX8KM9EBjeGKRQoBJbxuIg6JPKh9KM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7750495f-c007-4b56-aaba-cb85ecfa6820@amd.com>
Date: Thu, 5 Nov 2026 13:36:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: wait for QEMU exit before restarting a domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>
References: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
 <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <0762b21d-3173-4014-bd43-fa2a9cef9c85@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0058.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::9)
 To CHBPR12MB780315.namprd12.prod.outlook.com (2603:10b6:610:36a::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB780315:EE_|CH3PR12MB504971:EE_
X-MS-Office365-Filtering-Correlation-Id: 943e01ef-8e78-4a02-ae2a-08df3afec79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261102123227099003|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	yts3wB+7sndaSGLcuMxg7cv9sk17a+4P3Z8LiNvFV1snpyJ+GTIGUmdLIsffowM7mWYJrKZspgtuuHta1EBocrr5YyHd4inbpqSYVQkG3DZ4dZPHAJCuf3sSAk7tZbVTjbXbWskIGLARpiTwgQb1LLi9IqRI3C+bFemInFezuwy6qEt8r/WVNd5xZibTVt1eu1usajn0RGiIWUPKCVKj7Umnq9ohWzjlnG2XZrvTnM8KEfw4BKQqWnBH9/dKGN5Gv0pTvT0uSu7Oir8e2TqqQs35b7HYF+hATV9ujrtvNh/XDgbxsHo/4jeGflw/nxB8qM/ESa7NYKuEhAirYnIkrNJofMSiJSpRlCHB1ay7OG+Iw+cnR7Wb753T4ORSnfrmKy/tdGYXWEvTg8K2f0mwiUEK1O7OyPH2ddTADraMFqRnNtBJGe9OcXmqpvnKsQUEgOqkWTeAg4Pfdjsk1dAuJzfU2ohB2BPNBPIi7kho/GAUyJ1eQ8eT4PTr3ITx88eoz7/nONhv3yU2cbTY8/GsZGUlXRcyQnyh8GNliFFid5HRfb/UPZHCHIIV3zAUYbayg3NE+rXWPbtJJ5lGf9IkWh8wChvrTL70uNVICVCCuLwZw7r7q26nqnD+E+TeWefaP/0Do7ceOh0XHdCUiMFP4dqabha37Bk0kO+DVswQtqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB780315.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmlyMFJDU0ZTWUdIK1FGZmhTUXlyU1RWT1IrWG8vQVY4VHhWVlM3UUpKbG9o?=
 =?utf-8?B?T1BLYW9ZWDVDWW16NmF6djlaMllyblkwQ1JkZHRvUVkvQUxwa1U3cmxGRDJq?=
 =?utf-8?B?MkxVVzUxdTRKVUFOeTVPNkljWXdoUVNocm9KTHFxbC93MUVmVE1TQnVCeUNz?=
 =?utf-8?B?dWZyZDBvQzRCd25uQW42Q0hhZnVqQStnWmdaMjBxYUQ3Qzc1V05ubTBJVTVR?=
 =?utf-8?B?aHNQYnV5Q29tVWRoNlRwRnVEVmhRa3Bwd2pteXIzbEJLQklBVzQ2ZFdUVHVX?=
 =?utf-8?B?SGJDa0J6ZnJxSC9rMTJnZnAxL2JsWlUrVzZ2U2VXc3ZtT3pqaTg3eXJ4NWxF?=
 =?utf-8?B?cml1RS9XSU5Wd2kzV29pMnZuaG1IWWI5dnY4RGphTXpRU0lTbEpKM3ZCdUFL?=
 =?utf-8?B?RldKYXh3RFUrbHAwK1FyS3REaUxBeEVLN0w3Z3ZnYzRacVJZd0JzbEpZdFdI?=
 =?utf-8?B?dTZDM2ZySDR3YlhIY0dPU2c2RDNQNVk2cjlIMXlwYUZ2RWVLNENLMVEvQ2ZR?=
 =?utf-8?B?T2NrYklOYmtSODZHSHkrZmJZcmt3QzR2Um1jUE1za3loSG10ZmlJSUQ0YTZK?=
 =?utf-8?B?SXBxbStST2ZDYnROZWlDeHl5UjhtZklEU213NnozZ3c2TWE3aEx2Q1dIM2pL?=
 =?utf-8?B?NGlLbWFIY3Z2SENsRGx2cElGeWt6NThLL3p1bUJRak5zYkVlOG1QcjVUQU9o?=
 =?utf-8?B?eHY5c2p0MjZ3bDdoYkI4Vmk0eStQaTErZ0g4Q29SblNBSUdMY05vTGhqbDFP?=
 =?utf-8?B?akVyQ0YvWjFIZlRSOHVxcElYL3FwdlZ1SUFTVitQSWl5TUNtTE9iWk1kaEto?=
 =?utf-8?B?WTVwa1Y0dWRGemJRaTFRdDZXVVpzMVY1N2t0ZVcyOUIySENMQ0ZEWEIwVmVw?=
 =?utf-8?B?Q0ZVdU02c1RJZWo5cWFRTzFoaUlXWUtEMVh1OWEzMU94ZHNNbURDNlJtYVB1?=
 =?utf-8?B?Z0sxYTN3OGczRi8waUNkMDdvbXJrdFF0c2RYUXk0T0VOa2RGV2RvY1RxODJo?=
 =?utf-8?B?NHF5TkRmWWt1UnovRThqc1hlZDRPbU5kUE1HYUV5eHQ5TnUrRFBYTDd3WFZn?=
 =?utf-8?B?OC9aVmtmMDZhRkI2QlpSQ0k2OTBQVXF6TEVyVFZhdUVaMGtBUHlhZndvWHFV?=
 =?utf-8?B?UnlZVGFEbWxjK1pEWEFBQVhucHZEcmVDaUE5a2VLVW1RWE0wQ28wazBoWXFy?=
 =?utf-8?B?VTJLUmh1NlhSaDZwRWZqQ1NOZ09wUGI4Z2t3eStReCtZVmw1UjYvM20xTCs1?=
 =?utf-8?B?ZEJLNXpEbklIMUJ0QTNvSG40Qkt3eHpmZXgvV3ZnOXlNV3Z5ejVIczE0OE55?=
 =?utf-8?B?L04yTVFGNVVtaEJGOVlseFZRYlBhc1lqSEZSMHpiTmNOdzlxdlkvV1laaGpJ?=
 =?utf-8?B?OTlaUXE3dVVQSzNIZkdCUWNobzM2K1c0cDJyQ2REQnhJbFNtNHN6V2x1TmU2?=
 =?utf-8?B?QTFhQnk0ekNNRXZ5Z3ByMXJhdkFRU3IvMExTUkxRd2tNcjN3ZmFHV3pmTWRi?=
 =?utf-8?B?WGFrM0lnUUZNR3NrYTM4TVMzeWRPQStqdCtVNUNPbUd3YnF1VzYrVjJTQU9s?=
 =?utf-8?B?aVFMa0ZxdmM3dWxqNFdUN3RYNCtrK0hWUVhBQkJxUGdSQkpxUnJqcjFLNjcy?=
 =?utf-8?B?bGlkWUlHTTNmZHpCaU85anBXcDN2YjNOT1ZXRVVHbk1LaHZGUjZUemFjSDRk?=
 =?utf-8?B?QnBXeXY0OTdmeWxUU3lBQnVBTTVpYlE4K3RWcXI0VUxkeXhuVmNLNkdKWWw1?=
 =?utf-8?B?TklTcG5rUXdYK29JcTBURzhwU3VWU05kaDhEcmZuR0N4N1dUcHBJRElCOS9u?=
 =?utf-8?B?NFR6eHJ1aldFME42VXcxaVYrd3M4S1J5NDlFMUkwc2xLQmJ2cGJsTU90clJq?=
 =?utf-8?B?MmVUWTYrd0R6bGJIUG00UFZNa3JKUW1MQzVicUJJMHp5VjNGU0pqMUVXcFRS?=
 =?utf-8?B?N3A4TXBFMlhPS3FlQTFnRVBBLzlvWGpFZVJHU3JJaFozYUF0a09GRktSMTdx?=
 =?utf-8?B?UE9aSy9wbXRYY0xtRTkxYUlxUFVtK1NRQ1M2VklLcUp5N2ZWWUZuK0VHMldC?=
 =?utf-8?B?WkM2d0FrYngyalVVa0hnRS9Ha3hJWG1scmIrMWw0dm5wK213R0ljL1Z2TWpC?=
 =?utf-8?B?VkovQlg0aGkxMzI5NFczTGNBOFprdVR3Uld4a3NPNEFKaWdUYzdFVGJIcjJR?=
 =?utf-8?B?R2xicG1SRk1iRzU1MTNUanYrNVhOdGZWYW9pWFl4dDVNWmFabVFud0FJOGJz?=
 =?utf-8?B?ZGlGMnZGOE9pdTFVMm9XeVY4bzBJcWpGdlphd1RYRHN2RDNkNG53T3FYQWRv?=
 =?utf-8?B?T1JYOW5zZnYrNXQ3RW1NUG85eVMxUEwrc3JVU05TVTNJcHdMSExuZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943e01ef-8e78-4a02-ae2a-08df3afec79a
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB780315.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:36:45.7600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8R0xCMPD7N+7mMArhNHY096vS+7Y7ekmApDfYDPd5Jyl7ybMW7AcqSyeydQ9D8KZRGWrs2G6asn9yecbIZuOmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB504971
X-purgate-ID: tlsNG-c1860d/1793857010-D735D87B-F32D9353/0/0
X-purgate-type: clean
X-purgate-size: 2845
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 01:33, Jason Andryuk wrote:
> On 2026-11-04 01:46, Jiaqing Zhao wrote:
>> The PID-based device model destruction path returns immediately after
>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>> port because the old process still holds it.
>>
>> Wait for QEMU to exit in a child process after singaling it for at most
> 
> "signaling"
> 
>> 60 seconds. If waiting fails or times out, log the error and retain the
>> existing domain destruction behaviour.
> 
> 60 seconds seems like a lot.  Did you measure the time to see how long it takes?  It's an upper bound, but maybe 10 seconds would be better?

Typically it costs less than 3s. Most time it only takes 1s. Will change
to 10s in v2.

>> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
> 
>> @@ -3547,12 +3564,28 @@ void libxl__destroy_device_model(libxl__egc *egc,
>>       LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
>>         path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
>> -    rc = kill_device_model(gc, path);
>> -
>> +    rc = kill_device_model(gc, path, &dm_pid);
> 
> If you just read the pid directly here, you don't need to change kill_device_model().  But your approach is only a single read, so maybe it's better.  I'm undecided, but maybe someone else has an opinion.

Yes keeping old kill_device_model() requires an extra libxl__xs_read_checked()
to read the pid. Let's wait for more comments.

>>       if (rc) {
>>           ACCUMULATE_RC(ddms->rc);
>>           LOGD(ERROR, domid, "Killing device model pid from path %s", path);
>> +        goto out;
>> +    }
>> +
>> +    LOGD(DEBUG, domid, "Waiting for device model [%d] to exit", dm_pid);
>> +    reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
>> +                                      kill_device_model_uid_cb);
> 
> The reaper_pid handling below is duplicated from
> `if (dm_kill_uid_str) {`
> 
> Put the above pid code in an else, and use a single implementation of the reaper_pid handling.
> 
>> +    if (reaper_pid < 0) {
>> +        rc = ERROR_FAIL;
>> +        ACCUMULATE_RC(ddms->rc);
>> +        LOGD(ERROR, domid, "Unable to fork device model exit waiter");
>> +        goto out;
>>       }
>> +    if (!reaper_pid) {
>> +        rc = wait_device_model_pid_child(gc, domid, dm_pid);
> 
> Though this would need an additional conditional.
> 
> Thanks,
> Jason

Sure, will do in v2.

>> +        assert(rc <= 0 && rc >= -125);
>> +        _exit(-rc);
>> +    }
>> +    return;
>>     out:
>>       /*


