From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/hvm: Change return error for offline
 vcpus
Date: Fri, 21 Sep 2018 04:34:16 -0600
Message-ID: <5BA4C92802000078001EA7E7@prv1-mh.provo.novell.com>
References: <20180921073030.32354-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q3to=md=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g3IlQ-0003Qw-BH
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:34:20 +0000
In-Reply-To: <20180921073030.32354-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA5LjE4IGF0IDA5OjMwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9zYXZlLmMKPiBAQCAtMTY1LDcgKzE2NSw4IEBAIGludCBodm1fc2F2ZV9vbmUoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IHR5cGVjb2RlLCB1bnNpZ25lZCBpbnQgaW5zdGFuY2UsCj4g
ICAgICBpZiAoIChydiA9IGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0uc2F2ZSh2LCAmY3R4dCkp
ICE9IDAgKQo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIkhWTSVkIHNhdmU6IGZhaWxl
ZCB0byBzYXZlIHR5cGUgJSJQUkl1MTYiICglZClcbiIsCj4gICAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCwgdHlwZWNvZGUsIHJ2KTsKPiAtICAgIGVsc2UgaWYgKCBydiA9IC1FTk9FTlQsIGN0
eHQuY3VyID49IHNpemVvZigqZGVzYykgKQo+ICsgICAgZWxzZSBpZiAoIHJ2ID0gaHZtX3NyX2hh
bmRsZXJzW3R5cGVjb2RlXS5raW5kID09IEhWTVNSX1BFUl9WQ1BVID8KPiArICAgICAgICAgICAg
ICAtRU5PREFUQSA6IC1FTk9FTlQsIGN0eHQuY3VyID49IHNpemVvZigqZGVzYykgKQoKVGhpcyB2
ZXJ5IGNlcnRhaW5seSBuZWVkcyBwYXJlbnRoZXNpemVzLCBzaW5jZSBpZiBhc2tlZCBleHBsaWNp
dGx5IEkKZG9uJ3QgdGhpbmsgbWFueSBwZW9wbGUgd2lsbCBiZSBhYmxlIHRvIHF1aWNrbHkgYW5z
d2VyIHRoZSBxdWVzdGlvbgpvZiBwcmVjZWRlbmNlIGJldHdlZW4gdGhlID86IGFuZCAsIG9wZXJh
dG9ycy4gSSdtIGhhcHB5IHRvIGFkZAp0aGVzZSB3aGlsZSBjb21taXR0aW5nLCBhbmQgd2l0aCB0
aGVtIGluIHBsYWNlCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
