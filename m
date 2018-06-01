From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 04/31] libxl_json: fix build with DEBUG_ANSWER
Date: Fri, 1 Jun 2018 15:36:53 +0100
Message-ID: <20180601143720.24637-5-anthony.perard@citrix.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rmms=it=citrix.com=prvs=6833cd46b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fOlBH-0007k5-1H
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 14:37:27 +0000
In-Reply-To: <20180601143720.24637-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfanNvbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2pzb24uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2pzb24uYwppbmRleCAwODIzYjhjZmQy
Li5kYzkzYTg4ZWYxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9qc29uLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfanNvbi5jCkBAIC01OSw4ICs1OSw4IEBAIHN0cnVjdCBsaWJ4bF9f
eWFqbF9jdHggewogICAgICAgICBjb25zdCB1bnNpZ25lZCBjaGFyICpidWYgPSBOVUxMOyBcCiAg
ICAgICAgIHNpemVfdCBsZW4gPSAwOyBcCiAgICAgICAgIHlhamxfZ2VuX2dldF9idWYoKHlhamxf
Y3R4KS0+ZywgJmJ1ZiwgJmxlbik7IFwKLSAgICAgICAgTElCWExfX0xPRyhsaWJ4bF9fZ2Nfb3du
ZXIoKHlhamxfY3R4KS0+Z2MpLCBMSUJYTF9fTE9HX0RFQlVHLAotCQkgICAicmVzcG9uc2U6XG4i
LCBidWYpOyBcCisgICAgICAgIExJQlhMX19MT0cobGlieGxfX2djX293bmVyKCh5YWpsX2N0eCkt
PmdjKSwgWFRMX0RFQlVHLCBcCisJCSAgICJyZXNwb25zZTogJXNcbiIsIGJ1Zik7IFwKICAgICAg
ICAgeWFqbF9nZW5fZnJlZSgoeWFqbF9jdHgpLT5nKTsgXAogICAgICAgICAoeWFqbF9jdHgpLT5n
ID0gTlVMTDsgXAogICAgIH0gd2hpbGUgKDApCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
