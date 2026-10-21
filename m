Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBB5606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=1QaOjwqQ
Received: from list by lists.xenproject.org with outflank-mailman.1456836.1669934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJSer-0004Mo-Uo; Wed, 21 Oct 2026 09:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456836.1669934; Wed, 21 Oct 2026 09:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJSer-0004Mh-SK; Wed, 21 Oct 2026 09:30:53 +0000
Received: by outflank-mailman (input) for mailman id 1456836;
 Wed, 21 Oct 2026 09:30:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xJSep-0004Mb-WF
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 09:30:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xJSep-00000005Vfx-3cna;
 Wed, 21 Oct 2026 09:30:51 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xJSep-0000000DYRo-2Bi3;
 Wed, 21 Oct 2026 09:30:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=ANSkhbGG3Wb0xxus9wuO0harqyiYcR3OVYnLfX7PjO4=; b=1QaOjwqQ8Op4aj7HwkZEPd4S6/
	LWwQyefxgKXSwmyytSYt3VgW0DUWPhT2FTXBjdWhimOSv7xdISEBLcjBh9em0m63vxZ8Vv3JzyBEy
	SppM8G19Uznt1adhdwvxSRbgcksdi/r8fUEDt1/TYcBw+zRAULfKt3bgafO+1Y0AP2Bk=;
Date: Wed, 21 Oct 2026 11:30:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: [PATCH] x86/bzimage: Check that the payload lies within the image
Message-ID: <atiGSMp-Yy0SXB9-@Mac.lan>
References: <20261020214825.3655848-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020214825.3655848-1-stefano.stabellini@amd.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:48:25PM -0700, Stefano Stabellini wrote:
> bzimage_check() doesn't validate setup_sects, payload_offset or
> payload_length against the image size.  A truncated or malformed bzImage
> therefore makes bzimage_headroom() and bzimage_parse() read beyond the
> end of the boot module, which shows up as a fatal page fault, a bogus
> headroom, or a decompression failure, rather than as a bad image.
> 
> Reject such a header up front.  bzimage_parse() passes bzimage_check() a
> length which includes the decompression headroom in front of the image,
> so subtract it to check against the image alone.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/x86/bzimage.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
> index 66f648f311..a5c48755b6 100644
> --- a/xen/arch/x86/bzimage.c
> +++ b/xen/arch/x86/bzimage.c
> @@ -54,6 +54,8 @@ struct __packed setup_header {
>  
>  static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>  {
> +    unsigned long payload_start;
> +
>      if ( len < sizeof(struct setup_header) )
>          return 0;
>  
> @@ -65,6 +67,15 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>             hdr->version >> 8, hdr->version & 0xff);
>          return -EINVAL;
>      }
> +
> +    payload_start = (hdr->setup_sects + 1) * 512UL + hdr->payload_offset;

Do you really need the UL, doesn't it get auto-promoted to unsigned long
already?

If there's some issue with the types, that requires the calculation to
be promoted top unsigned long, the other instances of this calculation
should also be adjusted.

> +    if ( payload_start > len || hdr->payload_length > len - payload_start )
> +    {
> +        printk("bzImage payload %#x@%#lx exceeds the %#lx byte image\n",

Maybe best wqorded as:

"... payload XXX past the image size (%#lx)"

I think the "byte image" wording is not very clear IMO.

> +               hdr->payload_length, payload_start, len);
> +        return -EINVAL;
> +    }
> +
>      return 1;
>  }
>  
> @@ -107,7 +118,8 @@ int __init bzimage_parse(void *image_base, void **image_start,
>                           unsigned long *image_len)
>  {
>      struct setup_header *hdr = (struct setup_header *)(*image_start);
> -    int err = bzimage_check(hdr, *image_len);
> +    /* *image_len also counts the headroom ahead of *image_start. */

IMO you can remove the dereferences from the variable names, it just
makes the comment harder to reads for no real benefit, readers already
know by context you are referencing the contents, not the pointer
address.

Thanks, Roger.

