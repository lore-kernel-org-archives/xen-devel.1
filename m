Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E203C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:08:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394902.1633590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdD3-0004Wm-QG; Wed, 19 Aug 2026 10:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394902.1633590; Wed, 19 Aug 2026 10:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdD3-0004Wd-MT; Wed, 19 Aug 2026 10:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1394902;
 Wed, 19 Aug 2026 08:42:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <suruurism@gmail.com>) id 1wwbsO-00081p-O9
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:42:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwbsO-00Fnyp-4s
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:42:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <suruurism@gmail.com>)
 id 6a856c5e-2eae-0a2a0a5409dd-0a2a4506ab3a-36
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:42:24 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <suruurism@gmail.com>)
 id 6a856c6f-195a-0a2a45060019-d155802ce90c-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:42:24 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-499840a2575so5548295e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 01:42:24 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499ab2a8b34sm48429415e9.8.2026.08.19.01.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 01:42:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787128943; x=1787733743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjjUvOmK0OPOz9lxQcUSjqU8S6ZDd+xG7uAE7UP0M10=;
        b=mHG1JQhzF9UM1cMLXZAnT9is3yu9XWXonzmqfOrTFemR8Pk/dc0MP5B8/FOkzRo2nr
         bt8q1/deq5VDZLJQql5qN3FrMpXmcbEqJ3rW3A8Eme0oTb/76AANWWWPK2n3WqzKODFw
         mu9RoScu2IocB5PtPRDXgdn33YSXRRsM24PkD93DkKrQyiIcc1SS8bMrD0ajjTvgqSsh
         rDg+SqWZgKOONnk9zwa1cdc21ZbgZDbgU0CxKxEDP+Ba+2iyxqCabXEz2oGmTEchRUiI
         Lfqz5ktvIJcl/HajGM7V6QwyBYkYPfNahpMRlQnv6HAlDnW4sOIhMFUtK5vgVvY+SNH5
         p5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128943; x=1787733743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjjUvOmK0OPOz9lxQcUSjqU8S6ZDd+xG7uAE7UP0M10=;
        b=itD+KKRd9CTRSQDFd3m4mVZwbZJ0mlPeJXdjSVXj4GjZQs7G2fGWPly3YoPKyxETNX
         UhWr/ja2tZMAtrxt7R7SWJdpX9Up4s7/U9jjnBTMzndVuTSxJmDL1mslkPuFOzJgTLD5
         2jNHYYcnzfHwTKkOkhSU8AuwCkdeKFv73YgRDNT2WrMoFBGAgnOcgOadzz1Ei3BYbhn1
         ogLaeiGvSKLhJBgIyYYJFl7v3zmcJHdDYlD6V2SlTcUmz4EpRfvAKCw3GfYxjV+hDsO2
         mDYIKHZ/kOiVGjU8C/3raM5+8iSutbeqQZhUDD9VojYLhEs695bUgrK27Y7EFQ37nCDK
         MSlw==
X-Gm-Message-State: AOJu0YxZ4UcVazL1iBY9aKHwV4TEQZAms2OyG32vNdy/c0PZ2NO9B+ff
	Zx8p2cRd9EYLk217LZRJYV0GnKIOrsQ8gu3GW8nchFfGt/xE6swq9HLLazmsJQ==
X-Gm-Gg: AR+sD136Z34kJ5e7V9EiDh49iDL1axlTwBh50VebBUNnUVuP6hPP8ZMAVO4513owKC/
	E7wnIDF4crE0fmShU5RoEP16Gh0dRTrUscHMMeYN4C+ULtWPquobXtf2pK2xrVRq4aWKArYi6gs
	DliC5mhbk+Uk9W7YHm+kthOFLytKRxvdFgXpt+oEik2SYyG7nDyOgbvozXEkxStDXswGJpi3dEO
	0QZvJa6zOOaJdMXeTP8ArImru3Dtl4MZ0iUwYXQmWXpfUNgvRSgvSxLwj7Jk1VtNLhlKhH6shQg
	PA/FWyYNhFTa4IXNG/CMlByA6eYHuH/l7GYR53u9hVmaiqTESvRcBT/X+xS11F44MHT4kPuxdO5
	4XEBcmkVeSITJpvkFwXOeo1EqwwbWqVklMtdIDIh4kRM2XZ+Y1xpuXWGKkIvo5AcSAUJPcjPG70
	MGvrwgVd24AJQzINGB8a51kAsdfNcD37U1nx7IZbOYFJvvMWpV5JHkMctr7t8mXesTEPd7
X-Received: by 2002:a05:600c:a05:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-499aa1b6a02mr45293395e9.10.1787128943217;
        Wed, 19 Aug 2026 01:42:23 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org,
	jgross@suse.com
Subject: [PATCH] xen/gntdev: prevent private mappings from becoming writable
Date: Wed, 19 Aug 2026 11:42:17 +0300
Message-ID: <20260819084217.1577-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787128944-F5C0F77B-29DE9FC2/0/0
X-purgate-type: clean
X-purgate-size: 1440

gntdev_mmap() rejects writable private (non-shared) mappings of foreign
grant pages, because a private writable mapping takes the COW path on
pages that have no proper struct-page backing.  However, VM_MAYWRITE is
left set, so userspace can map the grant read-only and then upgrade the
mapping to writable with mprotect(), hitting the same COW path the
check was written to prevent.

Clear VM_MAYWRITE for private mappings, as i915 does for its read-only
objects and as fixed in drm/vc4 (CVE-2026-68445) and drm/panthor
(CVE-2024-53071) and ptp: vmclock (commit
a5edadbae57e2298a56cf7a4e774a027905a331f).

Fixes: ab31523c2fcac ("xen/gntdev: allow usermode to map granted pages")
Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

---
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 1dcc4675580ed..b71f5bae25b63 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -1066,6 +1066,13 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 	if ((vma->vm_flags & VM_WRITE) && !(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
+	/*
+	 * Private mappings of foreign grant pages must never become
+	 * writable: they would take the COW path on granted pages.
+	 */
+	if (!(vma->vm_flags & VM_SHARED))
+		vm_flags_clear(vma, VM_MAYWRITE);
+
 	pr_debug("map %d+%d at %lx (pgoff %lx)\n",
 		 index, count, vma->vm_start, vma->vm_pgoff);
 

