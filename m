Return-Path: <SRS0=rP1u=D2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17CAC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 15:03:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3761F2231B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 15:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KdrRlcJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3761F2231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8734.23423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUWgZ-0005pz-Ax; Mon, 19 Oct 2020 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8734.23423; Mon, 19 Oct 2020 15:02:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUWgZ-0005ps-7w; Mon, 19 Oct 2020 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 8734;
 Mon, 19 Oct 2020 15:02:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUWgY-0005pn-0p
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:02:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 290af866-af43-481c-869a-d8cf361f1287;
 Mon, 19 Oct 2020 15:02:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CF42ADF7;
 Mon, 19 Oct 2020 15:02:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUWgY-0005pn-0p
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:02:54 +0000
X-Inumbo-ID: 290af866-af43-481c-869a-d8cf361f1287
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 290af866-af43-481c-869a-d8cf361f1287;
	Mon, 19 Oct 2020 15:02:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603119771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLlIyCd/5KJtDGeP3FKDOG2rOrTGcnbz3rxNcUDALps=;
	b=KdrRlcJb9E7VlDJEr4Xw9B7gOANr8CuG3e3fRq+m8rSOWT4yjDS/uNExtW3ICv/H4EBGjq
	40ztMF/c4o9iPbbGP9Fbu1j8Wf8YjZQv7DKQ/cauZ3anVJDzq5PuEBDUXFgFqxeGcwHZu4
	ss+B9n1skwcIa9KF8JnjjmF+beGsTJM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6CF42ADF7;
	Mon, 19 Oct 2020 15:02:51 +0000 (UTC)
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
 <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
 <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
 <6af1bbb6-d717-affa-6409-2b983e48ed30@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59f3e399-8676-bb44-ec85-500583f97b2f@suse.com>
Date: Mon, 19 Oct 2020 17:02:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <6af1bbb6-d717-affa-6409-2b983e48ed30@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.10.2020 16:30, Andrew Cooper wrote:
> On 19/10/2020 15:21, Jan Beulich wrote:
>> On 19.10.2020 16:10, Andrew Cooper wrote:
>>> On 19/10/2020 14:40, Jan Beulich wrote:
>>>> Of the state saved by the insn and reloaded by the corresponding VMLOAD
>>>> - TR, syscall, and sysenter state are invariant while having Xen's state
>>>>   loaded,
>>>> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>>>>   context switch code.
>>> I think it would be helpful to state that Xen's state is suitably cached
>>> in _svm_cpu_up(), as this does now introduce an ordering dependency
>>> during boot.
>> I've added a sentence.
>>
>>> Is it possibly worth putting an assert checking the TR selector?  That
>>> ought to be good enough to catch stray init reordering problems.
>> How would checking just the TR selector help? If other pieces of TR
>> or syscall/sysenter were out of sync, we'd be hosed, too.
> 
> They're far less likely to move relative to tr, than everything relative
> to hvm_up().
> 
>> I'm also not sure what exactly you mean to do for such an assertion:
>> Merely check the host VMCB field against TSS_SELECTOR, or do an
>> actual STR to be closer to what the VMSAVE actually did?
> 
> ASSERT(str() == TSS_SELECTOR);

Oh, that's odd. How would this help with the VMCB? I thought
you want the VMCB field checked (which is what we're going to
have host state loaded from, and which hence is what shouldn't
be wrong). If the assert as you suggests passes, it means
nothing towards our environment after the next VM exit.

> The problem with the other state is that it compiletime/runtime
> dependent, and we don't want to be opencoding the logic a second time.

Right, but the assertion should be useful at least in some way,
which may make it unavoidable to duplicate some of the logic.
In effect the assertion as you're suggesting it does, too, in
that it further implies VMCB.trsel == TSS_SELECTOR.

Jan

