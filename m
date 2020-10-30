Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95328C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:59:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14ECA20727
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="AVe9Nd2p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14ECA20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15955.39199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVsL-00040M-8d; Fri, 30 Oct 2020 14:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15955.39199; Fri, 30 Oct 2020 14:59:33 +0000
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
	id 1kYVsL-00040F-5R; Fri, 30 Oct 2020 14:59:33 +0000
Received: by outflank-mailman (input) for mailman id 15955;
 Fri, 30 Oct 2020 14:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYVsJ-00040A-77
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:59:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75e7c940-c471-4c61-9eea-750cca740724;
 Fri, 30 Oct 2020 14:59:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 743E1AC12;
 Fri, 30 Oct 2020 14:59:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYVsJ-00040A-77
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:59:31 +0000
X-Inumbo-ID: 75e7c940-c471-4c61-9eea-750cca740724
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 75e7c940-c471-4c61-9eea-750cca740724;
	Fri, 30 Oct 2020 14:59:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604069969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPeJnNrZ1raiHYYF/ZUmjakmrWYlcPvFjGTBg4ACVyI=;
	b=AVe9Nd2pH4zFutlRgzRlwBq3rrpcU9tZI34XlEsMSzVvKYOe4OufAkXTwbyf4m6jaekKZW
	avo+vEjX1kMfK07GNpnJzADvd23Shdbq9+312uotN/YiGEgbCnjShFRf7Zik/85V7GU5Pl
	05rG8H76swjv6MadLTSUNyvYbw90FpU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 743E1AC12;
	Fri, 30 Oct 2020 14:59:29 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/spinlocks: spin_trylock with interrupts off is
 always fine
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201030142500.5464-1-jgross@suse.com>
 <20201030142500.5464-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52ae01f4-b887-15da-aecb-b29b7c55a057@suse.com>
Date: Fri, 30 Oct 2020 15:59:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030142500.5464-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.10.2020 15:24, Juergen Gross wrote:
> Even if a spinlock was taken with interrupts on before calling
> spin_trylock() with interrupts off is fine, as it can't block.
> 
> Add a bool parameter "try" to check_lock() for handling this case.
> 
> Remove the call of check_lock() from _spin_is_locked(), as it really
> serves no purpose and it can even lead to false crashes, e.g. when
> a lock was taken correctly with interrupts enabled and the call of
> _spin_is_locked() happened with interrupts off. In case the lock is
> taken with wrong interrupt flags this will be catched when taking
> the lock.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit I guess ...

> @@ -42,7 +42,13 @@ static void check_lock(union lock_debug *debug)
>       * 
>       * To guard against this subtle bug we latch the IRQ safety of every
>       * spinlock in the system, on first use.
> +     *
> +     * A spin_trylock() or spin_is_locked() with interrupts off is always
> +     * fine, as those can't block and above deadlock scenario doesn't apply.
>       */
> +    if ( try && irq_safe )
> +        return;

... the reference to spin_is_locked() here wants dropping,
since ...

> @@ -220,8 +226,6 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
>  
>  int _spin_is_locked(spinlock_t *lock)
>  {
> -    check_lock(&lock->debug);

... you drop the call here?

Jan

