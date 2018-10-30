From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 1/7] x86/pvh: fix TSC mode setup for PVH Dom0
Date: Tue, 30 Oct 2018 16:41:17 +0100
Message-ID: <20181030154123.4218-2-roger.pau@citrix.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlru=nk=citrix.com=prvs=8342f37c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHW9H-0005JO-JX
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 15:41:43 +0000
In-Reply-To: <20181030154123.4218-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBQVkggRG9tMCBtaWdodCB1c2UgVFNDIHNjYWxpbmcgb3Igb3RoZXIgSFZNIHNwZWNpZmljIFRT
QwphZGp1c3RtZW50cywgc28gb25seSBzaG9ydC1jaXJjdWl0IHRoZSBUU0Mgc2V0dXAgZm9yIGEg
Y2xhc3NpYyBQVgpEb20wLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3RpbWUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90
aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IDU1MzY5OGQ0YWIuLjAzZjc5MmU3ZTUg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUu
YwpAQCAtMjEyNSw3ICsyMTI1LDcgQEAgdm9pZCB0c2Nfc2V0X2luZm8oc3RydWN0IGRvbWFpbiAq
ZCwKIHsKICAgICBBU1NFUlQoIWlzX3N5c3RlbV9kb21haW4oZCkpOwogCi0gICAgaWYgKCBpc19o
YXJkd2FyZV9kb21haW4oZCkgKQorICAgIGlmICggaXNfcHZfZG9tYWluKGQpICYmIGlzX2hhcmR3
YXJlX2RvbWFpbihkKSApCiAgICAgewogICAgICAgICBkLT5hcmNoLnZ0c2MgPSAwOwogICAgICAg
ICByZXR1cm47Ci0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
