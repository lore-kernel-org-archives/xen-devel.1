From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v5 8/9] common/grant_table:
 block speculative out-of-bound accesses
Date: Thu, 7 Feb 2019 10:50:33 +0100
Message-ID: <ed4b5749-ccc0-05d0-bc29-29d2fd199d53@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-9-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0104A7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C5AF49B0200007800214548@prv1-mh.provo.novell.com>
 <0f80318d-7454-2055-694c-c22b40a7ddb0@amazon.de>
 <5C5B02E00200007800214606@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1APC=QO=amazon.de=prvs=93423d84c=nmanthey@srs-us1.protection.inumbo.net>)
 id 1grgKX-0000gh-NK
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 09:50:49 +0000
In-Reply-To: <5C5B02E00200007800214606@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi82LzE5IDE2OjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNi4wMi4xOSBhdCAx
NjowNiwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IE9uIDIvNi8xOSAxNTo1MiwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyOS4wMS4xOSBhdCAxNTo0MywgPG5tYW50aGV5QGFt
YXpvbi5kZT4gd3JvdGU6Cj4+Pj4gQEAgLTk2Myw2ICs5NjUsOSBAQCBtYXBfZ3JhbnRfcmVmKAo+
Pj4+ICAgICAgICAgIFBJTl9GQUlMKHVubG9ja19vdXQsIEdOVFNUX2JhZF9nbnRyZWYsICJCYWQg
cmVmICUjeCBmb3IgZCVkXG4iLAo+Pj4+ICAgICAgICAgICAgICAgICAgIG9wLT5yZWYsIHJndC0+
ZG9tYWluLT5kb21haW5faWQpOwo+Pj4+ICAKPj4+PiArICAgIC8qIE1ha2Ugc3VyZSB0aGUgYWJv
dmUgY2hlY2sgaXMgbm90IGJ5cGFzc2VkIHNwZWN1bGF0aXZlbHkgKi8KPj4+PiArICAgIG9wLT5y
ZWYgPSBhcnJheV9pbmRleF9ub3NwZWMob3AtPnJlZiwgbnJfZ3JhbnRfZW50cmllcyhyZ3QpKTsK
Pj4+PiArCj4+Pj4gICAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIG9wLT5yZWYp
Owo+Pj4+ICAgICAgc2hhaCA9IHNoYXJlZF9lbnRyeV9oZWFkZXIocmd0LCBvcC0+cmVmKTsKPj4+
PiAgICAgIHN0YXR1cyA9IHJndC0+Z3RfdmVyc2lvbiA9PSAxID8gJnNoYWgtPmZsYWdzIDogJnN0
YXR1c19lbnRyeShyZ3QsIG9wLT5yZWYpOwo+Pj4gSnVzdCBGVFIgLSB0aGlzIGlzIGEgY2FzZSB3
aGVyZSB0aGUgY2hhbmdlLCBhY2NvcmRpbmcgdG8gcHJpb3IKPj4+IGRpc2N1c3Npb24sIGlzIHBy
ZXR0eSB1bmxpa2VseSB0byBoZWxwIGF0IGFsbC4gVGhlIGNvbXBpbGVyIHdpbGwgaGF2ZQo+Pj4g
YSBoYXJkIHRpbWUgcmVhbGl6aW5nIHRoYXQgaXQgY291bGQga2VlcCB0aGUgcmVzdWx0IGluIGEg
cmVnaXN0ZXIgcGFzdAo+Pj4gdGhlIGFjdGl2ZV9lbnRyeV9hY3F1aXJlKCkgaW52b2NhdGlvbiwg
YXMgdGhhdCAtIGR1ZSB0byB0aGUgc3Bpbgo+Pj4gbG9jayBhY3F1aXJlZCB0aGVyZSAtIGFjdHMg
YXMgYSBjb21waWxlciBiYXJyaWVyLiBBbmQgbG9va2luZyBhdAo+Pj4gZ2VuZXJhdGVkIGNvZGUg
KGdjYyA4LjIpIGNvbmZpcm1zIHRoYXQgdGhlcmUncyBhIHJlbG9hZCBmcm9tIHRoZQo+Pj4gc3Rh
Y2suCj4+IEkgY291bGQgY2hhbmdlIHRoaXMgYmFjayB0byBhIHByaW9yIHZlcnNpb24gdGhhdCBw
cm90ZWN0cyBlYWNoIHJlYWQKPj4gb3BlcmF0aW9uLgo+IFRoYXQgb3IgdXNlIGJsb2NrX3NwZWN1
bGF0aW9uKCkgd2l0aCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkuCj4KPiBBbHNvIC0gd2h5IGFy
ZSB0aGVyZSBubyBjaGFuZ2VzIGF0IGFsbCB0byB0aGUgdW5tYXBfZ3JhbnRfcmVmKCkgLwo+IHVu
bWFwX2FuZF9yZXBsYWNlKCkgY2FsbCBwYXRocz8gTm90ZSBpbiBwYXJ0aWN1bGFyIHRoZSBzZWN1
cml0eQo+IHJlbGF0ZWQgY29tbWVudCBuZXh0IHRvIHRoZSBib3VuZHMgY2hlY2sgb2Ygb3AtPnJl
ZiB0aGVyZS4gSSd2ZQo+IGdvbmUgdGhyb3VnaCBlYXJsaWVyIHJldmlldyByb3VuZHMsIGJ1dCBJ
IGNvdWxkbid0IGZpbmQgYW4gaW5kaWNhdGlvbgo+IHRoYXQgdGhpcyBtaWdodCBoYXZlIGJlZW4g
dGhlIHJlc3VsdCBvZiByZXZpZXcgZmVlZGJhY2suCgpZb3UgYXJlIHJpZ2h0LiBJIGFtIG5vdCBz
dXJlIHdoZXRoZXIgSSBoYWQgYSBmaXggcGxhY2VkIHRoZXJlIGluIHRoZQpiZWdpbm5pbmcuIEkg
d2lsbCByZXBsYWNlIHRoZSBmaXJzdCAic21wX3JtYigpOyIgaW4gZnVuY3Rpb24KdW5tYXBfY29t
bW9uIGZvciB0aGUgbmV4dCBpdGVyYXRpb24gd2l0aCB0aGUgImJsb2NrX3NwZWN1bGF0aW9uIiBt
YWNyby4KClRoZSBvdGhlciBjaGVjayB1bmxpa2VseShvcC0+cmVmID49IG5yX2dyYW50X2VudHJp
ZXMocmd0KSkgY2FuIG9ubHkKcmVhY2ggb3V0LW9mLWJvdW5kcyBmb3IgdGhlIHVubWFwIGNhc2Us
IGluIGNhc2UgdGhlIG1hcC0+cmVmIGVudHJ5IGhhcwpiZWVuIG91dC1vZi1ib3VuZHMgYmVmb3Jl
aGFuZC4gSSBkaWQgbm90IGZpbmQgYW4gYXNzaWdubWVudCB0aGF0IGlzIG5vdApwcm90ZWN0ZWQg
YnkgYSBib3VuZCBjaGVjayBhbmQgYSBzcGVjdWxhdGlvbiBiYXJyaWVyIG9yIGFycmF5X25vc3Bl
Y19pbmRleC4KCkJlc3QsCk5vcmJlcnQKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdl
cm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3
OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
