Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BDF606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 01:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vtl3UBIk
Received: from list by lists.xenproject.org with outflank-mailman.1495378.1694345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTqgR-0000LC-9b; Thu, 19 Nov 2026 01:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495378.1694345; Thu, 19 Nov 2026 01:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTqgR-0000L5-6n; Thu, 19 Nov 2026 01:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1495378;
 Thu, 19 Nov 2026 01:11:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xTqgP-0000Kz-Sq
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 01:11:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTqgP-00AM7q-9Q
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 02:11:25 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afe4c6f-2eae-0a2a0a5409dd-0a2a4504a3c8-42
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:11:25 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afe4cbb-b57f-0a2a45040019-aceafc1fac4c-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:11:25 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CF3D48C91;
 Thu, 19 Nov 2026 01:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6AD1F000C9;
 Thu, 19 Nov 2026 01:11:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050683;
	bh=906ZgW5lJwthjACRcRQJ/cRnxEiYGebbeQjPnL9DKys=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Vtl3UBIkDMIau7mZ5vmRgXDFJ6C1fHOE32QbnzGlNypRPowPot9E2jsnVaWdODAlo
	 e2inputvvb5z3yX8SZQh+MY1iY419YAb11fzfzS4HM2/xfKZOAKpluJaBQ0MKdW3zy
	 3l/7q872KD01iyLa8CUbVsdlCkcPfGqqbTbIEwONBJyZISprUMSrIPNWXSuNWDrKdf
	 R95jC6dXQY+KSH4rzGA3df+6t8uYBKBPod1/GVBWb5xPT83oYLliHm2cvQAwpVpzjA
	 QrkR4KkKx+iSggA/K4YjojxCmpPKKtlliAegVBSzqsXmPlNei6eltYqmC+4n4DxDmu
	 0mcrKklOAJq0g==
Date: Wed, 18 Nov 2026 17:11:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: Fix sign extension logic in
 sign_extend()
In-Reply-To: <20261118083742.32484-1-michal.orzel@amd.com>
Message-ID: <96005a11-c8b9-6c8c-f3cc-04f85d4e1e0b@kernel.org>
References: <20261118083742.32484-1-michal.orzel@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ebf023/1795050685-C10DDB50-A35D533D/0/0
X-purgate-type: clean
X-purgate-size: 1376
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026, Michal Orzel wrote:
> At the moment, we always sign extend to the full register width, i.e.
> 64-bit on Arm64, even though for byte and half-word accesses the
> destination can also be a W (32-bit) register (LDRSB Wt, LDRSH Wt). In
> that case, the architecture requires bits [63:32] of Xt to be zero, but
> a subsequent use of Xt by the guest sees them set to ones. Fix it.
> 
> Fixes: ac0ca6895b65 ("xen/arm: io: Support sign-extension for every read access")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/traps.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 3b40afe26259..c5b6ff5b788b 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -111,6 +111,12 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>           */
>          BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>          r |= (~0UL) << size;
> +
> +#ifdef CONFIG_ARM_64
> +        /* When loading to W register we should only sign extend to 32-bit */
> +        if ( !dabt.sf )
> +            r = (uint32_t)r;
> +#endif
>      }
>  
>      return r;
> -- 
> 2.43.0
> 

