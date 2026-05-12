Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D929ACD37BE
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 01:40:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1306504.1578401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMc6z-0008Bd-Sz; Tue, 12 May 2026 01:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306504.1578401; Tue, 12 May 2026 01:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMc6z-0008BW-Ou; Tue, 12 May 2026 01:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1306504;
 Tue, 12 May 2026 01:40:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wMc6y-0008BQ-EH
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 01:40:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMc6x-007pn1-OB
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 03:40:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a02845f-bab6-0a2a0a5309dd-0a2a450ab7bc-30
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 03:40:39 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a028516-56b3-0a2a450a0019-aceafc1f9a3e-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 03:40:39 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D1434452E;
 Tue, 12 May 2026 01:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFEBC2BCB0;
 Tue, 12 May 2026 01:40:37 +0000 (UTC)
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
	s=k20201202; t=1778550037;
	bh=WCPI3dg8DDCJlpoPRAjEBYQiGGCHc21thDzCEXK8g74=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iz0i5OXtoc9GL0oQ2CXsNwvuNChREi6mxIBhONyw7M+pqM5zD1Yc9Ooqd6aiRDw8p
	 LWFVSuRC+1BL55fSIM8g/OJeOsmMc3kXZwxsVxXRids722Vg/wOGC653oSm3kq27ex
	 LuP3xYoY0HtQV0BTLv9vc/vUPwKpCyp6hzXbeou5pn4rT4OPcWpJeRnLzCWgocdu9R
	 Aq9Dl5LiaNIX2gTvaoNnNkT+uIveCZgOaPAYW4AdG2wovqI8/KEmW7kRZ8S4ws/vUU
	 bwtiGS/2knMqoXNwKPMAKvqt/qQRSu6DqDmUY47EkXYgbQoDYnW9Xa98CCcfTgY+FZ
	 3K3FpoQIw21Ag==
Date: Mon, 11 May 2026 18:40:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] CI: collect certain intermediate files as
 artifacts
In-Reply-To: <6e0266e6-8dda-4a87-886d-79da637c2172@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605111840280.1779943@ubuntu-linux-20-04-desktop>
References: <ced1547a-f1cd-42c8-a050-51430adc829b@suse.com> <6e0266e6-8dda-4a87-886d-79da637c2172@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1778550039-705648B7-8D5D352F/0/0
X-purgate-type: clean
X-purgate-size: 3020

On Mon, 11 May 2026, Jan Beulich wrote:
> When one of the linking passes fails, additional intermediate files are
> still in place. Having them available for analysis of the underlying
> problem can be pretty helpful. Collect some into a new intermediates/
> directory. (Nothing new will be collected if linking succeeds.)
> 
> As the script is run with -e passed to bash, defer exit if the main
> "make" (or substituent script thereof) failed. This way more artifacts
> are collected, potentially making it easier to analyze the failure.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2515787945
> (with PPC forced to invoke the new logic, hence respective failures there)
> ---
> v2: Different approach.
> 
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -6,6 +6,7 @@
>    artifacts:
>      paths:
>        - binaries/
> +      - intermediates/
>        - xen-config
>        - xen-cppcheck.txt
>        - '*.log'
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -37,22 +37,24 @@ else
>      make -j$(nproc) -C xen olddefconfig
>  fi
>  
> -# Save the config file before building because build failure causes the script
> -# to exit early -- bash is invoked with -e.
> +# Save the config file before building, just in case.
>  cp xen/.config xen-config
>  
> -# Directory for the artefacts to be dumped into
> -mkdir -p binaries
> +# Directories for artefacts to be dumped into
> +mkdir -p binaries intermediates
> +
> +# Script exit status, to be overridden by the main make's status below.
> +ret=0
>  
>  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Cppcheck analysis invokes Xen-only build
> -    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
> +    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc) || ret=$?
>  
>      # Preserve artefacts
>      cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
>  elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Xen-only build
> -    make -j$(nproc) xen
> +    make -j$(nproc) xen || ret=$?
>  else
>      # Full build.  Figure out our ./configure options
>      cfgargs=("--prefix=/usr")
> @@ -90,7 +92,7 @@ else
>      fi
>  
>      ./configure "${cfgargs[@]}"
> -    make -j$(nproc) dist
> +    make -j$(nproc) dist || ret=$?
>  
>      # Preserve artefacts
>      (cd dist/install; find | cpio -R 0:0 -o -H newc | gzip) > binaries/xen-tools.cpio.gz
> @@ -106,3 +108,12 @@ for f in xen/xen xen/xen-syms xen/xen.ef
>          cp $f binaries/
>      fi
>  done
> +
> +# Preserve Xen intermediate files.  Some may be there only upon build failure.
> +for f in xen/.xen-syms.* xen/.xen.efi.*; do
> +    if [[ -f $f ]]; then
> +        cp $f intermediates/
> +    fi
> +done
> +
> +exit $ret
> 

