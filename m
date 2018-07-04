From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Wed, 4 Jul 2018 13:16:22 -0600
Message-ID: <CABfawhmW5bJy8vtZNwYJQY1BiOstZAvq0aVHdLYYASZ9+Mhphw@mail.gmail.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
 <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
 <ea738bb4-d439-21d6-2600-6edc1a5ca9b4@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5nur=ju=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1fanGv-00015w-2v
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 19:17:01 +0000
Received: by mail-ed1-f67.google.com with SMTP id t3-v6so4703576eds.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jul 2018 12:16:59 -0700 (PDT)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com.
 [74.125.82.50])
 by smtp.gmail.com with ESMTPSA id o15-v6sm2223420edt.4.2018.07.04.12.16.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Jul 2018 12:16:57 -0700 (PDT)
Received: by mail-wm0-f50.google.com with SMTP id s14-v6so7465887wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jul 2018 12:16:57 -0700 (PDT)
In-Reply-To: <ea738bb4-d439-21d6-2600-6edc1a5ca9b4@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMiwgMjAxOCBhdCA1OjE0IEFNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNy8wMi8yMDE4IDA5OjM0IEFNLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+Pj4+IE9uIDI5LjA2LjE4IGF0IDE4OjM5LCA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPj4gT24gMDYvMjkvMjAxOCAwNjozOCBQTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4+Pj4+IE9uIDI4LjA2LjE4IGF0IDE1OjAwLCA8YXBvcEBiaXRkZWZl
bmRlci5jb20+IHdyb3RlOgo+ID4+Pj4gQEAgLTQ2NjYsNiArNDY2NywyMyBAQCBzdGF0aWMgaW50
IGRvX2FsdHAybV9vcCgKPiA+Pj4+ICAgICAgICAgIH0KPiA+Pj4+ICAgICAgICAgIGJyZWFrOwo+
ID4+Pj4KPiA+Pj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3M6Cj4gPj4+
PiArICAgICAgICBpZiAoIGEudS5tZW1fYWNjZXNzLnBhZCApCj4gPj4+PiArICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwo+ID4+Pj4gKyAgICAgICAgZWxzZQo+ID4+Pj4gKyAgICAgICAgewo+ID4+
Pj4gKyAgICAgICAgICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7Cj4gPj4+PiArCj4gPj4+PiAr
ICAgICAgICAgICAgcmMgPSBwMm1fZ2V0X21lbV9hY2Nlc3MoZCwgX2dmbihhLnUubWVtX2FjY2Vz
cy5nZm4pLCAmYWNjZXNzLAo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGEudS5tZW1fYWNjZXNzLnZpZXcpOwo+ID4+Pj4gKyAgICAgICAgICAgIGlmICggIXJjICkK
PiA+Pj4+ICsgICAgICAgICAgICB7Cj4gPj4+PiArICAgICAgICAgICAgICAgIGEudS5tZW1fYWNj
ZXNzLmh2bW1lbV9hY2Nlc3MgPSBhY2Nlc3M7Cj4gPj4+PiArICAgICAgICAgICAgICAgIHJjID0g
X19jb3B5X3RvX2d1ZXN0KGFyZywgJmEsIDEpID8gLUVGQVVMVCA6IDA7Cj4gPj4+Cj4gPj4+IF9f
Y29weV9maWVsZF90b19ndWVzdCgpPyBPciB3YWl0LCBubywgdGhlIGZ1bmN0aW9uIGFyZ3VtZW50
IGlzIHN0aWxsIGEKPiA+Pj4gaGFuZGxlIG9mIHZvaWQuCj4gPj4+Cj4gPj4+IEFuZCB0aGVuIC0g
aGVyZSB3ZSBhcmUgYWdhaW46IElzIGl0IHJlYXNvbmFibGUgdG8gcGVybWl0IGEgZG9tYWluIGlu
cXVpcmluZwo+ID4+PiBmb3IgaXRzZWxmPwo+ID4+Cj4gPj4gQSBnb29kIHF1ZXN0aW9uLiBQZXJo
YXBzIHRoZSBmb2xsb3dpbmcgYXJlIGRlY2lzaW9uIGZhY3RvcnM6Cj4gPj4KPiA+PiAxLiBJdCBp
cyBhbHJlYWR5IHBvc3NpYmxlIGZvciBhIGRvbWFpbiB0byBzZXQgbWVtX2FjY2VzcyByZXN0cmlj
dGlvbnMKPiA+PiAodmlhIEhWTU9QX2FsdHAybV9zZXRfbWVtX2FjY2Vzcykgb24gaXRzZWxmLgo+
ID4KPiA+IFdoaWNoLCBhcyBiZWZvcmUsIEkgY29uc2lkZXIgYSBmbGF3Lgo+ID4KPiA+PiAyLiBU
YW1hcycgcGF0Y2ggYWxsb3dzIHNldHRpbmcgdGhpcyBleHRlcm5hbGx5Ogo+ID4+Cj4gPj4gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85NjM5Nzc5Lwo+ID4+Cj4gPj4gU3BlY2lm
aWNhbGx5LCB3ZSBoYXZlIGFsdHAybSA9IGRpc2FibGVkLCBtaXhlZCwgZXh0ZXJuYWwgYW5kIGxp
bWl0ZWQgdG8KPiA+PiBjb250cm9sIHdobyBpcyBhbGxvd2VkIHRvIGRvIHdoYXQ6Cj4gPj4KPiA+
PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC5jZmcuNS5odG1s
Cj4gPgo+ID4gSW5kZWVkIHRoaXMgaGFzIGF0IGxlYXN0IG1hZGUgdGhlIHNpdHVhdGlvbiBsZXNz
IGJhZC4KPgo+IFNob3VsZCB3ZSB0aGVuIHN3aXRjaCB0aGlzIHRvIGEgRE9NQ1RMPyBUYW1hcywg
YW55IHRob3VnaHRzIG9uIHRoaXM/Cj4gRm9yIHVzIGF0IGxlYXN0IGEgRE9NQ1RMIGlzIHN1ZmZp
Y2llbnQuCgpJIHByZXR0eSBtdWNoIGFncmVlIHdpdGggR2VvcmdlIGluIHRoaXMgdGhyZWFkLiBC
ZWluZyBhYmxlIHRvIHNldCB0aGUKbWVtYWNjZXNzIHBlcm1pc3Npb24gZnJvbSB0aGUgZ3Vlc3Qg
aXMgYWxyZWFkeSBhbiBhbGxvd2VkIHNldHVwIHdpdGgKdGhlIHByb3BlciBhbHRwMm0gc2V0dGlu
ZyAoYW5kIHRoYXQgaXMgbm90IG9uIGJ5IGRlZmF1bHQpLiBTbyBJIGRvbid0CnNlZSB3aHkgYmVp
bmcgYWJsZSB0byBnZXQgdGhhdCBwZXJtaXNzaW9uIHNob3VsZCBiZSBhbnkgZGlmZmVyZW50LgoK
VGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
