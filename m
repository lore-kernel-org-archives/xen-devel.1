Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2159EC04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 12:25:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D7420850
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 12:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D7420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWUq-0002xK-AV; Tue, 14 May 2019 12:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUo-0002uU-Uh
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:26 +0000
X-Inumbo-ID: 5a3a3ae6-7643-11e9-ac14-47d38e703330
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5a3a3ae6-7643-11e9-ac14-47d38e703330;
 Tue, 14 May 2019 12:25:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D434F15AB;
 Tue, 14 May 2019 05:25:25 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C49993F720;
 Tue, 14 May 2019 05:25:24 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:24:53 +0100
Message-Id: <20190514122456.28559-17-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 RESEND v2 16/19] xen/arm: mm: Protect
 Xen page-table update with a spinlock
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514122453.3RDPuzYp0ze9Vx0ExklsWxXUX9o5nX7pSOqfiI5DIhQ@z>

VGhlIGZ1bmN0aW9uIGNyZWF0ZV94ZW5fZW50cmllcygpIG1heSBiZSBjYWxsZWQgY29uY3VycmVu
dGx5LiBGb3IKaW5zdGFuY2UsIHdoaWxlIHRoZSB2bWFwIGFsbG9jYXRpb24gaXMgcHJvdGVjdGVk
IGJ5IGEgc3BpbmxvY2ssIHRoZQptYXBwaW5nIGlzIG5vdC4KClRoZSBpbXBsZW1lbnRhdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMoKSBjb250YWlucyBxdWl0ZSBhIGZldyBUT0NUT1UKcmFjZXMgc3Vj
aCBhcyB3aGVuIGFsbG9jYXRpbmcgdGhlIDNyZC1sZXZlbCBwYWdlLXRhYmxlcy4KClRoYW5rZnVs
bHksIHRoZXkgYXJlIHByZXR0eSBoYXJkIHRvIHJlYWNoIGFzIHBhZ2UtdGFibGVzIGFyZSBhbGxv
Y2F0ZWQKb25jZSBhbmQgbmV2ZXIgcmVsZWFzZWQuIFlldCBpdCBpcyBwb3NzaWJsZSwgc28gd2Ug
bmVlZCB0byBwcm90ZWN0IHdpdGgKYSBzcGlubG9jayB0byBhdm9pZCBjb3JydXB0aW5nIHRoZSBw
YWdlLXRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBSZXdvcmsgdGhlIGNvbW1p
dCBtZXNzYWdlCi0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVu
L2FyY2gvYXJtL21tLmMKaW5kZXggOWE1ZjJlMWMzZi4uNzUwMmExNDc2MCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTk3NCw2ICs5NzQs
OCBAQCBlbnVtIHhlbm1hcF9vcGVyYXRpb24gewogICAgIFJFU0VSVkUKIH07CiAKK3N0YXRpYyBE
RUZJTkVfU1BJTkxPQ0soeGVuX3B0X2xvY2spOworCiBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fZW50
cmllcyhlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHZpcnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
Zm5fdCBtZm4sCkBAIC05ODUsNiArOTg3LDggQEAgc3RhdGljIGludCBjcmVhdGVfeGVuX2VudHJp
ZXMoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAogICAgIGxwYWVfdCBwdGUsICplbnRyeTsKICAg
ICBscGFlX3QgKnRoaXJkID0gTlVMTDsKIAorICAgIHNwaW5fbG9jaygmeGVuX3B0X2xvY2spOwor
CiAgICAgZm9yKDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgbWZuID0gbWZu
X2FkZChtZm4sIDEpKQogICAgIHsKICAgICAgICAgZW50cnkgPSAmeGVuX3NlY29uZFtzZWNvbmRf
bGluZWFyX29mZnNldChhZGRyKV07CkBAIC0xMDU5LDYgKzEwNjMsOCBAQCBvdXQ6CiAgICAgICov
CiAgICAgZmx1c2hfeGVuX3RsYl9yYW5nZV92YSh2aXJ0LCBQQUdFX1NJWkUgKiBucl9tZm5zKTsK
IAorICAgIHNwaW5fdW5sb2NrKCZ4ZW5fcHRfbG9jayk7CisKICAgICByZXR1cm4gcmM7CiB9CiAK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
