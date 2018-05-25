From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [v2 1/6] Port WARN_ON_ONCE() from Linux
Date: Fri, 25 May 2018 01:07:35 -0600
Message-ID: <5B07B63702000078001C5D4E@prv1-mh.provo.novell.com>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-2-sameer.goel@linaro.org>
 <5B066F7302000078001C56BB@prv1-mh.provo.novell.com>
 <aee35e24-cf78-5f33-c13d-f10715e899f4@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uj/n=im=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fM6p9-00015G-JW
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 07:07:39 +0000
In-Reply-To: <aee35e24-cf78-5f33-c13d-f10715e899f4@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sameer.goel@linaro.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Manish Jaggi <mjaggi@caviumnetworks.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDIyOjIzLCA8c2FtZWVyLmdvZWxAbGluYXJvLm9yZz4gd3JvdGU6
Cgo+IAo+IE9uIDA1LzI0LzIwMTggMDE6NTMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAyNC4wNS4xOCBhdCAwMjo0NiwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4g
UG9ydCBXQVJOX09OX09OQ0UgbWFjcm8gZnJvbSBMaW51eC4KPj4gSW4gc3VjaCBhIGNhc2UgeW91
IHNob3VsZCBqdXN0aWZ5IGFkanVzdG1lbnRzIHlvdSd2ZSBtYWRlOgo+IEkgY2FuIGFkZCBtb3Jl
IGRldGFpbHMsIGJ1dCBoYXZlIG1vc3RseSBqdXN0IGNoYW5nZWQgdmFyaWFibGUgbmFtZXMuIFRo
ZSAKPiBtYWNybyBpcyBzZWxmIGV4cGxhbmF0b3J5Lgo+IAo+IFNob3VsZCBJIGp1c3QgY2hhbmdl
IHRoaXMgdG86ICJEZWZpbmUgV0FSTl9PTl9PTkNFIG1hY3JvIHRvIG1pcnJvciBMSW51eCAKPiBm
dW5jdGlvbmFsaXR5IgoKVGhhdCB3b3VsZCBzZWVtIGJldHRlciB0byBtZS4KCj4+PiAtLS0gYS94
ZW4vaW5jbHVkZS94ZW4vbGliLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+Pj4g
QEAgLTExLDYgKzExLDE5IEBACj4+PiAgICNkZWZpbmUgQlVHX09OKHApICBkbyB7IGlmICh1bmxp
a2VseShwKSkgQlVHKCk7ICB9IHdoaWxlICgwKQo+Pj4gICAjZGVmaW5lIFdBUk5fT04ocCkgZG8g
eyBpZiAodW5saWtlbHkocCkpIFdBUk4oKTsgfSB3aGlsZSAoMCkKPj4+ICAgCj4+PiArI2RlZmlu
ZSBXQVJOX09OX09OQ0UocCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gKyh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+
ICsgICAgc3RhdGljIGJvb2wgX19zZWN0aW9uKCIuZGF0YS51bmxpa2VseSIpIHdhcm5lZDsgICBc
Cj4+IExpbnV4IHVzZXMgLmRhdGEub25jZS4gVGhhdCBvciAuZGF0YS5jb2xkIHdvdWxkIHNlZW0g
YmV0dGVyIHRvIG1lIHRoYW4KPj4gLmRhdGEudW5saWtlbHkuCj4gSSBndWVzcyB0aGVyZSBpcyBu
b3QgcmVhc29uIHRvIGtlZXAgdGhpcyBpbiBhIHNwZWNpZmljIHNlY3Rpb24uIEknbGwgCj4ganVz
dCBnbyBhaGVhZCBhbmQgcmVtb3ZlIHRoZSBzZWN0aW9uIGhlcmU/CgpUaGVyZSBjZXJ0YWlubHkg
aXMgYSByZWFzb246IFdlIGRvbid0IHdhbnQgc3VjaCB2YXJpYWJsZXMgdG8gc2l0IGluIHRoZQpt
aWRkbGUgb2YgYW4gb3RoZXJ3aXNlIGZyZXF1ZW50bHkgYWNjZXNzZWQgY2FjaGUgbGluZS4gSGVu
Y2UgdGhlICJjb2xkIgpwYXJ0IG9mIHRoZSBzdWdnZXN0ZWQgYWx0ZXJuYXRpdmVzIG5hbWUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
