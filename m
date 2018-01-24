From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 17:15:16 +0100
Message-ID: <b03f0271-c584-19e9-98a5-f3a3dab17ff5@suse.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <CAFLBxZb=a3wC_i49FJ2sk3g73p6WQxyGR_qBR2P3rNu-4-7QgQ@mail.gmail.com>
 <dbf149c4-15f1-9374-0eb5-7317d9c6f76e@suse.com>
 <CAFLBxZYLBLbvEk2LRuT6U1vNSyUoam+vT_AR4CLEtc8oB1Qewg@mail.gmail.com>
 <b5a88b65-0cbe-a522-4b95-524343897bcf@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zlmm=et=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eeNhu-0003D5-KM
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:15:26 +0000
In-Reply-To: <b5a88b65-0cbe-a522-4b95-524343897bcf@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMTggMTc6MTAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwMS8yNC8yMDE4
IDEwOjI2IEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBh
dCAzOjIwIFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24g
MjQvMDEvMTggMTY6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4gT24gV2VkLCBKYW4gMjQs
IDIwMTggYXQgMjoxMCBQTSwgQm9yaXMgT3N0cm92c2t5Cj4+Pj4gPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPiB3cm90ZToKPj4+Pj4gT24gMDEvMjQvMjAxOCAwNzowNiBBTSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+Pj4+IE9uIDI0LzAxLzE4IDExOjU0LCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDEwOjQyOjM5QU0gKzAwMDAsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDI6NDEg
QU0sIEJvcmlzIE9zdHJvdnNreQo+Pj4+Pj4+PiA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
IHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMDEvMTgvMjAxOCAwNTozMyBBTSwgV2VpIExpdSB3cm90ZToK
Pj4+Pj4+Pj4+PiBPbiBUaHUsIEphbiAxOCwgMjAxOCBhdCAxMTozMTozMkFNICswMTAwLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBXZWksCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
IE9uIDAxLzEyLzE3IDE1OjE0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4gSW5z
dGVhZCBvZiBsb2NhdGluZyB0aGUgUlNEUCB0YWJsZSBiZWxvdyAxTUIgcHV0IGl0IGp1c3QgYmVs
b3cgNEdCCj4+Pj4+Pj4+Pj4+PiBsaWtlIHRoZSByZXN0IG9mIHRoZSBBQ1BJIHRhYmxlcyBpbiBj
YXNlIG9mIFBWSCBndWVzdHMuIFRoaXMgd2lsbAo+Pj4+Pj4+Pj4+Pj4gYXZvaWQgcHVuY2hpbmcg
bW9yZSBob2xlcyB0aGFuIG5lY2Vzc2FyeSBpbnRvIHRoZSBtZW1vcnkgbWFwLgo+Pj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4+Pj4+Pj4+Pj4+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+Pj4+Pj4+Pj4+PiBNaW5kIGFwcGx5aW5nIHRoaXMgb25lPwo+Pj4+Pj4+Pj4+IERvbid0IHdv
cnJ5LCBpdCBpcyBpbiBteSBxdWV1ZS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFdpbGwgY29tZSB0
byB0aGlzIGFuZCBvdGhlciBwYXRjaGVzIEkgYWNjdW11bGF0ZWQgc29vbi4KPj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+IFdlaS4KPj4+Pj4+Pj4+IFRoaXMgcmVxdWlyZXMga2VybmVsIGNoYW5nZXMsIGRv
ZXNuJ3QgaXQ/Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNzE0Lmh0bWwKPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBBbmQgdGhpcyBzZXJpZXMgYXBwYXJlbnRseSBuZXZlciBtYWRlIGl0IHRvIHRo
ZSB0cmVlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFBWSCBndWVzdHMgYXJlIGJyb2tlbiBub3cgb24g
c3RhZ2luZy4KPj4+Pj4+Pj4gQW5kIHRoZSBMaW51eCBzaWRlIG9mIFBWSCBpcyBvZmZpY2lhbGx5
IHN1cHBvcnRlZCBub3csIHJpZ2h0Pwo+Pj4+Pgo+Pj4+PiBBRkFJSyBQVkggaXMgc3RpbGwgY29u
c2lkZXJlZCBhIHRlY2ggcHJldmlldyAtLS0gTGludXggb3IgWGVuLgo+Pj4+IEZyb20gU1VQUE9S
VC5tZDoKPj4+Pgo+Pj4+ICMjIyB4ODYvUFZIIGd1ZXN0Cj4+Pj4KPj4+PiAgICAgU3RhdHVzOiBT
dXBwb3J0ZWQKPj4+Pgo+Pj4+IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgUFZIIGd1
ZXN0IGluIExpbnV4IHdhcyBjb21wbGV0ZSBhbmQKPj4+PiBzdGFibGUgYXMgb2YgTGludXggNC4x
MS4gIElmIHRoYXQncyBub3QgdHJ1ZSBpdCBzaG91bGQgaGF2ZSBiZWVuCj4+Pj4gYnJvdWdodCB1
cCBkdXJpbmcgdGhlIDQuMTAgZGV2ZWxvcG1lbnQgY3ljbGUsIHdoZXJlIHdlIGRlY2xhcmVkIFBW
SAo+Pj4+IGRvbVVzIGFzICJzdXBwb3J0ZWQiLgo+IAo+IAo+IE9LLCBJIG1pc3NlZCB0aGF0LCBz
b3JyeS4KPiAKPiBJIHRob3VnaCB3ZSB3ZXJlIGdvaW5nIHRvIHdhaXQgZm9yIFBDSSBwYXNzdGhy
b3VnaCB0byBiZWNvbWUgYXZhaWxhYmxlCj4gdW50aWwgZGVjbGFyaW5nIGl0IHN1cHBvcnRlZC4K
PiAKPiAKPj4+IFNvIHdoYXQgaXMgdGhlIHByb2JsZW0gaGVyZT8KPj4+Cj4+PiAtIGN1cnJlbnQg
TGludXggY2FuJ3QgYmUgYm9vdGVkIGFzIFBWSCBndWVzdCB3aXRoIHhlbi11bnN0YWJsZSBkdWUg
dG8KPj4+ICAgYSBidWcgaW4gTGludXgsIHBhdGNoZXMgZm9yIExpbnV4IGFyZSBiZWluZyB3b3Jr
ZWQgb24KPiAKPiBJIHdvdWxkIHByZWZlciBmb3IgcGF0Y2hlcyB0byBmaXJzdCBzaG93IHVwIGlu
IExpbnV4LiBPdGhlcndpc2Ugd2Ugd2lsbAo+IGJlIGFkZGluZyBYZW4gY29kZSB3aXRob3V0IGFu
eSBtZWFucyB0byB0ZXN0IGl0IHdpdGggUFZIIGd1ZXN0cy4gQW5kCj4gdGhlbiwgd2hlbiBMaW51
eCBkb2VzIGdldCBwcm9wZXIgUlNEUCBzdXBwb3J0IGZvciBQVkggYW5kIHRyaWVzIHRvIGJvb3Qs
Cj4gd2UgbWF5IGRpc2NvdmVyIHRoYXQgYWxsIHNvcnRzIG9mIHVucmVsYXRlZCB0aGluZ3MgYXJl
IGJyb2tlbi4KCkkgd2FudGVkIHRvIGRvIGl0IHRoaXMgd2F5LgoKTXkgTGludXggcGF0Y2hlcyB3
ZXJlIGFjY2VwdGVkIGZvciA0LjE2IGFuZCBvbmx5IHRoZW4gSSBzZW50IHRoZSBYZW4KcGF0Y2hl
cy4gVW5mb3J0dW5hdGVseSB0aGUgZ3J1YjIgYnVnIHJlc3VsdGVkIGluIHRoZSBMaW51eCBwYXRj
aGVzIGJlaW5nCnB1dCBvbiBob2xkLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
