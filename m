Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629A606A31C
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cortex-media.de header.i=@cortex-media.de header.a=rsa-sha256 header.s=20250930 header.b=Is2b4HW7
Received: from list by lists.xenproject.org with outflank-mailman.1466771.1676521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN9Nh-0003Ln-77; Sat, 31 Oct 2026 13:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466771.1676521; Sat, 31 Oct 2026 13:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN9Nh-0003Lg-49; Sat, 31 Oct 2026 13:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1466771;
 Sat, 31 Oct 2026 13:44:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pd@cortex-media.de>) id 1xN9Ne-0003La-Ct
 for xen-devel@lists.xen.org; Sat, 31 Oct 2026 13:44:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xN9Nd-00H1pJ-Io
 for xen-devel@lists.xen.org; Sat, 31 Oct 2026 14:44:21 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pd@cortex-media.de>)
 id 6ae5f070-e002-0a2a0a5209dd-0a2a450684a0-22
 for <xen-devel@lists.xen.org>; Sat, 31 Oct 2026 14:44:21 +0100
Received: from [136.243.217.222] (helo=mail.cortex-media.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pd@cortex-media.de>)
 id 6ae5f0b5-195a-0a2a45060019-88f3d9dead20-3
 for <xen-devel@lists.xen.org>; Sat, 31 Oct 2026 14:44:21 +0100
Received: by mail.cortex-media.de (Postfix) id C0DB438C02F;
 Sat, 31 Oct 2026 14:44:20 +0100 (CET)
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
	s=20250930; t=1793454261;
	bh=NbgeVwvDW7dRuooPxehFEjsz/XbOsJq5kPRuCtEYc2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Is2b4HW7Be4DFRrfvEnAA4ncsw6S08FfTjiQ9UZvVK2CMQxNcdrln+iIqPioiwK83
	 +YH8KtiXLhGHhG8cv8BVeo5KVMPdRqZN2baPTT5cHR12bnVOwZxfyPMT9606+NOwKo
	 R2nvUzeQzaee8thmahHmzRKNzDNaRB1M6GMKoewXdAaOlrl7sIZgXNm8IIii29ZZJ3
	 6hPAnalePtkSBS9OyNxqCEulDRN6931c1NmTFEibkD3tHoXoTaRIx49nx0pl9SN8yc
	 8EgqU4Adjpu9HDeo4OKKXB/T1h7mZTtptGJ5AWV7yIJkQ4WMfsU2n8EkGnjL8eNjmM
	 1LAlHXrenqH6Q==
Message-ID: <2a44faa9-9a9f-4681-84d6-8267acbec9b0@cortex-media.de>
Date: Sat, 31 Oct 2026 14:44:20 +0100
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
From: Peter Deggendorfer <pd@cortex-media.de>
In-Reply-To: <ecfac9d0-eb72-4bb4-8aab-879cfa5dffd9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793454261-FEA7477B-560D3E41/0/0
X-purgate-type: clean
X-purgate-size: 6639
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 26.10.26 um 16:24 schrieb Jan Beulich:
> On 26.10.2026 15:48, Peter Deggendorfer wrote:
>> Am 26.10.2026 um 11:53 schrieb Jan Beulich:
>>> On 25.10.2026 13:32, Peter Deggendorfer wrote:
>>>> Regarding the output of /dev/mcelog: if my decoding is right, three
>>>> things stand out. MCi_STATUS is zero, i.e. these banks are reporting
>>>> nothing at all -- no error, no garbage value.
>>> Well, things can't quite be that way: If MCi_STATUS was zero, the first
>>> check in mc_amd_recoverable_scan() would prevent mc_ec2type() from
>>> being reached in the first place. Its caller also checks MCi_STATUS_VAL
>>> to be set.
>>>
>>> What I find puzzling is this:
>>>
>>>       errorcode = status & (MCi_STATUS_MCA | MCi_STATUS_MSEC);
>>>       ectype = mc_ec2type(errorcode);
>>>
>>> With errorcode (and mc_ec2type()'s parameter type) being uint16_t, what
>>> use is it to include MCi_STATUS_MSEC in the mask? (Yet that's likely
>>> unrelated to the issue at hand.) Considering how mc_ec2type() works, I
>>> see no reason why status couldn't be passed to it directly (with the
>>> parameter type widened to uint32_t). Then the BUG() there could perhaps
>>> become BUG_ON(errorcode).
>> You're right, my conclusion was wrong.
>>
>> One more data point, from an hour ago:
>>
>> (XEN) [2026-10-26 13:13:42.050] MCE: unknown AMD error code 0x1000
>>
>> So it isn't always 0. The uint16_t truncation might explain the first
>> (MSEC bits dropped), but 0x1000 is a non-zero code that still matches
>> none of MC_EC_BUS_TYPE / MC_EC_MEM_TYPE / MC_EC_TLB_TYPE.
>>
>> /dev/mcelog right afterwards showed three records, banks 17, 14 and 16,
>> all CPU 2 (status zero, as above). Banks seen so far across panics and
>> log lines: 10, 14, 16, 17, 23.
>>
>> With the BUG() dropped, the host has now logged this twice with no
>> panic, no wedged CPU and no hung guests. Everything is running
>> normally.
>>
>> Regarding passing status as uint32_t and BUG_ON(errorcode): with
>> today's 0x1000, bits 0-31 are non-zero but none of the type bits is
>> set, so that BUG_ON would still trigger. So unless 0x1000 is a known
>> type that mc_ec2type() should handle, I think the poller shouldn't BUG
>> on an unclassifiable code at all.
> I disagree. That code, aiui, is to decide whether something the hardware
> reported as uncorrectable can still be recovered from. Seeing an error
> code of unknown type therefore has to be treated as fatal. Whether that
> is by keeping that BUG() or by some other means is secondary; continuing
> to run Xen is putting all of the system's data at risk, even if in your
> particular instance(s) you didn't observe further anomalies.
>
>>>> Both records are again
>>>> from CPU 2, and bank 23 is one of the banks that appeared in the
>>>> panics, bank 16 is new.
>>> Isn't it possible that the lack of 532988dccc19 ("x86/mcheck: fix
>>> mca_allbanks updating") simply hid the issue previously?
>> That is exactly what I suspect. This host, and 10 more with identical
>> hardware, ran for years on Xen 4.17 without a single incident. The
>> first panic came within days of upgrading this one to 4.20; the others
>> are still on 4.17 and still fine. If no bank was being collected
>> before, nothing could have reached mc_ec2type() -- so the condition
>> may well have been there the whole time, just never looked at.
>>
>> Would it help if I logged the full MCi_STATUS of the first read, i.e.
>> in mcheck_mca_logout() right after the MCi_STATUS_VAL check, together
>> with CPU and bank number?
> Yes please.

