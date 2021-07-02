Return-Path: <SRS0=Zy1u=L2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4E4C11F68
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 14:47:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC498613F1
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 14:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC498613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149173.275771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKRb-0001Z7-Ey; Fri, 02 Jul 2021 14:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149173.275771; Fri, 02 Jul 2021 14:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKRb-0001Z0-BP; Fri, 02 Jul 2021 14:47:03 +0000
Received: by outflank-mailman (input) for mailman id 149173;
 Fri, 02 Jul 2021 14:47:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GKt=L2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lzKRZ-0001Yu-HE
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 14:47:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a14a27a-5f20-40ac-8431-b9b52b3e89bd;
 Fri, 02 Jul 2021 14:46:59 +0000 (UTC)
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
X-Inumbo-ID: 9a14a27a-5f20-40ac-8431-b9b52b3e89bd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625237219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Qi9xaAYZUBrgWX3jmYBGQmATiOhIRK7rRkjsrCzGo4=;
  b=SvIL6fV09b6n7Ctz1FqheMjLToffbl+bsIgOg/YNh1nhgE9MjhoaxYJZ
   51w5Drc8KtzeMTkN3FY/GHyra9fyoF2zJpEQtElA3y2Mq/9Vzzuj8hiuw
   ZVPZ3pRaWBuEDkJCHDFsVa7oZUmTHEbKWzZVC7u6RpOW84sUQXoAwmG7h
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9rj2FTI6x1eMY5mXLo4ddIeOtwqaK6NYq8KmE2VXdmIBpKYlFef4xb72oSnibNNPysbBJHKgFz
 +IGyU9lNkYW+6Gtk/+TpkbdcUmQ3JIBxD/YRJEGAXNNwqCjBZocTrq5VtW8OGeX8jwTnCW9Jpq
 8caGMW8Gl7wbR6cpFMLlZg0UeHFuFSve28mDXw2R8e9yb3MPdjM6O2BaAc8/KDAZ27QsZ6mwzQ
 FovJouoaH7XlFCxRT30xyxej2vbC3rrkK2b59z6oI6FOfhIlEQXYeGBGDxFdcUsExZmrzAwBI3
 Rhk=
X-SBRS: 5.1
X-MesageID: 47536243
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YSlH9anXw4fUlBhX+wIxnB4EFaLpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.83,317,1616472000"; 
   d="scan'208";a="47536243"
Date: Fri, 2 Jul 2021 15:46:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxl/x86: check return value of
 SHADOW_OP_SET_ALLOCATION domctl
Message-ID: <YN8m4BBYrb++fEYN@perard>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
 <YN2Mujj8jKGv7tik@perard> <4913d3f6-cd16-1865-9c19-99f7db615ded@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4913d3f6-cd16-1865-9c19-99f7db615ded@suse.com>

On Fri, Jul 02, 2021 at 02:29:31PM +0200, Jan Beulich wrote:
> On 01.07.2021 11:36, Anthony PERARD wrote:
> > On Mon, Jun 28, 2021 at 01:47:03PM +0200, Jan Beulich wrote:
> >> --- a/tools/libs/light/libxl_x86.c
> >> +++ b/tools/libs/light/libxl_x86.c
> >> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
> >>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
> >>          unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
> >>                                             1024);
> >> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> >> -                          NULL, 0, &shadow, 0, NULL);
> >> +        int rc = xc_shadow_control(ctx->xch, domid,
> > 
> > Could you use 'r' instead of 'rc' ? The later is reserved for libxl
> > error codes while the former is for system and libxc calls.
> 
> Of course I can, but I did look at the rest of the function and
> found that it uses "ret" for the purpose of what you now say
> "rc" ought to be used for. Seeing "ret", I decided to avoid it
> (knowing you use different names for different kinds of return
> values). While I've switched to "r" for now, I'd be rather
> inclined to re-use "ret" instead. (Or actually, as per the
> remark further down, I can get away without any local variable
> then.)

I know there's quite a few (many?) coding style issue in libxl. I'm
trying to prevent new issue without asking to fix the existing one.
The use of "ret" is an already existing issue, so I'm fine with it been
use in this patch for libxl error code in the function.

BTW, you still need to store the return value of xc_shadow_control()
into a "r" variable before checking it for error.

> 
> >> +                                   XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> >> +                                   NULL, 0, &shadow, 0, NULL);
> >> +
> >> +        if (rc) {
> > 
> > xc_shadow_control seems to return "domctl.u.shadow_op.pages" in some
> > cases, are all non-zero return value errors?
> 
> Indeed it does, but (a) we pass in zero here and (b) this
> operation doesn't alter (nor even care about) the value. So I'd
> prefer to stick to what I have, but if you tell me to switch to
> "... < 0", I will.

That's fine, no need to change.

> 
> >> +            LOGED(ERROR, domid,
> >> +                  "Failed to set %s allocation: %d (errno:%d)\n",
> > 
> > LOGED already prints prints the meaning of the "errno" value, so we
> > don't need to log it.
> 
> I see. Please note that again I took neighboring code (a few lines
> down) for reference. Judging from other call sites (not the one
> right below here) I infer I also shouldn't have \n in the format
> string?

Ah, indeed, the '\n' isn't needed.

> >> +                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow",
> >> +                  rc, errno);
> > 
> > Is the return value of xc_shadow_control() actually useful when errno is
> > already logged?
> 
> I don't know. Again what I had matches what can be found a few
> lines down in the same function. But looking at other uses (in
> other files) I'm getting the impression that it's useless -
> dropped.

Whether or not the return value is useful to be logged depends only on
xc_shadow_control(). But thanks.

Thanks,

-- 
Anthony PERARD

