Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD09C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459CA214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459CA214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8g-0004Qk-La; Mon, 22 Apr 2019 16:49:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8f-0004Qe-N1
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:49:53 +0000
X-Inumbo-ID: a6946122-651e-11e9-9db4-1b290d8ec6c6
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a6946122-651e-11e9-9db4-1b290d8ec6c6;
 Mon, 22 Apr 2019 16:49:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B70BDEBD;
 Mon, 22 Apr 2019 09:49:52 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35DE3F557;
 Mon, 22 Apr 2019 09:49:50 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:18 +0100
Message-Id: <20190422164937.21350-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 01/20] xen/const: Introduce _BITUL and _BITULL
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
Cc: sstabellini@kernel.org, Andrii_Anisov@epam.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164918.R9MJCcU7r_K6wVujk9IBBl-qLQ9_AkhCKXHMg5O0sWg@z>

VGhlIHBhdHRlcm4gX0FDKDEsIFVMeyxMfSkgPDwgWCBpcyBjb21tb25seSB1c2VkIGluIHRoZSBo
ZWFkZXJzIHRvIG1ha2UKZGVmaW5lIHVzdWFibGUgaW4gYm90aCBhc3NlbWJseSBhbmQgQy4KClNv
IGludHJvZHVjZSBfQklUVUwgYW5kIF9CSVRVTEwgdG8gbWFrZSB0aGUgY29kZSBzbGlnaHRseSBt
b3JlIHJlYWRhYmxlLgoKVGhlIGlkZWEgaGFzIGJlZW4gdGFrZW4gZnJvbSBMaW51eCAoc2VlIGlu
Y2x1ZGUvdWFwaS9saW51eC5oKS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2luY2x1ZGUveGVuL2NvbnN0LmggfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi9jb25zdC5oIGIveGVuL2luY2x1ZGUveGVuL2NvbnN0LmgKaW5kZXggMGQ1YjJjNjRmNS4uYjRi
MDY3YmZmYSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbnN0LmgKKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2NvbnN0LmgKQEAgLTIxLDQgKzIxLDcgQEAKICNkZWZpbmUgX0FUKFQsWCkJKChU
KShYKSkKICNlbmRpZgogCisjZGVmaW5lIF9CSVRVTCh4KQkoX0FDKDEsIFVMKSA8PCAoeCkpCisj
ZGVmaW5lIF9CSVRVTEwoeCkJKF9BQygxLCBVTEwpIDw8ICh4KSkKKwogI2VuZGlmIC8qIF9fWEVO
X0NPTlNUX0hfXyAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
