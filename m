From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/2] smoke tests: Fix job reuse globs in
	cr-daily-branch
Date: Thu, 14 Dec 2017 16:38:52 +0000
Message-ID: <1513269532-3341-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1513269532-3341-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dmf7=dk=citrix.com=prvs=514febeb1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ePWXR-0001Wl-Lm
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 16:39:13 +0000
In-Reply-To: <1513269532-3341-1-git-send-email-ian.jackson@eu.citrix.com>
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

QSBzeW1wdG9tIHRoYXQgdGhlIG9sZCBwYXR0ZXJucyBsYWNrICFidWlsZC1hcm02NC14c20sIHNv
IHRoZSB4c20gam9iCm1pZ2h0IGJlIHJldXNlZC4gIFRoZSBvdmVyYWxsIGNhdXNlIGlzIHRoYXQg
aXQgY29udGFpbmVkIGEgKHBhcnRpYWwpCmxpc3Qgb2YgYXJjaGl0ZWN0dXJlcy4KCkluc3RlYWQs
IHdlIG9ic2VydmUgdGhhdDoKICogVGhlIHRoaW5ncyB3ZSB3YW50IHRvIGF2b2lkIHJldXNpbmcg
YXJlIFhlbiBhbmQgbGlidmlydCAod2hpY2gKICAgYnVpbGRzIGFnYWluc3QgWGVuLgogKiBOb24t
WGVuIGJ1aWxkcyBhcmUgaW52YXJpYWJseSBidWlsZC08YXJjaD4tPHRoaW5nPiAob3IgZXZlbiBs
b25nZXIpCiAgIHNvIHdlIGNhbiBtYXRjaCB0aGVtIGFsbCB3aXRoIGJ1aWxkLSotKi4KICogV2Ug
bmVlZCB0byBleGNsdWRlIHRoZSBYZW4gYnVpbGRzIGFuZCB0aGUgbGlidmlydCBidWlsZHMuICBU
aGUKICAgbGlidmlydCBidWlsZHMgYXJlIG9idmlvdXMuICBUaGUgWGVuIGJ1aWxkcyBhcmUgZWl0
aGVyIGJ1aWxkLTxhcmNoPgogICB3aGljaCBkb2VzIG5vdCBtYXRjaCBidWlsZC0qLSosIG9yIGJ1
aWxkLTxhcmNoPi14c20uCgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9y
Zz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogY3It
ZGFpbHktYnJhbmNoIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY3ItZGFpbHktYnJhbmNoIGIvY3ItZGFpbHktYnJhbmNo
CmluZGV4IGQwNWQ5NTMuLjE0ZTg1OTUgMTAwNzU1Ci0tLSBhL2NyLWRhaWx5LWJyYW5jaAorKysg
Yi9jci1kYWlseS1icmFuY2gKQEAgLTM0Myw3ICszNDMsNyBAQCB4ZW4tdW5zdGFibGUtc21va2Up
CiAJOiAke1NNT0tFX0hBUk5FU1NfUkVWOj0kaGFybmVzc19yZXZ9CiAKIAkuL21nLWFkanVzdC1m
bGlnaHQtbWFrZXhyZWZzIC12ICRmbGlnaHQgXAotCQknIWJ1aWxkLWFtZDY0ICFidWlsZC1hbWQ2
NC1saWJ2aXJ0ICFidWlsZC1hcm1oZiBidWlsZC0qJyBcCisJCSchYnVpbGQtKi14c20gIWJ1aWxk
LSotbGlidmlydCBidWlsZC0qLSonIFwKIAkJLS1kZWJ1ZyAtLWJsZXNzaW5ncz1yZWFsCQkJCVwK
IAkJLS1icmFuY2g9eGVuLXVuc3RhYmxlLHhlbi11bnN0YWJsZS1zbW9rZSxvc3N0ZXN0CVwKIAkJ
LS1yZXZpc2lvbi1vc3N0ZXN0PSRTTU9LRV9IQVJORVNTX1JFVgotLSAKMi4xLjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
