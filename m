From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/e820: assume memmap provided when
 booted as a Xen guest is correct
Date: Thu, 27 Dec 2018 16:56:13 +0100
Message-ID: <20181227155614.42292-4-roger.pau@citrix.com>
References: <20181227155614.42292-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wa+V=PE=citrix.com=prvs=8928ed1c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcY1L-0006CP-3I
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 15:56:27 +0000
In-Reply-To: <20181227155614.42292-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@cirix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpbXBsaWVzIHRoZXJlJ3Mgbm8gbmVlZCB0byBmb3JjZWZ1bGx5IHJlc2VydmUgdGhlIFZH
QSBNTUlPCnJlZ2lvbiwgc2luY2UgdGhlIG1lbW9yeSBtYXAgcHJvdmlkZWQgd2lsbCBiZSBjb3Jy
ZWN0LgoKUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXJpeC5jb20+
Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2U4MjAuYyB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9lODIwLmMgYi94ZW4vYXJjaC94ODYvZTgyMC5jCmluZGV4IDdjNWI4NTExOGYu
LjVlNDZkNGVjNTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKKysrIGIveGVuL2Fy
Y2gveDg2L2U4MjAuYwpAQCAtNTM3LDExICs1MzcsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IG1h
Y2hpbmVfc3BlY2lmaWNfbWVtb3J5X3NldHVwKHN0cnVjdCBlODIwbWFwICpyYXcpCiAKICAgICBy
ZXNlcnZlX2RtaV9yZWdpb24oKTsKIAotICAgIC8qCi0gICAgICogU29tZSBCSU9TZXMgY2xhaW0g
UkFNIGluIHRoZSA2NDBrIC0gMU0gcmVnaW9uLgotICAgICAqIE5vdCByaWdodC4gRml4IGl0IHVw
LgotICAgICAqLwotICAgIHJlc2VydmVfdmdhX3JlZ2lvbigpOworICAgIGlmICggIXhlbl9ndWVz
dCApCisgICAgICAgIC8qCisgICAgICAgICAqIFNvbWUgQklPU2VzIGNsYWltIFJBTSBpbiB0aGUg
NjQwayAtIDFNIHJlZ2lvbi4KKyAgICAgICAgICogTm90IHJpZ2h0LiBGaXggaXQgdXAuCisgICAg
ICAgICAqLworICAgICAgICByZXNlcnZlX3ZnYV9yZWdpb24oKTsKIAogICAgIHRvcF9vZl9yYW0g
PSBtdHJyX3RvcF9vZl9yYW0oKTsKICAgICBpZiAoIHRvcF9vZl9yYW0gKQotLSAKMi4xNy4yIChB
cHBsZSBHaXQtMTEzKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
