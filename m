From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v1.1 for-4.11 3/3] vpci/msi: fix size of the
 vectors fields
Date: Mon, 26 Mar 2018 12:28:26 +0100
Message-ID: <20180326112826.80443-4-roger.pau@citrix.com>
References: <20180326112826.80443-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QJC-0006kL-Uj
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:29:02 +0000
In-Reply-To: <20180326112826.80443-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGN1cnJlbnQgc2l6ZSAoNWJpdHMpIGlzIG5vdCBlbm91Z2ggdG8gc3RvcmUgdGhlIG1heGlt
dW0gbnVtYmVyIG9mCnZlY3RvcnMgKDMyKSwgYnVtcCBpdCBieSBvbmUgYml0LgoKTm90ZSB0aGF0
IHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3QgaXMgc3RpbGwgdGhlIHNhbWUuCgpSZXBvcnRlZC1ieTog
Q292ZXJpdHkKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Q2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRp
bUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vdnBjaS5oIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94
ZW4vaW5jbHVkZS94ZW4vdnBjaS5oCmluZGV4IGNiMzllMGViZWEuLmZhYzEyYTFjNDIgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3ZwY2ku
aApAQCAtMTAwLDcgKzEwMCw3IEBAIHN0cnVjdCB2cGNpIHsKICAgICAgICAgLyogRGF0YS4gKi8K
ICAgICAgICAgdWludDE2X3QgZGF0YTsKICAgICAgICAgLyogTWF4aW11bSBudW1iZXIgb2YgdmVj
dG9ycyBzdXBwb3J0ZWQgYnkgdGhlIGRldmljZS4gKi8KLSAgICAgICAgdWludDhfdCBtYXhfdmVj
dG9ycyA6IDU7CisgICAgICAgIHVpbnQ4X3QgbWF4X3ZlY3RvcnMgOiA2OwogICAgICAgICAvKiBF
bmFibGVkPyAqLwogICAgICAgICBib29sIGVuYWJsZWQgICAgICAgIDogMTsKICAgICAgICAgLyog
U3VwcG9ydHMgcGVyLXZlY3RvciBtYXNraW5nPyAqLwpAQCAtMTA4LDcgKzEwOCw3IEBAIHN0cnVj
dCB2cGNpIHsKICAgICAgICAgLyogNjQtYml0IGFkZHJlc3MgY2FwYWJsZT8gKi8KICAgICAgICAg
Ym9vbCBhZGRyZXNzNjQgICAgICA6IDE7CiAgICAgICAgIC8qIE51bWJlciBvZiB2ZWN0b3JzIGNv
bmZpZ3VyZWQuICovCi0gICAgICAgIHVpbnQ4X3QgdmVjdG9ycyAgICAgOiA1OworICAgICAgICB1
aW50OF90IHZlY3RvcnMgICAgIDogNjsKICAgICAgICAgLyogQXJjaC1zcGVjaWZpYyBkYXRhLiAq
LwogICAgICAgICBzdHJ1Y3QgdnBjaV9hcmNoX21zaSBhcmNoOwogICAgIH0gKm1zaTsKLS0gCjIu
MTYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
