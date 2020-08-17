Return-Path: <SRS0=Z/2m=B3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E35CC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 15:59:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8D820760
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 15:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ejFB8Wav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8D820760
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hXA-0006zt-U2; Mon, 17 Aug 2020 15:58:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hX9-0006wT-Sg
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:58:51 +0000
X-Inumbo-ID: da20fd55-8b8d-4232-8f1d-d55581380bb2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da20fd55-8b8d-4232-8f1d-d55581380bb2;
 Mon, 17 Aug 2020 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rGvkY8TrcGybqag821UNF0p8CCRDXs6sHOguozE9sNs=;
 b=ejFB8WavEdwckjBEIs/8R9MFUCoOzXLkHk6RC9VQTwdfLQ4/0tepgjOE
 1fvCmpo5eOuTMhHPdjhQh2ccwFqcH4+Ak8kubEcYgEgb+4LK1zaTkxLZ3
 k4IPHwwm2/qZRdn+WNS622p/87gbrE/9CFvQkeyySiTrSLSTcweU9x2F7 w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pabl6xHwqVXCHDOchcvVF3S1xwuLWQmwpaW59MfKncLNlxr2tEsNRP/Ep4lf/44V4IYAyhBnH+
 dbZm90/3yRNvMlo0+N5AAbY8JOX3jVAPF6GiU4aur9xKYl+HNn0HTt7TRbM/ygxjOxin3HfpA0
 pwFdgxN07dni/47bFDnBZjCwclX6F6iv1g+abIqs7f7+akKoNoJlCWXXeJDGQKSwiPXynQ9Yhd
 ebn8AZ6ONeQzsoNBqWa1AZnxr4Dqc/XaVdYBuo9F3i06G0aCxW6qJzlaucdgn9hsRs1DrQCG8W
 eGo=
X-SBRS: 2.7
X-MesageID: 24707111
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24707111"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/8] x86/pv: handle reads to the PAT MSR
Date: Mon, 17 Aug 2020 17:57:53 +0200
Message-ID: <20200817155757.3372-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The value in the PAT MSR is part of the ABI between Xen and PV guests,
and there's no reason to not allow a PV guest to read it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index fd3cbfaebc..ff87c7d769 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -900,6 +900,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
         *val = guest_efer(currd);
         return X86EMUL_OKAY;
 
+    case MSR_IA32_CR_PAT:
+        *val = XEN_MSR_PAT;
+        return X86EMUL_OKAY;
+
     case MSR_K7_FID_VID_CTL:
     case MSR_K7_FID_VID_STATUS:
     case MSR_K8_PSTATE_LIMIT:
-- 
2.28.0


