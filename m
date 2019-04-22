Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41555C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B833214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B833214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8m-0004Tl-W9; Mon, 22 Apr 2019 16:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8k-0004SK-V6
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:49:58 +0000
X-Inumbo-ID: a9b1d358-651e-11e9-a8c6-93b1c3c83655
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a9b1d358-651e-11e9-a8c6-93b1c3c83655;
 Mon, 22 Apr 2019 16:49:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0408A374;
 Mon, 22 Apr 2019 09:49:58 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8C673F557;
 Mon, 22 Apr 2019 09:49:56 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:22 +0100
Message-Id: <20190422164937.21350-6-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 05/20] xen/arm: Rework secondary_start prototype
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
Message-ID: <20190422164922.UI22IV73CSzDGvorWa7t0-yiLrnjJaVIlRSrVub6pZA@z>

Tm9uZSBvZiB0aGUgcGFyYW1ldGVycyBvZiBzZWNvbmRhcnlfc3RhcnQgYXJlIGFjdHVhbGx5IHVz
ZWQuIFNvIHR1cm4Kc2Vjb25kYXJ5X3N0YXJ0IHRvIGEgZnVuY3Rpb24gd2l0aCBubyBwYXJhbWV0
ZXJzLgoKQWxzbyBtb2RpZnkgdGhlIGFzc2VtYmx5IGNvZGUgdG8gYXZvaWQgc2V0dGluZy11cCB0
aGUgcmVnaXN0ZXJzIGJlZm9yZQpjYWxsaW5nIHNlY29uZGFyeV9zdGFydC4KClNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJt
L2FybTMyL2hlYWQuUyB8IDYgKysrLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMyAr
Ky0KIHhlbi9hcmNoL2FybS9zbXBib290LmMgICAgfCA0ICstLS0KIDMgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IDhhOTg2MDc0
NTkuLmI3MWQ3ZmIxMWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKKysr
IGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtNDQ1LDEwICs0NDUsMTAgQEAgbGF1bmNo
OgogICAgICAgICBsZHIgICBzcCwgW3IwXQogICAgICAgICBhZGQgICBzcCwgI1NUQUNLX1NJWkUg
ICAgICAgIC8qICh3aGljaCBncm93cyBkb3duIGZyb20gdGhlIHRvcCkuICovCiAgICAgICAgIHN1
YiAgIHNwLCAjQ1BVSU5GT19zaXplb2YgICAgLyogTWFrZSByb29tIGZvciBDUFUgc2F2ZSByZWNv
cmQgKi8KLSAgICAgICAgbW92ICAgcjAsIHIxMCAgICAgICAgICAgICAgICAvKiBNYXJzaGFsIGFy
Z3M6IC0gcGh5c19vZmZzZXQgKi8KLSAgICAgICAgbW92ICAgcjEsIHI4ICAgICAgICAgICAgICAg
ICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3MgKi8KLSAgICAgICAgbW92ICAgcjIsIHI3
ICAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gQ1BVIElEICovCiAgICAgICAgIHRl
cSAgIHIxMiwgIzAKKyAgICAgICAgbW92ZXEgcjAsIHIxMCAgICAgICAgICAgICAgICAvKiBNYXJz
aGFsIGFyZ3M6IC0gcGh5c19vZmZzZXQgKi8KKyAgICAgICAgbW92ZXEgcjEsIHI4ICAgICAgICAg
ICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3MgKi8KKyAgICAgICAgbW92ZXEg
cjIsIHI3ICAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gQ1BVIElEICovCiAgICAg
ICAgIGJlcSAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRvIHRo
ZSBsYW5kIG9mIEMgKi8KICAgICAgICAgYiAgICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAvKiAo
dG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAqLwogCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwppbmRleCA0ZmU5
MDRjNTFkLi5iMjYxMjZkZTUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
CisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKQEAgLTU4MiwxMCArNTgyLDExIEBAIGxh
dW5jaDoKICAgICAgICAgc3ViICAgeDAsIHgwLCAjQ1BVSU5GT19zaXplb2YgLyogTWFrZSByb29t
IGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KICAgICAgICAgbW92ICAgc3AsIHgwCiAKKyAgICAgICAg
Y2JueiAgeDIyLCAxZgorCiAgICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyog
TWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zmc2V0ICovCiAgICAgICAgIG1vdiAgIHgxLCB4MjEgICAg
ICAgICAgICAgICAgLyogICAgICAgICAgICAgICAtIEZEVCAqLwogICAgICAgICBtb3YgICB4Miwg
eDI0ICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBDUFUgSUQgKi8KLSAgICAgICAg
Y2JueiAgeDIyLCAxZgogICAgICAgICBiICAgICBzdGFydF94ZW4gICAgICAgICAgICAgIC8qIGFu
ZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBDICovCiAxOgogICAgICAgICBiICAgICBzdGFy
dF9zZWNvbmRhcnkgICAgICAgIC8qICh0byB0aGUgYXBwcm9wcmlhdGUgZW50cnkgcG9pbnQpICov
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jIGIveGVuL2FyY2gvYXJtL3NtcGJv
b3QuYwppbmRleCBmNzU2NDQ0MzYyLi4wMGI2NGMzMzIyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0vc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMKQEAgLTI5Nyw5ICsyOTcs
NyBAQCBzbXBfcHJlcGFyZV9jcHVzKHZvaWQpCiB9CiAKIC8qIEJvb3QgdGhlIGN1cnJlbnQgQ1BV
ICovCi12b2lkIHN0YXJ0X3NlY29uZGFyeSh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQs
Ci0gICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZkdF9wYWRkciwKLSAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaHdpZCkKK3ZvaWQgc3RhcnRfc2Vjb25kYXJ5KHZv
aWQpCiB7CiAgICAgdW5zaWduZWQgaW50IGNwdWlkID0gaW5pdF9kYXRhLmNwdWlkOwogCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
