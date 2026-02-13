Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BAAEF99CD
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 19:14:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1231734.1536768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqyco-00013a-Rl; Fri, 13 Feb 2026 19:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231734.1536768; Fri, 13 Feb 2026 19:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqyco-00013T-Om; Fri, 13 Feb 2026 19:14:46 +0000
Received: by outflank-mailman (input) for mailman id 1231734;
 Fri, 13 Feb 2026 19:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vqycn-00013G-RU
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 19:14:45 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f929f0c-0910-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 20:14:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEDBE44114;
 Fri, 13 Feb 2026 19:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920A3C116C6;
 Fri, 13 Feb 2026 19:14:39 +0000 (UTC)
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
X-Inumbo-ID: 3f929f0c-0910-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771010080;
	bh=NuOg6jsLa0hGlyiWtsJ6SXWWDhAast0gMbfy0ZT0ix4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nA3J7WTv/emKT8qPt1sshmCCpvlndwxC7xaGNq4ffudbramfZKFLp7eKjSVX2mq2E
	 QnJnx/M/UuA1ninCSTxIITqHIanZikSmDZowgWvjMI89QG7KI3u6plgxNPQThOtDbV
	 TtEUVBLtITVyyzbjf9YKtYeHqsc5VvUFPFD45A51ELJeE15KYIzDtc6s0jgLtadMvl
	 th6vblLvRkAOftFsydmqsjv7HOOKf7eLtTfvlO4fVvRtQro1TAoCt+ZAHfWxfMbtfy
	 2hFWmQCX+kATlwoKNW9Sg++dBnf/tHCvdZ9zKRD+EKT1XrHrsc1eXFCE+o2QT1LWoT
	 eJ7LfSt/oqQfw==
Date: Fri, 13 Feb 2026 11:14:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH] xtf: fix argo test parameters
In-Reply-To: <20260212231504.3135755-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2602131114250.1995559@ubuntu-linux-20-04-desktop>
References: <20260212231504.3135755-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Feb 2026, dmukhin@ford.com wrote:
> The mac-permissive= option is currently ignored because Argo configuration
> parameters are comma-separated.
> 
> Fix the missing comma in the XTF test arguments.
> 
> Fixes: 150c6ef45922 ("CI: add argo x86 XTF test")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2323076582
> ---
>  automation/scripts/include/xtf-runner | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
> index 43ff2d4d88c7..d1ef888465c3 100644
> --- a/automation/scripts/include/xtf-runner
> +++ b/automation/scripts/include/xtf-runner
> @@ -69,7 +69,7 @@ function xtf_build_cmdline()
>      local xtf_name=$2
>      declare -a cmdline=()
>      declare -A per_test_args=(
> -        [argo]="argo=1 mac-permissive=1"
> +        [argo]="argo=1,mac-permissive=1"
>      )
>  
>      cmdline+=("${XEN_CMDLINE}")
> -- 
> 2.52.0
> 

