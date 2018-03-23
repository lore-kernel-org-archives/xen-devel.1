From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] SUPPORT.md: add Domain 0 section
Date: Fri, 23 Mar 2018 11:16:49 +0000
Message-ID: <9b081c9a-8a5d-f2d0-20b4-0b95423e8937@citrix.com>
References: <20180323102718.72049-1-roger.pau@citrix.com>
 <093d2dd5-6422-14a1-e1f5-fc03770558a6@citrix.com>
 <20180323111410.bhglubm7zg4fn3pn@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fgsg=gn=citrix.com=prvs=6135444e9=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ezKhB-0002qc-1c
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 11:17:17 +0000
In-Reply-To: <20180323111410.bhglubm7zg4fn3pn@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMjMvMjAxOCAxMToxNCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmks
IE1hciAyMywgMjAxOCBhdCAxMTowNjo1NEFNICswMDAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
PiBPbiAwMy8yMy8yMDE4IDEwOjI3IEFNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+IC0t
LQo+Pj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+PiBD
YzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4gQ2M6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+Pj4gQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+Pj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KPj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Cj4+PiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4+PiBDYzogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KPj4+IC0tLQo+Pj4gIFNVUFBPUlQubWQgfCAyNCArKysrKysrKysrKysr
KysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZAo+Pj4gaW5kZXggZGRjZGZhYjVh
ZC4uZmIwMTUxYWE3YiAxMDA2NDQKPj4+IC0tLSBhL1NVUFBPUlQubWQKPj4+ICsrKyBiL1NVUFBP
UlQubWQKPj4+IEBAIC05Niw2ICs5NiwzMCBAQCBSZXF1aXJlcyBoYXJkd2FyZSB2aXJ0dWFsaXNh
dGlvbiBzdXBwb3J0IChJbnRlbCBWTVggLyBBTUQgU1ZNKQo+Pj4gIAo+Pj4gIEFSTSBvbmx5IGhh
cyBvbmUgZ3Vlc3QgdHlwZSBhdCB0aGUgbW9tZW50Cj4+PiAgCj4+PiArIyMgRG9tYWluIDAgVHlw
ZQo+Pj4gKwo+Pj4gKyMjIyB4ODYvUFYgRG9tMAo+Pj4gKwo+Pj4gKyAgICBTdGF0dXM6IFN1cHBv
cnRlZAo+Pj4gKwo+Pj4gK1RyYWRpdGlvbmFsIFhlbiBQViBEb21haW4gMAo+Pj4gKwo+Pj4gK05v
IGhhcmR3YXJlIHJlcXVpcmVtZW50cwo+Pj4gKwo+Pj4gKyMjIyB4ODYvUFZIIERvbTAKPj4+ICsK
Pj4+ICsgICAgU3RhdHVzOiBFeHBlcmltZW50YWwKPj4+ICsKPj4+ICtQVkggYmFzZWQgRG9tYWlu
IDAKPj4+ICsKPj4+ICtSZXF1aXJlcyBDUFUgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24gZXh0ZW5z
aW9ucyBhbmQgYW4gSU9NTVUuCj4+PiArCj4+PiArIyMjIEFSTSBEb20wCj4+PiArCj4+PiArICAg
IFN0YXR1czogU3VwcG9ydGVkCj4+PiArCj4+PiArQVJNIG9ubHkgaGFzIG9uZSBEb21haW4gMCB0
eXBlIGF0IHRoZSBtb21lbnQKPj4+ICsKPj4KPj4gVGhlcmUncyBhIGxvdCBvZiByZWR1bmRhbmN5
IGhlcmUuICBXaGF0IGFib3V0IGtlZXBpbmcgdGhlIGd1ZXN0IHR5cGVzCj4+IHRvZ2V0aGVyLCBs
aWtlIHRoZSBmb2xsb3dpbmc/Cj4+Cj4+IC0tLQo+PiAjIyMgeDg2L1BWSAo+Pgo+PiAgICAgU3Rh
dHVzLCBkb21VOiBTdXBwb3J0ZWQKPj4gICAgIFN0YXR1cywgZG9tMDogRXhwZXJpbWVudGFsCj4+
Cj4+IFtkZXNjcmlwdGlvbl0KPj4KPj4gTm90ZSBhbHNvIHRoYXQgZG9tMCBzdXBwb3J0IHJlcXVp
cmVzIElPTU1VIG9yIFZULWQgaGFyZHdhcmUuCj4gCj4gU3VyZS4gSSB3YXNuJ3QgYXdhcmUgdGhh
dCB3ZSBjb3VsZCB1c2UgJ1N0YXR1cywgWFhYOicuIFNvbWVob3cgSQo+IHRob3VnaHQgdGhpcyB3
b24ndCBiZSBwcm9jZXNzZWQgY29ycmVjdGx5LCBidXQgdGhlcmUgYXJlIGJ1bmNoIG9mCj4gZW50
cmllcyB1c2luZyB0aGlzIGZvcm1hdCBhbHJlYWR5LgoKV2VsbCBhdCB0aGUgbW9tZW50IHRoZXJl
IGlzbid0IGFueSBwcm9jZXNzaW5nLiAgSWYgaXQgdHVybnMgb3V0IHRvIGJlCnRvbyBkaWZmaWN1
bHQgdG8gcHJvY2VzcyBhcyBpdCBpcywgdGhlbiB3ZSdsbCBoYXZlIHRvIGZpZ3VyZSBzb21ldGhp
bmcKZWxzZSBvdXQ7IGJ1dCBhcyB5b3Ugc2F5LCB0aGVyZSBhcmUgYWxyZWFkeSBkb3plbnMgb2Yg
b3RoZXIgZW50cmllcyB0aGF0CndpbGwgbmVlZCB0byBiZSBjaGFuZ2VkIGFzIHdlbGwuCgo+IExl
dCBtZSBzZW5kIHYyLgoKVGhhbmtzLAogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
