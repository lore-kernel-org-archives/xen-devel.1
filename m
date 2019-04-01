From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Mon, 1 Apr 2019 08:49:32 +0200
Message-ID: <10544c22-138e-c993-ca7f-3a3392e03243@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5CA1B285020000780022361D@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAqlE-0000cu-Fj
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 06:49:36 +0000
In-Reply-To: <5CA1B285020000780022361D@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAwODo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDMuMTkg
YXQgMTY6MDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBWaWEgYm9vdCBwYXJhbWV0ZXIg
c2NoZWRfZ3JhbnVsYXJpdHk9Y29yZSAob3Igc2NoZWRfZ3JhbnVsYXJpdHk9c29ja2V0KQo+PiBp
dCBpcyBwb3NzaWJsZSB0byBjaGFuZ2UgdGhlIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkgZnJvbSB0
aHJlYWQgKHRoZQo+PiBkZWZhdWx0KSB0byBlaXRoZXIgd2hvbGUgY29yZXMgb3IgZXZlbiBzb2Nr
ZXRzLgo+IAo+IE9uZSBmdXJ0aGVyIGdlbmVyYWwgcXVlc3Rpb24gY2FtZSB0byBtaW5kOiBIb3cg
YWJvdXQgYWxzbyBoYXZpbmcKPiAic2NoZWQtZ3JhbnVsYXJpdHk9dGhyZWFkIiAob3IgIi4uLj1u
b25lIikgdG8gcmV0YWluIGN1cnJlbnQKPiBiZWhhdmlvciwgYXQgbGVhc3QgdG8gaGF2ZSBhbiBl
YXN5IHdheSB0byBjb21wYXJlIGVmZmVjdHMgaWYKPiB3YW50ZWQ/IEJ1dCBwZXJoYXBzIGFsc28g
dG8gYWxsb3cgdG8gZGVhbCB3aXRoIHBvdGVudGlhbCByZXNvdXJjZXMKPiB3YXN0aW5nIGNvbmZp
Z3VyYXRpb25zIGxpa2UgaGF2aW5nIG1vc3RseSBWTXMgd2l0aCBlLmcuIGFuIG9kZAo+IG51bWJl
ciBvZiB2Q1BVLXMuCgpGaW5lIHdpdGggbWUuCgo+IFRoZSBvdGhlciBxdWVzdGlvbiBvZiBjb3Vy
c2UgaXMgd2hldGhlciB0aGUgdGVybXMgdGhyZWFkLCBjb3JlLAo+IGFuZCBzb2NrZXQgYXJlIGdl
bmVyaWMgZW5vdWdoIHRvIGJlIHVzZWQgaW4gYXJjaGl0ZWN0dXJlCj4gaW5kZXBlbmRlbnQgY29k
ZS4gRXZlbiBvbiB4ODYgaXQgYWxyZWFkeSBsZWF2ZXMgb3V0IC8gdW5jbGVhcgo+IHdoZXJlIC8g
aG93IGUuZy4gQU1EJ3MgY29tcHV0ZSB1bml0cyB3b3VsZCBiZSBjbGFzc2lmaWVkLiBJCj4gZG9u
J3QgaGF2ZSBhbnkgZ29vZCBzdWdnZXN0aW9uIGZvciBhYnN0cmFjdGlvbiwgc28gcG9zc2libHkK
PiB0aGUgdGVybXMgdXNlZCBtYXkgd2FudCB0byBiZWNvbWUgYXJjaC1zcGVjaWZpYy4KCkkgZm9s
bG93ZWQgdGhlIGFscmVhZHkga25vd24gdGVybXMgZnJvbSB0aGUgY3JlZGl0Ml9ydW5xdWV1ZQpw
YXJhbWV0ZXIuIEkgdGhpbmsgdGhleSBzaG91bGQgbWF0Y2guIFdoaWNoIHdvdWxkIGNhbGwgZm9y
CiJzY2hlZC1ncmFudWxhcml0eT1jcHUiIGluc3RlYWQgb2YgInRocmVhZCIuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
