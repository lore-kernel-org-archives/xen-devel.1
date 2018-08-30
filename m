From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xentrace: handle sparse cpu ids correctly
 in xen trace buffer handling
Date: Thu, 30 Aug 2018 11:28:58 +0200
Message-ID: <222d0135-0c6f-2327-2539-3479e938ec6c@suse.com>
References: <20180830075214.11807-1-jgross@suse.com>
 <5B87AA5202000078001E3677@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aext=ln=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvJGC-0006sT-Nx
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 09:29:04 +0000
In-Reply-To: <5B87AA5202000078001E3677@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMTA6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA4LjE4IGF0
IDA5OjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTIwMiw3ICsyMDIsNyBAQCBz
dGF0aWMgaW50IGFsbG9jX3RyYWNlX2J1ZnModW5zaWduZWQgaW50IHBhZ2VzKQo+PiAgICAgICAq
IEFsbG9jYXRlIGJ1ZmZlcnMgZm9yIGFsbCBvZiB0aGUgY3B1cy4KPj4gICAgICAgKiBJZiBhbnkg
ZmFpbHMsIGRlYWxsb2NhdGUgd2hhdCB5b3UgaGF2ZSBzbyBmYXIgYW5kIGV4aXQuCj4+ICAgICAg
ICovCj4+IC0gICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+ICsgICAgZm9yX2VhY2hfcHJl
c2VudF9jcHUoY3B1KQo+PiAgICAgIHsKPj4gICAgICAgICAgb2Zmc2V0ID0gdF9pbmZvX2ZpcnN0
X29mZnNldCArIChjcHUgKiBwYWdlcyk7Cj4+ICAgICAgICAgIHRfaW5mby0+bWZuX29mZnNldFtj
cHVdID0gb2Zmc2V0Owo+IAo+IERvZXNuJ3QgdGhpcyBnbyBhIGxpdHRsZSB0b28gZmFyPyBXaHkg
d291bGQgeW91IGFsbG9jYXRlIGJ1ZmZlcnMgZm9yIENQVXMKPiB3aGljaCBjYW4gbmV2ZXIgYmUg
YnJvdWdodCBvbmxpbmU/IFRoZXJlIG91Z2h0IHRvIGJlIGEgbWlkZGxlIGdyb3VuZCwKPiB3aGVy
ZSBvbmxpbmUtYWJsZSBDUFVzIGhhdmUgYnVmZmVycyBhbGxvY2F0ZWQsIGJ1dCBub24tb25saW5l
LWFibGUgb25lcwo+IHdvbid0LiBPbiBsYXJnZXIgc3lzdGVtcyBJIGd1ZXNzIHRoZSBkaWZmZXJl
bmNlIG1heSBiZSBxdWl0ZSBub3RpY2FibGUuCgpBY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnRzIGlu
IGluY2x1ZGUveGVuL2NwdW1hc2suaCBjcHVfcHJlc2VudF9tYXAKcmVwcmVzZW50cyB0aGUgcG9w
dWxhdGVkIGNwdXMuCgpJIGtub3cgdGhhdCBjdXJyZW50bHkgdGhlcmUgaXMgbm8gc3VwcG9ydCBm
b3Igb25saW5pbmcgYSBwYXJrZWQgY3B1CmFnYWluLCBidXQgSSB0aGluayBoYXZpbmcgdG8gdGhp
bmsgYWJvdXQgWGVudHJhY2UgYnVmZmVyIGFsbG9jYXRpb24gaW4KY2FzZSBvbmxpbmluZyBvZiBw
YXJrZWQgY3B1cyBpcyBhZGRlZCB3b3VsZCBiZSBhIG5lYXJseSAxMDAlIGNoYW5jZSB0bwppbnRy
b2R1Y2UgYSBidWcuCgpYZW50cmFjZSBpcyB1c2VkIGZvciB0ZXN0aW5nIHB1cnBvc2VzIG9ubHku
IFNvIElNSE8gYWxsb2NhdGluZyBzb21lIG1vcmUKbWVtb3J5IGlzIGFjY2VwdGFibGUuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
