From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 0/10] arm: more kconfig configurability
 and small default configs
Date: Tue, 12 Jun 2018 01:00:12 -0600
Message-ID: <5B1F6F7C02000078001CA386@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
 <4a4819eb-42bf-555f-a82f-c8a18864a7e8@arm.com>
 <5B17A46202000078001C8933@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1806111741270.14695@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806111741270.14695@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA2LjE4IGF0IDAyOjQxLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCA2IEp1biAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDA1LjA2
LjE4IGF0IDE5OjUyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAKPj4gPiAKPj4g
PiBPbiAwNC8wNi8xOCAxODoyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiA+PiBIaSBh
bGwsCj4+ID4+IAo+PiA+PiBUaGlzIHBhdGNoIHNlcmllcyBpcyB0aGUgZmlyc3Qgc3RlcCB0b3dh
cmQgYnVpbGRpbmcgYSBzbWFsbCBjZXJ0aWZpYWJsZQo+PiA+PiBYZW4gaHlwZXJ2aXNvciBmb3Ig
QVJNIGJvYXJkcy4KPj4gPj4gCj4+ID4+IEZpcnN0LCB0aGUgc2VyaWVzIG1ha2VzIGEgZmV3IGNo
YW5nZXMgdG8gYWxsb3cgZGlzYWJsaW5nIG1vcmUga2NvbmZpZwo+PiA+PiBvcHRpb25zOiBtb3N0
IG9mIHRoZW0gYWxyZWFkeSBleGlzdCBidXQgY2Fubm90IGJlIGRpc2FibGVkLgo+PiA+PiAKPj4g
Pj4gVGhlbiwgaXQgaW50cm9kdWNlcyBhIHJlZmVyZW5jZSBrY29uZmlnIGZvciBSZW5lc2FzIFJD
YXIgKGR1ZSB0byBwb3B1bGFyCj4+ID4+IGRlbWFuZCwgY2FuZGlkYXRlIGZvciBjZXJ0aWZpY2F0
aW9ucyksIFhpbGlueCBNUFNvQywgYW5kIGZvciBRRU1VCj4+ID4+IGFhcmNoNjQgKG5vdCBmb3Ig
Y2VydGlmaWNhdGlvbnMsIGJ1dCB1c2VmdWwgZm9yIGRlYnVnZ2luZykuCj4+ID4+IAo+PiA+PiBU
aGUgbGFzdCBwYXRjaCBpbiB0aGUgc2VyaWVzIGFkZHMgYSBjb252ZW5pZW50IGNsb2MgdGFyZ2V0
IHRvIGNvdW50IHRoZQo+PiA+PiB0b3RhbCBsaW5lcyBvZiBjb2RlIG9mIHRoZSBzb3VyY2UgZmls
ZXMgYnVpbHQuCj4+ID4+IAo+PiA+PiBBcyBhIGNvbnNlcXVlbmNlIG9mIHRoZXNlIGNoYW5nZXMs
IHNvbWUgb3B0aW9ucyB3aWxsIGJlY29tZSB1c2VyLXZpc2libGUKPj4gPj4gYW5kIG5vdCBkZXBl
bmRlbnQgb24gQ09ORklHX0VYUEVSVC4gSXQgZG9lcyBub3QgbWVhbiB0aGF0IFhlbiBQcm9qZWN0
Cj4+ID4+IHdpbGwgc2VjdXJpdHkgc3VwcG9ydCBhbGwgcG9zc2libGUgY29tYmluYXRpb25zIG9m
IGtjb25maWcgb3B0aW9ucy4KPj4gPj4gSW5zdGVhZCwgdGhlcmUgd2lsbCBiZSBhIHNtYWxsIHNl
dCBvZiBwcmUtY2FubmVkIGNvbmZpZ3VyYXRpb25zIHRoYXQKPj4gPj4gd2lsbCBiZSBzdXBwb3J0
ZWQuICBTZWU6IGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1MjQyNDM4OTUxMjQz
MiAKPj4gPiAKPj4gPiBHZW9yZ2UsIElhbiwgSmFuLCBzaGFsbCBTVVBQT1JULk1EIGJlIHVwZGF0
ZWQgdG8gcmVmbGVjdCB0aGUgS2NvbmZpZyAKPj4gPiBjaGFuZ2VzPwo+PiA+IAo+PiA+IEkgYW0g
bW9zdGx5IHRoaW5raW5nIGFib3V0IHRoZSBib2FyZCBzdXBwb3J0IGFuZCB0aGUgZmFjdCB0aGF0
IG1vcmUgCj4+ID4gb3B0aW9ucyBvbiBBcm0gYXJlIHNlbGVjdGFibGUgYnkgdGhlIHVzZXJzLgo+
PiAKPj4gSSB0aGluayB0aGF0IHdvdWxkIGJlIHZlcnkgZGVzaXJhYmxlLCB5ZXMuCj4gCj4gRG8g
eW91IHdhbnQgbWUgdG8gYWRkIGEgcGF0Y2ggZm9yIHRoYXQgdG8gdGhpcyBzZXJpZXMsIG9yIHNo
b3VsZCBJIGRvIGl0Cj4gc2VwYXJhdGVseT8KCkkgdGhpbmsgc3VjaCBhIGRvYyBjaGFuZ2Ugc2hv
dWxkIGJlIHJpZ2h0IGluIGEgcGFydGljdWxhciBwYXRjaCBtYWtpbmcKdGhpbmdzIHVzZXIgc2Vs
ZWN0YWJsZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
