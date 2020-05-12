Return-Path: <SRS0=FkqA=62=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA65CC54E8D
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 03:40:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB67D20730
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 03:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4r+etRu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB67D20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYLlw-0003NL-Jp; Tue, 12 May 2020 03:40:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfNj=62=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYLlv-0003NG-0f
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 03:39:59 +0000
X-Inumbo-ID: 40994586-9402-11ea-9887-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40994586-9402-11ea-9887-bc764e2007e4;
 Tue, 12 May 2020 03:39:58 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f83so12247152qke.13
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2020 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bBz+Wc4i15Xaa7Low+S4PQ1PMoRJwgeHjDfzODciz8o=;
 b=D4r+etRuXVxrryh503ZaEC9beU5bc6ueG+kH0Rf+Sd7ay849aiEOdhJ2qqpvwXHQ2Y
 LWd+O3nkW9A76qsEOMWY/qPI5aSvlDbrzMvCJOmxcixBaEV9BvEoTJSGWiuiR/1m2kCc
 IRmVFThDK94I+JFvn/EIYDXMwy35nhuYn/ijHZSmacbiLUzfExt8rjfkk7Id0aKJUP9N
 fVbA7d6CyB5ayml5pTPDNpBiMeSK28icF5gDAouFkf0EcB5c8m9pDsigkXy34PRTsHqX
 rVzC9dpxmWINGEE1742xwzhee2ai3B1OiS6FE/G1ibJ6YzcUaA9g06joEswbL7EcX2kR
 qTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bBz+Wc4i15Xaa7Low+S4PQ1PMoRJwgeHjDfzODciz8o=;
 b=Tfne6WTvI4L69Z64I8KQnifxsuG08wXAL0AbpYr6mMzdBA1DtnMEve70B2qH3Doymm
 W0YAIe0CCiOe5IUd+1QzR1Ezqg7hrCtWoYtmM9R+u0r2RUA9CHpfb0fJ5kqhvcDW0v0z
 pI76bQbHfWyCPjoCsOf9FcXRaTOgoa1AkxyGcmZ2iEMZeTxzU7w/+KApRQtTo4Lv+Fhp
 kpftEk50qbPrQKYTrWe8UZlGgpOEYksBTDMdy8avwx4bxqcW8O/vcx5qrNIkED1hky6o
 RVId2Efm9hN5vhZUuwjJcICW5ppMI1Fk3aHkI/DqF678pth/Rx9oBrEFSz7CzgNa4uCV
 IRdA==
X-Gm-Message-State: AGi0PuYAe+FowLEaqYONVJNyp0OLUZANYnPIcjljicpAEwOSWeIu+gkV
 rN2vS8oxHA5bKpqK42SGOkpPx8TS
X-Google-Smtp-Source: APiQypI9yIaAepvPI+TXIcnJmSWXzL8apyulQs63gvY3BBJ0mLroccr7+04ljGsChcmzx8LLiKJBWA==
X-Received: by 2002:a37:628b:: with SMTP id
 w133mr18860699qkb.185.1589254797642; 
 Mon, 11 May 2020 20:39:57 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:54fc:f6ff:ea10:3d73])
 by smtp.gmail.com with ESMTPSA id w35sm1107092qtk.51.2020.05.11.20.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 20:39:56 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] Fixups for fcf-protection
Date: Mon, 11 May 2020 23:39:46 -0400
Message-Id: <20200512033948.3507-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Two patches to fix building with a cf-protection toolchain.  The first
handles the case where the compiler fails to run with "error:
‘-mindirect-branch’ and ‘-fcf-protection’ are not compatible".

The second fixes a runtime error that prevented Xen booting in legacy
mode.

I still haven't figured out exactly what is wrong with rombios and/or
ipxe.

Jason Andryuk (2):
  xen/x86: Disable fcf-protection when necessary to build
  x86/boot: Drop .note.gnu.properties in build32.lds

 xen/arch/x86/arch.mk          | 11 ++++++++++-
 xen/arch/x86/boot/build32.lds |  5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1


