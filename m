Return-Path: <SRS0=18Bn=6W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35682C38A2A
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2020 13:59:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E592208CA
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2020 13:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E592208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX3Wr-0001GE-0z; Fri, 08 May 2020 13:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX3Wp-0001G9-Tu
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:59:03 +0000
X-Inumbo-ID: 12e73f42-9134-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12e73f42-9134-11ea-b9cf-bc764e2007e4;
 Fri, 08 May 2020 13:59:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFE5CABC7;
 Fri,  8 May 2020 13:59:04 +0000 (UTC)
Subject: Re: [PATCH v8 04/12] x86emul: support SERIALIZE
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <0bbbf95e-48ec-ee73-5234-52cf9c6c06d8@suse.com>
 <64de91ff-41ae-baf1-1119-0ba39df32275@citrix.com>
 <0c5a03c6-6c4f-c6ec-e474-71a2badd1c9c@suse.com>
 <fe12bd3d-37f6-111c-e738-dde0b42d2d3d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a4a9298-3446-a863-2e24-4c81244594dd@suse.com>
Date: Fri, 8 May 2020 15:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fe12bd3d-37f6-111c-e738-dde0b42d2d3d@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 15:00, Andrew Cooper wrote:
> On 08/05/2020 08:34, Jan Beulich wrote:
>>>> @@ -5660,6 +5661,18 @@ x86_emulate(
>>>>                  goto done;
>>>>              break;
>>>>  
>>>> +        case 0xe8:
>>>> +            switch ( vex.pfx )
>>>> +            {
>>>> +            case vex_none: /* serialize */
>>>> +                host_and_vcpu_must_have(serialize);
>>>> +                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
>>> There is very little need for an actual implementation here.  The VMExit
>>> to get here is good enough.
>>>
>>> The only question is whether pre-unrestricted_guest Intel boxes are
>>> liable to find this in real mode code.
>> Apart from this we also shouldn't assume HVM in the core emulator,
>> I think.
> 
> It's not assuming HVM.  Its just that there is no way we can end up
> emulating this instruction from PV context.
> 
> If we could end up here in PV context, the exception causing us to
> emulate to begin with would be good enough as well.

With the current way of where/how emulation gets involved -
yes. I'd like to remind you though of the 4-insn window
shadow code tries to emulate over for PAE guests. There
is no intervening #VMEXIT there.

So do you want me to drop the asm() then, and switch from
host_and_vcpu_must_have(serialize) to just
vcpu_must_have(serialize)?

Jan

