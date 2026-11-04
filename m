Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0B60A6F7B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=obFoVHzL
Received: from list by lists.xenproject.org with outflank-mailman.1472755.1680578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtj-0002dP-NC; Wed, 04 Nov 2026 20:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472755.1680578; Wed, 04 Nov 2026 20:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtj-0002dG-Ji; Wed, 04 Nov 2026 20:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1472755;
 Wed, 04 Nov 2026 20:47:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhth-0002bn-NG
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:47:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtg-000QZ3-Uy
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:53 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99da-8faa-0a2a0a5109dd-0a2a4504c3a6-32
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:52 +0100
Received: from [209.85.160.179] (helo=mail-qt1-f179.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99f7-b57f-0a2a45040019-d155a0b3f01d-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:52 +0100
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-536717a4d83so9729401cf.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:52 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e7e714b5dsm28532706d6.34.2026.11.04.12.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793825271; x=1794430071; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zhYTiDxjkNZdIoq9TXFfJAb58fxAg2S9aoRAAm7o7cY=;
        b=obFoVHzLhRoO5q+Rco2lsLEsJCrKp3YyHdY+8r72LLpi6OOYkvu7MbchCp/2gL8N3p
         VVzXCsxRYQKSTtedIFne3RczWqsVvUhgZycimXegM9NuUYppvyu8ztv4XwWP/Zy2kZZW
         G5PHFv583N1evAwaDuomQHhdDeW6L/J3ehW5u5O7SxwkelumqjCP4UqrQAtqscAPIg3O
         otll+JK5EgvLUF7Uf6YfVn4Vhwy4McsMCQJZsnFjR6QBo2KsnLCWm5uaReAF7F0jabn2
         eOPi65AYpkirz02ITKjJuNS5O1ijTwL9gqE9F4vS5B3H/YaUYV5C/cjL0H6+FIE1cCQo
         LF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825271; x=1794430071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zhYTiDxjkNZdIoq9TXFfJAb58fxAg2S9aoRAAm7o7cY=;
        b=y4G00p7kk0aoz+tJZdaACXuG+R5V/429vWNPEVtM+/yVDbm9uH0+coGWLsoMWdqtBR
         zR9w5vMeQxhbsx6wHyoOyaa/TEy37gwhXhQcCAU/8TG8QljZE7d0lqY8uZDkm7ItI4qX
         edCmh0ZyjaLrUIHwd6OHTvn8WO7vIHvb79Ax4CfSu+12Sq10Zx8FYY4UGstnmKnrejgE
         T/vziVBdUxAHKx1WnkL6n9cDj/Y1mJ4GrwgxQgANCXLgtHB7WWS8zHXY0xHYSwZdeMY9
         FMHsJ944YM9AdSZTxAkkvX/63oE7DTaoOBbZQrV+3W8Gvd2NZ+R+EX6HXnNq2uRfZKMu
         uUwA==
X-Forwarded-Encrypted: i=1; AKwUvBzcfMKdCVUXy8gnycfFMskcw64of135MQpP+kxtkL5I/+86QQnq6ZZk+fY+q2OdwICK+eIJA6lD7dM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z96YMMfrT6jh22+ut42xjP3+EBW7rwh+vYhkuq1+WJO1y73vZW4
	tfjB+3G4eJSJgF3NfMUT7axtCZjxrFYLCNTfotqBGaE6VIze8xh4L9rfhA8uXDZkk2Q=
X-Gm-Gg: AYBFou0HH6gLPWxoETK0N8N8LrL6L4UxO0mdKO2RovTquIoFkCBxaogc5EuAjz5rm1E
	Q7e6zRY81UGZVpPUGUtdY24fucXG22VcIOoxemqtQgPylJU25btzpGWtDFDLVrnmOqY3pdwSZS6
	Xvxk4RmJMqnb4vd/bkwraAX3TKjHxYTo8WJh+GFYwyzZ8ZkWg2lCWm0DlMd4iYJR6+Yv5EpfEmK
	pjfspESEOhDSSutbAfFpyd5yngag2gQoKQVQQwKCMU6aLYz/TUSDYQDdaCZWmecxmm37GBVf6Kk
	AhJsR+IrvMGNOobfzA4KQbMNtw4QlSdxjINxYp8id570wEq6KIK4EOeTEFERdDmZKtkH9JoDxdl
	I2t+Y34KLL7DYLPNED2OVCLbmwoVeGU8Rqx2jbinJJ0tTgHIHuFBw4UpSFE00hmpiQG7BT83nu8
	sGt+VGXcwlCbnUJbQ+uLYIj2k3jyKF7KsFGOmt2lZY+rRK9jxypHwWWKEL7xCn1cVDEzYGPpCQS
	O5M7KqOrpqA6z2nmcVQWYuZKAmVEclfNgrmPoKEeQKvNnC79fmD01UCNjepCALayTvcH51w1/GK
	45ZZyp7Nsv1yRjbbETZ0sfzT1F4m9QxRYv80c17PD5pyUT8=
X-Received: by 2002:a05:622a:314:b0:533:91bb:b81e with SMTP id d75a77b69052e-542b714241bmr282875581cf.31.1793825270475;
        Wed, 04 Nov 2026 12:47:50 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next v4 00/15] net: skbuff: follow-ups to the BUG_ON()
 removal
