Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F7606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FCQQFScA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+oI2jbf8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FCQQFScA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+oI2jbf8
Received: from list by lists.xenproject.org with outflank-mailman.1457649.1671127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLm-0000zx-GO; Fri, 23 Oct 2026 10:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457649.1671127; Fri, 23 Oct 2026 10:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLm-0000yj-7b; Fri, 23 Oct 2026 10:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1457649;
 Wed, 21 Oct 2026 22:08:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <fmancera@suse.de>) id 1xJeUD-0000rG-Pa
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 22:08:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJeUD-007BDz-6g
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 00:08:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <fmancera@suse.de>)
 id 6ad937c9-2eae-0a2a0a5409dd-0a2a450beca4-40
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 00:08:41 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <fmancera@suse.de>)
 id 6ad937e8-b7e8-0a2a450b0019-c387df83de84-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 00:08:41 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 977F11F896;
 Wed, 21 Oct 2026 22:08:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8175134A5;
 Wed, 21 Oct 2026 22:08:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6b6qHOc32WqDLgAAD6G6ig
 (envelope-from <fmancera@suse.de>); Wed, 21 Oct 2026 22:08:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede2_rsa header.d=suse.de header.i="@suse.de" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=permerror header.s=susede2_ed25519 header.d=suse.de header.i="@suse.de"; dkim=pass header.s=susede2_rsa header.d=suse.de header.i="@suse.de" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=permerror header.s=susede2_ed25519 header.d=suse.de header.i="@suse.de"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792620520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rps3j/Ol+umElVM3i3J1CQ+c26rRYH3c8bCidpO4rlA=;
	b=FCQQFScAeE3XcQzfVRcAEtYT+0CUb93eoGGcBBOEZ3LkxGCzC5vhHADtH6oINhu4hLZCz0
	no5fKOb+eGvnpteZZ+UAVS4vPJJulLGUayX7VLwA+o191PRNEXJJr7QwRKzQILuTkMrTg2
	pqcD6j6ephaIzZ5iEGTTyFDaMhPsM2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792620520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rps3j/Ol+umElVM3i3J1CQ+c26rRYH3c8bCidpO4rlA=;
	b=+oI2jbf8oH/vyZFWBJqu6X7MmPpT3/1lgMz6u7vhzXJgtuqWdgyaSWGzCdxWKaHVyKi9EO
	fxrYBMZWu6TIlLDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792620520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rps3j/Ol+umElVM3i3J1CQ+c26rRYH3c8bCidpO4rlA=;
	b=FCQQFScAeE3XcQzfVRcAEtYT+0CUb93eoGGcBBOEZ3LkxGCzC5vhHADtH6oINhu4hLZCz0
	no5fKOb+eGvnpteZZ+UAVS4vPJJulLGUayX7VLwA+o191PRNEXJJr7QwRKzQILuTkMrTg2
	pqcD6j6ephaIzZ5iEGTTyFDaMhPsM2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792620520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rps3j/Ol+umElVM3i3J1CQ+c26rRYH3c8bCidpO4rlA=;
	b=+oI2jbf8oH/vyZFWBJqu6X7MmPpT3/1lgMz6u7vhzXJgtuqWdgyaSWGzCdxWKaHVyKi9EO
	fxrYBMZWu6TIlLDw==
Message-ID: <bea0f98f-b866-48f7-89d4-69ebb98a9af9@suse.de>
Date: Thu, 22 Oct 2026 00:08:34 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/15] net: skbuff: add skb_checksum_full()
 that reports failure
