Return-Path: <SRS0=18Bn=6W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D110C54E4B
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2020 14:43:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D2952083B
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2020 14:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D2952083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4DE-0005Q2-01; Fri, 08 May 2020 14:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX4DD-0005Px-0M
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 14:42:51 +0000
X-Inumbo-ID: 305bf198-913a-11ea-a00c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 305bf198-913a-11ea-a00c-12813bfff9fa;
 Fri, 08 May 2020 14:42:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 973C3AE47;
 Fri,  8 May 2020 14:42:51 +0000 (UTC)
Subject: Re: [PATCH v8 05/12] x86emul: support X{SUS,RES}LDTRK
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <6e7500d2-262c-29c7-b9be-3fc9be26d198@suse.com>
 <feb3a6ed-b6b9-959c-8eb1-fb6ecfff034c@citrix.com>
 <b5f9438b-471d-bf32-3f4c-11287060938c@suse.com>
 <9fa8ceb3-fd4b-e754-2c82-92f134603e34@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <940a0a21-e63c-85a8-4fc9-c24547f9854f@suse.com>
Date: Fri, 8 May 2020 16:42:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9fa8ceb3-fd4b-e754-2c82-92f134603e34@citrix.com>
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

On 08.05.2020 15:15, Andrew Cooper wrote:
> On 08/05/2020 08:38, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 07.05.2020 22:13, Andrew Cooper wrote:
>>> On 05/05/2020 09:14, Jan Beulich wrote:
>>>> --- a/xen/tools/gen-cpuid.py
>>>> +++ b/xen/tools/gen-cpuid.py
>>>> @@ -284,6 +284,9 @@ def crunch_numbers(state):
>>>>          # as dependent features simplifies Xen's logic, and prevents the guest
>>>>          # from seeing implausible configurations.
>>>>          IBRSB: [STIBP, SSBD],
>>>> +
>>>> +        # In principle the TSXLDTRK insns could also be considered independent.
>>>> +        RTM: [TSXLDTRK],
>>> Why the link?  There is no relevant interaction AFAICT.
>> Do the insns make any sense without TSX? Anyway - hence the
>> comment, and if you're convinced the connection does not
>> need making, I'd be okay dropping it. I would assume though
>> that we'd better hide TSXLDTRK whenever we hide RTM, which
>> is most easily achieved by having a connection here.
> 
> Actually - that is a very good point.  I expect there will (or should)
> be an interaction with MSR_TSX_CTRL, as it has CPUID-hiding functionality.
> 
> For now, could I ask you to not expose this to guests in this patch?

As per our irc discussion, I'd make it 'a' then instead of 'A'.
Will need to wait for gen-cpuid.py to accept 'a' then.

> For the emulator side of things alone I think this is ok (although
> looking over it a second time, we could really do with a comment in the
> code explaining that we're never in an RTM region, hence the nop behaviour).

I've added

                /*
                 * We're never in a transactional region when coming here
                 * - nothing else to do.
                 */

to both paths.

> I'll follow up with Intel, and we can figure out the CPUID derivation
> details at a later point.
> 
> If you're happy with this plan, then A-by to save a round trip.

Thanks.

Jan

