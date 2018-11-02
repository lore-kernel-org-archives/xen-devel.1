From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/3] x86emul: VME and PVI modes require a #GP(0)
 check first thing
Date: Fri, 02 Nov 2018 10:45:01 -0600
Message-ID: <5BDC7F0D02000078001F75CC@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIcZF-0002JL-Jr
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 16:45:05 +0000
In-Reply-To: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXMgZXhwbGljaXRseSBzcGVsbGVkIG91dCBieSB0aGUgU0RNLCBFRkxBR1MuVklGIGFuZCBFRkxB
R1MuVklQIGJvdGggc2V0CmF0IHRoZSBzdGFydCBvZiBhbiBpbnN0cnVjdGlvbiB0cmlnZ2VyICNH
UCgwKSBpbmRlcGVuZGVudCBvZiBhY3R1YWwKaW5zdHJ1Y3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2Vt
dWxhdGUuYwpAQCAtMzI0Nyw2ICszMjQ3LDExIEBAIHg4Nl9lbXVsYXRlKAogCiAgICAgQVNTRVJU
KG9wcy0+cmVhZCk7CiAKKyAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoKG1vZGVfdmlmKCkgJiYK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIChfcmVncy5lZmxhZ3MgJiBYODZfRUZMQUdTX1ZJ
RikgJiYKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIChfcmVncy5lZmxhZ3MgJiBYODZfRUZM
QUdTX1ZJUCkpLAorICAgICAgICAgICAgICAgICAgICAgICAgICBFWENfR1AsIDApOworCiAgICAg
cmMgPSB4ODZfZGVjb2RlKCZzdGF0ZSwgY3R4dCwgb3BzKTsKICAgICBpZiAoIHJjICE9IFg4NkVN
VUxfT0tBWSApCiAgICAgICAgIHJldHVybiByYzsKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
