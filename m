Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18106CCF2E6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454375.1667931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlR-0006SF-Tx; Mon, 19 Oct 2026 13:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454375.1667931; Mon, 19 Oct 2026 13:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlR-0006S8-R4; Mon, 19 Oct 2026 13:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1454375;
 Mon, 19 Oct 2026 13:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlQ-0006Ru-LV
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlP-009usr-2o
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:50:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62034-8faa-0a2a0a5109dd-0a2a45079456-24
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:50:55 +0200
Received: from [209.85.160.169] (helo=mail-qt1-f169.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6203d-b4ea-0a2a45070019-d155a0a9a5ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:50:54 +0200
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-5351d76e1baso27234321cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:50:54 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a9dbdb5sm99677641cf.22.2026.10.19.06.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:50:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792417853; x=1793022653; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YreDSl4vDqbNAVIITvhajgrdqUJ1n9sK10J0+0ZRYE=;
        b=SEKrrvlgtI+M7rlK0MHIdqDxufABvaT6yAT6ehTe0KCXb6ZIPDABaHs1HrSwsVrWVJ
         cNs2hLa1GNX0wfU4tZegPclpHX/dzFCYVZB3RYNi3rsdaAhYJQolXmubQqi+hGkcEv5J
         YY03Y5D8KAfvnifQ6N0gT58KiCGIP2vn/HKpfEE0aQuK2+00YN1J0BsQFraO7SGcg6iV
         C3eIfc3c85v6Kd11mGhYZzI+SWWQBqkJcPzvyMa97Xjs9KJZP/NqOsIUYfcbbF1AdWGx
         LfhUwHIwrODAGobE1MVV1FyIEcYOBWT0MMCydnisSlYz2sl3vvFW+67eWjbezuRn/uX1
         04MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417853; x=1793022653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5YreDSl4vDqbNAVIITvhajgrdqUJ1n9sK10J0+0ZRYE=;
        b=YY5ylFhQt7lqrh/8v1wqx6IBpEwuuFJvCGMIkjYZMbuawU/mYjDzcdPNSzK/YpZtO7
         dqcvPApHqnUtUcuv4wUWlYya1GjNhugqAW1WqHRs1x7FQVmchIK7aUeLn5BIm/DQ7QNI
         T9h9h5230/gSAWaFUBTEc0F4bvgML9TdvmzJVFhd5oOzcDRv8ISS7q4VRLcXKxxira5Z
         n86+mbnwO3aarMN8hJDtwSJFDJYoS00NuVrsggP3HDpU/N1YOdLmOrru8JiyVZvofGzD
         SrMhl/Zc/GDmsVSg3lC8mgM4gykb9GFg0gnHpKc7yVCpbJFC2Cp+0cWzESoKD9Ukkmlg
         Y8nw==
X-Forwarded-Encrypted: i=1; AKwUvByBFBzIXnAPVRhuzeiHfzr6QWlqsTjS4/eu2fOjoRa5n2kJ1jDkDplazOYrY0pC6D1cxW1h3E+02Xw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLHXOXXw7NCyysTgHsnGZuDZIowIg1oqlq3iciWWcUtc9NEzLmn
	k+2mgNMMl78sY+2MZZmFWKeYHfp6PuZ0/ioFsajB6YqxRoH0ywCQWUWoj1Ogj4vrICM=
X-Gm-Gg: AYBFou3WXF3CcNwqFzNjK0VP/Et6FiWcgbw3+gmTwDQalW20OBHk+Pm5uon34nRj/G6
	4wJpo5xewMSSqGdVmCEixXS3sAxGXyHWWEitaIKVAJTDhyCl3rgoME65GlH9z/Xvs8mM5yBo/dI
	apTVUIIlKPXo3MvG9rmcylrQxn331MGpm6bqvVFJ3hSYZMK3Nfrcd3SX22C6xJjU6tvj+63Rvvz
	cB19Kl9OSE030fgzra3s7LTLV1Wx2QXiBUQWMUiZ3VmDiupytJxfWBjuMg4T8+dAvg+8/fJGCf9
	5SGvCEOTun7CT5zAw0m2I7dEjv2ltejopPHyQjs5+kc+ChtqYZ0VeT0GDK86IiAxNVIWTqKWycT
	eSlPuqWjsQPaP7HEp3w01qGjx9lBy/+30CcW7bcavRoVVmqJgId9nP8oz/Cwa35diF/Yq62DY0L
	5PPULpFJ1RFpUwtIFmzmKKv3UVWUkxuEzVKHEvYntZIIXWZnO81auDz53by6TgHkMRdkzK5zxzc
	h7NaIcyTHwJjVE=
X-Received: by 2002:ac8:5d11:0:b0:51c:b98c:f772 with SMTP id d75a77b69052e-53645fedd9emr99044071cf.15.1792417853207;
        Mon, 19 Oct 2026 06:50:53 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next 00/15] net: skbuff: follow-ups to the BUG_ON()
 removal
