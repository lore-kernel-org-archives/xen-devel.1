From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v9 5/7] common/memory: block speculative
 out-of-bound accesses
Date: Wed, 27 Feb 2019 17:13:38 +0100
Message-ID: <1551284020-7050-6-git-send-email-nmanthey@amazon.de>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=70d2=RC=amazon.de=prvs=954cd6bf9=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gz1sw-0006ER-0i
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 16:16:42 +0000
In-Reply-To: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

VGhlIGdldF9wYWdlX2Zyb21fZ2ZuIG1ldGhvZCByZXR1cm5zIGEgcG9pbnRlciB0byBhIHBhZ2Ug
dGhhdCBiZWxvbmdzCnRvIGEgZ2ZuLiBCZWZvcmUgcmV0dXJuaW5nIHRoZSBwb2ludGVyLCB0aGUg
Z2ZuIGlzIGNoZWNrZWQgZm9yIGJlaW5nCnZhbGlkLiBVbmRlciBzcGVjdWxhdGlvbiwgdGhlc2Ug
Y2hlY2tzIGNhbiBiZSBieXBhc3NlZCwgc28gdGhhdAp0aGUgZnVuY3Rpb24gZ2V0X3BhZ2UgaXMg
c3RpbGwgZXhlY3V0ZWQgcGFydGlhbGx5LiBDb25zZXF1ZW50bHksIHRoZQpmdW5jdGlvbiBwYWdl
X2dldF9vd25lcl9hbmRfcmVmZXJlbmNlIG1pZ2h0IGJlIGV4ZWN1dGVkIHBhcnRpYWxseSBhcwp3
ZWxsLiBJbiB0aGlzIGZ1bmN0aW9uLCB0aGUgY29tcHV0ZWQgcG9pbnRlciBpcyBhY2Nlc3NlZCwg
cmVzdWx0aW5nIGluCmEgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFkZHJlc3MgbG9hZC4gQXMg
dGhlIGdmbiBjYW4gYmUgY29udHJvbGxlZCBieQphIGd1ZXN0LCB0aGlzIGFjY2VzcyBpcyBwcm9i
bGVtYXRpYy4KClRvIG1pdGlnYXRlIHRoZSByb290IGNhdXNlLCBhbiBsZmVuY2UgaW5zdHJ1Y3Rp
b24gaXMgYWRkZWQgdmlhIHRoZQpldmFsdWF0ZV9ub3NwZWMgbWFjcm8uIFRvIG1ha2UgdGhlIHBy
b3RlY3Rpb24gZ2VuZXJpYywgd2UgZG8gbm90CmludHJvZHVjZSB0aGUgbGZlbmNlIGluc3RydWN0
aW9uIGZvciB0aGlzIHNpbmdsZSBjaGVjaywgYnV0IGFkZCBpdCB0bwp0aGUgbWZuX3ZhbGlkIGZ1
bmN0aW9uLiBUaGlzIHdheSwgb3RoZXIgcG90ZW50aWFsbHkgcHJvYmxlbWF0aWMgYWNjZXNzZXMK
YXJlIHByb3RlY3RlZCBhcyB3ZWxsLgoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBo
YXJkZW5pbmcgZWZmb3J0LgoKU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhl
eUBhbWF6b24uZGU+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgot
LS0KIHhlbi9jb21tb24vcGR4LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BkeC5jIGIv
eGVuL2NvbW1vbi9wZHguYwotLS0gYS94ZW4vY29tbW9uL3BkeC5jCisrKyBiL3hlbi9jb21tb24v
cGR4LmMKQEAgLTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlIDx4ZW4vaW5pdC5oPgogI2luY2x1ZGUg
PHhlbi9tbS5oPgogI2luY2x1ZGUgPHhlbi9iaXRvcHMuaD4KKyNpbmNsdWRlIDx4ZW4vbm9zcGVj
Lmg+CiAKIC8qIFBhcmFtZXRlcnMgZm9yIFBGTi9NQUREUiBjb21wcmVzc2lvbi4gKi8KIHVuc2ln
bmVkIGxvbmcgX19yZWFkX21vc3RseSBtYXhfcGR4OwpAQCAtMzMsOCArMzQsOSBAQCB1bnNpZ25l
ZCBsb25nIF9fcmVhZF9tb3N0bHkgcGR4X2dyb3VwX3ZhbGlkW0JJVFNfVE9fTE9OR1MoCiAKIGJv
b2wgX19tZm5fdmFsaWQodW5zaWduZWQgbG9uZyBtZm4pCiB7Ci0gICAgcmV0dXJuIGxpa2VseSht
Zm4gPCBtYXhfcGFnZSkgJiYKLSAgICAgICAgICAgbGlrZWx5KCEobWZuICYgcGZuX2hvbGVfbWFz
aykpICYmCisgICAgaWYgKCB1bmxpa2VseShldmFsdWF0ZV9ub3NwZWMobWZuID49IG1heF9wYWdl
KSkgKQorICAgICAgICByZXR1cm4gZmFsc2U7CisgICAgcmV0dXJuIGxpa2VseSghKG1mbiAmIHBm
bl9ob2xlX21hc2spKSAmJgogICAgICAgICAgICBsaWtlbHkodGVzdF9iaXQocGZuX3RvX3BkeCht
Zm4pIC8gUERYX0dST1VQX0NPVU5ULAogICAgICAgICAgICAgICAgICAgICAgICAgICAgcGR4X2dy
b3VwX3ZhbGlkKSk7CiB9Ci0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVy
OiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBC
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
