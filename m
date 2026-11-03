Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3E9606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S0gSkPOw
Received: from list by lists.xenproject.org with outflank-mailman.1469069.1678061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Og-0007eg-9e; Tue, 03 Nov 2026 02:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469069.1678061; Tue, 03 Nov 2026 02:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Og-0007eZ-66; Tue, 03 Nov 2026 02:37:14 +0000
Received: by outflank-mailman (input) for mailman id 1469069;
 Tue, 03 Nov 2026 02:37:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xO4Oe-0007eS-JD
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:37:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Oe-006jz8-05
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:37:12 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6ae948d5-e002-0a2a0a5209dd-0a2a4503bf2a-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:37:11 +0100
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6ae948d7-fae8-0a2a45030019-d155d03290f0-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:37:11 +0100
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa36fc0eso5158a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:37:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793673431; cv=none;
        d=google.com; s=arc-20260327;
        b=i8tsGGlHCax8y+1kSxzZI2ZB/RaScZBExzf0y+ueaCVl8MK/OV1fjKIePjOvVB/bvt
         hb7htmK9CdRcS1dq15IyxGX+CsmtTYaNwZvPLPQtXya+eXUVMXAefJqZz7b635YHthps
         cJHrmou8Y2afP+vOgET8YGvn7rWbiH7W++v6CuBx7Mirvdq4XZjrfwWZeln1ehA1dPIF
         XrEpmrG91/PqjH0k1GouspaodHbo1MAGiupulBzpuTFqO/dt03HLYCXk/T6cTHDqBPDW
         7K9KrsdSl6X7R/mhz8ySoPgLYCPb56goPs3CHIhaHsJ6DRnz91zBLtN/KnO5M6cLZk4v
         vfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqTX7BP0mkUbiNPaPzqmPJM6ISWnYd5yW6X5U8Sw0eo=;
        fh=oEDfn6R5kx8c9P4yhJ6ogrKFv+4IUDwyQ+1pWLnW2ww=;
        b=U/+6u0K2ySW+xalSrFRzywTvXpfM+VXYGo6OyRh/W1Pq7GMtApShIjXzTQfmunc5/R
         2f49z0EmxuF1F0QpsJl3943JDuLH4bgSP4CDWFrgvKQ+k5n6L0u90dm7A7/d/QGcSFWa
         MbMrDTbmmxqvkSR1oOAr/1wVJ23y+Ba2goSbA6/MrKQLSFpIy02/cK2zOzTqIIB9z8BV
         Q+22TaeZI+c0vVngZmtv2by9ysrtIyMt3JNAfqnGM7XMdBU7VxOElstDlNTP+lVMxwXa
         lspYaUj0D34W5aEEofEwzD7Wi+0dF+z6+aoVhid/JII9g/GfQKOq89ptkS5Ta10xwpWb
         ZQQg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793673431; x=1794278231; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqTX7BP0mkUbiNPaPzqmPJM6ISWnYd5yW6X5U8Sw0eo=;
        b=S0gSkPOwfgKIohGJj0xe5kgxAABrAkDgPR2jE0Au+/ktZ7yHUqdFSI0odqxvo4/TLY
         WSaToMOhy7ydYW5pXoleZtYL3s8fxhPaIV3H3FHoq7PkfpzF6d7FJh6rLZN0bEmXP4fl
         AqIgTKse3W3c1j1UjhXiq5d18jT+3ARFoM4+ljOaUqidBaLNH6OHHriVBEZ1A7hky5K3
         qWMrHd6vGEPphDV9UXKpH5HVFKh4JeUOYpG1oD1H6+MFPQ1TQtJz3Cht7zEw45caFwyo
         5trSQC7OsCU8eS9BzL9iRsIaaePs6Hp6vQfvlN1jIMwtUTS/fWAI/ha3qSOEuOy1UxPj
         urtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673431; x=1794278231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqTX7BP0mkUbiNPaPzqmPJM6ISWnYd5yW6X5U8Sw0eo=;
        b=UxvDMupwV5UkYcOpPDL5U2SZ3Lcv9a3s+ulzqy7IiLg3+kih7o6UbvLx/KO5Fam3yG
         gHKjMBWt8ep824wnrakdMGH9tcu8/SA5YSzXa4pOLwbtaI9U/DUW2T5JZrbFcTILYs7K
         Z3fbNau3dpwZ7b874Wjc09an1yyBbpqVg/9beKMBf+5rEki9lV7RshKy24esKBooE4DZ
         i0dyLfSXGwFkpd234MI2SQmQBg2mmKEJXub9bt/cReBqhAZeLe12Inn9/hUCFNJwnXVW
         oBGQEWQ8Irk0Ia55p2bT7TPrX0xF8D8flyRwOxRzzA5tLEgdDU+p4XNyhNSIUHDY8oGo
         zPyg==