Date: Mon, 19 Oct 2026 13:50:34 +0000
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwg1moC/3WNwQqDMBBEf0X23EUjqZT+SukhqxtNK4lkjRXEf
 6+x5x7nzfBmA+HoWOBebBB5ceKCP4K6FNAOxveMrjsy1FXdqEo1SBrlTclapNRj8GjDOIZPmgR
 Np5TpbH27Gg2HYIps3XrKH+B5Rs/rDM9fI4le3M7ZnbdkhJGi8e2Q0TiVpMsT/nmDff8CfBxvY
 70AAAA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417848; l=4198;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=KIaS3RgzIflnJVbs1aR2xV1e37kN7pyP1TLRgrxxSDg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG9I0MA4oB2pQusLHea7/1MDYYSfacfAuZk3/f5DoGX+4zhJuIDA85OltKcTqezTiJ7GjwQMaYR
 jFfuEgK6Q9Ag=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ef75cf/1792417854-348C9AE4-9F3DAC5C/0/0
X-purgate-type: clean
X-purgate-size: 4200

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
Josef Bacik (15):
      net: skbuff: make skb_copy_and_csum_bits() report unreadable frags
      net: skbuff: add skb_checksum_full() that reports failure
      net: skbuff: fail checksum validation when the skb can't be checksummed
      net: skbuff: fail segmentation when a segment can't be checksummed
      net: skbuff: fail pskb_trim_rcsum() when it can't checksum the tail
      net: skbuff: add skb_crc32c_full() that reports failure
      net: skbuff: let skb_zerocopy() copy a short skb without head_frag
      net: skbuff: make skb_try_coalesce()'s len unsigned
      net: skbuff: check csum_start against len in skb_copy_and_csum_dev()
      net: skbuff: reject a negative length in skb_copy_and_csum_bits()
      net: skbuff: refuse to segment a nested frag_list
      net: test the frag_list layouts skb_segment() refuses
      xen-netfront: don't BUG() when skb_copy_bits() fails in bounce_skb()
      net/tls: don't BUG() on leftover length in __skb_nsg()
      net: update comments that still describe the skb BUG_ON()s

 drivers/net/ethernet/sun/sunvnet_common.c |  10 +-
 drivers/net/xen-netfront.c                |   7 +-
 include/linux/skbuff.h                    |   8 +-
 net/core/dev.c                            |   7 +-
 net/core/filter.c                         |   6 +-
 net/core/net_test.c                       |  52 +++++-
 net/core/skbuff.c                         | 274 +++++++++++++++++++++++-------
 net/ipv4/icmp.c                           |   9 +-
 net/ipv4/ip_output.c                      |  11 +-
 net/ipv6/icmp.c                           |   7 +-
 net/ipv6/ip6_output.c                     |  11 +-
 net/sunrpc/socklib.c                      |   9 +-
 net/tls/tls_sw.c                          |   5 +-
 13 files changed, 327 insertions(+), 89 deletions(-)
---
base-commit: 6b3e73774815910a39d8ca75b9ad7df963f61d50
change-id: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4


