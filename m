From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 3/3] xen/x86: declare the efi symbol as weak
Date: Wed, 11 Jul 2018 17:34:50 +0200
Message-ID: <20180711153450.83331-4-roger.pau@citrix.com>
References: <20180711153450.83331-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebcd=j3=citrix.com=prvs=7236e92fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fdH9S-0007Qq-El
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 15:35:34 +0000
In-Reply-To: <20180711153450.83331-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbGxvd3MgcmVtb3ZpbmcgdGhlIERFRklORUQgY29uZGl0aW9uYWwgaW4gdGhlIGxpbmtl
ciBzY3JpcHQsIGFuZApmaXhlcyBjb21waWxhdGlvbiB3aXRoIGxsZDoKCmxkICAgIC1tZWxmX3g4
Nl82NF9mYnNkICAtVCB4ZW4ubGRzIC1OIHByZWxpbmsubyAtLWJ1aWxkLWlkPXNoYTEgXAogICAg
L3Jvb3Qvc3JjL3hlbi94ZW4vY29tbW9uL3N5bWJvbHMtZHVtbXkubyAtbyAvcm9vdC9zcmMveGVu
L3hlbi8ueGVuLXN5bXMuMApsZDogZXJyb3I6IHhlbi5sZHM6MjMzOiBzeW1ib2wgbm90IGZvdW5k
OiBlZmkKClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBEYW5pZWwgS2lwZXIgPGRhbmll
bC5raXBlckBvcmFjbGUuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgfCAyIC0tCiB4
ZW4vaW5jbHVkZS94ZW4vZWZpLmggIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5T
IGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCAzMjZlODg1NDAyLi45ZmE0MGE2ZDQ4IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMKQEAgLTMwNCw4ICszMDQsNiBAQCBTRUNUSU9OUwogICB9IDp0ZXh0CiAjZW5kaWYKIAot
ICBlZmkgPSBERUZJTkVEKGVmaSkgPyBlZmkgOiAuOwotCiAgIC8qIFNlY3Rpb25zIHRvIGJlIGRp
c2NhcmRlZCAqLwogICAvRElTQ0FSRC8gOiB7CiAgICAgICAgKiguZXhpdC50ZXh0KQpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL2VmaS5oIGIveGVuL2luY2x1ZGUveGVuL2VmaS5oCmluZGV4
IDQ0YjdkM2VjM2EuLjU2NzhkZjcyZjkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9lZmku
aAorKysgYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgKQEAgLTIxLDcgKzIxLDcgQEAgc3RydWN0IGVm
aSB7CiAgICAgdW5zaWduZWQgbG9uZyBzbWJpb3MzOyAgICAgIC8qIFNNQklPUyB2MyB0YWJsZSAq
LwogfTsKIAotZXh0ZXJuIHN0cnVjdCBlZmkgZWZpOworZXh0ZXJuIHN0cnVjdCBlZmkgX193ZWFr
IGVmaTsKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
