Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5F606A336
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cortex-media.de header.i=@cortex-media.de header.a=rsa-sha256 header.s=20250930 header.b=nZU1uga3
Received: from list by lists.xenproject.org with outflank-mailman.1481420.1685291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQidf-0002yg-MO; Tue, 10 Nov 2026 09:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481420.1685291; Tue, 10 Nov 2026 09:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQidf-0002yX-Jh; Tue, 10 Nov 2026 09:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1481420;
 Tue, 10 Nov 2026 09:59:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pd@cortex-media.de>) id 1xQide-0002y0-68
 for xen-devel@lists.xen.org; Tue, 10 Nov 2026 09:59:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQidd-00AWmV-F5
 for xen-devel@lists.xen.org; Tue, 10 Nov 2026 10:59:37 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pd@cortex-media.de>)
 id 6af2eb08-2eae-0a2a0a5409dd-0a2a4509928c-10
 for <xen-devel@lists.xen.org>; Tue, 10 Nov 2026 10:59:37 +0100
Received: from [136.243.217.222] (helo=mail.cortex-media.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pd@cortex-media.de>)
 id 6af2eb09-be1a-0a2a45090019-88f3d9debec4-3
 for <xen-devel@lists.xen.org>; Tue, 10 Nov 2026 10:59:37 +0100
Received: by mail.cortex-media.de (Postfix) id 494C338C044;
 Tue, 10 Nov 2026 10:59:36 +0100 (CET)
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
	s=20250930; t=1794304777;
	bh=FIeLTMyVt9iKTOkpPfn6ooiOvogWc2l6RJ2kX4CnMMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZU1uga3CoH8RMoF07CvpyldFX1aSE8MBWOrVMuK69fV4vJOV/ulZOyyT/ceTOzDq
	 mH0OLclTiV2voAyqr4MVRAM3f2MppXqW38mt3EdNr/7V0ZSEVi0SB51OwuGHMFgHXG
	 AgVbGCQuv5R3SHQUr2fQ9dcReMPO/XHaXmJH/VLUzr8c5ANlIzkVqXUqkQH7HDr1jP
	 zwRVazYkqAtM0rZ8M1SZ8bClk23QNdPAX+JaSBj9EPc+frjK86S6PT4F98D8gzSjkR
	 HKRQ2zMtIxjhnhye309/OIvIWkdE7Ztza958IegJU8/MRWZiFtOFOna0YSQzWGWGZH
	 cv/9eI4vTLSHg==
Message-ID: <d39dd9e5-b58c-4504-b559-cc449a8f7f87@cortex-media.de>
Date: Tue, 10 Nov 2026 10:59:36 +0100
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
 <8138ed44-727f-45bc-9673-9684e922595b@cortex-media.de>
 <ecfac9d0-eb72-4bb4-8aab-879cfa5dffd9@suse.com>
 <2a44faa9-9a9f-4681-84d6-8267acbec9b0@cortex-media.de>
 <a1785adc-93e9-42dc-a3cb-9e8edf00289c@suse.com>
