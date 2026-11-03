Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A03606A33B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=BIvEBym/
Received: from list by lists.xenproject.org with outflank-mailman.1468929.1677916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4GX-0006i2-S6; Tue, 03 Nov 2026 02:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468929.1677916; Tue, 03 Nov 2026 02:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4GX-0006hv-PI; Tue, 03 Nov 2026 02:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1468929;
 Tue, 03 Nov 2026 02:28:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4GW-0006he-Dp
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4GV-009OZN-Av
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:47 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946df-bab6-0a2a0a5309dd-0a2a4502d736-0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:47 +0100
Received: from [209.85.219.43] (helo=mail-qv1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946de-6ca4-0a2a45020019-d155db2bdd40-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:46 +0100
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-91b54d1e9cdso31352376d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:46 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7f25fc2sm106442246d6.10.2026.11.02.18.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:44 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672925; x=1794277725; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8yOxX1Bu6LKoUVi2ACTRn7d/0rP5glxXkcPct02PZno=;
        b=BIvEBym/BWkuCFkfDv0O5j8ddzqx1vi0Z6mWCKOw3GgaPWiUnL4ZWqHV56Zz1hfkwr
         G3FBlN74ckVTJ72LvpqZZ7jOfxwQ8/3fUQJwc7wONMZYpQOuhMmOafV7Y9OJRNWl5YaN
         H2FMtwhYK/0qPN4cS3dCtpfjlrz8ICQVv6vUQq5tItrQVw97J5fspnQAQkG16V1v+ReF
         5G7Wugzdft8wiFh/mkcaAPMwWdaHgTbdcklpXYOfoK86EaeL/yr4Qp55w7tdybAdJm8+
         ikakwgVj2A6YTs7W8J7TlTA08bymp+4lt0TmQGlJcTS25ZM7JkAJm3aeujb6TcpXoAZY
         UpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672925; x=1794277725;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8yOxX1Bu6LKoUVi2ACTRn7d/0rP5glxXkcPct02PZno=;
        b=qorQkIE1gkKbld6188k1S+7iRGVqQmJj5K9tc6gACklm7WG1vqnyXI5VYYdKNMBQwR
         THwI8LXMXvcU0oRs7Qx+rL3M0Uy9FGUomS3BF1jfrDFYpmiHh4cGH3Qp4+u392jZWdkM
         /d9+oS7j9f4RXEjva9GHhmIvayHK+2YAs0U9qhFR7pHnW6xA1ViCxBh3qNt8YlSrw5dL
         Fa33Mw9PywHdvA1ZIz/PLH7YLz3vNt+7GQRXlh+gJ08RV/EXJyU0ckk9mBDPRIuvk0yn
         uRXPSW26FYc1+f1OTdSVriNfE+DxB4OT0Opa2K9QCyLdS32SH07FgERzMqrvHFZVcT0q
         xJkA==
X-Forwarded-Encrypted: i=1; AKwUvByKtBQJxQLB76+UOCpgV4CejNI0ihJMujAjX7VCdkRwtJ16/97ce3Hk/LY+6DMCBTVjBxYSAg9WnNw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8tNMflG8DgIm75w+Vk4pYXX1aMGmrNSw7DmB9asW2nbeGW+rUY
	rwfp6kQP/WunMflKysYrOQyFscW+0a3vurtgErddSeA+KHHLkh1+cRZXEaGURZFS9Iw=
X-Gm-Gg: AYBFou2aUXa/AYNg28baLPXeSDK8kov8LvlyDGX7xqarRTqYoQ0lYBShRw0AFOkL1AH
	fAeExC9SwFNKUcDi8TFqNN3i3PoSk9VuUJZ4bJUNxkuk33uutnGO+5p11VJhy0IuYJ7WJaqNjCZ
	R+2amQJbzZHPaiEB/RdICTIMvhFEJTef6rdI7r/N5l5o8GAPciL6NWGAx7tBbtwHCENcQbkXtpo
	yKrnfMG7tv6YXlG5BfIaijLjls/UYTFCZjA67M+5Vbiuj7ULQE+jXWy3ouH4SahijaJkMVmd+2m
	7A88A0hBJvl8/ZEvMLBUc+7M2pZqBh2HpJM7FR/n2cr3nr7FFb/12eDxfCjAcd1gV5G/tqRxqfm
	GNry+wzwc+zFNfzXNJ2ZJ1OqgyZrVBmwaj+5wLbY7hDj6SZJj0JhVVZEoAFFb4dHKpAleO83hd1
	ndYETby+8NOc457eLPcg7F4fY+3Ihgp7HF6z3fuXD3H2qIaePTjb2Ur2vwlZVvBmgcEwayl2p/v
	eVE/WDn484lTsQgb4+dGPDfTKgKVbZGpCdohkqkTJWSRpQYXLtSFuZYJj+ryK03KLQa+Mvn7iIP
	XBZ9J/4Ah5Y0RJbQMh+76KS5DN/SDmF/sBCAJ9q54swdNg==
X-Received: by 2002:ad4:5947:0:b0:91c:6c27:d5ca with SMTP id 6a1803df08f44-91ca4b6f243mr194042456d6.41.1793672925486;
        Mon, 02 Nov 2026 18:28:45 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next v3 00/15] net: skbuff: follow-ups to the BUG_ON()
 removal
Date: Tue, 03 Nov 2026 02:28:26 +0000
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxG6WoC/32Oy27DIBBFfyVi3WmA4Dy66n9EWQwwxLQOWIBdV
 5H/vTbtolLVLO+dmTPnzjIlT5m9bO4s0eizj2EJu6cNMy2GK4G3S2aSy73gYg9aQX7Xg3Oghyv
 EAC52XfwY+gxohUDr5LFBxRZAn8j5qcLPLFCBQFNhl+9JHvQbmbKy112NmUAnDKZdq67farWt5
 T/f1qPW5xLTZ5UfRX3z43l65DkK4KCE1eQark/u8Fri5E2PweKzibeqOMpfPCke8uTCk4iHI0e
 +a6T6w5vn+QtFRR05agEAAA==
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
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=9386;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=pSmkEfDauPbypTaoTh/3HpP3thH7q3OtOV4bGWRVhNs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDmMjtaHEFHTxNdI89Gi/a3RQRw+y5eNRW1DqtPDRlxYARtKzR1FB7fqVxkZgLKsdATt6GfX6w7
 vU/lKccmCcwU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1793672927-315CD2AC-B60B08E3/0/0
X-purgate-type: clean
X-purgate-size: 9388
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v1: https://lore.kernel.org/all/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com/
v2: https://lore.kernel.org/all/20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com/

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
 net/core/net_test.c                       | 100 ++++++-
 net/core/skbuff.c                         | 447 +++++++++++++++++++++++-------
 net/ipv4/icmp.c                           |   9 +-
 net/ipv4/ip_output.c                      |  11 +-
 net/ipv6/icmp.c                           |   7 +-
 net/ipv6/ip6_output.c                     |  11 +-
 net/sunrpc/socklib.c                      |   9 +-
 net/tls/tls_sw.c                          |   8 +-
 14 files changed, 515 insertions(+), 147 deletions(-)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4


