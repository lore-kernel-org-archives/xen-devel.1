From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 4/4] xen: use SYMBOL everywhere
Date: Thu, 08 Nov 2018 07:51:20 -0700
Message-ID: <5BE44D6802000078001F9B77@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1811061403440.21987@sstabellini-ThinkPad-X260>
 <1541541959-23140-4-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKleW-00020Y-De
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 14:51:24 +0000
In-Reply-To: <1541541959-23140-4-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjExLjE4IGF0IDIzOjA1LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gVXNlIFNZTUJPTCBldmVyeXdoZXJlIF9zdGV4dCwgX2V0ZXh0LCBldGMuIGFyZSB1c2VkLiBU
ZWNobmljYWxseSwgaXQKPiBpcyByZXF1aXJlZCB3aGVuIGNvbXBhcmluZyBhbmQgc3VidHJhY3Rp
bmcgcG9pbnRlcnMgWzFdLCBidXQgdXNlIGl0Cj4gZXZlcnl3aGVyZSB0byBhdm9pZCBjb25mdXNp
b24uCgpJIHRoaW5rIHVzaW5nIGl0IHdoZW4gbm90IG5lZWRlZCBpcyBjYXVzaW5nIG1vcmUgY29u
ZnVzaW9uLiBBbHNvCndoeSB3b3VsZCB5b3UgdGhlbiBub3QgdXNlIGl0IG9uIGFsbCBvdGhlciBk
YXRhIHN5bWJvbHM/IFRoZQpwYXRjaCB3aWxsIGVuZCB1cCBxdWl0ZSBhIGJpdCBtb3JlIHJlYXNv
bmFibGUgaW4gc2l6ZSBvbmNlIHlvdSBkcm9wCnRoZSB1bm5lY2Vzc2FyeSBjaGFuZ2VzLgoKPiAt
LS0KPiAgeGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMgICAgICAgICAgfCAgNyArKy0tCj4gIHhl
bi9hcmNoL2FybS9hcm0zMi9saXZlcGF0Y2guYyAgICAgIHwgIDIgKy0KPiAgeGVuL2FyY2gvYXJt
L2FybTY0L2xpdmVwYXRjaC5jICAgICAgfCAgMiArLQo+ICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgICAgICAgICB8ICAyICstCj4gIHhlbi9hcmNoL2FybS9saXZlcGF0Y2guYyAgICAgICAg
ICAgIHwgIDYgKy0tCj4gIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAgICAgICAgIHwgMTcg
KysrKy0tLS0KPiAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgICAgfCAgOCArKy0t
Cj4gIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAgIHwgNzkgKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94ODYvdGJvb3QuYyAgICAgICAg
ICAgICAgICB8IDEyICsrKy0tLQo+ICB4ZW4vYXJjaC94ODYveDg2XzY0L21hY2hpbmVfa2V4ZWMu
YyB8ICA0ICstCj4gIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgICAgICAgIHwgIDcgKysr
LQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmggICB8ICAzICstCj4gIHhlbi9p
bmNsdWRlL2FzbS1hcm0vbW0uaCAgICAgICAgICAgIHwgIDQgKy0KPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9tbS5oICAgICAgICAgICAgfCAgNCArLQo+ICB4ZW4vaW5jbHVkZS94ZW4va2VybmVsLmgg
ICAgICAgICAgICB8IDI0ICsrKysrLS0tLS0tCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDk3IGluc2Vy
dGlvbnMoKyksIDg0IGRlbGV0aW9ucygtKQoKSnVzdCBsaWtlIGZvciB2MjogRGlkIHlvdSByZWFs
bHkgY2hlY2sgeW91IGNhdWdodCB0aGVtIGFsbD8gVGhlIHZQQ0kKb25lcyBJIGhhZCBwb2ludGVk
IGF0IGJhY2sgdGhlbiB3ZXJlIG9ubHkgYW4gZXhhbXBsZS4gQW5vdGhlcgpleGFtcGxlIG5vdyBp
cyB4ZW4vY29tbW9uL2tlcm5lbC5jOl9jbWRsaW5lX3BhcnNlKCkuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
