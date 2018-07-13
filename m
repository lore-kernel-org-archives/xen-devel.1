From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 01/13] x86/msr: Drop stale comment for
 vcpu_msrs.spec_ctrl
Date: Fri, 13 Jul 2018 21:03:02 +0100
Message-ID: <1531512194-6865-2-git-send-email-andrew.cooper3@citrix.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TW9yZSB0aGFuIHRoZSBib3R0b20gdHdvIGJpdHMgYXJlIG5vdyBkZWZpbmVkLCBhbmQgdGhlIE1T
UiBwb2xpY3kgd29yayBoYXMKc2hvd24gdGhhdCB1c2luZyBub24tYXJjaGl0ZWN0dXJhbCByZXBy
ZXNlbnRhdGlvbnMgdHVybnMgb3V0IHRvIGJlIHByb2JsZW1hdGljCmZvciBtb3JlIHRoYW4ganVz
dCBhc20gY29kZS4gIEFzIHRoZSBhcmNoaXRlY3R1cmFsIHJlcHJlc2VudGF0aW9uIGlzIHRoZQpl
eHBlY3RlZCBkZWZhdWx0LCB3ZSBkb24ndCBuZWVkIHRvIGp1c3RpZnkgd2h5IHdlIGFyZSB1c2lu
ZyBpdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpDQzogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoK
TmV3IGluIHYyCi0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaCB8IDUgLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvbXNyLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21zci5oCmluZGV4IDNhMmM3OTkuLjliNGU0
ZTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9tc3IuaApAQCAtMjg3LDExICsyODcsNiBAQCBzdHJ1Y3QgdmNwdV9tc3JzCiB7
CiAgICAgLyogMHgwMDAwMDA0OCAtIE1TUl9TUEVDX0NUUkwgKi8KICAgICBzdHJ1Y3QgewotICAg
ICAgICAvKgotICAgICAgICAgKiBPbmx5IHRoZSBib3R0b20gdHdvIGJpdHMgYXJlIGRlZmluZWQs
IHNvIG5vIG5lZWQgdG8gd2FzdGUgc3BhY2UKLSAgICAgICAgICogd2l0aCB1aW50NjRfdCBhdCB0
aGUgbW9tZW50LCBidXQgdXNlIHVpbnQzMl90IGZvciB0aGUgY29udmVuaWVuY2UKLSAgICAgICAg
ICogb2YgdGhlIGFzc2VtYmx5IGNvZGUuCi0gICAgICAgICAqLwogICAgICAgICB1aW50MzJfdCBy
YXc7CiAgICAgfSBzcGVjX2N0cmw7CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
