From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 08 Oct 2018 04:33:04 -0600
Message-ID: <5BBB326002000078001EF7D2@prv1-mh.provo.novell.com>
References: <20181008101445.38735-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9Sqe-00053r-IV
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 10:33:12 +0000
In-Reply-To: <20181008101445.38735-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEwLjE4IGF0IDEyOjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gQEAgLTUwNSw3ICs1MDUsNyBAQCBpbnQgaW9tbXVfZG9f
ZG9tY3RsKAo+ICAKPiAgdm9pZCBpb21tdV9zaGFyZV9wMm1fdGFibGUoc3RydWN0IGRvbWFpbiog
ZCkKPiAgewo+IC0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKPiArICAgIGlmICggaW9t
bXVfZW5hYmxlZCAmJiBoYXBfZW5hYmxlZChkKSAmJiBpb21tdV9oYXBfcHRfc2hhcmUgKQoKQ29u
c2lkZXJpbmcgdGhlIG9ubHkgY2FsbGVyLCB0aGUgaGFwX2VuYWJsZWQoKSBwYXJ0IGlzIChhbmQg
d2FzKSBub3QKbmVlZGVkIGhlcmUuIEkgYWxzbyB3b3VsZCBwcmVmZXIgdG8gc2VlIGEgY29tbWVu
dCBhdHRhY2hlZCBoZXJlLAp0byAoYnJpZWZseSkgZXhwbGFpbiB3aHkgdGhpcyBjYW4ndCBiZSBp
b21tdV91c2VfaGFwX3B0KCkuCgpJcyB0aGlzIHdoYXQgV2VpIGFsc28gaGFzIGZvdW5kIHRvIGJy
ZWFrIGhpcyBQVkggRG9tMD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
