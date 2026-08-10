Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0881DC5AE5D
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:31:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387336.1628668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHS-0006LE-8S; Mon, 10 Aug 2026 10:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387336.1628668; Mon, 10 Aug 2026 10:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHS-0006Jf-1g; Mon, 10 Aug 2026 10:30:54 +0000
Received: by outflank-mailman (input) for mailman id 1387336;
 Mon, 10 Aug 2026 10:30:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHQ-0005zg-Q5
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHQ-000BDZ-6F
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a854-2eae-0a2a0a5409dd-0a2a4509bf7e-46
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:52 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a85c-be1a-0a2a45090019-d1558029d1c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:52 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so14895985e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:52 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357851; x=1786962651; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVOrYo9kwDL27bIBgSRi6l0uRZVsLr0xOhtweF06SqI=;
        b=OFQuNM/CI3Ms3ghElvx6gHV113l9f8rJdEPvrkjHSnPr/Fl7VuGVd6HOrhKZpudEKU
         VsgqdHY0flt9zyRLmzpU3zwUbLIFBp9EZbBad5flLsliatOf50DNxMxyg677h6eo1y3u
         3eBdyqtLeFbwqQaoXR1QI0rPH2jiTj5M6CFsCINN7apxor5ivpAXUffe9YK9aD8NLkez
         I1BlKtfemqzeT86jBU74TXh14bntZGjYqziICDDf/UWuHWRPYFG8+aEpjLVEbE1SrmL6
         1ffu1VoSwkJqfXG18P0PtsNvUfbf4A7gbAFSR9KbqHaGp6IbHlzS4FdknKZcrzh9cqRK
         H2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357851; x=1786962651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVOrYo9kwDL27bIBgSRi6l0uRZVsLr0xOhtweF06SqI=;
        b=qbYnE6xRPVHuZ0s8uCRbR6NBYLuLocC1ujczkNtCKV8hdSu1hh3zzqgVNvG7QA1LUx
         3RCbQdjx0Aq9YF18MXMvRSnhst9c2OVM+I213AlWA1wIIUIxRWyw37lHPwrdg7KQKlQv
         T6O79/1xDX1l2b9Dmtvp24yOQtHUj2G3qGF596SEeo8cXV9P0tdWSfPUqUayfldq15nx
         ljxl/RBwUDUkmSBFd3Pl4B/D1+ywUJMuZ/YMYKF8QdO95W+qrcAa2MqNDf3ClD6UF5as
         BDeBabtQT0bB9LT/4VrddCly6NZkcgu/sqozD6TVWWQcWwNovyxbz0XCrdtEBctI9147
         SpXw==
X-Gm-Message-State: AOJu0YzUxup0D13r3gziyWX8EzSqjidParyWHBB24FpMtibY8S030vGI
	e1vn9bgyQOgMSux978Stui3mtbvqCAFMbpwQHB9N1fCz9UXKl5DIo7dIEcBnLe6kWVk=
X-Gm-Gg: AR+sD12cUWJyexX2URDj4+cUh5U9q2py+t52F6gRZjy3syVxB00j1zvGu1dFvljZWfI
	jNS8D3nX/Hw26AoBjLHPyfqreAiGOHsj8iGVlk5y8bTkHCw2mvzC1xIczWi4hdwMD3ybxqrVf4j
	nsfzynpIQUWCJ0QD3Y0RaAG2RSu+IRIVJK9okYT0HyCuPfVFpVM0Gs4B0Zbnpltr+BHMZjfdNEe
	LKKLL8ZbVjfFzef+8s8dH6usgZmDt1TMsFKyVsvWXuHt4v3c9XSTQuEdaUECy/8kYtXN99HlHBs
	/rskhkG98SRMFfLTmvpQpz2XfBstRgGAN4VYFISTVYlrZez1tdmjk8hTkIKRVWIiEzBOkg5ep1w
	c9soKxsffV/4+ixIczmR4R3JhA3g0UGYImo/JkAmZ/P6pNoAbRmOR9TA38PlL4rsmcFw16bm1+x
	Fz3i5OosHXGPfMQPsXEYL1D/AZDeYLv1COiZeSDN0NA58W54gXeYgwSB5skyIhUOVWkz5+jESN+
	pFjPc4pGWyBRIrsoP2BTjOBiU35Vy4mAneEVCkm
