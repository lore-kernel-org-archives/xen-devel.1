Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A65606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=pYA6sDga
Received: from list by lists.xenproject.org with outflank-mailman.1461818.1672824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLYo7-0000Wt-2S; Tue, 27 Oct 2026 04:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461818.1672824; Tue, 27 Oct 2026 04:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLYo6-0000Wl-TQ; Tue, 27 Oct 2026 04:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1461818;
 Tue, 27 Oct 2026 04:29:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xLYo5-0000Wf-7k
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 04:29:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLYo4-002B3m-GH
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 05:29:04 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae0286f-8faa-0a2a0a5109dd-0a2a4503dca2-22
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:29:04 +0100
Received: from [52.101.228.81]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae0288d-fae8-0a2a45030019-3465e4516ee7-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:29:03 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYCP286MB3114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:291::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:28:55 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 04:28:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCpqzGQYEItApqZ97YYw7HgKAmkUOv0ceU432xjDK6nDUsc3pWnDpVEc2dpXcEnRTcBEPoF7FosGPVg2hFGv2WJoeRhSq7Jn+nbZit91zAFrD9Fbizk+XjsbRAc94mU8d7grC8zKe/aQcl1HY5RfgZcPYWqknGyzr116UPvJ/l2e57GqPkt8szeWYT4ZGZWoX+5K4nwl+36wpUzWkuVZtzopAj/C25N+l2vwuV6p5JzHthKuplLIFF1v7iYdhDgTv/FPyIUQ7qdz/yjgtCig0RSkylTm4vc0dYjs7QwCi4j1x0eAwXAirPJq+m/J6P5j6GWKbjBz6JTCsy2KD+//Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr759BuwwDGEuJ+z0Ji8Hf2hWcNNQ0bAZKTXvbfVcFE=;
 b=dxgWF2pFjGiKONiwiPsZrYd/wTqgrnfUqgw6aKMrQYmrCyU5E2XOHfuMkLNq9y98Ycps9WDx346j6VJTUsmfMMy8MO24wq3QjFBv5WYIAX7CpjAX+xOjr42iHAGLij3IYv2BLmaR36l1kWi19+nO5Ew2rR+cepxGoylNT5iR9H5GpkNqxjDu5u668YzRLzqm8BRApkWrmLTv0Kz4G6RLr8KXKVkbMchFzth4mMVLCAUU5yxAc9gI1laH7q2+mmUPSlW2PNgC+3TMMRyQZywbKggnrihuwCQY1ky0qCQldAPvv96CgRDubXesWS6ZFVlyxZqW1h5lcmk23cU+eRPqCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr759BuwwDGEuJ+z0Ji8Hf2hWcNNQ0bAZKTXvbfVcFE=;
 b=pYA6sDgaZTi74vwehTNT2vyp1cmnTi5BYV6AKzFyBNuMoa3qcHVSqonWk9WYS8z1LDQmc/XmMgcq+6jPEwwX662QKfsQc1oHX9L5n42bMBVQHgRi+PT99lxPLTMZJtwtiXW9A4VfBj6PCvxM5EWcpj/xZ8d0DevA/Tvg0rKg+ug=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: bernhard.kaindl@citrix.com
Cc: xen-devel@lists.xenproject.org,
	roger@xenproject.org,
	ross.lagerwall@citrix.com
