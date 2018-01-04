From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 40/74] xen/x86: report domain id on cpuid
Date: Thu, 4 Jan 2018 13:05:51 +0000
Message-ID: <20180104130625.28605-41-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5ZY-0003ta-L0
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:28:40 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClVzZSB0aGUgZWJ4
IHJlZ2lzdGVyIG9mIHRoZSBoeXBlcnZpc29yIGxlYWYgMS4gVGhlIGVheCByZWdpc3RlciBvbgp0
aGlzIGxlYWYgaXMgYWxyZWFkeSB1c2VkIHRvIHJlcG9ydCB0aGUgWGVuIG1ham9yIGFuZCBtaW5v
ciB2ZXJzaW9ucy4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgICAgIHwgMSAr
CiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1aWQuaCB8IDMgKystCiAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKaW5kZXggZGIxNmE0NDQxNy4u
NDJjNTBiMWNkNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2Fy
Y2gveDg2L3RyYXBzLmMKQEAgLTg1Myw2ICs4NTMsNyBAQCB2b2lkIGNwdWlkX2h5cGVydmlzb3Jf
bGVhdmVzKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBsZWFmLAogCiAgICAgY2FzZSAx
OgogICAgICAgICByZXMtPmEgPSAoeGVuX21ham9yX3ZlcnNpb24oKSA8PCAxNikgfCB4ZW5fbWlu
b3JfdmVyc2lvbigpOworICAgICAgICByZXMtPmIgPSBkLT5kb21haW5faWQ7CiAgICAgICAgIGJy
ZWFrOwogCiAgICAgY2FzZSAyOgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
eDg2L2NwdWlkLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1aWQuaAppbmRleCBl
Yjc2ODc1ZDBlLi5hMTdjODY4MmEwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC14ODYvY3B1aWQuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1aWQuaApA
QCAtNTcsNyArNTcsOCBAQAogICogTGVhZiAyICgweDQwMDAweDAxKQogICogRUFYWzMxOjE2XTog
WGVuIG1ham9yIHZlcnNpb24uCiAgKiBFQVhbMTU6IDBdOiBYZW4gbWlub3IgdmVyc2lvbi4KLSAq
IEVCWC1FRFg6IFJlc2VydmVkIChjdXJyZW50bHkgYWxsIHplcm9lcykuCisgKiBFQlg6IERvbWFp
biBpZC4KKyAqIEVDWC1FRFg6IFJlc2VydmVkIChjdXJyZW50bHkgYWxsIHplcm9lcykuCiAgKi8K
IAogLyoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
