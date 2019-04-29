Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E056C43219
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 11:23:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A922084B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 11:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A922084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4Nb-0007o9-Ej; Mon, 29 Apr 2019 11:23:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Nb-0007o2-0G
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:23:27 +0000
X-Inumbo-ID: 340a8c9a-6a71-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 340a8c9a-6a71-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 11:23:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 05:23:24 -0600
Message-Id: <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 05:23:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 2/9] x86/IRQ: deal with move cleanup count state
 in fixup_irqs()
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
Message-ID: <20190429112320.l9R8arP0TkIQLfrMnSHc0yFSqtN_T2hGRLuid6nrEd8@z>

VGhlIGNsZWFudXAgSVBJIG1heSBnZXQgc2VudCBpbW1lZGlhdGVseSBiZWZvcmUgYSBDUFUgZ2V0
cyByZW1vdmVkIGZyb20KdGhlIG9ubGluZSBtYXAuIEluIHN1Y2ggYSBjYXNlIHRoZSBJUEkgd291
bGQgZ2V0IGhhbmRsZWQgb24gdGhlIENQVQpiZWluZyBvZmZsaW5lZCBubyBlYXJsaWVyIHRoYW4g
aW4gdGhlIGludGVycnVwdHMgZGlzYWJsZWQgd2luZG93IGFmdGVyCmZpeHVwX2lycXMoKScgbWFp
biBsb29wLiBUaGlzIGlzIHRvbyBsYXRlLCBob3dldmVyLCBiZWNhdXNlIGEgcG9zc2libGUKYWZm
aW5pdHkgY2hhbmdlIG1heSBpbmN1ciB0aGUgbmVlZCBmb3IgdmVjdG9yIGFzc2lnbm1lbnQsIHdo
aWNoIHdpbGwKZmFpbCB3aGVuIHRoZSBJUlEncyBtb3ZlIGNsZWFudXAgY291bnQgaXMgc3RpbGwg
bm9uLXplcm8uCgpUbyBmaXggdGhpcwotIHJlY29yZCB0aGUgc2V0IG9mIENQVXMgdGhlIGNsZWFu
dXAgSVBJcyBnZXRzIGFjdHVhbGx5IHNlbnQgdG8gYWxvbmdzaWRlCiAgc2V0dGluZyB0aGVpciBj
b3VudCwKLSBhZGp1c3QgdGhlIGNvdW50IGluIGZpeHVwX2lycXMoKSwgYWNjb3VudGluZyBmb3Ig
YWxsIENQVXMgdGhhdCB0aGUKICBjbGVhbnVwIElQSSB3YXMgc2VudCB0bywgYnV0IHRoYXQgYXJl
IG5vIGxvbmdlciBvbmxpbmUsCi0gYmFpbCBlYXJseSBmcm9tIHRoZSBjbGVhbnVwIElQSSBoYW5k
bGVyIHdoZW4gdGhlIENQVSBpcyBubyBsb25nZXIKICBvbmxpbmUsIHRvIHByZXZlbnQgZG91Ymxl
IGFjY291bnRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ci0tLQpUQkQ6IFRoZSBwcm9wZXIgcmVjb3JkaW5nIG9mIHRoZSBJUEkgZGVzdGluYXRpb25z
IGFjdHVhbGx5IG1ha2VzIHRoZQogICAgIG1vdmVfY2xlYW51cF9jb3VudCBmaWVsZCByZWR1bmRh
bnQuIERvIHdlIHdhbnQgdG8gZHJvcCBpdCwgYXQgdGhlCiAgICAgcHJpY2Ugb2YgYSBmZXcgbW9y
ZSBDUFUtbWFzayBvcGVyYXRpb25zPwoKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9pcnEuYwpAQCAtNjU4LDYgKzY1OCw5IEBAIHZvaWQgaXJxX21vdmVfY2xlYW51
cF9pbnRlcnJ1cHQoc3RydWN0IGMKICAgICBhY2tfQVBJQ19pcnEoKTsKIAogICAgIG1lID0gc21w
X3Byb2Nlc3Nvcl9pZCgpOworICAgIGlmICggIWNwdV9vbmxpbmUobWUpICkKKyAgICAgICAgcmV0
dXJuOworCiAgICAgZm9yICggdmVjdG9yID0gRklSU1RfRFlOQU1JQ19WRUNUT1I7CiAgICAgICAg
ICAgdmVjdG9yIDw9IExBU1RfSElQUklPUklUWV9WRUNUT1I7IHZlY3RvcisrKQogICAgIHsKQEAg
LTcxNywxMSArNzIwLDE0IEBAIHVubG9jazoKIAogc3RhdGljIHZvaWQgc2VuZF9jbGVhbnVwX3Zl
Y3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpCiB7Ci0gICAgY3B1bWFza190IGNsZWFudXBfbWFz
azsKKyAgICBjcHVtYXNrX2FuZChkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgZGVzYy0+YXJjaC5v
bGRfY3B1X21hc2ssCisgICAgICAgICAgICAgICAgJmNwdV9vbmxpbmVfbWFwKTsKKyAgICBkZXNj
LT5hcmNoLm1vdmVfY2xlYW51cF9jb3VudCA9IGNwdW1hc2tfd2VpZ2h0KGRlc2MtPmFyY2gub2xk
X2NwdV9tYXNrKTsKIAotICAgIGNwdW1hc2tfYW5kKCZjbGVhbnVwX21hc2ssIGRlc2MtPmFyY2gu
b2xkX2NwdV9tYXNrLCAmY3B1X29ubGluZV9tYXApOwotICAgIGRlc2MtPmFyY2gubW92ZV9jbGVh
bnVwX2NvdW50ID0gY3B1bWFza193ZWlnaHQoJmNsZWFudXBfbWFzayk7Ci0gICAgc2VuZF9JUElf
bWFzaygmY2xlYW51cF9tYXNrLCBJUlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUik7CisgICAgaWYgKCBk
ZXNjLT5hcmNoLm1vdmVfY2xlYW51cF9jb3VudCApCisgICAgICAgIHNlbmRfSVBJX21hc2soZGVz
Yy0+YXJjaC5vbGRfY3B1X21hc2ssIElSUV9NT1ZFX0NMRUFOVVBfVkVDVE9SKTsKKyAgICBlbHNl
CisgICAgICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsKIAogICAgIGRlc2MtPmFyY2gubW92ZV9p
bl9wcm9ncmVzcyA9IDA7CiB9CkBAIC0yMzk0LDYgKzI0MDAsMTYgQEAgdm9pZCBmaXh1cF9pcnFz
KGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgYgogICAgICAgICAgICAgIHZlY3RvciA8PSBMQVNUX0hJ
UFJJT1JJVFlfVkVDVE9SICkKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2guY3B1
X21hc2ssIGRlc2MtPmFyY2guY3B1X21hc2ssIG1hc2spOwogCisgICAgICAgIGlmICggZGVzYy0+
YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgKQorICAgICAgICB7CisgICAgICAgICAgICAvKiBUaGUg
Y2xlYW51cCBJUEkgbWF5IGhhdmUgZ290IHNlbnQgd2hpbGUgd2Ugd2VyZSBzdGlsbCBvbmxpbmUu
ICovCisgICAgICAgICAgICBjcHVtYXNrX2FuZG5vdCgmYWZmaW5pdHksIGRlc2MtPmFyY2gub2xk
X2NwdV9tYXNrLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNwdV9vbmxpbmVfbWFwKTsK
KyAgICAgICAgICAgIGRlc2MtPmFyY2gubW92ZV9jbGVhbnVwX2NvdW50IC09IGNwdW1hc2tfd2Vp
Z2h0KCZhZmZpbml0eSk7CisgICAgICAgICAgICBpZiAoICFkZXNjLT5hcmNoLm1vdmVfY2xlYW51
cF9jb3VudCApCisgICAgICAgICAgICAgICAgcmVsZWFzZV9vbGRfdmVjKGRlc2MpOworICAgICAg
ICB9CisKICAgICAgICAgY3B1bWFza19jb3B5KCZhZmZpbml0eSwgZGVzYy0+YWZmaW5pdHkpOwog
ICAgICAgICBpZiAoICFkZXNjLT5hY3Rpb24gfHwgY3B1bWFza19zdWJzZXQoJmFmZmluaXR5LCBt
YXNrKSApCiAgICAgICAgIHsKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
