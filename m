From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Mon, 17 Sep 2018 07:03:27 -0600
Message-ID: <5B9FA61F02000078001E911F@prv1-mh.provo.novell.com>
References: <20180914111611.23008-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lj3m=l7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g1tBd-0003IE-9f
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 13:03:33 +0000
In-Reply-To: <20180914111611.23008-1-roger.pau@citrix.com>
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
Cc: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <rogewr.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA5LjE4IGF0IDEzOjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC00MjAsMTYgKzM5MywyNCBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfc2V0dXBfcDJtKHN0
cnVjdCBkb21haW4gKmQpCj4gICAgICAgICAgYWRkciA9IFBGTl9ET1dOKGQtPmFyY2guZTgyMFtp
XS5hZGRyKTsKPiAgICAgICAgICBzaXplID0gUEZOX0RPV04oZC0+YXJjaC5lODIwW2ldLnNpemUp
Owo+ICAKPiAtICAgICAgICBpZiAoIGFkZHIgPj0gTUIxX1BBR0VTICkKPiAtICAgICAgICAgICAg
cmMgPSBwdmhfcG9wdWxhdGVfbWVtb3J5X3JhbmdlKGQsIGFkZHIsIHNpemUpOwo+IC0gICAgICAg
IGVsc2UKPiAtICAgICAgICB7Cj4gLSAgICAgICAgICAgIEFTU0VSVChhZGRyICsgc2l6ZSA8IE1C
MV9QQUdFUyk7Cj4gLSAgICAgICAgICAgIHB2aF9zdGVhbF9sb3dfcmFtKGQsIGFkZHIsIHNpemUp
Owo+IC0gICAgICAgIH0KPiAtCj4gKyAgICAgICAgcmMgPSBwdmhfcG9wdWxhdGVfbWVtb3J5X3Jh
bmdlKGQsIGFkZHIsIHNpemUpOwo+ICAgICAgICAgIGlmICggcmMgKQo+ICAgICAgICAgICAgICBy
ZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgIGlmICggYWRkciA8IE1CMV9QQUdFUyApCj4gKyAgICAg
ICAgewo+ICsgICAgICAgICAgICAgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IHJlcyA9Cj4g
KyAgICAgICAgICAgICAgICAgaHZtX2NvcHlfdG9fZ3Vlc3RfcGh5cyhtZm5fdG9fbWFkZHIoX21m
bihhZGRyKSksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZm5f
dG9fdmlydChhZGRyKSwgc2l6ZSA8PCBQQUdFX1NISUZULAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdik7Cj4gKwo+ICsgICAgICAgICAgICBpZiAoIHJlcyAhPSBI
Vk1UUkFOU19va2F5ICkKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgcHJpbnRr
KCJGYWlsZWQgdG8gY29weSBbJSNseCwgJSNseCk6ICVkXG4iLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGFkZHIsIGFkZHIgKyBzaXplLCByZXMpOwo+ICsgICAgICAgICAgICAgICAgcmV0dXJu
IC1FRkFVTFQ7Cj4gKyAgICAgICAgICAgIH0KPiArICAgICAgICB9Cj4gICAgICB9CgpJcyB0aGVy
ZSBhbnkgZ3VhcmFudGVlIChpbiBwYXJ0aWN1bGFyIG9uLCBidXQgbm90IGxpbWl0ZWQgdG8gRUZJ
IHN5c3RlbXMpCmZvciBFODIwX1JBTSByZWdpb25zIHRvIG5ldmVyIHNwYW4gdGhlIDFNYiBib3Vu
ZGFyeT8gSWYgbm90LCB5b3UKbWF5IGVuZCB1cCBjb3B5aW5nIG1lbW9yeSBhYm92ZSAxTWIgaGVy
ZS4KCkZ1cnRoZXJtb3JlLCB3aGF0IGFib3V0IFJBTSAvIG5vbi1SQU0gYm91bmRhcmllcyBpbiB0
aGUgbWlkZGxlIG9mCmEgcGFnZSAod2hpY2ggaXMgcXVpdGUgY29tbW9uIGEgc2l0dWF0aW9uIGZv
ciB0aGUgZmlyc3QgTWIpPwoKSSBhbHNvIHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkbid0IGJlIHdv
cnRod2hpbGUgdG8gYXZvaWQgY2FsbGluZwptb2RpZnlfaWRlbnRpdHlfbW1pbygpIGZvciBSQU0g
cmFuZ2VzICh3aGljaCBhcmUgbm93IGdvaW5nIHRvIGJlCnJlLW1hcHBlZCBhbnl3YXkpLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
