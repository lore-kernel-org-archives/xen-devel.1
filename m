Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CEA606A32D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=RufqMuw4
Received: from list by lists.xenproject.org with outflank-mailman.1469200.1678096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7bV-0002kS-Id; Tue, 03 Nov 2026 06:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469200.1678096; Tue, 03 Nov 2026 06:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7bV-0002kL-FY; Tue, 03 Nov 2026 06:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1469200;
 Tue, 03 Nov 2026 06:02:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xO7bT-0002kF-3S
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 06:02:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO7bS-001Pv3-GQ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 07:02:38 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae978f6-8faa-0a2a0a5109dd-0a2a450be98c-18
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:02:38 +0100
Received: from [52.101.228.119]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae978fa-b7e8-0a2a450b0019-3465e477d854-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:02:37 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYYP286MB6030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:27b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 06:02:31 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:02:31 +0000
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
 b=eFj/BGgNB8l+GoIW/CZAV5rAdU8THbMgovllSGZyDWKWSTXxg5m8LzINf9w0zbJRyHcKiCm4e3Q0UXI/k64H2BgGK+/RvZgRQzrqddlLfQwXNA1ApPGG7Y7ky44FwPuKrCb9HVkWybSoXtcV5RjdqMkydkANmJjtKeqsRRR1r8qiqEvhkYnXImQ3hzKSVWdeEAtDuK0IhL60hNTBCwVf4OxdjoK2kqdMkU/K0WodTTuFVnfcIPaHYBChGhY54fnnHmE2KZ/da5uIXgDzG5OSqOm7H/D+Al81tiR6R4Y7UDxIqYLI3Vjdm6DFylJVbnCU0US4xGRU1l3kAo1uWd6Qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNbOfU7NzuNKzvHBmh/+QSyLAHBq+dv9rlvp07UgFXU=;
 b=k9Bnl5CvUpJCbEQEeMjnQDJYoJSmLmVz884fIrtN1xmNO6x1/KIYrji9DZiKAQLNIzZ7EPkOoOqclVGwT5ILQvYUyugIRAw90ckzSXuEfnlTf4OO2VmTmgIJYOAtN/DYXeUk0EmZc8YwNBZAz+vppRpdHeZI6OmXZwqjeeDJMUAXk5/PaAXPl+8wPFg1SK9jqhfWINWd6fmwkHSiqWUGsXPSHApomdmUXkN6L7pNj7rSyCg7YzY0RQrUTQN3u5VLAAd1/3uI5ErqvGBhOKqDPVUgsY3YwWmGqUFhSQopnNroY+jaxx/gSg0Lyzqy1zNzxzdsa0ooejg0TJlo3wciyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNbOfU7NzuNKzvHBmh/+QSyLAHBq+dv9rlvp07UgFXU=;
 b=RufqMuw4LqeiKKWncEGIyaCBVCMrytLzgkvQ0naql9xoM3/nvl0Szl9bDiKLu7t5GTuaLdqxST+7PtB5qCy1pB0HI2RollLpD2/9l+P1YuTH6h/eLv+rup8hqRJs0OAuUE+p09Z9z2os+4QQUlP3tD3Rou50MmtMHkl5zh5LmI8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: bernhard.kaindl@citrix.com
