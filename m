From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ping: [PATCH v3 0/4] x86/HVM: implement memory read
 caching
Date: Fri, 12 Oct 2018 00:32:29 -0600
Message-ID: <5BC03FFD02000078001F0E31@prv1-mh.provo.novell.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5BAA42D102000078001EBBEB@prv1-mh.provo.novell.com>
 <5BB34A1102000078001EDABE@prv1-mh.provo.novell.com>
 <57c23678-c8e6-d6d8-f0de-38a48b8936f2@citrix.com>
 <5BB368C902000078001EDBAF@prv1-mh.provo.novell.com>
 <525825CF-D14C-4EA5-8B43-8F72BD7BC7CA@citrix.com>
 <5BBF772802000078001F0CAD@prv1-mh.provo.novell.com>
 <F05D0D1B-0119-47A4-8643-5E6411F1233B@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAqzw-0002V2-V3
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 06:32:32 +0000
In-Reply-To: <F05D0D1B-0119-47A4-8643-5E6411F1233B@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjEwLjE4IGF0IDE4OjMzLCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKCj4gCj4+IE9uIE9jdCAxMSwgMjAxOCwgYXQgNToxNSBQTSwgSmFuIEJldWxpY2ggPEpCZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToKPj4gCj4+Pj4+IE9uIDExLjEwLjE4IGF0IDE3OjU0LCA8R2Vv
cmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4gCj4+Pj4gT24gT2N0IDIsIDIwMTgsIGF0
IDE6NDcgUE0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gCj4+
Pj4+Pj4gT24gMDIuMTAuMTggYXQgMTI6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3
cm90ZToKPj4+PiAKPj4+Pj4gVGhpcyBkb2Vzbid0IGJlaGF2ZSBsaWtlIHJlYWwgaGFyZHdhcmUs
IGFuZCBkZWZpbml0ZWx5IGRvZXNuJ3QgYmVoYXZlIGFzCj4+Pj4+IG5hbWVkIC0gInN0cnVjdCBo
dm1lbXVsX2NhY2hlIiBpcyBzaW1wbHkgZmFsc2UuICBJZiBpdCB3ZXJlIG5hbWVkCj4+Pj4+IGh2
bWVtdWxfcHNjIChvciBzb21lIG90aGVyIHZhcmlhdGlvbiBvbiBQYWdpbmcgU3RydWN0dXJlIENh
Y2hlKSB0aGVuIGl0Cj4+Pj4+IHdvdWxkbid0IGJlIHNvIGJhZCwgYXMgdGhlIGluZGl2aWR1YWwg
bGV2ZWxzIGRvIG1ha2UgbW9yZSBzZW5zZSBpbiB0aGF0Cj4+Pj4+IGNvbnRleHQKPj4+PiAKPj4+
PiBBcyBwcmV2aW91c2x5IHBvaW50ZWQgb3V0ICh3aXRob3V0IGFueSBzdWdnZXN0aW9uIGNvbWlu
ZyBiYWNrIGZyb20KPj4+PiB5b3UpLCBJIGNob3NlIHRoZSBuYW1lICJjYWNoZSIgZm9yIHRoZSBs
YWNrIG9mIGEgYmV0dGVyIHRlcm0uIEhvd2V2ZXIsCj4+Pj4gSSBjZXJ0YWlubHkgZGlzYWdyZWUg
d2l0aCBuYW1pbmcgaXQgUFNDIG9yIHNvbWUgc3VjaCwgYXMgaXRzIGxldmVsIHplcm8KPj4+PiBp
cyBpbnRlbnRpb25hbGx5IHRoZXJlIHRvIGJlIGV2ZW50dWFsbHkgdXNlZCBmb3Igbm9uLXBhZ2lu
Zy1zdHJ1Y3R1cmUKPj4+PiBkYXRhLgo+Pj4gCj4+PiBJIGNhbiB0aGluayBvZiBsb3RzIG9mIGRl
c2NyaXB0aXZlIG5hbWVzIHdoaWNoIGNvdWxkIHlpZWxkIHVuaXF1ZSAKPj4+IHRocmVlLWxldHRl
ciBhY3JvbnltczoKPj4+IAo+Pj4gTG9naWNhbCBSZWFkIFNlcXVlbmNlCj4+PiBMb2dpY2FsIFJl
YWQgU2VyaWVzCj4+PiBMb2dpY2FsIFJlYWQgUmVjb3JkCj4+PiBSZWFkIENvbnNpc3RlbmN5IFN0
cnVjdHVyZQo+Pj4gQ29uc2lzdGVudCBSZWFkIFN0cnVjdHVyZQo+Pj4gQ29uc2lzdGVudCBSZWFk
IFJlY29yZAo+Pj4gRW11bGF0aW9uIFJlYWQgUmVjb3JkCj4+PiBb4oCmXQo+PiAKPj4gV2VsbCwg
SSdtIG5vdCBzdXJlIExSUywgTFJSLCBSQ1MsIENSUywgQ1JSLCBvciBFUlIgd291bGQgYmUKPj4g
ZWFzaWx5IHJlY29nbml6YWJsZSBhcyB3aGF0IHRoZXkgc3RhbmQgZm9yLiBUbyBiZSBob25lc3Qg
SSdkCj4+IHByZWZlciBhIG5vbi1hY3JvbnltLiBEaWQgeW91IHNlZSBteSBjb25zaWRlcmF0aW9u
IHRvd2FyZHMKPj4gImxhdGNo4oCdPwo+IAo+IE9mIGNvdXJzZSBub3Q7IHRoYXTigJlzIHdoeSB5
b3UgcHV0IHRoZSBsb25nIGZvcm0gbmFtZSBpbiBhIGNvbW1lbnQgbmVhciB0aGUgCj4gZGVjbGFy
YXRpb24uIDotKQoKT2YgY291cnNlIEkgd291bGQsIGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgd291
bGQgaGVscC4gWW91IGRvbid0CndhbnQgdG8gYWx3YXlzIGdvIGJhY2sgdG8gdGhlIGRlY2xhcmF0
aW9uIChpbiBhIGhlYWRlcikgd2hlbgp5b3UgbG9vayBhdCBhIGZ1bmN0aW9uIChpbiBhIC5jIGZp
bGUpIHVzaW5nIHRoZSB0eXBlLiBTdWNoIG5hbWVzCnNob3VsZCBiZSBhdCBsZWFzdCBoYWxmIHdh
eSBzZWxmLWV4cGxhbmF0b3J5LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
