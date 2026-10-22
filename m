Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6089B606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NXy8MItj
Received: from list by lists.xenproject.org with outflank-mailman.1457903.1670395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJpV3-0002jc-Vf; Thu, 22 Oct 2026 09:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457903.1670395; Thu, 22 Oct 2026 09:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJpV3-0002jV-Sf; Thu, 22 Oct 2026 09:54:17 +0000
Received: by outflank-mailman (input) for mailman id 1457903;
 Thu, 22 Oct 2026 09:54:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1xJpV2-0002jP-LN
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 09:54:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJpV2-006QHY-1y
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 11:54:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6ad9dd45-e002-0a2a0a5209dd-0a2a4508c128-10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 11:54:16 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6ad9dd47-f659-0a2a45080019-d1558031bcbb-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 11:54:15 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a20803a757so2140715e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 02:54:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a203b3a4eesm54187115e9.7.2026.10.22.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 02:54:14 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662855; x=1793267655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kP2bh8OLzoj43YL1NHpZyuOIvZ9wkudBB2G5sKl/Fg=;
        b=NXy8MItjZR7Qn3Ou+OLdKlw2M7sy+lVsiRrOL/F7t9cTfp7oqRHIM/QWbXx3O1+anx
         9n4RTUYRDIvhEXXEwweqwp/uy2dnM9Jckq7paRV8NzLaesl9Nyilx+TWI5uFRLTjRsVk
         gwgTVPXmQny3MH29gOPMPKe2YK8Coybf4sNpVpFKvElnoxeCZJlEfXQ4MOZjWqVArpSe
         8TgmW768HHSMAs7As9SiqBpq1GnisdYF2KPHbK1jqBBBzWTqYsnNCEUk5/LNkl2wylLg
         5zJQuLOn3P7t80Cp4Ud4koKLpFJ5NjtgrbeAV+ktrhI931aNRR0/26JSSQwYvQEcqG6P
         ZI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662855; x=1793267655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kP2bh8OLzoj43YL1NHpZyuOIvZ9wkudBB2G5sKl/Fg=;
        b=MTUCRXP19fG8lnI3ikBUjOMcSjyEeLQ3zAN5R1K6Vv+vTGHk/g3oBYvXlAT6HygRVe
         jTFrQ+ALvY91qOfNmypnMcjYgS9NE0zhXbnZkE2KTXj7RpBX1s9G79ON1Y2yL8YvKpXd
         Z7QPrenbo+wFyarZlFHKTnVHBDhTBYWXPaemTRJ36c8fbqiuQk2f5Ya/RqVHgHSJTtWe
         EJJIyuB4+XCqgUzx3x13wiBkuE07bQcjIfyMmKBkN17hR3SLMi9r5dsMweEuJNpOAbcu
         AciRE1KzrWwKF8NRL50NnTloW1xdA8dw1mqdKHgAvzeeYZNekoBsk9LDZFU4a/cwp4LH
         p3rA==
X-Forwarded-Encrypted: i=1; AKwUvBwtFs0sjjd0iv7n3orfX6Ri01KrO5vQX1IFNe58cHXGmwwrGoObpaqW6aovKMfa0x/CB1of/cJX6po=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLMI0l0ao4M8M9sEQpuSinusiftDB61z30+FRcOZS+vUnE2TWT7
	wpvnxTlHFpMpvZwZUlcIkLNN7M6fFQl0+EIVcY2I6un18UiBuNIBv4yH
