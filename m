Return-Path: <SRS0=eoLF=DC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3C8C4727C
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 10:34:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96F321D91
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 10:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="q7tpNhCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96F321D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLl3j-0004tv-Qh; Fri, 25 Sep 2020 10:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O9+A=DC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kLl3j-0004tn-05
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 10:34:35 +0000
X-Inumbo-ID: e0c6c3b1-47ef-4672-afe7-7ebb5af40951
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0c6c3b1-47ef-4672-afe7-7ebb5af40951;
 Fri, 25 Sep 2020 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=8seRCI8Qnum4DQX8B2sTDgmO3095sLTy3tXaHpt67cU=; b=q7tpNhCqs3+p5kV0OIzb25Q3TC
 NgFB5hoqC+YdSEhyoRf+pIQUQaqYr1lDDIBShjSGjlLmcuwl9RwWW7T7A1yq23XPp3twCs2/EJvec
 tLtYF1VtdZ2REB4+Wj9P4+F8/9UOvhmZ+JY7po45MbY5Qh34ctzqzCzEA+CZOzQpZ154=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLl3a-00088d-K3; Fri, 25 Sep 2020 10:34:26 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLl3a-0001LX-9y; Fri, 25 Sep 2020 10:34:26 +0000
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
Date: Fri, 25 Sep 2020 11:34:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 24/09/2020 11:53, Jan Beulich wrote:
> xmalloc() & Co may not be called with IRQs off, or else check_lock()
> will have its assertion trigger about locks getting acquired
> inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
> very reasonable, especially since the per-channel lock was introduced to
> avoid acquiring the per-domain event lock on the send paths. Issue a
> second call to xsm_evtchn_send() instead, before acquiring the lock, to
> give XSM / Flask a chance to pre-allocate whatever it may need.

This is the sort of fall-out I was expecting when we decide to turn off 
the interrupts for big chunk of code. I couldn't find any at the time 
though...

Can you remind which caller of send_guest{global, vcpu}_virq() will call 
them with interrupts off?

Would it be possible to consider deferring the call to a softirq 
taslket? If so, this would allow us to turn the interrupts again.

Cheers,

-- 
Julien Grall

