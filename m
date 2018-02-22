From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] grant: Release domain lock on 'map' path in
	cache_flush
Date: Thu, 22 Feb 2018 17:08:05 +0000
Message-ID: <20180222170805.24372-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gqm/=fq=citrix.com=prvs=58400226e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eouLx-0003Hp-Az
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 17:08:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Y29tbW9uL2dyYW50X3RhYmxlLmM6Y2FjaGVfZmx1c2goKSBncmFicyB0aGUgcmN1IGxvY2sgZm9y
IHRoZSBjdXJyZW50CmRvbWFpbiwgYnV0IG9ubHkgcmVsZWFzZXMgaXQgb24gZXJyb3IgcGF0aHMu
CgpOb3RlIHRoYXQgdGhpcyBpcyBub3QgYSBzZWN1cml0eSBpc3N1ZSwgYXMgdGhlIHByZWVtcHQg
Y291bnQgaXMgdXNlZApleGNsdXNpdmVseSBmb3IgYXNzZXJ0aW9ucyBhdCB0aGUgbW9tZW50LgoK
U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KQ0M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkND
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVu
Lm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6
IEtvbnJhZCBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgotLS0KIHhlbi9jb21tb24vZ3Jh
bnRfdGFibGUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
CmluZGV4IDQ4YzU0NzkzMGMuLjgzNDY5OTRkZTYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZ3Jh
bnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKQEAgLTMyNzMsNiArMzI3
Myw3IEBAIHN0YXRpYyBpbnQgY2FjaGVfZmx1c2goY29uc3QgZ250dGFiX2NhY2hlX2ZsdXNoX3Qg
KmNmbHVzaCwgZ3JhbnRfcmVmX3QgKmN1cl9yZWYpCiAKICAgICB1bm1hcF9kb21haW5fcGFnZSh2
KTsKICAgICBwdXRfcGFnZShwYWdlKTsKKyAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsKIAogICAg
IHJldHVybiByZXQ7CiB9Ci0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
