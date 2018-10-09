From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/6] x86/pvh: fix TSC mode setup for PVH Dom0
Date: Tue, 9 Oct 2018 11:42:31 +0200
Message-ID: <20181009094236.51522-2-roger.pau@citrix.com>
References: <20181009094236.51522-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=av44=mv=citrix.com=prvs=81391bf32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g9oXm-00062D-2A
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 09:43:10 +0000
In-Reply-To: <20181009094236.51522-1-roger.pau@citrix.com>
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
cGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3RpbWUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IDU1MzY5OGQ0
YWIuLjAzZjc5MmU3ZTUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVu
L2FyY2gveDg2L3RpbWUuYwpAQCAtMjEyNSw3ICsyMTI1LDcgQEAgdm9pZCB0c2Nfc2V0X2luZm8o
c3RydWN0IGRvbWFpbiAqZCwKIHsKICAgICBBU1NFUlQoIWlzX3N5c3RlbV9kb21haW4oZCkpOwog
Ci0gICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQorICAgIGlmICggaXNfcHZfZG9tYWlu
KGQpICYmIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApCiAgICAgewogICAgICAgICBkLT5hcmNoLnZ0
c2MgPSAwOwogICAgICAgICByZXR1cm47Ci0tIAoyLjE5LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
