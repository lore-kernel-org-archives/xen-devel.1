Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF6CC388F9
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 15:42:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E1320797
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 15:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="On8fdivD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E1320797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11104.29473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzDG-0002aU-Hq; Fri, 23 Oct 2020 15:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11104.29473; Fri, 23 Oct 2020 15:42:42 +0000
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
	id 1kVzDG-0002aM-E5; Fri, 23 Oct 2020 15:42:42 +0000
Received: by outflank-mailman (input) for mailman id 11104;
 Fri, 23 Oct 2020 15:42:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVzDF-0002WD-55
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8540496d-860c-429e-96fa-8c2ceb2bc626;
 Fri, 23 Oct 2020 15:42:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4400DAF2B;
 Fri, 23 Oct 2020 15:42:39 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVzDF-0002WD-55
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:41 +0000
X-Inumbo-ID: 8540496d-860c-429e-96fa-8c2ceb2bc626
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8540496d-860c-429e-96fa-8c2ceb2bc626;
	Fri, 23 Oct 2020 15:42:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603467759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvO0lS572aXuQyWV7KeUQz/6uyXq3Y+9QrhDtWKaEFw=;
	b=On8fdivDL45GQ3MXIeD3S2COb2X+aKdcUGS2nTXS4GxYpY10gQOuk1n2NAPxZ4iZXx53SD
	osW/+XVkgxjgEvw2Z0PwDJdIBMX60pFUbgrlfYsYf5JOPxnBGJEAE7ipBWkCtaLgGRyGB2
	JMF8bKA5Rc7daOsZDEgLV4t0nrI0qS0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4400DAF2B;
	Fri, 23 Oct 2020 15:42:39 +0000 (UTC)
Subject: Re: [PATCH v2 11/11] x86/vpt: introduce a per-vPT lock
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-12-roger.pau@citrix.com>
 <20200930133048.GV19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae9d0ba6-3aed-7ce6-bea8-a42b60af7137@suse.com>
Date: Fri, 23 Oct 2020 17:42:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930133048.GV19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.09.2020 15:30, Roger Pau Monné wrote:
> On Wed, Sep 30, 2020 at 12:41:08PM +0200, Roger Pau Monne wrote:
>> Introduce a per virtual timer lock that replaces the existing per-vCPU
>> and per-domain vPT locks. Since virtual timers are no longer assigned
>> or migrated between vCPUs the locking can be simplified to a
>> in-structure spinlock that protects all the fields.
>>
>> This requires introducing a helper to initialize the spinlock, and
>> that could be used to initialize other virtual timer fields in the
>> future.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Just realized I had the following uncommitted chunk that should have
> been part of this patch, nothing critical but the tm_lock can now be
> removed.

And then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

