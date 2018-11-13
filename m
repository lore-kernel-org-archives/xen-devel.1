From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Tue, 13 Nov 2018 20:57:36 +0200
Message-ID: <6e45d58f-0fd6-7563-23af-cad4dcb890b1@bitdefender.com>
References: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
 <1541945224-23075-3-git-send-email-rcojocaru@bitdefender.com>
 <2c1b78c1-e526-4481-f36d-791e11bdd06e@citrix.com>
 <7b71af9a-29ca-6f7e-13a3-27d02e0392f6@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u+9q=ny=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gMdsg-0003S0-FZ
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 18:57:46 +0000
In-Reply-To: <7b71af9a-29ca-6f7e-13a3-27d02e0392f6@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTMvMTggODo0MyBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDExLzEzLzE4
IDc6NTcgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDExLzExLzE4IDI6MDcgUE0sIFJh
enZhbiBDb2pvY2FydSB3cm90ZToKPj4gQXQgdGhlIG1vbWVudCB3ZSBlc3NlbnRpYWxseSBoYXZl
IHR3byAiaW5pdCIgc3RhdGVzOgo+PiAqIEFmdGVyIGRvbWFpbiBjcmVhdGlvbjsgYWx0cDJtIHN0
cnVjdHVyZXMgYWxsb2NhdGVkLCBidXQgbm8gcmFuZ2VzZXRzLCAmIGMKPj4gKiBBZnRlciBiZWlu
ZyBlbmFibGVkIGZvciB0aGUgZmlyc3QgdGltZTogcmFuZ2VzZXRzIG1pcnJvcmluZyBob3N0cDJt
LAo+PiBwMm1faW5pdF9hbHRwMm1fZXB0KCkgaW5pdGlhbGl6YXRpb24gZG9uZQo+Pgo+PiBJcyB0
aGVyZSBhbnkgcGFydGljdWxhciByZWFzb24gd2UgYWxsb2NhdGUgdGhlIHAybSBzdHJ1Y3R1cmVz
IG9uIGRvbWFpbgo+PiBjcmVhdGlvbiwgYnV0IG5vdCBsb2dkaXJ0eSByYW5nZSBzdHJ1Y3R1cmVz
PyAgSXQgc2VlbXMgbGlrZSBhbGxvY2F0aW5nCj4+IGFsdHAybSBzdHJ1Y3R1cmVzIG9uLWRlbWFu
ZCwgcmF0aGVyIHRoYW4gYXQgZG9tYWluIGNyZWF0aW9uIHRpbWUsIG1pZ2h0Cj4+IG1ha2UgYSBs
b3Qgb2YgdGhlIHJlYXNvbmluZyBoZXJlIHNpbXBsZXIuCj4gCj4gSSBhc3N1bWUgdGhhdCB0aGlz
IHF1ZXN0aW9uIGlzIG5vdCBhZGRyZXNzZWQgdG8gbWUsIHNpbmNlIEknbSBub3QgYWJsZQo+IHRv
IGFuc3dlciBpdCAtIEkgY2FuIG9ubHkgYXNzdW1lIHRoYXQgaGF2aW5nIGxlc3MgaGVhcCB1c2Vk
IGhhcyBiZWVuCj4gcHJlZmVycmVkLgoKQWN0dWFsbHkgSSBub3cgcmVhbGl6ZSB0aGF0IHlvdSdy
ZSBhc2tpbmcgd2h5IHRoZSBob3N0cDJtIHJhbmdlc2V0IGlzCmNyZWF0ZWQgdmlhIHBhZ2luZ19k
b21haW5faW5pdCgpIGluIGFyY2hfZG9tYWluX2NyZWF0ZSgpIChzbyBpbW1lZGlhdGVseQpvbiBk
b21haW4gY3JlYXRpb24pIHdoaWxlIEknbSBhbGxvY2F0aW5nIHRoZSBhbHRwMm0gcmFuZ2VzZXRz
IG9uIGFsdHAybQppbml0LgoKSSdtIGRvaW5nIHRoYXQgdG8gc2F2ZSBtZW1vcnksIHNpbmNlIHdl
IGNhbiBoYXZlIE1BWF9BTFRQMk0gYWx0cDJtcwood2hpY2ggaXMgY3VycmVudGx5IDEwKSwgYW5k
IG9ubHkgdHdvIGFjdGl2ZSBhbHRwMm1zIC0gdGhhdCBtZWFucyB0aGF0IEkKd291bGQgYWxsb2Nh
dGUgMTAgcmFuZ2VzZXRzIGFuZCBvbmx5IHVzZSB0d28uIEluIGZhY3Qgd2UncmUgY3VycmVudGx5
Cm9ubHkgdXNpbmcgMiBhbHRwMm1zIGFuZCB0aGUgaG9zdHAybSBmb3Igb3VyICNWRSB3b3JrLiBU
aGF0IHNhdmVzIHRoZQpzcGFjZSByZXF1aXJlZCBmb3IgOCByYW5nZXNldHMuIElmIHRoYXQncyBu
b3QgbXVjaCwgb3IgaWYgeW91IHRoaW5rIHRoYXQKdGhlIGJlbmVmaXRzIG9mIGFsbG9jYXRpbmcg
dGhlbSBlYXJseSBvdXR3ZWlnaCB0aGUgY29zdHMgd2UgY2FuIHN3aXRjaAp0byBhbGxvY2F0aW5n
IHRoZW0gb24gZG9tYWluIGNyZWF0aW9uLCBsaWtlIHRoZSBob3N0cDJtLCBhbmQgcGVyaGFwcwph
bHdheXMga2VlcGluZyB0aGVtIGluIHN5bmMuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
