Return-Path: <SRS0=kYra=5T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DF7C43331
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 07:33:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197C7206E9
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 07:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197C7206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKGoc-00024H-M0; Fri, 03 Apr 2020 07:32:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKGob-00024A-B4
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 07:32:33 +0000
X-Inumbo-ID: 473f748a-757d-11ea-bcc0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 473f748a-757d-11ea-bcc0-12813bfff9fa;
 Fri, 03 Apr 2020 07:32:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E40AAFA1;
 Fri,  3 Apr 2020 07:32:30 +0000 (UTC)
Subject: Re: [PATCH 4/4] x86/APIC: restrict certain messages to BSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
 <76e02143-474f-54c1-bba3-5c5973d7751a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <180550ef-e2be-c8a6-f663-36747bccfbf2@suse.com>
Date: Fri, 3 Apr 2020 09:32:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <76e02143-474f-54c1-bba3-5c5973d7751a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 02.04.2020 19:55, Andrew Cooper wrote:
> On 13/03/2020 09:26, Jan Beulich wrote:
>> All CPUs get an equal setting of EOI broadcast suppression; no need to
>> log one message per CPU, even if it's only in verbose APIC mode.
>>
>> Only the BSP is eligible to possibly get ExtINT enabled; no need to log
>> that it gets disabled on all APs, even if - again - it's only in verbose
>> APIC mode.
>>
>> Take the opportunity and introduce a "bsp" parameter to the function, to
>> stop using smp_processor_id() to tell BSP from APs.
> 
> On further consideration, this is introducing a latent bug.
> 
> In a theoretical world where we could take the BSP offline, it is still
> the CPU with the ID 0 which needs various of these things setting back up.

No. If we took the BSP offline, no CPU with ID 0 would remain
(until such time that the ID would be re-used).

> You could argue that we could move ExtINT/NMI handling to a different
> CPU, and in this case, BSP still isn't the right distinction.  We'd want
> something to signify "the processor which is the target of legacy
> interrupts", as in such a case, it would specifically no longer be the
> CPU we booted on.

I see nothing wrong with calling this new "focus" processor the
BSP again. Post boot the significance of BSP, afaict, reduces
to aspects that aren't really tied to having been the processor
to lead bootup.

The important point is - if we were to allow offlining the BSP,
whichever other one would take its position would _not_ come
through setup_local_APIC(). The adjustments needs would need
doing by other means (quite likely by splitting out some of the
code into a new helper). Hence in setup_local_APIC() itself the
BSP / non-BSP distinction is correct.

> OTOH, the adjustment for the NMI watchdog does look to be different. 
> AFAICT, that is for deferring the watchdog setup until later in boot, at
> which point "the BSP" is the appropriate distinction to use.  (That said
> - I'm not sure why anything should need delaying.  I suspect this is
> misplaced code to begin with.)

Well, in any event - an unrelated aspect, and I think the switch
from smp_processor_id() to bsp is correct there as well.

> As for the messages being printed, I think that is fine to restrict to
> the BSP.

As per above I understand this isn't an ack for the patch. However,
I then don't understand what concrete changes you mean me to make
for it to stand a chance of getting your ack.

Jan

