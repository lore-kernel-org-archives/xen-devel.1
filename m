From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: don't "add" IOMMUs
Date: Mon, 03 Jun 2019 10:00:51 -0600
Message-ID: <5CF544330200007800234BAB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXpOO-0001kS-DW
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:01:00 +0000
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
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgYW1kX2lvbW11X2FkZF9kZXZpY2UoKSB3b24ndCBiZSBjYWxsZWQgZm9yIElPTU1VcyBm
cm9tCnBjaV9hZGRfZGV2aWNlKCksIGFzIElPTU1VcyBoYXZlIGdvdCBtYXJrZWQgci9vLApfc2V0
dXBfaHdkb21fcGNpX2RldmljZXMoKSBjYWxscyB0aGVyZSBuZXZlcnRoZWxlc3MuIEF2b2lkIGlz
c3VpbmcgdGhlCmJvZ3VzIGRlYnVnZ2luZyBvbmx5ICJObyBpb21tdSBmb3IgLi4uOyBjYW5ub3Qg
YmUgaGFuZGVkIHRvIC4uLiIgbG9nCm1lc3NhZ2UgYXMgd2VsbCBhcyB0aGUgbm9uLWRlYnVnZ2lu
ZyAic2V0dXAgLi4uIGZvciAuLi4gZmFpbGVkICgtMTkpIgpvbmUuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9wY2lfYW1kX2lvbW11LmMKQEAgLTQyNCw2ICs0MjQsMTEgQEAgc3RhdGljIGludCBhbWRfaW9t
bXVfYWRkX2RldmljZSh1OCBkZXZmbgogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAgIGJk
ZiA9IFBDSV9CREYyKHBkZXYtPmJ1cywgcGRldi0+ZGV2Zm4pOworCisgICAgZm9yX2VhY2hfYW1k
X2lvbW11KGlvbW11KQorICAgICAgICBpZiAoIHBkZXYtPnNlZyA9PSBpb21tdS0+c2VnICYmIGJk
ZiA9PSBpb21tdS0+YmRmICkKKyAgICAgICAgICAgIHJldHVybiAwOworCiAgICAgaW9tbXUgPSBm
aW5kX2lvbW11X2Zvcl9kZXZpY2UocGRldi0+c2VnLCBiZGYpOwogICAgIGlmICggdW5saWtlbHko
IWlvbW11KSApCiAgICAgewoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
