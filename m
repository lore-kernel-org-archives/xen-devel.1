Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A7BC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 15:08:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C89920659
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 15:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKt6Leh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C89920659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsyN-0005qG-Lb; Wed, 13 May 2020 15:07:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpYu=63=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jYsyM-0005qA-KI
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 15:07:02 +0000
X-Inumbo-ID: 65cddacc-952b-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65cddacc-952b-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 15:07:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id y24so28926062wma.4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=0ppYH1uoJsmVYxgQK4IIad79h5mAJL8RIv2tg3nr+4A=;
 b=SKt6Leh7uQ+0vSpAkgVJ62kddnpzoJlRXwkIOXaCs97PV7OMFEYZBwY4OLkkjKmetc
 oX9Y28TKu25qSxsZMKMwGDTpoCDKvT+X4qs3SmkSpZiHvnoqrtZXiEu7CNYARJ38PpaH
 hUODt3Gmi5TEDf6R+3NnVMp1sv3ldEZoHuN/giEuZhPnE99Wb8WR9HYI4xo8eIYuh2W9
 TniMoVb5CLLfp9Fj77GWv91JLdgF6QovNaC3RWAxYtQJsuwCDcQZTm5ScXgl5yTCXPpO
 1qiU2+ltYVbPZmYccpi/TrUFw6UIZjDcCHWd6LLFskrCd0HKjPuD49hl5hnLXpjC0w96
 T0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=0ppYH1uoJsmVYxgQK4IIad79h5mAJL8RIv2tg3nr+4A=;
 b=egZCpSnSU4U7sTiZ+Rx7eGgE3OQmHmybbCC665ckYcsK7f0dtGOCkcw0ZeZ3cJ6eej
 fR1gcqGGrMzaG42fANhhJhNehrAo3SvSUFWDZlJyhJV0ByJygi9sVj8AR+GkovdGv5BR
 JUUP1XuSns7i7wmKDH/GEZTTyLojmAbq6qf8L6cEAq5JUjg5g/jt+WS8RQF9gDQVC41o
 L5WGiuukps3c75eL4PYWti2jCdeJlZRbEKr39b5XJH3Mdz7JXx2Xtmz/Tr03BOHyTeWf
 cmMMGlTpK8Obs44cVayNxKx/SgqjKawIUmrTmCIahSFijR2GR92F2itQEFFVXQ/NApEF
 wQXw==
X-Gm-Message-State: AGi0PubV2qySIYbF4j2SGT2pGqT7753FNMMe8A/oBvbvyVg7YnCNLeM2
 vY3NRJaaZWlPYr8GdJncbzQ=
X-Google-Smtp-Source: APiQypLf4GYAApxzBmDRzlKwxgfnRYCix/En4wffCcYg/HtKlmC9eipF8nl44R9NTiF6uj8+uxo2DA==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr18804456wml.75.1589382420825; 
 Wed, 13 May 2020 08:07:00 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id j206sm27149721wmj.20.2020.05.13.08.06.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 08:07:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-3-paul@xen.org>
 <70d94284-264b-b03d-1577-fafcf125a9b1@suse.com>
