From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] SUPPORT.md: add Domain 0 section
Date: Fri, 23 Mar 2018 10:27:18 +0000
Message-ID: <20180323102718.72049-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8ehz=gn=citrix.com=prvs=6134115c4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ezJv1-00073k-D9
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 10:27:31 +0000
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

U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3Jn
PgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBTVVBQT1JULm1kIHwgMjQg
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kCmluZGV4IGRkY2RmYWI1YWQu
LmZiMDE1MWFhN2IgMTAwNjQ0Ci0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAt
OTYsNiArOTYsMzAgQEAgUmVxdWlyZXMgaGFyZHdhcmUgdmlydHVhbGlzYXRpb24gc3VwcG9ydCAo
SW50ZWwgVk1YIC8gQU1EIFNWTSkKIAogQVJNIG9ubHkgaGFzIG9uZSBndWVzdCB0eXBlIGF0IHRo
ZSBtb21lbnQKIAorIyMgRG9tYWluIDAgVHlwZQorCisjIyMgeDg2L1BWIERvbTAKKworICAgIFN0
YXR1czogU3VwcG9ydGVkCisKK1RyYWRpdGlvbmFsIFhlbiBQViBEb21haW4gMAorCitObyBoYXJk
d2FyZSByZXF1aXJlbWVudHMKKworIyMjIHg4Ni9QVkggRG9tMAorCisgICAgU3RhdHVzOiBFeHBl
cmltZW50YWwKKworUFZIIGJhc2VkIERvbWFpbiAwCisKK1JlcXVpcmVzIENQVSBoYXJkd2FyZSB2
aXJ0dWFsaXphdGlvbiBleHRlbnNpb25zIGFuZCBhbiBJT01NVS4KKworIyMjIEFSTSBEb20wCisK
KyAgICBTdGF0dXM6IFN1cHBvcnRlZAorCitBUk0gb25seSBoYXMgb25lIERvbWFpbiAwIHR5cGUg
YXQgdGhlIG1vbWVudAorCiAjIyBUb29sc3RhY2sKIAogIyMjIHhsCi0tIAoyLjE2LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
