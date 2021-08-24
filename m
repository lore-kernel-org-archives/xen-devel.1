Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60982C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:02:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3276C6135F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3276C6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171093.312411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCS-0002vX-Bu; Tue, 24 Aug 2021 11:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171093.312411; Tue, 24 Aug 2021 11:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCR-0002tH-I6; Tue, 24 Aug 2021 11:02:35 +0000
Received: by outflank-mailman (input) for mailman id 171093;
 Tue, 24 Aug 2021 11:02:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4I-0001EC-Ep
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:10 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cca786e5-4f1f-443d-b239-80a662657c3a;
 Tue, 24 Aug 2021 10:52:06 +0000 (UTC)
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
X-Inumbo-ID: cca786e5-4f1f-443d-b239-80a662657c3a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YqkngmqbOyk80Ogs6wi6iUK65m5ymQyiAu3hB6RVHmg=;
  b=Jke90/pLQlPPITvYR2vtlKNYEiuOi0NK/SW7aLrBKd6bJuFI3sEmhRY/
   RwQ0qGvjJwfAz+7FafZcw1hQDo/XqHVQTJW1zHPv3F2AcUnKQnIdp+6BK
   ndQUx93MBDBkHRoStzo6Mn0PPasQjtLZ49pj2NXUz4NelBxkMC4pL0hfk
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tquOQgvreHZ6SpW/kIrdxcCK5RvNlb/9U9mUIcI6PsPfp6tv+tSBpkgUIWbEj4uu4v0crj6w1H
 l9s8ID0xDpqeK2mShpWmXt32T4+bA/nzQ9CE83Wmx169ROGkYTAmFwHy03lEiH+Ot+Kc/rMAhb
 MztP8LFrQXGtWiVPDN9vBscTjBxnIZbsgcDjbHDG8mBYDq1h7bl+fTbw9QKXFn5yUy3yozkxOV
 Lek9DPtjTXFuuvZHcgtD4ACt68R10dq/zyYF0Ndf+R7jtOks48J4u6cHtQGHN4ojNaY+Y2NSF6
 k4h2gJWCI+ESC7xJ3xalL90h
X-SBRS: 5.1
X-MesageID: 50772234
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:llMDB6sm5YNCNgSFYh7aJqhQ7skCyoMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6HnBEGBKUm9yXcH2/hpAV7CZnishILGFvAH0WKP+VPd8k7Fh6RgPM
 VbAs9D4bTLZDAX4voSizPIcOrIteP3lZxA8t2urUuFIzsKV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+LqT+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+qeWrCAu1HhPl3ontRrcejau5h+7Qu3+4oowwDX+0eVjUJaKvi/VX4O0aWSAR0R4a
 HxSl8bTr9OAjXqDyyISFLWqnPd+Sdr5Hn4xVCCh3z/5cT/WTIhEsJEwZlUax3D9iMbzadBOY
 9wrhakXqBsfGT9deXGlqn1fgAvklDxrWspkOYVgXAaWYwCaKVJpYha+E9OCp8PEC/z9YhiSY
 BVfYnhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdzs0CmXUL8o47VvB/lq
 35G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJK26WKUSPLtBzB5sMke+E3FwR3pDVRHUl9upPpH
 3xaiIqiYdpQTOSNSSn5uw1zjndBH66QSngjtpD4pQRgMyNeIbW
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772234"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 38/51] build: use main rune to build host binary x86's mkelf32 and mkreloc
Date: Tue, 24 Aug 2021 11:50:25 +0100
Message-ID: <20210824105038.1257926-39-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/Makefile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 8d789d25a3ff..4ea8ade7202c 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -81,6 +81,10 @@ endif
 extra-y += asm-macros.i
 extra-y += xen.lds
 
+hostprogs-y += boot/mkelf32
+HOSTCFLAGS_efi/mkreloc.o := -g
+hostprogs-y += efi/mkreloc
+
 # Allows usercopy.c to includes itself
 $(obj)/usercopy.o: CFLAGS-y += -I.
 
@@ -253,16 +257,10 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-$(obj)/boot/mkelf32: $(src)/boot/mkelf32.c
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-
-$(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
-	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
-
 .PHONY: clean
 clean::
-	rm -f *.lds boot/mkelf32
+	rm -f *.lds
 	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* $(BASEDIR)/.xen.elf32
-	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
+	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
-- 
Anthony PERARD


