Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C8FCD4F21
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2026 20:57:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1308472.1579906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGe5-0005TW-00; Wed, 13 May 2026 20:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308472.1579906; Wed, 13 May 2026 20:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGe4-0005TP-Tf; Wed, 13 May 2026 20:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1308472;
 Wed, 13 May 2026 20:57:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wNGe3-0005QD-0a
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 20:57:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGe2-003w5X-Dp
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 22:57:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e597-bab6-0a2a0a5309dd-0a2a4509d626-26
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:57:30 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a04e5ba-2497-0a2a45090019-a237832fc384-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:57:30 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 174D34EE1D3A;
 Wed, 13 May 2026 22:57:30 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1778705850;
	b=ceNqlb+CuF+jorU8Wx9BcxFvagjdfPy49Ky5wBqMxnAU/q1rGMG6y/SqonF3zc8YpWKQ
	 37Cy56+B6GHF4CrIDmXQvr3J3rC3PXIl7cSl6uFImmIulAvIbtU8vMI4MHHCgDgJPlhMw
	 Gsf8irz85frWaQ6VEPFWqCg+hWrdDQhJ+BNLI3jnL2YAll56UUXeLttGMINjIIybXZfdj
	 ZT/7WDKxkkgUOicCXY+1Q6mt78r+gqQHtXk82eTjMEtQb0Doztt+MVa9taDUk1QeZWbou
	 lGkeGpU1i/WXBBoaB2bvoTbHSpdROHvRvEAn8cHhaeCRARIxZ2ldpOE0TGKTZ+XZyEwa8
	 p31xTSRIMiUZBdicEL9UBskXppFFbBDjSnvTa6FaA7clQkpiNS0YCbOEBZjSGvWuQELf4
	 cjcle2d5aMfH7xRVCBi7u1Lq3RvhgR7teIoVVdhjGKV1PZ20RjqxQQLIjM7igzYm/ghEG
	 yidtjzcaT15xhUKaJ7UmbzvyC+m4RgKI81vpbM8MyiK0cTbAfnGaoKzfsrr/WYq8OvgoG
	 Tp0oWBBnxI9GrnwLjXzcHVJMSX9X8t7yg+wGfsBq0qxcNQ/FKPGxLrlz3riJkppMbYjpp
	 gxWtC9UOJ/fQCks1QKAvrUGMjSOoaFhDcZfqcF1BBGqQVu1PbaOmDepFUO0vpI0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1778705850;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=2+2IlPZf8jZ1VbwpfpG+rDF5J+dRcr28rGmbAHPKR24=;
	b=SlOgZVKDhsl7tk/mFBaPvqFaCPMpRWjIpV+327782dmz7RGJALDe7ERAzc7cFZpGMi3G
	 NwR5/JXN/jHqwkHG2uAUFybL07FYSPz1SU8kZnTw8dsEXM7Xbp6PtkyMHFnx7fXBednQx
	 CU57ze35hGVGrob2rCzsEa6hsOM9NzqAGch04w045+7IlhtpQNYMTVFDfF39bqXfhfFuE
	 RsFhgO8lFMaSG0Y0O/S4hQg3RwxYSoe76zKZ28fFN2EZl3B85dvFmLJVgHHJNOknzfQWd
	 hgRttC9ZD1Pik7ZmEtHLbpJ3treDYA5DjuU7yAgftdEDYQk5sXGyzAWH/oO8cpWn/d97j
	 8sCIiZgJfRB5QSnWZuFZaSwFynt/Bq7sJIqs0vOYfWJRIzeWsRRQw3inoWz4Hw3LCqQwB
	 YEzQsHC0tr0/bI3JwSCJTzqMTC8xk004xj/Zr578F1qUQ/90tKjHe5irpylCDUGvNAwig
	 yp94p4TE+hsCJ2f2K7OqLJAi87ba6uUtT5XGHh19ShxgtxLDmSe+Gn5ki8UV0Y6xwI4Bq
	 p4qV1YX3nmiWg+bTLGUE0qNbgZBDuJtaYHk66z5fXsaqBk2foyLHMiJ/qzrsod8tNzRWQ
	 aQvv4IiXFLzHhVR8yE223tWxV/jU0GXmEP3qR1tdpZvqT1mB40BN/llOCyainHk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 13 May 2026 22:57:30 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] crypto/rijndael: adjust for Misra C:2012 rule 8.3
In-Reply-To: <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
References: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
 <3ca0351a-8be9-4b3b-989f-0ba004fada2f@suse.com>
Message-ID: <1204570ec06469568958c7ad1cf53496@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1778705850-40563A53-51FCBB80/0/0
X-purgate-type: clean
X-purgate-size: 1642

On 2026-05-13 16:01, Jan Beulich wrote:
> ... ("All declarations of an object or function shall use the same 
> names
> and type qualifiers"). Bring declarations in line with the 
> corresponding
> definitions, accepting the use of the being-phased-out u<N> types. 
> While
> we don't define NEED_RIJNDAEL_DECRYPT, cover rijndaelKeySetupDec() as
> well for completeness.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

with the typo in rijndaelKeySetupDec's declaration fixed as noted by 
Stefano

> --- a/xen/include/crypto/rijndael.h
> +++ b/xen/include/crypto/rijndael.h
> @@ -50,9 +50,8 @@ int	rijndael_set_key_enc_only(rijndael_c
>  void	rijndael_decrypt(rijndael_ctx *ctx, const unsigned char *src, 
> unsigned char *dst);
>  void	rijndael_encrypt(rijndael_ctx *ctx, const unsigned char *src, 
> unsigned char *dst);
> 
> -int	rijndaelKeySetupEnc(unsigned int rk[], const unsigned char 
> cipherKey[], int keyBits);
> -int	rijndaelKeySetupDec(unsigned int rk[], const unsigned char 
> cipkerKey[], int keyBits);
> -void	rijndaelEncrypt(const unsigned int rk[], int Nr, const unsigned 
> char pt[16],
> -			unsigned char ct[16]);
> +int	rijndaelKeySetupEnc(u32 rk[], const u8 cipherKey[], int keyBits);
> +int	rijndaelKeySetupDec(u32 rk[], const u8 cipkerKey[], int keyBits);
> +void	rijndaelEncrypt(const u32 rk[], int Nr, const u8 pt[16], u8 
> ct[16]);
> 
>  #endif /* __RIJNDAEL_H */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

