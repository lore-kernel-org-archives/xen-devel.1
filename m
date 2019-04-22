Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A092C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303E021738
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 303E021738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc91-0005Kr-0n; Mon, 22 Apr 2019 16:50:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8z-0005Ie-Sj
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:13 +0000
X-Inumbo-ID: b24e7016-651e-11e9-8ecb-6bad741746e0
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b24e7016-651e-11e9-8ecb-6bad741746e0;
 Mon, 22 Apr 2019 16:50:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B674374;
 Mon, 22 Apr 2019 09:50:12 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BCE13F557;
 Mon, 22 Apr 2019 09:50:11 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:33 +0100
Message-Id: <20190422164937.21350-17-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164933.99RTaXf_dRR33Gyml7HU5hFFkgT_csJQ4HgFbjnAx4M@z>

VGhlIGZ1bmN0aW9uIGNyZWF0ZV94ZW5fZW50cmllcyBtYXkgYmUgY29uY3VycmVudGx5IGNhbGxl
ZC4gU28gd2UgbmVlZAp0byBwcm90ZWN0IHdpdGggYSBzcGlubG9jayB0byBhdm9pZCBjb3JydXB0
aW9uIHRoZSBwYWdlLXRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5j
IGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggZmEwZjQxYmQwNy4uZWNkZTRlMzRkZiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTk2OSw2
ICs5NjksOCBAQCBlbnVtIHhlbm1hcF9vcGVyYXRpb24gewogICAgIFJFU0VSVkUKIH07CiAKK3N0
YXRpYyBERUZJTkVfU1BJTkxPQ0soeGVuX3B0X2xvY2spOworCiBzdGF0aWMgaW50IGNyZWF0ZV94
ZW5fZW50cmllcyhlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZpcnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtZm5fdCBtZm4sCkBAIC05ODAsNiArOTgyLDggQEAgc3RhdGljIGludCBjcmVhdGVfeGVu
X2VudHJpZXMoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAogICAgIGxwYWVfdCBwdGUsICplbnRy
eTsKICAgICBscGFlX3QgKnRoaXJkID0gTlVMTDsKIAorICAgIHNwaW5fbG9jaygmeGVuX3B0X2xv
Y2spOworCiAgICAgZm9yKDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgbWZu
ID0gbWZuX2FkZChtZm4sIDEpKQogICAgIHsKICAgICAgICAgZW50cnkgPSAmeGVuX3NlY29uZFtz
ZWNvbmRfbGluZWFyX29mZnNldChhZGRyKV07CkBAIC0xMDU0LDYgKzEwNTgsOCBAQCBvdXQ6CiAg
ICAgICovCiAgICAgZmx1c2hfeGVuX3RsYl9yYW5nZV92YSh2aXJ0LCBQQUdFX1NJWkUgKiBucl9t
Zm5zKTsKIAorICAgIHNwaW5fdW5sb2NrKCZ4ZW5fcHRfbG9jayk7CisKICAgICByZXR1cm4gcmM7
CiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
