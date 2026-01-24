Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32BED77898
	for <xen-devel@archiver.kernel.org>; Sat, 24 Jan 2026 00:31:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1212634.1523674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYg-0003EA-0y; Sat, 24 Jan 2026 00:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212634.1523674; Sat, 24 Jan 2026 00:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYf-0003Dz-Ts; Sat, 24 Jan 2026 00:31:21 +0000
Received: by outflank-mailman (input) for mailman id 1212634;
 Sat, 24 Jan 2026 00:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjRYe-0002cu-F8
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 00:31:20 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fef138d9-f8bb-11f0-9ccf-f158ae23cfc8;
 Sat, 24 Jan 2026 01:31:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 382D643494;
 Sat, 24 Jan 2026 00:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9550FC4CEF1;
 Sat, 24 Jan 2026 00:31:14 +0000 (UTC)
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
X-Inumbo-ID: fef138d9-f8bb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769214676;
	bh=eV+iTs5JAo2L8emmyYjwyqZdVboesjN+J4LDPH4qRnk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rOkZraYXDAZqLHhYsEgtkM9g8o2JIGTQEZNRKs6KbhJBVbX49LN9QhlVAdJ0epMAR
	 ehj5kgAYR8XltPrSStt746rP431Go6G7Mz6bo6qZWCYjM9jUeduHgec5xRyRkcc8b/
	 QpqR3PNuBAIfsKcAqmnNPneWf4rCgxvtDW5+0hq1BKWWJnIVIk5qzjbGn0ZdhZ7/GB
	 O/G+7c9+NabpTG+NPbteDC8/Gl0rgmiJUM7jXLrqcKjMrVgcZZYrE1w4YeDbsLQaxY
	 LB0SQeFhLM1u8dlPW5PHyZ2svxpwAuNQcZ0dtN/7u7gRD7pk5GRxFkg2+SK1eSgxDs
	 E/KZ8qH4eGmXw==
Date: Fri, 23 Jan 2026 16:31:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 3/4] scripts/config: add -y|-n flags
In-Reply-To: <20260116043458.730728-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231630590.7192@ubuntu-linux-20-04-desktop>
References: <20260116043458.730728-1-dmukhin@ford.com> <20260116043458.730728-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add alias -y ("yes") to --enable and -n ("no") to --disable a Kconfig
> option for better scripting experience.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/config | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/scripts/config b/xen/scripts/config
> index 1050812aae8d..1ede964320cf 100755
> --- a/xen/scripts/config
> +++ b/xen/scripts/config
> @@ -16,8 +16,8 @@ Manipulate options in a .config file from the command line.
>  Usage:
>  $myname options command ...
>  commands:
> -	--enable|-e option   Enable option
> -	--disable|-d option  Disable option
> +	--enable|-e|-y|--yes    option   Enable option
> +	--disable|-d|-n|--no    option   Disable option
>  	--set-str option string
>  	                     Set option to "string"
>  	--set-val option value
> @@ -166,11 +166,11 @@ while [ "$1" != "" ] ; do
>  		;;
>  	esac
>  	case "$CMD" in
> -	--enable|-e)
> +	--enable|-e|-y|--yes)
>  		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=y"
>  		;;
>  
> -	--disable|-d)
> +	--disable|-d|-n|--no)
>  		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
>  		;;
>  
> -- 
> 2.52.0
> 

