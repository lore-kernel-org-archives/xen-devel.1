Return-Path: <SRS0=Z/2m=B3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1D4C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 15:42:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1863422DA9
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 15:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1863422DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hHH-0005j6-WD; Mon, 17 Aug 2020 15:42:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7hHG-0005j1-CA
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:42:26 +0000
X-Inumbo-ID: 4ecc2aad-4ce5-4bdb-9723-f9d25feebb3e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ecc2aad-4ce5-4bdb-9723-f9d25feebb3e;
 Mon, 17 Aug 2020 15:42:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73953AD7B;
 Mon, 17 Aug 2020 15:42:49 +0000 (UTC)
Subject: Re: [PATCH 4/4] EFI: free unused boot mem in at least some cases
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <4e2d0d0a-9d85-d704-5d61-ae9efc69256a@suse.com>
 <21bd3372-ac86-f20f-b2b8-3cfb697ef894@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24cc481d-8ac1-9e57-05be-428c0ed201df@suse.com>
Date: Mon, 17 Aug 2020 17:42:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <21bd3372-ac86-f20f-b2b8-3cfb697ef894@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.08.2020 19:09, Andrew Cooper wrote:
> On 06/08/2020 10:06, Jan Beulich wrote:
>> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
>> free ebmalloc area at all") was put in place: Make xen_in_range() aware
>> of the freed range. This is in particular relevant for EFI-enabled
>> builds not actually running on EFI, as the entire range will be unused
>> in this case.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The remaining issue could be addressed too, by making the area 2M in
>> size and 2M-aligned.
> 
> This memory range is only used for relocating the (synthesized?)
> multiboot strings, is it not?

No. Afaict it has nothing to do with multiboot strings. There are
exactly two uses afaics - in place_string() and in
efi_arch_allocate_mmap_buffer(). The former is used to record
command line pieces, e.g. that parsed from the config file, while
the latter is what allocates the memory for the EFI memory map.

> I'm not actually convinced that this is a sensible tradeoff.
> 
> For one, you've broken setup.c's:
> 
>     /* This needs to remain in sync with xen_in_range(). */
>     reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
> 
> which covers the runtime aspect of what xen_in_range() covers during boot.

Hmm, I did specifically look at that and thought it wouldn't need
changing. But now that you point it out (again), it looks like I
was wrong.

> I think the better course of action is to go with David Woodhouse's work
> to not relocate the trampoline until later on boot (if even necessary),
> at which point both of the custom allocators can disappear.

Well, in the light of my response above I'd like to express that
I can't see how David's work would make this allocator go away.

Jan

