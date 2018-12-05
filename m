From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v6 09/10] cpufreq: patch target() indirect call
 to direct one
Date: Wed, 05 Dec 2018 09:07:34 -0700
Message-ID: <5C07F7C60200007800203314@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5C07F49D02000078002032BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUZi8-000312-1G
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:07:40 +0000
In-Reply-To: <5C07F49D02000078002032BD@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBsb29rcyB0byBiZSB0aGUgb25seSBmcmVxdWVudGx5IGV4ZWN1dGVkIGhvb2s7IGRvbid0
IGJvdGhlcgpwYXRjaGluZyBhbnkgb3RoZXIgb25lcy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KdjI6IE5ldy4KCi0tLSBhL3hlbi9kcml2ZXJzL2NwdWZyZXEvdXRpbGl0eS5jCisr
KyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvdXRpbGl0eS5jCkBAIC0zNjQsNyArMzY0LDggQEAgaW50
IF9fY3B1ZnJlcV9kcml2ZXJfdGFyZ2V0KHN0cnVjdCBjcHVmcgogICAgIHsKICAgICAgICAgdW5z
aWduZWQgaW50IHByZXZfZnJlcSA9IHBvbGljeS0+Y3VyOwogCi0gICAgICAgIHJldHZhbCA9IGNw
dWZyZXFfZHJpdmVyLnRhcmdldChwb2xpY3ksIHRhcmdldF9mcmVxLCByZWxhdGlvbik7CisgICAg
ICAgIHJldHZhbCA9IGFsdGVybmF0aXZlX2NhbGwoY3B1ZnJlcV9kcml2ZXIudGFyZ2V0LAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvbGljeSwgdGFyZ2V0X2ZyZXEsIHJlbGF0
aW9uKTsKICAgICAgICAgaWYgKCByZXR2YWwgPT0gMCApCiAgICAgICAgICAgICBUUkFDRV8yRChU
UkNfUE1fRlJFUV9DSEFOR0UsIHByZXZfZnJlcS8xMDAwLCBwb2xpY3ktPmN1ci8xMDAwKTsKICAg
ICB9CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