X-Gm-Gg: AYBFou0y/qAOZC3/K/R+cCMU7Ijm6U95MCGOHDpIGHqkqY6hU7fZ6A8gxLv49VT4TMX
	dcOgcZgDJdHpGE15pN3B/QEGgOP6vekimSyse7Yxeko9sWspihMSwut2sxrRV7udwG5RZGAArD3
	OBS8Ck6t1oSVcMl40na28wdJx3Gn7wJ8+oM14doD25OrksH7b2XszJhUdmL4hgFjLIbx+TY9siY
	GMpwqgqqRkBn8ONQ0xxDNBVhnxaFAmlqWLfuuqSM7n+MdQUTgtaK/dqG/hVDNL4S5CGCVMgCVKJ
	DrrBVzI4Nu/TDwT0Kr9CGFRYQvEnUgEFyN5osXFPTpFlE2R9EGg6oWJZgNJzf4ftrilrF0lI+1Z
	YSoXV37+1WbzM7Fkwsoeqe0oSL/IRKkYfrEVoguQ6ZE8n/pDKwRzT5095uN19W7JCj9ihOZHxsM
	P4u9FHTBpuZOACiLGtQ2oPaYgNn1MhbLs9Cik6RtXxrXwemNQ/eD/cj/t/bYWLvgNSLV8002Bq3
	KMf85NKzmMJsp/Y6CvUt1Bc/ypJ2Eserty9dbx/GJ7nOQQfoL/5SAUiFBuaW0tiMi6qpNwkFA9N
	DV3ATwjOgHskGq9Gi9oN2khZNCgMfWX9fqivwg==
X-Received: by 2002:a05:600c:a215:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4a1fdd395bemr65253455e9.30.1792662855163;
        Thu, 22 Oct 2026 02:54:15 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:54:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Fernando Fernandez Mancera
 <fmancera@suse.de>, Mina Almasry <almasrymina@google.com>,
 netdev@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH net-next v2 01/15] net: skbuff: make
 skb_copy_and_csum_bits() report unreadable frags
Message-ID: <20261022105413.348a2585@pumpkin>
In-Reply-To: <717ace2e-18b2-4df5-848d-5757c01ee5de@redhat.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
	<20261021-b4-skbuff-bug-on-followups-v2-1-2aa780a03524@toxicpanda.com>
	<717ace2e-18b2-4df5-848d-5757c01ee5de@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1792662855-D7B5987B-ECF939CD/0/0
X-purgate-type: clean
X-purgate-size: 6462
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 10:21:26 +0200
Paolo Abeni <pabeni@redhat.com> wrote:

