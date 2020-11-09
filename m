Return-Path: <SRS0=Pc9a=EP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261E7C2D0A3
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 16:48:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1102074F
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 16:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qZ5jUuQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB1102074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.22754.49168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcAKy-0002NU-0N; Mon, 09 Nov 2020 16:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22754.49168; Mon, 09 Nov 2020 16:48:11 +0000
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
	id 1kcAKx-0002NN-Sv; Mon, 09 Nov 2020 16:48:11 +0000
Received: by outflank-mailman (input) for mailman id 22754;
 Mon, 09 Nov 2020 16:48:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcAKw-0002NI-Qm
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:48:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e94f90a8-404d-42dc-83fb-ffa3a7ee0cbb;
 Mon, 09 Nov 2020 16:48:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8800CAD07;
 Mon,  9 Nov 2020 16:48:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcAKw-0002NI-Qm
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:48:10 +0000
X-Inumbo-ID: e94f90a8-404d-42dc-83fb-ffa3a7ee0cbb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e94f90a8-404d-42dc-83fb-ffa3a7ee0cbb;
	Mon, 09 Nov 2020 16:48:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604940488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZeeLWfSAPUv67W5P3EPdo1W/Zp3+Po4OXwB6EjUj6+4=;
	b=qZ5jUuQcLgS0Df44dPaDkPnBlEVdEBAi+3uwAnQLLNrwMdZy8u4wIlZjxm/k8K8BRRXItW
	aYuON8rfuixrjLGpGIuojSg+lrvWwd81v77Z6+afBD0G0fdZ4qkIUj3E0i53U7hHWM+mKm
	aDdsqca57fBeGx6Drr4kkDWlZ7lfbB0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8800CAD07;
	Mon,  9 Nov 2020 16:48:08 +0000 (UTC)
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f64158af-3468-053f-7cbe-d52ab01b8bfc@suse.com>
Date: Mon, 9 Nov 2020 17:48:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109163826.13035-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 17:38, Juergen Gross wrote:
> Currently the lock for a single event channel needs to be taken with
> interrupts off, which causes deadlocks in some cases.
> 
> Rework the per event channel lock to be non-blocking for the case of
> sending an event and removing the need for disabling interrupts for
> taking the lock.
> 
> The lock is needed for avoiding races between event channel state
> changes (creation, closing, binding) against normal operations (set
> pending, [un]masking, priority changes).
> 
> Use a rwlock, but with some restrictions:
> 
> - Changing the state of an event channel (creation, closing, binding)
>   needs to use write_lock(), with ASSERT()ing that the lock is taken as
>   writer only when the state of the event channel is either before or
>   after the locked region appropriate (either free or unbound).
> 
> - Sending an event needs to use read_trylock() mostly, in case of not
>   obtaining the lock the operation is omitted. This is needed as
>   sending an event can happen with interrupts off (at least in some
>   cases).
> 
> - Dumping the event channel state for debug purposes is using
>   read_trylock(), too, in order to avoid blocking in case the lock is
>   taken as writer for a long time.
> 
> - All other cases can use read_lock().
> 
> Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - switch to rwlock
> - add ASSERT() to verify correct write_lock() usage
> 
> V3:
> - corrected a copy-and-paste error (Jan Beulich)
> - corrected unlocking in two cases (Jan Beulich)
> - renamed evtchn_read_trylock() (Jan Beulich)
> - added some comments and an ASSERT() for evtchn_write_lock()
> - set EVENT_WRITE_LOCK_INC to INT_MIN
> 
> V2:
> - added needed barriers
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'll give it overnight for others to possibly comment, but I'd
like to get this in tomorrow if at all possible.

I also think this will want backporting beyond just the fully
maintained branches.

Jan

