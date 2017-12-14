From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/2] smoke tests: Build arm64 with XSM,
	instead of without
Date: Thu, 14 Dec 2017 16:38:51 +0000
Message-ID: <1513269532-3341-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWXM-0001WU-Gi
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:39:08 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@linaro.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIHNtb2tlIGZsaWdodCBjb250YWlucyB0ZXN0LWFybTY0LWFybTY0LXhsLXhzbSBzbyBpdCBz
aG91bGQgY29udGFpbgpidWlsZC1hcm02NC14c20gKGFuZCBub3QgY29udGFpbiBidWlsZC1hcm02
NCkuCgpJIGhhdmUgY2hlY2tlZCB0aGUgcmVzdWx0cyB3aXRoCiAgT1NTVEVTVF9DT05GSUc9c3Rh
bmRhbG9uZS1jb25maWctZXhhbXBsZSBlYXRteWRhdGEgLi9zdGFuZGFsb25lLWdlbmVyYXRlLWR1
bXAtZmxpZ2h0LXJ1bnZhcnMKYW5kIGxvb2tpbmcgYXQgdGhlIGRpZmYgc2hvd3MgcHJlY2lzZWx5
IHRoZSBleHBlY3RlZCBjaGFuZ2UuCgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGlu
YXJvLm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogbWFrZS1mbGlnaHQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tYWtlLWZsaWdodCBiL21ha2UtZmxpZ2h0CmluZGV4
IDQ4ZmJjMDEuLjdkODA3ZjkgMTAwNzU1Ci0tLSBhL21ha2UtZmxpZ2h0CisrKyBiL21ha2UtZmxp
Z2h0CkBAIC03Miw3ICs3Miw3IEBAIGpvYl9jcmVhdGVfYnVpbGRfZmlsdGVyX2NhbGxiYWNrICgp
IHsKICAgICAgICAgYnVpbGQtYW1kNjQtbGlidmlydCkJOzsKICAgICAgICAgYnVpbGQtYXJtaGYp
CQk7OwogICAgICAgICBidWlsZC1hcm1oZi1wdm9wcykJOzsKLSAgICAgICAgYnVpbGQtYXJtNjQp
CQk7OworICAgICAgICBidWlsZC1hcm02NC14c20pCTs7CiAgICAgICAgIGJ1aWxkLWFybTY0LXB2
b3BzKQk7OwogICAgICAgICAqKQkJCXJldHVybiAxIDs7CiAgICAgICBlc2FjCi0tIAoyLjEuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
