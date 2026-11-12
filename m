Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2515606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yqm5k79y
Received: from list by lists.xenproject.org with outflank-mailman.1485653.1688801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQG-0005gl-At; Thu, 12 Nov 2026 11:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485653.1688801; Thu, 12 Nov 2026 11:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQG-0005ge-81; Thu, 12 Nov 2026 11:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1485653;
 Thu, 12 Nov 2026 11:50:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <holyting07@gmail.com>) id 1xRTJz-0005ZA-Vf
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTJz-006wHY-5J
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:50:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a7f6-e002-0a2a0a5209dd-0a2a450c97e0-32
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:50:27 +0100
Received: from [209.85.216.44] (helo=mail-pj1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a801-f479-0a2a450c0019-d155d82cd056-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:50:26 +0100
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3b0ae87069dso2074165a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:50:26 -0800 (PST)
Received: from Soun ([211.176.214.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c42a4csm4538630a91.4.2026.11.12.03.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 03:50:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484225; x=1795089025; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDLZg1ikQtb89i408Nh9+5mUKE87ve2vcBroIok488E=;
        b=Yqm5k79y3AifwA2Yioefk1hr3D3lQ5P7hlyIM/EbIFkcYzMl9nQcwo6bLH+5Cu0uP1
         I6yBW1GyLUucKxMbEpUgcoIzrhVqcR5sRZLmkWrStdsEtcX+ddf0WYiGQmEo9LdiCw6q
         aHO3TFkVaUiueLmssU8UDAUA2R/452C2945yUtZOdVmDK3n7FHqG+3PSKfom7QhDhGiA
         /evSsz+6oTl79lENuquA+0JHaB41mPbn6HSSuQ2c8yUJhfxvYAlLIeFrkqzcCLi+wZnS
         w3nJSU3GJy30Ybrkb3lok82LQv1TiZWx1dHw5xAMr6VRhqM4Ztojr3T9tARmnJOyf2V1
         u0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484225; x=1795089025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDLZg1ikQtb89i408Nh9+5mUKE87ve2vcBroIok488E=;
        b=0aFBEQWg1E/d1bzJ7g6XA+EgNTkE017HU+EJNwwEziOrQez0EawZiFbFAWi/kLIirR
         9GBJfm+IW3UjHujaysMJwJA4VRbMuZyYsYj17e2aeNmjCKzLaewFau6cPj2/AaIFBVka
         RDbtuZTt1tY+5/JFAvyt1vMz+DcpQLKLvPNJ3qoAuEZidQ6drZ7yXZwS6Mf4PAOhDV/O
         MTfjiFTAtUdJFh7QyI6Vsoh6ND74B6cRG6rmOa3OA9YS1gcIr64JTBwGvbCrcPL8dviA
         SxTTsf2A7hbF7beg2k7vmDj8XajfxcQB8F9wdKcbH14gwFTAUrGu4+PVDhX1PVlE+QHo
         3mkA==
X-Gm-Message-State: APuU4Z9FANbnvbz0Xl9wZv4o7eOO3Qr+mFsm/KL8VPgTVLYUrpCedCr8
	iQhiXrChtJTW2SjxoEgOJyVK2ZfKGGlNRjc/eOMZyOyuq7SZFTMmKlkoDVq2TBjD
X-Gm-Gg: AYBFou3rb1WWaVfGNhDHsrsco0oWouSrqWO3LdqQ2vSuvn4PzRJUwQ4QEGDUjvviExL
	a8YU3rylGoaCkPSyoCxFDqT0258jeKycx5ICgHVh2tRgg4e3sSQiv4kyAN7EL6d7/2TasFfE95k
	1Ov2uKOcTF7dLWBmmrFe/9JhK2qSg7PGkdcIuOfx89zzoUzRlKQnu6AUMS4sSRFO61mcg2ZAG7h
	zpaqpOzxVUMXg4xQtvjgEb91iytn76pLMNtc2nPvR5R9cbWGl8RgbEJaqCh86KcAZQ8+kkp8W0z
	4kxlf7J7B2QdkWbqU1x2/6YXiv3PRprDFXuqT4TmXK0a3dz7rgGeC5Lrv0y6m1KjKNLQNMI0Iab
	dF4yH2GoAWxKJk4LcXGZQ0dCBn6dJlwLGbGHu718wRAHoIAtb6JSzLR3JQOp3kxcMjjL6AEVV5n
	W8AxG1BIkQMKUWUKGN/efjimweDVUtUTC5r4Ow5zwaWQV4OjMZyMrd+ZYHtRLsDWkohG6RC6Ymf
	bNAFJ39i4qYg6UsqiQsk1QQExqAE+24XulYj1tksYmPrVEORstctsguZvw/BIR7+ShGfw6j/BXi
	0NO71K29mpg7xsWg05irtJvkSTm7B1rL8I9gjtiMtgBW7BeU9ov8prRG3P9a2tApb4PUgsucHnT
	N0cSR9GDkdrzYAwtU
X-Received: by 2002:a17:90b:4e88:b0:3ac:8741:e2e4 with SMTP id 98e67ed59e1d1-3b182f9c39cmr5354770a91.52.1794484224820;
        Thu, 12 Nov 2026 03:50:24 -0800 (PST)
From: SounLabs <holyting07@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	SounLabs <holyting07@gmail.com>
Subject: [PATCH 0/4] libfsimage: validate untrusted on-disk metadata in pygrub filesystem plugins
Date: Thu, 12 Nov 2026 20:49:45 +0900
Message-ID: <20261112114949.9936-1-holyting07@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794484227-77AD4A5B-857DDFCB/0/0
X-purgate-type: clean
X-purgate-size: 4104
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libfsimage is the set of read-only filesystem parsers that pygrub links in to
read a guest's /boot and grub configuration.  When pygrub runs, these parsers
are handed a disk image that is fully controlled by the guest and are executed
in dom0.  The on-disk metadata of that image is therefore untrusted input, in
exactly the same way the iso9660 metadata addressed by XSA-497 was, and the
superblock sanity checking added by XSA-443 does not reach the inode-level and
directory-level fields touched here.

Auditing the ext2, reiserfs, ufs and xfs plugins turned up a number of on-disk
fields that are used without validation.  This series adds bounds/validity
checks at the point each field is consumed.  The four patches are independent
and each is confined to a single plugin:

  [PATCH 1/4] libfsimage/ext2:     validate attacker-controlled superblock and
                                   extent fields
  [PATCH 2/4] libfsimage/reiserfs: validate item counts and journal length
  [PATCH 3/4] libfsimage/ufs:      validate superblock divisors and directory
                                   record length
  [PATCH 4/4] libfsimage/xfs:      bound inline extent count and directory
                                   btree traversals

The 14 issues fixed fall into four classes:

  - Out-of-bounds write (CWE-787): ext2 s_log_block_size sizes the fixed
    FSYS_BUFLEN block buffers, so an oversized value makes ext2_rdfsb() write
    a block past the buffer.

  - Out-of-bounds read (CWE-125): ext4 eh_entries; reiserfs blk_nr_item,
    ih_entry_count and journal j_len; xfs di_nextents.  Each is iterated or
    indexed as an array count without being bounded to the structure that
    holds it.

  - Divide-by-zero / SIGFPE (CWE-369): ext2 s_inode_size and
    s_inodes_per_group; ufs fs_inopb and fs_ipg.  Each is used as a divisor
    and can be zero.

  - Uncontrolled recursion / infinite loop, i.e. denial of service
    (CWE-674 / CWE-835): ext2 ext4_recurse_extent_index() (self-referencing
    index block -> stack overflow) and a zero directory rec_len; ufs a zero
    d_reclen directory entry; xfs the bmap btree descent and the directory
    da-btree descent in first_dentry() (a node whose child pointer never
    reaches a leaf, e.g. one pointing to itself, loops forever).

Trust boundary and scope
------------------------

The attacker is a guest that supplies the disk image; the affected code runs
in the pygrub process in dom0 while parsing that image's filesystem metadata.
The impact demonstrated is limited to crashing or hanging the pygrub parse
(out-of-bounds read/write within the plugin, SIGFPE, or an unterminated
loop).  No sandbox or privilege escape is claimed, and these are not proposed
as security fixes: pygrub is only security supported when run de-privileged
(XSA-508), so this series is hardening of the same unvalidated-on-disk-metadata
class as XSA-497 (iso9660) rather than a fix for a supported configuration.

Each issue was reproduced against a locally built, ASAN-instrumented static
link of the affected plugin driven through the normal mount + open path with a
hand-crafted image.  As a regression control, a genuine well-formed image of
each of the four filesystems (e.g. a plain mke2fs ext2 image) still mounts and
resolves a file after the change, so the added validation does not reject
legitimate on-disk values.

SounLabs (4):
  libfsimage/ext2: validate attacker-controlled superblock and extent
    fields
  libfsimage/reiserfs: validate item counts and journal length
  libfsimage/ufs: validate superblock divisors and directory record
    length
  libfsimage/xfs: bound inline extent count and directory btree
    traversals

 tools/libfsimage/ext2fs/fsys_ext2fs.c     | 48 +++++++++++++++++--
 tools/libfsimage/reiserfs/fsys_reiserfs.c | 46 +++++++++++++++++-
 tools/libfsimage/ufs/fsys_ufs.c           | 11 ++++-
 tools/libfsimage/xfs/fsys_xfs.c           | 57 +++++++++++++++++++++--
 4 files changed, 153 insertions(+), 9 deletions(-)

-- 
2.52.0.windows.1


