From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: free_page_type() is PV-only
Date: Fri, 10 May 2019 15:21:53 +0100
Message-ID: <7241a2ec-0fe0-2a16-622f-d66d2166008c@citrix.com>
References: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP6PO-0002C8-UG
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:21:58 +0000
In-Reply-To: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxNToxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgaXQgYWxyZWFk
eSBoYXMgYSBDT05GSUdfUFYgd3JhcHBlZCBhcm91bmQgaXRzIGVudGlyZSBib2R5LCBpdCBpcwo+
IHN0aWxsIHVzZWxlc3NseSBpbnZva2luZyBtZm5fdG9fZ21mbigpLCB3aGljaCBpcyBhYm91dCB0
byBiZSByZXBsYWNlZC4KPiBBdm9pZCBtb3JwaGluZyB0aGlzIGNvZGUgaW50byBldmVuIG1vcmUg
c3VzcGljaW91cyBzaGFwZSBhbmQgcmVtb3ZlIHRoZQo+IGVmZmVjdGl2ZWx5IGRlYWQgY29kZSAt
IHRyYW5zbGF0ZWQgbW9kZSBoYXMgYmVlbiBtYWRlIGltcG9zc2libGUgZm9yIFBWCj4gcXVpdGUg
c29tZSB0aW1lIGFnby4KPgo+IEFkanVzdCBhbmQgZXh0ZW5kIHRoZSBhc3NlcnRpb25zIGF0IHRo
ZSBzYW1lIHRpbWU6IFRoZSBvcmlnaW5hbAo+IEFTU0VSVCghc2hhZG93X21vZGVfcmVmY291bnRz
KG93bmVyKSkgcmVhbGx5IG1lYW5zCj4gQVNTRVJUKCFzaGFkb3dfbW9kZV9lbmFibGVkKG93bmVy
KSB8fCAhcGFnaW5nX21vZGVfcmVmY291bnRzKG93bmVyKSksCj4gd2hpY2ggaXNuJ3Qgd2hhdCB3
ZSB3YW50IGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
