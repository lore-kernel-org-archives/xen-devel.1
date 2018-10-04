From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 10/17] x86: provide stub for switch_compat
Date: Thu, 4 Oct 2018 16:43:29 +0100
Message-ID: <7ef6c604e1e5e528f017e7bde6c62c2ba57b5e2e.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g861M-0007Js-5L
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:58:36 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

RENFIGNvdWxkbid0IGhhdmUgaGVscGVkIGhlcmUgYmVjYXVzZSB0aGUgaW52b2NhdGlvbiBvZiBz
d2l0Y2hfY29tcGF0CmFsc28gZGVwZW5kcyBvbiBleHRlcm5hbCBpbnB1dC4KClNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2luY2x1ZGUveGVuL2Nv
bXBhdC5oIHwgIDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2NvbXBhdC5oIGIveGVuL2luY2x1ZGUveGVuL2Nv
bXBhdC5oCmluZGV4IDg5NWUyZmYuLjZmNzIzNTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9jb21wYXQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY29tcGF0LmgKQEAgLTIyOCw3ICsyMjgs
MTYgQEAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbzsKIHZvaWQgeGxhdF92Y3B1X3J1bnN0YXRl
X2luZm8oc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqKTsKIAogc3RydWN0IGRvbWFpbjsKKwor
I2lmZGVmIENPTkZJR19QVgogaW50IHN3aXRjaF9jb21wYXQoc3RydWN0IGRvbWFpbiAqKTsKKyNl
bHNlCisjIGluY2x1ZGUgPHhlbi9lcnJuby5oPgorc3RhdGljIGlubGluZSBpbnQgc3dpdGNoX2Nv
bXBhdChzdHJ1Y3QgZG9tYWluICpkKQoreworICAgIHJldHVybiAtRUlOVkFMOworfQorI2VuZGlm
CiAKICNlbHNlCiAKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
