From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/7] doc: add credit2_cap_period_ms boot
 parameter description
Date: Tue, 24 Apr 2018 08:44:55 +0200
Message-ID: <20180424064459.23645-4-jgross@suse.com>
References: <20180424064459.23645-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/e5q=hn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fArhK-0008Q6-8I
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 06:45:06 +0000
In-Reply-To: <20180424064459.23645-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

Y3JlZGl0Ml9jYXBfcGVyaW9kX21zIGlzbid0IG1lbnRpb25lZCBpbiB4ZW4tY29tbWFuZC1saW5l
Lm1hcmtkb3duLgpBZGQgYSBkZXNjcmlwdGlvbi4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJr
ZG93biB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gYi9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgppbmRleCBhNmI1NTVkMGIwLi5hZDA4ZjNiNjQ1
IDEwMDY0NAotLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgorKysgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgpAQCAtNTY4LDYgKzU2OCwxNiBAQCB3
aGljaCB3b3VsZCBvdGhlcndpc2UgcmVxdWlyZSBlc2NhcGluZyBvZiB0aGUgPCBvcHRpb24KICMj
IyBjcmVkaXQyXF9iYWxhbmNlXF91bmRlcgogPiBgPSA8aW50ZWdlcj5gCiAKKyMjIyBjcmVkaXQy
XF9jYXBcX3BlcmlvZFxfbXMKKz4gYD0gPGludGVnZXI+YAorCis+IERlZmF1bHQ6IGAxMGAKKwor
RG9tYWlucyBzdWJqZWN0IHRvIGEgY2FwIHJlY2VpdmUgYSByZXBsZW5pc2htZW50IG9mIHRoZWly
IHJ1bnRpbWUgYnVkZ2V0CitvbmNlIGV2ZXJ5IGNhcCBwZXJpb2QgaW50ZXJ2YWwuIERlZmF1bHQg
aXMgMTAgbXMuIFRoZSBhbW91bnQgb2YgYnVkZ2V0Cit0aGV5IHJlY2VpdmUgZGVwZW5kcyBvbiB0
aGVpciBjYXAuIEZvciBpbnN0YW5jZSwgYSBkb21haW4gd2l0aCBhIDUwJSBjYXAKK3dpbGwgcmVj
ZWl2ZSA1MCUgb2YgMTAgbXMsIHNvIDUgbXMuCisKICMjIyBjcmVkaXQyXF9sb2FkXF9wcmVjaXNp
b25cX3NoaWZ0CiA+IGA9IDxpbnRlZ2VyPmAKIAotLSAKMi4xMy42CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
