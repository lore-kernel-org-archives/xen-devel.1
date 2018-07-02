From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Mon, 02 Jul 2018 00:34:21 -0600
Message-ID: <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4twb=js=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fZsPq-0001NC-Gk
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 06:34:26 +0000
In-Reply-To: <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA2LjE4IGF0IDE4OjM5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMjkvMjAxOCAwNjozOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDI4LjA2LjE4IGF0IDE1OjAwLCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4gQEAg
LTQ2NjYsNiArNDY2NywyMyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPj4+ICAgICAgICAg
IH0KPj4+ICAgICAgICAgIGJyZWFrOwo+Pj4gIAo+Pj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9n
ZXRfbWVtX2FjY2VzczoKPj4+ICsgICAgICAgIGlmICggYS51Lm1lbV9hY2Nlc3MucGFkICkKPj4+
ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4+PiArICAgICAgICBlbHNlCj4+PiArICAgICAg
ICB7Cj4+PiArICAgICAgICAgICAgeGVubWVtX2FjY2Vzc190IGFjY2VzczsKPj4+ICsKPj4+ICsg
ICAgICAgICAgICByYyA9IHAybV9nZXRfbWVtX2FjY2VzcyhkLCBfZ2ZuKGEudS5tZW1fYWNjZXNz
LmdmbiksICZhY2Nlc3MsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YS51Lm1lbV9hY2Nlc3Mudmlldyk7Cj4+PiArICAgICAgICAgICAgaWYgKCAhcmMgKQo+Pj4gKyAg
ICAgICAgICAgIHsKPj4+ICsgICAgICAgICAgICAgICAgYS51Lm1lbV9hY2Nlc3MuaHZtbWVtX2Fj
Y2VzcyA9IGFjY2VzczsKPj4+ICsgICAgICAgICAgICAgICAgcmMgPSBfX2NvcHlfdG9fZ3Vlc3Qo
YXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsKPj4gCj4+IF9fY29weV9maWVsZF90b19ndWVzdCgp
PyBPciB3YWl0LCBubywgdGhlIGZ1bmN0aW9uIGFyZ3VtZW50IGlzIHN0aWxsIGEKPj4gaGFuZGxl
IG9mIHZvaWQuCj4+IAo+PiBBbmQgdGhlbiAtIGhlcmUgd2UgYXJlIGFnYWluOiBJcyBpdCByZWFz
b25hYmxlIHRvIHBlcm1pdCBhIGRvbWFpbiBpbnF1aXJpbmcKPj4gZm9yIGl0c2VsZj8KPiAKPiBB
IGdvb2QgcXVlc3Rpb24uIFBlcmhhcHMgdGhlIGZvbGxvd2luZyBhcmUgZGVjaXNpb24gZmFjdG9y
czoKPiAKPiAxLiBJdCBpcyBhbHJlYWR5IHBvc3NpYmxlIGZvciBhIGRvbWFpbiB0byBzZXQgbWVt
X2FjY2VzcyByZXN0cmljdGlvbnMKPiAodmlhIEhWTU9QX2FsdHAybV9zZXRfbWVtX2FjY2Vzcykg
b24gaXRzZWxmLgoKV2hpY2gsIGFzIGJlZm9yZSwgSSBjb25zaWRlciBhIGZsYXcuCgo+IDIuIFRh
bWFzJyBwYXRjaCBhbGxvd3Mgc2V0dGluZyB0aGlzIGV4dGVybmFsbHk6Cj4gCj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85NjM5Nzc5LyAKPiAKPiBTcGVjaWZpY2FsbHksIHdl
IGhhdmUgYWx0cDJtID0gZGlzYWJsZWQsIG1peGVkLCBleHRlcm5hbCBhbmQgbGltaXRlZCB0bwo+
IGNvbnRyb2wgd2hvIGlzIGFsbG93ZWQgdG8gZG8gd2hhdDoKPiAKPiBodHRwczovL3hlbmJpdHMu
eGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC5jZmcuNS5odG1sIAoKSW5kZWVkIHRoaXMgaGFz
IGF0IGxlYXN0IG1hZGUgdGhlIHNpdHVhdGlvbiBsZXNzIGJhZC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
