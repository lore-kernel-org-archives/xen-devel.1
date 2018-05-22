From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 05/10] arm: make it possible to
 enable/disable UART drivers
Date: Tue, 22 May 2018 10:25:17 +0100
Message-ID: <558552aa-02f5-ec9a-e68a-4ed20c540f08@arm.com>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-5-git-send-email-sstabellini@kernel.org>
 <5B03B9E5020000780013088E@prv1-mh.provo.novell.com>
 <1e655140-2a62-145c-6bcd-7e09676eea9b@arm.com>
 <5B03E15602000078001C484D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B03E15602000078001C484D@prv1-mh.provo.novell.com>
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDUvMjIvMjAxOCAxMDoyMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMjIuMDUuMTggYXQgMTA6NTEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9u
IDA1LzIyLzIwMTggMDc6MzQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiAwNS8yMi8xOCAyOjUzIEFNID4+Pgo+
Pj4+IEBAIC01Myw3ICs1Myw4IEBAIGNvbmZpZyBIQVNfU0NJRgo+Pj4+IG9yIFJlbmVzYXMgUi1D
YXIgR2VuIDIvMyBiYXNlZCBib2FyZCBzYXkgWS4KPj4+ICAgID4KPj4+PiBjb25maWcgSEFTX0VI
Q0kKPj4+PiAtCWJvb2wKPj4+PiArCWJvb2wgIkVIQ0kgVUFSVCBkcml2ZXIiCj4+Pgo+Pj4gLi4u
IGhlcmUgaWlyYyBKdWxpZW4gaGFkIGFscmVhZHkgcG9pbnRlZCBvdXQgdGhhdCB0aGUgZHJpdmVy
cyBzaG91bGQgbm90IGJlY29tZQo+Pj4gb3B0aW9uYWwgb24geDg2LCBpLmUuIGluIHRoZSBmb3Jt
ZXIgY2FzZSB5b3Ugd2FudCB0byBhdHRhY2ggYSBjb25kaXRpb25hbCB0byB0aGUKPj4+IHByb21w
dCB3aGlsZSBpbiB0aGUgbGF0dGVyIGNhc2UgSSBkb24ndCBzZWUgd2h5IHlvdSBhZGQgdGhlIHBy
b21wdCBpbiB0aGUgZmlyc3QKPj4+IHBsYWNlIGlmIHlvdSBtZWFuIHRvIG1ha2UgaXQgeDg2LXNw
ZWNpZmljLiBXaGljaCBieSBpdHNlbGYgaXMgcXVlc3Rpb25hYmxlCj4+PiB0aG91Z2g6IFdoeSB3
b3VsZCB0aGlzIGRyaXZlciBiZSB4ODYtc3BlY2lmaWMsIHdoZW4gc28gZmFyIGl0IChjb25zY2lv
dXNseSkKPj4+IGhhc24ndCBiZWVuPyBJZiBhbnl0aGluZyBJIGNvdWxkIHNlZSBpdCBkZXBlbmQg
b24gSEFTX1BDSS4KPj4KPj4gSSBkb24ndCBleHBlY3QgdGhpcyBwaWVjZSBvZiBoYXJkd2FyZSB0
byBjb21lIHVwIG9uIEFybS4KPiAKPiBJIGNhbiByZWFkIHR3byBtZWFuaW5ncyBpbnRvIHRoaXM6
IFlvdSBleHBlY3QgdGhlIGRyaXZlciB0byBub3Qgd29yayBvbgo+IEFSTSwgb3IgeW91J3JlIGNv
bmZpZGVudCB0aGUgRUhDSSBwcm90b2NvbCBvZiBhY2Nlc3NpbmcgVVNCIGhvc3QKPiBjb250cm9s
bGVyIGhhcmR3YXJlIG5vdCB1c2VkIGFueXdoZXJlIGluIGRldmljZXMgdXNlZCBvbiBBUk0uIFdo
aWNoCj4gb2YgdGhlIHR3byB5b3UgbWVhbiBkZXRlcm1pbmVzIHdoYXQgdGhlIGNvcnJlY3QgYXBw
cm9hY2ggaGVyZSBpcy4KCkkgYW0gcXVpdGUgY29uZmlkZW50IHRoZSBFSENJIHByb3RvY29sIGlz
IG5vdCB1c2VkIG9uIEFybS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