Date: Wed, 04 Nov 2026 20:47:12 +0000
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKZ62oC/33OzU6EMBAH8FfZ9Oy4bSmw68n3MB6m7XSpsi2hg
 JgN7y5UE01UjvP1m/+NJeo9JfZwuLGeJp98DGuh7g7MNBguBN6uNZNcVoKLCrSC9KpH50CPF4g
 BXGzb+DZ2CdAKgdbJU4mKrUDXk/Nzxp9YoAECzQN7/pykUb+QGTZ729WYCHSPwTRbq+2OWh1z8
 59v21Hj0xD79xx+EvnNV87zXs5JAAclrCZXcn129eMQZ286DBbvTbzmiJP84Umx68nVk4j1iSM
 vSqn+9IpvT/Bi1ytWr1RoOeqyrsRvb1mWD50R6Ya6AQAA
X-Change-ID: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825268; l=10376;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=tW+L0zf4390cg7J6QlTFchtXt2TlBYwRyjkUWvYsyWU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE/52Pg4UW6eMI++PDgJfN2uDIv4MYHALkyPzsSUzqqtahX6ZQWkFzqJYtvdKLNPhIGnhv8dWOy
 2oZSIna5CkAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1793825272-C12DCB50-A1550C46/0/0
X-purgate-type: clean
X-purgate-size: 10378
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v1: https://lore.kernel.org/all/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com/
v2: https://lore.kernel.org/all/20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com/
v3: https://lore.kernel.org/all/20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com/

v3->v4:
- 1: the !sg && csum branch of skb_segment() returns -EFAULT instead of
  -ENOMEM when skb_copy_bits() fails, like the branch next to it.  The
  new cases in 12 made that stand out.  I kept Mina's Reviewed-by.
- 12: run the nested and short skb cases without SG too (Willem).
- 11: no code change.  The commit message was wrong that the path
  without SG was fine before.  Three of the new cases in 12 hit the NULL
  pointer dereference without SG if the list_skb check in the clone
  branch condition is taken out, because the walk reads list_skb before
  it looks at SG.
- Picked up Mina's Reviewed-by on 1 and Acked-by on 4, Willem's
  Reviewed-by on 11 and 12, and Juergen's Reviewed-by on 13.
- No other changes, same base as v3.
v2->v3:
- 1, 2, 6: move the frag_list recursion into a noinline function, so
  that taking the address of a local there doesn't give the helpers a
  stack protector (Paolo).  On x86_64 defconfig plus CONFIG_IP_SCTP
  none of skb_copy_and_csum_bits(), skb_checksum_full(),
  skb_crc32c_full() or the two wrappers has one now, and
  __ip_append_data(), __ip6_append_data() and skb_segment() are
  unchanged.  The callers that pass a local do gain one.  Besides the
  seven I listed on v2, that's __skb_gro_checksum_complete() and
  skb_checksum_help(), which are converted in this version, and
  skb_crc32c_csum_help().
