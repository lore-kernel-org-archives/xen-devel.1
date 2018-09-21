From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v5 1/5] x86/mem_access: put
 p2m_{get/set}_suppress_ve under CONFIG_HVM
Date: Fri, 21 Sep 2018 16:54:48 +0100
Message-ID: <645582bae3826048a61ba2162c1539f580847f13.1537545258.git-series.wei.liu2@citrix.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3Nlp-0005QT-Aq
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 15:55:05 +0000
In-Reply-To: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSBhcmUgdXNlZCBieSBIVk0gY29kZSBvbmx5LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnY1OiBuZXcKLS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jCmluZGV4IDIyMTdiZGEuLjgyNmMzNWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9tZW1fYWNjZXNzLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwpAQCAt
NTAxLDYgKzUwMSw3IEBAIHZvaWQgYXJjaF9wMm1fc2V0X2FjY2Vzc19yZXF1aXJlZChzdHJ1Y3Qg
ZG9tYWluICpkLCBib29sIGFjY2Vzc19yZXF1aXJlZCkKICAgICB9CiB9CiAKKyNpZmRlZiBDT05G
SUdfSFZNCiAvKgogICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3MgYml0IGZvciBhIHBhZ2Uu
ICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguCiAgKi8KQEAgLTYwMCw2ICs2MDEsNyBAQCBpbnQgcDJt
X2dldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgKnN1cHBy
ZXNzX3ZlLAogCiAgICAgcmV0dXJuIDA7CiB9CisjZW5kaWYKIAogLyoKICAqIExvY2FsIHZhcmlh
YmxlczoKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
