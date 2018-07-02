From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Mon, 2 Jul 2018 14:14:09 +0300
Message-ID: <ea738bb4-d439-21d6-2600-6edc1a5ca9b4@bitdefender.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
 <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w9ps=js=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fZwmd-000790-8R
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 11:14:15 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 412C5307FB37
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jul 2018 15:30:24 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (unknown [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 042527FC2B
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jul 2018 14:14:13 +0300 (EEST)
In-Reply-To: <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMjAxOCAwOTozNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDYu
MTggYXQgMTg6MzksIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gT24gMDYv
MjkvMjAxOCAwNjozOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyOC4wNi4xOCBh
dCAxNTowMCwgPGFwb3BAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+PiBAQCAtNDY2Niw2ICs0
NjY3LDIzIEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKAo+Pj4+ICAgICAgICAgIH0KPj4+PiAg
ICAgICAgICBicmVhazsKPj4+PiAgCj4+Pj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfbWVt
X2FjY2VzczoKPj4+PiArICAgICAgICBpZiAoIGEudS5tZW1fYWNjZXNzLnBhZCApCj4+Pj4gKyAg
ICAgICAgICAgIHJjID0gLUVJTlZBTDsKPj4+PiArICAgICAgICBlbHNlCj4+Pj4gKyAgICAgICAg
ewo+Pj4+ICsgICAgICAgICAgICB4ZW5tZW1fYWNjZXNzX3QgYWNjZXNzOwo+Pj4+ICsKPj4+PiAr
ICAgICAgICAgICAgcmMgPSBwMm1fZ2V0X21lbV9hY2Nlc3MoZCwgX2dmbihhLnUubWVtX2FjY2Vz
cy5nZm4pLCAmYWNjZXNzLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhLnUubWVtX2FjY2Vzcy52aWV3KTsKPj4+PiArICAgICAgICAgICAgaWYgKCAhcmMgKQo+Pj4+
ICsgICAgICAgICAgICB7Cj4+Pj4gKyAgICAgICAgICAgICAgICBhLnUubWVtX2FjY2Vzcy5odm1t
ZW1fYWNjZXNzID0gYWNjZXNzOwo+Pj4+ICsgICAgICAgICAgICAgICAgcmMgPSBfX2NvcHlfdG9f
Z3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsKPj4+Cj4+PiBfX2NvcHlfZmllbGRfdG9f
Z3Vlc3QoKT8gT3Igd2FpdCwgbm8sIHRoZSBmdW5jdGlvbiBhcmd1bWVudCBpcyBzdGlsbCBhCj4+
PiBoYW5kbGUgb2Ygdm9pZC4KPj4+Cj4+PiBBbmQgdGhlbiAtIGhlcmUgd2UgYXJlIGFnYWluOiBJ
cyBpdCByZWFzb25hYmxlIHRvIHBlcm1pdCBhIGRvbWFpbiBpbnF1aXJpbmcKPj4+IGZvciBpdHNl
bGY/Cj4+Cj4+IEEgZ29vZCBxdWVzdGlvbi4gUGVyaGFwcyB0aGUgZm9sbG93aW5nIGFyZSBkZWNp
c2lvbiBmYWN0b3JzOgo+Pgo+PiAxLiBJdCBpcyBhbHJlYWR5IHBvc3NpYmxlIGZvciBhIGRvbWFp
biB0byBzZXQgbWVtX2FjY2VzcyByZXN0cmljdGlvbnMKPj4gKHZpYSBIVk1PUF9hbHRwMm1fc2V0
X21lbV9hY2Nlc3MpIG9uIGl0c2VsZi4KPiAKPiBXaGljaCwgYXMgYmVmb3JlLCBJIGNvbnNpZGVy
IGEgZmxhdy4KPiAKPj4gMi4gVGFtYXMnIHBhdGNoIGFsbG93cyBzZXR0aW5nIHRoaXMgZXh0ZXJu
YWxseToKPj4KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85NjM5Nzc5LyAK
Pj4KPj4gU3BlY2lmaWNhbGx5LCB3ZSBoYXZlIGFsdHAybSA9IGRpc2FibGVkLCBtaXhlZCwgZXh0
ZXJuYWwgYW5kIGxpbWl0ZWQgdG8KPj4gY29udHJvbCB3aG8gaXMgYWxsb3dlZCB0byBkbyB3aGF0
Ogo+Pgo+PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC5jZmcu
NS5odG1sIAo+IAo+IEluZGVlZCB0aGlzIGhhcyBhdCBsZWFzdCBtYWRlIHRoZSBzaXR1YXRpb24g
bGVzcyBiYWQuCgpTaG91bGQgd2UgdGhlbiBzd2l0Y2ggdGhpcyB0byBhIERPTUNUTD8gVGFtYXMs
IGFueSB0aG91Z2h0cyBvbiB0aGlzPwpGb3IgdXMgYXQgbGVhc3QgYSBET01DVEwgaXMgc3VmZmlj
aWVudC4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
