From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] fuzz,
 test x86_emulator: disable sse before including always_inline fns
Date: Tue, 25 Sep 2018 01:31:56 -0600
Message-ID: <5BA9E46C02000078001EB6F4@prv1-mh.provo.novell.com>
References: <1537557930-3266-1-git-send-email-christopher.w.clark@gmail.com>
 <EE473E0502000094601C5EC1@prv1-mh.provo.novell.com>
 <5B8E4B2302000078001E5057@prv1-mh.provo.novell.com>
 <960FC0BE02000080AB59E961@prv1-mh.provo.novell.com>
 <5BA4C25402000078001EA77A@prv1-mh.provo.novell.com>
 <FEBAD1C002000087824A10E1@prv1-mh.provo.novell.com>
 <5BA8D34802000078001EB1CB@prv1-mh.provo.novell.com>
 <CACMJ4Gb8qRQYN_P9471mtHNfsocOUC1sqE3PVgospq+6tWVNWA@mail.gmail.com>
 <D1822B16020000D4AB59E961@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=u73d=mh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g4hpC-0007Kf-ED
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 07:32:02 +0000
In-Reply-To: <D1822B16020000D4AB59E961@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDAxOjE3LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDI0LCAyMDE4IGF0IDU6MDYgQU0gSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4KPj4gPj4+IE9uIDIxLjA5LjE4IGF0IDIxOjI1LCA8
Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+PiA+Cj4+ID4gQWRkcyBuZWNl
c3NhcnkgKHByZXZpb3VzbHkgbWlzc2luZykgI2luY2x1ZGUgPHN0ZGlvLmg+IHRvIHg4Ni1lbXVs
YXRlLmgKPj4KPj4gV2h5ICJuZWNlc3NhcnkgKHByZXZpb3VzbHkgbWlzc2luZykiPyBJIGNhbid0
IHNlZW0gdG8gYmUgYWJsZSB0bwo+PiBzcG90IGFueXRoaW5nIGluIHRoYXQgaGVhZGVyIHRoYXQg
d291bGQgZGVwZW5kIG9uIHN0ZGlvLmguCj4gCj4gV2hlbiBXUkFQIGlzIGRlZmluZWQgcHJpb3Ig
dG8gaW5jbHVkaW5nIHg4Ni1lbXVsYXRlLmgsIGl0IGludHJvZHVjZXMKPiB0aGUgbmVlZCBmb3Ig
c3RkaW8uaCB0byBiZSBpbmNsdWRlZCB0byBhdm9pZDoKPiAKPiB8IHg4Ni1lbXVsYXRlLmg6ODM6
NjogZXJyb3I6ICdmd3JpdGUnIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEKPiBmdW5jdGlvbik7
IGRpZCB5b3UgbWVhbiAnZnJlZSc/Cj4gfCAgV1JBUChmd3JpdGUpOwo+IAo+IGFuZCBzaW1pbGFy
IGZvciB0aGUgb3RoZXIgd3JhcHBlZCBmdW5jdGlvbnMuCj4gCj4gSXQgd2FzIGZpbmUgcHJldmlv
dXNseSBhcyB3cmFwcGVyLmMgaW5jbHVkZWQgPHN0ZGlvLmg+IHByaW9yIHRvIAo+ICJ4ODYtZW11
bGF0ZS5oIgo+IGJ1dCB0aGF0IGdldHMgY2hhbmdlZCB3aXRoIHRoaXMgY29tbWl0LiBJJ2xsIHJl
d3JpdGUgdGhhdCBwYXJ0IG9mIHRoZSBjb21taXQKPiBtZXNzYWdlIHRob3VnaCwgYW5kIEknbGwg
YWxzbyBtYWRlIHRoZSBuZXcgPHN0ZGlvLmg+IGluY2x1c2lvbgo+IGRlcGVuZGVudCBvbiBXUkFQ
LAo+IHNpbmNlIFdSQVAgYmVpbmcgZGVmaW5lZCBpcyB3aGF0IHByb21wdHMgdGhlIG5lZWQgZm9y
IGl0LgoKQnV0IHRoYXQncyAoaW4gbXkgb3BpbmlvbikgYSByZXF1aXJlbWVudCB0b3dhcmRzIHRo
ZSBmaWxlIGRlZmluaW5nCldSQVAgdGhlbiwgbm90IHRvd2FyZHMgdGhlIGhlYWRlci4KCj4+ID4g
ICNpZiBfX0dOVUNfXyA+PSA2Cj4+ID4gICNwcmFnbWEgR0NDIHRhcmdldCgibm8tc3NlIikKPj4g
PiAgI2VuZGlmCj4+Cj4+IEkgdGhpbmsgdGhlIHJpZ2h0IGFwcHJvYWNoIHdvdWxkIGJlIHRvIG1v
dmUgdGhpcyB0byB0aGUgdG9wIG9mIHRoZQo+PiBmaWxlLCBhaGVhZCBvZiBhbGwgI2luY2x1ZGUt
cy4gSG93ZXZlciwgSSB2YWd1ZWx5IHJlY2FsbCB0aGlzIG5vdAo+PiBoYXZpbmcgd29ya2VkIG9u
IGF0IGxlYXN0IHNvbWUgc3lzdGVtcyBiYWNrIHdoZW4gSSBoYWQKPj4gaW50cm9kdWNlZCBpdC4K
PiAKPiBZZXMsIHRoaXMgaXMgc3RpbGwgdGhlIGNhc2UsIGZhaWxpbmcgaW4gbXkgZGV2ZWxvcG1l
bnQgZW52aXJvbm1lbnQgYXQgbGVhc3QuCj4gRGVjbGFyYXRpb24gb2YgYXRvZiBmYWlscyB3aXRo
OiAiU1NFIHJlZ2lzdGVyIHJldHVybiB3aXRoIFNTRSBkaXNhYmxlZCIuCgpIbW0gLSBJIChub3cp
IHdvbmRlciB3aGV0aGVyIC1tZnBtYXRoPSBjb3VsZCBoZWxwIGhlcmUuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
