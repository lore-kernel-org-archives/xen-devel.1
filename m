Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23211606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cortex-media.de header.i=@cortex-media.de header.a=rsa-sha256 header.s=20250930 header.b=kN+4z15I
Received: from list by lists.xenproject.org with outflank-mailman.1461442.1672449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLM0F-000740-2B; Mon, 26 Oct 2026 14:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461442.1672449; Mon, 26 Oct 2026 14:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLM0E-00073t-Vo; Mon, 26 Oct 2026 14:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1461442;
 Mon, 26 Oct 2026 14:48:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pd@cortex-media.de>) id 1xLM0C-00073n-LH
 for xen-devel@lists.xen.org; Mon, 26 Oct 2026 14:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLM0B-0065Za-ME
 for xen-devel@lists.xen.org; Mon, 26 Oct 2026 15:48:43 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pd@cortex-media.de>)
 id 6adf6846-e002-0a2a0a5209dd-0a2a4507ed84-22
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 15:48:43 +0100
Received: from [136.243.217.222] (helo=mail.cortex-media.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pd@cortex-media.de>)
 id 6adf684b-b4ea-0a2a45070019-88f3d9deb668-3
 for <xen-devel@lists.xen.org>; Mon, 26 Oct 2026 15:48:43 +0100
Received: by mail.cortex-media.de (Postfix) id 21D7838C02F;
 Mon, 26 Oct 2026 15:48:42 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20250930 header.d=cortex-media.de header.i="@cortex-media.de" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cortex-media.de;
	s=20250930; t=1793026123;
	bh=9x1YqTvOf8CN380pGUIOysGSQJKE8dA8qzqMb1mNDME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kN+4z15I5D0acYTxmpmmWd/ENm4spU8+1ES4MvL7bQySEEqkPx2PqL430KeK8viC2
	 On23cql3WRq5eDOY/ie1aJCePy3g7n9MfVBsKBp8IxZEo+gbqKVlkPtj8QdT6l5NkY
	 ZCm92F024Yk+g51wQP4qm4E5v/bm5Dm4DcgfnreZ3m2P1XuYCS6Mmt3LyQ2FZozyPb
	 MfvrPZjmcK5bQLs30xNbwYf9HMUe1s9yKq0VjcEG94fcomxPFd8mdvtlj/D4cscXPW
	 Jj5FxX1izDbO3a3SI2O97UhnFWyHXrvx35Dp8M3o2DI4cM36I2LjdS7S6bKvB8TG86
	 kXJdU3k0QQj3w==
Message-ID: <8138ed44-727f-45bc-9673-9684e922595b@cortex-media.de>
Date: Mon, 26 Oct 2026 15:48:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
 <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
 <b35c6a2f-753c-4691-aa9f-f67f2f7f37ef@cortex-media.de>
 <eff24ce3-bb48-4d2b-993c-65974d3af00e@cortex-media.de>
 <ad48ac1c-176d-407f-87e1-ae303e8eb195@suse.com>
