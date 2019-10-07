Return-Path: <SRS0=0Q+7=YA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E82C47404
	for <xen-devel@archiver.kernel.org>; Mon,  7 Oct 2019 15:13:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3C82070B
	for <xen-devel@archiver.kernel.org>; Mon,  7 Oct 2019 15:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uS/ydvqj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3C82070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUhd-0006mJ-O3; Mon, 07 Oct 2019 15:13:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhc-0006lv-N4
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:36 +0000
X-Inumbo-ID: ff994f88-e914-11e9-8c93-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff994f88-e914-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:20 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id u22so19590655qtq.13
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otLA6Fkhh5XtEMm18WJHRmnbLI/KLG2HVoo+fAaHpwc=;
 b=uS/ydvqjYgsU+TkaZObT078vcuiFapvWDFxkjqJQp/mDii9wFX6XkQondnXjzTkoJe
 hyMHonLmENRjqrSOkBRlM+khMiZkptTqWDnJTw23p/mZoGWYh5za3cQm5otOxowHG4xB
 5F82+l5bvpSNFuCzHHx5OAs71UzQVrwsm5PB08Hh8qX60VE/WHhnqIJlQkYaqtEgw3e+
 nxX8oWEbYk+MkJxAjpyiIlGWbi7Zh47tum/L38SbzF0lGtPEPvVeytPpRGCVfVcsoDzV
 51HelY5iuAn7XBYRmLUxdhJ/tPxnjH0ICUiXv6LQdH6EwMpMe2IcX/2Yq26AX3+t59Ex
 q4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otLA6Fkhh5XtEMm18WJHRmnbLI/KLG2HVoo+fAaHpwc=;
 b=ugIMXGP+ph3GLpT64ahm7UEfixSRqiMKUv25Q+nOXQlXm7/SLaHcqL+HFoAx60QlWz
 zZdFYxmlX7IVz6VNCbC+BnfyvvS88DhNIRo5Kj3BL/FRStWy3gpPR4LhTaIYbvpf9/NI
 qQNCPQvWCu7QejINZZ1ea05xBAQoLTLQggLvBZ2r/SgoAB7AZcZv0Abg9L5XrMnatbGT
 aXpczORLNTVMbSClUyxoKm8j1X9l0QdHtm997WK1dKUdlwBvpDRMHHroSUfGLtyRnp6/
 oTwVTq1tLNX5c+AihvcmbU0jDU8THMAR2Z+aQeOJdrEoxe8wqHffFh7l3CyBochUmlqb
 2/pg==
X-Gm-Message-State: APjAAAWJ6QFzHDe36JHqUzyf6xL+9v+7WOwevJojgCe4n5tqljstYpPA
 glbzmIv/buhfMwBVjxi3tt+R9b48
X-Google-Smtp-Source: APXvYqyry27NHhLb8boxb+vIO2WAi4BT6bDhk4JQ7OADkVD/6ZJqu3tFI2fDghE6yD19phS1yr4FFA==
X-Received: by 2002:a0c:ebc4:: with SMTP id k4mr24633678qvq.250.1570461200223; 
 Mon, 07 Oct 2019 08:13:20 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:19 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:51 -0400
Message-Id: <f6466d1ade43ae7d865323b18480ce6b1437a63f.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 04/24] golang/xenlight: define Devid type as int
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQpDYzogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKIHRvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0Lmdv
IGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDdiZjE2ZGMwM2IuLjRk
NGZhZDJhOWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwor
KysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTgxLDYgKzgxLDkgQEAg
ZnVuYyAoZSBFcnJvcikgRXJyb3IoKSBzdHJpbmcgewogCiB0eXBlIERvbWlkIHVpbnQzMgogCisv
LyBEZXZpZCBpcyBhIGRldmljZSBJRC4KK3R5cGUgRGV2aWQgaW50CisKIHR5cGUgTWVtS0IgdWlu
dDY0CiAKIHR5cGUgVXVpZCBDLmxpYnhsX3V1aWQKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
