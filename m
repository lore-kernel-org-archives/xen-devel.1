Return-Path: <SRS0=6W/h=IJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83990C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 11:28:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19CCE64FAD
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 11:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19CCE64FAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96460.182504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJUA-00012C-Jd; Thu, 11 Mar 2021 11:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96460.182504; Thu, 11 Mar 2021 11:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJUA-000125-GW; Thu, 11 Mar 2021 11:28:10 +0000
Received: by outflank-mailman (input) for mailman id 96460;
 Thu, 11 Mar 2021 11:28:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKJU9-000120-1u
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 11:28:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86bbf54e-494f-446a-94aa-e5a1210f8aa0;
 Thu, 11 Mar 2021 11:28:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D74FAB8C;
 Thu, 11 Mar 2021 11:28:06 +0000 (UTC)
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
X-Inumbo-ID: 86bbf54e-494f-446a-94aa-e5a1210f8aa0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615462086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M09rmtVJUUKZqaKgvyIxP14gZzQ5LrxUn164x9+lHGQ=;
	b=DOSbHszFUw8LkLIgdvY0QKKRHzEaJ1OooZxZJvPh3PPdWqyzGBjczz70pdyOcirGjdimFv
	45gf0FyRocDa7VjYTQdO8RTFamMplOqnerIMDOENm7U2TCCzjO1N8QGTz/SMNllz6tfiDD
	0sWbL9NlLR/5mIuEPY6dbOazi/DfrbE=
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9cc6f3ff-f078-1657-7c5a-9f356a857cdb@suse.com>
Date: Thu, 11 Mar 2021 12:28:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161545564302.24868.14477928469038686899.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.03.2021 10:40, Dario Faggioli wrote:
> When running an hypervisor build with NR_CPUS=1 for_each_cpu does not
> take into account whether the bit of the CPU is set or not in the
> provided mask.
> 
> This means that whatever we have in the bodies of these loops is always
> done once, even if the mask was empty and it should never be done. This
> is clearly a bug and was in fact causing an assert to trigger in credit2
> code.
> 
> Removing the special casing of NR_CPUS == 1 makes things work again.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Doesn't this want a Reported-by: Roger?

Reviewed-by: Jan Beulich <jbeulich@suse.com>

And FTR I don't really mind the other NR_CPUS == 1 piece of logic to
remain there.

> I'm not really sure whether this should be 4.15 material.
> 
> It's definitely a bug, IMO. The risk is also pretty low, considering
> that no one should really run Xen in this configuration (NR_CPUS=1, I
> mean). Which is also the reason why it's probably not really important
> that we fix it at this point of the release cycle.

I agree; I'll put it in the 4.16 bucket.

Jan

