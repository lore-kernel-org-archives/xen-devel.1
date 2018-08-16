From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] libxl: fix ARM build after 54ed251dc7
Date: Thu, 16 Aug 2018 00:49:29 -0600
Message-ID: <5B751E7902000078001DEB43@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x9l4=k7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqC68-00087T-Ir
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 06:49:32 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0ICJ0b29sczogUmV3b3JrIHhjX2RvbWFpbl9jcmVhdGUoKSB0byB0YWtlIGEgZnVsbAp4
ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiIgIGZhaWxlZCB0byByZXBsYWNlIG9uZSBmdXJ0aGVyIGlu
c3RhbmNlIG9mCnhjX2NvbmZpZyBpbiBsaWJ4bF9fYXJjaF9kb21haW5fc2F2ZV9jb25maWcoKS4K
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkkgaGF2
ZSBubyBlbnZpcm9ubWVudCBzZXQgdXAgdG8gZG8gY3Jvc3MgdG9vbCBzdGFjayBidWlsZHMsIHNv
IHRoZSBwYXRjaAppcyBzb2xlbHkgYmFzZWQgb24gb3NzdGVzdCByZXBvcnQgYW5kIGNvZGUgaW5z
cGVjdGlvbi4KCi0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2FybS5jCkBAIC0xMjUsNyArMTI1LDcgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9z
YXZlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLAogICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKICAg
ICB9CiAKLSAgICBzdGF0ZS0+Y2xvY2tfZnJlcXVlbmN5ID0geGNfY29uZmlnLT5jbG9ja19mcmVx
dWVuY3k7CisgICAgc3RhdGUtPmNsb2NrX2ZyZXF1ZW5jeSA9IGNvbmZpZy0+YXJjaC5jbG9ja19m
cmVxdWVuY3k7CiAKICAgICByZXR1cm4gMDsKIH0KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
