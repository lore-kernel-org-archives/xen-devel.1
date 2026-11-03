Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E14606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MCVqTXTI
Received: from list by lists.xenproject.org with outflank-mailman.1469105.1678078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4j8-0005En-1m; Tue, 03 Nov 2026 02:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469105.1678078; Tue, 03 Nov 2026 02:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4j7-0005Ef-VC; Tue, 03 Nov 2026 02:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1469105;
 Tue, 03 Nov 2026 02:58:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3yU3pagsKCWgGRSGYXeSOTGMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@flex--almasrymina.bounces.google.com>)
 id 1xO4j7-0005EW-3o
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:58:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4j6-00BS4C-A2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:58:20 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3yU3pagsKCWgGRSGYXeSOTGMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@flex--almasrymina.bounces.google.com>)
 id 6ae94db5-8faa-0a2a0a5109dd-0a2a450ad820-12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:58:20 +0100
Received: from [74.125.82.200] (helo=mail-dy1-f200.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3yU3pagsKCWgGRSGYXeSOTGMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@flex--almasrymina.bounces.google.com>)
 id 6ae94dca-f2d2-0a2a450a0019-4a7d52c8ad4b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:58:19 +0100
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3552883bd19so74237eec.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:58:19 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Date:Message-ID:References:Mime-Version:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793674698; x=1794279498; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBOBTMCBvbOa1Vdc4dwzLv3tXtzlfQzqk36T1YAPAwE=;
        b=MCVqTXTIstce+T2FjTHaMCGyn8tQ14ckjlz65p7Nj1Tk3FZWg87Olgtb/98IOYYdNj
         1XNci6cb1BzOw4irrun+ZrbgYYGQmfxhHpU2zrzTbNpd5pvk4VB+pOsg9VokcRtOdRL+
         JgXewSrsFu/2Cg5I6tGGYCorvIEqkixUMSGx1lLshaNqqVFNxX70oDcosK7M5XCAgTv2
         jPgfPtR7FR3MG2uYTqPonCLj2KVVx5tRT4YkQ5NuBlxAYQ73UrgfkVKkAHpthV61SFBm
         6EaKDfrcgY/HOFxIQfERAmjm/3M++6P45tP7EDU7u3hl7zCkXoc5Cb3M3HEQmtrATTVH
         5HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674698; x=1794279498;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBOBTMCBvbOa1Vdc4dwzLv3tXtzlfQzqk36T1YAPAwE=;
        b=pQ/CYaZl0QCn6gAm0vnGnKep3pppjzmg6/lexOUIuiNMBzDpU+Wk1XRPngTaM1pVjD
         uR3Lced1Z/zerL5xmaEt2frDnRBEvQ5RGn/KhF8LCCsZpqfdeaIFi58Ahj4HAZygxqAA
         2yFKhdNPGDXDCEzlMiW39X7M/1dem+7BbxZCu9T1pePvYssMJ1uDKYCNs5GcHc//QN3y
         piJrc0qZnFjY4JFzLI0+VFoyHtXfM1+uzDqswZlSoGRwaxdvNFUbmjRf/wLk1a6L020o
         leHfte8hAgz9FebWmSOg8d+BCccBXMXHcxfmng0eNYg2WkJfuSc41FmOnPmQdU84nkaE
         tmEw==
X-Forwarded-Encrypted: i=1; AKwUvBzdTf+W9JAzerWwezP+Ry5ydv8is/homalv1oIbyzQSx+HfxmgDDPFIx871Eek32ag6ECrmo/bvSlw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8XHoNOoJn3AxuQ7MVdOMi9mXBjTyMueyiSqfTOlyjVIFzPuMYq
	/KN6wgtdXnLTT/yGq6bFisOszjP8M8xiBUNpzkB7n2I6+sRuaogKLU0n72qYXnoU95KfnzEeUFZ
	7QDZIlQguPf1vzWLdnhFOnLa79g==
X-Received: from dyaz28-n2.prod.google.com ([2002:a05:693c:639c:20b0:351:16da:ebbc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr21653405eec.27.1793674697439;
 Mon, 02 Nov 2026 18:58:17 -0800 (PST)
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-1-54ad0ab57614@toxicpanda.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-1-54ad0ab57614@toxicpanda.com>
Message-ID: <18e469a24f30b4cf.3137322e32382e36372e3935.167b2f.0000sendgmr@google.com>
Date: Tue, 03 Nov 2026 02:58:17 +0000
Subject: Re: [PATCH net-next v3 01/15] net: skbuff: make skb_copy_and_csum_bits()
 report unreadable frags
From: Mina Almasry <almasrymina@google.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Mina Almasry <almasrymina@google.com>, 
	David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1793674700-52ADCCFC-218C327B/0/0
X-purgate-type: clean
X-purgate-size: 1950
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 6:28 PM Josef Bacik <josef@toxicpanda.com> wrote:
>
> skb_copy_and_csum_bits() has no way to fail.  When it reaches unreadable
> frags, or runs out of skb before @len, it zero-fills the rest of the
> buffer and returns 0.  Its callers can't tell that the copy didn't
> happen.
>
> In the !sg && !csum branch of skb_segment() that turns a devmem TCP
> payload into zeroes under a valid TCP checksum, and the peer accepts
> them as stream data.  It takes a device with both SG and TX checksum
> offload turned off.  A test module that segments an skb with 3000 bytes
> in an unreadable frag gets 3 all-zero segments before this patch and
> -EFAULT after it.
>
> Return 0 or -EFAULT, hand the checksum back through a pointer, and mark
> the function __must_check.  Every caller takes the error path it already
> has for a failed copy.  skb_copy_and_csum_dev() can't return an error,
> so it zeroes the whole frame.  csum_partial_copy_to_xdr() no longer
> checksums the bytes it didn't copy.  That only ran when the function was
> about to fail anyway, and skb_checksum() warns on an unreadable skb.
>
> The frag_list loop takes the address of a local, so it moves into a
> noinline function to keep a stack protector out of
> skb_copy_and_csum_bits().
>
> Found by the Sashiko AI review of commit ab9414ed70bd ("net: skbuff:
> don't leave stale bytes in skb_copy_and_csum_bits()").
>
> Fixes: ab9414ed70bd ("net: skbuff: don't leave stale bytes in skb_copy_and_csum_bits()")
> Fixes: 417261779eab ("net: skbuff: don't BUG() on leftover length in skb_copy_and_csum_bits()")
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Link: https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kernel.org/
> Suggested-by: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

