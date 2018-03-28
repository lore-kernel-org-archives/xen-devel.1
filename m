From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 for-4.11 2/2] libxc/x86: do not
 unconditionally set the module cmdline address
Date: Wed, 28 Mar 2018 12:55:16 +0100
Message-ID: <20180328115516.11134-2-roger.pau@citrix.com>
References: <20180328115516.11134-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jcus=gs=citrix.com=prvs=618139c40=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f19gD-0006qM-Rl
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 11:55:49 +0000
In-Reply-To: <20180328115516.11134-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3aWxsIGxlYWQgdG8gd3JpdGluZyBhIHdyb25nIG1vZHVsZSBjb21tYW5kIGxpbmUgcGh5
c2ljYWwgbWVtb3J5CmFkZHJlc3MgaWYgbm8gY29tbWFuZCBsaW5lIGlzIGFjdHVhbGx5IHByb3Zp
ZGVkLgoKVGhpcyBoYXNuJ3QgY2F1c2VkIHByb2JsZW1zIHNvIGZhciBiZWNhdXNlIGh2bWxvYWRl
ciBpcyB0aGUgb25seQpjb25zdW1lciBvZiB0aGUgbW9kdWxlcyBjb21tYW5kIGxpbmUsIGFuZCBp
dCdzIHVuY29uZGl0aW9uYWxseSBzZXQKaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4Yy94Y19kb21feDg2LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYu
YyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYuYwppbmRleCBmNGJhY2I5ZTI4Li44Nzg0ZDFhYTdk
IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19kb21feDg2LmMKKysrIGIvdG9vbHMvbGlieGMv
eGNfZG9tX3g4Ni5jCkBAIC0xNjUzLDExICsxNjUzLDEwIEBAIHN0YXRpYyB2b2lkIGFkZF9tb2R1
bGVfdG9fbGlzdChzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20sCiAgICAgICAgICAgICAgICA8IEhW
TUxPQURFUl9NT0RVTEVfQ01ETElORV9TSVpFKTsKICAgICAgICAgc3RybmNweShtb2R1bGVzX2Nt
ZGxpbmVfc3RhcnQgKyBIVk1MT0FERVJfTU9EVUxFX0NNRExJTkVfU0laRSAqIGluZGV4LAogICAg
ICAgICAgICAgICAgIGNtZGxpbmUsIEhWTUxPQURFUl9NT0RVTEVfQ01ETElORV9TSVpFKTsKKyAg
ICAgICAgbW9kbGlzdFtpbmRleF0uY21kbGluZV9wYWRkciA9IG1vZHVsZXNfY21kbGluZV9wYWRk
ciArCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBIVk1MT0FERVJfTU9E
VUxFX0NNRExJTkVfU0laRSAqIGluZGV4OwogICAgIH0KIAotICAgIG1vZGxpc3RbaW5kZXhdLmNt
ZGxpbmVfcGFkZHIgPQotICAgICAgICBtb2R1bGVzX2NtZGxpbmVfcGFkZHIgKyBIVk1MT0FERVJf
TU9EVUxFX0NNRExJTkVfU0laRSAqIGluZGV4OwotCiAgICAgc3RhcnRfaW5mby0+bnJfbW9kdWxl
cysrOwogfQogCi0tIAoyLjE2LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