- 1: put the Fixes: tags back (Fernando, Sashiko).  csump in the
  prototype, and drop the "Both of above in one bottle" comment
  (Fernando).  skb_copy_and_csum_dev() zeroes the whole frame when the
  copy fails, since leaving the checksum alone doesn't guarantee a bad
  one (Sashiko).
- 2, 6: the kernel-doc describes the unreadable check as it is, the
  wrappers don't blame unreadable frags for -EINVAL, and the commit
  messages say what changes for a failing frag_list member (Fernando,
  Sashiko).
- 2: convert skb_checksum_help() too, as 6 does for its crc32c twin, and
  add Fixes: 20ddd0fd2fcd.
- 3: convert __skb_gro_checksum_complete() too (Fernando, Sashiko).
  Take the skb off CHECKSUM_COMPLETE on failure.  Otherwise conntrack,
  which doesn't drop on a bad checksum, leaves the pseudo-header sum in
  skb->csum and TCP's validation accepts the packet after all
  (Sashiko).  Update the comments, and add Fixes: 65249feb6b3d.
- 4: the commit message was wrong that devmem TX reaches this checksum.
  Its skbs carry SKBFL_SHARED_FRAG, so the segment fails to linearize
  first.  The patch is hardening, and the commit message says so now.
- 5: when the tail can't be checksummed but what's left can be read,
  set CHECKSUM_NONE instead of failing the trim, which dropped packets
  that used to be accepted (Sashiko).  Retitled, and add Fixes: tags.
- 7, 8: add the Fixes: tags for the original commits, and correct the
  history in 8's commit message (Sashiko).  8 also says what it takes
  to reach the memcpy().
- 7: reject a negative @len or @hlen on entry.  The reorder left nothing
  ahead of the skb_put(), which panics on one.
- 8: the truesize check refuses the coalesce instead of only warning,
  and runs before the head is stolen.  With len unsigned and nothing
  else, an skb with a len above INT_MAX went from refused to coalesced.
- 9: check data_len > len directly and zero the frame.  The old check
  missed CHECKSUM_PARTIAL (Sashiko).  Retitled.
- 10: drop both len > 0 tests, and correct what the commit message says
  they covered (Sashiko).
- 9, 10: drop the Fixes: tags.  Both problems are older than the commits
  the tags named, and neither has a known trigger.
- 11: Willem, this one changed again after you OK'd the walk up front.
  A nested frag_list is only one way for the walk to run out of members.
  A len that counts bytes the skb doesn't hold gets to the same NULL
  pointer dereference, and the walk up front doesn't catch that.  So the
  patch now checks for a NULL list_skb in the three places where the
  walk moves on to it, and that's all it does: no pass up front, which
  also takes care of the cost you pointed out for BIG TCP, and none of
  v2's skb_has_frag_list() tests.  You asked on v2 whether the first two
  checks were needed.  For a nested frag_list they weren't, for this
  they are.  12 has a case for each, and taking any one of the three
  checks out brings the oops back.  The path without SG is left alone
  again.  The commit message says that IP reassembly does nest
  frag_lists, just not on GSO skbs (Sashiko).  Retitled.
- 12: add four cases for a len that counts bytes the skb doesn't hold.
  Retitled.
- 13: correct what the commit message says about when bounce_skb() runs
  and when skb_copy_bits() fails.
- 14: update the comment above skb_nsg() (Sashiko).
- 15: one more stale comment, in net_test.c.
- Picked up Fernando's Reviewed-by on 4.  Dropped Mina's on 1 and
  Fernando's on 2, since the frag_list loop moved in both, and Willem's
  on 12, since it grew.
- Shortened the commit messages.
- Rebased onto current net-next.
v1->v2:
- skb_segment(): check each frag_list member as the walk takes it,
  instead of an extra pass over the frag_list up front (Willem).
- KUnit test: braces around the suppressed skb_segment() call (Willem),
  and the comment update for the non-uniform case moved into the same
  patch (Mina).
- Picked up Willem's Reviewed-by and Mina's Acked-bys.

--- Original email (v1) ---

Hello,

