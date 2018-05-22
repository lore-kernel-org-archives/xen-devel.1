From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v4 0/2] PVH GDT fixes
Date: Mon, 21 May 2018 23:54:43 -0400
Message-ID: <20180522035445.16911-1-boris.ostrovsky__29200.1748610803$1526961112$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qxnr=ij=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fKyM0-0003lH-Un
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 03:52:53 +0000
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
CnY0OgoqIExvYWQgJWdzIGFmdGVyIGJhc2UgYWRkcmVzcyBpcyBjYWxjdWxhdGVkCiogSW5jcmVh
c2Ugc3RhY2sgY2FuYXJ5IHNlZ21lbnQgc2l6ZSB0byA0OCBieXRlcyBmb3IgbG9uZyBtb2RlLgoK
Qm9yaXMgT3N0cm92c2t5ICgyKToKICB4ZW4vUFZIOiBTZXQgdXAgR1Mgc2VnbWVudCBmb3Igc3Rh
Y2sgY2FuYXJ5CiAgeGVuL1BWSDogTWFrZSBHRFQgc2VsZWN0b3JzIFBWSC1zcGVjaWZpYwoKIGFy
Y2gveDg2L3hlbi94ZW4tcHZoLlMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKLS0gCjIuOS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