From: Peter Deggendorfer <pd@cortex-media.de>
In-Reply-To: <a1785adc-93e9-42dc-a3cb-9e8edf00289c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794304777-3A4DB034-23CC7C32/0/0
X-purgate-type: clean
X-purgate-size: 7507
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 02.11.2026 um 13:54 schrieb Jan Beulich:
> On 31.10.2026 14:44, Peter Deggendorfer wrote:
>> As requested, I added a printk to mcheck_mca_logout(), and the BUG() in
>> mc_ec2type() is still replaced. These are the only changes against the
>> Debian package:
>>
>> --- a/xen/arch/x86/cpu/mcheck/mce_amd.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
>> @@ -97,7 +97,7 @@
>>        if ( errorcode & MC_EC_TLB_TYPE )
>>            return MC_EC_TLB_TYPE;
>>        /* Unreached */
>> -    BUG();
>> +    printk(XENLOG_WARNING "MCE: unknown AMD error code %#x\n", errorcode);
>>        return 0;
>>    }
>>
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -304,3 +304,6 @@
>>            if ( !(status & MCi_STATUS_VAL) )
>>                continue; /* this bank has no valid telemetry */
>>
>> +        if ( who == MCA_POLLER )
>> +            printk(XENLOG_WARNING "MCE: CPU%u bank %d status %#"PRIx64"\n",
>> +                   smp_processor_id(), i, status);
>>
>>
>> We now have some data points:
>>
>> (XEN) [2026-10-27 13:42:10.588] MCE: CPU2 bank 23 status 0x830824448b48ffff
>> (XEN) [2026-10-27 18:19:55.593] MCE: CPU2 bank 23 status 0xffffffffffffffff
>> (XEN) [2026-10-27 22:11:10.596] MCE: CPU2 bank 17 status 0xffff832036a40048
>> (XEN) [2026-10-27 22:11:10.596] MCE: unknown AMD error code 0x48
>> (XEN) [2026-10-28 00:33:55.597] MCE: CPU2 bank 10 status 0xffff82d04022a8af
>> (XEN) [2026-10-28 05:26:40.599] MCE: CPU2 bank 17 status 0xffff82d0402408e3
>> (XEN) [2026-10-29 23:17:25.618] MCE: CPU2 bank 17 status 0xffff82d04022a8af
>> (XEN) [2026-10-30 03:25:10.622] MCE: CPU2 bank 23 status 0xffffffffffffffff
>> (XEN) [2026-10-30 10:05:55.625] MCE: CPU2 bank 10 status 0xffffffffffffffff
>> (XEN) [2026-10-31 00:58:10.625] MCE: CPU2 bank 17 status 0xffff888100b872e8
>> (XEN) [2026-10-31 00:58:10.625] MCE: unknown AMD error code 0x72e8
>> (XEN) [2026-10-31 04:17:55.632] MCE: CPU2 bank 23 status 0xffff831f00006000
>> (XEN) [2026-10-31 04:17:55.632] MCE: unknown AMD error code 0x6000
>>
>> Only 3 of these would have hit the BUG(); the others have UC clear or
>> an error code that happens to contain a type bit.
>>
>> The values look like pointers rather than status registers:
>>
>>     ffff82d040......  Xen text/data -- the prefix of every RIP in my
>>                       earlier panic dumps
>>     ffff831f........ / ffff8320........  same range as rsp in those
>>                       dumps (e.g. ffff831fe6b3fc38, ffff832036a87c38)
>>     ffff888100b872e8  dom0 Linux range?
> Plus the very first of the entries above is a pointer value rotated by 16 bits.
>
>> Two things that make me doubt these are real status values at all:
>> 0xffff82d04022a8af appears twice, 47 hours apart, for two different
>> banks (10 and 17). And all timestamps are congruent mod 15 seconds,
>> i.e. this is the poller hitting it on a small fraction of passes.
> There's no question that the values are garbage. We just need to find out why
> that is. As we have to explore all (remote) possibilities, first of all - you
> don't play any games involving the XEN_MC_msrinject hypercall, do you? For
> the immediate purpose here, and since ...

No, I never used XEN_MC_msrinject hypercall on this host; it's a
plain Debian trixie installation.


