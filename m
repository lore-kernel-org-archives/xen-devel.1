From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: correct 32-bit address handling for
 AVX2 gathers
Date: Tue, 27 Nov 2018 05:49:09 -0700
Message-ID: <5BFD3D4502000078002005A7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRcnl-00022i-8N
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 12:49:17 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXMgZG9uZSBmb3Igb3RoZXIgY2FzZXMgYnkgY29tbWl0IDc4NjllMmJhZmUgKCJ4ODZlbXVsL2Z1
eno6IGFkZApydWRpbWVudGFyeSBsaW1pdCBjaGVja2luZyIpLCBhZGRyZXNzIGNhbGN1bGF0aW9u
cyBzaG91bGQgYWxzbyB1c2UKdHJ1bmNhdGVfZWEoKSBmb3IgdGhlIEFWWDIgZ2F0aGVyIGluc25z
LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTg0MDAsNyArODQwMCw4IEBAIHg4Nl9lbXVs
YXRlKAogICAgICAgICAgICAgICAgIHNpZ25lZCBsb25nIGlkeCA9IGIgJiAxID8gaW5kZXgucXdb
aV0gOiBpbmRleC5kd1tpXTsKIAogICAgICAgICAgICAgICAgIHJjID0gb3BzLT5yZWFkKGVhLm1l
bS5zZWcsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWEubWVtLm9mZiArIChpZHgg
PDwgc3RhdGUtPnNpYl9zY2FsZSksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1
bmNhdGVfZWEoZWEubWVtLm9mZiArCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGlkeCA8PCBzdGF0ZS0+c2liX3NjYWxlKSksCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHZvaWQgKiltbXZhbHAgKyBpICogb3BfYnl0ZXMsIG9wX2J5dGVzLCBjdHh0
KTsKICAgICAgICAgICAgICAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tBWSApCiAgICAgICAgICAg
ICAgICAgewoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
