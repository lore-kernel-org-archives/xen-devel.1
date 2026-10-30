Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150A606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=BTxUUOoJ
Received: from list by lists.xenproject.org with outflank-mailman.1465481.1676012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMiXN-0005lA-7t; Fri, 30 Oct 2026 09:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465481.1676012; Fri, 30 Oct 2026 09:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMiXN-0005l3-4u; Fri, 30 Oct 2026 09:04:37 +0000
Received: by outflank-mailman (input) for mailman id 1465481;
 Fri, 30 Oct 2026 09:04:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xMiXK-0005kx-OG
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 09:04:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMiXK-002Fio-4k
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 10:04:34 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae45d9f-bab6-0a2a0a5309dd-0a2a450ce400-12
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:04:33 +0100
Received: from [52.101.229.108]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae45d9d-f479-0a2a450c0019-3465e56cc751-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:04:32 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TY3P286MB3793.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:40d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:04:26 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 09:04:26 +0000
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
 b=oIaZfOaBAsS+AqkAa5yDtMcCCUs8+OheF8qAb+mlcZng1hlFmKL9TTijLHTHKr801GkmqIa/ArkZt/NLjRVqi4yB7OMl3ofgndp0i4v3bskjk7iBoD22pD0O/Kdt5WXNCdnBxAB7Wvx+xJnMjO1m/Ijw8ltnZFSXnAZInYOCIO+e4uVxJ3Af+gYiI4IYf9Ol6wINcrbQGyEA6BOpSaBP8lX6+zOeTbRIJbUrVRC7O0G4F+NdMCPjmrQl/MsM8/kaowQWZRqKGFTkMOPJ2Dfha6YL5QYqoqYuPe4POowW9HiIXP7dtxEKeKeUHA7F0t6DKavGsEwPc0oSCen4tyU8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcFToYh5/jqGF0J4/az2j2kmka+Rz9WiaE5C3TEsFVA=;
 b=ja+Uf05K2toArHVTjREqZ3sLea9CTnTW+Z6+j2GZBmQndQHtxaLoWYTLksInpAkdSyNIfER/oNJHEuati/RJsv71tx+b9lGrxVW05UuaxI3NrCuvZi5t4GLu+Xo0a7O7IbXgcyYtnMxlSGqWagjD3gRB+dVK5ZbY+wc2B7ZVy8G8fdFFQhFyJ7HWUZdaWdXHZEfJpZWEpNYPT6n/H0SV7DIDUWQZEcRM4yw7DGQUHKF9wGHnyDg58RG0KxoYifLeheATlttmBEk2KCzMpum/ztdgXcn2GCwLCUCuSQ37cvutKIlACkoEzrt0aOVHEhpM7X7OA4aPsFij+gXdOxGv5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcFToYh5/jqGF0J4/az2j2kmka+Rz9WiaE5C3TEsFVA=;
 b=BTxUUOoJS6PHCyFRTMqBPcbVD7mbsx8jw2KU1Df9ZY2Y0dFbLxngoqB7Cs3IMFjZaix5osJeu8eNri5g5qsyZEi7tdUnUl87PNZrTt9FWS226xVXNwefCTrjhjlRcKlW8IeAy0IHKXjizOtzRrEA3KnEAKRD8R5UpGrBbq5qrz0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: bernhard.kaindl@citrix.com
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	sstabellini@kernel.org,
	takakura@valinux.co.jp,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC 4/5] xen/tracing: Add a function tracer
