From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 5/5] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Wed, 14 Nov 2018 12:57:40 +0100
Message-ID: <20181114115740.1050-6-roger.pau@citrix.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zmga=nz=citrix.com=prvs=849b1dda4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gMto3-0005bj-SY
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 11:58:03 +0000
In-Reply-To: <20181114115740.1050-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QnJpZGdlcyBhcmUgbm90IGJlaGluZCBhbiBJT01NVSwgYW5kIGFyZSBhbHJlYWR5IHNwZWNpYWwg
Y2FzZWQgYW5kCnNpbGVudGx5IHNraXBwZWQgaW4gYW1kX2lvbW11X2FkZF9kZXZpY2UuIEFwcGx5
IHRoZSBzYW1lIHNwZWNpYWwKY2FzaW5nIHdoZW4gdXBkYXRpbmcgcGFnZSB0YWJsZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNj
OiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpD
YzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X21hcC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X21hcC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCmluZGV4IDZh
MmM4NzdkMzQuLjYyMjkyYTkwMTUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9tYXAuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
bWFwLmMKQEAgLTU5Myw2ICs1OTMsMTAgQEAgc3RhdGljIGludCB1cGRhdGVfcGFnaW5nX21vZGUo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBkZm4pCiAgICAgICAgIC8qIFVwZGF0ZSBk
ZXZpY2UgdGFibGUgZW50cmllcyB1c2luZyBuZXcgcm9vdCB0YWJsZSBhbmQgcGFnaW5nIG1vZGUg
Ki8KICAgICAgICAgZm9yX2VhY2hfcGRldiggZCwgcGRldiApCiAgICAgICAgIHsKKyAgICAgICAg
ICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICYmCisgICAgICAgICAgICAgICAgIHBkZXYt
PnR5cGUgPT0gREVWX1RZUEVfUENJX0hPU1RfQlJJREdFICkKKyAgICAgICAgICAgICAgICBjb250
aW51ZTsKKwogICAgICAgICAgICAgYmRmID0gUENJX0JERjIocGRldi0+YnVzLCBwZGV2LT5kZXZm
bik7CiAgICAgICAgICAgICBpb21tdSA9IGZpbmRfaW9tbXVfZm9yX2RldmljZShwZGV2LT5zZWcs
IGJkZik7CiAgICAgICAgICAgICBpZiAoICFpb21tdSApCi0tIAoyLjE5LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
