From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] x86/dom0: improve PVH paging memory
 calculation
Date: Wed, 5 Dec 2018 13:06:27 +0100
Message-ID: <20181205120629.96767-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mify=oo=citrix.com=prvs=870913e8c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gUVwv-0007A0-Mz
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 12:06:41 +0000
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

SGVsbG8sCgpUaGVyZSBoYXZlIGJlZW4gc2V2ZXJhbCByZXBvcnRzIG9mIFBWSCBEb20wIGJ1aWxk
ZXIgcnVubmluZyBvdXQgb2YKbWVtb3J5IGR1ZSB0byBiYWQgcGFnaW5nIG1lbW9yeSBhcHByb3hp
bWF0aW9uIGRvbmUgaW4KZG9tMF9jb21wdXRlX25yX3BhZ2VzLiBUaGUgbW9zdCByZWNlbnQgcmVw
b3J0cyBpczoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOC0xMS9tc2cwMzEwMy5odG1sCgpUaGlzIHNlcmllcyBhdHRlbXB0cyB0byBpbXBy
b3ZlIHRoZSBzaXR1YXRpb24gYnkgaW50cm9kdWNpbmcgYSBuZXcKZnVuY3Rpb24gdG8gYXBwcm94
aW1hdGUgdGhlIG1lbW9yeSB1c2FnZSBvZiBIQVAgYW5kIElPTU1VIHBhZ2UgdGFibGVzLgpJdCBh
bHNvIHRha2VzIGludG8gYWNjb3VudCB3aGV0aGVyIHRoZSBJT01NVSBwYWdlIHRhYmxlcyBhcmUg
c2hhcmVkIHdpdGgKSEFQIG9yIG5vdCB3aGVuIGNhbGN1bGF0aW5nIHRoZSBhbW91bnQgb2YgYXZh
aWxhYmxlIG1lbW9yeS4KCkl0IGNhbiBiZSBmb3VuZCBvbiB0aGUgZm9sbG93aW5nIGdpdCByZXBv
OgoKZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdpdCBkb20wLXBhZ2lu
Zy12MQoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoMik6CiAgeDg2L2RvbTA6IHJl
bmFtZSBwYWdpbmcgZnVuY3Rpb24KICB4ODYvZG9tMDogaW1wcm92ZSBwYWdpbmcgbWVtb3J5IHVz
YWdlIGNhbGN1bGF0aW9ucwoKIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgIHwgMjcg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQu
YyAgICB8ICA2ICsrKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb20wX2J1aWxkLmggfCAgNCAr
KystCiAzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgot
LSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
