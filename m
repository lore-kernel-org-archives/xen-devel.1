Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3485CC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:05:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448223.1665776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKDB-0004lw-Sr; Thu, 15 Oct 2026 12:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448223.1665776; Thu, 15 Oct 2026 12:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKDB-0004lp-PO; Thu, 15 Oct 2026 12:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1448223;
 Tue, 13 Oct 2026 17:07:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrey.misyrov@gmail.com>) id 1xGfyk-0007oC-2e
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:07:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfyj-0017vm-CA
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 19:07:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrey.misyrov@gmail.com>)
 id 6ace6567-8faa-0a2a0a5109dd-0a2a450cc76a-2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 19:07:53 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrey.misyrov@gmail.com>)
 id 6ace6569-f479-0a2a450c0019-d1558029a499-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 19:07:53 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso42045415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:07:53 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm379560935e9.4.2026.10.13.10.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:07:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791911273; x=1792516073; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdq9VK8+Wh/mRy8KAkG8P/JTclrVTJdKPo9KBX5A3pI=;
        b=D76U0i41H62299wG7npSPjboQ6X5gP4mCdrBeupBCebOvi+OslYK/j39BJgTTPstBu
         hv2+CjXgFL5bv04GVk5aPzb+2kUEXay0Zd1Nbj2+g0qcPjiNNCMfrs3FsNMSKOMcuhcW
         3g0z1XyNisxtD5Uni+8hqieud+AwAWwJo0xxCQl/g9ZUWlZfRQAPKdcG4OXB+ng+pAlL
         vAOhar71yYiSCCzqGHLfA2NWQE41xEX6HU7LLEkP1FRxzNnRwO79g/PxW4WXarQOmegJ
         plLhWgKqbHjtvzhaHPw0kJNlGg5+CGv4j1zQXSsGBd5QoZb9iEsKGd0afr6/WLMkakNK
         5CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911273; x=1792516073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdq9VK8+Wh/mRy8KAkG8P/JTclrVTJdKPo9KBX5A3pI=;
        b=kYf1tRsRdTUu12zfp2HVrN5UmnfA9GUdutFgd97mHIZM4EINiAkBKBNP+hW/KHlmO/
         yWCNnT3pBLksoS6VhcuD1Jb8LWD24Lx2W0hqjcMW+zU+HDPzSJxko3gHRy4wg5TV5hRX
         e+ks5CIQ87CCGiyL7p9AJ74tEDddyt2txW0QNGzfXC2eafR0zc+StfejX/4YlS6iS5oB
         Iy8W4AbrTbXzkZJxsp/FUh3yqwgogRAtYly3J21qQsaI6VIYADugEG/MZUbPsz76Xfs/
         D1j4z/s3HNF+SIFU/A/wfU7SMSNecQeloQtywlTOH850RTTwl9w7+0lNmBkODVlnnxbY
         PY8A==
X-Forwarded-Encrypted: i=1; AKwUvBzTtxNU0aa6Dd86X8jfF3JMW95vOLnM68SBTmhXJFA1jomMddKgHxo0sRm5SwzTPkd1tcuGIzWR0lY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL7oHyykX0f/f9RG4J7r+okA1JzzOYbnIU4zR6JlSP6kGBSVU+z
	9dzGwo4kmggWFV6nG4VxhtLFcQJp2YTHKysBaCp0XDOEhVy69QgslikJ
