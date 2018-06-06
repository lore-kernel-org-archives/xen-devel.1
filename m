From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 0/10] arm: more kconfig configurability
 and small default configs
Date: Wed, 06 Jun 2018 03:07:46 -0600
Message-ID: <5B17A46202000078001C8933@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
 <4a4819eb-42bf-555f-a82f-c8a18864a7e8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4a4819eb-42bf-555f-a82f-c8a18864a7e8@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA2LjE4IGF0IDE5OjUyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgoK
PiAKPiBPbiAwNC8wNi8xOCAxODoyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBIaSBh
bGwsCj4+IAo+PiBUaGlzIHBhdGNoIHNlcmllcyBpcyB0aGUgZmlyc3Qgc3RlcCB0b3dhcmQgYnVp
bGRpbmcgYSBzbWFsbCBjZXJ0aWZpYWJsZQo+PiBYZW4gaHlwZXJ2aXNvciBmb3IgQVJNIGJvYXJk
cy4KPj4gCj4+IEZpcnN0LCB0aGUgc2VyaWVzIG1ha2VzIGEgZmV3IGNoYW5nZXMgdG8gYWxsb3cg
ZGlzYWJsaW5nIG1vcmUga2NvbmZpZwo+PiBvcHRpb25zOiBtb3N0IG9mIHRoZW0gYWxyZWFkeSBl
eGlzdCBidXQgY2Fubm90IGJlIGRpc2FibGVkLgo+PiAKPj4gVGhlbiwgaXQgaW50cm9kdWNlcyBh
IHJlZmVyZW5jZSBrY29uZmlnIGZvciBSZW5lc2FzIFJDYXIgKGR1ZSB0byBwb3B1bGFyCj4+IGRl
bWFuZCwgY2FuZGlkYXRlIGZvciBjZXJ0aWZpY2F0aW9ucyksIFhpbGlueCBNUFNvQywgYW5kIGZv
ciBRRU1VCj4+IGFhcmNoNjQgKG5vdCBmb3IgY2VydGlmaWNhdGlvbnMsIGJ1dCB1c2VmdWwgZm9y
IGRlYnVnZ2luZykuCj4+IAo+PiBUaGUgbGFzdCBwYXRjaCBpbiB0aGUgc2VyaWVzIGFkZHMgYSBj
b252ZW5pZW50IGNsb2MgdGFyZ2V0IHRvIGNvdW50IHRoZQo+PiB0b3RhbCBsaW5lcyBvZiBjb2Rl
IG9mIHRoZSBzb3VyY2UgZmlsZXMgYnVpbHQuCj4+IAo+PiBBcyBhIGNvbnNlcXVlbmNlIG9mIHRo
ZXNlIGNoYW5nZXMsIHNvbWUgb3B0aW9ucyB3aWxsIGJlY29tZSB1c2VyLXZpc2libGUKPj4gYW5k
IG5vdCBkZXBlbmRlbnQgb24gQ09ORklHX0VYUEVSVC4gSXQgZG9lcyBub3QgbWVhbiB0aGF0IFhl
biBQcm9qZWN0Cj4+IHdpbGwgc2VjdXJpdHkgc3VwcG9ydCBhbGwgcG9zc2libGUgY29tYmluYXRp
b25zIG9mIGtjb25maWcgb3B0aW9ucy4KPj4gSW5zdGVhZCwgdGhlcmUgd2lsbCBiZSBhIHNtYWxs
IHNldCBvZiBwcmUtY2FubmVkIGNvbmZpZ3VyYXRpb25zIHRoYXQKPj4gd2lsbCBiZSBzdXBwb3J0
ZWQuICBTZWU6IGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1MjQyNDM4OTUxMjQz
MiAKPiAKPiBHZW9yZ2UsIElhbiwgSmFuLCBzaGFsbCBTVVBQT1JULk1EIGJlIHVwZGF0ZWQgdG8g
cmVmbGVjdCB0aGUgS2NvbmZpZyAKPiBjaGFuZ2VzPwo+IAo+IEkgYW0gbW9zdGx5IHRoaW5raW5n
IGFib3V0IHRoZSBib2FyZCBzdXBwb3J0IGFuZCB0aGUgZmFjdCB0aGF0IG1vcmUgCj4gb3B0aW9u
cyBvbiBBcm0gYXJlIHNlbGVjdGFibGUgYnkgdGhlIHVzZXJzLgoKSSB0aGluayB0aGF0IHdvdWxk
IGJlIHZlcnkgZGVzaXJhYmxlLCB5ZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
