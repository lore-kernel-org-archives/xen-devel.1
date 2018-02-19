From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Mon, 19 Feb 2018 10:47:17 +0100
Message-ID: <912d7e14-5836-d2aa-ccde-cb5b232bcc34@eikelenboom.it>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jby0=fn=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1eniKV-0004Mf-U7
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 10:05:51 +0000
In-Reply-To: <CAFLBxZYLBLbvEk2LRuT6U1vNSyUoam+vT_AR4CLEtc8oB1Qewg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMTggMTY6MjYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMjQs
IDIwMTggYXQgMzoyMCBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToK
Pj4gT24gMjQvMDEvMTggMTY6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiBXZWQsIEph
biAyNCwgMjAxOCBhdCAyOjEwIFBNLCBCb3JpcyBPc3Ryb3Zza3kKPj4+IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMDEvMjQvMjAxOCAwNzowNiBBTSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMjQvMDEvMTggMTE6NTQsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAxMDo0MjozOUFNICswMDAwLCBH
ZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDI6NDEg
QU0sIEJvcmlzIE9zdHJvdnNreQo+Pj4+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4g
d3JvdGU6Cj4+Pj4+Pj4+IE9uIDAxLzE4LzIwMTggMDU6MzMgQU0sIFdlaSBMaXUgd3JvdGU6Cj4+
Pj4+Pj4+PiBPbiBUaHUsIEphbiAxOCwgMjAxOCBhdCAxMTozMTozMkFNICswMTAwLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4+Pj4+Pj4+IFdlaSwKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9uIDAx
LzEyLzE3IDE1OjE0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBJbnN0ZWFkIG9m
IGxvY2F0aW5nIHRoZSBSU0RQIHRhYmxlIGJlbG93IDFNQiBwdXQgaXQganVzdCBiZWxvdyA0R0IK
Pj4+Pj4+Pj4+Pj4gbGlrZSB0aGUgcmVzdCBvZiB0aGUgQUNQSSB0YWJsZXMgaW4gY2FzZSBvZiBQ
VkggZ3Vlc3RzLiBUaGlzIHdpbGwKPj4+Pj4+Pj4+Pj4gYXZvaWQgcHVuY2hpbmcgbW9yZSBob2xl
cyB0aGFuIG5lY2Vzc2FyeSBpbnRvIHRoZSBtZW1vcnkgbWFwLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+
Pj4+Pj4+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4+Pj4+Pj4+
IE1pbmQgYXBwbHlpbmcgdGhpcyBvbmU/Cj4+Pj4+Pj4+PiBEb24ndCB3b3JyeSwgaXQgaXMgaW4g
bXkgcXVldWUuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2lsbCBjb21lIHRvIHRoaXMgYW5kIG90aGVy
IHBhdGNoZXMgSSBhY2N1bXVsYXRlZCBzb29uLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdlaS4KPj4+
Pj4+Pj4gVGhpcyByZXF1aXJlcyBrZXJuZWwgY2hhbmdlcywgZG9lc24ndCBpdD8KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE3LTEyL21zZzAwNzE0Lmh0bWwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gQW5kIHRoaXMgc2Vy
aWVzIGFwcGFyZW50bHkgbmV2ZXIgbWFkZSBpdCB0byB0aGUgdHJlZS4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gUFZIIGd1ZXN0cyBhcmUgYnJva2VuIG5vdyBvbiBzdGFnaW5nLgo+Pj4+Pj4+IEFuZCB0aGUg
TGludXggc2lkZSBvZiBQVkggaXMgb2ZmaWNpYWxseSBzdXBwb3J0ZWQgbm93LCByaWdodD8KPj4+
Pgo+Pj4+Cj4+Pj4gQUZBSUsgUFZIIGlzIHN0aWxsIGNvbnNpZGVyZWQgYSB0ZWNoIHByZXZpZXcg
LS0tIExpbnV4IG9yIFhlbi4KPj4+Cj4+PiBGcm9tIFNVUFBPUlQubWQ6Cj4+Pgo+Pj4gIyMjIHg4
Ni9QVkggZ3Vlc3QKPj4+Cj4+PiAgICAgU3RhdHVzOiBTdXBwb3J0ZWQKPj4+Cj4+PiBJIHdhcyB1
bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IFBWSCBndWVzdCBpbiBMaW51eCB3YXMgY29tcGxldGUg
YW5kCj4+PiBzdGFibGUgYXMgb2YgTGludXggNC4xMS4gIElmIHRoYXQncyBub3QgdHJ1ZSBpdCBz
aG91bGQgaGF2ZSBiZWVuCj4+PiBicm91Z2h0IHVwIGR1cmluZyB0aGUgNC4xMCBkZXZlbG9wbWVu
dCBjeWNsZSwgd2hlcmUgd2UgZGVjbGFyZWQgUFZICj4+PiBkb21VcyBhcyAic3VwcG9ydGVkIi4K
Pj4KPj4gU28gd2hhdCBpcyB0aGUgcHJvYmxlbSBoZXJlPwo+Pgo+PiAtIGN1cnJlbnQgTGludXgg
Y2FuJ3QgYmUgYm9vdGVkIGFzIFBWSCBndWVzdCB3aXRoIHhlbi11bnN0YWJsZSBkdWUgdG8KPj4g
ICBhIGJ1ZyBpbiBMaW51eCwgcGF0Y2hlcyBmb3IgTGludXggYXJlIGJlaW5nIHdvcmtlZCBvbgo+
PiAtIGJvb3RpbmcgTGludXggYXMgUFZIIGd1ZXN0IHdpdGggeGVuIDQuMTAgaXMgd29ya2luZwo+
IAo+IEkgd2FzIHJlc3BvbmRpbmcgdG8gQm9yaXMncyBjbGFpbSB0aGF0IFBWSCBpcyBjb25zaWRl
cmVkIHRlY2ggcHJldmlldy4KPiBJIGNhbid0IHNheSBhbnl0aGluZyBvbmUgd2F5IG9yIHRoZSBv
dGhlciBhYm91dCBQVkggaW4gTGludXgsIGJ1dCBQVkgKPiBpbiBYZW4gaXMgZGVmaW5pdGVseSBu
b3cgY29uc2lkZXJlZCBzdXBwb3J0ZWQuCj4gCj4gTXkgc3Vic2VxdWVudCByZXNwb25zZSB0byBS
b2dlciAoIkZXSVcgSSBjYW4gYnV5IHRoaXMgYXJndW1lbnQiKSB3YXMKPiBtZWFudCB0byBpbmRp
Y2F0ZSBJIGRpZG4ndCBoYXZlIGFueSBtb3JlIG9iamVjdGlvbiB0byB0aGUgYXBwcm9hY2ggeW91
Cj4gZ3V5cyB3ZXJlIHBsYW5uaW5nIG9uIHRha2luZy4KPiAKPiAgLUdlb3JnZQoKTC5TLiwKClNl
ZW1zIEkgbG9zdCB0cmFjaywgaXMgdGhlcmUgYW55IHByb2dyZXNzIG9uIHRoaXMgaXNzdWUgPwoo
ZG9lc24ndCBzZWVtIGEgZml4IGhhcyBsYW5kZWQgaW4gNC4xNi1yYzIgeWV0KS4KCi0tClNhbmRl
cgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
