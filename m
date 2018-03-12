From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Mon, 12 Mar 2018 16:08:24 -0400
Message-ID: <46182d89-238b-a975-74bd-22c5fcb3b496@oracle.com>
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
 <541daacf-7dcb-1f30-ff37-2463a9f4c8f5@eikelenboom.it>
 <5160714b-9aac-f582-a53e-bcf335519e98@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fe2b=gc=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1evTin-0001PL-Vx
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 20:07:02 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w2CK1oFP006829
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 20:06:54 GMT
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
 by aserp2130.oracle.com with ESMTP id 2gnxu5re2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 20:06:54 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w2CK6rMo002695
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 20:06:53 GMT
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w2CK6qTh007132
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 20:06:53 GMT
In-Reply-To: <5160714b-9aac-f582-a53e-bcf335519e98@eikelenboom.it>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTIvMjAxOCAwMzoyNiBQTSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDE5
LzAyLzE4IDIyOjEzLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IE9uIDE5LzAyLzE4IDEx
OjE2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMTkvMDIvMTggMTA6NDcsIFNhbmRlciBF
aWtlbGVuYm9vbSB3cm90ZToKPj4+PiBPbiAyNC8wMS8xOCAxNjoyNiwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPj4+Pj4gT24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMzoyMCBQTSwgSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IE9uIDI0LzAxLzE4IDE2OjA3LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4+IE9uIFdlZCwgSmFuIDI0LCAyMDE4IGF0IDI6MTAgUE0s
IEJvcmlzIE9zdHJvdnNreQo+Pj4+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3Jv
dGU6Cj4+Pj4+Pj4+IE9uIDAxLzI0LzIwMTggMDc6MDYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4+Pj4+Pj4+PiBPbiAyNC8wMS8xOCAxMTo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+
Pj4+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAxMDo0MjozOUFNICswMDAwLCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAyOjQxIEFN
LCBCb3JpcyBPc3Ryb3Zza3kKPj4+Pj4+Pj4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
PiB3cm90ZToKPj4+Pj4+Pj4+Pj4+IE9uIDAxLzE4LzIwMTggMDU6MzMgQU0sIFdlaSBMaXUgd3Jv
dGU6Cj4+Pj4+Pj4+Pj4+Pj4gT24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTE6MzE6MzJBTSArMDEw
MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4gV2VpLAo+Pj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+PiBPbiAwMS8xMi8xNyAxNToxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+Pj4+Pj4+Pj4+Pj4+IEluc3RlYWQgb2YgbG9jYXRpbmcgdGhlIFJTRFAgdGFibGUgYmVsb3cg
MU1CIHB1dCBpdCBqdXN0IGJlbG93IDRHQgo+Pj4+Pj4+Pj4+Pj4+Pj4gbGlrZSB0aGUgcmVzdCBv
ZiB0aGUgQUNQSSB0YWJsZXMgaW4gY2FzZSBvZiBQVkggZ3Vlc3RzLiBUaGlzIHdpbGwKPj4+Pj4+
Pj4+Pj4+Pj4+IGF2b2lkIHB1bmNoaW5nIG1vcmUgaG9sZXMgdGhhbiBuZWNlc3NhcnkgaW50byB0
aGUgbWVtb3J5IG1hcC4KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+Pj4+Pj4+Pj4+PiBBY2tl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4+Pj4+Pj4+Pj4+Pj4gTWluZCBh
cHBseWluZyB0aGlzIG9uZT8KPj4+Pj4+Pj4+Pj4+PiBEb24ndCB3b3JyeSwgaXQgaXMgaW4gbXkg
cXVldWUuCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBXaWxsIGNvbWUgdG8gdGhpcyBhbmQg
b3RoZXIgcGF0Y2hlcyBJIGFjY3VtdWxhdGVkIHNvb24uCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4+PiBXZWkuCj4+Pj4+Pj4+Pj4+PiBUaGlzIHJlcXVpcmVzIGtlcm5lbCBjaGFuZ2VzLCBkb2Vz
bid0IGl0Pwo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDcxNC5odG1sCj4+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gQW5kIHRoaXMgc2VyaWVzIGFwcGFyZW50bHkgbmV2ZXIgbWFk
ZSBpdCB0byB0aGUgdHJlZS4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBQVkggZ3Vlc3RzIGFy
ZSBicm9rZW4gbm93IG9uIHN0YWdpbmcuCj4+Pj4+Pj4+Pj4+IEFuZCB0aGUgTGludXggc2lkZSBv
ZiBQVkggaXMgb2ZmaWNpYWxseSBzdXBwb3J0ZWQgbm93LCByaWdodD8KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gQUZBSUsgUFZIIGlzIHN0aWxsIGNvbnNpZGVyZWQgYSB0ZWNoIHByZXZpZXcgLS0tIExpbnV4
IG9yIFhlbi4KPj4+Pj4+PiBGcm9tIFNVUFBPUlQubWQ6Cj4+Pj4+Pj4KPj4+Pj4+PiAjIyMgeDg2
L1BWSCBndWVzdAo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIFN0YXR1czogU3VwcG9ydGVkCj4+Pj4+Pj4K
Pj4+Pj4+PiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IFBWSCBndWVzdCBpbiBMaW51
eCB3YXMgY29tcGxldGUgYW5kCj4+Pj4+Pj4gc3RhYmxlIGFzIG9mIExpbnV4IDQuMTEuICBJZiB0
aGF0J3Mgbm90IHRydWUgaXQgc2hvdWxkIGhhdmUgYmVlbgo+Pj4+Pj4+IGJyb3VnaHQgdXAgZHVy
aW5nIHRoZSA0LjEwIGRldmVsb3BtZW50IGN5Y2xlLCB3aGVyZSB3ZSBkZWNsYXJlZCBQVkgKPj4+
Pj4+PiBkb21VcyBhcyAic3VwcG9ydGVkIi4KPj4+Pj4+IFNvIHdoYXQgaXMgdGhlIHByb2JsZW0g
aGVyZT8KPj4+Pj4+Cj4+Pj4+PiAtIGN1cnJlbnQgTGludXggY2FuJ3QgYmUgYm9vdGVkIGFzIFBW
SCBndWVzdCB3aXRoIHhlbi11bnN0YWJsZSBkdWUgdG8KPj4+Pj4+ICAgYSBidWcgaW4gTGludXgs
IHBhdGNoZXMgZm9yIExpbnV4IGFyZSBiZWluZyB3b3JrZWQgb24KPj4+Pj4+IC0gYm9vdGluZyBM
aW51eCBhcyBQVkggZ3Vlc3Qgd2l0aCB4ZW4gNC4xMCBpcyB3b3JraW5nCj4+Pj4+IEkgd2FzIHJl
c3BvbmRpbmcgdG8gQm9yaXMncyBjbGFpbSB0aGF0IFBWSCBpcyBjb25zaWRlcmVkIHRlY2ggcHJl
dmlldy4KPj4+Pj4gSSBjYW4ndCBzYXkgYW55dGhpbmcgb25lIHdheSBvciB0aGUgb3RoZXIgYWJv
dXQgUFZIIGluIExpbnV4LCBidXQgUFZICj4+Pj4+IGluIFhlbiBpcyBkZWZpbml0ZWx5IG5vdyBj
b25zaWRlcmVkIHN1cHBvcnRlZC4KPj4+Pj4KPj4+Pj4gTXkgc3Vic2VxdWVudCByZXNwb25zZSB0
byBSb2dlciAoIkZXSVcgSSBjYW4gYnV5IHRoaXMgYXJndW1lbnQiKSB3YXMKPj4+Pj4gbWVhbnQg
dG8gaW5kaWNhdGUgSSBkaWRuJ3QgaGF2ZSBhbnkgbW9yZSBvYmplY3Rpb24gdG8gdGhlIGFwcHJv
YWNoIHlvdQo+Pj4+PiBndXlzIHdlcmUgcGxhbm5pbmcgb24gdGFraW5nLgo+Pj4+Pgo+Pj4+PiAg
LUdlb3JnZQo+Pj4+IEwuUy4sCj4+Pj4KPj4+PiBTZWVtcyBJIGxvc3QgdHJhY2ssIGlzIHRoZXJl
IGFueSBwcm9ncmVzcyBvbiB0aGlzIGlzc3VlID8KPj4+PiAoZG9lc24ndCBzZWVtIGEgZml4IGhh
cyBsYW5kZWQgaW4gNC4xNi1yYzIgeWV0KS4KPj4+IEp1c3Qgc2VudCBhIG5ldyBwYXRjaCBzZXJp
ZXMuCj4+IEp1c3QgdGVzdGVkIGFuZCBpdCB3b3JrcyBmaW5lIGhlcmUuCj4gSGkgSnVlcmdlbiwK
Pgo+IEkgZG9uJ3Qga25vdyBieSB3aGljaCB0cmVlIHRob3NlIHBhdGNoZXMgc2hvdWxkIGFycml2
ZSBhdCBMaW51cywKPiBzbyBpIGNhbid0IGNoZWNrIGlmIHRoZXkgZmVsbCB0aHJvdWdoIHRoZSBj
cmFja3Mgc29tZXdoZXJlLCBidXQgNC4xNi1yYzUKPiBoYXNuJ3QgZ290IHRoZW0geWV0Lgo+CgoK
SSB3YXMganVzdCBhYm91dCB0byBzZW5kIHRoaXMgZXhhY3QgcXVlc3Rpb24uIExhc3QgSSBzYXcg
YSBub3RlIGZyb20KSW5nbyB0aGF0IGhlIHB1dCBpdCBpbiB0aXA6eDg2L2Jvb3QKKGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE3LzEyLzExLzM1OCkgYnV0IEkgZG9uJ3Qgc2VlIGl0IHRoZXJlLiAo
QW5kCkknZCB0aGluayBpdCB3b3VsZCBoYXZlIGJlZW4gcHVsbGVkIGJ5IExpbnVzIGJ5IG5vdyBh
bnl3YXkpCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
