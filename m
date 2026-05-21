Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C367CD4F3D
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2026 19:51:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1315872.1585526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ9QJ-0001FQ-01; Thu, 21 May 2026 19:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315872.1585526; Thu, 21 May 2026 19:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ9QI-0001FJ-Tc; Thu, 21 May 2026 19:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1315872;
 Thu, 21 May 2026 19:51:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wQ9QG-0001FD-UJ
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:51:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ9QG-003jzv-0S
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:51:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0f6215-5cb7-0a2a0a5109dd-0a2a450ac93e-14
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 21:51:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a0f622e-56b3-0a2a450a0019-ac6904fec5ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 21:51:11 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EED760098;
 Thu, 21 May 2026 19:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7E41F00A3B;
 Thu, 21 May 2026 19:51:09 +0000 (UTC)
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
	s=k20260515; t=1779393069;
	bh=j0gao7VKBf6CWO8/YA2Kiau76clnv0hA6lBej/2KwDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=S9A+4TjO9VK6fn5xQYfa/2L5LLE9RvkkSECE6839T+WlexhpFe8dx1DTovOU+SAfp
	 wPJdhgK5hf1zWIdrSUtE0a+Gumn9bQdSm2CS79F765oql/mOB1RdcH+HhMJO0UQnWb
	 JvkK8q86lAMHaQCuCo9ffiGl/0jFmsUmHpRtAsYsuHL96v1MVuiVYC6RTcO8TKyhl3
	 q28ooFQjJHIE9fMJRIbnIMf6rASdeXvxiojfq3+a0YI3hwUs/uHE3a/KQq3XPTWmyA
	 VIsPEH8DnI1tOhJ6HYmEtWlt8RG8SDOnJk7/rcfTO4uCfKOOxHMSSY38HFGHU8FRxJ
	 HqxMtwTa9DG3A==
Date: Thu, 21 May 2026 12:51:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
 (part 2)
In-Reply-To: <d23a061d-afbe-4b38-9352-de4b63d56396@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605211250590.182011@ubuntu-linux-20-04-desktop>
References: <d23a061d-afbe-4b38-9352-de4b63d56396@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1779393071-7035B8B7-37A23DE2/0/0
X-purgate-type: clean
X-purgate-size: 1521

On Wed, 20 May 2026, Jan Beulich wrote:
> Build issues may also surface for analysis jobs. Collect intermediate
> files (if any) there as well. Include xen/.config too, since it's not
> otherwise collected.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2536905486
> 
> --- a/automation/eclair_analysis/build.sh
> +++ b/automation/eclair_analysis/build.sh
> @@ -58,10 +58,21 @@ runtime_failures_docs() {
>  (
>    runtime_failures_docs
>  
> +  ret=0
> +  mkdir -p intermediates
>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>         "CC=${CC}"                               \
>         "CXX=${CXX}"                             \
>         "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
> -       -C xen
> +       -C xen || ret=$?
> +
> +  # Preserve Xen intermediate files.  Some may be there only upon build failure.
> +  for f in xen/.config xen/.xen-syms.* xen/.xen.efi.*; do
> +      if [[ -f $f ]]; then
> +          cp $f intermediates/
> +      fi
> +  done
> +
> +  exit $ret
>  )
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -18,6 +18,7 @@
>        - "${ECLAIR_OUTPUT_DIR}/*.txt"
>        - '*.log'
>        - '*.json'
> +      - intermediates/
>      reports:
>        codequality: gl-code-quality-report.json
>    rules:
> 