As requested, I added a printk to mcheck_mca_logout(), and the BUG() in
mc_ec2type() is still replaced. These are the only changes against the
Debian package:

--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -97,7 +97,7 @@
      if ( errorcode & MC_EC_TLB_TYPE )
          return MC_EC_TLB_TYPE;
      /* Unreached */
-    BUG();
+    printk(XENLOG_WARNING "MCE: unknown AMD error code %#x\n", errorcode);
      return 0;
  }

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -304,3 +304,6 @@
          if ( !(status & MCi_STATUS_VAL) )
              continue; /* this bank has no valid telemetry */

+        if ( who == MCA_POLLER )
+            printk(XENLOG_WARNING "MCE: CPU%u bank %d status %#"PRIx64"\n",
+                   smp_processor_id(), i, status);


We now have some data points:

(XEN) [2026-10-27 13:42:10.588] MCE: CPU2 bank 23 status 0x830824448b48ffff
(XEN) [2026-10-27 18:19:55.593] MCE: CPU2 bank 23 status 0xffffffffffffffff
(XEN) [2026-10-27 22:11:10.596] MCE: CPU2 bank 17 status 0xffff832036a40048
(XEN) [2026-10-27 22:11:10.596] MCE: unknown AMD error code 0x48
(XEN) [2026-10-28 00:33:55.597] MCE: CPU2 bank 10 status 0xffff82d04022a8af
(XEN) [2026-10-28 05:26:40.599] MCE: CPU2 bank 17 status 0xffff82d0402408e3
(XEN) [2026-10-29 23:17:25.618] MCE: CPU2 bank 17 status 0xffff82d04022a8af
(XEN) [2026-10-30 03:25:10.622] MCE: CPU2 bank 23 status 0xffffffffffffffff
(XEN) [2026-10-30 10:05:55.625] MCE: CPU2 bank 10 status 0xffffffffffffffff
(XEN) [2026-10-31 00:58:10.625] MCE: CPU2 bank 17 status 0xffff888100b872e8
(XEN) [2026-10-31 00:58:10.625] MCE: unknown AMD error code 0x72e8
(XEN) [2026-10-31 04:17:55.632] MCE: CPU2 bank 23 status 0xffff831f00006000
(XEN) [2026-10-31 04:17:55.632] MCE: unknown AMD error code 0x6000

Only 3 of these would have hit the BUG(); the others have UC clear or
an error code that happens to contain a type bit.

The values look like pointers rather than status registers:

   ffff82d040......  Xen text/data -- the prefix of every RIP in my
                     earlier panic dumps
   ffff831f........ / ffff8320........  same range as rsp in those
                     dumps (e.g. ffff831fe6b3fc38, ffff832036a87c38)
   ffff888100b872e8  dom0 Linux range?
   ffffffffffffffff  looks like a failed read?

Two things that make me doubt these are real status values at all:
0xffff82d04022a8af appears twice, 47 hours apart, for two different
banks (10 and 17). And all timestamps are congruent mod 15 seconds,
i.e. this is the poller hitting it on a small fraction of passes.

I don't know where the read goes wrong.

/dev/mcelog records match the log lines one-to-one (same banks,
same order, all CPU 2), but carry status zero in every case. The record's
status comes from the second read in mca_init_bank(), before
mcabank_clear(), so that second read returned 0.

Peter

