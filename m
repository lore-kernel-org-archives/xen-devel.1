From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/6] xen/pvshim: fix for staging
Date: Wed, 17 Jan 2018 09:48:08 +0000
Message-ID: <20180117094814.32772-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ebkKq-0004Nd-Kx
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 09:48:44 +0000
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
cHZzaGltX2ZpeGVzX3YxCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICg2KToKICB4
ZW4vcHZzaGltOiBtYXAgdmNwdV9pbmZvIGVhcmxpZXIgZm9yIEFQcwogIHhlbi9wdmg6IHBsYWNl
IHRoZSB0cmFtcG9saW5lIGF0IHBhZ2UgMHgxCiAgeGVuL3B2c2hpbTogaWRlbnRpdHkgcGluIHNo
aW0gdkNQVXMgdG8gcENQVXMKICB4ZW4vcHZzaGltOiBzaW1wbGlmeSByZXBsYWNlX3ZhX21hcHBp
bmcgY29kZQogIHhlbi9wdnNoaW06IGZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzCiAgZmlybXdhcmUv
c2hpbTogZml4IGJ1aWxkIHByb2Nlc3MgdG8gdXNlIFBPU0lYIGZpbmQgb3B0aW9ucwoKIHRvb2xz
L2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgfCAgMyArKy0KIHhlbi9hcmNoL3g4Ni9ib290L2hl
YWQuUyAgICAgICAgfCAgMyArKysKIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgfCAg
NSArKy0tLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICB8ICA4ICsrKysrKy0tCiB4
ZW4vYXJjaC94ODYvcHYvc2hpbS5jICAgICAgICAgIHwgMzkgKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAgICAgIHwgIDYg
KysrLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygt
KQoKLS0gCjIuMTUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
