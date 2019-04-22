Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5ECC10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74EDC214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74EDC214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8r-0004mL-5N; Mon, 22 Apr 2019 16:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8p-0004fN-G3
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:03 +0000
X-Inumbo-ID: ac1324f8-651e-11e9-af01-c34a14b1c1f1
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ac1324f8-651e-11e9-af01-c34a14b1c1f1;
 Mon, 22 Apr 2019 16:50:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC255374;
 Mon, 22 Apr 2019 09:50:01 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCA383F557;
 Mon, 22 Apr 2019 09:50:00 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:25 +0100
Message-Id: <20190422164937.21350-9-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 08/20] xen/arm64: head: Move earlyprintk
 messages in .rodata.str
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
Message-ID: <20190422164925.Egu6Bll2SJsbilkmx_nevIpO9q1Sm7-xk84p31QKbFA@z>

QXQgdGhlIG1vbWVudCwgdGhlIGVhcmx5cHJpbnRrIG1lc3NhZ2VzIGFyZSBpbnRlcmxlYXZlZCB3
aXRoIHRoZQppbnN0cnVjdGlvbnMuIFRoaXMgbWFrZXMgbW9yZSBkaWZmaWN1bHQgdG8gcmVhZCB0
aGUgb2JqZHVtcCBvdXRwdXQuCgpJbnRyb2R1Y2UgYSBuZXcgbWFjcm8gdG8gYWRkIGEgc3RyaW5n
IGluIC5yb2RhdGEuc3RyIGFuZCB1c2UgaXQgZm9yIGFsbAp0aGUgZWFybHlwcmludGsgbWVzc2Fn
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoK
LS0tCgpJIGhhdmVuJ3QgZG9uZSBhIHNpbWlsYXIgY2hhbmdlIGluIGFybTMyIHlldCBiZWNhdXNl
IHRoZSBjb21waWxlciB3aWxsCnRocm93IGFuIGVycm9yIHdoZW4gdXNpbmcgJ2Fkcicgd2hlbiBs
b2FkIGFuIGFkZHJlc3MgZnJvbSBhIGRpZmZlcmVudApzZWN0aW9uIChzZWUgQTUtMjAwIGluIEFS
TSBEREkgMDQwNkMuYSBmb3IgdGhlIHRlY2huaWNhbCByZWFzb24pLgpUaGUgY2hhbmdlIGlzIGxp
a2VseSB0byBiZSBtb3JlIGVsYWJvcmF0ZS4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
ICAgICAgIHwgMTQgKysrKystLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXNtX2RlZm5z
LmggfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IGFkNDQ2ZTczNDUuLmI5NTdlYjkwZmIgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUwpAQCAtODEsMTMgKzgxLDEwIEBACiAvKiBNYWNybyB0byBwcmludCBhIHN0cmluZyB0byB0
aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgogICogQ2xvYmJlcnMgeDAteDMuICovCiAjaWZkZWYg
Q09ORklHX0VBUkxZX1BSSU5USwotI2RlZmluZSBQUklOVChfcykgICAgICAgXAotICAgICAgICBh
ZHIgICB4MCwgOThmIDsgXAotICAgICAgICBibCAgICBwdXRzICAgIDsgXAotICAgICAgICBiICAg
ICA5OWYgICAgIDsgXAotOTg6ICAgICAuYXNjaXogX3MgICAgIDsgXAotICAgICAgICAuYWxpZ24g
MiAgICAgIDsgXAotOTk6CisjZGVmaW5lIFBSSU5UKF9zKSAgICAgICAgICAgXAorICAgICAgICBh
ZHIgICB4MCwgOThmIDsgICAgIFwKKyAgICAgICAgYmwgICAgcHV0cyAgICA7ICAgICBcCisgICAg
ICAgIFJPREFUQV9TVFIoOTgsIF9zKQogI2Vsc2UgLyogQ09ORklHX0VBUkxZX1BSSU5USyAqLwog
I2RlZmluZSBQUklOVChzKQogI2VuZGlmIC8qICFDT05GSUdfRUFSTFlfUFJJTlRLICovCkBAIC02
MzMsOCArNjMwLDcgQEAgaW5pdF91YXJ0OgogI2VuZGlmCiAgICAgICAgIGFkciAgIHgwLCAxZgog
ICAgICAgICBiICAgICBwdXRzCi0xOiAgICAgIC5hc2NpeiAiLSBVQVJUIGVuYWJsZWQgLVxyXG4i
Ci0gICAgICAgIC5hbGlnbiA0CitST0RBVEFfU1RSKDEsICItIFVBUlQgZW5hYmxlZCAtXHJcbiIp
CiAKIC8qIFByaW50IGVhcmx5IGRlYnVnIG1lc3NhZ2VzLgogICogeDA6IE51bC10ZXJtaW5hdGVk
IHN0cmluZyB0byBwcmludC4KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXNtX2Rl
Zm5zLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FzbV9kZWZucy5oCmluZGV4IDAyYmU4M2UyYjMu
LjNmMjFkZWYwYWIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXNtX2RlZm5zLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hc21fZGVmbnMuaApAQCAtMTYsNiArMTYsMTEgQEAK
ICMgZXJyb3IgInVua25vd24gQVJNIHZhcmlhbnQiCiAjZW5kaWYKIAorI2RlZmluZSBST0RBVEFf
U1RSKGxhYmVsLCBtc2cpICAgICAgICAgICAgICAgICAgXAorLnB1c2hzZWN0aW9uIC5yb2RhdGEu
c3RyLCAiYU1TIiwgJXByb2diaXRzLCAxIDsgXAorbGFiZWw6ICAuYXNjaXogbXNnOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAorLnBvcHNlY3Rpb24KKwogI2VuZGlmIC8qIF9fQVJNX0FT
TV9ERUZOU19IX18gKi8KIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
