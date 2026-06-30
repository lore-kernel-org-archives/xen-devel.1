Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B306C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 22:28:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349471.1607230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wegva-0001gn-J5; Tue, 30 Jun 2026 22:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349471.1607230; Tue, 30 Jun 2026 22:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wegva-0001gY-DC; Tue, 30 Jun 2026 22:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1349471;
 Tue, 30 Jun 2026 22:27:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wegvZ-0001f6-MC
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 22:27:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wegvY-00605S-K2
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 00:27:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a4442bb-e002-0a2a0a5209dd-0a2a4509dc24-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:27:36 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a4442d6-97e6-0a2a45090019-aceafc1f8226-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:27:36 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 26A0343E3B;
 Tue, 30 Jun 2026 22:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EF11F000E9;
 Tue, 30 Jun 2026 22:27:33 +0000 (UTC)
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
	s=k20260515; t=1782858454;
	bh=x4IZpu84ynpH39xW86YJTAA/WjDrlZ00DK7i8GtCeMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ZUlK2TilulNPPvZxcucS3tjzWAC+nbWqqfERqwyZrrjPAJwjEsbYBHP5zqLNwA1ut
	 gsG6zpMPJYOyW3HJIXZ3hj6lInZo4R8QLB01FlOWTHev1j+RbfnCxQVu4maoEU51kQ
	 Bn8tnEPdy7qGFx++FRkagrlPGX45MPqiYrpcmTyyi41mI8a6C8GE9yo/4KkEmuHZzB
	 tZWsDy1oyBJj3d1Ob1/zn/frALyxeoxl1Bz+ci5Xz4q2ImEx0T2mlrEGku9fNPIcL8
	 6ALexsEo5ZR0/lVH2nZ++I657BJeY+4CH4450HcNtXvOg86GSWYJ8dKkrkW9iAqP1y
	 Qs7k4fLVScPVA==
Date: Tue, 30 Jun 2026 15:27:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/front-pgdir-shbuf: free grant reference head on
 errors
In-Reply-To: <20260629160517.29340-1-alhouseenyousef@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2606301527220.992629@ubuntu-linux-20-04-desktop>
References: <20260629160517.29340-1-alhouseenyousef@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1782858456-55D90986-53618CD8/0/0
X-purgate-type: clean
X-purgate-size: 1860

On Mon, 29 Jun 2026, Yousef Alhouseen wrote:
> grant_references() allocates a private grant-reference head before
> claiming references for the page directory and, for guest-owned buffers,
> the data pages. The success path frees the remaining head, but claim
> failures and grant_refs_for_buffer() errors return immediately.
> 
> Unwind through a common exit path so the private grant-reference head is
> released even when granting fails part-way through setup. The caller
> still tears down any references already stored in buf->grefs.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/xen-front-pgdir-shbuf.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
> index 9c7d8af6e6a1..428187edf85d 100644
> --- a/drivers/xen/xen-front-pgdir-shbuf.c
> +++ b/drivers/xen/xen-front-pgdir-shbuf.c
> @@ -445,8 +445,10 @@ static int grant_references(struct xen_front_pgdir_shbuf *buf)
>  		unsigned long frame;
>  
>  		cur_ref = gnttab_claim_grant_reference(&priv_gref_head);
> -		if (cur_ref < 0)
> -			return cur_ref;
> +		if (cur_ref < 0) {
> +			ret = cur_ref;
> +			goto out_free_refs;
> +		}
>  
>  		frame = xen_page_to_gfn(virt_to_page(buf->directory +
>  						     PAGE_SIZE * i));
> @@ -457,11 +459,13 @@ static int grant_references(struct xen_front_pgdir_shbuf *buf)
>  	if (buf->ops->grant_refs_for_buffer) {
>  		ret = buf->ops->grant_refs_for_buffer(buf, &priv_gref_head, j);
>  		if (ret)
> -			return ret;
> +			goto out_free_refs;
>  	}
>  
> +	ret = 0;
> +out_free_refs:
>  	gnttab_free_grant_references(priv_gref_head);
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> -- 
> 2.54.0
> 

