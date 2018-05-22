From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 05/10] arm: make it possible to
 enable/disable UART drivers
Date: Tue, 22 May 2018 03:22:30 -0600
Message-ID: <5B03E15602000078001C484D@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-5-git-send-email-sstabellini@kernel.org>
 <5B03B9E5020000780013088E@prv1-mh.provo.novell.com>
 <1e655140-2a62-145c-6bcd-7e09676eea9b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1e655140-2a62-145c-6bcd-7e09676eea9b@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDEwOjUxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA1LzIyLzIwMTggMDc6MzQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IDA1LzIyLzE4IDI6NTMgQU0gPj4+
Cj4+PiBAQCAtNTMsNyArNTMsOCBAQCBjb25maWcgSEFTX1NDSUYKPj4+IG9yIFJlbmVzYXMgUi1D
YXIgR2VuIDIvMyBiYXNlZCBib2FyZCBzYXkgWS4KPj4gICA+Cj4+PiBjb25maWcgSEFTX0VIQ0kK
Pj4+IC0JYm9vbAo+Pj4gKwlib29sICJFSENJIFVBUlQgZHJpdmVyIgo+PiAKPj4gLi4uIGhlcmUg
aWlyYyBKdWxpZW4gaGFkIGFscmVhZHkgcG9pbnRlZCBvdXQgdGhhdCB0aGUgZHJpdmVycyBzaG91
bGQgbm90IGJlY29tZQo+PiBvcHRpb25hbCBvbiB4ODYsIGkuZS4gaW4gdGhlIGZvcm1lciBjYXNl
IHlvdSB3YW50IHRvIGF0dGFjaCBhIGNvbmRpdGlvbmFsIHRvIHRoZQo+PiBwcm9tcHQgd2hpbGUg
aW4gdGhlIGxhdHRlciBjYXNlIEkgZG9uJ3Qgc2VlIHdoeSB5b3UgYWRkIHRoZSBwcm9tcHQgaW4g
dGhlIGZpcnN0Cj4+IHBsYWNlIGlmIHlvdSBtZWFuIHRvIG1ha2UgaXQgeDg2LXNwZWNpZmljLiBX
aGljaCBieSBpdHNlbGYgaXMgcXVlc3Rpb25hYmxlCj4+IHRob3VnaDogV2h5IHdvdWxkIHRoaXMg
ZHJpdmVyIGJlIHg4Ni1zcGVjaWZpYywgd2hlbiBzbyBmYXIgaXQgKGNvbnNjaW91c2x5KQo+PiBo
YXNuJ3QgYmVlbj8gSWYgYW55dGhpbmcgSSBjb3VsZCBzZWUgaXQgZGVwZW5kIG9uIEhBU19QQ0ku
Cj4gCj4gSSBkb24ndCBleHBlY3QgdGhpcyBwaWVjZSBvZiBoYXJkd2FyZSB0byBjb21lIHVwIG9u
IEFybS4KCkkgY2FuIHJlYWQgdHdvIG1lYW5pbmdzIGludG8gdGhpczogWW91IGV4cGVjdCB0aGUg
ZHJpdmVyIHRvIG5vdCB3b3JrIG9uCkFSTSwgb3IgeW91J3JlIGNvbmZpZGVudCB0aGUgRUhDSSBw
cm90b2NvbCBvZiBhY2Nlc3NpbmcgVVNCIGhvc3QKY29udHJvbGxlciBoYXJkd2FyZSBub3QgdXNl
ZCBhbnl3aGVyZSBpbiBkZXZpY2VzIHVzZWQgb24gQVJNLiBXaGljaApvZiB0aGUgdHdvIHlvdSBt
ZWFuIGRldGVybWluZXMgd2hhdCB0aGUgY29ycmVjdCBhcHByb2FjaCBoZXJlIGlzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
