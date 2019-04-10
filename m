From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/mem-sharing: statically initialize audit
 list head and lock
Date: Wed, 10 Apr 2019 04:58:08 -0600
Message-ID: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEAvl-0003d5-Er
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:58:13 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBuZWVkIHRvIGV4ZWN1dGUgYW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28u
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpJIHdv
bmRlciB3aGV0aGVyIG1lbV9zaGFyaW5nX2luaXQoKSBzaG91bGRuJ3QgZ28gYXdheSBhbHRvZ2V0
aGVyIHRoZW4uCgotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtNjUsOCArNjUsOCBAQCBzdGF0aWMgREVGSU5F
X1BFUl9DUFUocGdfbG9ja19kYXRhX3QsIF9fCiAKICNpZiBNRU1fU0hBUklOR19BVURJVAogCi1z
dGF0aWMgc3RydWN0IGxpc3RfaGVhZCBzaHJfYXVkaXRfbGlzdDsKLXN0YXRpYyBzcGlubG9ja190
IHNocl9hdWRpdF9sb2NrOworc3RhdGljIExJU1RfSEVBRChzaHJfYXVkaXRfbGlzdCk7CitzdGF0
aWMgREVGSU5FX1NQSU5MT0NLKHNocl9hdWRpdF9sb2NrKTsKIHN0YXRpYyBERUZJTkVfUkNVX1JF
QURfTE9DSyhzaHJfYXVkaXRfcmVhZF9sb2NrKTsKIAogLyogUkNVIGRlbGF5ZWQgZnJlZSBvZiBh
dWRpdCBsaXN0IGVudHJ5ICovCkBAIC0xNjU0LDkgKzE2NTQsNSBAQCBpbnQgbWVtX3NoYXJpbmdf
ZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsCiB2b2lkIF9faW5pdCBtZW1fc2hhcmluZ19pbml0KHZv
aWQpCiB7CiAgICAgcHJpbnRrKCJJbml0aW5nIG1lbW9yeSBzaGFyaW5nLlxuIik7Ci0jaWYgTUVN
X1NIQVJJTkdfQVVESVQKLSAgICBzcGluX2xvY2tfaW5pdCgmc2hyX2F1ZGl0X2xvY2spOwotICAg
IElOSVRfTElTVF9IRUFEKCZzaHJfYXVkaXRfbGlzdCk7Ci0jZW5kaWYKIH0KIAoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
