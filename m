Return-Path: <SRS0=JyiM=EJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C8CC2D0A3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 09:02:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB3F20756
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 09:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qA9kbPaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB3F20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18031.42760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsCj-0008Sc-2m; Tue, 03 Nov 2020 09:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18031.42760; Tue, 03 Nov 2020 09:02:13 +0000
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
	id 1kZsCi-0008SV-Vs; Tue, 03 Nov 2020 09:02:12 +0000
Received: by outflank-mailman (input) for mailman id 18031;
 Tue, 03 Nov 2020 09:02:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZsCh-0008SQ-Kx
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:02:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fd9f288e-df66-4b16-b094-9c531d797801;
 Tue, 03 Nov 2020 09:02:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C791CAD5C;
 Tue,  3 Nov 2020 09:02:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZsCh-0008SQ-Kx
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:02:11 +0000
X-Inumbo-ID: fd9f288e-df66-4b16-b094-9c531d797801
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id fd9f288e-df66-4b16-b094-9c531d797801;
	Tue, 03 Nov 2020 09:02:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604394128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vi9N5nBf/53EkCEaORyxgE2bXfiCipN+Ny20Cw3cmG4=;
	b=qA9kbPajaM2g0q5hYoiN/u6A086fOOX4VEwrKmAyOaapVRTHBDPh3WQalim3kS/YAXHhTw
	3Yp2pct+i30maGzwqlDL/Shh42i5n/89lcOkh4aBkt9LG/v2I8Hs7fi5/MPey09N1tbPAz
	1ctO42TMdBIzCuksck4k5nMvvc9GOQI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C791CAD5C;
	Tue,  3 Nov 2020 09:02:08 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201102131239.14134-1-jgross@suse.com>
 <20201102131239.14134-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
Date: Tue, 3 Nov 2020 10:02:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102131239.14134-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.11.2020 14:12, Juergen Gross wrote:
> --- a/xen/include/xen/rwlock.h
> +++ b/xen/include/xen/rwlock.h
> @@ -56,6 +56,7 @@ static inline int _read_trylock(rwlock_t *lock)
>      u32 cnts;
>  
>      preempt_disable();
> +    check_lock(&lock->lock.debug, true);
>      cnts = atomic_read(&lock->cnts);
>      if ( likely(_can_read_lock(cnts)) )
>      {

I'm sorry for being picky, but this still isn't matching
_spin_trylock(). Perhaps the difference is really benign, but
there the check sits ahead of preempt_disable(). (It has a
clear reason to be this way there, but without a clear reason
for things to be differently here, I think matching ordering
may help, at least to avoid questions.)

> @@ -66,6 +67,7 @@ static inline int _read_trylock(rwlock_t *lock)
>           */
>          if ( likely(_can_read_lock(cnts)) )
>              return 1;
> +
>          atomic_sub(_QR_BIAS, &lock->cnts);
>      }
>      preempt_enable();

Stray change?

> @@ -87,7 +89,10 @@ static inline void _read_lock(rwlock_t *lock)
>       * arch_lock_acquire_barrier().
>       */
>      if ( likely(_can_read_lock(cnts)) )
> +    {
> +        check_lock(&lock->lock.debug, false);
>          return;
> +    }
>  
>      /* The slowpath will decrement the reader count, if necessary. */
>      queue_read_lock_slowpath(lock);
> @@ -162,7 +167,10 @@ static inline void _write_lock(rwlock_t *lock)
>       * arch_lock_acquire_barrier().
>       */
>      if ( atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) == 0 )
> +    {
> +        check_lock(&lock->lock.debug, false);
>          return;
> +    }
>  
>      queue_write_lock_slowpath(lock);
>      /*

Maybe also for these two, but likely more importantly for ...

> @@ -328,6 +337,8 @@ static inline void _percpu_read_lock(percpu_rwlock_t **per_cpudata,
>          /* Drop the read lock because we don't need it anymore. */
>          read_unlock(&percpu_rwlock->rwlock);
>      }
> +    else
> +        check_lock(&percpu_rwlock->rwlock.lock.debug, false);
>  }

... this one a brief comment may be warranted to clarify why
the call sits here rather than at the top?

Jan

