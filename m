From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Change return error for offline
 vcpus
Date: Thu, 20 Sep 2018 17:26:32 +0300
Message-ID: <74bad2ac1ee37ea0766e4cde1f4fa15585b0b559.camel@bitdefender.com>
References: <20180920125434.20569-1-aisaila@bitdefender.com>
 <5BA3A6BC02000078001EA438@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q4r9=mc=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g2zum-0006Nv-Rk
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:26:45 +0000
In-Reply-To: <5BA3A6BC02000078001EA438@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE4LTA5LTIwIGF0IDA3OjU1IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiBPbiAyMC4wOS4xOCBhdCAxNDo1NCwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90
ZToKPiA+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc2F2ZS5jCj4gPiBAQCAtMTY1LDcgKzE2NSw3IEBAIGludCBodm1fc2F2ZV9v
bmUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50Cj4gPiB0eXBlY29kZSwgdW5zaWduZWQg
aW50IGluc3RhbmNlLAo+ID4gICAgICBpZiAoIChydiA9IGh2bV9zcl9oYW5kbGVyc1t0eXBlY29k
ZV0uc2F2ZSh2LCAmY3R4dCkpICE9IDAgKQo+ID4gICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VS
UiAiSFZNJWQgc2F2ZTogZmFpbGVkIHRvIHNhdmUgdHlwZQo+ID4gJSJQUkl1MTYiICglZClcbiIs
Cj4gPiAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCB0eXBlY29kZSwgcnYpOwo+ID4gLSAg
ICBlbHNlIGlmICggcnYgPSAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXplb2YoKmRlc2MpICkKPiA+
ICsgICAgZWxzZSBpZiAoIHJ2ID0gLUVOT0RBVEEsIGN0eHQuY3VyID49IHNpemVvZigqZGVzYykg
KQo+IAo+IEkgdGhpbmsgdGhpcyBjaGFuZ2Ugb2YgZXJyb3IgY29kZSBzaG91bGQgb25jZSBhZ2Fp
biBvbmx5IGJlIGRvbmUKPiBmb3IgSFZNU1JfUEVSX1ZDUFUga2luZCByZWNvcmRzLiBGb3IgdGhl
IG90aGVycyBubyBkYXRhCj4gYXBwZWFyaW5nIGlzIF90aGVfIGluZGljYXRpb24gb2YgdGhlIGlu
c3RhbmNlIG5vdCBleGlzdGluZy4KPiAKT2ssIEkgd2lsbCBhZGQgYSBjb25kaXRpb25hbCBmb3Ig
dGhpcyBpbnNpZGUgdGhlIGlmKCkKClRoYW5rcywKQWxleAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
