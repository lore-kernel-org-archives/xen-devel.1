From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v1.1 for-4.11 2/3] vpci/msix: fix incorrect
 usage of bitmask
Date: Mon, 26 Mar 2018 12:28:25 +0100
Message-ID: <20180326112826.80443-3-roger.pau@citrix.com>
References: <20180326112826.80443-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QJH-0006lq-0H
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:29:07 +0000
In-Reply-To: <20180326112826.80443-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGJpdG1hc2sgdG8gY2xlYXIgdGhlIGxvdyBiaXRzIG9mIHRoZSBhZGRyZXNzIGZpZWxkIHNo
b3VsZCBiZQp+MHhmZmZmZmZmZnVsbCwgdGhlIGN1cnJlbnQgbWFzayBjbGVhcnMgYm90aCB0aGUg
bG93IGFuZCB0aGUgaGlnaCBiaXRzCm9mIHRoZSBhZGRyZXNzIGZpZWxkLCB3aGljaCBpcyBhIGJ1
Zy4KClJlcG9ydGVkLWJ5OiBDb3Zlcml0eQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRy
aXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
YzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHhlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
dnBjaS9tc2l4LmMgYi94ZW4vZHJpdmVycy92cGNpL21zaXguYwppbmRleCAzYjM3OGMyZTUxLi5i
Y2Y2MzI1NmY2IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaXguYworKysgYi94ZW4v
ZHJpdmVycy92cGNpL21zaXguYwpAQCAtMzI4LDcgKzMyOCw3IEBAIHN0YXRpYyBpbnQgbXNpeF93
cml0ZShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBpbnQgbGVu
LAogICAgICAgICAgICAgZW50cnktPmFkZHIgPSBkYXRhOwogICAgICAgICAgICAgYnJlYWs7CiAg
ICAgICAgIH0KLSAgICAgICAgZW50cnktPmFkZHIgJj0gfjB4ZmZmZmZmZmY7CisgICAgICAgIGVu
dHJ5LT5hZGRyICY9IH4weGZmZmZmZmZmdWxsOwogICAgICAgICBlbnRyeS0+YWRkciB8PSBkYXRh
OwogICAgICAgICBicmVhazsKIAotLSAKMi4xNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
