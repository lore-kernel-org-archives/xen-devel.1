Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2AF606A337
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 03:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JhL1IVNb
Received: from list by lists.xenproject.org with outflank-mailman.1469116.1678086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4nN-0007K1-KF; Tue, 03 Nov 2026 03:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469116.1678086; Tue, 03 Nov 2026 03:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4nN-0007Ju-HE; Tue, 03 Nov 2026 03:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1469116;
 Tue, 03 Nov 2026 03:02:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xO4nM-0007Jo-BM
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:02:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4nL-00CbVl-OT
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 04:02:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6ae94ed3-e002-0a2a0a5209dd-0a2a4504c4ec-0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:02:43 +0100
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6ae94ed3-b57f-0a2a45040019-d155d031908f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:02:43 +0100
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa36fc0eso5315a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 19:02:43 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793674963; cv=none;
        d=google.com; s=arc-20260327;
        b=KllrkZaCD6dS0wCiVXNf9BLIrLRfbie6EEc/HaM0lXFbQKv8STEAf4C3SCzb8PTpmm
         xW+Z8neLGDpcPxyyu5tgNHWt9fdvKd0n5APDabjTwa0DOxTruv+Fqulpr/jFvp5axquo
         wvbJ5SZIWdWuIcE+ZkacBhTxN1LMm4DRbcT5XgsPzENjDwmWCLWXfHQXUFibKUxhIyqj
         a/OtYKPsVI/Ym4GXrsPCF9Qa7nvIYFDM7jLnl+54BJa8jwbJpcKuy3GlyYz7Y4TCitCL
         dPhhya1Yor3f5r1GgeTSltAuVNBEiBMeGiaUcDutOWpmcx7nOWcElVP5NcUzBen8+c18
         XXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z4d6XmbWcRWWI3RSqbOW04ft/6sO/Q2LzJ8s4Oj4NUY=;
        fh=UsUtQrVOHejCvNDYkWqn2HLKwbEJpD8+BZdHl1x+3BQ=;
        b=szyOwPG0pnkmtjwIBr8pMpgdmqoUfsQ6SNpoSiEDhmhaHcJoGPumrslLuRrFRWluBp
         fu0NHFxLlz24eYQzUtHWnfhDt+fvimkuu0uI3UW49z/1LP+RPBTo4omS5hOAVY/GTxPV
         2v3/6/E+Gyl3wV2Uhph46VZ4R0lVYkyMGgtRBgVv36m1fHL4ogGNmmAMORRJa3dd8Tws
         0FooY3jqsrpB1lvjbE65K8x72h0EZxXRkYRaEuN1mVVmkui7H14vJGsTo96k1Kf3Xl7K
         UgMKeoWVya1lN9ujsygjecOpsOAz0XWI0iQviZxQb27+euZC3GrNlWMuwQtnn4pCRbsy
         nxsQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793674963; x=1794279763; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z4d6XmbWcRWWI3RSqbOW04ft/6sO/Q2LzJ8s4Oj4NUY=;
        b=JhL1IVNb6mQRptwe+vr6TWGOtZ518ZvbjJpnc2eHC1L2ypVz5pL6K+7jzADJyQ4bbm
         NVP8vdSb/T9Z84GkzD19xmZiSjMo8cgopFFcwbEgSBbqS3utyySCNyAouI1od6KihsXg
         h6TopA+FgWUvxq5XVbAI6NdaqyFvn5OHH4JaTV22iGvueSK2+haAVZXb/xGMKmKEUJna
         L3oalYJLdK5X25c00QbbGxAxircy54NRvrNyJqejKfyCxV6S6rvhNzSy7Z/fBLGDZ0iX
         BLa66eQ4M/ctlUxtGQr5D+31pTkjx6p2coQ3qJd2J4FKXeTlunxRYBnt/XGVBmE8nkm+
         NgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674963; x=1794279763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4d6XmbWcRWWI3RSqbOW04ft/6sO/Q2LzJ8s4Oj4NUY=;
        b=eLJL4VWkvPXoplnFDaVlDOREhQsA0rN7BJmF8ysWXO0kKofdJZ7vNpdEHaf5WV3kxt
         CRKPwNPp8SbAJfrAfqOM3s/5Q/nGoIe3AsB9JmrU2Q6+pj4y3hGNVKXDeHgtttr+h8ck
         NrNHI7W4jqnsd6QxEKA3VAo6/xT9A32imeIAQX+MO8/i96u2qq9GdGq3IYu32w3MZvF3
         UBd7X+nxqoOHD5u5RrH7dhasKoelUXjNZILF2ry0wl+nftNymluuMg8V3IiwmZ7zn7qC
         8XLysJN2euswjTjG1bcpm/TlVwDNsL4t37eBzeqMeafpyTkW26eCUB5JHYMuMR4e2bxS
         Rblg==