> On 10/21/26 15:46, Josef Bacik wrote:
> > skb_copy_and_csum_bits() has no way to fail.  When it reaches
> > unreadable frags it zero-fills the rest of the buffer and returns 0,
> > and since commit ab9414ed70bd ("net: skbuff: don't leave stale bytes in
> > skb_copy_and_csum_bits()") that 0 is the correct checksum for what's in
> > the buffer.  Its callers can't tell the copy didn't happen.
> > 
> > That matters in the !sg && !csum branch of skb_segment().  A devmem TCP
> > skb keeps its whole payload in unreadable frags, so every segment ends
> > up with a payload of zeroes, tcp_gso_segment() writes a valid TCP
> > checksum over it, and the peer accepts the zeroes as stream data.  This
> > is reachable when both SG and TX checksum offload are turned off on a
> > device used for devmem TX: sk_setup_caps() still gives TCP SG and
> > HW_CSUM, so the dmabuf send is accepted, validate_xmit_unreadable_skb()
> > lets the skb through for a NETMEM_TX_NO_DMA device or a matching
> > binding, and software GSO segments it with neither feature.  Before
> > that commit the segments carried uninitialized memory with a checksum
> > that almost never matched.
> > 
> > This was reproduced with a test module rather than on devmem hardware:
> > skb_segment() on a TCPv4 GSO skb with 3000 bytes of payload in a page
> > frag marked unreadable, with features == 0, returns 3 segments whose
> > payloads are all zeroes, each with a checksum of 0, which is correct for
> > zeroes.  There's no warning or error; the data is silently replaced.
> > With this patch skb_segment() returns -EFAULT.
> > 
> > Make skb_copy_and_csum_bits() return 0 or -EFAULT and hand the checksum
> > back through a pointer, and make it __must_check so a new caller can't
> > ignore the failure.  Running out of skb before @len returns -EFAULT
> > too; commit 417261779eab ("net: skbuff: don't BUG() on leftover length
> > in skb_copy_and_csum_bits()") made that a zero-fill and a checksum of 0.
> > Each caller takes the error path it already has for a failed copy:
> > 
> >   - skb_segment() fails the segmentation, as the csum branch already
> >     does when skb_copy_bits() fails.
> >   - icmp_glue_bits() and icmpv6_getfrag() return the error, so the ICMP
> >     error isn't sent.
> >   - __ip_append_data() and __ip6_append_data() drop the new skb and
> >     return -EFAULT, as they do when getfrag fails.
> >   - vnet_skb_shape() fails the same way it does when its skb_copy_bits()
> >     call fails.
> >   - xdr_skb_read_bits() returns 0 without consuming anything, as it does
> >     when skb_copy_bits() fails, so desc.count stays non-zero and
> >     csum_partial_copy_to_xdr() fails.  csum_partial_copy_to_xdr() used
> >     to checksum the bytes it hadn't copied before checking desc.count.
> >     desc.offset and desc.count always add up to skb->len, so that only
> >     ran when it was about to fail anyway, and on an unreadable skb
> >     skb_checksum() would WARN.  Drop it.
> >   - skb_copy_and_csum_dev() can't return an error, so it leaves the
> >     checksum alone and the frame goes out with a bad one.  Its callers
> >     are drivers that never see unreadable skbs anyway.
> > 
> > The zero-fill stays, so a caller that does send the buffer still
> > doesn't leak anything.
> > 
> > This was found by the Sashiko AI review of that commit, and
> > Mina suggested reporting the error from the helper rather than checking
> > for unreadable frags in skb_segment().
> > 
> > Link: https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kernel.org/
> > Suggested-by: Mina Almasry <almasrymina@google.com>
> > Reviewed-by: Mina Almasry <almasrymina@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > ---
> >   drivers/net/ethernet/sun/sunvnet_common.c | 10 +++--
> >   include/linux/skbuff.h                    |  4 +-
> >   net/core/skbuff.c                         | 63 +++++++++++++++++++++----------
> >   net/ipv4/icmp.c                           |  9 +++--
> >   net/ipv4/ip_output.c                      | 11 ++++--
> >   net/ipv6/icmp.c                           |  7 +++-
> >   net/ipv6/ip6_output.c                     | 11 ++++--
> >   net/sunrpc/socklib.c                      |  9 ++---
> >   8 files changed, 83 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/sun/sunvnet_common.c b/drivers/net/ethernet/sun/sunvnet_common.c
> > index 5cca95869052..4f229fcecc32 100644
> > --- a/drivers/net/ethernet/sun/sunvnet_common.c
> > +++ b/drivers/net/ethernet/sun/sunvnet_common.c
> > @@ -1167,9 +1167,13 @@ static inline struct sk_buff *vnet_skb_shape(struct sk_buff *skb, int ncookies)
> >   
> >   			/* copy the rest, with csum calculation */
> >   			*(__sum16 *)(skb->data + offset) = 0;
> > -			csum = skb_copy_and_csum_bits(skb, start,
> > -						      nskb->data + start,
> > -						      skb->len - start);
> > +			if (skb_copy_and_csum_bits(skb, start,
> > +						   nskb->data + start,
> > +						   skb->len - start, &csum)) {  
> 
> Recently Eric did some work to remove return arguments from the fast-path,
> as with some config it gives measurable overhead. See commit
> a02a765bd5c2ae7705144829b2911c96c29db6ba.

And, as soon as you take &csum, not only does the value have to get
re-read from stack, but the compiles has to assume that the address might
have been saved and can be updated by any other function call.
> 
> S/W csum should not be the fastest path, but AFAICS the UDP output path
> could use it when building the aggregate segments.
> 
> I'm wondering using a 64 bit return value and encoding there both the csum
> and the error could make sense.

That gets really horrid especially on 32bit.

That is why I suggested earlier that since csum values 0 and ~0 are
equivalent one of the two values could be used as an error result.
An 'adc loop' won't normally generate zero, but there might be some
code that relies on it - so would need changing before zero could
be used as an error return value.

David

> 
> Also currently net-next is closed for the merge window, and a bunch of
> changes in this series looks more like cleanup than fixes. Cleanup will have
> to wait for the end of the merge window, fixes can land at any time.
> 
> /P
> 


