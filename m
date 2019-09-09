Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6426BC433EF
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 09:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E6721924
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 09:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E6721924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7FvI-0005Cj-RQ; Mon, 09 Sep 2019 09:25:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7FvH-0005CI-Gg
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 09:25:23 +0000
X-Inumbo-ID: ba111514-d2e3-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba111514-d2e3-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 09:25:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3B63AFCE;
 Mon,  9 Sep 2019 09:25:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 11:25:06 +0200
Message-Id: <20190909092506.24792-6-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190909092506.24792-1-jgross@suse.com>
References: <20190909092506.24792-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v7 5/5] xen: add debugtrace entry when entry
 count is wrapping
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRlYnVndHJhY2UgZW50cnkgY291bnQgaXMgYSAzMiBiaXQgdmFyaWFibGUsIHNvIGl0IGNh
biB3cmFwIHdoZW4KbG90cyBvZiB0cmFjZSBlbnRyaWVzIGFyZSBiZWluZyBwcm9kdWNlZC4gTWFr
aW5nIGl0IHdpZGVyIHdvdWxkIHJlc3VsdAppbiBhIHdhc3RlIG9mIGJ1ZmZlciBzcGFjZSBhcyB0
aGUgcHJpbnRlZCBjb3VudCB2YWx1ZSB3b3VsZCBjb25zdW1lCm1vcmUgYnl0ZXMgd2hlbiBub3Qg
d3JhcHBpbmcuCgpTbyBpbnN0ZWFkIG9mIGxldHRpbmcgdGhlIGNvdW50IHZhbHVlIGdyb3cgdG8g
aHVnZSB2YWx1ZXMgbGV0IGl0IHdyYXAKYW5kIGFkZCBhIHdyYXAgY291bnRlciBwcmludGVkIGlu
IHRoaXMgc2l0dWF0aW9uLiBUaGlzIHdpbGwga2VlcCB0aGUKbmVlZGVkIGJ1ZmZlciBzcGFjZSBh
dCB0b2RheSdzIHZhbHVlIHdoaWxlIGF2b2lkaW5nIHRvIGxvb3NlIGEgd2F5IHRvCnNvcnQgYWxs
IGVudHJpZXMgaW4gY2FzZSBtdWx0aXBsZSB0cmFjZSBidWZmZXJzIGFyZSBpbnZvbHZlZC4KCk5v
dGUgdGhhdCB0aGUgd3JhcCBtZXNzYWdlIHdpbGwgYmUgcHJpbnRlZCBiZWZvcmUgdGhlIGZpcnN0
IHRyYWNlCmVudHJ5IGluIGNhc2Ugb3V0cHV0IGlzIHN3aXRjaGVkIHRvIGNvbnNvbGUgZWFybHku
IFRoaXMgaXMgb24gcHVycG9zZQppbiBvcmRlciB0byBlbmFibGUgYSBmdXR1cmUgc3VwcG9ydCBv
ZiBkZWJ1Z3RyYWNlIHRvIGNvbnNvbGUgd2l0aG91dAphbnkgYWxsb2NhdGVkIGJ1ZmZlci4KClNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29t
bW9uL2RlYnVndHJhY2UuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMgYi94ZW4vY29tbW9uL2RlYnVndHJhY2UuYwpp
bmRleCAzOGY3NjAzYzFkLi4yZjk4ODFhYzZhIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RlYnVn
dHJhY2UuYworKysgYi94ZW4vY29tbW9uL2RlYnVndHJhY2UuYwpAQCAtMTUsMTEgKzE1LDE0IEBA
CiAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8eGVuL3dhdGNoZG9nLmg+CiAK
KyNkZWZpbmUgREVCVUdUUkFDRV9DT1VOVF9XUkFQIDk5OTk5OTk5CisKIC8qIFNlbmQgb3V0cHV0
IGRpcmVjdCB0byBjb25zb2xlLCBvciBidWZmZXIgaXQ/ICovCiBzdGF0aWMgdm9sYXRpbGUgYm9v
bCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKIAogc3RydWN0IGRlYnVndHJhY2VfZGF0YSB7
CiAgICAgdW5zaWduZWQgbG9uZyBwcmQ7ICAgLyogUHJvZHVjZXIgaW5kZXguICovCisgICAgdW5z
aWduZWQgbG9uZyB3cmFwX2NudDsKICAgICBjaGFyICAgICAgICAgIGJ1ZltdOwogfTsKIApAQCAt
NzIsNiArNzUsNyBAQCBzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBfYnVmZmVyKHN0cnVjdCBk
ZWJ1Z3RyYWNlX2RhdGEgKmRhdGEsCiAgICAgLyogUHJpbnQgeW91bmdlc3QgcG9ydGlvbiBvZiB0
aGUgcmluZy4gKi8KICAgICBkYXRhLT5idWZbZGF0YS0+cHJkXSA9ICdcMCc7CiAgICAgY29uc29s
ZV9zZXJpYWxfcHV0cygmZGF0YS0+YnVmWzBdLCBkYXRhLT5wcmQpOworICAgIHByaW50aygid3Jh
cDogJWx1XG4iLCBkYXRhLT53cmFwX2NudCk7CiAKICAgICBtZW1zZXQoZGF0YS0+YnVmLCAnXDAn
LCBkZWJ1Z3RyYWNlX2J5dGVzKTsKICAgICBkYXRhLT5wcmQgPSAwOwpAQCAtMTUzLDkgKzE1Nyw5
IEBAIHZvaWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCiB7CiAgICAg
c3RhdGljIGNoYXIgYnVmWzEwMjRdLCBsYXN0X2J1ZlsxMDI0XTsKICAgICBzdGF0aWMgdW5zaWdu
ZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X2NwdTsKLSAgICBzdGF0aWMgdW5zaWduZWQg
bG9uZyBsYXN0X3ByZDsKKyAgICBzdGF0aWMgdW5zaWduZWQgbG9uZyBsYXN0X3ByZCwgd3JhcF9j
bnQ7CiAKLSAgICBjaGFyICAgICAgICAgIGNudGJ1ZlsyNF07CisgICAgY2hhciAgICAgICAgICBj
bnRidWZbNTBdOwogICAgIHZhX2xpc3QgICAgICAgYXJnczsKICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOwogICAgIHVuc2lnbmVkIGludCBucjsKQEAgLTE3MywxMCArMTc3LDIzIEBAIHZvaWQgZGVi
dWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCiAgICAgbnIgPSB2c25wcmludGYo
YnVmLCBzaXplb2YoYnVmKSwgZm10LCBhcmdzKTsKICAgICB2YV9lbmQoYXJncyk7CiAKKyAgICBp
ZiAoIGNvdW50ID09IERFQlVHVFJBQ0VfQ09VTlRfV1JBUCApCisgICAgeworICAgICAgICBjb3Vu
dCA9IDA7CisgICAgICAgIHdyYXBfY250Kys7CisgICAgfQorCiAgICAgaWYgKCBkZWJ1Z3RyYWNl
X3NlbmRfdG9fY29uc29sZSApCiAgICAgewotICAgICAgICB1bnNpZ25lZCBpbnQgbiA9IHNjbnBy
aW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUgIiwgKytjb3VudCk7CisgICAgICAgIHVu
c2lnbmVkIGludCBuOworCisgICAgICAgIGlmICggY291bnQgPT0gMCApCisgICAgICAgIHsKKyAg
ICAgICAgICAgIG4gPSBzY25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIndyYXA6ICVs
dVxuIiwgd3JhcF9jbnQpOworICAgICAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0cyhjbnRidWYs
IG4pOworICAgICAgICB9CiAKKyAgICAgICAgbiA9IHNjbnByaW50ZihjbnRidWYsIHNpemVvZihj
bnRidWYpLCAiJXUgIiwgKytjb3VudCk7CiAgICAgICAgIGNvbnNvbGVfc2VyaWFsX3B1dHMoY250
YnVmLCBuKTsKICAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0cyhidWYsIG5yKTsKICAgICB9CkBA
IC0xODQsOCArMjAxLDE2IEBAIHZvaWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10
LCAuLi4pCiAgICAgewogICAgICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gZGVidWd0cmFjZV9wZXJf
Y3B1ID8gc21wX3Byb2Nlc3Nvcl9pZCgpIDogMDsKIAotICAgICAgICBpZiAoIGRlYnVndHJhY2Vf
YnVmX2VtcHR5IHx8IGNwdSAhPSBsYXN0X2NwdSB8fCBzdHJjbXAoYnVmLCBsYXN0X2J1ZikgKQor
ICAgICAgICBpZiAoIGRlYnVndHJhY2VfYnVmX2VtcHR5IHx8IGNwdSAhPSBsYXN0X2NwdSB8fAor
ICAgICAgICAgICAgIHdyYXBfY250ICE9IGRhdGEtPndyYXBfY250IHx8IHN0cmNtcChidWYsIGxh
c3RfYnVmKSApCiAgICAgICAgIHsKKyAgICAgICAgICAgIGlmICggd3JhcF9jbnQgIT0gZGF0YS0+
d3JhcF9jbnQgKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHNucHJpbnRmKGNudGJ1
Ziwgc2l6ZW9mKGNudGJ1ZiksICJ3cmFwOiAlbHUtPiVsdVxuIiwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICBkYXRhLT53cmFwX2NudCwgd3JhcF9jbnQpOworICAgICAgICAgICAgICAgIGRlYnVn
dHJhY2VfYWRkX3RvX2J1ZihjbnRidWYpOworICAgICAgICAgICAgICAgIGRhdGEtPndyYXBfY250
ID0gd3JhcF9jbnQ7CisgICAgICAgICAgICB9CiAgICAgICAgICAgICBkZWJ1Z3RyYWNlX2J1Zl9l
bXB0eSA9IGZhbHNlOwogICAgICAgICAgICAgbGFzdF9wcmQgPSBkYXRhLT5wcmQ7CiAgICAgICAg
ICAgICBsYXN0X2NvdW50ID0gKytjb3VudDsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