X-Gm-Gg: AYBFou0VhvDDmaczylcwBScLV72WjJwikQxleGMFdBdmiZKBHzOn8tRkrUdUmChcKVh
	Hn3X9I6p/SXC6cYutdwogHclss71hxn655NL/sUXdSCSEFlC/I14cHOhjGoT4aWtZh0/Ow3nkaA
	6URIo+zp+SiQudeVwQoZkuOjqV7Tc6LpcJ+mIhoZQ+YDoRUCLCROdiWWI45HZiNA7HbrDHu4CZk
	Q6HqhpHIf99e7eSYm1bWmPnPiCkmL1WALr63LAYjqjerhjwPIzAGT2zgNLUov/uht3wsUxgNe2C
	xqFg9/ruuGeL7So4FIB12NhBwAwA705fc2xSQqhtAR+/hXU2JqA+aZGDYRE3FyMI1ryUQHRuXcI
	EPfKFppQ64n2jQI/TdGnKXShH0xU9KllPJCfwPRXmHkKb9dKCb0HiNeG/Ws4RgRp1hlHXd9FO2P
	BLGZTm/dOqFdrVF7OoEumhcVgbzpylp/PkYWqbC8OTKj936ImiXQbHBpujDgMRv/jZcQ==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr228195185e9.8.1791911272543;
        Tue, 13 Oct 2026 10:07:52 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen/gntdev: fix deadlock between map ioctl and mmap
Date: Tue, 13 Oct 2026 19:07:45 +0200
Message-ID: <20261013170745.583279-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1791911273-034D7A5B-9875DEDC/0/0
X-purgate-type: clean
X-purgate-size: 2590

Commit 45ca1afe2fd1 ("xen/gntdev: fix error handling in ioctl") moved
copy_to_user() in gntdev_ioctl_map_grant_ref() under priv->lock. A
fault in copy_to_user() takes mmap_lock, while gntdev_mmap() is called
with mmap_lock held and takes priv->lock:

  ioctl thread                        mmap thread
  mutex_lock(&priv->lock)
                                      mmap_write_lock(mm)
                                      gntdev_mmap()
                                        mutex_lock(&priv->lock)
  copy_to_user() faults
    mmap_read_lock(mm)

Reproduced on Debian 6.12.111 in a Xen guest, with the ioctl argument
on a MAP_PRIVATE file page that has not been written yet. sysrq-w:

  task:repro state:D stack:0 pid:4479 tgid:4477 ppid:1 flags:0x00000000
   rwsem_down_read_slowpath+0x25c/0x480
   down_read_killable+0x48/0xc0
   lock_mm_and_find_vma+0x96/0x250
   do_user_addr_fault+0x12d/0x620
   exc_page_fault+0x7e/0x180
   asm_exc_page_fault+0x26/0x30
   _copy_to_user+0x36/0x50
   gntdev_ioctl+0x3b9/0xa00 [xen_gntdev]
   __x64_sys_ioctl+0x97/0xc0
  task:repro state:D stack:0 pid:4480 tgid:4477 ppid:1 flags:0x00000000
   __mutex_lock.constprop.0+0x41b/0x720
   gntdev_mmap+0x4d/0x330 [xen_gntdev]
   __mmap_region+0x697/0xb10
   mmap_region+0x78/0xa0
   do_mmap+0x45d/0x630
   vm_mmap_pgoff+0xf8/0x1c0

Drop priv->lock before copy_to_user() again. On failure, re-take it
and remove the map by index, as IOCTL_GNTDEV_UNMAP_GRANT_REF does,
since another thread may have unmapped it meanwhile.

Fixes: 45ca1afe2fd1 ("xen/gntdev: fix error handling in ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
 drivers/xen/gntdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index b71f5ba..1ad0220 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -670,15 +670,19 @@ static long gntdev_ioctl_map_grant_ref(struct gntdev_priv *priv,
 	mutex_lock(&priv->lock);
 	gntdev_add_map(priv, map);
 	op.index = map->index << PAGE_SHIFT;
+	mutex_unlock(&priv->lock);
 
 	if (copy_to_user(u, &op, sizeof(op)) != 0) {
-		list_del(&map->next);
+		mutex_lock(&priv->lock);
+		map = gntdev_find_map_index(priv, op.index >> PAGE_SHIFT,
+					    op.count);
+		if (map)
+			list_del(&map->next);
 		mutex_unlock(&priv->lock);
 		gntdev_put_map(priv, map);
 		return -EFAULT;
 	}
 
-	mutex_unlock(&priv->lock);
 	return 0;
 }
 

base-commit: 61b6d1df1d6234c38a6ea7e4f58e7da035ef6ab4
-- 
2.43.7


