From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v2 0/2] xen/arm: vgic-v3: bug fixes
Date: Mon,  1 Oct 2018 17:42:25 +0100
Message-ID: <20181001164227.6562-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g71HI-0007Up-Ky
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 16:42:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, shameerali.kolothum.thodi@huawei.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgbWVhbnQgdG8gYWRkcmVzcyBEb20wIGJvb3QgZmFpbHVy
ZSB3aGVuIHJ1bm5pbmcgb24gR0lDdjQKcGxhdGZvcm1zIGFzIHdlbGwgYXMgd2hlbiB0aGUgbnVt
YmVyIG9mIHZDUFVzIGlzIG5vdCBlcXVhbCB0byB0aGUgbnVtYmVycyBvZgpwQ1BVcy4gVGhleSBz
aG91bGQgYmUgYmFja3BvcnRlZCB1cCBYZW4gNC44LgoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxsICgy
KToKICB4ZW4vYXJtOiB2Z2ljLXYzOiBEZWxheSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIGRv
bWFpbiBpbmZvcm1hdGlvbgogIHhlbi9hcm06IHZnaWMtdjM6IERvbid0IGNyZWF0ZSBlbXB0eSBy
ZS1kaXN0cmlidXRvciByZWdpb25zCgogeGVuL2FyY2gvYXJtL2dpYy12My5jICB8IDE0ICsrKysr
KysrKysrLS0tCiB4ZW4vYXJjaC9hcm0vdmdpYy12My5jIHwgNTAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
