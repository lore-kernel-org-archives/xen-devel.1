From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 05/23] x86: provide stub for
 memory_type_changed
Date: Sun, 26 Aug 2018 13:19:38 +0100
Message-ID: <35a863ecfc84b7cee6013933f9c72589d59500dc.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu1T-0007E5-2T
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:20:03 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SmFuIGluZGljYXRlZCB0aGF0IGZvciBQViBndWVzdHMgdGhlIG1lbW9yeSB0eXBlIGlzIG5vdCBj
aGFuZ2VkLCBmb3IKSFZNIGd1ZXN0cyBtZW1vcnlfdHlwZV9jaGFuZ2VkIGlzIG5lZWRlZCBmb3Ig
RVBUJ3MgZWZmZWN0aXZlIG1lbW9yeQp0eXBlIGNhbGN1bGF0aW9uLiAgVGhpcyBtZWFucyBtZW1v
cnlfdHlwZV9jaGFuZ2VkIGlzIEhWTSBvbmx5LgoKUHJvdmlkZSBhIHN0dWIgdG8gbWluaW1pc2Ug
Y29kZSBjaHVybi4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tdHJyLmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tdHJy
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L210cnIuaAppbmRleCA3ZWRjYjk0Li40YmU3MDRjIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L210cnIuaAorKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L210cnIuaApAQCAtOTIsNyArOTIsMTIgQEAgZXh0ZXJuIGJvb2xfdCBtdHJyX2ZpeF9y
YW5nZV9tc3Jfc2V0KHN0cnVjdCBkb21haW4gKiwgc3RydWN0IG10cnJfc3RhdGUgKiwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCByb3csIHVpbnQ2NF90IG1z
cl9jb250ZW50KTsKIGV4dGVybiBib29sX3QgbXRycl9kZWZfdHlwZV9tc3Jfc2V0KHN0cnVjdCBk
b21haW4gKiwgc3RydWN0IG10cnJfc3RhdGUgKiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ2NF90IG1zcl9jb250ZW50KTsKKyNpZmRlZiBDT05GSUdfSFZNCiBleHRl
cm4gdm9pZCBtZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKik7CisjZWxzZQorc3Rh
dGljIGlubGluZSB2b2lkIG1lbW9yeV90eXBlX2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkge30K
KyNlbmRpZgorCiBleHRlcm4gYm9vbF90IHBhdF9tc3Jfc2V0KHVpbnQ2NF90ICpwYXQsIHVpbnQ2
NF90IG1zcik7CiAKIGJvb2wgaXNfdmFyX210cnJfb3ZlcmxhcHBlZChjb25zdCBzdHJ1Y3QgbXRy
cl9zdGF0ZSAqbSk7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
