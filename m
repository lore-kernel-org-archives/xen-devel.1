Return-Path: <SRS0=jQwh=BH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60891C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 19:42:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38BFA2065C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 19:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38BFA2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0VTy-0008St-IM; Tue, 28 Jul 2020 19:41:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0VTx-0008So-6A
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:41:49 +0000
X-Inumbo-ID: 5fd127f8-d10a-11ea-a92f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fd127f8-d10a-11ea-a92f-12813bfff9fa;
 Tue, 28 Jul 2020 19:41:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64576AD7A;
 Tue, 28 Jul 2020 19:41:58 +0000 (UTC)
Subject: Re: [PATCH 3/4] x86: drop ASM_{CL,ST}AC
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <048c3702-f0b0-6f8e-341e-bec6cfaded27@suse.com>
 <07750e83-6b9d-a88d-856b-20db4f63fd11@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f60b140-a790-43af-122d-1516190af2d9@suse.com>
Date: Tue, 28 Jul 2020 21:41:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07750e83-6b9d-a88d-856b-20db4f63fd11@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 16:51, Andrew Cooper wrote:
> On 15/07/2020 11:49, Jan Beulich wrote:
>> Use ALTERNATIVE directly, such that at the use sites it is visible that
>> alternative code patching is in use. Similarly avoid hiding the fact in
>> SAVE_ALL.
>>
>> No change to generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Definitely +1 to not hiding the STAC/CLAC in SAVE_ALL.  I've been
> meaning to undo that mistake for ages.
> 
> OOI, what made you change your mind?  I'm pleased that you have.

This, to me, is a direct consequence of dropping ASM_STAC / ASM_CLAC:
If we don't want the fact of a use of ALTERNATIVE be hidden there, it
also shouldn't be hidden inside SAVE_ALL.

>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2165,9 +2165,9 @@ void activate_debugregs(const struct vcp
>>   void asm_domain_crash_synchronous(unsigned long addr)
>>   {
>>       /*
>> -     * We need clear AC bit here because in entry.S AC is set
>> -     * by ASM_STAC to temporarily allow accesses to user pages
>> -     * which is prevented by SMAP by default.
>> +     * We need to clear AC bit here because in entry.S it gets set to
>> +     * temporarily allow accesses to user pages which is prevented by
>> +     * SMAP by default.
> 
> As you're adjusting the text, It should read "We need to clear the AC
> bit ..."
> 
> But I also think it would be clearer to say that exception fixup may
> leave user access enabled, which we fix up here by unconditionally
> disabling user access.

Can do.

> Preferably with this rewritten, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

Jan