X-Forwarded-Encrypted: i=1; AKwUvBzI06KRfKCtv88DECVFOFiKaZDizx9Bf/8b2f7bTGKNSV6q3ob3rGQ6W0hQJ2YRZIJddgHmpUk8HPM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9nTGcJh5UYiREqwGmDyEK6Vm38gBW+JtdaRsZQfzcu9PlUYCTD
	0x1ABKxOZLD4MBJC2S2BF3ConjdPjd6+Wui0ePnJun3gphjMAuiTXIp02TdS90aBfpbWPnuOv3/
	usKwYzWTtBx1SVz/sMpgsXM/Z3/pU9AUADILPacxWtKnt0uTld7ADypiP
X-Gm-Gg: AYBFou0fykhoyjbAmeHH0d+XF/GRShgiUHO9CbgaAfoWl2F+JI/As+sqLwdhFJjFYbJ
	kbx9rFABy+burekl6gPcAw2h29OMs0sYTkEHS0RNhql/AROjNMcY3Rlra1hCqY5UKpXwFlMM1EZ
	JYE6LAPlE/9ovgeAUmocPRoYhozAt/qx1anUEBInb7S0brCqJ3MxV6G15sNflbNKshdXw/qUYzc
	6hfV/8YLwM/3lhFqnivcF8lTw2BcxhlQdZ7xrGdOOjDn5TGGtvIc+aZbXB2Vpnn4rxMmMzVN4qr
	hoUTkLCK00VZPi6oK1YjVmtOjUAuJ1eJDhvLv9XLhzUL6MTvDHEN4thmGHFR0laU1ffYFPdYzwz
	vp8uQIE4JM6Gs+ppiXTya4y5PfybGqar0HdWHETE=
X-Received: by 2002:a05:6402:15d4:b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b539cf5521mr25672a12.4.1793673431151; Mon, 02 Nov 2026
 18:37:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-4-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-4-54ad0ab57614@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:36:59 -0800
X-Gm-Features: AclHuK_KyosV2S6Hhot3QjeUrSUtUS3-59PgfB2gDmKhS-ed2_dJAQ5EnLrTGm8
Message-ID: <CAHS8izMxdrp-J8yo1B5CPBwPcy8np8+uz8qBxO2GSi0+9eRQLA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1793673431-6F6C64E9-C74E706B/0/0
X-purgate-type: clean
X-purgate-size: 1118
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 6:28=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> When the device can't checksum the protocol, skb_segment() checksums
> each segment with skb_checksum().  If the segment has unreadable frags,
> or its lengths don't add up, skb_checksum() returns 0 and the segment
> goes out with a checksum that doesn't cover its payload.
>
> Devmem TCP doesn't get that far today.  Its skbs take SKBFL_SHARED_FRAG
> from the zerocopy uarg, so skb_segment() tries to linearize the segment
> first, and that fails with -ENOMEM for unreadable frags.  No other path
> is known to bring an unreadable segment here either.
>
> Use skb_checksum_full() and fail the segmentation with -EFAULT, so that
> the checksum doesn't depend on that flag.
>
> Found by the Sashiko AI review of an earlier fix for the same path with
> SG off.
>
> Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable=
-v1-1-7e2334a55fe8@toxicpanda.com/
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina

