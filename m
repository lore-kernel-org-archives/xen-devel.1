From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
Date: Wed, 8 May 2019 15:59:48 +0100
Message-ID: <c35f9967-214f-bea0-bea4-73148adb585f@citrix.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
 <32a5db38-530f-1e6b-cbbd-f21ad687b149@citrix.com>
 <5CD2E037020000780022CE2D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUHD=TI=citrix.com=prvs=024c7dee5=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOO3G-0001FN-18
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:00:10 +0000
In-Reply-To: <5CD2E037020000780022CE2D@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gNS84LzE5IDI6NTcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA1LjE5IGF0
IDE4OjE1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gNS8yLzE5IDc6
NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gVGhpcyBpcyB3aGF0IGJvdGggY2FsbGVycyBv
ZiBndWVzdF9waHlzbWFwX2FkZF9wYWdlKCkgaW4gbWVtb3J5LmMgd2FudAo+Pj4gKGZvciB0aGUg
IXBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIGNhc2UpLCBhbmQgaXQgaXMgYWxzbyB3aGF0IGJvdGgK
Pj4+IGNhbGxlcnMgaW4gZ250dGFiX3RyYW5zZmVyKCkgbmVlZCAoYnV0IGhhdmUgYmVlbiBsYWNr
aW5nKS4gVGhlIG90aGVyCj4+PiAoeDg2LXNwZWNpZmljKSBjYWxsZXJzIGFyZSBhbGwgSFZNLW9u
bHksIGFuZCBoZW5jZSB1bmFmZmVjdGVkIGJ5IHRoaXMKPj4+IGNoYW5nZS4KPj4KPj4gU29ycnks
IHdoYXQncyBnb2luZyBvbiBoZXJlPwo+IAo+IEkgZ3Vlc3MgdGhhdCdzIGEgSmFuLXdyb3RlLWFu
LXVucGFyc2FibGUtZGVzY3JpcHRpb24tb25jZS1hZ2Fpbgo+IHF1ZXN0aW9uPwoKU29ydCBvZiwg
eWVzLiA6LSkgIEl0J3Mgbm90IHVucGFyc2FibGU7IGl0J3MganVzdCBtaXNzaW5nIHNvbWUgaW5m
b3JtYXRpb24uCgo+IDEpIFRoZSB0d28gY2FsbGVycyBpbiBjb21tb24vbWVtb3J5LmMgY3VycmVu
dGx5IGNhbGwgc2V0X2dwZm5fZnJvbV9tZm4oKQo+IHRoZW1zZWx2ZXMsIHNvIG1vdmluZyB0aGUg
Y2FsbCBpbnRvIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSBoZWxwcwo+IHRpZHkgdGhlaXIgY29k
ZS4KPiAKPiAyKSBUaGUgdHdvIGNhbGxlcnMgaW4gY29tbW9uL2dyYW50X3RhYmxlLmMgZmFpbCB0
byBtYWtlIHRoYXQgY2FsbCBhbG9uZ3NpZGUKPiB0aGUgb25lIHRvIGd1ZXN0X3BoeXNtYXBfYWRk
X3BhZ2UoKSwgc28gd2lsbCBhY3R1YWxseSBnZXQgZml4ZWQgYnkgdGhlCj4gY2hhbmdlLgo+IAo+
IDMpIE90aGVyIGNhbGxlcnMgYXJlIEhWTSBvbmx5IGFuZCBhcmUgaGVuY2UgdW5hZmZlY3RlZCBi
eSBhIGNoYW5nZSB0bwo+IHRoZSBmdW5jdGlvbidzICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoKSBw
YXJ0LgoKUmlnaHQuICBJIHRoaW5rIEkgd291bGQgaGF2ZSB3cml0dGVuIHNvbWV0aGluZyBsaWtl
IHRoaXM6Cgo4PC0tLQoKV2hlbiBnaXZpbmcgb3duZXJzaGlwIG9mIGEgcGFnZSB0byBhIFBWIGd1
ZXN0LCBhIG51bWJlciBvZiB0aGluZ3MgbmVlZAp0byBiZSBkb25lLCBpbmNsdWRpbmcgYWRkaW5n
IHRoZSBwYWdlIGludG8gdGhlIElPTU1VIGlmIGFwcHJvcHJpYXRlLCBhbmQKdXBkYXRpbmcgdGhl
IG0ycC4gIEF0IHRoZSBtb21lbnQgdGhpcyBpcyBkb25lIGJ5IGNhbGxpbmcKZ3Vlc3RfcGh5c21h
cF9hZGRfZW50cnkoKSBhbmQgc2V0X2dwZm5fZnJvbV9tZm4oKSBzZXBhcmF0ZWx5LgoKVW5mb3J0
dW5hdGVseSwgdGhpcyBkdXBsaWNhdGlvbiBsZWFkcyB0byBtaXN0YWtlczogZ250dGFiX3RyYW5z
ZmVyKCkKY2FsbHMgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSBidXQgZmFpbHMgdG8gY2FsbCBz
ZXRfZ3Bmbl9mcm9tX21mbigpLgoKU2luY2UgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSBpcyBh
bHJlYWR5IHNwZWNpYWwtY2FzaW5nIFBWIGd1ZXN0cywKbW92ZSBzZXRfZ3Bmbl9mcm9tX21mbigp
IGludG8gdGhhdCBmdW5jdGlvbi4KCi0tLT44CgpJIGhhdmUgYSB0ZWNobmljYWwgcXVlc3Rpb24g
YWJvdXQgdGhlIHBhdGNoOyBJJ2xsIHJlcGx5IGlubGluZSB0byB0aGUKcGF0Y2ggaXRzZWxmLgoK
IC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
