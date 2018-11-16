From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6 09/11] libxl_qmp: Store advertised QEMU
 version in libxl__ev_qmp
Date: Fri, 16 Nov 2018 12:17:57 +0000
Message-ID: <23534.46453.225593.988250@mariner.uk.xensource.com>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-10-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lntb=n3=citrix.com=prvs=85141603c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gNd4T-00026M-06
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 12:18:01 +0000
In-Reply-To: <20181112164930.25893-10-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY2IDA5LzExXSBsaWJ4bF9xbXA6IFN0b3Jl
IGFkdmVydGlzZWQgUUVNVSB2ZXJzaW9uIGluIGxpYnhsX19ldl9xbXAiKToKPiBUaGlzIHdpbGwg
YmUgdXNlZCBpbiBhIGxhdGVyIHBhdGNoLgoKVGhhbmtzLiAgSSBoYXZlIG9uZSBjb21tZW50IGFi
b3V0IGRlZmVuc2l2ZSBwcm9ncmFtbWluZyBpbiB0aGUgbWFjcm8sCmFuZCBhIGNvdXBsZSBvZiBm
b3JtYXR0aW5nIG5pdHMuCgo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogU3RvcmUgYWR2ZXJ0
aXNlZCBRRU1VIHZlcnNpb24KPiArICAgICAgICAgKiB7ICJRTVAiOiB7ICJ2ZXJzaW9uIjogewo+
ICsgICAgICAgICAqICAgICAicWVtdSI6IHsgIm1ham9yIjogaW50LCAibWlub3IiOiBpbnQsICJt
aWNybyI6IGludCB9IH0gfSB9Cj4gKyAgICAgICAgICovCj4gKyAgICAgICAgbyA9IGxpYnhsX19q
c29uX21hcF9nZXQoIlFNUCIsIHJlc3AsIEpTT05fTUFQKTsKPiArICAgICAgICBvID0gbGlieGxf
X2pzb25fbWFwX2dldCgidmVyc2lvbiIsIG8sIEpTT05fTUFQKTsKPiArICAgICAgICBvID0gbGli
eGxfX2pzb25fbWFwX2dldCgicWVtdSIsIG8sIEpTT05fTUFQKTsKPiArI2RlZmluZSBHUkFCX1ZF
UlNJT04obGV2ZWwpIFwKPiArICAgIGV2LT5xZW11X3ZlcnNpb24ubGV2ZWwgPSBsaWJ4bF9fanNv
bl9vYmplY3RfZ2V0X2ludGVnZXIoIFwKPiArICAgICAgICBsaWJ4bF9fanNvbl9tYXBfZ2V0KCNs
ZXZlbCwgbywgSlNPTl9JTlRFR0VSKSk7Cj4gKyAgICAgICAgR1JBQl9WRVJTSU9OKG1ham9yKTsK
CllvdXIgR1JBQl9WRVJTSU9OIG1hY3JvIG91Z2h0IHRvIGhhdmUgYSBwYWlyIG9mICggKSBhcm91
bmQgaXQsIG9yIHRoZQpkb3suLi59d2hpbGUoMCkgdHJpY2suICBJIHdvdWxkIHByZWZlciB0aGUg
aW5kZW50YXRpb24gdG8gYmUgc3VjaCB0aGF0CnRoZSBzdGF0ZW1lbnQgaW5zaWRlIHRoZSBtYWNy
byBpcyBpbmRlbnRlZCBsaWtlIHRoZSBvbmVzIG91dHNpZGUuCgo+ICsgICAgICAgIEdSQUJfVkVS
U0lPTihtaW5vcik7Cj4gKyAgICAgICAgR1JBQl9WRVJTSU9OKG1pY3JvKTsKPiArI3VuZGVmIEdS
QUJfVkVSU0lPTgo+ICsgICAgICAgIExPR0QoREVCVUcsIGV2LT5kb21pZCwgIlFFTVUgdmVyc2lv
bjogJWQuJWQuJWQiLAo+ICsgICAgICAgICAgICAgZXYtPnFlbXVfdmVyc2lvbi5tYWpvciwgZXYt
PnFlbXVfdmVyc2lvbi5taW5vciwKPiArICAgICAgICAgICAgIGV2LT5xZW11X3ZlcnNpb24ubWlj
cm8pOwoKQSB2ZXJ5IG1pbm9yIHBvaW50LCBidXQgaWYgeW91IGJyb2tlIHRoZSBsaW5lIGFmdGVy
IGBtYWpvciwnIHRoaXMKd291bGQgbWFrZSB0aGUgdGhyZWUgaWRlbnRpY2FsIHRoaW5ncyBtb3Jl
IHNpbWlsYXItbG9va2luZy4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
