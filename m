Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88825606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aaknlfmJ
Received: from list by lists.xenproject.org with outflank-mailman.1457854.1670359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJo3O-00057w-6l; Thu, 22 Oct 2026 08:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457854.1670359; Thu, 22 Oct 2026 08:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJo3O-00057n-3Z; Thu, 22 Oct 2026 08:21:38 +0000
Received: by outflank-mailman (input) for mailman id 1457854;
 Thu, 22 Oct 2026 08:21:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pabeni@redhat.com>) id 1xJo3M-00057f-H1
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 08:21:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJo3L-0065ef-N8
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 10:21:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pabeni@redhat.com>)
 id 6ad9c78e-2eae-0a2a0a5409dd-0a2a4508d3be-6
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 10:21:35 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pabeni@redhat.com>)
 id 6ad9c78e-f659-0a2a45080019-aa0a857c51cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 10:21:35 +0200
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-culzfh6qPpGd8R0q895OBA-1; Thu, 22 Oct 2026 08:21:30 +0000
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48af4a0bd0fso862086f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 01:21:30 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it.
 [195.231.47.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2581f15esm11704149f8f.20.2026.10.22.01.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 01:21:28 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792657294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvrxCavEY1oK9h13zUKSYsDKsO/+0N+t+Jn7Dea1vaM=;
	b=aaknlfmJq4wB5U99Zq0qZmU+6qQrMuRXLC5bBVzf4Z33Q7scC3dEOtmU1iRVrQwzgzDCHr
	Nl4ykTN+yxpsYmKQX1pmv4rQVYBnVWm6JVDHuFIeI6sFgRVmJT4VSMNFz173PmBclUoDkQ
	KO6RMKYzP2dPRgBa9+7zMyhXNSG2OtI=
X-MC-Unique: culzfh6qPpGd8R0q895OBA-1
X-Mimecast-MFC-AGG-ID: culzfh6qPpGd8R0q895OBA_1792657289
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657289; x=1793262089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvrxCavEY1oK9h13zUKSYsDKsO/+0N+t+Jn7Dea1vaM=;
        b=P/TP/E8zitTUOxvoTNdh3O2wu3lR61G+7YhiXZWo0mStVWLjw5n+MdaJhp0M73svyC
         aSAfe5ncIomzDfR3fZdFYTBxDJNiWMKAWQ64h/kUlhxa7XmtZK9nbk7wdszSE9zm1HZ7
         Hx+xtFBsYuTqhb8FhQVqjENXXLtggT65PtJqMHJg01ZPH9zCxEcleLuFCQp2SceQ4LMq
         G0LRzo2gOUdNQOBFqODhL5cdnEkdK0f8GbN2xFHZmqxATRTgG/+FzmS0XiomXibAYLWu
         RCTCbWna0TfbLH1GwgXcOTxabFojqfIsRkQj3Ol024/Q+XBvIWrBQv1xkbpXD2DRPL4u
         MbAA==
X-Forwarded-Encrypted: i=1; AKwUvBy7ziIxR7WrFgh7yFn5hWhRO5vbdPtccFRpWu8DGlQzoSVK1VNv+Fgciirhi4IiNC6M4jT5h18N0kI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLHpLQUZ/ZWBHEMyt9cTHR/7AOob5gjtypkkY+/vKRVt76H3d2w
	1aEk7zRFvLuw4uSHznas84EeBO1JKOSoqLzyB1+WtE7FOCxqBBjK6+WsN7Appv8zAybpT+Fxwjo
	6ISBgPX9jJUtX8Iyz+0b2m3tSZeVlOWLdK4hNZfNMpj3YXTahJCY4XffVslPakY94+8tY
X-Gm-Gg: AYBFou0QslwWmbSsZv/zRZ41vZ4O1p9Q6BcOz8gN99PLbNVDG6N2CUgxcb2KGhFxfTD
	GcbW+sKU7mVv3NyaYoZ6Aa0TQp0oUXn0/HFbqzwBhdM5y58NIS48CXG0iMrIA1eKhIjBVX525Un
	9lv5GgoStrlOptPBsrxldnCDq8dNbGrauLb2lCJgKIJdechExaMoRUYjJMHk3sG606s99dGvMP0
	KhaV72Q4XYbJgJfhQa9Dr/m/V11COZvwkAm0mC08Cdb7jlwvsogCnrtz1BqqSM3o+6gEvnoBE6o
	hqf85BGLSXRvucn/VOW4+POGjStfU6lxeg0rmUp6KvzcUDET3LDXVX7TFQbJ8F4sImrXVzSlEoy
	ll0gYmNZWrczbVERa8Jw9IrsFVJV0AvK9fL59fYupkJyhTvqoLQryhpm4pbZOrTsOTcDz2I7+rg
	==
X-Received: by 2002:a05:6000:25c3:b0:48c:43a3:6a74 with SMTP id ffacd0b85a97d-48e2649d874mr10773775f8f.12.1792657289371;
        Thu, 22 Oct 2026 01:21:29 -0700 (PDT)
X-Received: by 2002:a05:6000:25c3:b0:48c:43a3:6a74 with SMTP id ffacd0b85a97d-48e2649d874mr10773718f8f.12.1792657288926;
        Thu, 22 Oct 2026 01:21:28 -0700 (PDT)
Message-ID: <717ace2e-18b2-4df5-848d-5757c01ee5de@redhat.com>
Date: Thu, 22 Oct 2026 10:21:26 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/15] net: skbuff: make
 skb_copy_and_csum_bits() report unreadable frags
