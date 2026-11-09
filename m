Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918AC606A336
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=c3hOmrgv;
	dkim=fail reason="signature verification failed" header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KJ3gWpH+
Received: from list by lists.xenproject.org with outflank-mailman.1479767.1683681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMSa-0001hN-RG; Mon, 09 Nov 2026 10:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479767.1683681; Mon, 09 Nov 2026 10:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMSa-0001hG-O0; Mon, 09 Nov 2026 10:18:44 +0000
Received: by outflank-mailman (input) for mailman id 1479767;
 Mon, 09 Nov 2026 10:16:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julian@outer-limits.org>) id 1xQMQj-0001Xu-9D
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:16:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQMQi-006ww3-G6
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:16:48 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julian@outer-limits.org>)
 id 6af19d8d-2eae-0a2a0a5409dd-0a2a4502a1ac-8
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:16:48 +0100
Received: from [85.215.255.51] (helo=mo4-p01-ob.smtp.rzone.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julian@outer-limits.org>)
 id 6af19d8f-6ca4-0a2a45020019-55d7ff339679-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:16:48 +0100
Received: from [IPV6:2a01:cb15:80c6:e800:a9dd:2b53:f1aa:d3fa]
 by smtp.strato.de (RZmta 55.6.3 AUTH) with ESMTPSA id J82cde2A9AG7zog
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 9 Nov 2026 11:16:07 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=strato-dkim-0002 header.d=outer-limits.org header.i="@outer-limits.org" header.h="In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID"; dkim=permerror header.s=strato-dkim-0003 header.d=outer-limits.org header.i="@outer-limits.org"
ARC-Seal: i=1; a=rsa-sha256; t=1794219368; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ly5CoXLr6I+bRApne+yZ5VfYEOur9JERXKloz51nArrfXuODkvcUiBvwjOb0RJqqAr
    y+6zx/tmpuX7jHH2pt1+vR4i94Ff/5k0FgtLYVirrIFegnTjkMsvu7bZ56w5UQHmyeDq
    9sRGuKrIVOVSrAhNjANUgeRDFOkCPNKxiV3NBc06yhroqUm7C7gJ+x0zkMrBYCxkvg4R
    KDzGvZ6NNzkbjmJL6WWXjy53zb9WGUlf73B9oTJ6ZpmtIThVGK0Y04dU9xlrvEDWJUWM
    82QNdxK0b/YdFohRzHG8LEidG7z8TmicoOGLi+ZUiZwJwFLGXwgLr1NNSLc9LzJTY1yt
    PObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794219368;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
    b=iBV54vo/NoN5wM2xVSGV7GLBiw6NcCypt1BkXWz6mix97Uk+SPHYnqvSTND229WaDB
    zsNAkvxcwnNXir7xfPyu3Z5c11udVYMb4lGVynjkpQeAyLC6p4pCEh9YSatNRBqVTgOg
    o1JAKJ9vJhq1ld7fN8ufKePFHZP8ttZn/E5zQ70H+FJmIBTYiE6cWlrMXTifZoUFENtV
    LkWCnP/+emJ8F9hpqAn5lDjPYAT/Iu8SvVD89k9H6LxK/Sj5sIGVghw6X9vDyQW8aWnA
    HI6HmezT7fdCv9LtEYWXd2zAUYev/r/HOb6boG97XgTSMSuSL6lg9Jfe/uzwYyIboNpy
    X2Jw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794219368;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
    b=c3hOmrgvGDecahsWsm645sNDdaO5/OJpe12xwJq+HYZyd1rPjkCiWCQJsgPaMcvlth
    P17D35QMNCtyjk7ouQzNMvYetISiLcYvXgalbSgP/0VIkOM/mUNXYUosXnIoKbMlgoL7
    PuokefaNNzc8TTN8dPUZw1bpF6yRkDhSlzQC60q5Y/XanEbf3K25LvJF3laRFmpf0HRG
    rMny347h5gqf2+Ug9NWeK+SseZXn2L78Q8bM3ku63Lk+669/6YqvXg+FapTGOEPS3Keq
    VRWxZnhecvOF9XEy1o+mT4Bp1jE32qoHvrU2xjEpHrPTF/+lJTqzLR+SmD88O7TJCSIY
    n2kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794219368;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
    b=KJ3gWpH+1bvC7YaM6TF17cqLSRMT6xMJYpxHEcv8J5cR8v8i9HB5JD+IH106OKz2eO
    fk3Ep5OzEYdfV+GbjJBQ==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk1Z5IDmIqDY7xpnOs6mGD64frXxHtrE3e66udIGwZnWwLgga9o="
Message-ID: <1fb98f79-183c-4144-aaac-45a437ff2d32@outer-limits.org>
Date: Mon, 9 Nov 2026 11:16:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
 <20261106153647.F7ld02De@linutronix.de>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <20261106153647.F7ld02De@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794219408-F26B72AC-514F1DFB/0/0
X-purgate-type: clean
X-purgate-size: 2713
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 4:39 PM, Sebastian Andrzej Siewior wrote:
> On 2026-11-06 15:57:40 [+0100], Julian Vetter wrote:
>> We hit this issue with an Ubuntu 26.04 cloudimage guests (7.0 based
>> kernel with the 8250 as an nbcon console) on XCP-ng 8.3 / Xen 4.17. With
>> a kernel commandline adding two consoles, i.e., 'console=ttyS1
>> console=ttyS0'. During a live migration on that setup the printk()s from
>> gnttab_resume() and xen_irq_resume() queue nbcon_irq_work while the APIC
>> is disabled. Thus the list transitions from empty to non-empty, but
>> doesn't receive the IPI to empty the list again. Afterwards the list
>> stays non-empty, so the IPI never fires and all irq_work piles up.
>>
>> The Commit 560f4deda327 ("printk/nbcon: Change nbcon_irq_work to
>> IRQ_WORK_LAZY") removed this particular issue because declaring the IRQ
>> work to be lazy, causes the timer interrupt to trigger the irq work
>> instead. But any other non-lazy irq_work queued in that window is still
>> lost the same way and will cause the list to fill up without being
>> handled.
> 
> Adrian has this:
>     https://lore.kernel.org/all/20261102074039.26983-2-adrian.hunter@intel.com/
> 
> I sort of asked for flush on suspend but Adrian pointed out the NMI
> problem.

Thanks, I missed that. It is the same issue, just a different trigger. 
Adrian's example even ends in the same hung task we see 
(fsnotify_mark_destroy_workfn waiting on SRCU). Also, Adrian's 
syscore_resume() placement would cover the Xen case as well, as 
xen_suspend() calls syscore_resume() after those printk()s.

> 
> Looking at #1, you could probably limit it to a nop on
> !arch_irq_work_has_interrupt(). The tick should not be disabled if
> irq_work_needs_cpu() returns true (you don't add anything).
> 

Yes, right, the lazy part is pointless.

> And lazy items get handled via irq_work_tick() anyway. This make me
> think if it gets any easier if we handle both in irq_work_tick(). On x86
> raised_list is evaluated anyway so by dropping
> arch_irq_work_has_interrupt() we would avoid the APIC check and handle
> list in this rare case. If the IRQ-work is working then the list remains
> empty.
> 

This is maybe a cleaner solution, it needs no APIC access and no call 
site in the suspend paths. But irq_work_needs_cpu() would need the same 
change, otherwise in a CONFIG_NOHZ=y setting an idle CPU would still sit 
on the work until it leaves idle and re-enables the timer tick, no? I 
will test this.

>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> 
> Sebastian
> 

(Sorry, sending from my personal address, my work mail server currently 
mangles mails to the list.)

Julian

