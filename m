Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1728CC5AD44
	for <xen-devel@archiver.kernel.org>; Sat,  8 Aug 2026 00:45:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386379.1628304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsVBD-0001P5-Fa; Sat, 08 Aug 2026 00:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386379.1628304; Sat, 08 Aug 2026 00:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsVBD-0001Ou-Ac; Sat, 08 Aug 2026 00:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1386379;
 Sat, 08 Aug 2026 00:44:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wsVBB-0001Oo-UA
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2026 00:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsVBA-00EqqD-He
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2026 02:44:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a767b46-bab6-0a2a0a5309dd-0a2a4501de6c-48
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 02:44:48 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a767bff-5984-0a2a45010019-ac6904fea2e6-3
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 02:44:48 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AC356600B1;
 Sat,  8 Aug 2026 00:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8411F000E9;
 Sat,  8 Aug 2026 00:44:44 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149886;
	bh=yOkvWs6dZIhxOfDfv+/i3ba1lORp8hpNwzvQJIvho3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GPyJ0bnryF6XL37qew3mlhH2YarbNIa+tif4ZHxlR6k/ZKXZPFYXTHA544WFRgRUT
	 fllp2pOJ34aPwoxXlMDq9v4g5OYYm3qkmS5ic0vq9YICLX5w4kqhqkwPZJXNMdJXPC
	 IEiIbDXI1pP2CUsiKeKTPgsENJRL6Ukyjd59GmCMLn1+tX4TerJOvcKtdGvfw7clad
	 gljQZ4OOwtP1nPuJ2JG7Gy5J+joJzq/rMU1pESq/27meriQ89Ng+dIxxI1/noOj9wL
	 rSFqe3/IMHIeT73ZjBaSPuE2suLmy5cAXtgv6h9g0/xxYcQEc3hkyO4Q8aPYbodo0T
	 8z+VnjvoLXL5Q==
Date: Fri, 7 Aug 2026 17:44:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org
Subject: Re: [PATCH v2 2/2] xen/common: add keyhandler to show Xen command
 line
In-Reply-To: <20260803070047.3097846-3-dmukhin@ford.com>
Message-ID: <df43b4f0-9973-b80e-47a9-f0cfa65651aa@kernel.org>
References: <20260803070047.3097846-1-dmukhin@ford.com> <20260803070047.3097846-3-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d62444/1786149888-BCF47757-C0EA106E/0/0
X-purgate-type: clean
X-purgate-size: 1929

On Mon, 3 Aug 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Currently there's no way to print Xen command line on the emergency
> console for debugging purposes (e.g. 'xl' is not available in dom0).
> 
> Add new keyhander 'X' to do command line printout.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> v1: https://lore.kernel.org/xen-devel/20260730061459.2702672-2-dmukhin@ford.com/
> 
> Changes since v1:
> - moved implementation into kernel.c
> ---
>  xen/common/kernel.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index d1bef9ac2b2b..9f334c92e3ab 100644
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
> @@ -505,6 +506,21 @@ static int __init cf_check param_init(void)
>  __initcall(param_init);
>  #endif
>  
> +static void cf_check show_hypervisor_info(unsigned char key)
> +{
> +    printk("'%c' pressed -> showing hypervisor information\n", key);
> +    printk("Command line: %s\n", saved_cmdline);

if CONFIG_CMDLINE_OVERRIDE is defined, saved_cmdline is empty. We could
at least do this:

#ifdef CONFIG_CMDLINE_OVERRIDE
    printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");
#else
    printk("Command line: %s\n", saved_cmdline);
#endif

Other than that it is fine for me



> +}
> +
> +static int __init cf_check misc_init(void)
> +{
> +    register_keyhandler('X', show_hypervisor_info,
> +                        "show hypervisor information", 0);
> +
> +    return 0;
> +}
> +__initcall(misc_init);
> +
>  static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      struct xen_varbuf user_str;
> -- 
> 2.54.0
> 

