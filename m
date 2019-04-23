From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/3] sg-run-job,
 ts-host-install: New --build option
Date: Tue, 23 Apr 2019 13:11:38 +0100
Message-ID: <20190423121139.25996-3-ian.jackson@eu.citrix.com>
References: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIuHA-0006O5-KX
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 12:11:52 +0000
In-Reply-To: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VXNlZCB0byBzcGVjaWZ5IHRoYXQgdGhlIGhvc3Qgd2lsbCBiZSB1c2VkIGZvciBidWlsZGluZy4g
IEN1cnJlbnRseQpoYXMgbm8gZWZmZWN0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcnVuLWpvYiAgICAgIHwgMiArLQogdHMt
aG9zdC1pbnN0YWxsIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NnLXJ1bi1qb2IgYi9zZy1ydW4tam9iCmluZGV4IDU2
YjYzODRhLi43YzU4ZDRiYSAxMDA3NTUKLS0tIGEvc2ctcnVuLWpvYgorKysgYi9zZy1ydW4tam9i
CkBAIC03MzQsNyArNzM0LDcgQEAgcHJvYyBhbGxvY2F0ZS1idWlsZC1ob3N0IHtvc3R5cGV9IHsK
IH0KIHByb2MgcHJlcGFyZS1idWlsZC1ob3N0LWxpbnV4IHt9IHsKICAgICBnbG9iYWwgam9iaW5m
bwotICAgIHJ1bi10cyBicm9rZW4gaG9zdC1pbnN0YWxsKCopIHRzLWhvc3QtaW5zdGFsbC10d2lj
ZQorICAgIHJ1bi10cyBicm9rZW4gaG9zdC1pbnN0YWxsKCopIHRzLWhvc3QtaW5zdGFsbC10d2lj
ZSArIC0tYnVpbGQKICAgICBydW4tdHMgLiBob3N0LWJ1aWxkLXByZXAgdHMteGVuLWJ1aWxkLXBy
ZXAKIH0KIApkaWZmIC0tZ2l0IGEvdHMtaG9zdC1pbnN0YWxsIGIvdHMtaG9zdC1pbnN0YWxsCmlu
ZGV4IDQyMTNjM2EyLi43MDk0NTU5ZiAxMDA3NTUKLS0tIGEvdHMtaG9zdC1pbnN0YWxsCisrKyBi
L3RzLWhvc3QtaW5zdGFsbApAQCAtNDEsNiArNDEsNyBAQCB3aGlsZSAoQEFSR1YgYW5kICRBUkdW
WzBdID1+IG0vXi0vKSB7CiAJJHBvd2Vyb25fdGVzdF9vbmx5PSAxOwogICAgIH0gZWxzaWYgICht
L14tLXJlc2N1ZSQvKSB7CiAJJHhvcHRze1Jlc2N1ZU1vZGV9PSAxOworICAgIH0gZWxzaWYgICht
L14tLWJ1aWxkJC8pIHsKICAgICB9IGVsc2UgewogCWRpZSAiJF8gJCEiOwogICAgIH0KLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