In-Reply-To: <70d94284-264b-b03d-1577-fafcf125a9b1@suse.com>
Subject: RE: [PATCH v2 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Date: Wed, 13 May 2020 16:06:59 +0100
Message-ID: <001001d62938$26edbbb0$74c93310$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwJNGvp/Al3A28moEP8owA==
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 29 April 2020 15:51
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH v2 2/5] xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
> 
> On 07.04.2020 19:38, Paul Durrant wrote:
> > @@ -358,6 +359,113 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
> >      return ERR_PTR(ret);
> >  }
> >
> > +struct domctl_context
> > +{
> > +    void *buffer;
> > +    size_t len;
> > +    size_t cur;
> > +};
> > +
> > +static int accumulate_size(void *priv, const void *data, size_t len)
> > +{
> > +    struct domctl_context *c = priv;
> > +
> > +    if ( c->len + len < c->len )
> > +        return -EOVERFLOW;
> > +
> > +    c->len += len;
> > +
> > +    return 0;
> > +}
> > +
> > +static int save_data(void *priv, const void *data, size_t len)
> > +{
> > +    struct domctl_context *c = priv;
> > +
> > +    if ( c->len - c->cur < len )
> > +        return -ENOSPC;
> > +
> > +    memcpy(c->buffer + c->cur, data, len);
> > +    c->cur += len;
> > +
> > +    return 0;
> > +}
> > +
> > +static int getdomaincontext(struct domain *d,
> > +                            struct xen_domctl_getdomaincontext *gdc)
> > +{
> > +    struct domctl_context c = { };
> 
> Please can you use ZERO_BLOCK_PTR or some such for the buffer
> field, such that errnoeous use of the field would not end up
> as a (PV-controllable) NULL deref. (Yes, it's a domctl, but
> still.) This being common code you also want to get things
> right for Arm, irrespective of whether the code will be dead
> there for now.
> 

Ok.

> > +    int rc;
> > +
> > +    if ( d == current->domain )
> > +        return -EPERM;
> > +
> > +    if ( guest_handle_is_null(gdc->buffer) ) /* query for buffer size */
> > +    {
> > +        if ( gdc->size )
> > +            return -EINVAL;
> > +
> > +        /* dry run to acquire buffer size */
> > +        rc = domain_save(d, accumulate_size, &c, true);
> > +        if ( rc )
> > +            return rc;
> > +
> > +        gdc->size = c.len;
> > +        return 0;
> > +    }
> > +
> > +    c.len = gdc->size;
> > +    c.buffer = xmalloc_bytes(c.len);
> 
> What sizes are we looking at here? It may be better to use vmalloc()
> right from the start.

Could be quite big so that seems reasonable.

> If not, I'd like to advocate for using
> xmalloc_array() instead of xmalloc_bytes() - see the almost-XSA
> commit cf38b4926e2b.
> 
> > +    if ( !c.buffer )
> > +        return -ENOMEM;
> > +
> > +    rc = domain_save(d, save_data, &c, false);
> > +
> > +    gdc->size = c.cur;
> > +    if ( !rc && copy_to_guest(gdc->buffer, c.buffer, gdc->size) )
> 
> As to my remark in patch 1 on the size field, applying to this size
> field too - copy_to_user{,_hvm}() don't support a 64-bit value (on
> y86 at least).

Ok.

> 
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -38,7 +38,7 @@
> >  #include "hvm/save.h"
> >  #include "memory.h"
> >
> > -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000012
> > +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
> 
> I don't see you making any change making the interface backwards
> incompatible, hence no need for the bump.
> 

Ok.

> > @@ -1129,6 +1129,44 @@ struct xen_domctl_vuart_op {
> >                                   */
> >  };
> >
> > +/*
> > + * Get/Set domain PV context. The same struct xen_domctl_domaincontext
> > + * is used for both commands but with slightly different field semantics
> > + * as follows:
> > + *
> > + * XEN_DOMCTL_getdomaincontext
> > + * ---------------------------
> > + *
> > + * buffer (IN):   The buffer into which the context data should be
> > + *                copied, or NULL to query the buffer size that should
> > + *                be allocated.
> > + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> > + *                zero, and the value passed out will be the size of the
> > + *                buffer to allocate.
> > + *                If 'buffer' is non-NULL then the value passed in must
> > + *                be the size of the buffer into which data may be copied.
> 
> This leaves open whether the size also gets updated in this latter
> case.

I'll clarify.

> 
> > + */
> > +struct xen_domctl_getdomaincontext {
> > +    uint64_t size;
> 
> If this is to remain 64-bits (with too large values suitably taken
> care of for all cases - see above), uint64_aligned_t please for
> consistency, if nothing else.

I've changed to uint32_t.

  Paul

> 
> Jan


