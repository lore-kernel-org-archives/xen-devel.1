Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9DA606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 21:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cortex-media.de header.i=@cortex-media.de header.a=rsa-sha256 header.s=20250930 header.b=oeJTHc6x
Received: from list by lists.xenproject.org with outflank-mailman.1459691.1671475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKMUA-0000Ax-MA; Fri, 23 Oct 2026 21:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459691.1671475; Fri, 23 Oct 2026 21:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKMUA-0000Aq-Ij; Fri, 23 Oct 2026 21:07:34 +0000
Received: by outflank-mailman (input) for mailman id 1459691;
 Fri, 23 Oct 2026 21:07:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pd@cortex-media.de>) id 1xKMU8-0000Ak-Kt
 for xen-devel@lists.xen.org; Fri, 23 Oct 2026 21:07:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKMU7-009T51-RV
 for xen-devel@lists.xen.org; Fri, 23 Oct 2026 23:07:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pd@cortex-media.de>)
 id 6adbcc58-2eae-0a2a0a5409dd-0a2a45069a36-26
 for <xen-devel@lists.xen.org>; Fri, 23 Oct 2026 23:07:31 +0200
Received: from [136.243.217.222] (helo=mail.cortex-media.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pd@cortex-media.de>)
 id 6adbcc8e-195a-0a2a45060019-88f3d9dea0d4-3
 for <xen-devel@lists.xen.org>; Fri, 23 Oct 2026 23:07:26 +0200
Received: by mail.cortex-media.de (Postfix) id 0281238C02F;
 Fri, 23 Oct 2026 23:07:25 +0200 (CEST)
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
	s=20250930; t=1792789646;
	bh=I81YkilJDSJzXJyKg6uTKnQGfb5yIohX81B5+L7ihoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oeJTHc6xJS8psZzGXkZ8PpnTt+a1sYuEbgtRSDWE/unquP0jkKg7v3tO1wpYN1bMM
	 ypEPFKdYIBbTnIpEZaefcswAtozM+2qk/AHTI6EC82MLRyP5GuQ5z+Gjzhxc8MdmcN
	 q27v3hhDbx71cY0WIGRhe1Z67CJ+PdxRQ1rBsn58kGeZmoWdwptCdLyHaLihBlyLZL
	 vvGBbnx4pbtKvM8xoSDrWx67do7cdEuMVQGh3fdNy6XWpoIvzmDGkuqzbo3sxRFRBS
	 /bw2ICDn3VxcP2YU3l4pQflqIBWPfxcCpVpmm+iNZfxnURNpYepGnNzOnIbJiYViOn
	 5D5gUN4hib+Yw==
Message-ID: <b35c6a2f-753c-4691-aa9f-f67f2f7f37ef@cortex-media.de>
Date: Fri, 23 Oct 2026 23:07:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <soham.dandapat@amd.com>
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
 <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
From: Peter Deggendorfer <pd@cortex-media.de>
In-Reply-To: <e32a3056-c025-4d89-a494-ad7e8b6e2580@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1792789651-F6A7477B-600F3D03/0/0
X-purgate-type: clean
X-purgate-size: 6453
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Thanks a lot for the quick response.


