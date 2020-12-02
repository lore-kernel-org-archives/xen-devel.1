Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEA9C64E7C
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 15:36:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9645120B1F
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 15:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9645120B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42834.77084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUAo-0000aY-Js; Wed, 02 Dec 2020 15:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42834.77084; Wed, 02 Dec 2020 15:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUAo-0000aR-Gd; Wed, 02 Dec 2020 15:36:06 +0000
Received: by outflank-mailman (input) for mailman id 42834;
 Wed, 02 Dec 2020 15:36:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkUAn-0000aM-1C
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 15:36:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d95d972e-43a9-4742-9ce6-4a52e7f6393f;
 Wed, 02 Dec 2020 15:36:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDC85AB63;
 Wed,  2 Dec 2020 15:36:01 +0000 (UTC)
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
X-Inumbo-ID: d95d972e-43a9-4742-9ce6-4a52e7f6393f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606923361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3I7h9s1udaVS+hRbRz2OFRXoYsRef5P1i5uTR+suZ0=;
	b=pH7ZssuG2F6ZqNN3mDfgBKHr3nmV221P4UOLSlRpBattpx8QOYpUPRO4tTmV11JV4+KDQO
	PGLCQRugxarlE0pz59BU6VndkY8QDofq2oxE8d6KOZK8er9VP7MWqwVTMTchmwz74i6q3P
	P2RPIUan5FXg11lCjzyAEDKlyPgDrr0=
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
Date: Wed, 2 Dec 2020 16:36:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-10-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> @@ -297,6 +321,7 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf,
>      int ret;
>  
>      ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
> +    ASSERT(leaf->e.max_size);
>  
>      if ( ulen > leaf->e.max_size )
>          return -ENOSPC;
> @@ -357,6 +382,7 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
>      int ret;
>  
>      ASSERT(this_cpu(hypfs_locked) == hypfs_write_locked);
> +    ASSERT(leaf->e.max_size);
>  
>      /* Avoid oversized buffer allocation. */
>      if ( ulen > MAX_PARAM_SIZE )

At the first glance both of these hunks look as if they
wouldn't belong here, but I guess the ASSERT()s are getting
lifted here from hypfs_write(). (The first looks even somewhat
redundant with the immediately following if().) If this
understanding of mine is correct,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -382,19 +408,20 @@ int hypfs_write_custom(struct hypfs_entry_leaf *leaf,
>      return ret;
>  }
>  
> +int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen)
> +{
> +    return -EACCES;
> +}
> +
>  static int hypfs_write(struct hypfs_entry *entry,
>                         XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen)

As a tangent, is there a reason these write functions don't take
handles of "const void"? (I realize this likely is nothing that
wants addressing right here.)

Jan

