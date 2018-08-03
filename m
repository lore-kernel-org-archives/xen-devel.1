From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] drop {,acpi_}reserve_bootmem()
Date: Fri, 03 Aug 2018 09:23:06 -0600
Message-ID: <5B64735A02000078001DAAD4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=88ay=ks=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1flbv6-00057l-4W
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 15:23:12 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Qm90aCBhcmUgZW50aXJlbHkgdW51c2VkICh0byBiZSBmYWlyLCByZXNlcnZlX2Jvb3RtZW0oKSBo
YXMgYSB1c2UgaW5zaWRlCmFuICIjaWYgMCIgc2VjdGlvbiBpbiB4ODYncyBtcHBhcnNlLmMsIGJ1
dCBpZiB3ZSB3ZXJlIHRvIHJlLWVuYWJsZSB0aGF0CmNvZGUsIGl0IHdvdWxkIG5lZWQgZG9pbmcg
ZGlmZmVyZW50bHkgYW55d2F5KS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYWNwaS5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvYWNwaS5oCkBAIC05OCw5ICs5OCw2IEBAIGV4dGVybiB2b2lkIGFjcGlf
cmVzdG9yZV9zdGF0ZV9tZW0odm9pZCkKIAogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgYWNwaV93YWtl
dXBfYWRkcmVzczsKIAotLyogZWFybHkgaW5pdGlhbGl6YXRpb24gcm91dGluZSAqLwotZXh0ZXJu
IHZvaWQgYWNwaV9yZXNlcnZlX2Jvb3RtZW0odm9pZCk7Ci0KICNkZWZpbmUgQVJDSF9IQVNfUE9X
RVJfSU5JVAkxCiAKIGV4dGVybiBzOCBhY3BpX251bWE7Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9s
aWIuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKQEAgLTY2LDggKzY2LDYgQEAKIAogI2Rl
ZmluZSBST1VORFVQKHgsIGEpICgoKHgpICsgKGEpIC0gMSkgJiB+KChhKSAtIDEpKQogCi0jZGVm
aW5lIHJlc2VydmVfYm9vdG1lbShfcCxfbCkgKCh2b2lkKTApCi0KIHN0cnVjdCBkb21haW47CiAK
IHZvaWQgY21kbGluZV9wYXJzZShjb25zdCBjaGFyICpjbWRsaW5lKTsKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
