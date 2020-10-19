Return-Path: <SRS0=rP1u=D2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7A6C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 14:31:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6228222D9
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 14:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dGFvWwhr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6228222D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8727.23400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUWBh-00034q-Fj; Mon, 19 Oct 2020 14:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8727.23400; Mon, 19 Oct 2020 14:31:01 +0000
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
	id 1kUWBh-00034j-B0; Mon, 19 Oct 2020 14:31:01 +0000
Received: by outflank-mailman (input) for mailman id 8727;
 Mon, 19 Oct 2020 14:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUWBg-00034e-Tq
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:31:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ad2fe33-7376-4003-a082-c54b18cb8549;
 Mon, 19 Oct 2020 14:30:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1BD2AE16;
 Mon, 19 Oct 2020 14:30:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUWBg-00034e-Tq
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:31:00 +0000
X-Inumbo-ID: 0ad2fe33-7376-4003-a082-c54b18cb8549
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0ad2fe33-7376-4003-a082-c54b18cb8549;
	Mon, 19 Oct 2020 14:30:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603117859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtR3m5DNeHACrZG7hBrgHqJDYkbABQ8PlejywjfYnOg=;
	b=dGFvWwhr35WZ7qVK4QyFy12l3HlmGPhonEVJ/I3taYdFQBceL8hZgey95715viE9x29UgM
	p+9ddO4bhb1u/C3IYdLJYx+aiN2TDUpn375Qx33/zRenBF95RTP1djNWFwnliUhfqeoGd8
	u55koVjg29Ks7EEBh1JFDj4KoKXpZjI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E1BD2AE16;
	Mon, 19 Oct 2020 14:30:58 +0000 (UTC)
Subject: Re: [PATCH v10 03/11] xen/common/domctl: introduce
 XEN_DOMCTL_get/set_domain_context
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <025d8753-5dd7-a114-6b27-f50ec863582c@suse.com>
Date: Mon, 19 Oct 2020 16:30:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008185735.29875-4-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.10.2020 20:57, Paul Durrant wrote:
> +static int dry_run_end(void *priv, size_t len)
> +{
> +    struct domctl_context *c = priv;
> +
> +    ASSERT(IS_ALIGNED(c->len, DOMAIN_CONTEXT_RECORD_ALIGN));
> +
> +    return 0;
> +}
> +
> +static struct domain_save_ctxt_ops dry_run_ops = {

const? (same for save_ops and load_ops then)

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1132,6 +1132,41 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/*
> + * XEN_DOMCTL_get_domain_context
> + * -----------------------------
> + *
> + * buffer (IN):   The buffer into which the context data should be
> + *                copied, or NULL to query the buffer size that should
> + *                be allocated.
> + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> + *                zero, and the value passed out will be the size of the
> + *                buffer to allocate.
> + *                If 'buffer' is non-NULL then the value passed in must
> + *                be the size of the buffer into which data may be copied.
> + *                The value passed out will be the size of data written.
> + */
> +struct xen_domctl_get_domain_context {
> +    uint64_t size;

uint64_aligned_t (also again below)?

With these adjusted
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