Subject: Re: [RFC 2/5] xen/livepatch: Allow tracers to schedule livepatch
Date: Tue, 27 Oct 2026 13:27:40 +0900
Message-Id: <20261027042740.57797-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179285097671.1706038.6114522060925613675.b4-review@b4>
References: <179285097671.1706038.6114522060925613675.b4-review@b4>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYCP286MB3114:EE_
X-MS-Office365-Filtering-Correlation-Id: fefa8dc7-60e7-4368-80f9-08df33e2cf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261022105027099003|261022075727099003|261021121427099003|10067099003|56012099006|261026121527099003|6133799003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	RE7K5lUrL1rqE5SAGzhvGyRJ6P63mauX65AWPBu1OE3k/qD4yUzS57n8eJCeY7Dk8Ev3KyOM+ISQjWM1GbuEJetTB6o84NzvhUlww2VjKY+P+ij5yjjEvuzgzDx0N1wkHkAh1UHJM3jN/M5EEocFvxC+2z+rteJCNfxeDds620oy/QVlsBPi3k+gyR69NhI6cVY0+Hyit3cnbycx3rAYOThztAUSM162BxKxPDGM6P7Ar540EqbFASS6RU0iIlcGpmfIMsPncMqoY8zIicGEMMvHEHlLvu8kOlQinjSER9VLwT35wOzxW4QsNQkrwuY+oNcsCRfTRde6ggYTHng6koOlU0dlaqJA1QHY6/aaeV/J6MdSvR1UAxB2ZURmr909e0wV7Bpd+9ew9Hkdl2tQZ5FhJv6tQWNjTRitldbCVLi9OVeFU8ABND4KOLQEEtqEgdHLNIl6TCfnH/yZmHRt7rNiwknP9G4a2cpQa7kenMx7GuSgSn+0EFJLqYR3n3XryA+9h8EKEtAFDV4il74IGaMv8fR9RWAR4KBLa1Sfzi29ow94heYO5pfGpn/aL+m9oyRDd49In1HMNcev9Cnl5u/Dg5fVaf5ErIIs804YIDKVta5unYW1XMS4P6si30O7gey+DnZdgOlwJU/fnncIg+oX6QK9aVOWa2SzJwabUDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(261026121527099003)(6133799003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HiI4QGtWyYBIF9maFsYH36K7nj77E3YSyLbeXOVDZEnHf9Ywpnqywyj+0G9C?=
 =?us-ascii?Q?yjdWh7Eh0ZsuZ98nxTUyKNWIOvopZvx6/rNz7KxMyxG4HQyi9u+VciibtF3m?=
 =?us-ascii?Q?DjFDFSuiiE0nsJQF95oJw7zzRzuBUYRfZizIUBjf8qUd08PZKk2Htee93dPc?=
 =?us-ascii?Q?ZDBg0p2KCfLFoZXjC/Wvp0NaCnj5iIiwIeUHmQT7q7aDzm7WLdvGYl4KX+FL?=
 =?us-ascii?Q?gS4FZXrcHYqE4MthPBD68ZCO4hCnbghlK/dkD5kdEqVVnU1f8ZYXVPhvPL6h?=
 =?us-ascii?Q?cNd/mK5C7IzO3Jh7pCz99hmUGyNnQrLh6ILQ8Qp6sFLwBvD/W63fd8CkAPov?=
 =?us-ascii?Q?P/frYB106pEndfNPvBL4pZ5IoMHiNw5bES722drqAoMA0OqZqXaS2pjRb7x0?=
 =?us-ascii?Q?B2q01DhkCPZ6wKuTKrmRxpaSt0MaYQ8Ttawdo5Jpple3KngN6gdOEw+7v06p?=
 =?us-ascii?Q?N3vrCnTCLrDdiEH4ahWVGVCJGV4W5uyQzwm6+s1JJZ7NyYyXC2O9lAPncsJ5?=
 =?us-ascii?Q?z2k2lnKZ1W2XmnvXwR/dzt05y2pfyuNIbWS1dsy7UyR8gSNJmHLEGpEJ0CTr?=
 =?us-ascii?Q?brwvJDwX8LmE7P43wCj+M8UFoQz5d5ms4K/CXtpFxeC/auAUUu4W5BqY80Ii?=
 =?us-ascii?Q?zG3nlBUdmLcSROLQ1d2UVqkACkv2axavYG+bvSoHq1l9Qa5tRSSyezxHKHGX?=
 =?us-ascii?Q?t1hZ8RPO46qVzdFcyw/2PvdR85vd8RL7SO/v6K0gwDrHFW/V9BYdxUitlR7I?=
 =?us-ascii?Q?i2mBnqhPYHiW2nqFuZidrcmk7Bw0UkU/Hi1GuElwylLG6iduXAe5TX0asoGQ?=
 =?us-ascii?Q?9jtE8iZwJZULlrfQxPUEhewgYlFEWfX43FmjdCUVdsaA/Qvs1vPZLvbfnC9l?=
 =?us-ascii?Q?W2apf8NZJN0elMItGG6nwpZ4fQhgxaYw27SvUZRCwmfVRsnrFR0vejzgA0sJ?=
 =?us-ascii?Q?VnlqCX9oFlEJXVNsBOYEqw8N9q+I8nJF4wTxTlw+JO7k59YJ0MozXWZxIkat?=
 =?us-ascii?Q?STL0zq4/5iUyeheXO2BayDSQubLrO/eua2t/gOxZrp8DiUOXIdCx5pSdRvop?=
 =?us-ascii?Q?wh65YhoNuFcjkkiiP1frXszBSqyNcbqT+KJ7K6BKx0ZyN36Ga/AJ1vygwhkU?=
 =?us-ascii?Q?pCYKe2AuJ7PTT+BdxdLDxVuYapYwPjYN5Dtj+oFYxzoEGn4eG8gs1y/J9Emg?=
 =?us-ascii?Q?h17lHzAiP1A6DWY0pldfqwiFjcxVcFo5a8uV91FiV+UwkjMitSIeUhlXBVCq?=
 =?us-ascii?Q?+g2W5ZQD7QbPkeWIc2NXZqqy1YT/Jme5YnEWVdg30c5u7Qgco4UzxBR/mg4b?=
 =?us-ascii?Q?RWIxqnbfZ9R8PEWrxFtfEi/tJBFEe5EMU9KhQzk9qeNDPm7TFHab/IYs9Twn?=
 =?us-ascii?Q?Muji90Uc17BHCyw85XPQP5au/JPcM5autzmsRobLWFGUcupan52MaT5+o4lw?=
 =?us-ascii?Q?4qfi8/NYZtJW6mtndgY2L14awny9t1wf4pzgCBnbQe9GeuSgEDf2/2KJr6HX?=
 =?us-ascii?Q?xB+3PcB1Q/YXq36yAP0DroKbSJvvhBFxpATPs+moTq+is7a2U11fBgdQvuCe?=
 =?us-ascii?Q?cbRnzZ0cENwAEUCIQYIrOwe+RlYpawQeIOU99CVMM5LFvf6mTWXok4GpjXWX?=
 =?us-ascii?Q?NvMTaUMLxxZocKJReBg6TDchZKf3gQp1ZU33RD3H76MR5aENLR1sPQoS92tM?=
 =?us-ascii?Q?DSh6gYsfMCRIZwrbawQb0w5eRS3HLB48exn/I15Em/hqq9chYCUpRCuL5Zws?=
 =?us-ascii?Q?6fbT53GY0A=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fefa8dc7-60e7-4368-80f9-08df33e2cf9c
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 04:28:54.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKxC1/smEA8Kr14pu+J7p2/xPNnQUqN54w4Q8V7h41GES73g5HLQZAxgXlyRprG2lDvhJNvt6sPIf52cKi732A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3114
X-purgate-ID: tlsNG-33051d/1793075343-6D0D94E9-15BB7F57/0/0
X-purgate-type: clean
X-purgate-size: 4774
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026 16:09:36 +0200 Bernhard Kaindl wrote:
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -1823,6 +1834,51 @@ static int schedule_work(struct payload *data, 
>> uint32_t cmd, uint32_t timeout)
>> +int livepatch_schedule_trace_on(struct payload *payload, struct 
>> livepatch_func *func, unsigned long ip)
>> +{
>> +    void *old_addr;
>> +    int rc;
>> +
>> +    spin_lock(&payload_lock);
>> +    if ( is_work_scheduled(payload) )
>> +    {
>> +        rc = -EBUSY;
>> +        goto out;
>> +    }
>> +
>> +    old_addr = func->old_addr;
>> +    func->old_addr = (void *)ip;
>> +
>> +    payload->rc = -EAGAIN;
>> +    rc = schedule_work(payload, LIVEPATCH_TRACE_ON, 0);
>> +    if ( rc )
>> +        func->old_addr = old_addr;
>
>Am I right that is_work_scheduled(payload) only detects work for this
>particular payload, rather than any work using the shared worker?

Yes, it only checks for this particular payload.

>For reference, the existing is_work_scheduled() in the same file ends
>with this check, which is not added by this patch:
>
>>     return livepatch_work.do_work && livepatch_work.data == data;
>
>The existing schedule_work() instead has this global busy check:
>
>>     /* Fail if an operation is already scheduled. */
>>     if ( livepatch_work.do_work )
>>         return -EBUSY;
>
>Could a request therefore pass the first check while another payload
>has work pending, set its own result to -EAGAIN, and then be rejected
>by schedule_work()? Failure to acquire the CPU-map lock seems to offer
>another path to the same outcome.
>
>The caller does receive the immediate submission error, but wouldn't
>payload->rc still suggest that an operation is pending, with no queued
>worker for this payload to complete it?

Yes, payload->rc will keep indicating that the request is pending.

>The off helper appears to have the same result-handling question:
>
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -1823,6 +1834,51 @@ static int schedule_work(struct payload *data, 
>> uint32_t cmd, uint32_t timeout)
>> +int livepatch_schedule_trace_off(struct payload *payload)
>> +{
>> [...]
>> +    payload->rc = -EAGAIN;
>> +    rc = schedule_work(payload, LIVEPATCH_TRACE_OFF, 0);
>> +
>> +    spin_unlock(&payload_lock);
>> +
>> +    return rc;
>> +}

Yes, it has the same issue.

>Would publishing the submission error in payload->rc keep these rejected
>requests distinct from work that is still pending?
>
>To illustrate, I think this could be addressed with a small change like:
>
>--- a/xen/common/livepatch.c
>+++ b/xen/common/livepatch.c
>@@ -1861,7 +1861,10 @@ int livepatch_schedule_trace_on(struct payload *payload, 
>struct livepatch_func *func, unsigned long ip)
>     payload->rc = -EAGAIN;
>     rc = schedule_work(payload, LIVEPATCH_TRACE_ON, 0);
>     if ( rc )
>+    {
>         func->old_addr = old_addr;
>+        payload->rc = rc;
>+    }
> 
> out:
>     spin_unlock(&payload_lock);
>@@ -1882,6 +1885,8 @@ int livepatch_schedule_trace_off(struct payload *payload)
> 
>     payload->rc = -EAGAIN;
>     rc = schedule_work(payload, LIVEPATCH_TRACE_OFF, 0);
>+    if ( rc )
>+        payload->rc = rc;
> 
>     spin_unlock(&payload_lock);
> 
>
>Would this preserve the pending assignment before successful queuing,
>while leaving a terminal error when no operation was accepted? This
>only handles immediate submission failure;

Thank you. This looks good to me.
I'll include your fix in the next version.

>it would not reconcile the
>filter or target state with a later worker failure or make retargeting
>an applied payload safe.

Thank you for pointing this out as well.
I see that the failure after scheduling needs to be handled separately.
I'll think how to handle those cases for the next version.

>Thanks for taking a look; is there an intended status convention that
>would make this harmless?

When implementing these two functions, I followed the pattern in
livepatch_action(). And docs/misc/livepatch.pandoc says that -EAGAIN
indicates "operation in progress". Leaving payload->rc at -EAGAIN after
failing schedule_work() appears to be inconsistent with that convention.

Would it make sense to fix the error handling in livepatch_action() as well?

Suggested fix:
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -2276,6 +2276,8 @@ static int livepatch_action(struct xen_sysctl_livepatch_action *action)

             data->rc = -EAGAIN;
             rc = schedule_work(data, action->cmd, action->timeout);
+            if ( rc )
+                data->rc = rc;
         }
         break;

Sincerely,
Ryo Takakura

