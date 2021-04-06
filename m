Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D116AC433ED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 07:40:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50926613B8
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 07:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50926613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.105653.202070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgKH-0000uA-M0; Tue, 06 Apr 2021 07:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105653.202070; Tue, 06 Apr 2021 07:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTgKH-0000u3-It; Tue, 06 Apr 2021 07:40:41 +0000
Received: by outflank-mailman (input) for mailman id 105653;
 Tue, 06 Apr 2021 07:40:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTgKF-0000ty-Is
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 07:40:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e4aaed-fa06-48fd-96ba-223fd7648f79;
 Tue, 06 Apr 2021 07:40:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9119EB013;
 Tue,  6 Apr 2021 07:40:37 +0000 (UTC)
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
X-Inumbo-ID: 91e4aaed-fa06-48fd-96ba-223fd7648f79
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617694837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiGvOmOcRxUSbOGwO40D2AIMHnVfU1thnCDMr4W8rEI=;
	b=g2sHFeMS1lvRDaPKK26/pmdN5tJylETBoEESgLHKuNscAuMmpiPnf5Xzy+oTTqBXEv0Cyz
	BYpl4qZawqIg79cC7/slo0ufeKv+GJkns/MS4uI8CyggyMvDTWY+WWqbLvX3MCZYV0EAJa
	2qjJMlsMoQvjkqh0PZ38f78Oup9koA0=
Subject: Re: [PATCH 2/2] xen/gunzip: Allow perform_gunzip() to be called
 multiple times
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210402152105.29387-1-julien@xen.org>
 <20210402152105.29387-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43460d2d-b259-5010-62a7-47ded0ec623b@suse.com>
Date: Tue, 6 Apr 2021 09:40:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402152105.29387-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.04.2021 17:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently perform_gunzip() can only be called once because the
> the internal state (e.g allocate) is not fully re-initialized.
> 
> This works fine if you are only booting dom0. But this will break when
> booting multiple using the dom0less that uses compressed kernel images.
> 
> This can be resolved by re-initializing bytes_out, malloc_ptr,
> malloc_count every time perform_gunzip() is called.
> 
> Note the latter is only re-initialized for hardening purpose as there is
> no guarantee that every malloc() are followed by free() (It should in
> theory!).
> 
> Take the opportunity to check the return of alloc_heap_pages() to return
> an error rather than dereferencing a NULL pointer later on failure.
> 
> Reported-by: Charles Chiou <cchiou@ambarella.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

