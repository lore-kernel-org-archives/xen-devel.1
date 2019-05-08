Return-Path: <SRS0=jkfT=TI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4226C04A6B
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 13:04:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4DF21019
	for <xen-devel@archiver.kernel.org>; Wed,  8 May 2019 13:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4DF21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMEu-0006BU-UF; Wed, 08 May 2019 13:04:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMEt-0006BM-FI
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:04:03 +0000
X-Inumbo-ID: bf78a394-7191-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf78a394-7191-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:04:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 07:04:00 -0600
Message-Id: <5CD2D3BF020000780022CD03@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 07:03:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 02/12] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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
Message-ID: <20190508130359.ISxHLbQRODZ_ObKJ8Ko5DgqUTo3Bvb1B1H82qQwVHDc@z>

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
b20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTY2
NSw2ICs2NjUsOSBAQCB2b2lkIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0KHN0cnVjdCBjCiAg
ICAgYWNrX0FQSUNfaXJxKCk7CiAKICAgICBtZSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKKyAgICBp
ZiAoICFjcHVfb25saW5lKG1lKSApCisgICAgICAgIHJldHVybjsKKwogICAgIGZvciAoIHZlY3Rv
ciA9IEZJUlNUX0RZTkFNSUNfVkVDVE9SOwogICAgICAgICAgIHZlY3RvciA8PSBMQVNUX0hJUFJJ
T1JJVFlfVkVDVE9SOyB2ZWN0b3IrKykKICAgICB7CkBAIC03MjQsMTEgKzcyNywxNCBAQCB1bmxv
Y2s6CiAKIHN0YXRpYyB2b2lkIHNlbmRfY2xlYW51cF92ZWN0b3Ioc3RydWN0IGlycV9kZXNjICpk
ZXNjKQogewotICAgIGNwdW1hc2tfdCBjbGVhbnVwX21hc2s7CisgICAgY3B1bWFza19hbmQoZGVz
Yy0+YXJjaC5vbGRfY3B1X21hc2ssIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLAorICAgICAgICAg
ICAgICAgICZjcHVfb25saW5lX21hcCk7CisgICAgZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291
bnQgPSBjcHVtYXNrX3dlaWdodChkZXNjLT5hcmNoLm9sZF9jcHVfbWFzayk7CiAKLSAgICBjcHVt
YXNrX2FuZCgmY2xlYW51cF9tYXNrLCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgJmNwdV9vbmxp
bmVfbWFwKTsKLSAgICBkZXNjLT5hcmNoLm1vdmVfY2xlYW51cF9jb3VudCA9IGNwdW1hc2tfd2Vp
Z2h0KCZjbGVhbnVwX21hc2spOwotICAgIHNlbmRfSVBJX21hc2soJmNsZWFudXBfbWFzaywgSVJR
X01PVkVfQ0xFQU5VUF9WRUNUT1IpOworICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBf
Y291bnQgKQorICAgICAgICBzZW5kX0lQSV9tYXNrKGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCBJ
UlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUik7CisgICAgZWxzZQorICAgICAgICByZWxlYXNlX29sZF92
ZWMoZGVzYyk7CiAKICAgICBkZXNjLT5hcmNoLm1vdmVfaW5fcHJvZ3Jlc3MgPSAwOwogfQpAQCAt
MjQwMSw2ICsyNDA3LDE2IEBAIHZvaWQgZml4dXBfaXJxcyhjb25zdCBjcHVtYXNrX3QgKm1hc2ss
IGIKICAgICAgICAgICAgICB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZX1ZFQ1RPUiApCiAgICAg
ICAgICAgICBjcHVtYXNrX2FuZChkZXNjLT5hcmNoLmNwdV9tYXNrLCBkZXNjLT5hcmNoLmNwdV9t
YXNrLCBtYXNrKTsKIAorICAgICAgICBpZiAoIGRlc2MtPmFyY2gubW92ZV9jbGVhbnVwX2NvdW50
ICkKKyAgICAgICAgeworICAgICAgICAgICAgLyogVGhlIGNsZWFudXAgSVBJIG1heSBoYXZlIGdv
dCBzZW50IHdoaWxlIHdlIHdlcmUgc3RpbGwgb25saW5lLiAqLworICAgICAgICAgICAgY3B1bWFz
a19hbmRub3QoJmFmZmluaXR5LCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZjcHVfb25saW5lX21hcCk7CisgICAgICAgICAgICBkZXNjLT5hcmNo
Lm1vdmVfY2xlYW51cF9jb3VudCAtPSBjcHVtYXNrX3dlaWdodCgmYWZmaW5pdHkpOworICAgICAg
ICAgICAgaWYgKCAhZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgKQorICAgICAgICAgICAg
ICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsKKyAgICAgICAgfQorCiAgICAgICAgIGNwdW1hc2tf
Y29weSgmYWZmaW5pdHksIGRlc2MtPmFmZmluaXR5KTsKICAgICAgICAgaWYgKCAhZGVzYy0+YWN0
aW9uIHx8IGNwdW1hc2tfc3Vic2V0KCZhZmZpbml0eSwgbWFzaykgKQogICAgICAgICB7CgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
