From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Change return error for offline
 vcpus
Date: Fri, 21 Sep 2018 09:44:41 +0100
Message-ID: <20180921084441.juqzlukd6efjhhfp@zion.uk.xensource.com>
References: <20180921073030.32354-1-aisaila@bitdefender.com>
 <20180921084322.57tkffdhwqyemw7w@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3H3N-0002g8-NL
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 08:44:45 +0000
Content-Disposition: inline
In-Reply-To: <20180921084322.57tkffdhwqyemw7w@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDk6NDM6MjJBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIFNlcCAyMSwgMjAxOCBhdCAxMDozMDozMEFNICswMzAwLCBBbGV4YW5kcnUgSXNh
aWxhIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gaGF2ZSBhIGRp
ZmZlcmVudCByZXR1cm4gZXJyb3IgZm9yIGludmFsaWQgdmNwdQo+ID4gYW5kIG9mZmxpbmUgdmNw
dSBvbiB0aGUgcGVyIHZjcHUga2luZy4KPiAKPiBTb3JyeSwgSSBjYW4ndCBwYXJzZSB0aGlzIHNl
bnRlbmNlLiBXaGF0IGlzICJwZXIgdmNwdSBraW5nIj8KCk9oLCAia2luZyIgc2hvdWxkIGJlICJr
aW5kIi4KCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPgo+ID4gCj4gPiAtLS0KPiA+IENoYW5nZXMgc2luY2UgVjE6Cj4g
PiAJLSBBZGQgY29uZGl0aW9uYWwgc3RhdGVtZW50IGluIG9yZGVyIHRvIGhhdmUgYSBkaWZmZXJl
bmNlIGJldHdlZW4KPiA+IAlwZXJfdmNwdSBhbmQgcGVyX2RvbSByZXR1cm4gZXJyb3IuCj4gPiAt
LS0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL3NhdmUuYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9zYXZlLmMgYi94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwo+ID4gaW5k
ZXggZDUyMDg5ODg0My4uMTc2NGZiMDkxOCAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vc2F2ZS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3NhdmUuYwo+ID4gQEAgLTE2NSw3
ICsxNjUsOCBAQCBpbnQgaHZtX3NhdmVfb25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGlu
dCB0eXBlY29kZSwgdW5zaWduZWQgaW50IGluc3RhbmNlLAo+ID4gICAgICBpZiAoIChydiA9IGh2
bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0uc2F2ZSh2LCAmY3R4dCkpICE9IDAgKQo+ID4gICAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiSFZNJWQgc2F2ZTogZmFpbGVkIHRvIHNhdmUgdHlwZSAl
IlBSSXUxNiIgKCVkKVxuIiwKPiA+ICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIHR5cGVj
b2RlLCBydik7Cj4gPiAtICAgIGVsc2UgaWYgKCBydiA9IC1FTk9FTlQsIGN0eHQuY3VyID49IHNp
emVvZigqZGVzYykgKQo+ID4gKyAgICBlbHNlIGlmICggcnYgPSBodm1fc3JfaGFuZGxlcnNbdHlw
ZWNvZGVdLmtpbmQgPT0gSFZNU1JfUEVSX1ZDUFUgPwo+ID4gKyAgICAgICAgICAgICAgLUVOT0RB
VEEgOiAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXplb2YoKmRlc2MpICkKPiA+ICAgICAgewo+ID4g
ICAgICAgICAgdWludDMyX3Qgb2ZmOwo+ID4gIAo+ID4gLS0gCj4gPiAyLjE3LjEKPiA+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
