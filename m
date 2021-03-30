Return-Path: <SRS0=ZQjX=I4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC89C433C1
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 12:49:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6982619C2
	for <xen-devel@archiver.kernel.org>; Tue, 30 Mar 2021 12:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6982619C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103507.197452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRDoB-00034o-3e; Tue, 30 Mar 2021 12:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103507.197452; Tue, 30 Mar 2021 12:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRDoB-00034h-0Q; Tue, 30 Mar 2021 12:49:23 +0000
Received: by outflank-mailman (input) for mailman id 103507;
 Tue, 30 Mar 2021 12:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRDo9-00034c-QI
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 12:49:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f635b6f-2d9e-4ce3-9974-9981d3869f9f;
 Tue, 30 Mar 2021 12:49:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D729BB2F9;
 Tue, 30 Mar 2021 12:49:19 +0000 (UTC)
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
X-Inumbo-ID: 4f635b6f-2d9e-4ce3-9974-9981d3869f9f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617108559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyznaQ3QGmreUcfxQcp07v6tmW3UNYHcz1Q8K9QbyTw=;
	b=asVPTISKzTpqkkT5CtYO8WVfu5T7TLXKB2jJZgLhYfbFlr1ocMACuruRpBvn7wCE9kRS3K
	hs4fQotfGDLloDMNGmIeDpfbSsL3YuDs0GDzfClp/Ku4gfifhriL2dEa9//ManHqqT5RLL
	QiHTk7bVQ0le98Npny2maSVfRvUMXWI=
Subject: Re: [PATCH v3 2/2] x86/vpt: Simplify locking argument to
 write_{un}lock
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wl@xen.org,
 stephen.s.brennan@oracle.com, iwj@xenproject.org
References: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
 <1617052502-14181-3-git-send-email-boris.ostrovsky@oracle.com>
 <YGLU78AZmN2SAIbV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a2e901c-b14c-8969-3b9a-41874dd2a7c4@suse.com>
Date: Tue, 30 Mar 2021 14:49:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGLU78AZmN2SAIbV@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 30.03.2021 09:36, Roger Pau Monné wrote:
> On Mon, Mar 29, 2021 at 05:15:02PM -0400, Boris Ostrovsky wrote:
>> Make both create_periodic_time() and pt_adjust_vcpu() call
>> write_{un}lock with similar arguments.

This makes it sound like you adjust both functions, but really
you bring the latter in line with the former. Would you mind me
adjusting the wording along these lines while (and when)
committing?

> Might be worth adding that this is not a functional change?
> 
>> Requested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> Either way:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
>> ---
>> New patch.
>>
>> I ended up doing what Jan asked --- create_periodic_time() is also using different
>> start pointers in lock() and unlock().
> 
> Hm, I'm not sure I'm following, create_periodic_time uses 'v' in both
> write_{un}lock calls, which doesn't change across the function.

I guess Boris merely meant to express that there's already precedent?

Jan