Date: Fri, 30 Oct 2026 18:02:58 +0900
Message-Id: <20261030090258.125062-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179285185778.1706038.7602957469449476344.b4-review@b4>
References: <179285185778.1706038.7602957469449476344.b4-review@b4>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::12) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TY3P286MB3793:EE_
X-MS-Office365-Filtering-Correlation-Id: 5edd6344-ccae-4343-cd2c-08df3664cc82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022075727099003|10067099003|261022105027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	G6vkvINLWrAi8aJSj3F6j856M9mcKNEUeWGkV1/FQb9o5ugPyNhu8NH1B4/2eOgRQlOhtpfD14C/gkWSgCHiWTtlcGVc5carkLZArjlKgNywAAFpfpL2tzNfSQ38gtLmOlft859YBHSw9Ecamz/bdWRxKoelIm8c7Z5XcRX51Vb4TXUXa99+u9Lo05RCJLsV6YFZDqWcIiNHkBJcKEL3mOY3dDx0pEwY5mgLE2jw0FkIe0PkL4j0YGqTsQHFoAbnVNROkurgZC4Ek7YH+yFSnLzwKqPFQidI+rEQjiU/WLlkRev2W7OvXzltDQ8dnW9MrnudAuX83NclIXKE+0rXU2wXPLG89C1C2fFD6xDvqNxEKFFqCntV5vSXDBox2Av/z4/8o+XrJZCJ4w+yuHl34qpwbB/wU33usb+uNJMy5MZendNT9WaLZ+8i8OYgZpdoqlxKjoiRAT9uqWTPn5jwVD+hjZDNxXgv69rYwTmDgmePMERxtBfrsQm73p5ArXiVDFIKT4xiBDBUygqny6cgl3hjBSPYnfOyqeLuP8l/aMX1LTFy4FucfC26/f+ELD6OZ6rDztzAwDG9k1nslZzjKdlpxhkFV7KEtRvoDWQzatszkCm5DDnHQ3QDlqXjAvNn0ayktkuT7h9Osn0Q9mKm1YK1gwhSt2lt9++dT6sLm1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(10067099003)(261022105027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W1VCO0LOVRoLP561jrDVXnaywLkVp9YJ1yMYULwuqUKgm2qEuJo+Sm6Fezn8?=
 =?us-ascii?Q?ukACmZKgoCsnOuLVLRk+E4PdiPgv8y1lSMLBansDPLo6qT60iCXeDj6nLUn+?=
 =?us-ascii?Q?DRM3/JCKniA8Ru40huz88PhSNXcl8sGY1nJzhvo8Lwm4HPfj5uMMkyEOpCJf?=
 =?us-ascii?Q?auTl1XxJ4B6lnmMqYOiqqyq79z9R24p7I0vJegGeQzRq6JsyRkcflZ5ByVl+?=
 =?us-ascii?Q?4pG4HQ9Pbw6z94/WW3Nst4fvCt7/inAEkMyNAnFLNqxf99liIqks5GQMJ6sV?=
 =?us-ascii?Q?uqz04peuNQ7qEpgL6NRBPMZ+Yh47CYj7rRg/jthDx5ZIEGQw57owT/UxDLoW?=
 =?us-ascii?Q?110KKGg2LDGn2SzmLRMbhnBMZUrlVZDAnephaT5CLcARAg4ramiglcb7BdCC?=
 =?us-ascii?Q?BjFVMvxKuDp5PiXMNlHmRr0bIg6YZb1KQ0+m5V6kmljKU+H62HkULnRo1dFP?=
 =?us-ascii?Q?vQL/h+hgkkN4h4Lr8fNEH28hybLRAYsysYSIxD26wLMCDy3nwpPRi3tK7mEA?=
 =?us-ascii?Q?0e3JTSgHiQjwG2QWPbcm6A6CzKPoWC/8E2uk5h2Vv93it4lSim9Irp51cO6E?=
 =?us-ascii?Q?ga7ykHQrjCYWyOOTMtZZ+lVJpl4s4I8Znq8cVIg4pSF+6+a7Z907rNzK593s?=
 =?us-ascii?Q?z2KMtoOkzj3VQQv/1sZ7ILcqE/r9N29jDGPlcx2CXNMaVehogs+RLRsw8vpD?=
 =?us-ascii?Q?Y4z2/SqZEF2cPyLjCCSC8j05kGN+Phu1hF3kU1A58RGv22LtY/7tpxUYErXd?=
 =?us-ascii?Q?MmK1KX/lqYNqmiwJvQpYu2IK4Y5tGWf4BqZyh0otTHeCPYKIWjlZIRgx2pJb?=
 =?us-ascii?Q?hUuUZtZWTveJ/rB0aDkpR+mHRzabC37IM8WFWGjmcobeeatHOg9HwLv/za+H?=
 =?us-ascii?Q?gobkdiuSW5FnkmPVi+Ji3Z+b5ddziyI5iNhuUmbnqOLYTx70PT+RrsvEgeD8?=
 =?us-ascii?Q?CrCMGqc3X7WuW7k02InFIUocyIs17i+EoVIalnVEhwSoWiz294T7lZkBFzMx?=
 =?us-ascii?Q?kNFCbmfNt9Nc8G+ELK01Ji8cjPJvhabDUbO8vtkP/9IcU3sPidy1vc7UijMd?=
 =?us-ascii?Q?Z4dlUSi7cZmH79lbAoqCxe5xVRCdbn1AlCIAqB3UQ1Q9Lo9zwVGGZw3mne4c?=
 =?us-ascii?Q?QIAMaTwIaBinjxqgeL6toH3XbNArkZ99watIGQ4yU2B8Rhs1ZR3Ew5KVfLB5?=
 =?us-ascii?Q?A5YO/dDL/9Nmvn2cqvKztrSzwK1kPsc2wzBS0U4surzj+Kw4kCPqUxvYAMo3?=
 =?us-ascii?Q?ZQITC29SFUtZNDaLXa77bXCv4dc97SoDkgmREu9+jO5ZiFvOyKEpXpWApMKN?=
 =?us-ascii?Q?gieWTL/Fv9lZEb3iJ4uWTuFDAM1C2+00WYsiN/ZRyEx2xR9mhB/nxssEwwCM?=
 =?us-ascii?Q?b+p6C179Hgk3ooAuER9FvGccNHk4idQrdU5URLNRrtScVr7/ftpSFGqmO+Ct?=
 =?us-ascii?Q?Cq9HATucmjVc+w4anmfzbcIY/CKdLqo2SYmQofGyAlCDZYLfrU4Fjayce38F?=
 =?us-ascii?Q?vdp5CiU3qUfklLruYA7fOc87CMpsdtObjZFE90PCyZRhYG937k+jazisp2cD?=
 =?us-ascii?Q?0l+NUsBwOz0rBWmwlot9QCU89W4VcenjioJJy4U9i1gvQMxYFzj2fVYWfK5B?=
 =?us-ascii?Q?ci+g2qdBbaIVjBzWl/poLKAnlEKSqnL3Gpgq5l45B0tyHpxPE7wg2ajr6dcZ?=
 =?us-ascii?Q?UiWD6ZnfiGMJ4YNGjVoAleIfSftCB4oyay27RL8not6rBysLZTyJmEw7efu3?=
 =?us-ascii?Q?2f1VhId2vg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edd6344-ccae-4343-cd2c-08df3664cc82
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:04:26.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4rmmjIe5zngt0cczmxKM0vk1LBdVmL+xqZxOdHqYoLGBnBE66FAJWAfmTzW6wiF/aTdmaVlp06rQXK0k/nfmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3793
X-purgate-ID: tlsNG-d25034/1793351072-5093EA5B-71B642D3/0/0
X-purgate-type: clean
X-purgate-size: 6678
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026 16:24:17 +0200, Bernhard Kaindl wrote:
>> --- /dev/null
>> +++ b/xen/common/function_trace.c
>> @@ -0,0 +1,274 @@
>> +    if ( this_cpu(function_trace_recursing) )
>> +        return;
>> +
>> +    this_cpu(function_trace_recursing) = true;
>> +
>> +    buf = &this_cpu(function_trace_buffer);
>> +    rec = &buf->records[buf->head];
>> [...]
>> +    buf->head = (buf->head + 1) % FUNCTION_TRACE_BUFSIZE;
>> +    buf->written++;
>> +
>> +    this_cpu(function_trace_recursing) = false;
>
>What ensures that a callback which has already passed the dispatcher's
>tracing_on check has finished before another CPU reads or clears its
>buffer? The tracer registration does not appear to provide a stop hook:

There is currently no such synchronization in either hypfs_trace.c
or function_trace.c.

>> --- /dev/null
>> +++ b/xen/common/function_trace.c
>> @@ -0,0 +1,274 @@
>> +static struct tracer function_tracer = {
>> +    .name = "function",
>> +    .init = function_tracer_init,
>> +    .reset = function_tracer_reset,
>> +    .clear_trace = function_tracer_clear,
>> +    .get_trace_size = function_tracer_get_trace_size,
>> +    .print_trace = function_tracer_print_trace,
>> +};
>
>For reference, tracing_set_on() in xen/common/hypfs_trace.c, introduced
>by the preceding patch, disables recording with:
>
>>         if ( tracer->stop )
>>             rc = tracer->stop(&global_trace);
>>     }
>>
>>     if ( !rc )
>>         global_trace.tracing_on = on;
>
>Could an already admitted callback still hold a record slot when this
>clear resets its CPU's counters?