>> I don't know where the read goes wrong.
> ... I can't make sense of the behavior either, I'm inclined to suggest that
> you add this hunk to your debugging patch:
>
> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -79,7 +79,6 @@
>   static inline uint64_t mca_rdmsr(unsigned int msr)
>   {
>       uint64_t val;
> -    if (intpose_lookup(smp_processor_id(), msr, &val) == NULL)
>           rdmsrl(msr, val);
>       return val;
>   }
>
>> /dev/mcelog records match the log lines one-to-one (same banks,
>> same order, all CPU 2), but carry status zero in every case. The record's
>> status comes from the second read in mca_init_bank(), before
>> mcabank_clear(), so that second read returned 0.
> Based on this observation, another thing you may want to try is extend the
> existing hunk you have to
>
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -304,6 +304,17 @@
>            if ( !(status & MCi_STATUS_VAL) )
>                continue; /* this bank has no valid telemetry */
>
> +        if ( who == MCA_POLLER )
> +        {
> +            printk("MCE: CPU%u bank %d status %#"PRIx64"\n",
> +                   smp_processor_id(), i, status);
> +            status = mca_rdmsr(MSR_IA32_MCx_STATUS(i));
> +            printk("MCE: CPU%u bank %d -> %#"PRIx64"\n",
> +                   smp_processor_id(), i, status);
> +            if ( !(status & MCi_STATUS_VAL) )
> +                continue;
> +        }
> +
>           /*
>            * For Intel Latest CPU CMCI/MCE Handler caller, we need to
>            * decide whether to clear bank by MCi_STATUS bit value such as
>


Since 2026-11-03 the host runs Xen 4.20.5-pre (Debian
4.20.4+39-gf1e1321c87-0+deb13u1) with your two debugging hunks
(intpose_lookup() removed from mca_rdmsr(), re-read in the poller) and
your "x86/MCE: reduce redundant code" series (both patches). In 7 days:


(XEN) [2026-11-03 13:54:50.378] MCE: CPU2 bank 25 status 0x8000001fe67e1163
(XEN) [2026-11-03 13:54:50.378] MCE: CPU2 bank 25 -> 0
(XEN) [2026-11-03 14:52:20.360] MCE: CPU2 bank 7 status 0x8000000080000000
(XEN) [2026-11-03 14:52:20.360] MCE: CPU2 bank 7 -> 0
(XEN) [2026-11-03 20:01:20.264] MCE: CPU2 bank 25 status 0xffff82d04022a8ef
(XEN) [2026-11-03 20:01:20.264] MCE: CPU2 bank 25 -> 0
(XEN) [2026-11-05 14:31:19.276] MCE: CPU2 bank 25 status 0x8000001fe67e1163
(XEN) [2026-11-05 14:31:19.276] MCE: CPU2 bank 25 -> 0
(XEN) [2026-11-06 11:27:18.812] MCE: CPU2 bank 24 status 0xffff832036a754c0
(XEN) [2026-11-06 11:27:18.812] MCE: CPU2 bank 24 -> 0
(XEN) [2026-11-06 18:26:48.671] MCE: CPU2 bank 7 status 0xffff831fe6b154c0
(XEN) [2026-11-06 18:26:48.671] MCE: CPU2 bank 7 -> 0
(XEN) [2026-11-07 06:31:48.345] MCE: CPU2 bank 16 status 0xffff8313f11d2010
(XEN) [2026-11-07 06:31:48.345] MCE: CPU2 bank 16 -> 0
(XEN) [2026-11-07 09:41:48.243] MCE: CPU2 bank 16 status 0xffffffffffffffff
(XEN) [2026-11-07 09:41:48.243] MCE: CPU2 bank 16 -> 0
(XEN) [2026-11-07 21:32:17.875] MCE: CPU2 bank 7 status 0xffff83203a5ea2d0
(XEN) [2026-11-07 21:32:17.875] MCE: CPU2 bank 7 -> 0
(XEN) [2026-11-08 06:25:47.633] MCE: CPU2 bank 16 status 0xffffffffffffffff
(XEN) [2026-11-08 06:25:47.633] MCE: CPU2 bank 16 -> 0
(XEN) [2026-11-08 15:11:17.390] MCE: CPU2 bank 16 status 0xffff82d040588f80
(XEN) [2026-11-08 15:11:17.390] MCE: CPU2 bank 16 -> 0
(XEN) [2026-11-09 07:29:46.980] MCE: CPU2 bank 16 status 0xffffffffffffffff
(XEN) [2026-11-09 07:29:46.980] MCE: CPU2 bank 16 -> 0
(XEN) [2026-11-09 10:49:46.880] MCE: CPU2 bank 7 status 0xffffffffffffffff
(XEN) [2026-11-09 10:49:46.880] MCE: CPU2 bank 7 -> 0
(XEN) [2026-11-09 13:09:16.822] MCE: CPU2 bank 7 status 0xffffffffffffffff
(XEN) [2026-11-09 13:09:16.822] MCE: CPU2 bank 7 -> 0


- All on CPU2. The re-read returned 0 in every case (14/14), so no
   bank was processed and /dev/mcelog stayed empty.
- Against this build's xen-syms.map: 0xffff82d04022a8ef is
   timer.c#add_entry+0x4f, 0xffff82d040588f80 is irq_stat.

Peter


