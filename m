From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/hvm: Change return error for offline
 vcpus
Date: Thu, 20 Sep 2018 07:55:08 -0600
Message-ID: <5BA3A6BC02000078001EA438@prv1-mh.provo.novell.com>
References: <20180920125434.20569-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gjef=mc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2zQG-0000Wt-Sz
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 13:55:12 +0000
In-Reply-To: <20180920125434.20569-1-aisaila@bitdefender.com>
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

Pj4+IE9uIDIwLjA5LjE4IGF0IDE0OjU0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9zYXZlLmMKPiBAQCAtMTY1LDcgKzE2NSw3IEBAIGludCBodm1fc2F2ZV9vbmUoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IHR5cGVjb2RlLCB1bnNpZ25lZCBpbnQgaW5zdGFuY2UsCj4g
ICAgICBpZiAoIChydiA9IGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0uc2F2ZSh2LCAmY3R4dCkp
ICE9IDAgKQo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIkhWTSVkIHNhdmU6IGZhaWxl
ZCB0byBzYXZlIHR5cGUgJSJQUkl1MTYiICglZClcbiIsCj4gICAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCwgdHlwZWNvZGUsIHJ2KTsKPiAtICAgIGVsc2UgaWYgKCBydiA9IC1FTk9FTlQsIGN0
eHQuY3VyID49IHNpemVvZigqZGVzYykgKQo+ICsgICAgZWxzZSBpZiAoIHJ2ID0gLUVOT0RBVEEs
IGN0eHQuY3VyID49IHNpemVvZigqZGVzYykgKQoKSSB0aGluayB0aGlzIGNoYW5nZSBvZiBlcnJv
ciBjb2RlIHNob3VsZCBvbmNlIGFnYWluIG9ubHkgYmUgZG9uZQpmb3IgSFZNU1JfUEVSX1ZDUFUg
a2luZCByZWNvcmRzLiBGb3IgdGhlIG90aGVycyBubyBkYXRhCmFwcGVhcmluZyBpcyBfdGhlXyBp
bmRpY2F0aW9uIG9mIHRoZSBpbnN0YW5jZSBub3QgZXhpc3RpbmcuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
