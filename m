From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v5 0/2] PVH GDT fixes
Date: Wed, 23 May 2018 10:30:00 -0400
Message-ID: <20180523143002.29252-1-boris.ostrovsky__1853.41181136227$1527085638$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z25m=ik=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fLUkJ-00072O-8L
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 14:28:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, brgerst@gmail.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

Rml4IHN0YWNrIGNhbmFyeSBoYW5kbGluZyAoaW4gdGhlIGZpcnN0IHBhdGNoKSBhbmQgcmUtaW5k
ZXggUFZIIEdEVCB0bwptYWtlIGl0IGV4cGxpY2l0IHRoYXQgdGhlIEdEVCBQVkgtc3BlY2lmaWMK
CnY1OgotIExvYWQgY2FuYXJ5J3MgcGh5c2ljYWwgYWRkcmVzcyBhbmQgY2xlYXIgJWVkeCBmb3Ig
NjQtYml0IG1vZGUKCkJvcmlzIE9zdHJvdnNreSAoMik6CiAgeGVuL1BWSDogU2V0IHVwIEdTIHNl
Z21lbnQgZm9yIHN0YWNrIGNhbmFyeQogIHhlbi9QVkg6IE1ha2UgR0RUIHNlbGVjdG9ycyBQVkgt
c3BlY2lmaWMKCiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5TIHwgNDcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKCi0tIAoyLjkuMwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
