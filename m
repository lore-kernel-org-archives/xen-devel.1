Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402DDC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 19:44:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE5D64E10
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 19:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBE5D64E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78451.142727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zh7-0005iC-Ra; Fri, 29 Jan 2021 19:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78451.142727; Fri, 29 Jan 2021 19:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zh7-0005i5-NQ; Fri, 29 Jan 2021 19:44:37 +0000
Received: by outflank-mailman (input) for mailman id 78451;
 Fri, 29 Jan 2021 19:44:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fGyx=HA=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l5Zh6-0005h6-C6
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 19:44:36 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0894075e-2286-4e25-ac99-ad3b55ab7f38;
 Fri, 29 Jan 2021 19:44:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c4so7284886wru.9
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 11:44:35 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x128sm11741573wmb.29.2021.01.29.11.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:34 -0800 (PST)
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
X-Inumbo-ID: 0894075e-2286-4e25-ac99-ad3b55ab7f38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EyheNqEvlweyc8pfqxuPrMO5o2psFbiTPxAsZjVpwhY=;
        b=qIofSNrljqXWbGKGfLARTjbHeVtgwbbs0r4V1umoh0xI3nflgM4nASIiQJuwdA4nua
         rCEzHZUbty2GRBgGs232O1yj1l9BxVGS0ByynTZp6ADBgwwfsSJG/v5N1Q9iyNzVaCr5
         pXQLT81vwATf3D1Z3H4rJHnvI6VyqGxUOs+1fv9RcaIg96ROR1iAFc1sZpOByRTH4ieQ
         quxgo1qxmGtjVtnsXOTWrORxQXwYSMwzBrwZScSujG3k8KTu/4wYtN5nBjpUx94FWnvu
         OBxvjkPHPCFXDA1X3BF4wpwlXZQ7NEzciOKmIU8tNQMkIcp/PKsqrkkrSkl4tz6qhY2V
         FirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=EyheNqEvlweyc8pfqxuPrMO5o2psFbiTPxAsZjVpwhY=;
        b=RjzErxIw3WWRqTUnsIYp9lwpmQ0Tk5AXajZe2Z+yNe4K1rIDKrm5HsuCaEdBk+B+po
         Vbpd2YfzrTnjGj6veiRkorDJ47zr8qknfHKZXqMxONBzO6rNB5a4+IJvD0RLgEtgSf++
         9m61z/k+3gYclEHN3EA7PzkuIwzqghmpbBrw5kIZ/Ud102v4jH8pVwf73ttWBx2ROHyH
         AetRt+Lt9nnGpyRWzuUZPUMCVN4yHqsjEM2PnvjszZ3+5ZKuuBGqkLYQxy9G9YhfkBpu
         +UJEdDgnQfU4ywlJj82/JKdI/Ptd2UqX3EXqypc8pK8DJUj3LwihjWHkUpwDGbKx7FW4
         n+pg==
X-Gm-Message-State: AOAM532UDUZTYF+PG5KqCx5sCwpLLf2qGvldhkNfOZzSPGa1uP6TvruH
	6aoALK2x8INhID+cyLLfZss=
X-Google-Smtp-Source: ABdhPJxL09ql51r7wWVPLwW3CG8HIUlcFhzN37I4sLD69tcHL1fXz5AfhfnyPi5U7coZwKgVsyDz3g==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr6298623wrm.207.1611949474928;
        Fri, 29 Jan 2021 11:44:34 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 3/4] hw/xen/Kconfig: Introduce XEN_PV config
Date: Fri, 29 Jan 2021 20:44:14 +0100
Message-Id: <20210129194415.3925153-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xenpv machine requires USB, IDE_PIIX and PCI:

  /usr/bin/ld:
  libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
  hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
  hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
  hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/Kconfig     | 1 +
 hw/xen/Kconfig | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..f2a95591d94 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -39,6 +39,7 @@ source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
 source watchdog/Kconfig
+source xen/Kconfig
 
 # arch Kconfig
 source arm/Kconfig
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 00000000000..15944144a17
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,6 @@
+config XEN_PV
+    bool
+    depends on XEN
+    select PCI
+    select USB
+    select IDE_PIIX
-- 
2.26.2


