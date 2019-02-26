From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v10 4/6] xen/x86: use DEFINE_SYMBOL as
 required
Date: Tue, 26 Feb 2019 11:23:30 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902261121010.20689@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-4-git-send-email-sstabellini@kernel.org>
 <23669.29654.253921.9395@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyiKD-0007vT-9Y
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 19:23:33 +0000
In-Reply-To: <23669.29654.253921.9395@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "JBeulich@suse.com" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNiBGZWIgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU3RlZmFubyBTdGFiZWxs
aW5pIHdyaXRlcyAoIltQQVRDSCB2MTAgNC82XSB4ZW4veDg2OiB1c2UgREVGSU5FX1NZTUJPTCBh
cyByZXF1aXJlZCIpOgo+ID4gVXNlIFNZTUJPTFNfU1VCVFJBQ1QgYW5kIFNZTUJPTFNfQ09NUEFS
RSBpbiBjYXNlcyBvZiBjb21wYXJpc29ucyBhbmQKPiA+IHN1YnRyYWN0aW9ucyBvZjoKPiAuLi4K
PiA+IFVzZSBleHBsaWNpdCBjYXN0cyB0byB1aW50cHRyX3Qgd2hlbiBpdCBpcyBub3QgcG9zc2li
bGUgdG8gdXNlIHRoZQo+ID4gcHJvdmlkZWQgc3RhdGljIGlubGluZSBmdW5jdGlvbnMuCj4gCj4g
V2h5IGlzIGl0IG5vdCBwb3NzaWJsZSA/ICBZb3Ugd3JpdGU6Cj4gCj4gPiArLyoKPiA+ICsgKiBD
YW5ub3QgdXNlIERFRklORV9TWU1CT0wgYmVjYXVzZSBvZiB0aGUgd2F5IHRoZXkgYXJlIHBhc3Nl
ZCB0bwo+ID4gKyAqIGFwcGx5X2FsdGVybmF0aXZlcy4KPiA+ICsgKi8KPiA+ICBleHRlcm4gc3Ry
dWN0IGFsdF9pbnN0ciBfX2FsdF9pbnN0cnVjdGlvbnNbXSwgX19hbHRfaW5zdHJ1Y3Rpb25zX2Vu
ZFtdOwo+IAo+IEJ1dCBJIGRvbid0IGtub3cgd2h5IHlvdSBjYW4ndCBwYXNzIGEgYHN0cnVjdCBh
YnN0cmFjdF9hbHRfaW5zdHIqJyB0bwo+IGFwcGx5X2FsdGVybmF0aXZlcy4KPiAKPiBJTU8gaXQg
c2hvdWxkIGJlIHN0cmljdGx5IGZvcmJpZGRlbiB0byBldmVyIHdyaXRlIHRoaXMgZm9ybXVsYXRp
b24sIGFzCj4geW91IGhhdmUgYWJvdmUuICBTZWUgbXkgcHJvcG9zZWQgcnVsZSBjb21tZW50IGZv
ciBERUZJTkVfU1lNQk9MLgo+IAo+IEV2ZW4gaWYgeW91IGNhbid0IHVzZSB0aGUgbWFjcm9zIGF0
IHNvbWUgcGFydGljdWxhciBjYWxjdWxhdGlvbiBzaXRlLAo+IHlvdSBzaG91bGQgc3RpbGwgZW5z
dXJlIHRoYXQgLi4uX2VuZCBoYXMgYSBkaWZmZXJlbnQgdHlwZSwgdG8gbWFrZQo+IHN1cmUgdGhh
dCBubyB1bnNhZmUgdXNlcyBlc2NhcGUuCgpVbmZvcnR1bmF0ZWx5IF9fYXBwbHlfYWx0ZXJuYXRp
dmVzIGlzIGNhbGxlZCBmcm9tCl9fYXBwbHlfYWx0ZXJuYXRpdmVzX211bHRpX3N0b3AsIHdoZXJl
IGl0IHdvdWxkIGJlIGZpbmUgdG8gdXNlIHN0cnVjdAphYnN0cmFjdF9hbHRfaW5zdHIqLCBhbmQg
YWxzbyBmcm9tIGFwcGx5X2FsdGVybmF0aXZlcyB3aGljaCBpbiBhCnhlbi9jb21tb24gaW50ZXJm
YWNlIGNhbGxlZCBmcm9tIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgYW5kIGRvZXNuJ3Qgd29yawp3
aXRoIGxpbmtlciBzeW1ib2xzIEFGQUlDVC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
