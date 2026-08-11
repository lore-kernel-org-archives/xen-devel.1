Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A059AC5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 08:05:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388011.1629217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthUF-0005is-IB; Tue, 11 Aug 2026 08:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388011.1629217; Tue, 11 Aug 2026 08:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthUF-0005il-EZ; Tue, 11 Aug 2026 08:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1388011;
 Tue, 11 Aug 2026 08:05:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wthUE-0005id-En
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 08:05:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wthUA-00GItK-2a;
 Tue, 11 Aug 2026 08:05:22 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wthUA-009N1g-0Q;
 Tue, 11 Aug 2026 08:05:22 +0000
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
	bh=JmpUITwx9KWOwQTi/3Id4eMb0AxNSa+PJhHkXW2LIoo=; b=TUsH5AXAkGBW/N18xE4hFDjZ7B
	JU+Z9qpnm/GZGaKy3zW1EQXhC5ddyhrFEm07S43nNHu5fsHgzkT/nvD6AZviTI6rJW4Ypp0nITVHY
	X2KDo//rjf8yYyf825oKViZ2+e2qHHPJ6LAtsmMCEslzgD7pfbDKy5UYBLg8sq8Jonyo=;
Date: Tue, 11 Aug 2026 10:05:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v3] xen/common: add keyhandler to show Xen command line
Message-ID: <anrXvTfBls4flBqK@macbook.local>
References: <20260810230359.671587-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810230359.671587-3-dmukhin@ford.com>

On Mon, Aug 10, 2026 at 04:04:01PM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Currently there's no way to print Xen command line on the emergency
> console for debugging purposes when 'xl' is not unavailable.
> 
> Add new keyhander 'X' to do command line printout.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - account for CONFIG_CMDLINE_OVERRIDE case
> - use IS_ENABLED()
> 
> v2: https://lore.kernel.org/xen-devel/20260803070047.3097846-3-dmukhin@ford.com/
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2748655201
> ---
>  xen/common/kernel.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index d1bef9ac2b2b..54a7ee6f68e5 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <xen/init.h>
> +#include <xen/keyhandler.h>
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/param.h>
> @@ -505,6 +506,25 @@ static int __init cf_check param_init(void)
>  __initcall(param_init);
>  #endif
>  
> +static void cf_check show_hypervisor_info(unsigned char key)
> +{
> +    printk("'%c' pressed -> showing hypervisor information\n", key);
> +
> +    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
> +        printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");

Since we are there already, why not print the builtin command line
using CONFIG_CMDLINE?

> +    else
> +        printk("Command line: %s\n", saved_cmdline);
> +}
> +
> +static int __init cf_check misc_init(void)
> +{
> +    register_keyhandler('X', show_hypervisor_info,
> +                        "show hypervisor information", 0);

"show hypervisor information" seems too generic to me, almost all
debug keys could be defined by this sentence TBH.  I think this needs
to be more specific, but I'm not sure what's the plan regarding this
key.  Is there an intention to print more stuff here, or just the
command line?  Knowing the full set of information to be printed might
help come up with a better name.

Thanks, Roger.

