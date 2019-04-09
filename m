Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E20EC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:57:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBB902084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBB902084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDsBj-0006jt-Pq; Tue, 09 Apr 2019 14:57:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDsBi-0006jo-TL
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:57:26 +0000
X-Inumbo-ID: c91a070a-5ad7-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c91a070a-5ad7-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 14:57:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 08:57:24 -0600
Message-Id: <5CACB2D10200007800225EDC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 08:57:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86: fix build race when generating temporary
 object files
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409145721.AyzKsbzAm1g1eOP-_py_dNmI64nS5jXg5-T-ZSOErd4@z>

VGhlIHJ1bGVzIHRvIGdlbmVyYXRlIHhlbi1zeW1zIGFuZCB4ZW4uZWZpIG1heSBydW4gaW4gcGFy
YWxsZWwsIGJ1dCBib3RoCnJlY3Vyc2l2ZWx5IGludm9rZSAkKE1BS0UpIHRvIGJ1aWxkIHN5bWJv
bC9yZWxvY2F0aW9uIHRhYmxlIHRlbXBvcmFyeQpvYmplY3QgZmlsZXMuIFRoZXNlIHJlY3Vyc2l2
ZSBidWlsZHMgd291bGQgYm90aCByZS1nZW5lcmF0ZSB0aGUgLiouZDIKZmlsZXMgKHdoZXJlIG5l
ZWRlZCkuIEJvdGggd291bGQgaW4gdHVybiBpbnZva2UgdGhlIHNhbWUgcnVsZSwgdGh1cwphbGxv
d2luZyBmb3IgYSByYWNlIG9uIHRoZSAuKi5kMi50bXAgaW50ZXJtZWRpYXRlIGZpbGVzLgoKVGhl
IGRlcGVuZGVuY3kgZmlsZXMgb2YgdGhlIHRlbXBvcmFyeSAueGVuKi5vIGZpbGVzIGxpdmUgaW4g
eGVuLyByYXRoZXIKdGhhbiB4ZW4vYXJjaC94ODYvIGFueXdheSwgc28gd29uJ3QgYmUgaW5jbHVk
ZWQgbm8gbWF0dGVyIHdoYXQuIFRha2UgdGhlCm9wcG9ydHVuaXR5IGFuZCBkZWxldGUgdGhlbSwg
YXMgdGhlIGp1c3QgcmUtZ2VuZXJhdGVkIC54ZW4qLlMgZmlsZXMgd2lsbAp0cmlnZ2VyIGEgcHJv
cGVyIHJlLWJ1aWxkIG9mIHRoZSAueGVuKi5vIG9uZXMgYW55d2F5LgoKRW1wdHkgdGhlIERFUFMg
dmFyaWFibGUgaW4gY2FzZSB0aGUgc2V0IG9mIGdvYWxzIGNvbnNpc3RzIG9mIGp1c3QgdGhvc2UK
dGVtcG9yYXJ5IG9iamVjdCBmaWxlcywgdGh1cyBlbGltaW5hdGluZyB0aGUgcmFjZS4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTE0NSw3ICsxNDUs
NyBAQCAkKFRBUkdFVCktc3ltczogcHJlbGluay5vIHhlbi5sZHMKIAkkKE5NKSAtcGEgLS1mb3Jt
YXQ9c3lzdiAkKEBEKS8kKEBGKSBcCiAJCXwgJChCQVNFRElSKS90b29scy9zeW1ib2xzIC0teGVu
c3ltcyAtLXN5c3YgLS1zb3J0IFwKIAkJPiQoQEQpLyQoQEYpLm1hcAotCXJtIC1mICQoQEQpLy4k
KEBGKS5bMC05XSoKKwlybSAtZiAkKEBEKS8uJChARikuWzAtOV0qICQoQEQpLy4uJChARikuWzAt
OV0qCiAKIG5vdGUubzogJChUQVJHRVQpLXN5bXMKIAkkKE9CSkNPUFkpIC1PIGJpbmFyeSAtLW9u
bHktc2VjdGlvbj0ubm90ZS5nbnUuYnVpbGQtaWQgICQoQkFTRURJUikveGVuLXN5bXMgJEAuYmlu
CkBAIC0yMDgsNyArMjA4LDcgQEAgJChUQVJHRVQpLmVmaTogcHJlbGluay1lZmkubyAkKG5vdGVf
ZmlsZQogCWlmICQoZ3VhcmQpIGZhbHNlOyB0aGVuIHJtIC1mICRAOyBlY2hvICdFRkkgc3VwcG9y
dCBkaXNhYmxlZCc7IFwKIAllbHNlICQoTk0pIC1wYSAtLWZvcm1hdD1zeXN2ICQoQEQpLyQoQEYp
IFwKIAkJfCAkKEJBU0VESVIpL3Rvb2xzL3N5bWJvbHMgLS14ZW5zeW1zIC0tc3lzdiAtLXNvcnQg
PiQoQEQpLyQoQEYpLm1hcDsgZmkKLQlybSAtZiAkKEBEKS8uJChARikuWzAtOV0qCisJcm0gLWYg
JChARCkvLiQoQEYpLlswLTldKiAkKEBEKS8uLiQoQEYpLlswLTldKgogCiBlZmkvYm9vdC5pbml0
Lm8gZWZpL3J1bnRpbWUubyBlZmkvY29tcGF0Lm8gZWZpL2J1aWxkaWQubzogJChCQVNFRElSKS9h
cmNoL3g4Ni9lZmkvYnVpbHRfaW4ubwogZWZpL2Jvb3QuaW5pdC5vIGVmaS9ydW50aW1lLm8gZWZp
L2NvbXBhdC5vIGVmaS9idWlsZGlkLm86IDsKQEAgLTI1MywzICsyNTMsOSBAQCBjbGVhbjo6CiAJ
cm0gLWYgJChCQVNFRElSKS8ueGVuLmVmaS5bMC05XSogZWZpLyouZWZpIGVmaS9ta3JlbG9jCiAJ
cm0gLWYgYm9vdC9jbWRsaW5lLlMgYm9vdC9yZWxvYy5TIGJvb3QvKi5sbmsgYm9vdC8qLmJpbgog
CXJtIC1mIG5vdGUubworCisjIFN1cHByZXNzIGxvYWRpbmcgb2YgREVQUyBmaWxlcyBmb3IgaW50
ZXJuYWwsIHRlbXBvcmFyeSB0YXJnZXQgZmlsZXMuICBUaGlzCisjIHRoZW4gYWxzbyBzdXBwcmVz
c2VzIHJlLWdlbmVyYXRpb24gb2YgdGhlIHJlc3BlY3RpdmUgLiouZDIgZmlsZXMuCitpZmVxICgk
KGZpbHRlci1vdXQgLnhlbiUubywkKG5vdGRpciAkKE1BS0VDTURHT0FMUykpKSwpCitERVBTOj0K
K2VuZGlmCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
