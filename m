From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/3] string: fix type use in strstr()
Date: Mon, 07 Jan 2019 02:40:20 -0700
Message-ID: <5C331E84020000780020AB56@prv1-mh.provo.novell.com>
References: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggROU-00081v-Rp
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 09:40:26 +0000
In-Reply-To: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VXNpbmcgcGxhaW4gaW50IGZvciBzdHJpbmcgbGVuZ3Rocywgd2hpbGUgb2theSBmb3IgYWxsIHBy
YWN0aWNhbApwdXJwb3NlcywgaXMgdW5kZXNpcmFibGUgaW4gYSBnZW5lcmljIGxpYnJhcnkgZnVu
Y3Rpb24uCgpUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBtb3ZlIHRoZSBmdW5jdGlvbiBm
cm9tIGJlaW5nIGluIHRoZSBtaWRkbGUKb2YgbWVtKigpIG9uZXMgdG8gdGhlIHNldCBvZiBzdHIq
KCkgb25lcywgY29udmVydCBpdHMgbG9vcCBmcm9tIHdoaWxlKCkKdG8gZm9yKCksIGFuZCBjb3Jy
ZWN0IHN0eWxlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2NvbW1vbi9zdHJpbmcuYworKysgYi94ZW4vY29tbW9uL3N0cmluZy5jCkBA
IC0yOTAsNiArMjkwLDI3IEBAIGNoYXIgKiBzdHJzZXAoY2hhciAqKnMsIGNvbnN0IGNoYXIgKmN0
KQogfQogI2VuZGlmCiAKKyNpZm5kZWYgX19IQVZFX0FSQ0hfU1RSU1RSCisvKioKKyAqIHN0cnN0
ciAtIEZpbmQgdGhlIGZpcnN0IHN1YnN0cmluZyBpbiBhICVOVUwgdGVybWluYXRlZCBzdHJpbmcK
KyAqIEBzMTogVGhlIHN0cmluZyB0byBiZSBzZWFyY2hlZAorICogQHMyOiBUaGUgc3RyaW5nIHRv
IHNlYXJjaCBmb3IKKyAqLworY2hhciAqKHN0cnN0cikoY29uc3QgY2hhciAqczEsIGNvbnN0IGNo
YXIgKnMyKQoreworCXNpemVfdCBsMSwgbDIgPSBzdHJsZW4oczIpOworCisJaWYgKCFsMikKKwkJ
cmV0dXJuIChjaGFyICopczE7CisKKwlmb3IgKGwxID0gc3RybGVuKHMxKTsgbDEgPj0gbDI7IC0t
bDEsICsrczEpCisJCWlmICghbWVtY21wKHMxLCBzMiwgbDIpKQorCQkJcmV0dXJuIChjaGFyICop
czE7CisKKwlyZXR1cm4gTlVMTDsKK30KKyNlbmRpZgorCiAjaWZuZGVmIF9fSEFWRV9BUkNIX01F
TVNFVAogLyoqCiAgKiBtZW1zZXQgLSBGaWxsIGEgcmVnaW9uIG9mIG1lbW9yeSB3aXRoIHRoZSBn
aXZlbiB2YWx1ZQpAQCAtMzgwLDMwICs0MDEsNiBAQCBpbnQgKG1lbWNtcCkoY29uc3Qgdm9pZCAq
Y3MsIGNvbnN0IHZvaWQKIH0KICNlbmRpZgogCi0jaWZuZGVmIF9fSEFWRV9BUkNIX1NUUlNUUgot
LyoqCi0gKiBzdHJzdHIgLSBGaW5kIHRoZSBmaXJzdCBzdWJzdHJpbmcgaW4gYSAlTlVMIHRlcm1p
bmF0ZWQgc3RyaW5nCi0gKiBAczE6IFRoZSBzdHJpbmcgdG8gYmUgc2VhcmNoZWQKLSAqIEBzMjog
VGhlIHN0cmluZyB0byBzZWFyY2ggZm9yCi0gKi8KLWNoYXIgKihzdHJzdHIpKGNvbnN0IGNoYXIg
KnMxLCBjb25zdCBjaGFyICpzMikKLXsKLQlpbnQgbDEsIGwyOwotCi0JbDIgPSBzdHJsZW4oczIp
OwotCWlmICghbDIpCi0JCXJldHVybiAoY2hhciAqKSBzMTsKLQlsMSA9IHN0cmxlbihzMSk7Ci0J
d2hpbGUgKGwxID49IGwyKSB7Ci0JCWwxLS07Ci0JCWlmICghbWVtY21wKHMxLHMyLGwyKSkKLQkJ
CXJldHVybiAoY2hhciAqKSBzMTsKLQkJczErKzsKLQl9Ci0JcmV0dXJuIE5VTEw7Ci19Ci0jZW5k
aWYKLQogI2lmbmRlZiBfX0hBVkVfQVJDSF9NRU1DSFIKIC8qKgogICogbWVtY2hyIC0gRmluZCBh
IGNoYXJhY3RlciBpbiBhbiBhcmVhIG9mIG1lbW9yeS4KCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
