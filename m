From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH 1/1] xen/gnttab: print log at level XENLOG_ERR
 before panic
Date: Mon, 22 Apr 2019 20:39:59 +0800
Message-ID: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NvB3=SY=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1hIYBR-0001Rf-Ce
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 12:36:29 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

UHJpbnQgbG9nIGF0IGxldmVsIFhFTkxPR19FUlIgKGluc3RlYWQgWEVOTE9HX0lORk8pIGFzIGRv
bWFpbl9jcmFzaCgpCmluZGljYXRlcyB0aGVyZSBpcyBmYXRhbCBlcnJvci4KClNpZ25lZC1vZmYt
Ynk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jCmluZGV4IDgwNzI4ZWEuLjcyNWM2MTggMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
QEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFwX2NvbW1vbigKICAgICBpZiAoIHVubGlrZWx5KChy
ZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pKSA9PSBOVUxMKSApCiAgICAgewogICAgICAg
ICAvKiBUaGlzIGNhbiBoYXBwZW4gd2hlbiBhIGdyYW50IGlzIGltcGxpY2l0bHkgdW5tYXBwZWQu
ICovCi0gICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiQ291bGQgbm90IGZpbmQgZG9tYWlu
ICVkXG4iLCBkb20pOworICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiQ291bGQgbm90IGZp
bmQgZG9tYWluICVkXG4iLCBkb20pOwogICAgICAgICBkb21haW5fY3Jhc2gobGQpOyAvKiBuYXVn
aHR5Li4uICovCiAgICAgICAgIHJldHVybjsKICAgICB9Ci0tIAoyLjcuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
