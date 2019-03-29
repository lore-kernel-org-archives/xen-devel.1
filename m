From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Fri, 29 Mar 2019 10:09:33 +0000
Message-ID: <b4405caf-6b06-6066-8f48-f35ba67bbdd2@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
 <22e51ded-0ca3-6832-dcc3-9849d782816c@citrix.com>
 <5C9CA1DA0200007800222683@prv1-mh.provo.novell.com>
 <e7e55dc3-0f64-78d7-6f0b-67a8da2453c0@citrix.com>
 <5C9CA85402000078002226AF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=erL7=SA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9oSA-0008KK-El
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 10:09:38 +0000
In-Reply-To: <5C9CA85402000078002226AF@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyOC8wMy8yMDE5IDEwOjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyOC4w
My4xOSBhdCAxMTo0MywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAy
OC8wMy8yMDE5IDEwOjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI4LjAzLjE5IGF0
IDExOjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gVXNpbmcgLXRh
cmdldCBpcyBmcm9tIHRoZSBDbGFuZyBpbnN0cnVjdGlvbnMgb24gY3Jvc3MgY29tcGlsYXRpb24s
IHdoaWNoCj4+Pj4gc2F5IHRvIGRvIGl0IHRoaXMgd2F5LiAgaHR0cHM6Ly9jbGFuZy5sbHZtLm9y
Zy9kb2NzL0Nyb3NzQ29tcGlsYXRpb24uaHRtbAo+Pj4+Cj4+Pj4gVGhlIHRhcmdldHMgc3VwcG9y
dGVkIHdpbGwgZGVwZW5kIG9uIHRoZSBjb25maWd1cmF0aW9uIENsYW5nIHdhcwo+Pj4+IGNvbXBp
bGVkIHdpdGgsIGJ1dCBDbGFuZyBzcGVjaWZpY2FsbHkgb3Bwb3NlcyBHQ0MncyB3YXkgb2YgcmVx
dWlyaW5nIHRoZQo+Pj4+IHVzZXIgdG8gcmVjb21waWxlIGZvciBldmVyeSBkaWZmZXJlbnQgdGFy
Z2V0LiAgSXQgaXMgZXhwZWN0ZWQgdGhhdCBhCj4+Pj4gcGFja2FnZXIgb2YgY2xhbmcgd2lsbCBl
bmFibGUgYWxsIG9mIHRoZSBzdXBwb3J0ZWQgdGFyZ2V0cyBpbiB0aGUKPj4+PiBwYWNrYWdlIHRo
ZXkgZGlzdHJpYnV0ZS4KPj4+IEFyZSB5b3Ugc3VyZSBhIGRpc3RybyBjYXJpbmcgYWJvdXQsIHNh
eSwgb25seSB4ODYgd291bGQgaW5kZWVkCj4+PiBlbmFibGUgQXJtIGFuZCBhbGwgc29ydHMgb2Yg
b3RoZXIgYXJjaGl0ZWN0dXJlcyBpbiB0aGUgY29tcGlsZXIsCj4+PiBqdXN0IGJlY2F1c2UgaXQg
Y2FuIGJlIGVuYWJsZWQ/IElPVyBJIGFzc3VtZSB0aGUgbmVlZCBmb3IgYW4KPj4+IG92ZXJyaWRl
IHRvIHRoZSBzeXN0ZW0gZGVmYXVsdCBjbGFuZyBiaW5hcmllcyB3b3VsZCBzdGlsbCBleGlzdC4K
Pj4KPj4gSSd2ZSBqdXN0IHRyaWVkLCBhbmQgVWJ1bnR1IDE2LjA0J3MgZGVmYXVsdCBjbGFuZy0z
LjggaXMgcGVyZmVjdGx5IGhhcHB5Cj4+IGNvbXBpbGluZyBBYXJjaDY0LCBhbmQgbWFrZXMgYSBz
dWl0YWJsZSBsb29raW5nIGVsZiBvYmplY3QuICAoSSBjYW4ndAo+PiBhY3R1YWxseSBkaXNhc3Nl
bWJsZSBpdCBiZWNhdXNlIG9iamR1bXAgY2hva2VzLCBidXQgLnRleHQgaXMgdGhlCj4+IGV4cGVj
dGVkIGxlbmd0aCkKPj4KPj4gQXMgdGhlIGNyb3NzLWNvbXBpbGF0aW9uIGRvY3VtZW50YXRpb24g
c3RhdGVzLCB0aGlzIGlzIGEgZGVsaWJlcmF0ZQo+PiBkZXNpZ24gZGVjaXNpb24gd2hpY2gsIGFt
b25nc3Qgb3RoZXIgdGhpbmdzLCBwcmV2ZW50cyBkaXN0cm9zIGZyb20KPj4gbmVlZGluZyB0byBt
YWludGFpbiBwZXItYXJjaCBwYWNrYWdlcy4KPiAKPiBBbGwgdW5kZXJzdG9vZCwganVzdCB0aGF0
IFVidW50dSBtYXkgbm90IGJlIGEgZ29vZCBleGFtcGxlLCBhcwo+IHRoZXJlIGxvb2tzIHRvIGJl
IFVidW50dSAxNi4wNCBmb3IgNjQtYml0IEFybS4KCkl0IG9jY3VycyB0byBtZSB0aGF0IG90aGVy
IGNvbXBpbGVyIG1heSBiZSBiYXNlZCBvbiBjbGFuZy9sbHZtIGJ1dCB1c2UgYSAKZGlmZmVyZW50
IG5hbWUuIEZvciBpbnN0YW5jZSwgdGhlIEFybSBDb21waWxlciBpcyBjYWxsZWQgYXJtY2xhbmcu
Cgphcm1jbGFuZyBvbmx5IHN1cHBvcnRzIGFybTMyIGFuZCBhcm02NCBhbmQgcmVxdWlyZSB0byBh
bHdheXMgcGFzcyB0aGUgdGFyZ2V0IAp0cmlwbGUgdXNpbmcgLS10YXJnZXQgKE5vdCB0aGUgLS0g
cmF0aGVyIHRoYW4gLSkuCgpTbyB3ZSB3b3VsZCBuZWVkIHRvIGNhdGVyIGRpZmZlcmVudCBjbGFu
ZyBiaW5hcnkgaW4gdGhlIGZ1dHVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
