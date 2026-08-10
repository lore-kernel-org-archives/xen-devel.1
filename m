Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EFDC5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 20:03:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387819.1629040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWDF-0003Qt-Vm; Mon, 10 Aug 2026 20:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387819.1629040; Mon, 10 Aug 2026 20:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtWDF-0003Qm-T9; Mon, 10 Aug 2026 20:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1387819;
 Mon, 10 Aug 2026 20:03:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wtWDE-0003Qg-Ag
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:03:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtWDD-000dtK-7Q
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 22:03:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a2e67-2eae-0a2a0a5409dd-0a2a4506a89c-48
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:03:07 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a7a2e79-195a-0a2a45060019-ac6904fe8b2a-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 22:03:06 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1DD11600AD;
 Mon, 10 Aug 2026 20:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4920C1F000E9;
 Mon, 10 Aug 2026 20:03:03 +0000 (UTC)
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
	s=k20260515; t=1786392184;
	bh=TsswkiVvDPxgcSHZ6yjKKlKm7CgWPEsFg9F0slygfJ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lhjkEgVxoW2Qd2naeLDMVfkx7Dnk7Bo7N9Zy1pRcrJi0+YG3uo7Tj2ZZJ5NuJzZEP
	 xCxqQCv7kNqUGUsi7h7mj5ciZ0k6Zs3fVelCiadtWsI0lBJD8EUhFNnWRNwBSuy84b
	 05e2sNDMveWm8LJupQpJ90Vdvr5Yuxn+hqtnW4cV2xTtuz1uNzT6XS4IQHg6lRN37T
	 vuVpJzF0G46LzxG20mh3+P1LcsUyDvOSrxepS8cOzN9sLGyGYNEHMQ9Bt3BJoijkc7
	 7+Q0Y/MVuabkrIaEi4N1EkOad2rSBSKgXZrzt829sDW0wJU69PFI8PTozn/gGCwep/
	 HUElcwCpOoq5A==
Date: Mon, 10 Aug 2026 13:03:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 1/7] xen/console: do not use XENCONS_RING_IDX in
 console_init_ring()
In-Reply-To: <20260728065049.1318143-2-dmukhin@ford.com>
Message-ID: <ff4ae51b-858d-4822-217b-bfc7e9bc6e2c@kernel.org>
References: <20260728065049.1318143-1-dmukhin@ford.com> <20260728065049.1318143-2-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1786392186-F520877B-78F43C6A/0/0
X-purgate-type: clean
X-purgate-size: 1623

On Mon, 27 Jul 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Replace XENCONS_RING_IDX with unsigned int for the console ring indices,
> as the console ring is not a Xen console (XENCONS) ring.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v7:
> - new patch
> ---
>  xen/drivers/char/console.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ea4e3ff34178..37fdda93a4c1 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -463,7 +463,7 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
>  void __init console_init_ring(void)
>  {
>      char *ring;
> -    XENCONS_RING_IDX done, size, n;
> +    unsigned int done, size, n;
>      unsigned int order, memflags;
>      unsigned long flags;
>  
> @@ -484,8 +484,8 @@ void __init console_init_ring(void)
>      size = conringp - conringc;
>      for ( done = 0; done < size; done += n )
>      {
> -        XENCONS_RING_IDX src = (conringc + done) & (conring_size - 1);
> -        XENCONS_RING_IDX dst = (conringc + done) & (opt_conring_size - 1);
> +        unsigned int src = (conringc + done) & (conring_size - 1);
> +        unsigned int dst = (conringc + done) & (opt_conring_size - 1);
>  
>          n = min(opt_conring_size - dst, conring_size - src);
>          n = min(size - done, n);
> -- 
> 2.54.0
> 

