Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4738606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KsF2WCld;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hXhw2CRu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KsF2WCld;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hXhw2CRu
Received: from list by lists.xenproject.org with outflank-mailman.1457672.1671138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLn-0001BY-Bh; Fri, 23 Oct 2026 10:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457672.1671138; Fri, 23 Oct 2026 10:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCLn-0001A1-3L; Fri, 23 Oct 2026 10:18:15 +0000
Received: by outflank-mailman (input) for mailman id 1457672;
 Wed, 21 Oct 2026 22:36:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <fmancera@suse.de>) id 1xJevF-0004hu-Bd
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 22:36:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJevE-000Y0i-Kq
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 00:36:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <fmancera@suse.de>)
 id 6ad93ddc-bab6-0a2a0a5309dd-0a2a450bc544-48
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 00:36:36 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <fmancera@suse.de>)
 id 6ad93e74-b7e8-0a2a450b0019-c387df828266-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 00:36:36 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FBE521F3C;
 Wed, 21 Oct 2026 22:36:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 273B5134FD;
 Wed, 21 Oct 2026 22:36:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BuZaOnI+2WpvSgAAD6G6ig
 (envelope-from <fmancera@suse.de>); Wed, 21 Oct 2026 22:36:35 +0000
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
	t=1792622196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNzlXZ25cjHC8Y6LWtQ26Wk3I5gdPM3oyHxlgoDmVo4=;
	b=KsF2WCldQNsuqC3NqvKuKXOASQ1UngC5UEwN/QlKYkxKFaBdVR7LdQsZt8CKeBVK9xF4Zh
	tDxxsILXIxgE71dLzK5DJ8e444Oz6MXxFq91tZgFaq4ScaPo2st/+I/yTzlGEP/yS6wg9Y
	qmz2j0MRT88601TQpXVfnX+KJvmW3GE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792622196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNzlXZ25cjHC8Y6LWtQ26Wk3I5gdPM3oyHxlgoDmVo4=;
	b=hXhw2CRuRRlRiG/T2l96Afr3T/8uJ+502OxDXlU4OnlPyazJLFenNVjawZo47rG0VPSY5N
	clk79m+E4JxVusDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792622196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNzlXZ25cjHC8Y6LWtQ26Wk3I5gdPM3oyHxlgoDmVo4=;
	b=KsF2WCldQNsuqC3NqvKuKXOASQ1UngC5UEwN/QlKYkxKFaBdVR7LdQsZt8CKeBVK9xF4Zh
	tDxxsILXIxgE71dLzK5DJ8e444Oz6MXxFq91tZgFaq4ScaPo2st/+I/yTzlGEP/yS6wg9Y
	qmz2j0MRT88601TQpXVfnX+KJvmW3GE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792622196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNzlXZ25cjHC8Y6LWtQ26Wk3I5gdPM3oyHxlgoDmVo4=;
	b=hXhw2CRuRRlRiG/T2l96Afr3T/8uJ+502OxDXlU4OnlPyazJLFenNVjawZo47rG0VPSY5N
	clk79m+E4JxVusDA==
Message-ID: <c8cfc286-df64-49dc-b386-2e89ecc701b2@suse.de>
Date: Thu, 22 Oct 2026 00:36:26 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
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
 <20261021-b4-skbuff-bug-on-followups-v2-4-2aa780a03524@toxicpanda.com>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-4-2aa780a03524@toxicpanda.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,gmail.com,google.com,vger.kernel.org,lists.xenproject.org];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[toxicpanda.com:email]
X-Spam-Score: -11.79
X-Spam-Level: 
X-purgate-ID: tlsNG-42698a/1792622196-A86CA9EA-C8231F68/0/0
X-purgate-type: clean
X-purgate-size: 2104
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 3:46 PM, Josef Bacik wrote:
> When the device can't checksum the protocol, skb_segment() computes
> each segment's checksum in software with skb_checksum().  With SG on,
> the segments share the original frags, and a devmem TCP skb keeps its
> whole payload in unreadable frags.  The devmem MSG_ZEROCOPY path never
> sets SKBFL_SHARED_FRAG, so the __skb_linearize() fallback is skipped
> too.  skb_checksum() then warns and returns 0, and tcp_gso_segment()
> writes a TCP checksum that doesn't cover the payload that goes out.
> 
> That's reachable with tx-checksumming off and SG on: sk_setup_caps()
> still gives TCP SG and HW_CSUM, so the dmabuf send is accepted, and
> harmonize_features() strips the checksum features but keeps SG.
> 
> Use skb_checksum_full() and fail the segmentation with -EFAULT when it
> can't checksum a segment, as skb_segment() already does when it can't
> copy one.
> 
> Found by the Sashiko AI review of an earlier fix for the same path with
> SG off.
> 
> Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---

Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>

Thanks!

>   net/core/skbuff.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 40d2dd20d47d..88ed2dd99dc0 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -5239,9 +5239,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
>   
>   			if (!nskb->remcsum_offload)
>   				nskb->ip_summed = CHECKSUM_NONE;
> -			SKB_GSO_CB(nskb)->csum =
> -				skb_checksum(nskb, doffset,
> -					     nskb->len - doffset, 0);
> +			SKB_GSO_CB(nskb)->csum = 0;
> +			if (skb_checksum_full(nskb, doffset,
> +					      nskb->len - doffset,
> +					      &SKB_GSO_CB(nskb)->csum)) {
> +				err = -EFAULT;
> +				goto err;
> +			}
>   			SKB_GSO_CB(nskb)->csum_start =
>   				skb_headroom(nskb) + doffset;
>   		}
> 