From: Peter Deggendorfer <pd@cortex-media.de>
In-Reply-To: <ad48ac1c-176d-407f-87e1-ae303e8eb195@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793026123-370DDAE4-07F399A8/0/0
X-purgate-type: clean
X-purgate-size: 10091
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 26.10.2026 um 11:53 schrieb Jan Beulich:
> On 25.10.2026 13:32, Peter Deggendorfer wrote:
>>> Hi Andrew,
>>>
>>> Thanks a lot for the quick response.
>>>
>>>
>>>> On 23/10/2026 8:32 am, Peter Deggendorfer wrote:
>>>>> Hey Xen Team,
>>>>>
>>>>> I'm hitting a reproducible hypervisor panic in the AMD non-fatal MCE
>>>>> polling path on a Ryzen 9 5950X (Zen 3). Eight occurrences since
>>>>> 2026-09-09, between 12 hours and 2 weeks apart, always CPU 2.
>>>>>
>>>>> Environment
>>>>> -----------
>>>>> Xen:   4.20.4-pre (Debian 4.20.3+127-gc42374a105-0+deb13u1), and still
>>>>>          present in 4.20.5-pre (Debian 4.20.4+39-gf1e1321c87-0+deb13u1)
>>>>> dom0:  Linux 6.12.111+deb13-amd64 (Debian trixie), PV, 32 vCPUs
>>>>> CPU:   AMD Family 25 (0x19) Model 33 (0x21) Stepping 2, Ryzen 9 5950X,
>>>>>          microcode 0x0a201210
>>>>> Cmdline: dom0_mem=4096M,max:4096M ucode=scan console_timestamps=datems
>>>>>
>>>>> The panic
>>>>> ---------
>>>>> (XEN) [2026-10-19 08:58:18.727] Xen BUG at
>>>>> arch/x86/cpu/mcheck/mce_amd.c:100
>>>>> (XEN) CPU:    2
>>>>> (XEN) RIP:    e008:[<ffff82d04028a650>]
>>>>> mce_amd.c#mc_ec2type.part.0+0/0x10
>>>>> (XEN) rbx: 0000000000000445   r12: 0000000000000011   r15:
>>>>> 0000000000000446
>>>>> (XEN) Xen code around <ffff82d04028a650>:
>>>>> (XEN)  90 90 90 90 90 90 90 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90
>>>>> 90 90
>>>>> (XEN) Xen call trace:
>>>>> (XEN)    [<ffff82d04028a650>] R mce_amd.c#mc_ec2type.part.0+0/0x10
>>>>> (XEN)    [<ffff82d04028a699>] S mc_amd_recoverable_scan+0x39/0x40
>>>>> (XEN)    [<ffff82d04028cfdd>] S mcheck_mca_logout+0x42d/0x840
>>>>> (XEN)    [<ffff82d04028a35c>] S
>>>>> amd_nonfatal.c#mce_amd_checkregs+0x1c/0x100
>>>>> (XEN)    [<ffff82d040240e8c>] S smp_call_function_interrupt+0x4c/0x90
>>>>> (XEN)    [<ffff82d0403123d5>] S do_IRQ+0x2a5/0x650
>>>>> (XEN)    [<ffff82d040201915>] S common_interrupt+0x135/0x150
>>>>> (XEN)    [<ffff82d0402883ca>] S
>>>>> cpu_idle.c#acpi_idle_do_entry+0x8a/0x140
>>>>> (XEN)    [<ffff82d0402887cf>] S
>>>>> cpu_idle.c#acpi_processor_idle+0x1ef/0x650
>>>>> (XEN)    [<ffff82d040302cf1>] S domain.c#idle_loop+0xc1/0x130
>>>>> (XEN) Panic on CPU 2
>>>>>
>>>>> The outlined mc_ec2type.part.0 contains nothing but the ud2, so this is
>>>>> the "unreachable" default branch of mc_ec2type() -- the extended error
>>>>> code matches none of MC_EC_TLB_TYPE, MC_EC_MEM_TYPE, MC_EC_BUS_TYPE.
>>>> I think it's safe to just drop the BUG().
>>>>
>>>> That code is literally worse than useless, because if nothing else it's
>>>> just hiding the diagnostics.
>>>>
>>>> I guess it means AMD have added new statuses.
>>>>
>>>>> Across the eight occurrences, r12 appears to be the bank index from the
>>>>> loop in mcheck_mca_logout(), with rbx == 0x401 + 4 * r12 (MCi_STATUS)
>>>>> and r15 == rbx + 1. Three different banks are involved: 10, 17 and 23.
>>>>>
>>>>> Not a hardware defect
>>>>> ---------------------
>>>>> - Started within days of upgrading two hosts from Debian bookworm
>>>>>     (Xen 4.17) to trixie (Xen 4.20). They had run 3 years on 4.17
>>>>> with no
>>>>>     incident.
>>>>> - Three different banks, so not a single failing block.
>>>>> - Updating to the current Debian package (4.20.5-pre, built 2026-10-16)
>>>>>     changed nothing.
>>>>>
>>>>> Possibly related: 532988dccc19 ("x86/mcheck: fix mca_allbanks
>>>>> updating").
>>>>>
>>>>> Also possibly related on the Linux side: 0422b07bc4c2 ("x86/mce/amd:
>>>>> Filter bogus hardware errors on Zen3 clients"), where bogus MCA values
>>>>> on Zen 3 are filtered rather than treated as errors.
>>>>> https://ratatoskr.run/stable/2026/04/7143905
>>>>   From above, you're on a Vermeer, not a Cezanne, so I don't think that
>>>> Linux patch is relevant.
>>>>
>>>> However, your observation about "fix mca_allbanks updating" quite
>>>> possibly is.  That was backported into Xen 4.20.1 as 247b708b1400a, and
>>>> Debian has 4.20.3
>>>>
>>>> Are you able to experiment with that patch reverted?
>>>>
>>>> Alternatively, are you able to experiment with the BUG() removed?
>>> I went with dropping the BUG() rather than the revert.
>>> Reverting 247b708b1400a should stop any bank from being read at
>>> all, which is effectively what mce=false already does here, so I don't
>>> expect it to tell us anything new. I'll run it too if you'd like.
>>>
>>> I'm not familiar with the Xen codebase, but I've built a package with
>>> mc_ec2type() changed to:
>>>
>>>      if ( errorcode & MC_EC_TLB_TYPE )
>>>          return MC_EC_TLB_TYPE;
>>>
>>>      printk(XENLOG_WARNING "MCE: unknown AMD error code %#x\n",
>>> errorcode);
>>>
>>>      return 0;
>>>
>>>
>>> Crashes have been 12 hours to 2 weeks apart, so it may take a while
>>> before I can report back.
>> After ~31 hours of uptime:
>>
>> (XEN) [2026-10-25 04:06:27.260] MCE: unknown AMD error code 0
>>
>> No panic, no wedged CPU, no RCU stalls, no hung guests. Host and all
>> VMs running normally.
>>
>>
>> I also dumped /dev/mcelog in dom0 and got the following records:
>>
>> 00000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000020: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000030: 0000 0000 0000 0000 0200 0000 0000 0000  ................
>> 00000040: 0010 0201 0200 0000 0000 0000 0200 0000  ................
>> 00000050: 1c01 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 00000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>> 000000a0: 0000 0000 0000 0000 0200 0000 0000 0000  ................
>> 000000b0: 0017 0201 0200 0000 0000 0000 0200 0000  ................
>> 000000c0: 1c01 0000 0000 0000 0000 0000 0000 0000  ................
>> 000000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
>>
>>
>>>
>>>>> Diagnostics / workaround
>>>>> ------------------------
>>>>> mce_verbosity=verbose yields nothing useful.
>>>>> max_cstate=1 made no difference. mce=false is the only thing that stops
>>>>> it, and it is what I'm running now.
>>>> The fact that mce=false isn't causing machine resets means it's clearly
>>>> something the hardware thinks isn't fatal.
>>>>
>>>> But, I am concerned by the fact it's always on CPU 2, and multiple
>>>> banks.  Is this true for both systems?
>>> To clarify one thing from my report: it is actually a single host whose
>>> complete hardware (board, CPU, RAM) was replaced on
>>> 2026-10-07, keeping only the disks and thus the installation. The
>>> crashes happened both before and after that swap. 10 more hosts
>>> with same hardware still run on bookworm (xen 4.17) for years now
>>> without any incidents.
>>>
>>> So yes, always CPU 2. The bank index varies: on the current hardware
>>> I have seen banks 23, 17 and 10 across four crashes, and banks 23 and
>>> 17 on the previous hardware.
>> Regarding the output of /dev/mcelog: if my decoding is right, three
>> things stand out. MCi_STATUS is zero, i.e. these banks are reporting
>> nothing at all -- no error, no garbage value.
> Well, things can't quite be that way: If MCi_STATUS was zero, the first
> check in mc_amd_recoverable_scan() would prevent mc_ec2type() from
> being reached in the first place. Its caller also checks MCi_STATUS_VAL
> to be set.
>
> What I find puzzling is this:
>
>      errorcode = status & (MCi_STATUS_MCA | MCi_STATUS_MSEC);
>      ectype = mc_ec2type(errorcode);
>
> With errorcode (and mc_ec2type()'s parameter type) being uint16_t, what
> use is it to include MCi_STATUS_MSEC in the mask? (Yet that's likely
> unrelated to the issue at hand.) Considering how mc_ec2type() works, I
> see no reason why status couldn't be passed to it directly (with the
> parameter type widened to uint32_t). Then the BUG() there could perhaps
> become BUG_ON(errorcode).

You're right, my conclusion was wrong.

One more data point, from an hour ago:

(XEN) [2026-10-26 13:13:42.050] MCE: unknown AMD error code 0x1000

So it isn't always 0. The uint16_t truncation might explain the first
(MSEC bits dropped), but 0x1000 is a non-zero code that still matches
none of MC_EC_BUS_TYPE / MC_EC_MEM_TYPE / MC_EC_TLB_TYPE.

/dev/mcelog right afterwards showed three records, banks 17, 14 and 16,
all CPU 2 (status zero, as above). Banks seen so far across panics and
log lines: 10, 14, 16, 17, 23.

With the BUG() dropped, the host has now logged this twice with no
panic, no wedged CPU and no hung guests. Everything is running
normally.

Regarding passing status as uint32_t and BUG_ON(errorcode): with
today's 0x1000, bits 0-31 are non-zero but none of the type bits is
set, so that BUG_ON would still trigger. So unless 0x1000 is a known
type that mc_ec2type() should handle, I think the poller shouldn't BUG
on an unclassifiable code at all.


>> Both records are again
>> from CPU 2, and bank 23 is one of the banks that appeared in the
>> panics, bank 16 is new.
> Isn't it possible that the lack of 532988dccc19 ("x86/mcheck: fix
> mca_allbanks updating") simply hid the issue previously?

That is exactly what I suspect. This host, and 10 more with identical
hardware, ran for years on Xen 4.17 without a single incident. The
first panic came within days of upgrading this one to 4.20; the others
are still on 4.17 and still fine. If no bank was being collected
before, nothing could have reached mc_ec2type() -- so the condition
may well have been there the whole time, just never looked at.

Would it help if I logged the full MCi_STATUS of the first read, i.e.
in mcheck_mca_logout() right after the MCi_STATUS_VAL check, together
with CPU and bank number?

Peter

