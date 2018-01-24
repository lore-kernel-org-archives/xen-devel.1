From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 16:20:05 +0100
Message-ID: <dbf149c4-15f1-9374-0eb5-7317d9c6f76e@suse.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <CAFLBxZb=a3wC_i49FJ2sk3g73p6WQxyGR_qBR2P3rNu-4-7QgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zlmm=et=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eeMqQ-000637-Fv
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 15:20:10 +0000
In-Reply-To: <CAFLBxZb=a3wC_i49FJ2sk3g73p6WQxyGR_qBR2P3rNu-4-7QgQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMTggMTY6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMjQs
IDIwMTggYXQgMjoxMCBQTSwgQm9yaXMgT3N0cm92c2t5Cj4gPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPiB3cm90ZToKPj4gT24gMDEvMjQvMjAxOCAwNzowNiBBTSwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4+IE9uIDI0LzAxLzE4IDExOjU0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+
IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDEwOjQyOjM5QU0gKzAwMDAsIEdlb3JnZSBEdW5sYXAg
d3JvdGU6Cj4+Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDI6NDEgQU0sIEJvcmlzIE9zdHJv
dnNreQo+Pj4+PiA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+Pj4+Pj4gT24g
MDEvMTgvMjAxOCAwNTozMyBBTSwgV2VpIExpdSB3cm90ZToKPj4+Pj4+PiBPbiBUaHUsIEphbiAx
OCwgMjAxOCBhdCAxMTozMTozMkFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+
PiBXZWksCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDAxLzEyLzE3IDE1OjE0LCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOgo+Pj4+Pj4+Pj4gSW5zdGVhZCBvZiBsb2NhdGluZyB0aGUgUlNEUCB0YWJsZSBiZWxv
dyAxTUIgcHV0IGl0IGp1c3QgYmVsb3cgNEdCCj4+Pj4+Pj4+PiBsaWtlIHRoZSByZXN0IG9mIHRo
ZSBBQ1BJIHRhYmxlcyBpbiBjYXNlIG9mIFBWSCBndWVzdHMuIFRoaXMgd2lsbAo+Pj4+Pj4+Pj4g
YXZvaWQgcHVuY2hpbmcgbW9yZSBob2xlcyB0aGFuIG5lY2Vzc2FyeSBpbnRvIHRoZSBtZW1vcnkg
bWFwLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPj4+Pj4+Pj4+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgo+Pj4+Pj4+PiBNaW5kIGFwcGx5aW5nIHRoaXMgb25lPwo+Pj4+Pj4+IERvbid0IHdv
cnJ5LCBpdCBpcyBpbiBteSBxdWV1ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFdpbGwgY29tZSB0byB0aGlz
IGFuZCBvdGhlciBwYXRjaGVzIEkgYWNjdW11bGF0ZWQgc29vbi4KPj4+Pj4+Pgo+Pj4+Pj4+IFdl
aS4KPj4+Pj4+IFRoaXMgcmVxdWlyZXMga2VybmVsIGNoYW5nZXMsIGRvZXNuJ3QgaXQ/Cj4+Pj4+
Pgo+Pj4+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE3LTEyL21zZzAwNzE0Lmh0bWwKPj4+Pj4+Cj4+Pj4+PiBBbmQgdGhpcyBzZXJpZXMg
YXBwYXJlbnRseSBuZXZlciBtYWRlIGl0IHRvIHRoZSB0cmVlLgo+Pj4+Pj4KPj4+Pj4+IFBWSCBn
dWVzdHMgYXJlIGJyb2tlbiBub3cgb24gc3RhZ2luZy4KPj4+Pj4gQW5kIHRoZSBMaW51eCBzaWRl
IG9mIFBWSCBpcyBvZmZpY2lhbGx5IHN1cHBvcnRlZCBub3csIHJpZ2h0Pwo+Pgo+Pgo+PiBBRkFJ
SyBQVkggaXMgc3RpbGwgY29uc2lkZXJlZCBhIHRlY2ggcHJldmlldyAtLS0gTGludXggb3IgWGVu
Lgo+IAo+IEZyb20gU1VQUE9SVC5tZDoKPiAKPiAjIyMgeDg2L1BWSCBndWVzdAo+IAo+ICAgICBT
dGF0dXM6IFN1cHBvcnRlZAo+IAo+IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgUFZI
IGd1ZXN0IGluIExpbnV4IHdhcyBjb21wbGV0ZSBhbmQKPiBzdGFibGUgYXMgb2YgTGludXggNC4x
MS4gIElmIHRoYXQncyBub3QgdHJ1ZSBpdCBzaG91bGQgaGF2ZSBiZWVuCj4gYnJvdWdodCB1cCBk
dXJpbmcgdGhlIDQuMTAgZGV2ZWxvcG1lbnQgY3ljbGUsIHdoZXJlIHdlIGRlY2xhcmVkIFBWSAo+
IGRvbVVzIGFzICJzdXBwb3J0ZWQiLgoKU28gd2hhdCBpcyB0aGUgcHJvYmxlbSBoZXJlPwoKLSBj
dXJyZW50IExpbnV4IGNhbid0IGJlIGJvb3RlZCBhcyBQVkggZ3Vlc3Qgd2l0aCB4ZW4tdW5zdGFi
bGUgZHVlIHRvCiAgYSBidWcgaW4gTGludXgsIHBhdGNoZXMgZm9yIExpbnV4IGFyZSBiZWluZyB3
b3JrZWQgb24KLSBib290aW5nIExpbnV4IGFzIFBWSCBndWVzdCB3aXRoIHhlbiA0LjEwIGlzIHdv
cmtpbmcKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