X-Received: by 2002:a05:600c:4f45:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49972764ed2mr11520785e9.5.1786357851500;
        Mon, 10 Aug 2026 03:30:51 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH Linux v6 10/10] xen/privcmd: Add new ABI to allow copying foreign memory
Date: Mon, 10 Aug 2026 11:30:13 +0100
Message-ID: <20260810103018.54564-11-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1786357852-BCAC8034-8D57BA6A/0/0
X-purgate-type: clean
X-purgate-size: 6569

This new ABI allows to copy foreign domain memory to/from a buffer.
This avoids having to map/copy/unmap foreign memory which is
expensive.
This operation is done particularly when migrating VMs.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v4:
- fix wrong assign;
- use set_xen_guest_handle to set handle;
- wrap slow hypercall with xen_preemptible_hcall_{begin,end};
- use _IOWR for ioctl code to be more specific;
- use __copy_to_user if buffer already checked.

Changes since v6:
- compatibility ARM/x86.

---
 arch/x86/include/asm/xen/interface.h |  3 ++
 drivers/xen/privcmd.c                | 49 ++++++++++++++++++++++++++++
 include/uapi/xen/privcmd.h           | 10 ++++++
 include/xen/arm/interface.h          |  2 ++
 include/xen/interface/memory.h       | 37 +++++++++++++++++++++
 5 files changed, 101 insertions(+)

diff --git a/arch/x86/include/asm/xen/interface.h b/arch/x86/include/asm/xen/interface.h
index a078a2b0f032..fc76fac8fb16 100644
--- a/arch/x86/include/asm/xen/interface.h
+++ b/arch/x86/include/asm/xen/interface.h
@@ -59,6 +59,7 @@
 #elif defined(__x86_64__)
 #define set_xen_guest_handle(hnd, val)	do { (hnd).p = val; } while (0)
 #endif
+#define get_xen_guest_handle(hnd) ((hnd).p)
 #else
 #if defined(__i386__)
 #define set_xen_guest_handle(hnd, val)			\
@@ -70,6 +71,7 @@
 #elif defined(__x86_64__)
 #define set_xen_guest_handle(hnd, val)	do { (hnd) = val; } while (0)
 #endif
+#define get_xen_guest_handle(hnd) (hnd)
 #endif
 
 #ifndef __ASSEMBLER__
@@ -91,6 +93,7 @@ DEFINE_GUEST_HANDLE(int);
 DEFINE_GUEST_HANDLE(void);
 DEFINE_GUEST_HANDLE(uint64_t);
 DEFINE_GUEST_HANDLE(uint32_t);
+DEFINE_GUEST_HANDLE(uint8_t);
 DEFINE_GUEST_HANDLE(xen_pfn_t);
 DEFINE_GUEST_HANDLE(xen_ulong_t);
 #endif
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 725a49a0eee7..55364801ba2e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1522,6 +1522,51 @@ static inline void privcmd_ioeventfd_exit(void)
 }
 #endif /* CONFIG_XEN_PRIVCMD_EVENTFD */
 
