From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 4/5] amd/iommu: assign iommu devices to
 Xen
Date: Wed, 14 Nov 2018 12:33:46 +0000
Message-ID: <6ea6b76d-3ea8-de3a-0a43-a60b4c9b9f3b@citrix.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xswa=nz=citrix.com=prvs=8491ce0b8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMuMg-0001t0-MC
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 12:33:50 +0000
In-Reply-To: <20181114115740.1050-5-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTEvMjAxOCAxMTo1NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFNRCBJT01NVSBk
ZXZpY2VzIGFyZSBleHBvc2VkIG9uIHRoZSBQQ0kgYnVzLCBhbmQgdGh1cyBhcmUgYXNzaWduZWQg
YnkKPiBkZWZhdWx0IHRvIHRoZSBoYXJkd2FyZSBkb21haW4uIFRoaXMgY2FuIGNhdXNlIGlzc3Vl
cyBiZWNhdXNlIHRoZQo+IElPTU1VIGRldmljZXMgYXJlIG5vdCBiZWhpbmQgYW4gSU9NTVUsIGFu
ZCBjb25jZXB0dWFsbHkgaXQncyBhbHNvIHdyb25nCj4gdG8gZ2l2ZSB0aGUgaGFyZHdhcmUgZG9t
YWluIG93bmVyc2hpcCBvZiB0aG9zZSBkZXZpY2VzIHNpbmNlIHRoZXkgYXJlCj4gaW4gdXNlIGJ5
IFhlbi4KPgo+IEZpeCB0aGlzIGJ5IGFzc2lnbmluZyB0aGUgUENJIElPTU1VIGRldmljZXMgdG8g
WGVuLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpUaGlzIGlzIHVuZm9ydHVuYXRlbHkgYSBzeW1wdG9tIG9mIG11Y2ggbW9yZSBiYXNp
YyBidWcgaW4gWGVuLgoKUGFydGljdWxhcmx5IG9uIHJlY2VudCBzZXJ2ZXIgcGFydHMsIHRoZXJl
IGFyZSBtYW55IFBDSSBkZXZpY2VzIHdoaWNoCnJlcHJlc2VudCBwcm9jZXNzb3IgaW50ZXJuYWxz
IGFuZCBhcmVuJ3Qgc2FmZSB0byBnaXZlIGV2ZW4gdG8gZG9tMC4KClRoZXJlIHNob3VsZCBiZSBh
IHdoaXRlbGlzdCBvZiBkZXZpY2VzIHdlIGNvbnNpZGVyIHNhZmUsIG5vdCBhIGJsYWNrbGlzdApv
ZiB0aG9zZSB3ZSBrbm93IHRvIGJlIHVuc2FmZS4KCk1vc3Qgb2YgdGhpcyBjYW4gYmUgY2xhc3Mg
YmFzZWQsIGFuZCBwZXJoYXBzIHdlIGNhbiBkZWZhdWx0LWFsbG93IGFsbApkZXZpY2VzIHdoaWNo
IGFyZSBzbG90cyBpbiBhIHJvb3QgcG9ydCwgYnV0IEkgYW0gLTEgdG8gdGhpcyBwYXRjaApiZWNh
dXNlIGl0IGlzIGZpeGluZyBhIHN5bXB0b20sIG5vdCB0aGUgcHJvYmxlbS4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
