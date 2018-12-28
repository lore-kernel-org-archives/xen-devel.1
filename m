From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/4] x86/shim: minor fixes to the pv-shim mode
Date: Fri, 28 Dec 2018 13:04:00 +0100
Message-ID: <20181228120404.50346-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD/o=PF=citrix.com=prvs=893533f24=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcqs7-0005l8-Pn
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 12:04:11 +0000
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

SGVsbG8sCgpUaGlzIHNlcmllcyBpbmNsdWRlcyBzb21lIG1pc2NlbGxhbmVvdXMgZml4ZXMgZm9y
IHRoZSBwdi1zaGltIG1vZGUsCnNwZWNpYWxseSByZWdhcmRpbmcgdGhlIGhhbmRsaW5nIG9mIHRo
ZSBtZW1vcnkgbWFwLgoKSXQgY2FuIGJlIGZvdW5kIG9uIG15IGdpdCBicmFuY2g6CgpnaXQ6Ly94
ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4uZ2l0IGd1ZXN0LWZpeGVzLXYyCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICg0KToKICB4ODYvZTgyMDogaW50cm9kdWNlIGEg
ZnVuY3Rpb24gdG8gcmVtb3ZlIHJhbmdlcyBmcm9tIGU4MjAKICB4ODYvZTgyMDogZG8gbm90IGZp
eHVwIG1lbW1hcCBpbiBjb3B5X2U4MjBfbWFwCiAgeDg2L2U4MjA6IGFzc3VtZSBtZW1tYXAgcHJv
dmlkZWQgd2hlbiBib290ZWQgdmlydHVhbGl6ZWQgaXMgY29ycmVjdAogIHg4Ni9zaGltOiBvbmx5
IG1hcmsgc3BlY2lhbCBwYWdlcyBhcyBSQU0gaW4gcHZzaGltIG1vZGUKCiB4ZW4vYXJjaC94ODYv
ZTgyMC5jICAgICAgICAgICAgIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
CiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMgICAgICAgIHwgNDIgLS0tLS0tLS0tLS0tLS0tLQog
eGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICB8IDQzICsrKysrKysrKysrKysrKysKIHhl
bi9jb21tb24vcGFnZV9hbGxvYy5jICAgICAgICAgfCAgNCArLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9lODIwLmggICAgICB8ICAyICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggfCAx
MyAtLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi9zaGltLmggICB8IDEyICsrKysrCiA3IGZp
bGVzIGNoYW5nZWQsIDEzMSBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3
LjIgKEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
