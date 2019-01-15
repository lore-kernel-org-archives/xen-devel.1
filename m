From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [BUG] docs: our man page generation uses
 http://man.he.net/ by default which causes broken links. It should be
 changed to point to a relative path
Date: Tue, 15 Jan 2019 15:47:26 +0000
Message-ID: <20190115154726.GF1271@perard.uk.xensource.com>
References: <24902838-BA23-4032-8FCC-384CA51C0A4E@citrix.com>
 <1D083D7F-2572-4B9E-9CC9-00973D7F8A5E@xenproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GDKA=PX=citrix.com=prvs=911f1f4f8=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gjQxd-0007tm-00
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 15:49:05 +0000
Content-Disposition: inline
In-Reply-To: <1D083D7F-2572-4B9E-9CC9-00973D7F8A5E@xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiA+IE9uIDIgQXVnIDIwMTgsIGF0IDEyOjI0LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gCj4gPiBIaSBhbGwsCj4gPiAKPiA+IG1vc3Qgb2Ygb3VyIG1hbiBw
YWdlcyBvbiBwcmV0dHkgbXVjaCBhbGwgcmVsZWFzZXMgZnJvbSA0LjIgY29udGFpbiBicm9rZW4g
bGlua3MuIAo+ID4gCj4gPiBGb3IgZXhhbXBsZToKPiA+IEluIGh0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2RvY3MvdW5zdGFibGUvbWFuL3hsLmNmZy41Lmh0bWwgdGhlIHNvdXJjZSBjb250YWluczoK
PiA+IAo+ID4gIkZvciBtb3JlIGRldGFpbHMsIHNlZSBMPHhsLW51bWEtcGxhY2VtZW50KDcpPi4i
IAo+ID4gTWFwcyBvbnRvIGh0dHA6Ly9tYW4uaGUubmV0L21hbjcveGwtbnVtYS1wbGFjZW1lbnQg
IChkb2VzIG5vdCBleGlzdCkKPiA+IAo+ID4g4oCcU2VlIEw8aHR0cDovL21hbi5oZS5uZXQvbWFu
NS94bC1kaXNrLWNvbmZpZ3VyYXRpb24+IGZvciBtb3JlIGRldGFpbHMu4oCdIAo+ID4gTWFwcyBv
bnRvIGh0dHA6Ly9tYW4uaGUubmV0L21hbjUveGwtZGlzay1jb25maWd1cmF0aW9uIChkb2VzIG5v
dCBleGlzdCkKPiA+IAo+ID4gRXRjLgo+ID4gCj4gPiBUaGVyZSBzZWVtIHRvIGJlIHR3byBpc3N1
ZXM6Cj4gPiAqIFRoZSByb290IHBhdGggaHR0cDovL21hbi5oZS5uZXQsIHdoaWNoIGlzIGluY29y
cmVjdAo+ID4gKiBUaGUgcmVzb2x1dGlvbiBvZiBmaWxlbmFtZXMgdG8gbWFuPHg+LzxuYW1lPjog
c2hvdWxkIGJlIG1hbi88bmFtZT4uPHg+Lmh0bWwKPiA+IAo+ID4gUHJvYmFibHkgd2UgbmVlZCB0
byBmZWVkIHNvbWUgYXJndW1lbnRzIHRvIHByb2JhYmx5IHdlIG5lZWQgdG8gZmVlZCBzb21lIGFy
Z3VtZW50cyAKPiA+IHRvIHBvZDJodG1sIGluIG9yZGVyIHRvIGdlbmVyYXRlIHRoZSBjb3JyZWN0
IHVybHMuIFNlZSAgaHR0cHM6Ly9wZXJsZG9jLnBlcmwub3JnL3BvZDJodG1sLmh0bWwgCj4gPiAo
bWF5YmUgd2UgbmVlZCB3ZSBuZWVkIOKAk2h0bWxkaXIpLiBGb3Igb3VyIGRvY3MgYnVpbGQsIHRo
aXMgc2hvdWxkIHByb2JhYmx5IGdvIHRvIAo+ID4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9j
cy91bnN0YWJsZS9tYW4vIHdoaWxlIGZvciBsb2NhbCBpbnN0YWxscyB0byAKPiA+ICR7cHJlZml4
fS9zaGFyZS9kb2MveGVuL2h0bWwvbWFuIG9yIHNvbWV0aGluZyBsaWtlIGl0Lgo+ID4gCj4gPiBJ
IGhhZCBhIGxvb2sgdG8gc2VlIHdoZXRoZXIgSSBjYW4gZml4IHRoaXMsIGJ1dCB0aGF0IHNlZW1z
IGEgbGl0dGxlIHRvbyBjb21wbGV4IGZvciBtZQoKSSd2ZSBtYW5hZ2VkIHRvIGRvIHNvbWV0aGlu
ZyBhYm91dCBpdCwgYW5kIGl0IGlzIGluZGVlZCBjb21wbGV4LiBCdXQKbWF5YmUgcG9kMmh0bWwg
aXNuJ3QgdGhlIHJpZ2h0IHRvb2wuIEFueXdheSwgSSBoYXZlIGdvdCB0d28gcGF0Y2hzIHRvCmZv
bGxvdy4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
