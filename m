From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 1/3] x86emul: skip VIF processing in VME mode
 for 16-bit POPF at IOPL 3
Date: Tue, 06 Nov 2018 06:44:45 -0700
Message-ID: <5BE19ACD02000078001F89E8@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hxzx=nr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gK1ez-0006cS-JU
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 13:44:49 +0000
In-Reply-To: <5BE1981502000078001F89C7@prv1-mh.provo.novell.com>
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

QXQgSU9QTCAzIENSNC5WTUUgaXMgaXJyZWxldmFudC4KClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogTmV3LgoKLS0tIGEveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4
Nl9lbXVsYXRlLmMKQEAgLTQwNDcsNyArNDA0Nyw4IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBp
ZiAoIG9wX2J5dGVzID09IDIgKQogICAgICAgICB7CiAgICAgICAgICAgICBkc3QudmFsID0gKHVp
bnQxNl90KWRzdC52YWwgfCAoX3JlZ3MuZWZsYWdzICYgMHhmZmZmMDAwMHUpOwotICAgICAgICAg
ICAgaWYgKCBjcjQgJiBYODZfQ1I0X1ZNRSApCisgICAgICAgICAgICBpZiAoIChjcjQgJiBYODZf
Q1I0X1ZNRSkgJiYKKyAgICAgICAgICAgICAgICAgTUFTS19FWFRSKF9yZWdzLmVmbGFncywgWDg2
X0VGTEFHU19JT1BMKSAhPSAzICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBpZiAo
IGRzdC52YWwgJiBYODZfRUZMQUdTX0lGICkKICAgICAgICAgICAgICAgICB7CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
