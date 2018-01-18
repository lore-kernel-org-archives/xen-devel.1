From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 0/7] xen/pvshim: fixes for staging
Date: Thu, 18 Jan 2018 11:02:45 +0000
Message-ID: <20180118110252.41504-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lqax=en=citrix.com=prvs=549fb6881=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ec7z9-0005nK-UN
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:03:55 +0000
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIHNvbWUgY29kZSBhbmQgc3R5bGUg
Zml4ZXMgZm9yIHRoZSBwdnNoaW0KKGNvbWV0KSBjb2RlIHRoYXQgaGFzIGJlZW4gbWVyZ2VkIGlu
dG8gc3RhZ2luZy4gSU1ITyBwYXRjaGVzIDEtMyBzaG91bGQKYmUgYmFja3BvcnRlZCB0byB0aGUg
c3RhYmxlIGNvbWV0IGJyYW5jaC4KCkEgYnJhbmNoIHdpdGggdGhlIHNlcmllcyBpcyBhbHNvIGF2
YWlsYWJsZSBhdDoKCmdpdDovL3hlbmJpdHMueGVuLm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQg
cHZzaGltX2ZpeGVzX3YzCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICg3KToKICB4
ZW4vcHZzaGltOiBtYXAgdmNwdV9pbmZvIGVhcmxpZXIgZm9yIEFQcwogIHhlbi9wdmg6IHBsYWNl
IHRoZSB0cmFtcG9saW5lIHN0YXJ0aW5nIGF0IE1GTiAxCiAgeGVuL3B2c2hpbTogaWRlbnRpdHkg
cGluIHNoaW0gdkNQVXMgdG8gcENQVXMKICB4ZW4vcHZzaGltOiByZS1vcmRlciByZXBsYWNlX3Zh
X21hcHBpbmcgY29kZQogIHhlbi9wdnNoaW06IGZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzCiAgZmly
bXdhcmUvc2hpbTogZml4IGJ1aWxkIHByb2Nlc3MgdG8gdXNlIFBPU0lYIGZpbmQgb3B0aW9ucwog
IHhlbi9wdnNoaW06IHN3aXRjaCBzaGltLmMgdG8gdXNlIHR5cGVzYWZlIG1mbl90b19wYWdlIGFu
ZCB2aXJ0X3RvX21mbgoKIHRvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgfCAgMyArLQog
eGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgICB8ICAzICsrCiB4ZW4vYXJjaC94ODYvZG9t
MF9idWlsZC5jICAgICAgIHwgIDUgKystLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAg
ICB8ICA5ICsrKystLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICB8IDYzICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9v
dC5jICAgICAgICAgIHwgIDYgKystLQogNiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
LCA0MiBkZWxldGlvbnMoLSkKCi0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
