Return-Path: <SRS0=qQdQ=2N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1298DC2D0C0
	for <xen-devel@archiver.kernel.org>; Mon, 23 Dec 2019 12:52:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06752075B
	for <xen-devel@archiver.kernel.org>; Mon, 23 Dec 2019 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06752075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijNBm-0002pp-ES; Mon, 23 Dec 2019 12:51:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z6Dt=2N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ijNBl-0002pk-1O
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 12:51:57 +0000
X-Inumbo-ID: fafe2106-2582-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fafe2106-2582-11ea-a1e1-bc764e2007e4;
 Mon, 23 Dec 2019 12:51:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d16so16473456wre.10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 04:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4f1ZZWUP6o04BiZ5DABbYpSwoVMJkd6SrKiPhHeTudU=;
 b=Z+/J1rMtBdhQ8XzgYTFs6ra0xrKUi0h3+pnuYx2FjN++U5RuxVqsBtwjX99cvur/E+
 7o/2BJ1T3i4SydtD446XJA0iguPy7lfx9u2JbSzv+zxV4eHIpIdQaX9z7w4z6WFR0FPz
 u/TE4vMEjvpoNtigKi7VrW+FoNNLHZWFeX4qEzuLevplAWjMxLnZiqpPpv61eM3yDL8/
 fHDTROsbg4e/mMgnHazBEnFgq2I5zjHPAUKqIlN0DpWNOr3s2yEFJ2M1oyid1ZJbD7PC
 Ss3BTYjDaqewJMjo2MwPCiV75OhFS1swdufWSSCn6KMZXSX/w2c5dP6tVHDVHQQIsohO
 v16g==
X-Gm-Message-State: APjAAAX7j1nxf42/5cm7ek61nX8jbuB2mQpd1FG07v/aRVGWYr/R5MmY
 n3QUvN9pOnOFEJ04BujFrYSOVa8V
X-Google-Smtp-Source: APXvYqyomHQqKKycFEi+v+bY1PzIRg/7vxLRYi1QK8COWY21NdGWjDtehoKNplK0CqV84WKWHBMXsQ==
X-Received: by 2002:adf:f586:: with SMTP id f6mr28913720wro.46.1577105507094; 
 Mon, 23 Dec 2019 04:51:47 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id s10sm20293948wrw.12.2019.12.23.04.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 04:51:46 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Dec 2019 12:51:43 +0000
Message-Id: <20191223125143.30381-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: put hyperv-tlfs.h under viridian
 maintainership
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRB
SU5FUlMKaW5kZXggMDEyYzg0N2ViZC4uZWFlYTQ2MjBlMiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5F
UlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTUxNiw2ICs1MTYsNyBAQCBNOglQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KIFM6CVN1cHBvcnRlZAogRjoJeGVuL2FyY2gveDg2L2h2bS92aXJpZGlh
bi8KIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFuLmgKK0Y6CXhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAogCiBYRU5UUkFDRQogTToJR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
