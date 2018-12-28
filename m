From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] x86/dom0: minor fixes and improvements
 to PVH builder
Date: Fri, 28 Dec 2018 12:18:55 +0100
Message-ID: <20181228111857.49444-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD/o=PF=citrix.com=prvs=893533f24=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcqAS-0001uy-I2
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 11:19:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBjb250YWlucyBhbiBpbXByb3ZlbWVudCB3aGVuIGZpbGxpbmcg
dGhlIHAybSBzbyB0aGF0CmFsaWdubWVudCBpcyB0YWtlbiBpbnRvIGFjY291bnQgd2hlbiBhbGxv
Y2F0aW5nIGFuZCBwb3B1bGF0aW5nIHRoZSBwMm0uCgpUaGUgbGFzdCBwYXRjaCBpcyBvcHRpb25h
bCBhbmQgYWRkcyBhIHZlcmJvc2UgbW9kZSB0byBkb20wIGJ1aWxkIHNvIG1vcmUKaW5mb3JtYXRp
b24gY2FuIGJlIHByaW50ZWQuCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgyKToK
ICB4ODYvZG9tMDogdGFrZSBhbGlnbm1lbnQgaW50byBhY2NvdW50IHdoZW4gcG9wdWxhdGluZyBw
Mm0gaW4gUFZIIG1vZGUKICB4ODYvZG9tMDogYWRkIHZlcmJvc2UgbW9kZSBhbmQgcHJpbnQgbWVt
b3J5IGFsbG9jYXRpb24gc3RhdHMKCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93
biB8ICA4ICsrKy0KIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgICAgIHwgIDMgKysK
IHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jICAgICAgIHwgNjQgKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCAgICAgICAgIHwgIDEg
KwogNCBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
