Return-Path: <SRS0=nADe=3U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509E8C33CB7
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jan 2020 17:49:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29C6922522
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jan 2020 17:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qY7rrW0y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29C6922522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaQM-0005s4-Su; Fri, 31 Jan 2020 17:49:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQL-0005rn-IG
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:49:45 +0000
X-Inumbo-ID: 0d301422-4452-11ea-ad98-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d301422-4452-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so8892727wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukFC00hv0LSjsqkLHJaQ2pzoEWeQaG6eI/AMe7Aox9U=;
 b=qY7rrW0y+KtfcnTPkFKPLQUp356gelkjDS2iQfTBVrNBzxXmXJOAsgaZa9ZiBpUfib
 mqiDb/OLZzLUoblYXbPe8SL8RsiwvSpQdOTiUKeB0Oh+ZlwV7hjuFb/Igmg60cJRvyxr
 pZv2mYe5VvUs4mytYNVHTSj+X7nwdKw5s1hjR1dWf5s8dpQQ67PJLgkngK/9Cv92Gzro
 7wrkWkK+Gdi7FnzyzWYxk0t8/5xLLIceW5uAMQQ9G0CgZfQMI+mFGmRQmkzocHOIOw+p
 /Qa24Mu88IS1B3ixgdO3saRR1+9tOonPrz7XTJcxl3zaPD1xvlgXW27rI/MfX1Hfenzk
 P4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ukFC00hv0LSjsqkLHJaQ2pzoEWeQaG6eI/AMe7Aox9U=;
 b=kBiKH8X2qNJlOs8M2yGfUlPAyyRfdir+ezyQV8+NRf8B1B7J4yYOp8a1GYe9o9mQmG
 8VcaTymFdRU46Pn/qAzbzCv/c+OTX4YqtDPOX4WlKfoiBT1M0wsfQg59i8eotnlM3ND2
 ijbfBeZNvrHzKHMmrSC5PBh8o4u/gggMPwCri5KeXEQSP38m2cw82Q+4yk5RppvVT+mA
 QZBxM/uLa/KKLf7sdcKrjP7RuyA1mw3RKG3b2oeEyvxcr6ew0sYYvPhY6NBNsUiQDAD9
 P2g02cmATTFhr4W9dkfpgE+8jImwEfAp6ss+KZB5Jfs1tjYsxlpVex3DVrlKd7tcmMEw
 f3ug==
X-Gm-Message-State: APjAAAVB4ADlN3GqAWvckORTFvoP66baqb56pFdFte5QGtTaGiTCkJye
 ymtJBf+hWijyp82tQ91MJRzGNQ0zhJY=
X-Google-Smtp-Source: APXvYqwuyZmsavJInbCXnvE8ycz7lQmctHDLiPtR/S/g4V0xekdfLUqCPu3n8w8cvXI8duzu5MjVOw==
X-Received: by 2002:a05:600c:20c6:: with SMTP id
 y6mr13273447wmm.95.1580492978224; 
 Fri, 31 Jan 2020 09:49:38 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:37 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:21 +0000
Message-Id: <20200131174930.31045-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131174930.31045-1-liuwe@microsoft.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 02/11] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHVzaCBoeXBlcnZpc29yX2FwX3NldHVwIGRvd24gdG8gc21wX2NhbGxpbi4KClRha2UgdGhlIGNo
YW5jZSB0byByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIGNwdV9oYXNfaHlwZXJ2aXNvci4KClNpZ25l
ZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+ClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgMTAg
KysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3Nt
cGJvb3QuYwppbmRleCBjOWQxYWI0NDIzLi45M2I4NmEwOWU5IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTE5OSw2ICsx
OTksMTMgQEAgc3RhdGljIHZvaWQgc21wX2NhbGxpbih2b2lkKQogICAgICAgICBnb3RvIGhhbHQ7
CiAgICAgfQogCisgICAgaWYgKCBjcHVfaGFzX2h5cGVydmlzb3IgJiYgKHJjID0gaHlwZXJ2aXNv
cl9hcF9zZXR1cCgpKSAhPSAwICkKKyAgICB7CisgICAgICAgIHByaW50aygiQ1BVJWQ6IEZhaWxl
ZCB0byBpbml0aWFsaXNlIGh5cGVydmlzb3IgZnVuY3Rpb25zLiBOb3QgY29taW5nIG9ubGluZS5c
biIsIGNwdSk7CisgICAgICAgIGNwdV9lcnJvciA9IHJjOworICAgICAgICBnb3RvIGhhbHQ7Cisg
ICAgfQorCiAgICAgaWYgKCAocmMgPSBodm1fY3B1X3VwKCkpICE9IDAgKQogICAgIHsKICAgICAg
ICAgcHJpbnRrKCJDUFUlZDogRmFpbGVkIHRvIGluaXRpYWxpc2UgSFZNLiBOb3QgY29taW5nIG9u
bGluZS5cbiIsIGNwdSk7CkBAIC0zNzEsOSArMzc4LDYgQEAgdm9pZCBzdGFydF9zZWNvbmRhcnko
dm9pZCAqdW51c2VkKQogCiAgICAgdHN4X2luaXQoKTsgLyogTmVlZHMgbWljcm9jb2RlLiAgTWF5
IGNoYW5nZSBITEUvUlRNIGZlYXR1cmUgYml0cy4gKi8KIAotICAgIGlmICggeGVuX2d1ZXN0ICkK
LSAgICAgICAgaHlwZXJ2aXNvcl9hcF9zZXR1cCgpOwotCiAgICAgc21wX2NhbGxpbigpOwogCiAg
ICAgc2V0X2NwdV9zaWJsaW5nX21hcChjcHUpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
