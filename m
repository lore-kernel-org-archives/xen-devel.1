From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86emul: raise #GP(0) in VME mode for
 POPF with TF set in new value
Date: Fri, 2 Nov 2018 18:14:24 +0000
Message-ID: <44156271-6b5a-fd35-bb9c-c30a0e158c36@citrix.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BDC7F3002000078001F75CF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIdyF-0003g2-6r
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 18:14:59 +0000
In-Reply-To: <5BDC7F3002000078001F75CF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTY6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMgYSBjaGVjayBl
eHBsaWNpdGx5IGxpc3RlZCBieSB0aGUgaW5zdHJ1Y3Rpb24gcGFnZSBpbiB0aGUgU0RNLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSG1tIC0gbG9v
a2luZyBhdCB0aGUgbGlzdGluZywgSSB0aGluayB3ZSd2ZSBnb3QgYW4gSU9QTCBtaXNtYXRjaC7C
oCBUaGlzCmJlaGF2aW91ciwgYXMgd2VsbCBhcyB0aGUgVklQIGFkanVzdG1lbnQgaW4gY29udGV4
dCwgb25seSBhcHBseSBhdCBJT1BMIDwgMy4KCn5BbmRyZXcKCj4KPiAtLS0gYS94ZW4vYXJjaC94
ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11
bGF0ZS94ODZfZW11bGF0ZS5jCj4gQEAgLTQwNDksNiArNDA0OSw3IEBAIHg4Nl9lbXVsYXRlKAo+
ICAgICAgICAgICAgICBkc3QudmFsID0gKHVpbnQxNl90KWRzdC52YWwgfCAoX3JlZ3MuZWZsYWdz
ICYgMHhmZmZmMDAwMHUpOwo+ICAgICAgICAgICAgICBpZiAoIGNyNCAmIFg4Nl9DUjRfVk1FICkK
PiAgICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lm
KGRzdC52YWwgJiBYODZfRUZMQUdTX1RGLCBFWENfR1AsIDApOwo+ICAgICAgICAgICAgICAgICAg
aWYgKCBkc3QudmFsICYgWDg2X0VGTEFHU19JRiApCj4gICAgICAgICAgICAgICAgICB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKF9yZWdzLmVmbGFncyAmIFg4
Nl9FRkxBR1NfVklQLAo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
