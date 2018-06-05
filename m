From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] multiboot2: clarify usage of the address tag
Date: Tue, 5 Jun 2018 11:55:36 +0200
Message-ID: <20180605095536.44938-1-roger.pau__9823.09263567931$1528192479$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fpua=ix=citrix.com=prvs=687bbb327=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fQ8h3-00030c-W5
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 09:55:58 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgbm90ZSB0byBzcGVsbCBvdXQgdGhhdCBpZiB0aGUgYWRkcmVzcyB0YWcgaXMgbm90IHBy
ZXNlbnQgdGhlCmZpbGUgc2hvdWxkIGJlIGxvYWRlZCB1c2luZyB0aGUgZWxmIGhlYWRlci4KClNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0K
Q2M6IERhbmllbCBLaXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBkb2MvbXVsdGlib290LnRleGkgfCA2ICsrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RvYy9tdWx0aWJv
b3QudGV4aSBiL2RvYy9tdWx0aWJvb3QudGV4aQppbmRleCAyZTJkN2U3NGEuLjE5NmY5YzE3YSAx
MDA2NDQKLS0tIGEvZG9jL211bHRpYm9vdC50ZXhpCisrKyBiL2RvYy9tdWx0aWJvb3QudGV4aQpA
QCAtNTA5LDYgKzUwOSwxMiBAQCBhc3N1bWVzIHRoYXQgbm8gYnNzIHNlZ21lbnQgaXMgcHJlc2Vu
dC4KIAogQGVuZCB0YWJsZQogCitOb3RlOiBUaGlzIGluZm9ybWF0aW9uIGRvZXMgbm90IG5lZWQg
dG8gYmUgcHJvdmlkZWQgaWYgdGhlIGtlcm5lbAoraW1hZ2UgaXMgaW4gZWxmIGZvcm1hdCwgYnV0
IGl0IG11c3QgYmUgcHJvdmlkZWQgaWYgdGhlIGltYWdlIGlzIGluCithLm91dCBmb3JtYXQgb3Ig
aW4gc29tZSBvdGhlciBmb3JtYXQuIENvbXBsaWFudCBib290IGxvYWRlcnMgbXVzdCBiZQorYWJs
ZSB0byBsb2FkIGltYWdlcyB0aGF0IGFyZSBlaXRoZXIgaW4gZWxmIGZvcm1hdCBvciBjb250YWlu
IHRoZQorYWRkcmVzcyB0YWcgZW1iZWRkZWQgaW4gdGhlIE11bHRpYm9vdCBoZWFkZXIuCisKIEBz
dWJzZWN0aW9uIFRoZSBlbnRyeSBhZGRyZXNzIHRhZyBvZiBNdWx0aWJvb3QyIGhlYWRlcgogCiBA
ZXhhbXBsZQotLSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
