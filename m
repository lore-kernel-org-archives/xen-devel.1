From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/2] New test and refactoring
Date: Tue, 4 Dec 2018 11:25:16 +0000
Message-ID: <20181204112516.3vpthretjfspwre2@zion.uk.xensource.com>
References: <20181122154903.27414-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suE0=ON=citrix.com=prvs=86958b7db=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gU8pM-0003iw-Sp
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:25:20 +0000
Content-Disposition: inline
In-Reply-To: <20181122154903.27414-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

RG91ZywgcGluZz8KCk9uIFRodSwgTm92IDIyLCAyMDE4IGF0IDAzOjQ5OjAxUE0gKzAwMDAsIFdl
aSBMaXUgd3JvdGU6Cj4gV2VpIExpdSAoMik6Cj4gICBhdXRvbWF0aW9uOiBhZGQgYSBxZW11IHNt
b2tlIHRlc3QgZm9yIGNsYW5nIGJ1aWxkCj4gICBhdXRvbWF0aW9uOiBicmVhayAuZ2l0bGFiLXlh
bWwgaW50byBzbWFsbGVyIGZpbGVzCj4gCj4gIC5naXRsYWItY2kueW1sICAgICAgICAgICAgICAg
ICAgfCA0MDAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhdXRv
bWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sIHwgMzc5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sICB8ICAzNCAr
KysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDE2IGluc2VydGlvbnMoKyksIDM5NyBkZWxldGlvbnMo
LSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGF1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLnlhbWwK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGF1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFtbAo+IAo+
IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
