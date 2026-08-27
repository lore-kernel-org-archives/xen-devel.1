Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CFFC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400922.1636567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvF-0006i4-Ia; Thu, 27 Aug 2026 15:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400922.1636567; Thu, 27 Aug 2026 15:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvF-0006hO-CR; Thu, 27 Aug 2026 15:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1400922;
 Thu, 27 Aug 2026 15:21:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvE-0006Qz-JL
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvD-009ksf-WD
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9055fd-2eae-0a2a0a5409dd-0a2a45029cdc-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:43 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905607-6ca4-0a2a45020019-d155dd36ac20-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:43 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-482e5733a5aso1156807f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:43 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844103; x=1788448903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPn9hd/dxW4y06CkNL4I3sE+dR/SRrFH1F3U453rsZE=;
        b=iZ7JnqyD32V8P3Cs1pG4IicBwa+Xhx3Txpih/X/+bkRNxvqLJyNBxK1KYWPl0g+ivP
         SpQ683E05Vj9bB5f9dE80LD5O9qcdA4Fw8teyuZXSFwoOFFJplzwErVXeNGjFMA4bm+u
         L3ToSghfrfjCmNkYSqzT8wM+leFDuLf+duAP0+jpgnGFntOECO3v9VxMaO5jupk6znSr
         VHr+a5MrcKGZ0O1lrVsSXVeG3PBAk/NbYU/t0fWVhYA3dLDbD7fPhKUMrwrfotjFcGQn
         hqZqa197/o2SUgL3X6ISLk60xSICcCxi83DQSW2lDN0MVEm/6ei02p/qZcHcRSY0DRlw
         FsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844103; x=1788448903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPn9hd/dxW4y06CkNL4I3sE+dR/SRrFH1F3U453rsZE=;
        b=L/0NUhWUefDFTzoHU7bQ/FABgcHgMrfLjp07vSx5pRAu8idxRGiEPL6R3vSPQrGV7e
         T3/WTmfyoeBUxK/evuc2WV4b2vfC8jRibyFGCiUQ8Lw1eIWWZlXDeKVfC9mNhNYtd5hu
         2VbFCRilEZyY6Ma2dIie10ath/2k3VXSw2Y8CNdjkG49ueguZEvwuUZCO7iOw3KuAOel
         QpUrm/ZhVHM3TvZgUdLiXuG3/7Cu6bSe9uV0oGV1mK8d5iPWTwdJknlIx7AIgBTM1UpX
         dOroRoKk79NxH7h/OQkvSRnYZbWDAnE2WThs0tHvyAwjivWRe82GI8n8rV4i4FZHVBQy
         YxeQ==
X-Gm-Message-State: AFuF++nGrpl486mZltFgzihnHo0Ioq8qILLKtbmIeKOsIJC8ufKhY1Sv
	4oM9r4cw0xvPX5p0KYqK010NYmjTw1lvNuIcItHvNZ7L9EqyQImR9zYEFssVvw==
X-Gm-Gg: AR+sD13xbCSrmfzb7AvnIhqg8ni4VrqZgigWdnctGTQ+sU5MdDjtcVi4ReWlbEj9Y/h
	M44IcbXHPBEBrUI/znCgCT8Zd5qZiGIEzCG78p4azE08d7LZNYOCTkrQenP1y31S4S639n+wpUz
	6w3htmp1QLJ7LZwal8SmrCKq8xXi6U2yghuVDSSE7VYz5jFFd6MTGIeZv74f5o+JAilDXjGypVy
	ypXPTpi6v5L8Y3K3kOFfUyVR5+7u6ET11Vu4E2s1Tsnj6DBuic91990DhIhTfa7IVBbjf0FBT/P
	MVadxNnlsKC7bqIml2so+YCMJxshMP0AcyTDCxQCo2660naRadgwIsr40xuHHMO7WqiiDtdbNLm
	HxJjk44N/VxZuiR2FY6uabCTQdtflNPdsBvgkho70UywlxxeMjY5M6qV0JwLSvzyuOfJrkZEWqJ
	pSUfoGBJVIhkFuo0B3G/mOJL7OEeMrgIE88OtKstn/kZrxkjWWV5AWSbPYYiJyNks2R0V6Pb2a4
	EXduQ/K9zjOQdnIRsy9ycSLMpGO6GIRG7lyR+Ycit4=
X-Received: by 2002:a05:600c:8518:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-499dc6e998cmr210340905e9.3.1787844103281;
        Thu, 27 Aug 2026 08:21:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL
Date: Thu, 27 Aug 2026 17:20:47 +0200
Message-ID: <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844103-F26B72AC-C6CE6752/10/73395122804
X-purgate-type: spam
X-purgate-size: 2025

hstatus.VSXL is WARL, so its reset value is implementation-defined. Xen
supports 64-bit guests only, so program it explicitly instead of relying
on whatever the hardware happens to leave there.

This matters beyond the guest's own view of itself: decoding a trapped
instruction depends on the effective XLEN of the guest, as the encodings
which exist for XLEN=64 only must not be recognized for a 32-bit one.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - new patch
---
---
 xen/arch/riscv/domain.c                     | 8 +++++++-
 xen/arch/riscv/include/asm/riscv_encoding.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index d94652809e36..57c37cb2dfc2 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -88,7 +88,13 @@ static void vcpu_csr_init(struct vcpu *v)
 {
     v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
 
-    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
+    /*
+     * Xen supports 64-bit guests only, so set the guest's XLEN explicitly
+     * rather than leaving it to the WARL behaviour of hstatus.VSXL, which the
+     * decoding of a trapped instruction depends on.
+     */
+    vcpu_guest_cpu_user_regs(v)->hstatus =
+        HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(HSTATUS_VSXL_64, HSTATUS_VSXL);
 
     v->arch.hideleg = HIDELEG_DEFAULT & csr_masks.hideleg;
 
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 03e186bcdb8c..c63e5e304691 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -68,6 +68,8 @@
 #if __riscv_xlen == 64
 #define HSTATUS_VSXL			_UL(0x300000000)
 #define HSTATUS_VSXL_SHIFT		32
+#define HSTATUS_VSXL_64			_UL(2)
+#define HSTATUS_VSXL_32			_UL(1)
 #endif
 #define HSTATUS_VTSR			_UL(0x00400000)
 #define HSTATUS_VTW			_UL(0x00200000)
-- 
2.55.0


