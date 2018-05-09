From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/2] xen-hvm: use new resource mapping API
Date: Wed, 9 May 2018 16:46:02 +0100
Message-ID: <20180509154604.25530-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=re5l=h4=citrix.com=prvs=66078d76a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fGRI9-00063H-QD
 for xen-devel@lists.xenproject.org; Wed, 09 May 2018 15:46:09 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgbW9kaWZpZXMgUUVNVSB0byB1c2UgdGhlIG5ldyBndWVzdCByZXNvdXJjZSBt
YXBwaW5nIEFQSQooYXZhaWxhYmxlIGluIFhlbiA0LjExKykgdG8gbWFwIGlvcmVxIHBhZ2VzLgoK
UGF1bCBEdXJyYW50ICgyKToKICB4ZW4taHZtOiBjcmVhdGUgc2VwYXJhdGUgZnVuY3Rpb24gZm9y
IGlvcmVxIHNlcnZlciBpbml0aWFsaXphdGlvbgogIHhlbi1odm06IHRyeSB0byB1c2UgeGVuZm9y
ZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UoKSB0byBtYXAgaW9yZXEgcGFnZXMKCiBjb25maWd1cmUg
ICAgICAgICAgICAgICAgICAgfCAgIDUgKysKIGh3L2kzODYveGVuL3RyYWNlLWV2ZW50cyAgICB8
ICAgMSArCiBody9pMzg2L3hlbi94ZW4taHZtLmMgICAgICAgfCAxMTQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcveGVuL3hlbl9jb21tb24u
aCB8ICAxNCArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyksIDMwIGRl
bGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
