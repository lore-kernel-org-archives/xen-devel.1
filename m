Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91692606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLFkaO/q
Received: from list by lists.xenproject.org with outflank-mailman.1496547.1695016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3vz-0005zM-Vk; Thu, 19 Nov 2026 15:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496547.1695016; Thu, 19 Nov 2026 15:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3vz-0005zF-Sa; Thu, 19 Nov 2026 15:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1496547;
 Thu, 19 Nov 2026 15:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jarkko@kernel.org>) id 1xU3vy-0005xc-7W
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU3vx-002RL7-GU
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:20:21 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff13a9-2eae-0a2a0a5409dd-0a2a4504b826-40
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:20:21 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jarkko@kernel.org>)
 id 6aff13b3-b57f-0a2a45040019-aceafc1fcc02-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:20:21 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 360E443BB9;
 Thu, 19 Nov 2026 15:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 820291F000C4;
 Thu, 19 Nov 2026 15:20:18 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101619;
	bh=abJ833XNl5Tm7eTC3UbhmlX0wfMyPK48RvyobAGfFA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GLFkaO/qNHENindxN6Px7vrTI8+fFJuptpAumsnSZgz5Q1gtuZqbozN28Hhu15NOp
	 wpO5Q3mYrgFBmtzMhFUJUSjx0YdBwmQVyT2yKKiPni2M2kBfeqhL3Uz93qAkrskM7K
	 v+3JjyvQ//2hT9An9+AFuxJuKUsb4/+tAGL4/liv1zsZ2jAQfrRoUo958ghaNv/4VB
	 OouzqD0e16KqxcmadySNQz/WEwW3uKCvhp7N7ym8R8OuMeMjHzwJwBq/4O+w+N/kVJ
	 WUTlXuNmuscOggAZLWCZJ5KwzO6P2tUKli4kE93mdFhRxlVJl6k5uc3Xby/Xfrsc61
	 z90wz32u0fspA==
Date: Thu, 19 Nov 2026 17:20:15 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: shyckless@gmail.com
Cc: jgg@ziepe.ca, linux-kernel@vger.kernel.org, jgross@suse.com,
	sstabellini@kernel.org, linux-integrity@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
Message-ID: <av8Tr2jTQaOBOEid@kernel.org>
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
X-purgate-ID: tlsNG-ebf023/1795101621-C12DCB50-890E6EE7/0/0
X-purgate-type: clean
X-purgate-size: 2215
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 11:20:33AM +0000, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> When the backend moves to Closing or Closed, backend_changed()
> unregisters the device and then keeps using it:
> 
> 	device_unregister(&dev->dev);
> 	xenbus_frontend_closed(dev);
> 
> The xenbus watch callback that calls backend_changed() does not hold a
> reference to the device. The tpm_chip registered by xen-tpmfront has dev
> as its parent and holds a reference to it, but tpmfront_remove() drops
> that reference when it unregisters the chip. So device_unregister() can
> release the last reference and free the xenbus_device, and
> xenbus_frontend_closed(dev) then accesses freed memory.
> 
> Take a temporary reference before unregistering and drop it after
> xenbus_frontend_closed(). This keeps dev alive for the last access and
> keeps the existing order, in which TPM operations are stopped before
> the frontend is marked Closed.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: e2683957fb26 ("drivers/tpm: add xen tpmfront interface")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested on x86_64 (W=1, no new warnings). Not run with a Xen vTPM
> backend.
> ---
>  drivers/char/tpm/xen-tpmfront.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
> index 3c0cce57c4ae..1be925cca535 100644
> --- a/drivers/char/tpm/xen-tpmfront.c
> +++ b/drivers/char/tpm/xen-tpmfront.c
> @@ -397,8 +397,11 @@ static void backend_changed(struct xenbus_device *dev,
>  
>  	case XenbusStateClosing:
>  	case XenbusStateClosed:
> +		/* device_unregister() can drop the last reference to dev */
> +		get_device(&dev->dev);
>  		device_unregister(&dev->dev);
>  		xenbus_frontend_closed(dev);
> +		put_device(&dev->dev);

Not a NAK but makes me wonder why this has not hit the wall ever.

I.e. "feeling confused".

>  		break;
>  	default:
>  		break;
> 
> 
> 
> 

Br, Jarkko