Jakub applied v2 of my skbuff BUG_ON() series[1] before I got v3 out, so
this is what v3 would have changed, as fixes on top of what landed, plus
the skb_copy_and_csum_bits() patch I'd been sending to net on its own.

Patch 1 is that patch[2], moved to net-next as Mina suggested, with his
Reviewed-by.  It makes skb_copy_and_csum_bits() report failure, and the
rest of the series builds on it.  Please drop the net version.

Patches 2 through 6 deal with skb_checksum() and skb_crc32c().  My v2
had them return 0 when they run out of skb, and that turned out not to
be safe: 0 is a valid checksum, and it can make a packet that was never
fully checksummed pass verification.  So they get versions that report
failure, skb_checksum_full() and skb_crc32c_full(), and the core users
switch to them: checksum validation now rejects a packet it can't
checksum, skb_segment() and pskb_trim_rcsum() fail instead of using a
bad sum, and skb_crc32c_csum_help() drops the packet.  skb_checksum()
and skb_crc32c() stay as wrappers that behave as before, and I'll
convert the rest of their callers per subsystem in later series.

Patches 7 through 10 fix problems Sashiko and an LLM review found in
what was applied.  skb_zerocopy() refuses a zero-length copy that Open
vSwitch can trigger from a user namespace, skb_try_coalesce() and
skb_copy_and_csum_bits() can be handed a negative length, and
skb_headlen() can underflow in skb_copy_and_csum_dev().

Patches 11 and 12 make skb_segment() refuse a nested frag_list, which
could still oops on a NULL list_skb, and add KUnit cases for the layouts
it refuses.  Patches 13 and 14 get rid of the same BUG_ON()s in
xen-netfront's bounce_skb() and tls's __skb_nsg(), and patch 15 updates
comments that still describe the old BUG_ON()s.

I tested this with the net_core KUnit tests, a test module that drives
each of these paths under KASAN and fault injection, an Open vSwitch
reproducer for patch 7, and a stress run over veth with netem.  Thanks,

Josef

[1] https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
[2] https://lore.kernel.org/all/20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com/

---
Changes in v4:
- Link to v3: https://patch.msgid.link/20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com

Changes in v3:
- Link to v2: https://patch.msgid.link/20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com

Changes in v2:
- Link to v1: https://patch.msgid.link/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com

---
Josef Bacik (15):
      net: skbuff: make skb_copy_and_csum_bits() report unreadable frags
      net: skbuff: add skb_checksum_full() that reports failure
      net: skbuff: fail checksum validation when the skb can't be checksummed
      net: skbuff: fail segmentation when a segment can't be checksummed
      net: skbuff: drop hw csum if trim can't checksum tail
      net: skbuff: add skb_crc32c_full() that reports failure
      net: skbuff: let skb_zerocopy() copy a short skb without head_frag
      net: skbuff: make skb_try_coalesce()'s len unsigned
      net: skbuff: reject data_len > len in copy_and_csum_dev
      net: skbuff: reject a negative length in skb_copy_and_csum_bits()
      net: skbuff: don't run off frag_list in skb_segment()
      net: test the skb layouts skb_segment() refuses
      xen-netfront: don't BUG() when skb_copy_bits() fails in bounce_skb()
      net/tls: don't BUG() on leftover length in __skb_nsg()
      net: update comments that still describe the skb BUG_ON()s

 drivers/net/ethernet/sun/sunvnet_common.c |  10 +-
 drivers/net/xen-netfront.c                |   7 +-
 include/linux/skbuff.h                    |  12 +-
 net/core/dev.c                            |  14 +-
 net/core/filter.c                         |   6 +-
 net/core/gro.c                            |  11 +-
 net/core/net_test.c                       | 160 ++++++++++-
 net/core/skbuff.c                         | 451 +++++++++++++++++++++++-------
 net/ipv4/icmp.c                           |   9 +-
 net/ipv4/ip_output.c                      |  11 +-
 net/ipv6/icmp.c                           |   7 +-
 net/ipv6/ip6_output.c                     |  11 +-
 net/sunrpc/socklib.c                      |   9 +-
 net/tls/tls_sw.c                          |   8 +-
 14 files changed, 577 insertions(+), 149 deletions(-)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4


