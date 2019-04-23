From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v6] x86/altp2m: Aggregate get entry and
 populate into common funcs
Date: Tue, 23 Apr 2019 12:15:47 -0600
Message-ID: <CABfawhmhuHmdNXDNYh0LT3qYshHu0Bg0-nuPqtP-g08r2YPPeQ@mail.gmail.com>
References: <20190423142959.12609-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H2oZ=SZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hIzy2-0002YU-V9
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 18:16:30 +0000
Received: by mail-wm1-f54.google.com with SMTP id w15so1240992wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 11:16:25 -0700 (PDT)
In-Reply-To: <20190423142959.12609-1-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgODozMCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvZGUgZm9yIGdldHRpbmcg
dGhlIGVudHJ5IGFuZCB0aGVuIHBvcHVsYXRpbmcgd2FzIHJlcGVhdGVkIGluCj4gcDJtX2NoYW5n
ZV9hbHRwMm1fZ2ZuKCkgYW5kIGluIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3MoKS4KPgo+IFRo
ZSBjb2RlIGlzIG5vdyBpbiBvbmUgcGxhY2Ugd2l0aCBhIGJvb2wgcGFyYW0gdGhhdCBsZXRzIHRo
ZSBjYWxsZXIgY2hvb3NlCj4gaWYgaXQgcG9wdWxhdGVzIGFmdGVyIGdldF9lbnRyeSgpLgo+Cj4g
SWYgcmVtYXBwaW5nIGlzIGJlaW5nIGRvbmUgdGhlbiBib3RoIHRoZSBvbGQgYW5kIG5ldyBnZm4n
cyBzaG91bGQgYmUKPiB1bnNoYXJlZCBpbiB0aGUgaG9zdHAybSBmb3Iga2VlcGluZyB0aGluZ3Mg
Y29uc2lzdGVudC4gVGhlIHBhZ2UgdHlwZQo+IG9mIG9sZF9nZm4gd2FzIGFscmVhZHkgY2hlY2tl
ZCB3aGV0aGVyIGl0J3MgcDJtX3JhbV9ydyBhbmQgYmFpbCBpZiBpdAo+IHdhc24ndCBzbyBmdW5j
dGlvbmFsaXR5LXdpc2UgdGhpcyBqdXN0IHNpbXBsaWZpZXMgdGhpbmdzIGFzIGEgdXNlcgo+IGRv
ZXNuJ3QgaGF2ZSB0byByZXF1ZXN0IHVuc2hhcmluZyBtYW51YWxseSBiZWZvcmUgcmVtYXBwaW5n
Lgo+IE5vdywgaWYgdGhlIG5ld19nZm4gaXMgaW52YWxpZCBpdCBzaG91bGRuJ3QgcXVlcnkgdGhl
IGhvc3RwMm0gYXMKPiB0aGF0IGlzIGVmZmVjdGl2ZWx5IGEgcmVxdWVzdCB0byByZW1vdmUgdGhl
IGVudHJ5IGZyb20gdGhlIGFsdHAybS4KPiBCdXQgcHJvdmlkZWQgdGhhdCBzY2VuYXJpbyBpcyB1
c2VkIG9ubHkgd2hlbiByZW1vdmluZyBlbnRyaWVzIHRoYXQKPiB3ZXJlIHByZXZpb3VzbHkgcmVt
YXBwZWQvY29waWVkIHRvIHRoZSBhbHRwMm0sIHRob3NlIGVudHJpZXMgYWxyZWFkeQo+IHdlbnQg
dGhyb3VnaCBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSBiZWZvcmUsIHNvIGl0IHdvbid0IGhhdmUg
YW4KPiBhZmZlY3Qgc28gdGhlIGNvcmUgZnVuY3Rpb24gZ2V0X2FsdHAybV9lbnRyeSgpIGlzIGNh
bGxpbmcKPiBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSB3aXRoIFAyTV9BTExPQyB8IFAyTV9VTlNI
QVJFLgo+Cj4gYWx0cDJtX2dldF9lbnRyeV9kaXJlY3QoKSBpcyBhbHNvIGNhbGxlZCBpbiBwMm1f
c2V0X3N1cHByZXNzX3ZlKCkKPiBiZWNhdXNlIG9uIGEgbmV3IGFsdHAybSB2aWV3IHRoZSBmdW5j
dGlvbiB3aWxsIGZhaWwgd2l0aCBpbnZhbGlkIG1mbiBpZgo+IHAybS0+c2V0X2VudHJ5KCkgd2Fz
IG5vdCBjYWxsZWQgYmVmb3JlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1h
c0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
