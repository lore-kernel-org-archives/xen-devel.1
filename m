From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 12/12] cpufreq: patch target() indirect call
 to direct one
Date: Wed, 29 Aug 2018 08:09:25 -0600
Message-ID: <5B86A91502000078001E31A7@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fv1A1-00052e-LW
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:09:29 +0000
In-Reply-To: <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
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
