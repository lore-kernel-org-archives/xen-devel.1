From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/mm: free_page_type() is PV-only
Date: Fri, 10 May 2019 15:22:54 +0100
Message-ID: <20190510142254.GX2798@zion.uk.xensource.com>
References: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DGEm=TK=citrix.com=prvs=026c30d3b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hP6QO-0002Jv-Jm
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:23:00 +0000
Content-Disposition: inline
In-Reply-To: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDg6MTI6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgaXQgYWxyZWFkeSBoYXMgYSBDT05GSUdfUFYgd3JhcHBlZCBhcm91bmQgaXRz
IGVudGlyZSBib2R5LCBpdCBpcwo+IHN0aWxsIHVzZWxlc3NseSBpbnZva2luZyBtZm5fdG9fZ21m
bigpLCB3aGljaCBpcyBhYm91dCB0byBiZSByZXBsYWNlZC4KPiBBdm9pZCBtb3JwaGluZyB0aGlz
IGNvZGUgaW50byBldmVuIG1vcmUgc3VzcGljaW91cyBzaGFwZSBhbmQgcmVtb3ZlIHRoZQo+IGVm
ZmVjdGl2ZWx5IGRlYWQgY29kZSAtIHRyYW5zbGF0ZWQgbW9kZSBoYXMgYmVlbiBtYWRlIGltcG9z
c2libGUgZm9yIFBWCj4gcXVpdGUgc29tZSB0aW1lIGFnby4KPiAKPiBBZGp1c3QgYW5kIGV4dGVu
ZCB0aGUgYXNzZXJ0aW9ucyBhdCB0aGUgc2FtZSB0aW1lOiBUaGUgb3JpZ2luYWwKPiBBU1NFUlQo
IXNoYWRvd19tb2RlX3JlZmNvdW50cyhvd25lcikpIHJlYWxseSBtZWFucwo+IEFTU0VSVCghc2hh
ZG93X21vZGVfZW5hYmxlZChvd25lcikgfHwgIXBhZ2luZ19tb2RlX3JlZmNvdW50cyhvd25lcikp
LAo+IHdoaWNoIGlzbid0IHdoYXQgd2Ugd2FudCBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