> On 23/10/2026 8:32 am, Peter Deggendorfer wrote:
>> Hey Xen Team,
>>
>> I'm hitting a reproducible hypervisor panic in the AMD non-fatal MCE
>> polling path on a Ryzen 9 5950X (Zen 3). Eight occurrences since
>> 2026-09-09, between 12 hours and 2 weeks apart, always CPU 2.
>>
>> Environment
>> -----------
>> Xen:   4.20.4-pre (Debian 4.20.3+127-gc42374a105-0+deb13u1), and still
>>         present in 4.20.5-pre (Debian 4.20.4+39-gf1e1321c87-0+deb13u1)
>> dom0:  Linux 6.12.111+deb13-amd64 (Debian trixie), PV, 32 vCPUs
>> CPU:   AMD Family 25 (0x19) Model 33 (0x21) Stepping 2, Ryzen 9 5950X,
>>         microcode 0x0a201210
>> Cmdline: dom0_mem=4096M,max:4096M ucode=scan console_timestamps=datems
>>
>> The panic
>> ---------
>> (XEN) [2026-10-19 08:58:18.727] Xen BUG at
>> arch/x86/cpu/mcheck/mce_amd.c:100
>> (XEN) CPU:    2
>> (XEN) RIP:    e008:[<ffff82d04028a650>]
>> mce_amd.c#mc_ec2type.part.0+0/0x10
>> (XEN) rbx: 0000000000000445   r12: 0000000000000011   r15:
>> 0000000000000446
>> (XEN) Xen code around <ffff82d04028a650>:
>> (XEN)  90 90 90 90 90 90 90 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90
>> 90 90
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04028a650>] R mce_amd.c#mc_ec2type.part.0+0/0x10
>> (XEN)    [<ffff82d04028a699>] S mc_amd_recoverable_scan+0x39/0x40
>> (XEN)    [<ffff82d04028cfdd>] S mcheck_mca_logout+0x42d/0x840
>> (XEN)    [<ffff82d04028a35c>] S
>> amd_nonfatal.c#mce_amd_checkregs+0x1c/0x100
>> (XEN)    [<ffff82d040240e8c>] S smp_call_function_interrupt+0x4c/0x90
>> (XEN)    [<ffff82d0403123d5>] S do_IRQ+0x2a5/0x650
>> (XEN)    [<ffff82d040201915>] S common_interrupt+0x135/0x150
>> (XEN)    [<ffff82d0402883ca>] S cpu_idle.c#acpi_idle_do_entry+0x8a/0x140
>> (XEN)    [<ffff82d0402887cf>] S
>> cpu_idle.c#acpi_processor_idle+0x1ef/0x650
>> (XEN)    [<ffff82d040302cf1>] S domain.c#idle_loop+0xc1/0x130
>> (XEN) Panic on CPU 2
>>
>> The outlined mc_ec2type.part.0 contains nothing but the ud2, so this is
>> the "unreachable" default branch of mc_ec2type() -- the extended error
>> code matches none of MC_EC_TLB_TYPE, MC_EC_MEM_TYPE, MC_EC_BUS_TYPE.
> I think it's safe to just drop the BUG().
>
> That code is literally worse than useless, because if nothing else it's
> just hiding the diagnostics.
>
> I guess it means AMD have added new statuses.
>
>> Across the eight occurrences, r12 appears to be the bank index from the
>> loop in mcheck_mca_logout(), with rbx == 0x401 + 4 * r12 (MCi_STATUS)
>> and r15 == rbx + 1. Three different banks are involved: 10, 17 and 23.
>>
>> Not a hardware defect
>> ---------------------
>> - Started within days of upgrading two hosts from Debian bookworm
>>    (Xen 4.17) to trixie (Xen 4.20). They had run 3 years on 4.17 with no
>>    incident.
>> - Three different banks, so not a single failing block.
>> - Updating to the current Debian package (4.20.5-pre, built 2026-10-16)
>>    changed nothing.
>>
>> Possibly related: 532988dccc19 ("x86/mcheck: fix mca_allbanks
>> updating").
>>
>> Also possibly related on the Linux side: 0422b07bc4c2 ("x86/mce/amd:
>> Filter bogus hardware errors on Zen3 clients"), where bogus MCA values
>> on Zen 3 are filtered rather than treated as errors.
>> https://ratatoskr.run/stable/2026/04/7143905
>  From above, you're on a Vermeer, not a Cezanne, so I don't think that
> Linux patch is relevant.
>
> However, your observation about "fix mca_allbanks updating" quite
> possibly is.  That was backported into Xen 4.20.1 as 247b708b1400a, and
> Debian has 4.20.3
>
> Are you able to experiment with that patch reverted?
>
> Alternatively, are you able to experiment with the BUG() removed?

I went with dropping the BUG() rather than the revert.
Reverting 247b708b1400a should stop any bank from being read at
all, which is effectively what mce=false already does here, so I don't
expect it to tell us anything new. I'll run it too if you'd like.

I'm not familiar with the Xen codebase, but I've built a package with
mc_ec2type() changed to:

     if ( errorcode & MC_EC_TLB_TYPE )
         return MC_EC_TLB_TYPE;

     printk(XENLOG_WARNING "MCE: unknown AMD error code %#x\n", errorcode);

     return 0;


Crashes have been 12 hours to 2 weeks apart, so it may take a while
before I can report back.


>> Diagnostics / workaround
>> ------------------------
>> mce_verbosity=verbose yields nothing useful.
>> max_cstate=1 made no difference. mce=false is the only thing that stops
>> it, and it is what I'm running now.
> The fact that mce=false isn't causing machine resets means it's clearly
> something the hardware thinks isn't fatal.
>
> But, I am concerned by the fact it's always on CPU 2, and multiple
> banks.  Is this true for both systems?

To clarify one thing from my report: it is actually a single host whose
complete hardware (board, CPU, RAM) was replaced on
2026-10-07, keeping only the disks and thus the installation. The
crashes happened both before and after that swap. 10 more hosts
with same hardware still run on bookworm (xen 4.17) for years now
without any incidents.

So yes, always CPU 2. The bank index varies: on the current hardware
I have seen banks 23, 17 and 10 across four crashes, and banks 23 and
17 on the previous hardware.

>> One more thing: the host does not actually reboot after the panic.
>> "Reboot in five seconds" is printed, but the ring buffer continues with
>> normal activity minutes later and the remaining 31 CPUs keep running.
>> CPU 2 stays wedged, and "xl debug-keys t" then hangs. Afterwards dom0
>> and guest vCPUs start losing timer interrupts permanently (RCU stalls
>> with a frozen timer-softirq count while dynticks keeps advancing), so
>> VMs hang silently hours or days later.
> I've recently noticed that crashing with interrupts off doesn't reboot
> any more.  I thought it was something local to my development, but
> apparently not if you're seeing the same.
>
>>
>> I've attached the full xl dmesg log of the last crash, and I'm happy
>> to provide more if needed. I can also test patches.
>>
>> Thanks for your work, and thanks in advance for taking a look.
>>
>> Peter
> Thankyou,
>
> ~Andrew

I have full xl dmesg logs for almost all crashes. Happy to send any of
them.

Peter


