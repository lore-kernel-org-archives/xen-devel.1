Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EEEC5DF87
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:08:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394898.1633587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdD3-0004UA-Jp; Wed, 19 Aug 2026 10:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394898.1633587; Wed, 19 Aug 2026 10:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwdD3-0004U3-GY; Wed, 19 Aug 2026 10:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1394898;
 Wed, 19 Aug 2026 08:40:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <suruurism@gmail.com>) id 1wwbq5-00070R-AP
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:40:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwbq4-00FnNH-Jh
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:40:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <suruurism@gmail.com>)
 id 6a856be0-e002-0a2a0a5209dd-0a2a4508be42-0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:40:00 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <suruurism@gmail.com>)
 id 6a856be0-f659-0a2a45080019-d1558031acea-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:40:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495590dde14so8914505e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 01:40:00 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9dff4c1sm33032205e9.3.2026.08.19.01.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 01:39:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787128800; x=1787733600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjjUvOmK0OPOz9lxQcUSjqU8S6ZDd+xG7uAE7UP0M10=;
        b=cJV1rfCSuhfyvSngFcjXYKuWHxoVDEMNU7FBNvtWH81DrY4+p52xQA4Yb3v+LGQJGq
         0ogd5ENlVX8MfIWLbIgzE+zUTMwT+Gi5+/YAqCSdzv5MXNJXXl5VXGcI/pSCK3r0HOsi
         zBJxEkhpvJtA9Hn0y/UskjIt5K1yYL9OnzqXE2gk43qSnzwyPmaqvZhV090avrSHHNM5
         U1on8R49ZLpcyS0kVT2tbs65/6UvyICed9I4f+xwQk2g4gXD+b2ciS8B5Sw9tkfBgmR8
         77LJSEwej7inxz9b3s7zgETCKKXSvO6pEswCyZ99Djy8xm/lp1YKfjnbCqyFkqYc4Cc0
         RQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128800; x=1787733600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjjUvOmK0OPOz9lxQcUSjqU8S6ZDd+xG7uAE7UP0M10=;
        b=CGe2gRxspzTwTIF6ZLvqEKnua137RTDHK3JMRIUl3e+KRLUOHqmYMdswutbmmJi4kp
         PSOm8MkX4cxOtVWvnqZNfDqD7dt8W2hMjVH7Iwe2qy+z4l+llMmZwwNV8pMlfPmBaALf
         mgpT1/ZBZnsriLUMIdHCIf9vvmlypZLSB54VUGrhwHCgxc3Mf7/BzhEq9p3cP8DT9NBV
         ZZcapIgTAVharq7gayWza4qIfd4TSF/l1iu31beJaUniD/bPXRYaPMDi7aZneCzj8B/T
         4dbUW6Lxaf6uh9EhwrH5awKNhs/dXQluGSpa1eO1KjtZCICi0BWvixuF6imuquoiSJq0
         FLGA==
X-Gm-Message-State: AOJu0YzhpWYBbard7FYbUqvw35fIF9780cHhaMlvZENY/NZrU6j6+52N
	QXOd+hs+l2IjJlsWra+IfeDpcJmJZ3DGXdIC9yAmCwqWxVqSx8pGJl39rcqqF1Js
X-Gm-Gg: AR+sD11s6fB3aC9wVY4TyNX5kY+5qclFqef0bDuKF96aCddcCsQbCC9cnC1++2ui/0p
	YnkhSwaOHCkNZe0sD/LGiKUxvh3lU3zgWMrbSQTs60ItY2khWMOIW6lidhui6BGPr3P7rKWNWQ2
	SaQCxriaoh4D42YrpkyU1aDcozIPrIltFrH1njGnMdp/84LUY4bdvcawebNS0zMsRIAMwvldFWi
	LM2QCkNgqKZ4lNO7SJDAZuzQllOhwBpwWYNeFmYd+BnC5oEgRT34jGnHSKwsLILB++d5+bCpHUt
	biPuUXd4ZIXLv+e1uUggGnWrP5glgb4rzdvjSaP8ELdCGEtXiduKPNeob7lwv46rB7rL3x+7PHr
	JHD3hJZHgvK1fNGCtAeOKjIUYF8eQuJYHKheqqnlgxTPHXxE00gJ7NOdm1G8QMM48iCeOt6MroK
	PPWfNvVsuKvWLlEM86bXzDbd5nBic2bJ6D8eXZxfFimrt48klYJeHx9PI8lQzTiL79g5vd
X-Received: by 2002:a05:600c:a012:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499aa1431a5mr56444255e9.1.1787128799811;
        Wed, 19 Aug 2026 01:39:59 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org,
	jgross@suse.com
Subject: [PATCH] xen/gntdev: prevent private mappings from becoming writable
Date: Wed, 19 Aug 2026 11:39:56 +0300
Message-ID: <20260819083956.1442-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787128800-CF55C87B-F0C3CF76/0/0
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
 

