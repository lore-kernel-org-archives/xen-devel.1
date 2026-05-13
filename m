Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2952ECD4F21
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2026 20:48:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1308451.1579888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGUn-00032t-Uq; Wed, 13 May 2026 20:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308451.1579888; Wed, 13 May 2026 20:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGUn-00032m-Rx; Wed, 13 May 2026 20:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1308451;
 Wed, 13 May 2026 20:47:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wNGUn-00032a-1O
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 20:47:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGUk-00DGtW-T8
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 22:47:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e37c-5cb7-0a2a0a5109dd-0a2a4507d25c-0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:47:56 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e37a-229c-0a2a45070019-aceafc1fb224-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:47:56 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6FC6A4075B;
 Wed, 13 May 2026 20:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125FEC19425;
 Wed, 13 May 2026 20:47:54 +0000 (UTC)
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
	s=k20201202; t=1778705274;
	bh=O0zqcBOBq6DRxj4bk/iy7C/IXg3z+jEdR7fpHHctHqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LzuY2gwQaCdrkm9w7hQWmcwfPwIbXXTen4cp1JiVoU8FcCQDXsWqFL1yLg/A5+6PM
	 bdLzHh4FIsBHNt5CzB2KXwvHow4hlfD81ZPxzbxUKjCo/frnTfLXzWuK7AnxulTPQe
	 J1YqVsMkm+QQrMrRAey7uwQV2IFN7w3JK9ZxZqRmD9wqqKMwaZVoddoTnF7LeAUnL2
	 5IZIv47dnhv8vy9GGXycfCiY7R5m2CD1+CgV9T/qIG1EDA1tvqUdY6K0X+kpCD9DMv
	 WzjdoK0oA0QP+YGAFskOhYr/g1Ehk+kliUAgG+zTopzTC0FwIar3rL+ClVqWNs26ud
	 DPvGqWQCwYtMg==
Date: Wed, 13 May 2026 13:47:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] crypto/rijndael: adjust for Misra C:2012 rule 8.3
In-Reply-To: <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605131345020.3930@ubuntu-linux-20-04-desktop>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com> <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ef75cf/1778705276-0A16DC48-2EC49985/0/0
X-purgate-type: clean
X-purgate-size: 1418

On Wed, 13 May 2026, Jan Beulich wrote:
> ... ("All declarations of an object or function shall use the same names
> and type qualifiers"). Bring declarations in line with the corresponding
> definitions, accepting the use of the being-phased-out u<N> types. While
> we don't define NEED_RIJNDAEL_DECRYPT, cover rijndaelKeySetupDec() as
> well for completeness.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> --- a/xen/include/crypto/rijndael.h
> +++ b/xen/include/crypto/rijndael.h
> @@ -50,9 +50,8 @@ int	rijndael_set_key_enc_only(rijndael_c
>  void	rijndael_decrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
>  void	rijndael_encrypt(rijndael_ctx *ctx, const unsigned char *src, unsigned char *dst);
>  
> -int	rijndaelKeySetupEnc(unsigned int rk[], const unsigned char cipherKey[], int keyBits);
> -int	rijndaelKeySetupDec(unsigned int rk[], const unsigned char cipkerKey[], int keyBits);
> -void	rijndaelEncrypt(const unsigned int rk[], int Nr, const unsigned char pt[16],
> -			unsigned char ct[16]);
> +int	rijndaelKeySetupEnc(u32 rk[], const u8 cipherKey[], int keyBits);
> +int	rijndaelKeySetupDec(u32 rk[], const u8 cipkerKey[], int keyBits);

There is a typo "cipkerKey" which is only present in rijndael.h but not
in rijndael.c


> +void	rijndaelEncrypt(const u32 rk[], int Nr, const u8 pt[16], u8 ct[16]);
>  
>  #endif /* __RIJNDAEL_H */
> 
> 

