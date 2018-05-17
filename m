From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v3 0/2] PVH GDT fixes
Date: Thu, 17 May 2018 10:47:21 -0400
Message-ID: <20180517144723.21585-1-boris.ostrovsky__27641.9269889177$1526568239$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o0py=ie=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fJK9Q-0004gY-5O
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 14:45:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

Rml4IHN0YWNrIGNhbmFyeSBoYW5kbGluZyAoaW4gdGhlIGZpcnN0IHBhdGNoKSBhbmQgcmUtaW5k
ZXggUFZIIEdEVCB0bwptYWtlIGl0IGV4cGxpY2l0IHRoYXQgdGhlIEdEVCBQVkgtc3BlY2lmaWMK
CnYzOgotIFVzZSBHUyBiYXNlIE1TUiBmb3IgNjQtYml0IG1vZGUKCkJvcmlzIE9zdHJvdnNreSAo
Mik6CiAgeGVuL1BWSDogU2V0IHVwIEdTIHNlZ21lbnQgZm9yIHN0YWNrIGNhbmFyeQogIHhlbi9Q
Vkg6IE1ha2UgR0RUIHNlbGVjdG9ycyBQVkgtc3BlY2lmaWMKCiBhcmNoL3g4Ni94ZW4veGVuLXB2
aC5TIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKLS0gCjIu
OS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
