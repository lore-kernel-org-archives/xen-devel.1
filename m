From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 7/7] npt/shadow: allow getting foreign page
 table entries
Date: Mon, 11 Feb 2019 18:46:42 +0100
Message-ID: <20190211174642.38046-8-roger.pau@citrix.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TcXE=QS=citrix.com=prvs=938cbf5a0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gtFg9-00048i-Dd
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 17:47:37 +0000
In-Reply-To: <20190211174642.38046-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudCBucHQgYW5kIHNoYWRvdyBjb2RlIHRvIGdldCBhbiBlbnRyeSB3aWxsIGFsd2F5cyBy
ZXR1cm4KSU5WQUxJRF9NRk4gZm9yIGZvcmVpZ24gZW50cmllcy4gQWxsb3cgdG8gcmV0dXJuIHRo
ZSBlbnRyeSBtZm4gZm9yCmZvcmVpZ24gZW50cmllcywgbGlrZSBpdCdzIGRvbmUgZm9yIGdyYW50
IHRhYmxlIGVudHJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNp
dHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwppbmRleCBh
ZWE4MTEwMjU0Li4zOWVmMjc5NDNlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0
LmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCkBAIC04NjUsNyArODY1LDggQEAgcG9k
X3JldHJ5X2wxOgogICAgIHVubWFwX2RvbWFpbl9wYWdlKGwxZSk7CiAKICAgICBBU1NFUlQobWZu
X3ZhbGlkKG1mbikgfHwgIXAybV9pc19yYW0oKnQpIHx8IHAybV9pc19wYWdpbmcoKnQpKTsKLSAg
ICByZXR1cm4gKHAybV9pc192YWxpZCgqdCkgfHwgcDJtX2lzX2dyYW50KCp0KSkgPyBtZm4gOiBJ
TlZBTElEX01GTjsKKyAgICByZXR1cm4gKHAybV9pc192YWxpZCgqdCkgfHwgcDJtX2lzX2dyYW50
KCp0KSB8fCBwMm1faXNfZm9yZWlnbigqdCkpCisgICAgICAgICAgID8gbWZuIDogSU5WQUxJRF9N
Rk47CiB9CiAKIHN0YXRpYyB2b2lkIHAybV9wdF9jaGFuZ2VfZW50cnlfdHlwZV9nbG9iYWwoc3Ry
dWN0IHAybV9kb21haW4gKnAybSwKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
