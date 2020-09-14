Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430DFC433E2
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 14:56:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0000520732
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0000520732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHptY-0006jU-PU; Mon, 14 Sep 2020 14:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHptX-0006jP-83
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:55:51 +0000
X-Inumbo-ID: e62c3233-4fa7-4797-af95-8a63a3b82581
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e62c3233-4fa7-4797-af95-8a63a3b82581;
 Mon, 14 Sep 2020 14:55:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B712B4FE;
 Mon, 14 Sep 2020 14:56:05 +0000 (UTC)
Subject: Re: [RFC PATCH] efi: const correct EFI functions
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200914142528.897639-1-hudson@trmm.net>
 <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
 <GzkAuTpoKeYXGDsEJtlgfK50xky_Z3ipeYUpbKvW9Fu-0uJamNpsRVMR8fIUYpIzoJlzowf-j7pbcoDAmL8qgYRjE2UwZ2wKma0Xm7U5PpQ=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d94fdbee-7e41-99db-13f8-16394a288318@suse.com>
Date: Mon, 14 Sep 2020 16:55:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <GzkAuTpoKeYXGDsEJtlgfK50xky_Z3ipeYUpbKvW9Fu-0uJamNpsRVMR8fIUYpIzoJlzowf-j7pbcoDAmL8qgYRjE2UwZ2wKma0Xm7U5PpQ=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 16:46, Trammell Hudson wrote:
> On Monday, September 14, 2020 10:30 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.09.2020 16:25, Trammell Hudson wrote:
>>> By defining IN as const, the EFI handler functions become almost
>>> const-correct and allow most of the rest of the EFI boot code to
>>> use constant strings.
>>
>> How does this work with combined "IN OUT"? I'm afraid there is a
>> reason why things aren't done the way you suggest.
> 
> WTF FFS UEFI. They really do continue to find new ways to disappoint me.
> 
> So I see three options:
> 
> Option 1 is to retroactively modify the C spec to allow us to have
> a "nonconst" that will override any prior "const" modifiers
> (last one wins, like Duck Season/Rabbit Season).

LoL

> Option 2 would be to modify the imported header to change
> the 30 uses of "IN OUT" to "INOUT" and define that to be an
> empty string.

This is something that one might hope even the gnu-efi folks
could be persuaded to do.

> Option 3 would be to write wrappers for the few functions that are
> used in the EFI boot path that cast-away the constness of their
> arguments (while also silently cursing the UEFI forum for not
> writing const-correct code).

This would be kind of a last resort fallback (except for the
cursing, which of course we can do at any time).

Jan

