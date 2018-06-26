From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] gnttab: silence table expansion message
Date: Tue, 26 Jun 2018 01:22:01 -0600
Message-ID: <5B31E99902000078001CDD0D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXiIf-0003wV-UP
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 07:22:05 +0000
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

VGhpcyBjdXJyZW50bHkgc2hvd3MgdXAgZm9yIGJhc2ljYWxseSBldmVyeSBkb21haW4sIHdoZW4g
b3JpZ2luYWxseSBpdAp3YXMgbG9nZ2VkIG9ubHkgd2hlbiBnb2luZyBiZXlvbmQgdGhlIGRlZmF1
bHQgdGFibGUgc2l6ZS4gUmVzdG9yZSB0aGF0CmJlaGF2aW9yLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJs
ZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMTc2NCw5ICsxNzY0LDEwIEBA
IGdudHRhYl9ncm93X3RhYmxlKHN0cnVjdCBkb21haW4gKmQsIHVuc2kKICAgICAgICAgcmVxX25y
X2ZyYW1lcyA9IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVTOwogICAgIEFTU0VSVChyZXFfbnJfZnJh
bWVzIDw9IGd0LT5tYXhfZ3JhbnRfZnJhbWVzKTsKIAotICAgIGdkcHJpbnRrKFhFTkxPR19JTkZP
LAotICAgICAgICAgICAgIkV4cGFuZGluZyBkJWQgZ3JhbnQgdGFibGUgZnJvbSAldSB0byAldSBm
cmFtZXNcbiIsCi0gICAgICAgICAgICBkLT5kb21haW5faWQsIG5yX2dyYW50X2ZyYW1lcyhndCks
IHJlcV9ucl9mcmFtZXMpOworICAgIGlmICggcmVxX25yX2ZyYW1lcyA+IElOSVRJQUxfTlJfR1JB
TlRfRlJBTUVTICkKKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sCisgICAgICAgICAgICAg
ICAgICJFeHBhbmRpbmcgZCVkIGdyYW50IHRhYmxlIGZyb20gJXUgdG8gJXUgZnJhbWVzXG4iLAor
ICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIG5yX2dyYW50X2ZyYW1lcyhndCksIHJlcV9u
cl9mcmFtZXMpOwogCiAgICAgLyogQWN0aXZlICovCiAgICAgZm9yICggaSA9IG5yX2FjdGl2ZV9n
cmFudF9mcmFtZXMoZ3QpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
