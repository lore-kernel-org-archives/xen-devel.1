From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/6] vpt: fix create_periodic_time to use
 the irq parameter
Date: Fri, 15 Jun 2018 09:15:00 -0600
Message-ID: <5B23D7F402000078001CBAB5@prv1-mh.provo.novell.com>
References: <20180608150758.25307-1-roger.pau@citrix.com>
 <20180608150758.25307-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9pmr=jb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTqRI-0004h6-MP
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 15:15:00 +0000
In-Reply-To: <20180608150758.25307-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA2LjE4IGF0IDE3OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEluc3RlYWQgb2YgdGhlIHN0YWxlIHZhbHVlIGluc2lkZSB0aGUgcGVyaW9kaWNfdGltZSBzdHJ1
Y3QuCgpJIHRoaW5rIHRoaXMgd2FudHMgaXRzIHRpdGxlIGNoYW5nZWQsIGJlY2F1c2UgLi4uCgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdnB0LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Zw
dC5jCj4gQEAgLTQ0NSw4ICs0NDUsOCBAQCB2b2lkIGNyZWF0ZV9wZXJpb2RpY190aW1lKAo+ICAg
ICAgdWludDY0X3QgcGVyaW9kLCB1aW50OF90IGlycSwgdGltZV9jYiAqY2IsIHZvaWQgKmRhdGEp
Cj4gIHsKPiAgICAgIGlmICggIXB0LT5zb3VyY2UgfHwKPiAtICAgICAgICAgKHB0LT5pcnEgPj0g
TlJfSVNBSVJRUyAmJiBwdC0+c291cmNlID09IFBUU1JDX2lzYSkgfHwKPiAtICAgICAgICAgKHB0
LT5pcnEgPj0gaHZtX2RvbWFpbl9pcnEodi0+ZG9tYWluKS0+bnJfZ3NpcyAmJgo+ICsgICAgICAg
ICAoaXJxID49IE5SX0lTQUlSUVMgJiYgcHQtPnNvdXJjZSA9PSBQVFNSQ19pc2EpIHx8Cj4gKyAg
ICAgICAgIChpcnEgPj0gaHZtX2RvbWFpbl9pcnEodi0+ZG9tYWluKS0+bnJfZ3NpcyAmJgo+ICAg
ICAgICAgICAgcHQtPnNvdXJjZSA9PSBQVFNSQ19pb2FwaWMpICkKPiAgICAgIHsKPiAgICAgICAg
ICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKCi4uLiBmdXJ0aGVyIGRvd24gZnJvbSBoZXJlIHRoZXJl
IGlzIGEgdXNlIG9mIHRoZSBwYXJhbWV0ZXIuIE1heWJlCiJjaGVjayIgaW5zdGVhZCBvZiAidXNl
Ij8gV2l0aCB0aGF0IChlYXN5IGVub3VnaCB0byBkbyB3aGlsZQpjb21taXR0aW5nKQpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
