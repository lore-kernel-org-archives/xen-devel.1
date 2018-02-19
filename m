From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Mon, 19 Feb 2018 11:16:01 +0100
Message-ID: <003c1ebc-ab90-0a0b-7938-bbd1647662c0@suse.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=sds6=fn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eniUO-0005PS-Vq
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 10:16:05 +0000
In-Reply-To: <912d7e14-5836-d2aa-ccde-cb5b232bcc34@eikelenboom.it>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMTggMTA6NDcsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPiBPbiAyNC8wMS8x
OCAxNjoyNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gV2VkLCBKYW4gMjQsIDIwMTggYXQg
MzoyMCBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDI0
LzAxLzE4IDE2OjA3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+IE9uIFdlZCwgSmFuIDI0LCAy
MDE4IGF0IDI6MTAgUE0sIEJvcmlzIE9zdHJvdnNreQo+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDAxLzI0LzIwMTggMDc6MDYgQU0sIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6Cj4+Pj4+PiBPbiAyNC8wMS8xOCAxMTo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToKPj4+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAxMDo0MjozOUFNICswMDAwLCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAyOjQxIEFN
LCBCb3JpcyBPc3Ryb3Zza3kKPj4+Pj4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3
cm90ZToKPj4+Pj4+Pj4+IE9uIDAxLzE4LzIwMTggMDU6MzMgQU0sIFdlaSBMaXUgd3JvdGU6Cj4+
Pj4+Pj4+Pj4gT24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTE6MzE6MzJBTSArMDEwMCwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4+Pj4gV2VpLAo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBP
biAwMS8xMi8xNyAxNToxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4+Pj4+IEluc3Rl
YWQgb2YgbG9jYXRpbmcgdGhlIFJTRFAgdGFibGUgYmVsb3cgMU1CIHB1dCBpdCBqdXN0IGJlbG93
IDRHQgo+Pj4+Pj4+Pj4+Pj4gbGlrZSB0aGUgcmVzdCBvZiB0aGUgQUNQSSB0YWJsZXMgaW4gY2Fz
ZSBvZiBQVkggZ3Vlc3RzLiBUaGlzIHdpbGwKPj4+Pj4+Pj4+Pj4+IGF2b2lkIHB1bmNoaW5nIG1v
cmUgaG9sZXMgdGhhbiBuZWNlc3NhcnkgaW50byB0aGUgbWVtb3J5IG1hcC4KPj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4+Pj4+Pj4+Pj4+PiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
Pj4+Pj4+Pj4+Pj4gTWluZCBhcHBseWluZyB0aGlzIG9uZT8KPj4+Pj4+Pj4+PiBEb24ndCB3b3Jy
eSwgaXQgaXMgaW4gbXkgcXVldWUuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBXaWxsIGNvbWUgdG8g
dGhpcyBhbmQgb3RoZXIgcGF0Y2hlcyBJIGFjY3VtdWxhdGVkIHNvb24uCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBXZWkuCj4+Pj4+Pj4+PiBUaGlzIHJlcXVpcmVzIGtlcm5lbCBjaGFuZ2VzLCBkb2Vz
bid0IGl0Pwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDcxNC5odG1sCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gQW5kIHRoaXMgc2VyaWVzIGFwcGFyZW50bHkgbmV2ZXIgbWFkZSBpdCB0byB0aGUg
dHJlZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBQVkggZ3Vlc3RzIGFyZSBicm9rZW4gbm93IG9uIHN0
YWdpbmcuCj4+Pj4+Pj4+IEFuZCB0aGUgTGludXggc2lkZSBvZiBQVkggaXMgb2ZmaWNpYWxseSBz
dXBwb3J0ZWQgbm93LCByaWdodD8KPj4+Pj4KPj4+Pj4KPj4+Pj4gQUZBSUsgUFZIIGlzIHN0aWxs
IGNvbnNpZGVyZWQgYSB0ZWNoIHByZXZpZXcgLS0tIExpbnV4IG9yIFhlbi4KPj4+Pgo+Pj4+IEZy
b20gU1VQUE9SVC5tZDoKPj4+Pgo+Pj4+ICMjIyB4ODYvUFZIIGd1ZXN0Cj4+Pj4KPj4+PiAgICAg
U3RhdHVzOiBTdXBwb3J0ZWQKPj4+Pgo+Pj4+IEkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRo
YXQgUFZIIGd1ZXN0IGluIExpbnV4IHdhcyBjb21wbGV0ZSBhbmQKPj4+PiBzdGFibGUgYXMgb2Yg
TGludXggNC4xMS4gIElmIHRoYXQncyBub3QgdHJ1ZSBpdCBzaG91bGQgaGF2ZSBiZWVuCj4+Pj4g
YnJvdWdodCB1cCBkdXJpbmcgdGhlIDQuMTAgZGV2ZWxvcG1lbnQgY3ljbGUsIHdoZXJlIHdlIGRl
Y2xhcmVkIFBWSAo+Pj4+IGRvbVVzIGFzICJzdXBwb3J0ZWQiLgo+Pj4KPj4+IFNvIHdoYXQgaXMg
dGhlIHByb2JsZW0gaGVyZT8KPj4+Cj4+PiAtIGN1cnJlbnQgTGludXggY2FuJ3QgYmUgYm9vdGVk
IGFzIFBWSCBndWVzdCB3aXRoIHhlbi11bnN0YWJsZSBkdWUgdG8KPj4+ICAgYSBidWcgaW4gTGlu
dXgsIHBhdGNoZXMgZm9yIExpbnV4IGFyZSBiZWluZyB3b3JrZWQgb24KPj4+IC0gYm9vdGluZyBM
aW51eCBhcyBQVkggZ3Vlc3Qgd2l0aCB4ZW4gNC4xMCBpcyB3b3JraW5nCj4+Cj4+IEkgd2FzIHJl
c3BvbmRpbmcgdG8gQm9yaXMncyBjbGFpbSB0aGF0IFBWSCBpcyBjb25zaWRlcmVkIHRlY2ggcHJl
dmlldy4KPj4gSSBjYW4ndCBzYXkgYW55dGhpbmcgb25lIHdheSBvciB0aGUgb3RoZXIgYWJvdXQg
UFZIIGluIExpbnV4LCBidXQgUFZICj4+IGluIFhlbiBpcyBkZWZpbml0ZWx5IG5vdyBjb25zaWRl
cmVkIHN1cHBvcnRlZC4KPj4KPj4gTXkgc3Vic2VxdWVudCByZXNwb25zZSB0byBSb2dlciAoIkZX
SVcgSSBjYW4gYnV5IHRoaXMgYXJndW1lbnQiKSB3YXMKPj4gbWVhbnQgdG8gaW5kaWNhdGUgSSBk
aWRuJ3QgaGF2ZSBhbnkgbW9yZSBvYmplY3Rpb24gdG8gdGhlIGFwcHJvYWNoIHlvdQo+PiBndXlz
IHdlcmUgcGxhbm5pbmcgb24gdGFraW5nLgo+Pgo+PiAgLUdlb3JnZQo+IAo+IEwuUy4sCj4gCj4g
U2VlbXMgSSBsb3N0IHRyYWNrLCBpcyB0aGVyZSBhbnkgcHJvZ3Jlc3Mgb24gdGhpcyBpc3N1ZSA/
Cj4gKGRvZXNuJ3Qgc2VlbSBhIGZpeCBoYXMgbGFuZGVkIGluIDQuMTYtcmMyIHlldCkuCgpKdXN0
IHNlbnQgYSBuZXcgcGF0Y2ggc2VyaWVzLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