To: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
 <20261021-b4-skbuff-bug-on-followups-v2-2-2aa780a03524@toxicpanda.com>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-2-2aa780a03524@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[netdev];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,gmail.com,google.com,vger.kernel.org,lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[toxicpanda.com:email,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.79
X-Spam-Level: 
X-purgate-ID: tlsNG-42698a/1792620521-A9EC69EA-3FACEB8D/0/0
X-purgate-type: clean
X-purgate-size: 6006
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 3:46 PM, Josef Bacik wrote:
> skb_checksum() can't fail.  When the range runs into unreadable frags
> or past the end of the skb it returns 0, which is also a valid
> checksum, so its callers can't tell the sum from a failure.  For the
> receive-side validation helpers that means a packet whose payload was
> never checksummed can pass, and commit 20ddd0fd2fcd ("net: skbuff:
> don't BUG() on leftover length in skb_checksum() and friends") made the
> past-the-end case one of those instead of a BUG().
> 
> Add skb_checksum_full(), which adds the range's sum to *@csump and
> returns 0, or returns -EFAULT for unreadable frags or a range past the
> end of the skb, and -EINVAL for a negative length, leaving *@csump
> alone.  It's __must_check so a caller can't ignore the failure, and it
> recurses into frag_list members through itself so a failure there
> isn't lost either.
> 
> skb_checksum() becomes a wrapper around it that behaves as before for
> the callers that haven't been converted: it returns 0 on failure and
> warns once if that was because of unreadable frags.  The following
> patches convert the core users, and the rest will follow per subsystem.
> 
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>

nit: AFAIU the new wrapper does not behave the same way as before in all 
situations. Now inside frag_list recursion a child that hits an error 
returns 0 and in the old code the parent never checks what the child 
returned.

> ---
>   include/linux/skbuff.h |  2 ++
>   net/core/skbuff.c      | 56 +++++++++++++++++++++++++++++++++++++++++---------
>   2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 09db32f70b53..969b1c3269ec 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -4279,6 +4279,8 @@ int skb_copy_bits(const struct sk_buff *skb, int offset, void *to, int len);
>   int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len);
>   int __must_check skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
>   					u8 *to, int len, __wsum *csum);
> +int __must_check skb_checksum_full(const struct sk_buff *skb, int offset,
> +				   int len, __wsum *csump);
>   int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
>   		    struct pipe_inode_info *pipe, unsigned int len,
>   		    unsigned int flags);
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index a2b52a5a61a9..061c61422a38 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -3545,12 +3545,31 @@ int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len)
>   EXPORT_SYMBOL(skb_store_bits);
>   
>   /* Checksum skb data. */
> -__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
> +/**
> + *	skb_checksum_full - checksum a range of an skb
> + *	@skb: buffer to checksum
> + *	@offset: offset in @skb to start at
> + *	@len: number of bytes to checksum
> + *	@csump: the sum to add to; on success the range's sum is added to it
> + *
> + *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
> + *	has unreadable frags in the range or runs out before @len does.  On
> + *	failure *@csump is not changed.
> + */
> +int skb_checksum_full(const struct sk_buff *skb, int offset, int len,
> +		      __wsum *csump)
>   {
>   	int start = skb_headlen(skb);
>   	int i, copy = start - offset;
>   	struct sk_buff *frag_iter;
> +	__wsum csum = *csump;
>   	int pos = 0;
> +	int err;
> +
> +	if (unlikely(len < 0)) {
> +		DEBUG_NET_WARN_ON_ONCE(1);
> +		return -EINVAL;
> +	}
>   
>   	/* Checksum header. */
>   	if (copy > 0) {
> @@ -3558,13 +3577,13 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
>   			copy = len;
>   		csum = csum_partial(skb->data + offset, copy, csum);
>   		if ((len -= copy) == 0)
> -			return csum;
> +			goto out;
>   		offset += copy;
>   		pos	= copy;
>   	}
>   
> -	if (WARN_ON_ONCE(!skb_frags_readable(skb)))
> -		return 0;
> +	if (!skb_frags_readable(skb))
> +		return -EFAULT;
>   
>   	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
>   		int end;
> @@ -3593,7 +3612,7 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
>   			}
>   
>   			if (!(len -= copy))
> -				return csum;
> +				goto out;
>   			offset += copy;
>   		}
>   		start = end;
> @@ -3606,14 +3625,17 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
>   
>   		end = start + frag_iter->len;
>   		if ((copy = end - offset) > 0) {
> -			__wsum csum2;
> +			__wsum csum2 = 0;
> +
>   			if (copy > len)
>   				copy = len;
> -			csum2 = skb_checksum(frag_iter, offset - start, copy,
> -					     0);
> +			err = skb_checksum_full(frag_iter, offset - start, copy,
> +						&csum2);
> +			if (err)
> +				return err;
>   			csum = csum_block_add(csum, csum2, pos);
>   			if ((len -= copy) == 0)
> -				return csum;
> +				goto out;
>   			offset += copy;
>   			pos    += copy;
>   		}
> @@ -3621,9 +3643,23 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
>   	}
>   	if (unlikely(len)) {
>   		DEBUG_NET_WARN_ON_ONCE(1);
> -		return 0;
> +		return -EFAULT;
>   	}
> +out:
> +	*csump = csum;
> +	return 0;
> +}
> +EXPORT_SYMBOL(skb_checksum_full);
>   
> +/* skb_checksum() has no way to report failure, so it returns 0, which is a
> + * valid checksum.  Use skb_checksum_full() in new code.
> + */
> +__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
> +{
> +	if (unlikely(skb_checksum_full(skb, offset, len, &csum))) {
> +		WARN_ON_ONCE(!skb_frags_readable(skb));
> +		return 0;
> +	}
>   	return csum;
>   }
>   EXPORT_SYMBOL(skb_checksum);
> 