I see. Yes, the callback can still be running.

>> --- /dev/null
>> +++ b/xen/common/function_trace.c
>> @@ -0,0 +1,274 @@
>> +static int cf_check function_tracer_clear(struct trace_context *tr)
>> +{
>> +    struct function_trace_cpu_buffer *buf;
>> +    unsigned int cpu;
>> +
>> +    for_each_online_cpu ( cpu )
>> +    {
>> +        buf = &per_cpu(function_trace_buffer, cpu);
>> +        buf->head = 0;
>> +        buf->written = 0;
>> +    }
>
>If that callback then finishes writing its old slot and updates head
>and written, could the reset counters describe a different slot from
>the one just filled? Could the print path likewise observe a partially
>written record?

Yes, I think both can happen.

>The per-CPU recursion flag seems useful for nesting,
>but wouldn't it leave these remote accesses unsynchronized?

Yes, I added the flag only to prevent nesting.
It does not solve the issues you raised.

>Would a stop-and-drain protocol shared with callback removal let read,
>clear, and reset operate only once the buffers are stable?

Yes, I think extendeding the RCU read-side region which you
suggested in your feedback to the patch 3/5 can be used here as well.
I'll make sure callbacks are drained both when stopping tracing
and when removing the callback.

>There also seems to be a size-check consequence of a late writer:
>
>> --- /dev/null
>> +++ b/xen/common/function_trace.c
>> @@ -0,0 +1,274 @@
>> +    for_each_online_cpu ( cpu )
>> +    {
>> +        buf = &per_cpu(function_trace_buffer, cpu);
>> +        count = min(buf->written, (uint64_t)FUNCTION_TRACE_BUFSIZE);
>> +        size += count * FUNCTION_TRACE_RECORD_TEXT_SIZE;
>> +    }
>
>The existing hypfs_read() in xen/common/hypfs.c calculates the size and
>checks the guest-provided length before calling the reader:
>
>>     unsigned int size = entry->funcs->getsize(entry);
>> [...]
>>     ret = -ENOBUFS;
>>     if ( ulen < size + sizeof(e) )
>>         goto out;
>>
>>     guest_handle_add_offset(uaddr, sizeof(e));
>>
>>     ret = entry->funcs->read(entry, uaddr);
>
>The trace_read() callback in xen/common/hypfs_trace.c then samples the
>tracer size again, allocates that size, and later copies that amount:
>
>>     size = tracer->get_trace_size(&global_trace);
>> [...]
>>     buf = xzalloc_array(char, size);
>> [...]
>>     if ( copy_to_guest(uaddr, buf, size) )
>>         rc = -EFAULT;
>
>If a final callback increases written between these two size samples,
>while the ring is not yet full, could the second size exceed the length
>already checked for the request? Would an owned snapshot, or a shared
>stable-size protocol, keep the checked length and copy consistent?

Thank you for detailing the issue and the possible solution.
Yes, the second size could exceed the first size.
And to keep the size consistent, I'll make it to keep a snapshot
following your suggestion in the next version.

>Could the snapshot also use a stable CPU set? The sizing, clearing, and
>iterator construction each traverse for_each_online_cpu(), and the
>iterator retains buffer pointers while producing the output:
>
>xen/common/function_trace.c:
>> @@ -0,0 +1,274 @@
>> +    for_each_online_cpu ( cpu )
>> +    {
>> +        const struct function_trace_cpu_buffer *cbuf = &per_cpu(function_trace_buffer, cpu);
>> +        struct buffer_iterator *iter = &iters[nr_iters++];
>> +
>> +        iter->buffer = cbuf;
>> +        iter->count = min(cbuf->written, (uint64_t)FUNCTION_TRACE_BUFSIZE);
>> +        iter->start = cbuf->written >= FUNCTION_TRACE_BUFSIZE ? cbuf->head : 0;
>
>For reference, get_cpu_maps() in xen/common/cpu.c uses the CPU-hotplug
>lock rather than the HypFS lock:
>
>> bool get_cpu_maps(void)
>> {
>>     return read_trylock(&cpu_add_remove_lock);
>> }
>
>Would it make sense to pin the relevant CPU set while taking a snapshot,
>and use that same snapshot for sizing and rendering?

Yes, it makes sense.

>What should happen
>to records on a parked offline CPU? Could clearing only online buffers
>allow its old records to reappear when that CPU comes online again?

I see.
I'll make the buffers to be clear based on cpu_present_map.
I think this should prevent old records from reappearing
when a CPU comes online again.

>It looks like there is a design question of the stop-and-snapshot contract
>to drain callbacks safely in their permitted contexts and preserve
>one snapshot across HypFS's size check and copy. Locking each traversal
>separately would still leave the gap between the two size samples.

Understood. I'll make sure callbacks get drained, and keep a snapshot
that can be used for both sizing and copying.

>Thanks for checking these interactions. Is there an existing mechanism
>that already keeps the buffers and CPU set stable across these steps?

Thank you for your feedback. They are currently missing.
I'll make sure they get fixed in the next version.

Sincerely,
Ryo Takakura