+static long privcmd_ioctl_foreigncopy(
+	struct file *file, void __user *udata)
+{
+	const struct privcmd_data *const data = file->private_data;
+	long ret;
+	struct privcmd_foreigncopy copy;
+	struct xen_foreigncopy xcopy;
+
+	if (copy_from_user(&copy, udata, sizeof(copy)))
+		return -EFAULT;
+	if (copy.dir & ~1u)
+		return -EINVAL;
+	if (copy.num >= U32_MAX >> PAGE_SHIFT)
+		return -EINVAL;
+	if (!access_ok(copy.pfns, copy.num * sizeof(*copy.pfns)))
+		return -EFAULT;
+	if (!access_ok(copy.buffer, copy.num << PAGE_SHIFT))
+		return -EFAULT;
+
+	/* If restriction is in place, check the domid matches */
+	if (data->domid != DOMID_INVALID && data->domid != copy.dom)
+		return -EPERM;
+
+	xcopy.domid = copy.dom;
+	xcopy.flags = copy.dir;
+	xcopy.nr_frames = copy.num;
+	set_xen_guest_handle(xcopy.frame_list,  (__force xen_pfn_t *)copy.pfns);
+	set_xen_guest_handle(xcopy.buffer, (__force uint8_t *)copy.buffer);
+
+	xen_preemptible_hcall_begin();
+	ret = HYPERVISOR_memory_op(XENMEM_foreigncopy, &xcopy);
+	xen_preemptible_hcall_end();
+
+	/* copy values back in case of error */
+	if (ret) {
+		copy.num = xcopy.nr_frames;
+		copy.pfns = get_xen_guest_handle(xcopy.frame_list);
+		copy.buffer = get_xen_guest_handle(xcopy.buffer);
+		if (__copy_to_user(udata, &copy, sizeof(copy)))
+			ret = -EFAULT;
+	}
+
+	return ret;
+}
+
 static long privcmd_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long data)
 {
@@ -1569,6 +1614,10 @@ static long privcmd_ioctl(struct file *file,
 		ret = privcmd_ioctl_pcidev_get_gsi(file, udata);
 		break;
 
+	case IOCTL_PRIVCMD_FOREIGNCOPY:
+		ret = privcmd_ioctl_foreigncopy(file, udata);
+		break;
+
 	default:
 		break;
 	}
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index 8e2c8fd44764..993b501e35bf 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -131,6 +131,14 @@ struct privcmd_pcidev_get_gsi {
 	__u32 gsi;
 };
 
+struct privcmd_foreigncopy {
+	domid_t dom;		/* foreign domain */
+	__u16 dir;		/* direction,  0 from, 1 to */
+	__u32 num;		/* number of pages to copy */
+	const xen_pfn_t __user *pfns;	/* array of pfns */
+	void __user *buffer;	/* buffer to copy to/from */
+};
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -164,5 +172,7 @@ struct privcmd_pcidev_get_gsi {
 	_IOW('P', 9, struct privcmd_ioeventfd)
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI				\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(struct privcmd_pcidev_get_gsi))
+#define IOCTL_PRIVCMD_FOREIGNCOPY				\
+	_IOWR('P', 11, struct privcmd_foreigncopy)
 
 #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
diff --git a/include/xen/arm/interface.h b/include/xen/arm/interface.h
index 61360b89da40..20ee1ed44436 100644
--- a/include/xen/arm/interface.h
+++ b/include/xen/arm/interface.h
@@ -27,6 +27,7 @@
 			*(uint64_t *)&(hnd) = 0;	\
 		(hnd).p = val;				\
 	} while (0)
+#define get_xen_guest_handle(hnd) ((hnd).p)
 
 #define __HYPERVISOR_platform_op_raw __HYPERVISOR_platform_op
 
@@ -53,6 +54,7 @@ DEFINE_GUEST_HANDLE(int);
 DEFINE_GUEST_HANDLE(void);
 DEFINE_GUEST_HANDLE(uint64_t);
 DEFINE_GUEST_HANDLE(uint32_t);
+DEFINE_GUEST_HANDLE(uint8_t);
 DEFINE_GUEST_HANDLE(xen_pfn_t);
 DEFINE_GUEST_HANDLE(xen_ulong_t);
 
diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
index 1a371a825c55..5981402fccde 100644
--- a/include/xen/interface/memory.h
+++ b/include/xen/interface/memory.h
@@ -325,4 +325,41 @@ struct xen_mem_acquire_resource {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_mem_acquire_resource);
 
+/*
+ * Copy memory from/to a given domain.
+ */
+#define XENMEM_foreigncopy 29
+struct xen_foreigncopy {
+    /* IN - The domain whose resource is to be copied */
+    domid_t domid;
+
+    /* IN - Flags */
+#define XENMEM_foreigncopy_from 0
+#define XENMEM_foreigncopy_to 1
+#define XENMEM_foreigncopy_direction 1
+    uint16_t flags;
+
+    /*
+     * IN
+     *
+     * As an IN parameter number of frames of the domain to be copied.
+     */
+    uint32_t nr_frames;
+
+    /*
+     * IN
+     *
+     * Frames to be copied.
+     */
+    GUEST_HANDLE(xen_pfn_t) frame_list;
+
+    /*
+     * IN/OUT
+     *
+     * Userspace buffer to read/write from.
+     */
+    GUEST_HANDLE(uint8_t) buffer;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_foreigncopy);
+
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
-- 
2.54.0


