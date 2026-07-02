Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463CEC43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 16:43:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1352223.1609094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfKVg-0004nP-Oo; Thu, 02 Jul 2026 16:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352223.1609094; Thu, 02 Jul 2026 16:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfKVg-0004nI-Le; Thu, 02 Jul 2026 16:43:32 +0000
Received: by outflank-mailman (input) for mailman id 1352223;
 Thu, 02 Jul 2026 16:43:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wfKVg-0004nC-9l
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:43:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfKVe-007IVn-3g
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 18:43:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a469527-e002-0a2a0a5209dd-0a2a4506dca0-12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:43:30 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a469530-08de-0a2a45060019-aceafc1fc7b8-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:43:29 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CA008416F6;
 Thu,  2 Jul 2026 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1C81F00A3A;
 Thu,  2 Jul 2026 16:43:27 +0000 (UTC)
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
	s=k20260515; t=1783010607;
	bh=6PcFLEoyRJf8kxb2GS0a34t6Sr+st1IFRARKd9dpAAI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Yaja7h2ajlb9QYXmFh17BV3Z6ClPfSTvrHGPGerzwUxl0BUsJoAdLmpiPXhOKqj/a
	 fraFqB1Yh3B0eEn6W8iFq+CUSfXr+IPowxp8Lx+R9UEnfgonzQpCMMRYSI5XXQuOIz
	 3QGc46OXEtUfo+UXwis1ZKW94kUWkHCYWI80jnJEGTMKP4m4VoRF4C4cFRFO73hIjy
	 eVR1gcm01Qd2GkElP62O0ObjQEz5RBu6VRyMZAxoJl25gfbnHNFUdeJSo1Sdpltld+
	 o8XnfGK9kNTIUKPeUZ6Fa7TJO9+g3nNYK+EsiKyLFLCHjk78ISoYjbCfIUPcRxFRqu
	 c4iJfnhS5yl7A==
Date: Thu, 2 Jul 2026 09:43:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] argo: fall back maintainership into the rest
In-Reply-To: <20260702163845.36453-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2607020942550.992629@ubuntu-linux-20-04-desktop>
References: <20260702163845.36453-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1768402433-1783010586=:992629"
Content-ID: <alpine.DEB.2.22.394.2607020943070.992629@ubuntu-linux-20-04-desktop>
X-purgate-ID: tlsNG-16d1c6/1783010610-C513768D-6D1CAD3A/0/0
X-purgate-type: clean
X-purgate-size: 1423

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1768402433-1783010586=:992629
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2607020943071.992629@ubuntu-linux-20-04-desktop>

On Thu, 2 Jul 2026, Roger Pau Monne wrote:
> Due to unresponsiveness of the current maintainer.  In particular, the
> committers have been trying to get in touch with Christopher for 2 weeks to
> have a chat about disputes around recent commits and pending changes to the
> ARGO component without getting any response.
> 
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch is on behalf of the committers, and not a personal decision of
> its author.
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81bd0dfeec30..6b2e391441d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -241,7 +241,6 @@ F:	xen/arch/x86/hvm/svm/
>  F:	xen/arch/x86/include/asm/hvm/svm/
>  
>  ARGO
> -M:	Christopher Clark <christopher.w.clark@gmail.com>
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Maintained
>  F:	xen/include/public/argo.h
> -- 
> 2.53.0
> 
--8323329-1768402433-1783010586=:992629--

