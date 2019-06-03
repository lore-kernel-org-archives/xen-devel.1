From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Mon, 03 Jun 2019 02:25:51 -0600
Message-ID: <5CF4D98F02000078002346D9@prv1-mh.provo.novell.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXiI1-0004U5-Jr
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:25:57 +0000
In-Reply-To: <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA2LjE5IGF0IDAyOjQwLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMzozNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiBBIGNvdXBsZSBvZiBhZGp1c3RtZW50cyBhcmUgbmVlZGVkIHRv
IGNvZGUgY2hlY2tpbmcgZm9yIGRvbV9jb3csIGJ1dAo+PiBzaW5jZSB0aGVyZSBhcmUgcHJldHR5
IGZldyBpdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gYWRqdXN0IHRob3NlIHRoYW4KPj4gdG8gc2V0
IHVwIGFuZCBrZWVwIGFyb3VuZCBhIG5ldmVyIHVzZWQgZG9tYWluLgo+Pgo+PiBUYWtlIHRoZSBv
cHBvcnR1bml0eSBhbmQgdGlnaHRlbiBhIEJVR19PTigpIGluIGVtdWwtcHJpdi1vcC5jOnJlYWRf
Y3IoKS4KPj4gKEFyZ3VhYmx5IHRoaXMgcGVyaGFwcyBzaG91bGRuJ3QgYmUgYSBCVUdfT04oKSBp
biB0aGUgZmlyc3QgcGxhY2UuKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBXaGlsZSBmb3Igbm93IHRoaXMgYXZvaWRzIGNyZWF0
aW5nIHRoZSBkb21haW4gb24gQXJtIG9ubHksIFRhbWFzJ2VzCj4+IHBhdGNoIHN3aXRjaGluZyB0
byBDT05GSUdfTUVNX1NIQVJJTkcgd2lsbCBtYWtlIHg4NiBsZXZlcmFnZSB0aGlzIHRvby4KPiAK
PiBwZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHRoaXMgcGF0Y2ggYmUgYXBwbGll
ZCBhZnRlciBteQo+IHBhdGNoPyBZb3UgYWxyZWFkeSBhY2tlZCB0aGF0IG9uZSBhbmQgaXQgY291
bGQgYmUgYXBwbGllZCBzZXBhcmF0ZWx5Cj4gZnJvbSB0aGUgc2VyaWVzIHRoYXQgSSd2ZSBzZW50
IGl0IGFzIHBhcnQgb2YuCgpPaCwgSSBkaWRuJ3QgcmVhbGl6ZSBpdCBpcyBlbnRpcmVseSBpbmRl
cGVuZGVudCBvZiB0aGUgZWFybGllciBwYXRjaGVzLgpJdCB3b3VsZCBoZWxwIHRvIHBvaW50IHN1
Y2ggb3V0IGluIHRoZSBjb3ZlciBsZXR0ZXIsIHJlcXVpcmluZyB0aGVyZQp0byBiZSBvbmUgaW4g
dGhlIGZpcnN0IHBsYWNlLgoKWWV0IGV2ZW4gdGhlbiAtIGl0J3MgbGFja2luZyBhbiBYU00gbWFp
bnRhaW5lciBhY2sgYWZhaWNzIChhbmQgaXQKbG9va3MgYXMgaWYgeW91IGRpZG4ndCBldmVuIENj
IERhbmllbCksIGFuZCBJJ2QgcHJlZmVyIGEgcGF0Y2ggbGlrZQp0aGlzIHRvIGFsc28gaGF2ZSBh
biBhY2sgZnJvbSBHZW9yZ2UsIGV2ZW4gaWYganVkZ2luZyBieSB0aGUgZmlsZXMKdG91Y2hlZCB0
aGlzIG1heSBub3QgYmUgc3RyaWN0bHkgcmVxdWlyZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
