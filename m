Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789F9C5AE49
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:28:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387470.1628727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQ3M-0003K6-Dy; Mon, 10 Aug 2026 13:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387470.1628727; Mon, 10 Aug 2026 13:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQ3M-0003Jz-AH; Mon, 10 Aug 2026 13:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1387470;
 Mon, 10 Aug 2026 13:28:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wtQ3L-0003Jt-3H
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:28:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wtQ3H-00EjD9-1v;
 Mon, 10 Aug 2026 13:28:27 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wtQ3G-00F0LR-3A;
 Mon, 10 Aug 2026 13:28:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=ORu4AAR8UbgfOu7JMv6ASKuKTn1N0oTYlJ6YRXD8Evk=; b=aVU9hUqACLE+XANhM8RiRhB8uq
	4FiNc71SfvbnSGv1+BeJAMk9qkwNhsQOwbh3gH31RnZYBRh1pgRWpPVQXiQNdwjPzaf7ZPStuWTzM
	MKfsjR+SsnNdDJHXoBI6EQ++6IZs4zSPPuL7WpPFevLwWpbLi3Ccqz8JxHHpkttJlewA=;
Date: Mon, 10 Aug 2026 15:28:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com
Subject: Re: [PATCH v2 2/2] xen/common: add keyhandler to show Xen command
 line
Message-ID: <annR9YMHp1t8NVnP@macbook.local>
References: <20260803070047.3097846-1-dmukhin@ford.com>
 <20260803070047.3097846-3-dmukhin@ford.com>
 <df43b4f0-9973-b80e-47a9-f0cfa65651aa@kernel.org>
 <anaWpO/zu5sI4A9u@kraken>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anaWpO/zu5sI4A9u@kraken>

On Fri, Aug 07, 2026 at 07:38:28PM -0700, dmukhin@ford.com wrote:
> On Fri, Aug 07, 2026 at 05:44:41PM -0700, Stefano Stabellini wrote:
> > On Mon, 3 Aug 2026, dmukhin@ford.com wrote:
> > > From: Denis Mukhin <dmukhin@ford.com> 
> > > 
> > > Currently there's no way to print Xen command line on the emergency
> > > console for debugging purposes (e.g. 'xl' is not available in dom0).
> > > 
> > > Add new keyhander 'X' to do command line printout.
> > > 
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > > v1: https://lore.kernel.org/xen-devel/20260730061459.2702672-2-dmukhin@ford.com/
> > > 
> > > Changes since v1:
> > > - moved implementation into kernel.c
> > > ---
> > >  xen/common/kernel.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> > > index d1bef9ac2b2b..9f334c92e3ab 100644
> > > --- a/xen/common/kernel.c
> > > +++ b/xen/common/kernel.c
> > > @@ -5,6 +5,7 @@
> > >   */
> > >  
> > >  #include <xen/init.h>
> > > +#include <xen/keyhandler.h>
> > >  #include <xen/lib.h>
> > >  #include <xen/errno.h>
> > >  #include <xen/param.h>
> > > @@ -505,6 +506,21 @@ static int __init cf_check param_init(void)
> > >  __initcall(param_init);
> > >  #endif
> > >  
> > > +static void cf_check show_hypervisor_info(unsigned char key)
> > > +{
> > > +    printk("'%c' pressed -> showing hypervisor information\n", key);
> > > +    printk("Command line: %s\n", saved_cmdline);
> > 
> > if CONFIG_CMDLINE_OVERRIDE is defined, saved_cmdline is empty. We could
> > at least do this:
> > 
> > #ifdef CONFIG_CMDLINE_OVERRIDE
> >     printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");
> > #else
> >     printk("Command line: %s\n", saved_cmdline);
> > #endif
> 
> Actually, CONFIG_CMDLINE can set the built-in command line which can be
> non-empty.
> 
> Perhaps, something like this:
> 
>     printk("Command line (built-in): %s\n", opt_builtin_cmdline);
> #ifndef CONFIG_CMDLINE_OVERRIDE
>     printk("Command line: %s\n", saved_cmdline);
> #endif

Aside from the remark from Oleksii, can you use IS_ENABLED() here
instead of preprocessor conditionals?

Thanks, Roger.