X-Forwarded-Encrypted: i=1; AKwUvBxBuTIk4fdAZAlPBY0YObNZImd3ciBXXoIfFyXgFKPTax/aWZGP0NEsptbp6DybjkDxmhJdUb96K34=@lists.xenproject.org
X-Gm-Message-State: APuU4Z91UDRCDRdK7zzUS64Yte2MLat1Wq3hv5wsy5J4uu3SgAlbEi8X
	pfFZyM010P93DY7XY8HefCmsMSwFCVDlpkxGjBA58SQ3HD0L34/HSl3kJuiQbp4kpMxXqk1/MNo
	8W+goXvsODfQFqm0qeN5lR6ePyn+hWBQmWGaDmO7S
X-Gm-Gg: AYBFou0e3LLWrbPzxbkZp41dvW/CW3qw132vpdafMnkVqjLKmcCUGxz2RVg/YvHmuqE
	sfcLhz4bQedyAKhq0FFyip8OsNbyAs869Xa9PkzR+brMmVmv4H+RVfTTtU8E2GyFaN0q+AnPXvi
	KYfwIGvQxxmIuJ4c+dOYx3Ikrszj1/OdCjdutb5fLz+IGxQ5vg4q3XVcHN9c0/VxeqFqbla+uRT
	AakSZIX0PO/SvEGFXjiVH0B+rAzXZT9XivgFurcxr/RMGvyg20+6iTua8x/M/zzKUWssnF1ODyW
	PVwogs0gN0L11sInuZ3t5KB2TiMVxxxvEYsW4sNpKbmaXTstkwPl4RdseEyk/8E7XUyOZnltZBT
	Gb9kxcEaSUMs+jqZkkU6lg0CuK2OVwu0QTk1Mql8=
X-Received: by 2002:a05:6402:a0c7:b0:6b4:9221:8932 with SMTP id
 4fb4d7f45d1cf-6b53e97900bmr26656a12.10.1793674962548; Mon, 02 Nov 2026
 19:02:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 19:02:30 -0800
