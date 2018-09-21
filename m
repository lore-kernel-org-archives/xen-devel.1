From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v2] x86/hvm: Change return error for offline
 vcpus
Date: Fri, 21 Sep 2018 17:23:03 +0300
Message-ID: <cab85ba68e341e2f8b8d4f0597c601ee3bfb5b5f.camel@bitdefender.com>
References: <20180921073030.32354-1-aisaila@bitdefender.com>
 <5BA4C92802000078001EA7E7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kas4=md=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g3MKy-0006Uw-8Q
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 14:23:16 +0000
In-Reply-To: <5BA4C92802000078001EA7E7@prv1-mh.provo.novell.com>
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

T24gRnJpLCAyMDE4LTA5LTIxIGF0IDA0OjM0IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiBPbiAyMS4wOS4xOCBhdCAwOTozMCwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90
ZToKPiA+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc2F2ZS5jCj4gPiBAQCAtMTY1LDcgKzE2NSw4IEBAIGludCBodm1fc2F2ZV9v
bmUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50Cj4gPiB0eXBlY29kZSwgdW5zaWduZWQg
aW50IGluc3RhbmNlLAo+ID4gICAgICBpZiAoIChydiA9IGh2bV9zcl9oYW5kbGVyc1t0eXBlY29k
ZV0uc2F2ZSh2LCAmY3R4dCkpICE9IDAgKQo+ID4gICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VS
UiAiSFZNJWQgc2F2ZTogZmFpbGVkIHRvIHNhdmUgdHlwZQo+ID4gJSJQUkl1MTYiICglZClcbiIs
Cj4gPiAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCB0eXBlY29kZSwgcnYpOwo+ID4gLSAg
ICBlbHNlIGlmICggcnYgPSAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXplb2YoKmRlc2MpICkKPiA+
ICsgICAgZWxzZSBpZiAoIHJ2ID0gaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2RlXS5raW5kID09Cj4g
PiBIVk1TUl9QRVJfVkNQVSA/Cj4gPiArICAgICAgICAgICAgICAtRU5PREFUQSA6IC1FTk9FTlQs
IGN0eHQuY3VyID49IHNpemVvZigqZGVzYykgKQo+IAo+IFRoaXMgdmVyeSBjZXJ0YWlubHkgbmVl
ZHMgcGFyZW50aGVzaXplcywgc2luY2UgaWYgYXNrZWQgZXhwbGljaXRseSBJCj4gZG9uJ3QgdGhp
bmsgbWFueSBwZW9wbGUgd2lsbCBiZSBhYmxlIHRvIHF1aWNrbHkgYW5zd2VyIHRoZSBxdWVzdGlv
bgo+IG9mIHByZWNlZGVuY2UgYmV0d2VlbiB0aGUgPzogYW5kICwgb3BlcmF0b3JzLiBJJ20gaGFw
cHkgdG8gYWRkCj4gdGhlc2Ugd2hpbGUgY29tbWl0dGluZywgYW5kIHdpdGggdGhlbSBpbiBwbGFj
ZQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCk9rLCB0aGFu
a3MgZm9yIHRoZSBoZWxwLgoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
