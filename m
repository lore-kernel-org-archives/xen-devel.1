From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 12/14] libxl_qmp: Store advertised QEMU
 version in libxl__ev_qmp
Date: Fri, 21 Dec 2018 16:05:35 +0000
Message-ID: <23581.3919.321875.829673@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-13-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaNIz-0003ZI-2q
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:05:41 +0000
In-Reply-To: <20181123135355.6001-13-anthony.perard@citrix.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY3IDEyLzE0XSBsaWJ4bF9xbXA6IFN0b3Jl
IGFkdmVydGlzZWQgUUVNVSB2ZXJzaW9uIGluIGxpYnhsX19ldl9xbXAiKToKPiBUaGlzIHdpbGwg
YmUgdXNlZCBpbiBhIGxhdGVyIHBhdGNoLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKPiArICAgICAgICBvID0gbGlieGxfX2pzb25fbWFwX2dldCgi
UU1QIiwgcmVzcCwgSlNPTl9NQVApOwo+ICsgICAgICAgIG8gPSBsaWJ4bF9fanNvbl9tYXBfZ2V0
KCJ2ZXJzaW9uIiwgbywgSlNPTl9NQVApOwo+ICsgICAgICAgIG8gPSBsaWJ4bF9fanNvbl9tYXBf
Z2V0KCJxZW11IiwgbywgSlNPTl9NQVApOwo+ICsjZGVmaW5lIEdSQUJfVkVSU0lPTihsZXZlbCkg
ZG8geyBcCj4gKyAgICAgICAgZXYtPnFlbXVfdmVyc2lvbi5sZXZlbCA9IGxpYnhsX19qc29uX29i
amVjdF9nZXRfaW50ZWdlciggXAo+ICsgICAgICAgICAgICBsaWJ4bF9fanNvbl9tYXBfZ2V0KCNs
ZXZlbCwgbywgSlNPTl9JTlRFR0VSKSk7IFwKPiArICAgICAgICB9IHdoaWxlICgwKQo+ICsgICAg
ICAgIEdSQUJfVkVSU0lPTihtYWpvcik7Cj4gKyAgICAgICAgR1JBQl9WRVJTSU9OKG1pbm9yKTsK
PiArICAgICAgICBHUkFCX1ZFUlNJT04obWljcm8pOwoKRWFybGllciBJIHdyb3RlOgoKICAgSSB3
b3VsZCBwcmVmZXIgdGhlIGluZGVudGF0aW9uIHRvIGJlIHN1Y2ggdGhhdCB0aGUgc3RhdGVtZW50
IGluc2lkZQogICB0aGUgbWFjcm8gaXMgaW5kZW50ZWQgbGlrZSB0aGUgb25lcyBvdXRzaWRlLgoK
SWUgbGlrZSB0aGlzOgoKICArI2RlZmluZSBHUkFCX1ZFUlNJT04obGV2ZWwpIGRvIHsgXAogICsg
ICAgZXYtPnFlbXVfdmVyc2lvbi5sZXZlbCA9IGxpYnhsX19qc29uX29iamVjdF9nZXRfaW50ZWdl
ciggXAogICsgICAgICAgIGxpYnhsX19qc29uX21hcF9nZXQoI2xldmVsLCBvLCBKU09OX0lOVEVH
RVIpKTsgXAogICsgICAgfSB3aGlsZSAoMCkKICArICAgICAgICBHUkFCX1ZFUlNJT04obWFqb3Ip
OwoKQnV0IHVwIHRvIHlvdS4gIE15IGFjayBzdGFuZHMgZWl0aGVyIHdheS4KClRoYW5rcywKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
