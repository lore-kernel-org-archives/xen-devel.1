Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975FC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:48:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392545.1631506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvs5A-0003KP-Ro; Mon, 17 Aug 2026 07:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392545.1631506; Mon, 17 Aug 2026 07:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvs5A-0003KI-NK; Mon, 17 Aug 2026 07:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1392545;
 Mon, 17 Aug 2026 07:48:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wvs59-0003KC-OI
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:48:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvs58-002elg-MR
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:48:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a82bcc2-2eae-0a2a0a5409dd-0a2a4503b280-42
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:48:30 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=MkDe=GK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a82bcce-fae8-0a2a45030019-8c4da68a8642-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:48:30 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 1AF63A1A90;
 Mon, 17 Aug 2026 09:48:30 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CuBQUkflgoT; Mon, 17 Aug 2026 09:48:30 +0200 (CEST)
Received: from end (lfbn-orl-1-1611-126.w90-107.abo.wanadoo.fr
 [90.107.165.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id D9935A017F;
 Mon, 17 Aug 2026 09:48:29 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wvs57-0000000BsRc-1soM; Mon, 17 Aug 2026 09:48:29 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786952910; bh=0ByJzqXOBXfucz5dqyG4+tO5WyPtI4O40so7/UY9C3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyfaWnBMShoIH6RYxw7YPAb02UffqTe7/H/hDV7C7utkws/CqAwg6MHPKHVPn1dB3
	 tYh+3yES8ca2IjAkg+KoAhamOr5zfunIJJYLCmBmulVQO8LyeppUj6TPxLlQClBCOi
	 95U5c/jCDedrfUxMqAfeRvvJ7jYtuMZuRZizkE5Kl9Phd52sR3KgJ9y7kTvmBxMVQ5
	 aF4qyO8p9olN16VxyojJWV4L7sa/SaBD4IUCnuMPQ0tYpyhjYZQZh/cLi6b0VyIhJY
	 WzFIvRNJm/tLijSs+yRjAlrcACZslPGs4aHnlQoOldb3kNRwVUGc0NvENyz6/OPha/
	 Cz3JueWT0W5VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1786952909; bh=0ByJzqXOBXfucz5dqyG4+tO5WyPtI4O40so7/UY9C3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+0Kiq1uX5a7bHAiXatbWjvmXjlBkICXvdc3O20kVY70T2205OeR5wCF270mN384F
	 Ie72yW4W3on9AwPsVc1q18kAvksi4dXf2rUmTwEkTdM33ezNfhpFGpze/PKhnCVzM0
	 7pULO6lhLGSVIGs7cgIe3+yVDtLJulrOGtCLyAxcc+3AlOdsGcyy6yAIawziNTZVH8
	 pC/Hc9goxQ/C6R745LOMZzGrMnKBmGJ3nifrr9KNSefyVs0MLZhMRMbvExLeEI9LYp
	 rzMqfeEXEMS9T1lbVRz2gmJUEwol5hYzyImgC96IoLltEeTDD7umpj0jCcxxvEBav2
	 haP8IEz7S3zzA==
Date: Mon, 17 Aug 2026 09:48:29 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <aoK8zVAP0C0ksD_0@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817071843.114898-3-jgross@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-33051d/1786952910-6E2D04E9-BF884B23/0/0
X-purgate-type: clean
X-purgate-size: 8752

Hello,

Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
> There is no user of libpci left in stubdoms.
> 
> Remove libpci from the stubdom build system.

Wouldn't it be useful to keep this for anybody who would want to drive a
PCI card from a stubdomain?

I mean, in the zlib case, it's really a mere question of build & link,
so we don't need to ship it, people can do it themselves easily like for
any other library.

But here there is actual porting work, that we'd better not lose but
keep shipping.

Samuel

> ---- pciutils-2.2.9.orig/lib/minios.c	1970-01-01 01:00:00.000000000 +0100
> -+++ pciutils-2.2.9/lib/minios.c	2008-07-01 12:31:40.554260000 +0100

> -@@ -0,0 +1,106 @@
> -+/*
> -+ *	The PCI Library -- MiniOS PCI frontend access
> -+ *
> -+ *	Samuel Thibault <samuel.thibault@eu.citrix.com>, 2008
> -+ *
> -+ *	Can be freely distributed and used under the terms of the GNU GPL.
> -+ */
> -+
> -+#include <os.h>
> -+#include <pcifront.h>
> -+#include <xenbus.h>
> -+#include "internal.h"
> -+
> -+static int
> -+minios_detect(struct pci_access *a)
> -+{
> -+  return 1;
> -+}
> -+
> -+static void
> -+minios_init(struct pci_access *a)
> -+{
> -+}
> -+
> -+static void
> -+minios_cleanup(struct pci_access *a)
> -+{
> -+  shutdown_pcifront(NULL);
> -+}
> -+
> -+static void
> -+minios_scan(struct pci_access *a)
> -+{
> -+  void func(unsigned int domain, unsigned int bus, unsigned int slot, unsigned int fun)
> -+  {
> -+    struct pci_dev *d = pci_alloc_dev(a);
> -+
> -+    d->domain = domain;
> -+    d->bus = bus;
> -+    d->dev = slot;
> -+    d->func = fun;
> -+
> -+    pci_link_dev(a, d);
> -+  }
> -+
> -+  pcifront_scan(NULL, func);
> -+}
> -+
> -+static int
> -+minios_read(struct pci_dev *d, int pos, byte *buf, int len)
> -+{
> -+  unsigned int val;
> -+  switch (len) {
> -+    case 1:
> -+      if (pcifront_conf_read(NULL, d->domain, d->bus, d->dev, d->func, pos, len, &val))
> -+        return 0;
> -+      * buf = val;
> -+      return 1;
> -+    case 2:
> -+      if (pcifront_conf_read(NULL, d->domain, d->bus, d->dev, d->func, pos, len, &val))
> -+        return 0;
> -+      *(u16 *) buf = cpu_to_le16((u16) val);
> -+      return 1;
> -+    case 4:
> -+      if (pcifront_conf_read(NULL, d->domain, d->bus, d->dev, d->func, pos, len, &val))
> -+        return 0;
> -+      *(u32 *) buf = cpu_to_le32((u32) val);
> -+      return 1;
> -+    default:
> -+      return pci_generic_block_read(d, pos, buf, len);
> -+  }
> -+}
> -+
> -+static int
> -+minios_write(struct pci_dev *d, int pos, byte *buf, int len)
> -+{
> -+  unsigned int val;
> -+  switch (len) {
> -+    case 1:
> -+      val = * buf;
> -+      break;
> -+    case 2:
> -+      val = le16_to_cpu(*(u16 *) buf);
> -+      break;
> -+    case 4:
> -+      val = le32_to_cpu(*(u32 *) buf);
> -+      break;
> -+    default:
> -+      return pci_generic_block_write(d, pos, buf, len);
> -+  }
> -+  return !pcifront_conf_write(NULL, d->domain, d->bus, d->dev, d->func, pos, len, val);
> -+}
> -+
> -+struct pci_methods pm_minios = {
> -+  "MiniOS-device",
> -+  NULL,                                 /* config */
> -+  minios_detect,
> -+  minios_init,
> -+  minios_cleanup,
> -+  minios_scan,
> -+  pci_generic_fill_info,
> -+  minios_read,
> -+  minios_write,
> -+  NULL,                                 /* dev_init */
> -+  NULL                                  /* dev_cleanup */
> -+};
> ---- pciutils-2.2.9/lib/generic.c	2007-02-06 12:00:05.000000000 +0000
> -+++ pciutils-2.2.9-mine/lib/generic.c	2008-07-01 19:13:52.289949000 +0100
> -@@ -74,6 +74,19 @@
> -   pci_generic_scan_bus(a, busmap, 0);
> - }
> - 
> -+static u32 pci_size(u32 base, u32 maxbase, u32 mask)
> -+{
> -+  u32 size = mask & maxbase;
> -+  if (!size)
> -+    return 0;
> -+  size = (size & ~(size-1)) - 1;
> -+
> -+  if (base == maxbase && ((base | size) & mask) != mask)
> -+    return 0;
> -+
> -+  return size + 1;
> -+}
> -+
> - int
> - pci_generic_fill_info(struct pci_dev *d, int flags)
> - {
> -@@ -114,23 +127,61 @@
> - 	      if (!x || x == (u32) ~0)
> - 		continue;
> - 	      if ((x & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO)
> --		d->base_addr[i] = x;
> --	      else
> -+                {
> -+                  d->base_addr[i] = x & PCI_BASE_ADDRESS_IO_MASK;
> -+                  if (flags & PCI_FILL_SIZES)
> -+                    {
> -+                      u32 size;
> -+                      pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, ~0);
> -+                      d->size[i] = pci_size(x, pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4), PCI_BASE_ADDRESS_IO_MASK);
> -+                      pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, x);
> -+                    }
> -+                }
> -+              else
> - 		{
> - 		  if ((x & PCI_BASE_ADDRESS_MEM_TYPE_MASK) != PCI_BASE_ADDRESS_MEM_TYPE_64)
> --		    d->base_addr[i] = x;
> -+                    {
> -+                      d->base_addr[i] = x & PCI_BASE_ADDRESS_MEM_MASK;
> -+                      if (flags & PCI_FILL_SIZES)
> -+                        {
> -+                          u32 size;
> -+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, ~0);
> -+                          d->size[i] = pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4);
> -+                          d->size[i] = pci_size(x, pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4), PCI_BASE_ADDRESS_MEM_MASK);
> -+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, x);
> -+                        }
> -+                    }
> - 		  else if (i >= cnt-1)
> - 		    a->warning("%04x:%02x:%02x.%d: Invalid 64-bit address seen for BAR %d.", d->domain, d->bus, d->dev, d->func, i);
> - 		  else
> - 		    {
> - 		      u32 y = pci_read_long(d, PCI_BASE_ADDRESS_0 + (++i)*4);
> - #ifdef PCI_HAVE_64BIT_ADDRESS
> --		      d->base_addr[i-1] = x | (((pciaddr_t) y) << 32);
> -+		      d->base_addr[i-1] = (x | (((pciaddr_t) y) << 32)) & PCI_BASE_ADDRESS_MEM_MASK;
> -+                      if (flags & PCI_FILL_SIZES)
> -+                        {
> -+                          u32 size;
> -+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, ~0);
> -+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, ~0);
> -+                          d->size[i-1] = pci_size(y, pci_read_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4) | 
> -+                                         pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4), 0xffffffff );
> -+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, x);
> -+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, y);
> -+                        }
> - #else
> - 		      if (y)
> - 			a->warning("%04x:%02x:%02x.%d 64-bit device address ignored.", d->domain, d->bus, d->dev, d->func);
> - 		      else
> --			d->base_addr[i-1] = x;
> -+                        {
> -+                          d->base_addr[i-1] = x & PCI_BASE_ADDRESS_MEM_MASK;
> -+                          if (flags & PCI_FILL_SIZES)
> -+                            {
> -+                              u32 size;
> -+                              pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, ~0);
> -+                              d->size[i-1] = pci_size(x, pci_read_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4), PCI_BASE_ADDRESS_MEM_MASK);
> -+                              pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, x);
> -+                            }
> -+                        }
> - #endif
> - 		    }
> - 		}
> -@@ -154,10 +205,19 @@
> - 	{
> - 	  u32 u = pci_read_long(d, reg);
> - 	  if (u != 0xffffffff)
> --	    d->rom_base_addr = u;
> -+            {
> -+              d->rom_base_addr = u;
> -+              if (flags & PCI_FILL_SIZES)
> -+                {
> -+                  u32 size;
> -+                  pci_write_long(d, reg, ~0);
> -+                  d->rom_size = pci_read_long(d, reg);
> -+                  pci_write_long(d, reg, u);
> -+                }
> -+            }
> - 	}
> -     }
> --  return flags & ~PCI_FILL_SIZES;
> -+  return flags;
> - }
> - 
> - static int
> -diff -uNpbE -uNpbEr pciutils-2.2.9.orig/lib/sysdep.h pciutils-2.2.9/lib/sysdep.h
> ---- pciutils-2.2.9.orig/lib/sysdep.h	2007-02-06 12:00:18.000000000 +0000
> -+++ pciutils-2.2.9/lib/sysdep.h	2009-07-22 16:26:30.000000000 +0100
> -@@ -32,6 +32,10 @@ typedef u16 word;
> - 
> - #else
> - 
> -+#ifdef PCI_OS_MINIOS
> -+#include <machine/endian.h>
> -+#endif
> -+
> - #ifdef PCI_OS_LINUX
> - #include <endian.h>
> - #define BYTE_ORDER __BYTE_ORDER
> -- 
> 2.55.0

