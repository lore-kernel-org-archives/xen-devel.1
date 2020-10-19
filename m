Return-Path: <SRS0=rP1u=D2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A51AC433E7
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 14:07:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB44B22263
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 14:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="AB/AIHgR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB44B22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8715.23351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUVok-0000D4-J0; Mon, 19 Oct 2020 14:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8715.23351; Mon, 19 Oct 2020 14:07:18 +0000
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
	id 1kUVok-0000Cx-G0; Mon, 19 Oct 2020 14:07:18 +0000
Received: by outflank-mailman (input) for mailman id 8715;
 Mon, 19 Oct 2020 14:07:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUVoj-0000Cs-I6
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:07:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42ff7a6f-05cd-4561-8917-80d1a0a300d8;
 Mon, 19 Oct 2020 14:07:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63606AE0D;
 Mon, 19 Oct 2020 14:07:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUVoj-0000Cs-I6
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:07:17 +0000
X-Inumbo-ID: 42ff7a6f-05cd-4561-8917-80d1a0a300d8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 42ff7a6f-05cd-4561-8917-80d1a0a300d8;
	Mon, 19 Oct 2020 14:07:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603116435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1nKgLPlVkEfrTGaZqmrHtaozVAlPCHq7SQ2nOKcKHBM=;
	b=AB/AIHgRV7vh5gXD9zT5qizeFS3nRofXGBZIcVuTiyBRYTz5C5aAWv80QLswZ1pQ19uKEu
	vl4RVBs8/NQ7d0KfwdTw82WQjY8vvigfiUwuSgNtUEJpoibmNZCaoTy1wwF69GG2Ray5fL
	ct5IX9KcDcQPpT2mbCafarpmRfLteuM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 63606AE0D;
	Mon, 19 Oct 2020 14:07:15 +0000 (UTC)
Subject: Re: [PATCH v10 02/11] xen: introduce implementation of save/restore
 of 'domain context'
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0bb2db8-e69a-8107-194c-538e2a85fecf@suse.com>
Date: Mon, 19 Oct 2020 16:07:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008185735.29875-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.10.2020 20:57, Paul Durrant wrote:
> +void __init domain_register_ctxt_type(unsigned int type, const char *name,
> +                                      domain_save_ctxt_type save,
> +                                      domain_load_ctxt_type load)
> +{
> +    BUG_ON(type >= ARRAY_SIZE(fns));
> +
> +    ASSERT(!fns[type].save);
> +    ASSERT(!fns[type].load);
> +
> +    fns[type].name = name;

I expect I merely didn't spot this (perhaps just latent) issue in
earlier versions: If the caller lives in code getting built into
*.init.o, the string passed in will live in .init.rodata. That's a
general shortcoming (if you like) of the .o -> .init.o
tranformation, but I see no good alternative (or else all format
strings passed to printk() and alike won't get moved either).
Therefore I wonder whether it wouldn't be safer to have the struct
field be e.g. char[16], assuming 15 characters will allow for
meaningful names.

> +int domain_load_ctxt_rec_data(struct domain_ctxt_state *c, void *dst,
> +                              size_t len)
> +{
> +    int rc = 0;
> +
> +    c->len += len;
> +    if (c->len > c->rec.length)

Nit: Missing blanks.

> +int domain_load_ctxt(struct domain *d, const struct domain_load_ctxt_ops *ops,
> +                     void *priv)
> +{
> +    struct domain_ctxt_state c = { .d = d, .ops.load = ops, .priv = priv, };
> +    domain_load_ctxt_type load;
> +    int rc;
> +
> +    ASSERT(d != current->domain);
> +
> +    rc = c.ops.load->read(c.priv, &c.rec, sizeof(c.rec));
> +    if ( rc )
> +        return rc;
> +
> +    load = fns[DOMAIN_CONTEXT_START].load;
> +    BUG_ON(!load);
> +
> +    rc = load(d, &c);
> +    if ( rc )
> +        return rc;
> +
> +    domain_pause(d);
> +
> +    for (;;)

Nit: Missing blanks again.

> +    {
> +        unsigned int type;
> +
> +        rc = c.ops.load->read(c.priv, &c.rec, sizeof(c.rec));
> +        if ( rc )
> +            break;
> +
> +        type = c.rec.type;
> +        if ( type == DOMAIN_CONTEXT_END )
> +            break;
> +
> +        rc = -EINVAL;
> +        if ( type >= ARRAY_SIZE(fns) )
> +            break;
> +
> +        load = fns[type].load;

While this is meant to be used by Dom0 only, I think it would be
better if it nevertheless used array_access_nospec().

> +static int load_start(struct domain *d, struct domain_ctxt_state *c)
> +{
> +    static struct domain_context_start s;
> +    unsigned int i;
> +    int rc = domain_load_ctxt_rec(c, DOMAIN_CONTEXT_START, &i, &s, sizeof(s));
> +
> +    if ( rc )
> +        return rc;
> +
> +    if ( i )
> +        return -EINVAL;
> +
> +    /*
> +     * Make sure we are not attempting to load an image generated by a newer
> +     * version of Xen.
> +     */
> +    if ( s.xen_major > XEN_VERSION && s.xen_minor > XEN_SUBVERSION )
> +        return -EOPNOTSUPP;

Are you sure this needs to be excluded here and unilaterally?
And if this is to stay, then it wants to be

    if ( s.xen_major > XEN_VERSION ||
         (s.xen_major == XEN_VERSION && s.xen_minor > XEN_SUBVERSION) )
        return -EOPNOTSUPP;

> +/*
> + * Register save and load handlers for a record type.
> + *
> + * Save handlers will be invoked in an order which copes with any inter-
> + * entry dependencies. For now this means that HEADER will come first and
> + * END will come last, all others being invoked in order of 'typecode'.
> + *
> + * Load handlers will be invoked in the order of entries present in the
> + * buffer.
> + */
> +#define DOMAIN_REGISTER_CTXT_TYPE(x, s, l)                    \
> +    static int __init __domain_register_##x##_ctxt_type(void) \
> +    {                                                         \
> +        domain_register_ctxt_type(                            \
> +            DOMAIN_CONTEXT_ ## x,                             \
> +            #x,                                               \
> +            &(s),                                             \
> +            &(l));                                            \

I don't think there's a need for each of these to consume a separate
line.

Jan

