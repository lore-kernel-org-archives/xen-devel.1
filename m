From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Mon, 19 Feb 2018 22:13:52 +0100
Message-ID: <541daacf-7dcb-1f30-ff37-2463a9f4c8f5@eikelenboom.it>
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
 <912d7e14-5836-d2aa-ccde-cb5b232bcc34@eikelenboom.it>
 <003c1ebc-ab90-0a0b-7938-bbd1647662c0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jby0=fn=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1enslE-0000hM-4o
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 21:14:08 +0000
In-Reply-To: <003c1ebc-ab90-0a0b-7938-bbd1647662c0@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMTggMTE6MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTkvMDIvMTggMTA6
NDcsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4gT24gMjQvMDEvMTggMTY6MjYsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAzOjIwIFBNLCBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IE9uIDI0LzAxLzE4IDE2OjA3
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAyOjEw
IFBNLCBCb3JpcyBPc3Ryb3Zza3kKPj4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3
cm90ZToKPj4+Pj4+IE9uIDAxLzI0LzIwMTggMDc6MDYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+Pj4+Pj4gT24gMjQvMDEvMTggMTE6NTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+
Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDEwOjQyOjM5QU0gKzAwMDAsIEdlb3JnZSBEdW5s
YXAgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAyOjQxIEFNLCBCb3Jp
cyBPc3Ryb3Zza3kKPj4+Pj4+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6
Cj4+Pj4+Pj4+Pj4gT24gMDEvMTgvMjAxOCAwNTozMyBBTSwgV2VpIExpdSB3cm90ZToKPj4+Pj4+
Pj4+Pj4gT24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTE6MzE6MzJBTSArMDEwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+Pj4+Pj4+Pj4+IFdlaSwKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBP
biAwMS8xMi8xNyAxNToxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4+Pj4+PiBJbnN0
ZWFkIG9mIGxvY2F0aW5nIHRoZSBSU0RQIHRhYmxlIGJlbG93IDFNQiBwdXQgaXQganVzdCBiZWxv
dyA0R0IKPj4+Pj4+Pj4+Pj4+PiBsaWtlIHRoZSByZXN0IG9mIHRoZSBBQ1BJIHRhYmxlcyBpbiBj
YXNlIG9mIFBWSCBndWVzdHMuIFRoaXMgd2lsbAo+Pj4+Pj4+Pj4+Pj4+IGF2b2lkIHB1bmNoaW5n
IG1vcmUgaG9sZXMgdGhhbiBuZWNlc3NhcnkgaW50byB0aGUgbWVtb3J5IG1hcC4KPj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4+Pj4+Pj4+Pj4+PiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KPj4+Pj4+Pj4+Pj4+IE1pbmQgYXBwbHlpbmcgdGhpcyBvbmU/Cj4+Pj4+Pj4+Pj4+IERv
bid0IHdvcnJ5LCBpdCBpcyBpbiBteSBxdWV1ZS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gV2ls
bCBjb21lIHRvIHRoaXMgYW5kIG90aGVyIHBhdGNoZXMgSSBhY2N1bXVsYXRlZCBzb29uLgo+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBXZWkuCj4+Pj4+Pj4+Pj4gVGhpcyByZXF1aXJlcyBrZXJuZWwg
Y2hhbmdlcywgZG9lc24ndCBpdD8KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDcxNC5o
dG1sCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBBbmQgdGhpcyBzZXJpZXMgYXBwYXJlbnRseSBuZXZl
ciBtYWRlIGl0IHRvIHRoZSB0cmVlLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gUFZIIGd1ZXN0cyBh
cmUgYnJva2VuIG5vdyBvbiBzdGFnaW5nLgo+Pj4+Pj4+Pj4gQW5kIHRoZSBMaW51eCBzaWRlIG9m
IFBWSCBpcyBvZmZpY2lhbGx5IHN1cHBvcnRlZCBub3csIHJpZ2h0Pwo+Pj4+Pj4KPj4+Pj4+Cj4+
Pj4+PiBBRkFJSyBQVkggaXMgc3RpbGwgY29uc2lkZXJlZCBhIHRlY2ggcHJldmlldyAtLS0gTGlu
dXggb3IgWGVuLgo+Pj4+Pgo+Pj4+PiBGcm9tIFNVUFBPUlQubWQ6Cj4+Pj4+Cj4+Pj4+ICMjIyB4
ODYvUFZIIGd1ZXN0Cj4+Pj4+Cj4+Pj4+ICAgICBTdGF0dXM6IFN1cHBvcnRlZAo+Pj4+Pgo+Pj4+
PiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IFBWSCBndWVzdCBpbiBMaW51eCB3YXMg
Y29tcGxldGUgYW5kCj4+Pj4+IHN0YWJsZSBhcyBvZiBMaW51eCA0LjExLiAgSWYgdGhhdCdzIG5v
dCB0cnVlIGl0IHNob3VsZCBoYXZlIGJlZW4KPj4+Pj4gYnJvdWdodCB1cCBkdXJpbmcgdGhlIDQu
MTAgZGV2ZWxvcG1lbnQgY3ljbGUsIHdoZXJlIHdlIGRlY2xhcmVkIFBWSAo+Pj4+PiBkb21VcyBh
cyAic3VwcG9ydGVkIi4KPj4+Pgo+Pj4+IFNvIHdoYXQgaXMgdGhlIHByb2JsZW0gaGVyZT8KPj4+
Pgo+Pj4+IC0gY3VycmVudCBMaW51eCBjYW4ndCBiZSBib290ZWQgYXMgUFZIIGd1ZXN0IHdpdGgg
eGVuLXVuc3RhYmxlIGR1ZSB0bwo+Pj4+ICAgYSBidWcgaW4gTGludXgsIHBhdGNoZXMgZm9yIExp
bnV4IGFyZSBiZWluZyB3b3JrZWQgb24KPj4+PiAtIGJvb3RpbmcgTGludXggYXMgUFZIIGd1ZXN0
IHdpdGggeGVuIDQuMTAgaXMgd29ya2luZwo+Pj4KPj4+IEkgd2FzIHJlc3BvbmRpbmcgdG8gQm9y
aXMncyBjbGFpbSB0aGF0IFBWSCBpcyBjb25zaWRlcmVkIHRlY2ggcHJldmlldy4KPj4+IEkgY2Fu
J3Qgc2F5IGFueXRoaW5nIG9uZSB3YXkgb3IgdGhlIG90aGVyIGFib3V0IFBWSCBpbiBMaW51eCwg
YnV0IFBWSAo+Pj4gaW4gWGVuIGlzIGRlZmluaXRlbHkgbm93IGNvbnNpZGVyZWQgc3VwcG9ydGVk
Lgo+Pj4KPj4+IE15IHN1YnNlcXVlbnQgcmVzcG9uc2UgdG8gUm9nZXIgKCJGV0lXIEkgY2FuIGJ1
eSB0aGlzIGFyZ3VtZW50Iikgd2FzCj4+PiBtZWFudCB0byBpbmRpY2F0ZSBJIGRpZG4ndCBoYXZl
IGFueSBtb3JlIG9iamVjdGlvbiB0byB0aGUgYXBwcm9hY2ggeW91Cj4+PiBndXlzIHdlcmUgcGxh
bm5pbmcgb24gdGFraW5nLgo+Pj4KPj4+ICAtR2VvcmdlCj4+Cj4+IEwuUy4sCj4+Cj4+IFNlZW1z
IEkgbG9zdCB0cmFjaywgaXMgdGhlcmUgYW55IHByb2dyZXNzIG9uIHRoaXMgaXNzdWUgPwo+PiAo
ZG9lc24ndCBzZWVtIGEgZml4IGhhcyBsYW5kZWQgaW4gNC4xNi1yYzIgeWV0KS4KPiAKPiBKdXN0
IHNlbnQgYSBuZXcgcGF0Y2ggc2VyaWVzLgoKSnVzdCB0ZXN0ZWQgYW5kIGl0IHdvcmtzIGZpbmUg
aGVyZS4KCi0tClNhbmRlcgoKPiAKPiBKdWVyZ2VuCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