X-Gm-Features: AclHuK9j_VamVmfLtRp6iU-ICWXr3S3wDrU7Ligs7Ww-1otOL5tUZpvUdpJQlZo
Message-ID: <CAHS8izN6+eDztiidOMykUq5A=-7kzsbA+h6rEkkqb1VriPaCGw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 00/15] net: skbuff: follow-ups to the BUG_ON() removal
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1793674963-50EDEB50-E383CF52/0/0
X-purgate-type: clean
X-purgate-size: 10369
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 6:28=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> v1: https://lore.kernel.org/all/20261019-b4-skbuff-bug-on-followups-v1-0-=
41dbef50b9f7@toxicpanda.com/
> v2: https://lore.kernel.org/all/20261021-b4-skbuff-bug-on-followups-v2-0-=
2aa780a03524@toxicpanda.com/
>
> v2->v3:
> - 1, 2, 6: move the frag_list recursion into a noinline function, so
>   that taking the address of a local there doesn't give the helpers a
>   stack protector (Paolo).  On x86_64 defconfig plus CONFIG_IP_SCTP
>   none of skb_copy_and_csum_bits(), skb_checksum_full(),
>   skb_crc32c_full() or the two wrappers has one now, and
>   __ip_append_data(), __ip6_append_data() and skb_segment() are
>   unchanged.  The callers that pass a local do gain one.  Besides the
>   seven I listed on v2, that's __skb_gro_checksum_complete() and
>   skb_checksum_help(), which are converted in this version, and
>   skb_crc32c_csum_help().
> - 1: put the Fixes: tags back (Fernando, Sashiko).  csump in the
>   prototype, and drop the "Both of above in one bottle" comment
>   (Fernando).  skb_copy_and_csum_dev() zeroes the whole frame when the
>   copy fails, since leaving the checksum alone doesn't guarantee a bad
>   one (Sashiko).
> - 2, 6: the kernel-doc describes the unreadable check as it is, the
>   wrappers don't blame unreadable frags for -EINVAL, and the commit
>   messages say what changes for a failing frag_list member (Fernando,
>   Sashiko).
> - 2: convert skb_checksum_help() too, as 6 does for its crc32c twin, and
>   add Fixes: 20ddd0fd2fcd.
> - 3: convert __skb_gro_checksum_complete() too (Fernando, Sashiko).
>   Take the skb off CHECKSUM_COMPLETE on failure.  Otherwise conntrack,
>   which doesn't drop on a bad checksum, leaves the pseudo-header sum in
>   skb->csum and TCP's validation accepts the packet after all
>   (Sashiko).  Update the comments, and add Fixes: 65249feb6b3d.
> - 4: the commit message was wrong that devmem TX reaches this checksum.
>   Its skbs carry SKBFL_SHARED_FRAG, so the segment fails to linearize
>   first.  The patch is hardening, and the commit message says so now.
> - 5: when the tail can't be checksummed but what's left can be read,
>   set CHECKSUM_NONE instead of failing the trim, which dropped packets
>   that used to be accepted (Sashiko).  Retitled, and add Fixes: tags.
> - 7, 8: add the Fixes: tags for the original commits, and correct the
>   history in 8's commit message (Sashiko).  8 also says what it takes
>   to reach the memcpy().
> - 7: reject a negative @len or @hlen on entry.  The reorder left nothing
>   ahead of the skb_put(), which panics on one.
> - 8: the truesize check refuses the coalesce instead of only warning,
>   and runs before the head is stolen.  With len unsigned and nothing
>   else, an skb with a len above INT_MAX went from refused to coalesced.
> - 9: check data_len > len directly and zero the frame.  The old check
>   missed CHECKSUM_PARTIAL (Sashiko).  Retitled.
> - 10: drop both len > 0 tests, and correct what the commit message says
>   they covered (Sashiko).
> - 9, 10: drop the Fixes: tags.  Both problems are older than the commits
>   the tags named, and neither has a known trigger.
> - 11: Willem, this one changed again after you OK'd the walk up front.
>   A nested frag_list is only one way for the walk to run out of members.
>   A len that counts bytes the skb doesn't hold gets to the same NULL
>   pointer dereference, and the walk up front doesn't catch that.  So the
>   patch now checks for a NULL list_skb in the three places where the
>   walk moves on to it, and that's all it does: no pass up front, which
>   also takes care of the cost you pointed out for BIG TCP, and none of
>   v2's skb_has_frag_list() tests.  You asked on v2 whether the first two
>   checks were needed.  For a nested frag_list they weren't, for this
>   they are.  12 has a case for each, and taking any one of the three
>   checks out brings the oops back.  The path without SG is left alone
>   again.  The commit message says that IP reassembly does nest
>   frag_lists, just not on GSO skbs (Sashiko).  Retitled.
> - 12: add four cases for a len that counts bytes the skb doesn't hold.
>   Retitled.
> - 13: correct what the commit message says about when bounce_skb() runs
>   and when skb_copy_bits() fails.
> - 14: update the comment above skb_nsg() (Sashiko).
> - 15: one more stale comment, in net_test.c.
> - Picked up Fernando's Reviewed-by on 4.  Dropped Mina's on 1 and
>   Fernando's on 2, since the frag_list loop moved in both, and Willem's
>   on 12, since it grew.
> - Shortened the commit messages.
> - Rebased onto current net-next.
> v1->v2:
> - skb_segment(): check each frag_list member as the walk takes it,
>   instead of an extra pass over the frag_list up front (Willem).
> - KUnit test: braces around the suppressed skb_segment() call (Willem),
>   and the comment update for the non-uniform case moved into the same
>   patch (Mina).
> - Picked up Willem's Reviewed-by and Mina's Acked-bys.
>
> --- Original email (v1) ---
>
> Hello,
>
> Jakub applied v2 of my skbuff BUG_ON() series[1] before I got v3 out, so
> this is what v3 would have changed, as fixes on top of what landed, plus
> the skb_copy_and_csum_bits() patch I'd been sending to net on its own.
>
> Patch 1 is that patch[2], moved to net-next as Mina suggested, with his
> Reviewed-by.  It makes skb_copy_and_csum_bits() report failure, and the
> rest of the series builds on it.  Please drop the net version.
>
> Patches 2 through 6 deal with skb_checksum() and skb_crc32c().  My v2
> had them return 0 when they run out of skb, and that turned out not to
> be safe: 0 is a valid checksum, and it can make a packet that was never
> fully checksummed pass verification.  So they get versions that report
> failure, skb_checksum_full() and skb_crc32c_full(), and the core users
> switch to them: checksum validation now rejects a packet it can't
> checksum, skb_segment() and pskb_trim_rcsum() fail instead of using a
> bad sum, and skb_crc32c_csum_help() drops the packet.  skb_checksum()
> and skb_crc32c() stay as wrappers that behave as before, and I'll
> convert the rest of their callers per subsystem in later series.
>
> Patches 7 through 10 fix problems Sashiko and an LLM review found in
> what was applied.  skb_zerocopy() refuses a zero-length copy that Open
> vSwitch can trigger from a user namespace, skb_try_coalesce() and
> skb_copy_and_csum_bits() can be handed a negative length, and
> skb_headlen() can underflow in skb_copy_and_csum_dev().
>
> Patches 11 and 12 make skb_segment() refuse a nested frag_list, which
> could still oops on a NULL list_skb, and add KUnit cases for the layouts
> it refuses.  Patches 13 and 14 get rid of the same BUG_ON()s in
> xen-netfront's bounce_skb() and tls's __skb_nsg(), and patch 15 updates
> comments that still describe the old BUG_ON()s.
>
> I tested this with the net_core KUnit tests, a test module that drives
> each of these paths under KASAN and fault injection, an Open vSwitch
> reproducer for patch 7, and a stress run over veth with netem.  Thanks,
>
> Josef
>
> [1] https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f73289=
5b@toxicpanda.com/
> [2] https://lore.kernel.org/all/20261013-b4-skb-segment-nosg-unreadable-v=
2-1-6c28d8ffa51e@toxicpanda.com/
>
> ---
> Changes in v3:
> - Link to v2: https://patch.msgid.link/20261021-b4-skbuff-bug-on-followup=
s-v2-0-2aa780a03524@toxicpanda.com
>
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20261019-b4-skbuff-bug-on-followup=
s-v1-0-41dbef50b9f7@toxicpanda.com
>
> ---
> Josef Bacik (15):
>       net: skbuff: make skb_copy_and_csum_bits() report unreadable frags
>       net: skbuff: add skb_checksum_full() that reports failure
>       net: skbuff: fail checksum validation when the skb can't be checksu=
mmed
>       net: skbuff: fail segmentation when a segment can't be checksummed
>       net: skbuff: drop hw csum if trim can't checksum tail
>       net: skbuff: add skb_crc32c_full() that reports failure
>       net: skbuff: let skb_zerocopy() copy a short skb without head_frag
>       net: skbuff: make skb_try_coalesce()'s len unsigned
>       net: skbuff: reject data_len > len in copy_and_csum_dev
>       net: skbuff: reject a negative length in skb_copy_and_csum_bits()
>       net: skbuff: don't run off frag_list in skb_segment()
>       net: test the skb layouts skb_segment() refuses
>       xen-netfront: don't BUG() when skb_copy_bits() fails in bounce_skb(=
)
>       net/tls: don't BUG() on leftover length in __skb_nsg()
>       net: update comments that still describe the skb BUG_ON()s
>
>  drivers/net/ethernet/sun/sunvnet_common.c |  10 +-
>  drivers/net/xen-netfront.c                |   7 +-
>  include/linux/skbuff.h                    |  12 +-
>  net/core/dev.c                            |  14 +-
>  net/core/filter.c                         |   6 +-
>  net/core/gro.c                            |  11 +-
>  net/core/net_test.c                       | 100 ++++++-
>  net/core/skbuff.c                         | 447 +++++++++++++++++++++++-=
------
>  net/ipv4/icmp.c                           |   9 +-
>  net/ipv4/ip_output.c                      |  11 +-
>  net/ipv6/icmp.c                           |   7 +-
>  net/ipv6/ip6_output.c                     |  11 +-
>  net/sunrpc/socklib.c                      |   9 +-
>  net/tls/tls_sw.c                          |   8 +-
>  14 files changed, 515 insertions(+), 147 deletions(-)
> ---
> base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
> change-id: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4
>

Honestly there is nothing super objectionable about the series, but it
seems a bunch of unrelated fixes, capped at 15 because netdev doesn't
let you have more than 15 patches out at once. I wish you broke it up
into less ambitious problems that the human reviewers can follow. But
maybe that's just me.

Like crc checksum failing in 1 series we can follow, and maybe 1
series for a full failable skb_checksum changes in 1 go so we don't
add the new thing before removing the old? Or is that too infeasible?

--=20
Thanks,
Mina

