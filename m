Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D89BD778BF
	for <xen-devel@archiver.kernel.org>; Sat, 24 Jan 2026 00:31:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1212632.1523660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYR-0002fD-QF; Sat, 24 Jan 2026 00:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212632.1523660; Sat, 24 Jan 2026 00:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYR-0002eZ-JX; Sat, 24 Jan 2026 00:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1212632;
 Sat, 24 Jan 2026 00:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjRYQ-0002cv-2j
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 00:31:06 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2cc79d0-f8bb-11f0-b15f-2bf370ae4941;
 Sat, 24 Jan 2026 01:30:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1DE79600C4;
 Sat, 24 Jan 2026 00:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582EDC4CEF1;
 Sat, 24 Jan 2026 00:30:54 +0000 (UTC)
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
X-Inumbo-ID: f2cc79d0-f8bb-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769214655;
	bh=6+EID+jpqyS88jteoAReQSQgKzDQr2KnKDmHgoC7Ubs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MVQZh4qlCXnyf7aATJ4cNXAXTkRLZ5szBSXJwTICzetDXzh6n6/ri+HKexFqIJnfH
	 +dtXx0id28ZkIW76KsiGlPn0zfJHjStDS49avTNpGsWhIcVox0Y06IRe7ci3tzwxSI
	 87sqvb9mVGEjEMPhhZdY9kJ/JqtoFB7YJLCGCwxv7wH9FivAFPmaWGVR/9OWVxwru+
	 LA8lAFcAdA0PLMwsmxTPoU19wdKt5rjGqiVLfNCob9vCDMjkpzCcVua6T6GoKMQ6fz
	 NVqc19Tk2zZnefxruQ8ZIjE7vQOri/JYbSbMRLIGBusJyOwvoCbSMMlLQexiZ1kXIp
	 Z2aK7aw8GVRKg==
Date: Fri, 23 Jan 2026 16:30:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 2/4] scripts/config: drop modules support
In-Reply-To: <20260116043458.730728-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231618530.7192@ubuntu-linux-20-04-desktop>
References: <20260116043458.730728-1-dmukhin@ford.com> <20260116043458.730728-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Drop the --module (-m) and --module-after (-M) options, as Xen
> does not support loadable modules, so options are not applicable.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/config | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/xen/scripts/config b/xen/scripts/config
> index ea475c07de28..1050812aae8d 100755
> --- a/xen/scripts/config
> +++ b/xen/scripts/config
> @@ -18,7 +18,6 @@ $myname options command ...
>  commands:
>  	--enable|-e option   Enable option
>  	--disable|-d option  Disable option
> -	--module|-m option   Turn option into a module
>  	--set-str option string
>  	                     Set option to "string"
>  	--set-val option value
> @@ -30,8 +29,6 @@ commands:
>                               Enable option directly after other option
>  	--disable-after|-D beforeopt option
>                               Disable option directly after other option
> -	--module-after|-M beforeopt option
> -                             Turn option into module directly after other option
>  	--refresh            Refresh the config using old settings
>  
>  	commands can be repeated multiple times
> @@ -177,10 +174,6 @@ while [ "$1" != "" ] ; do
>  		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
>  		;;
>  
> -	--module|-m)
> -		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=m"
> -		;;
> -
>  	--set-str)
>  		# sed swallows one level of escaping, so we need double-escaping
>  		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=\"${1//\"/\\\\\"}\""
> @@ -220,10 +213,6 @@ while [ "$1" != "" ] ; do
>  		set_var "${CONFIG_}$B" "# ${CONFIG_}$B is not set" "${CONFIG_}$A"
>  		;;
>  
> -	--module-after|-M)
> -		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
> -		;;
> -
>  	--refresh)
>  		yes "" | make oldconfig KCONFIG_CONFIG=$FN
>  		;;
> -- 
> 2.52.0
> 

