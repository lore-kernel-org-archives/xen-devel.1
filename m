From: Alexandru Isaila <aisaila@bitdefender.com>
Subject: [PATCH v1] x86/hvm: Add check for
 cpu_has_vmx_virt_exceptions
Date: Tue, 25 Sep 2018 12:10:38 +0300
Message-ID: <20180925091038.4553-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s7j4=mh=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g4jN7-0007Dq-2y
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 09:11:09 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB1c2VmdWwgc28gSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeSB3aWxsIGZh
aWwgYW5kIG5vdApzaWxlbnRseSBzdWNjZWVkLiBJdCBzYXZlIGEgY2FsbCB0byBIVk1PUF9hbHRw
Mm1fc2V0X3N1cHByZXNzX3ZlLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDYgKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggOWE0OTBlZjY4
Yy4uNTFmYzNlYzA3ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC00NTYxLDYgKzQ1NjEsMTIgQEAgc3RhdGljIGludCBk
b19hbHRwMm1fb3AoCiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgfQogCisgICAgICAgIGlm
ICggIWNwdV9oYXNfdm14X3ZpcnRfZXhjZXB0aW9ucyApCisgICAgICAgIHsKKyAgICAgICAgICAg
IHJjID0gLUVPUE5PVFNVUFA7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorCiAgICAg
ICAgIHYgPSBkLT52Y3B1W2EudS5lbmFibGVfbm90aWZ5LnZjcHVfaWRdOwogCiAgICAgICAgIGlm
ICggIWdmbl9lcSh2Y3B1X2FsdHAybSh2KS52ZWluZm9fZ2ZuLCBJTlZBTElEX0dGTikgfHwKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
