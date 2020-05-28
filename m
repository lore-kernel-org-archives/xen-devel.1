Return-Path: <SRS0=RRgd=7K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F475C433E2
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 13:31:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A8F20721
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 13:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A8F20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeIcy-0000rW-Hs; Thu, 28 May 2020 13:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeIcx-0000rR-Kx
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 13:31:19 +0000
X-Inumbo-ID: 81ced8f8-a0e7-11ea-a7cf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81ced8f8-a0e7-11ea-a7cf-12813bfff9fa;
 Thu, 28 May 2020 13:31:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E463B028;
 Thu, 28 May 2020 13:31:15 +0000 (UTC)
Subject: Re: [PATCH v2 04/14] x86/traps: Implement #CP handler and extend #PF
 for shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-5-andrew.cooper3@citrix.com>
 <424dc7f2-d999-19e1-42ad-226cf22783eb@suse.com>
 <a5fa915b-b0ce-8247-09bb-dac3d149c6b5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21cfcf09-930d-c0cd-6860-92523732a594@suse.com>
Date: Thu, 28 May 2020 15:31:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a5fa915b-b0ce-8247-09bb-dac3d149c6b5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 15:22, Andrew Cooper wrote:
> On 28/05/2020 13:03, Jan Beulich wrote:
>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>> @@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
>>>          entrypoint 1b
>>>  
>>>          /* Reserved exceptions, heading towards do_reserved_trap(). */
>>> -        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
>>> +        .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
>>> +                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
>> Adding yet another || here adds to the fragility of the entire
>> construct. Wouldn't it be better to implement do_entry_VE at
>> this occasion, even its handling continues to end up in
>> do_reserved_trap()? This would have the benefit of avoiding the
>> pointless checking of %spl first thing in its handling. Feel
>> free to keep the R-b if you decide to go this route.
> 
> I actually have a different plan, which deletes this entire clause, and
> simplifies our autogen sanity checking somewhat.
> 
> For vectors which Xen has no implementation of (for whatever reason),
> use DPL0, non-present descriptors, and redirect #NP[IDT] into
> do_reserved_trap().

Except that #NP itself being a contributory exception, if the such
covered exception is also contributory (e.g. #CP) or of page fault
class (e.g. #VE), we'd get #DF instead of #NP afaict.

Jan

