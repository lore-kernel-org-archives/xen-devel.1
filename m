From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] x86: move invocations of
 hvm_flush_guest_tlbs()
Date: Mon, 22 Jan 2018 02:30:44 -0700
Message-ID: <5A65BD5402000078001A0EEC@prv-mh.provo.novell.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6224C302000078001A0788@prv-mh.provo.novell.com>
 <CAFLBxZbFP=mPWe6ah3njGBYrMeqnPATie5-TJ4V5WAMF2=U_ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edYRG-0002Wq-MD
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 09:30:50 +0000
In-Reply-To: <CAFLBxZbFP=mPWe6ah3njGBYrMeqnPATie5-TJ4V5WAMF2=U_ew@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE4OjI5LCA8ZHVubGFwZ0B1bWljaC5lZHU+IHdyb3RlOgo+IE9u
IEZyaSwgSmFuIDE5LCAyMDE4IGF0IDQ6MDIgUE0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+IFRoZWlyIG5lZWQgaXMgbm90IHRpZWQgdG8gdGhlIGFjdHVhbCBmbHVz
aGluZyBvZiBUTEJzLCBidXQgdGhlIHRpY2tpbmcKPj4gb2YgdGhlIFRMQiBjbG9jay4gTWFrZSB0
aGlzIG1vcmUgb2J2aW91cyBieSBmb2xkaW5nIHRoZSB0d28gaW52b2NhdGlvbnMKPj4gaW50byBh
IHNpbmdsZSBvbmUgaW4gcHJlX2ZsdXNoKCkuCj4gCj4gU28gbm93IHByZV9mbHVzaCgpIGFjdHVh
bGx5IGRvZXMgdGhlIGZsdXNoPwo+IAo+IEkgZG9uJ3Qgb2JqZWN0IHRvIHRoZSBjaGFuZ2UgcGVy
IHNlIChhbmQgZnJvbSB3aGF0IEkgY2FuIHRlbGwgaXQncwo+IHRlY2huaWNhbGx5IGNvcnJlY3Qp
LCBidXQgSSB0aGluayB5b3UncmUgbWFraW5nIHRoaW5ncyBhbnkgY2xlYXJlci4KCkRpZCB5b3Ug
bWVhbiAiSSBkb24ndCB0aGluayI/Cgpodm1fZmx1c2hfZ3Vlc3RfdGxicygpLCBkZXNwaXRlIGl0
cyBuYW1lLCBkb2VzIG5vdCBhY3R1YWxseSBkbyBhbnkKZmx1c2hpbmcuIEl0IGlzIGEgc2ltcGxl
IHdyYXBwZXIgYXJvdW5kIGh2bV9hc2lkX2ZsdXNoX2NvcmUoKSwKd2hpY2ggb25seSBpbmNyZW1l
bnRzIHRoZSBBU0lEIGdlbmVyYXRpb24gY291bnRlci4gSSB2ZXJ5IG11Y2gKdmlldyB0aGlzIGFz
IHNvbWV0aGluZyB0aGF0IGF0IGxlYXN0IGVxdWFsbHkgd2VsbCBjYW4gYmUgZG9uZSBpbgpwcmVf
Zmx1c2goKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
