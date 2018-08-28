From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/3] xen-netback: hash mapping hanling
 adjustments
Date: Tue, 28 Aug 2018 08:54:27 -0600
Message-ID: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fufO4-00089N-QA
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:54:32 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, davem@davemloft.net, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Rmlyc3QgYW5kIGZvcmVtb3N0IHRoZSBmaXggZm9yIFhTQS0yNzAuIE9uIHRvcCBvZiB0aGF0IGZ1
cnRoZXIgY2hhbmdlcwp3aGljaCBsb29rZWQgZGVzaXJhYmxlIHRvIG1lIHdoaWxlIGludmVzdGln
YXRpbmcgdGhhdCBYU0EuCgoxOiBmaXggaW5wdXQgdmFsaWRhdGlvbiBpbiB4ZW52aWZfc2V0X2hh
c2hfbWFwcGluZygpCjI6IHZhbGlkYXRlIHF1ZXVlIG51bWJlcnMgaW4geGVudmlmX3NldF9oYXNo
X21hcHBpbmcoKQozOiBoYW5kbGUgcGFnZSBzdHJhZGRsaW5nIGluIHhlbnZpZl9zZXRfaGFzaF9t
YXBwaW5nKCkKClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
