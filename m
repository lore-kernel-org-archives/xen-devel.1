From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 9/9] cpufreq: patch target() indirect call to
 direct one
Date: Tue, 11 Sep 2018 07:37:37 -0600
Message-ID: <5B97C52102000078001E74CA@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzirP-0000jN-3s
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 13:37:43 +0000
In-Reply-To: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBsb29rcyB0byBiZSB0aGUgb25seSBmcmVxdWVudGx5IGV4ZWN1dGVkIGhvb2s7IGRvbid0
IGJvdGhlcgpwYXRjaGluZyBhbnkgb3RoZXIgb25lcy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBOZXcuCgotLS0gYS94ZW4vZHJpdmVycy9j
cHVmcmVxL3V0aWxpdHkuYworKysgYi94ZW4vZHJpdmVycy9jcHVmcmVxL3V0aWxpdHkuYwpAQCAt
MzY0LDcgKzM2NCw4IEBAIGludCBfX2NwdWZyZXFfZHJpdmVyX3RhcmdldChzdHJ1Y3QgY3B1ZnIK
ICAgICB7CiAgICAgICAgIHVuc2lnbmVkIGludCBwcmV2X2ZyZXEgPSBwb2xpY3ktPmN1cjsKIAot
ICAgICAgICByZXR2YWwgPSBjcHVmcmVxX2RyaXZlci50YXJnZXQocG9saWN5LCB0YXJnZXRfZnJl
cSwgcmVsYXRpb24pOworICAgICAgICByZXR2YWwgPSBhbHRlcm5hdGl2ZV9jYWxsKGNwdWZyZXFf
ZHJpdmVyLnRhcmdldCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb2xpY3ks
IHRhcmdldF9mcmVxLCByZWxhdGlvbik7CiAgICAgICAgIGlmICggcmV0dmFsID09IDAgKQogICAg
ICAgICAgICAgVFJBQ0VfMkQoVFJDX1BNX0ZSRVFfQ0hBTkdFLCBwcmV2X2ZyZXEvMTAwMCwgcG9s
aWN5LT5jdXIvMTAwMCk7CiAgICAgfQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