To: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
 <20261021-b4-skbuff-bug-on-followups-v2-1-2aa780a03524@toxicpanda.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-1-2aa780a03524@toxicpanda.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K_hvyk3Z-zqaf7lO5FirHQX-k1CjbtfGtpTDVoQwEjI_1792657289
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1792657295-D437587B-AB3290FE/0/0
X-purgate-type: clean
X-purgate-size: 5589
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 15:46, Josef Bacik wrote:
> skb_copy_and_csum_bits() has no way to fail.  When it reaches
> unreadable frags it zero-fills the rest of the buffer and returns 0,
> and since commit ab9414ed70bd ("net: skbuff: don't leave stale bytes in
> skb_copy_and_csum_bits()") that 0 is the correct checksum for what's in
> the buffer.  Its callers can't tell the copy didn't happen.
> 
> That matters in the !sg && !csum branch of skb_segment().  A devmem TCP
> skb keeps its whole payload in unreadable frags, so every segment ends
> up with a payload of zeroes, tcp_gso_segment() writes a valid TCP
> checksum over it, and the peer accepts the zeroes as stream data.  This
> is reachable when both SG and TX checksum offload are turned off on a
> device used for devmem TX: sk_setup_caps() still gives TCP SG and
> HW_CSUM, so the dmabuf send is accepted, validate_xmit_unreadable_skb()
> lets the skb through for a NETMEM_TX_NO_DMA device or a matching
> binding, and software GSO segments it with neither feature.  Before
> that commit the segments carried uninitialized memory with a checksum
> that almost never matched.
> 
> This was reproduced with a test module rather than on devmem hardware:
> skb_segment() on a TCPv4 GSO skb with 3000 bytes of payload in a page
> frag marked unreadable, with features == 0, returns 3 segments whose
> payloads are all zeroes, each with a checksum of 0, which is correct for
> zeroes.  There's no warning or error; the data is silently replaced.
> With this patch skb_segment() returns -EFAULT.
> 
> Make skb_copy_and_csum_bits() return 0 or -EFAULT and hand the checksum
> back through a pointer, and make it __must_check so a new caller can't
> ignore the failure.  Running out of skb before @len returns -EFAULT
> too; commit 417261779eab ("net: skbuff: don't BUG() on leftover length
> in skb_copy_and_csum_bits()") made that a zero-fill and a checksum of 0.
> Each caller takes the error path it already has for a failed copy:
> 
>   - skb_segment() fails the segmentation, as the csum branch already
>     does when skb_copy_bits() fails.
>   - icmp_glue_bits() and icmpv6_getfrag() return the error, so the ICMP
>     error isn't sent.
>   - __ip_append_data() and __ip6_append_data() drop the new skb and
>     return -EFAULT, as they do when getfrag fails.
>   - vnet_skb_shape() fails the same way it does when its skb_copy_bits()
>     call fails.
>   - xdr_skb_read_bits() returns 0 without consuming anything, as it does
>     when skb_copy_bits() fails, so desc.count stays non-zero and
>     csum_partial_copy_to_xdr() fails.  csum_partial_copy_to_xdr() used
>     to checksum the bytes it hadn't copied before checking desc.count.
>     desc.offset and desc.count always add up to skb->len, so that only
>     ran when it was about to fail anyway, and on an unreadable skb
>     skb_checksum() would WARN.  Drop it.
>   - skb_copy_and_csum_dev() can't return an error, so it leaves the
>     checksum alone and the frame goes out with a bad one.  Its callers
>     are drivers that never see unreadable skbs anyway.
> 
> The zero-fill stays, so a caller that does send the buffer still
> doesn't leak anything.
> 
> This was found by the Sashiko AI review of that commit, and
> Mina suggested reporting the error from the helper rather than checking
> for unreadable frags in skb_segment().
> 
> Link: https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kernel.org/
> Suggested-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>   drivers/net/ethernet/sun/sunvnet_common.c | 10 +++--
>   include/linux/skbuff.h                    |  4 +-
>   net/core/skbuff.c                         | 63 +++++++++++++++++++++----------
>   net/ipv4/icmp.c                           |  9 +++--
>   net/ipv4/ip_output.c                      | 11 ++++--
>   net/ipv6/icmp.c                           |  7 +++-
>   net/ipv6/ip6_output.c                     | 11 ++++--
>   net/sunrpc/socklib.c                      |  9 ++---
>   8 files changed, 83 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sun/sunvnet_common.c b/drivers/net/ethernet/sun/sunvnet_common.c
> index 5cca95869052..4f229fcecc32 100644
> --- a/drivers/net/ethernet/sun/sunvnet_common.c
> +++ b/drivers/net/ethernet/sun/sunvnet_common.c
> @@ -1167,9 +1167,13 @@ static inline struct sk_buff *vnet_skb_shape(struct sk_buff *skb, int ncookies)
>   
>   			/* copy the rest, with csum calculation */
>   			*(__sum16 *)(skb->data + offset) = 0;
> -			csum = skb_copy_and_csum_bits(skb, start,
> -						      nskb->data + start,
> -						      skb->len - start);
> +			if (skb_copy_and_csum_bits(skb, start,
> +						   nskb->data + start,
> +						   skb->len - start, &csum)) {

Recently Eric did some work to remove return arguments from the fast-path,
as with some config it gives measurable overhead. See commit
a02a765bd5c2ae7705144829b2911c96c29db6ba.

S/W csum should not be the fastest path, but AFAICS the UDP output path
could use it when building the aggregate segments.

I'm wondering using a 64 bit return value and encoding there both the csum
and the error coudl make sense.

Also currently net-next is closed for the merge window, and a bunch of
changes in this series looks more like cleanup than fixes. Cleanup will have
to wait for the end of the merge window, fixes can land at any time.

/P


