Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0773CD484C
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 01:39:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1306497.1578392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMc5G-0006ls-Ie; Tue, 12 May 2026 01:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306497.1578392; Tue, 12 May 2026 01:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMc5G-0006lj-Da; Tue, 12 May 2026 01:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1306497;
 Tue, 12 May 2026 01:38:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wMc5F-0006ld-8d
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 01:38:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMc5E-00CVao-MA
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 03:38:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a028472-2eae-0a2a0a5409dd-0a2a4506b7fe-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 03:38:52 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0284ab-7371-0a2a45060019-ac6904feb2f2-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 03:38:52 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FB0960055;
 Tue, 12 May 2026 01:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B27C2BCB0;
 Tue, 12 May 2026 01:38:50 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549930;
	bh=8yKlDYprkgFD+kXbd1+3tO2NcMOvkhTdD+b0zY6Bwgg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pBNl3uf5nH7g8NANprrSypC3QbgSBw6YLGTCJJ55dpByV0ewjskUvOIdPP9x2cmax
	 R2hhQHrqpp+P01Y3kLy5cngcYTbOzFAsXQ4fON2zFmkk1mNUj+any9ANyzargQlxR8
	 Nt3wd2CgqmkDIkE1OTuvMFWH9nNFCvxA9CqI+IrYnxV28EsiF293suEjCr8l2+Mgc7
	 Rk5HsSijJdS3FOC7TfeRypycelBxw94oGSu6x7+QGjaG1PO8ESzrtY4TLXZrIWoSUz
	 vCHiX2nTncnVUQnMG7oZMSbkjCobd9zrJCjnzPG6oRfGhE5myAkg737jv4W5qESPS7
	 BEq4YmayosTAg==
Date: Mon, 11 May 2026 18:38:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] CI: re-work Xen artifacts collection
In-Reply-To: <b2eb6d3a-f5ed-4ca6-a556-c9bf06809abb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605111838340.1779943@ubuntu-linux-20-04-desktop>
References: <ced1547a-f1cd-42c8-a050-51430adc829b@suse.com> <b2eb6d3a-f5ed-4ca6-a556-c9bf06809abb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1778549932-8596CD75-DB421C3C/0/0
X-purgate-type: clean
X-purgate-size: 2216

On Mon, 11 May 2026, Jan Beulich wrote:
> There's no need to do this separately from three places. Once moved to the
> bottom of the script, the need for this to be a function also disappears.
> 
> While there also make sure xen-syms is collected. This is rather more
> useful for analysis of possible problems than its stripped counterpart.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -44,30 +44,15 @@ cp xen/.config xen-config
>  # Directory for the artefacts to be dumped into
>  mkdir -p binaries
>  
> -collect_xen_artefacts()
> -{
> -    local f
> -
> -    for f in xen/xen xen/xen.efi; do
> -        if [[ -f $f ]]; then
> -            cp $f binaries/
> -        fi
> -    done
> -}
> -
>  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Cppcheck analysis invokes Xen-only build
>      xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
>  
>      # Preserve artefacts
> -    collect_xen_artefacts
>      cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
>  elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Xen-only build
>      make -j$(nproc) xen
> -
> -    # Preserve artefacts
> -    collect_xen_artefacts
>  else
>      # Full build.  Figure out our ./configure options
>      cfgargs=("--prefix=/usr")
> @@ -108,9 +93,16 @@ else
>      make -j$(nproc) dist
>  
>      # Preserve artefacts
> -    # Note: Some smoke tests depending on finding binaries/xen on a full build
> -    # even though dist/ contains everything, while some containers don't even
> -    # build Xen
>      (cd dist/install; find | cpio -R 0:0 -o -H newc | gzip) > binaries/xen-tools.cpio.gz
> -    collect_xen_artefacts
>  fi
> +
> +# Preserve Xen artefacts
> +#
> +# Note: Some smoke tests depend on finding binaries/xen on a full build
> +# even though dist/ contains everything, while some containers don't even
> +# build Xen.
> +for f in xen/xen xen/xen-syms xen/xen.efi; do
> +    if [[ -f $f ]]; then
> +        cp $f binaries/
> +    fi
> +done
> 

