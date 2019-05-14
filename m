From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] VT-d: change bogus return value of
 intel_iommu_lookup_page()
Date: Tue, 14 May 2019 06:04:26 -0600
Message-ID: <5CDAAECA020000780022E947@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQWAY-0005E9-C5
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:04:30 +0000
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
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZ1bmN0aW9uIHBhc3NlcyAwIGFzICJhbGxvYyIgYXJndW1lbnQgdG8gYWRkcl90b19kbWFf
cGFnZV9tYWRkcigpLApzbyAtRU5PTUVNIHNpbXBseSBtYWtlcyBubyBzZW5zZSAoYW5kIGl0cyB1
c2Ugd2FzIHByb2JhYmx5IHNpbXBseSBhCmNvcHktYW5kLXBhc3RlIGVmZmVjdCBvcmlnaW5hdGlu
ZyBhdCBpbnRlbF9pb21tdV9tYXBfcGFnZSgpKS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCkBAIC0xODcw
LDcgKzE4NzAsNyBAQCBzdGF0aWMgaW50IGludGVsX2lvbW11X2xvb2t1cF9wYWdlKHN0cnVjCiAg
ICAgaWYgKCAhcGdfbWFkZHIgKQogICAgIHsKICAgICAgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNo
Lm1hcHBpbmdfbG9jayk7Ci0gICAgICAgIHJldHVybiAtRU5PTUVNOworICAgICAgICByZXR1cm4g
LUVOT0VOVDsKICAgICB9CiAKICAgICBwYWdlID0gbWFwX3Z0ZF9kb21haW5fcGFnZShwZ19tYWRk
cik7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