Cc: Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	bertrand.marquis@arm.com,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	takakura@valinux.co.jp,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
Date: Tue,  3 Nov 2026 15:02:07 +0900
Message-Id: <20261103060207.104162-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179285259082.1706038.15527286146285697701.b4-review@b4>
References: <179285259082.1706038.15527286146285697701.b4-review@b4>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS7PR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::14) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYYP286MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9f0a5c-7bdf-4edc-f32c-08df39700c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|13003099007|261021135927099003|56012099006|261026130827099003|261021133027099003|261021130227099003|261026135527099003|261022075727099003|261026121527099003|261021121427099003|261026140227099003|261022115727099003|261022105027099003|261022113327099003|261028144727099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	QOL8ycIu+oI4XDzYOiEPurU4qBPE17y8xlwQMXIxAz1fIDsbKoXBP5QAwllxMVKP6usa6gyeJ2opi1N+gk/LHKn49jvnCcOw0nTwTYnjjZq/IvobIe7z8V3f/8BVn0r0ohFR723fRZWn8xRS5LoejZeG1YabPM8gSyJ/gykeKZ2jtKbErtczm7PjSIAuLqv5dBI2HwJOAyHr+AswHUUwDb30iOEO02Ggi0Ux79Dr1Q3E0cPxMHeyRjUUlosBUx4Yd8RIa7ur+qMjthOwMsVJ3UzExoATI1TZ4Xy9RH56IjIJGcQwR+Xcw7dujItqyrDsIiy0GUgrrSE6R200z6IK9NLE6UDCqZ0pN95G15INdT99uCEifYHwd3cNYX1AdW40tg9gIhsPMWfgf37BEBivMuRxBsvft/WE1IKoG4AzlRInQSlhlxUKsc1qoAYnExi3ZD+q4SEPt/72vCig3zlU1hP10gPHR12kp0NtQDVvY4qn94jOutR4T6/bIFXL99nRg1ULKYukUMOXjLRBR3n0oFkL9r/46JxL4WcA9NSe1ykrHqvP239+0EBAZpEbbXk5xnMj22FNsv5rRO97qmzqxf6xsKPV+52LOe1+N2A777DtU9mmFSazGlZLC4IJsoMJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(13003099007)(261021135927099003)(56012099006)(261026130827099003)(261021133027099003)(261021130227099003)(261026135527099003)(261022075727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022115727099003)(261022105027099003)(261022113327099003)(261028144727099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwA9tqzPZnx5DuKwqNTPO1WvyQTjNURMS6Vwg4p0AwLsdlNVa425xSmqleZb?=
 =?us-ascii?Q?hDPogbUJm98D7xazoOH95H9m6OTajaZD2UrraOIxrZC6zxlw6PaSFqvUE0a/?=
 =?us-ascii?Q?bNgooZdWeo7EuRkdvIC3BumU//JprYs2E8lTgKtnv+DeiyLOS6+revBqJxaE?=
 =?us-ascii?Q?WhM/KshQxAA0o523Lx4EMjda4oy+6Ahc+/l87FXw+WXH/aHGxAHwvBo3s6gN?=
 =?us-ascii?Q?QJVVWtMw7maetJH2b0oEYevjnb2jqKWg+cMw3nBRvkQBavYtgxJE/JJYiGDE?=
 =?us-ascii?Q?023Mm8/rYHqIrHozWem8nu7fQvnynPFJ9EBcN/jex6JrR3+aGWS2iU4t1KFR?=
 =?us-ascii?Q?1Bk5rnVRR12wmDV9hQ4UxQl0B2Km66eOIZu/hXr30uLWY946EiSdkK1sVLP9?=
 =?us-ascii?Q?AZshSUAvJprlH2sTHTGk7sg5RvJMLMw8aMKDNwjt0amKMJ082XK0yoHUNQT7?=
 =?us-ascii?Q?U55Phjg/QfCH4qBLdl7OjNB69eojWoAROXE833F1I13yacemFqFvE9VLEuDu?=
 =?us-ascii?Q?CTk8IjYnai8Pc0fZBmJU1UguUBaEdxv9NyVi3qMEfzZxjpc6Rk6Go+TfzFRp?=
 =?us-ascii?Q?JK2hIGZ0JOIIekXMKDFGizcJRCeppduu5viSa6Bd7D50UBs8lib+vslnoYtE?=
 =?us-ascii?Q?mi0T0UdRZ9VLailO9OE+rDk3wUKo9iZhSOKjPrP+PktxqJ264tNeqwaVj6Fy?=
 =?us-ascii?Q?40NgylwXVIYaf1058/3Aq3nA45G8/isMxxrvqAu6Qf2zJWnX8UXMSBjtpDap?=
 =?us-ascii?Q?nFCsLMNJLQEJPcVi9BNq93mXpuI9Xh2sH3YzVrpn7GMB1MUJmj4FyOM/HBkW?=
 =?us-ascii?Q?R16dzP2bVIsaWHkNW0UGWOUETXmJq3GtPANI/hWFpwCmUSWkkShoZ+CE8n5e?=
 =?us-ascii?Q?7ypNUFuCd/3RbP59SH/EYVprIVIrp6BA+BzGOoMy0l7ZsC1LMPS6ApeWnFm3?=
 =?us-ascii?Q?NYwdo7e2rfhJLt5V4TKkZ0x18kL4WBXY9YVTJUSP8Z8gv3Xmn2xODz4FfmFt?=
 =?us-ascii?Q?jn8cCp/p2NliQJ1RGP72Nat/E1SOM0QQGz1V9aO07TlBVbGcTCB1EluqzyLd?=
 =?us-ascii?Q?dFAw8144N0uYRaL0axZxlAUUQ8GNYf/jjbkICFzQNZUpokCgCuAFBMxyLH0x?=
 =?us-ascii?Q?w4LpRfezGCwCFGOf5ymPEhnKo25cy0eC9V+3vCTQKGZy/jhl9UV0C0AnkAb+?=
 =?us-ascii?Q?xj4AVYZmu4WyuIf7v8vJNYFmWElt3s8IOJLh7y797eB8YS59p0bySRO7KTEA?=
 =?us-ascii?Q?FyB7P2tpPeCzx+GhrATQ6eDWw+bChQIqGjG1I8Ip7wguuycQJ9xIOK9wE5M8?=
 =?us-ascii?Q?eg/SRebQPhHPgFqoX2L3EBuHgX3uN0Oet226zG7uTgHn5M3m5ylYa9vu4ULK?=
 =?us-ascii?Q?5wV5wWrmYZLlH/zCwUZGPv0V4M4H4db8hEQxRQxYHAVKojg2zbYwHsziBa+R?=
 =?us-ascii?Q?wpswpuXkAw84NZbkNK2hPAzp5OGTLaURsqxnAQ35xJjWzDrLk3eAa9xgN74R?=
 =?us-ascii?Q?kqHo5R5gMIJ+PTmspONdSJjpuwLVf7htDCbJuyOBT0YzM2KlZ6S8YiBU9+pp?=
 =?us-ascii?Q?kR9fedWPTEX3+A4XvMW+Nvl1FuEBS5ZTN4vSZ+Wha6wvjJ4uJ2rRsDUZNIjz?=
 =?us-ascii?Q?y6Fgy/NwTfDo4nD9vSyWuu2Sni8yAmTyegiPUKGn+xe/4KX5CmbZT/li/IeY?=
 =?us-ascii?Q?8fhOekNE35WnIVDdQ7gUovwVPp45wLb76i63rrVUbiXSCc1NHcIQFZQwX3mn?=
 =?us-ascii?Q?o7iBb0Qybw=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9f0a5c-7bdf-4edc-f32c-08df39700c36
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:02:31.5475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20q7nujg6kvYv7Cv8Y2HUkwN2Hd8yG2Lvah8Jt2Xlrx28QU0LlaNmCjb0qtfawRlw1cryn5W+ZTRinQEyX6xUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB6030
X-purgate-ID: tlsNG-42698a/1793685757-ABED69EA-3E9D5B25/0/0
X-purgate-type: clean
X-purgate-size: 10104
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026 16:36:30, Bernhard Kaindl wrote:
>> --- a/xen/arch/x86/livepatch.c
>> +++ b/xen/arch/x86/livepatch.c
>> @@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
>> +#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
>> +unsigned long arch_livepatch_trace_entry(unsigned long addr)
>> +{
>> +    if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
>> +        addr += ENDBR64_LEN;
>> +
>> +    return addr;
>> +}
>
>Could this helper itself be selected as a tracing target? It appears
>to be an ordinary function in an object compiled with patchable
>entries, and dispatch now calls it before reaching the callback:

Yes, it could.
I missed the function to mark uninstrumentable.

>> --- a/xen/common/hypfs_trace.c
>> +++ b/xen/common/hypfs_trace.c
>> @@ -141,7 +141,7 @@ void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
>> -    if ( (unsigned long)global_trace_func.old_addr != ip )
>> +    if ( arch_livepatch_trace_entry((unsigned long)global_trace_func.old_addr) != ip )
>>          return;
>>
>>      callback = global_trace_func.new_addr;
>
>If the helper is the selected target and recording is enabled, could
>this call enter the trampoline and dispatcher again, which then calls
>the helper again before the recorder's recursion guard is reached?
>What would contain that recursion before Xen runs out of stack?

Yes, it could enter recursion.

>Would excluding the helper from instrumentation on both architectures
>help, together with checking the rest of the pre-callback dispatch
>path? The Arm64 helper introduced here looks relevant too:
>
>> --- a/xen/arch/arm/arm64/livepatch.c
>> +++ b/xen/arch/arm/arm64/livepatch.c
>> @@ -497,6 +497,11 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
>>  #ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
>> +unsigned long arch_livepatch_trace_entry(unsigned long addr)
>> +{
>> +    return addr;
>> +}
>
>To illustrate, I think the helper's compiler-generated tracing entry
>could be excluded with a small change like:
>
>--- a/xen/arch/arm/arm64/livepatch.c
>+++ b/xen/arch/arm/arm64/livepatch.c
>@@ -497,7 +497,8 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
> }
> 
> #ifdef CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY
>-unsigned long arch_livepatch_trace_entry(unsigned long addr)
>+unsigned long __attribute__((patchable_function_entry(0, 0)))
>+arch_livepatch_trace_entry(unsigned long addr)
> {
>     return addr;
> }
>--- a/xen/arch/x86/livepatch.c
>+++ b/xen/arch/x86/livepatch.c
>@@ -370,7 +370,8 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
> }
> 
> #ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
>-unsigned long arch_livepatch_trace_entry(unsigned long addr)
>+unsigned long __attribute__((patchable_function_entry(0, 0)))
>+arch_livepatch_trace_entry(unsigned long addr)
> {
>     if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
>         addr += ENDBR64_LEN;
>
>Would this remove these helpers from the compiler-generated entry
>table, using the same attribute as the dispatcher?

Thank you. Yes, I think this should work.
I'll make sure to mark both functions uninstrumentable.

>It only excludes
>these two functions from compiler instrumentation; it does not provide
>a general recursion guard or audit their callees. Uploaded trace
>payloads would still need trace-site validation to enforce the same
>exclusions, rather than relying only on HypFS's entry-table check.

Understood.

For the former concern on recursion, I'll put a guard covering the dispatcher
following your suggestion:
https://lore.kernel.org/xen-devel/179284608595.1706038.12585790247811677658.b4-review@b4/

For the latter trace-site validation, please see arch_livepatch_verify_entry()
which I propose in the reply to your 1/5 patch feedback:
https://lore.kernel.org/xen-devel/20261026073022.110170-1-takakura@valinux.co.jp/
I'll add the corresponding x86 validation.

>Separately, does the new trampoline need the mitigation-aware RET
>abstraction used elsewhere in Xen?

I see.
Yes, I think it needs to be RET.

>> --- /dev/null
>> +++ b/xen/arch/x86/livepatch-asm.S
>> @@ -0,0 +1,60 @@
>> +        popq    %rax
>> +        popfq
>> +        popq    %rbp
>> +        ret
>> +END(xen_livepatch_trace_caller)
>
>For reference, the existing asm/asm-defns.h, included through
>asm/asm_defns.h, contains:
>
>> #ifdef CONFIG_RETURN_THUNK
>> # define RET jmp __x86_return_thunk
>> #else
>> # define RET ret
>> #endif
>
>With CONFIG_RETURN_THUNK enabled, wouldn't a literal ret here bypass
>the configured return thunk? To illustrate, I think this could be
>addressed with a small change like:
>
>--- a/xen/arch/x86/livepatch-asm.S
>+++ b/xen/arch/x86/livepatch-asm.S
>@@ -56,5 +56,5 @@ FUNC(xen_livepatch_trace_caller)
>         popq    %rax
>         popfq
>         popq    %rbp
>-        ret
>+        RET
> END(xen_livepatch_trace_caller)
>
>Would this preserve the configured return convention with the existing
>include chain?

Yes, I'll fix this in the new version.

>I also wondered about the C stack alignment at the dispatcher call:
>
>> --- /dev/null
>> +++ b/xen/arch/x86/livepatch-asm.S
>> @@ -0,0 +1,60 @@
>> +FUNC(xen_livepatch_trace_caller)
>> +        pushq   %rbp
>> +        movq    %rsp, %rbp
>> +        pushfq
>> +
>> +        /* Preserve general-purpose registers. */
>> +        pushq   %rax
>> +        pushq   %rcx
>> +        pushq   %rdx
>> +        pushq   %rsi
>> +        pushq   %rdi
>> +        pushq   %r8
>> +        pushq   %r9
>> +        pushq   %r10
>> +        pushq   %r11
>> [...]
>> +        movq    8(%rbp), %rdi
>> +        subq    $5, %rdi
>> +        movq    16(%rbp), %rsi
>> +        call    xen_livepatch_trace_dispatcher
>
>For a build using the normal 16-byte C stack boundary, wouldn't the
>traced function enter with RSP eight modulo sixteen? The injected call
>then makes it zero, and these eleven pushes leave it eight immediately
>before calling C, rather than zero. Would that give the dispatcher the
>wrong incoming alignment in such a build?

I see.
I checked it and was working on 8 bytes aligned stack.

>The existing xen/arch/x86/arch.mk makes the reduced boundary conditional:
>
>> # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
>> # this to be overridden elsewhere.
>> $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
>
>Could the trampoline establish the dispatcher's required alignment
>without assuming this reduction is active, and restore the exact
>original stack afterwards? Is there another build constraint which
>rules out the 16-byte case for this feature?

There is no such constraint ruling out the 16-byte case right now.
And I'm thinking of making the trampoline into C function with
the attribute force_align_arg_pointer to make sure the stack is aligned.
Do you think this would work?

About the discussion on making the trampoline into C function,
please see the Andrew's feedback:
https://lore.kernel.org/xen-devel/97d772f1-322f-43f6-a793-fdbba16c7f04@citrix.com/

>Finally, could the x86 entry checks address the same restoration issue
>as the Arm64 path discussed on patch 1?

I see. Yes, I think there is the same issue.

>> --- a/xen/arch/x86/livepatch.c
>> +++ b/xen/arch/x86/livepatch.c
>> @@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
>> +void noinline arch_livepatch_apply_trace(const struct livepatch_func *trace)
>> +{
>> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
>> +    const void *new_addr = xen_livepatch_trace_caller;
>> +    uint8_t insn[ARCH_PATCH_INSN_SIZE];
>> +    int32_t val = new_addr - (site + ARCH_PATCH_INSN_SIZE);
>> +
>> +    insn[0] = 0xe8; /* CALL rel32. */
>> +    memcpy(&insn[1], &val, sizeof(val));
>> +    memcpy(site, insn, sizeof(insn));
>> +}
>> +
>> +void noinline arch_livepatch_revert_trace(const struct livepatch_func *trace)
>> +{
>> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
>> +
>> +    memset(site, 0x90, ARCH_PATCH_INSN_SIZE);
>> +}
>
>The existing arch_livepatch_verify_func() in this file checks the
>replacement space like this; these lines are not added by this patch:
>
>>         uint8_t needed = ARCH_PATCH_INSN_SIZE;
>>
>>         if ( is_endbr64(func->old_addr) || is_endbr64_poison(func->old_addr) )
>>             needed += ENDBR64_LEN;
>>
>>         if ( func->old_size < needed )
>>             return -EINVAL;
>
>ARCH_PATCH_INSN_SIZE is five in asm/livepatch.h. Am I right that this
>checks space but not whether the original bytes are reserved tracing
>NOPs? Could an uploaded .livepatch.traces payload name a sufficiently
>large uninstrumented entry, have real instructions overwritten, and
>then lose them when revert substitutes five NOPs?

Yes, that could happen.

>Would shared trace-site validation for uploaded payloads and HypFS
>requests help establish the original bytes and reject overlapping
>ordinary livepatches? Could the applied offset and restoration state
>also be retained rather than inferred again from a potentially changed
>entry when reverting?

I see, I agree with both.

For the former, I believe it's addressed by my reply to your
patch 1/5 feedback. Please take a look at arch_livepatch_verify_entry().
https://lore.kernel.org/xen-devel/20261026073022.110170-1-takakura@valinux.co.jp/

For the latter, I'll follow the existing arch_livepatch_apply()/revert()'s
save/restore routine in the next version.

>Thanks for taking a look. I may have missed a guard or architecture
>constraint elsewhere, so I'd appreciate your view on these cases.

No, you didn't miss anything. Thank you for pointing them out.

Sincerely,
Ryo Takakura

