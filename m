Return-Path: <SRS0=weQ1=FI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CDC433FE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 08:31:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7947B225AC
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 08:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7947B225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.44124.79101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6UX-0003qj-Qj; Fri, 04 Dec 2020 08:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44124.79101; Fri, 04 Dec 2020 08:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6UX-0003qc-N6; Fri, 04 Dec 2020 08:31:01 +0000
Received: by outflank-mailman (input) for mailman id 44124;
 Fri, 04 Dec 2020 08:31:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl6UW-0003qV-Fn
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:31:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 473efd3f-d951-4b0a-bf74-9e7760a255c8;
 Fri, 04 Dec 2020 08:30:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42418AE1C;
 Fri,  4 Dec 2020 08:30:58 +0000 (UTC)
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
X-Inumbo-ID: 473efd3f-d951-4b0a-bf74-9e7760a255c8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607070658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5P8en+k2rGXM8pq6flKcnrVroXRbzVd/CL+FGiJQLNY=;
	b=f7a2q0gBNgxBaVZ29o/beZ1Be65yDfelrqNjkPgKVhfzSAT3uVbvqhgzdfvcZ0BJV4OLDm
	tDbBOvNMmjS8WM+F2orfuPFispHpWQcjTzCeq96Vm3rVmd6YUUPE3zlzRi7krhDK7dHOys
	bFcF0uyYQLg4EYTHlTod7wpizyDxQE8=
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab7f1c91-ec59-1024-b902-d633bf90dd81@suse.com>
Date: Fri, 4 Dec 2020 09:30:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-13-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> @@ -100,11 +112,58 @@ static void hypfs_unlock(void)
>      }
>  }
>  
> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *entry)
> +{
> +    return entry;
> +}
> +
> +void hypfs_node_exit(const struct hypfs_entry *entry)
> +{
> +}
> +
> +static int node_enter(const struct hypfs_entry *entry)
> +{
> +    const struct hypfs_entry **last = &this_cpu(hypfs_last_node_entered);
> +
> +    entry = entry->funcs->enter(entry);
> +    if ( IS_ERR(entry) )
> +        return PTR_ERR(entry);
> +
> +    ASSERT(!*last || *last == entry->parent);
> +
> +    *last = entry;

In such a callback case I wonder whether you wouldn't want to also
guard against NULL coming back, perhaps simply by mistake, but of
course once handling it here such could even become permissible
behavior.

Jan

