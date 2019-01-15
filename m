From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: an assertion triggered when running Xen on a HSW
 desktop
Date: Tue, 15 Jan 2019 03:16:01 -0700
Message-ID: <5C3DB2E1020000780020DB62@prv1-mh.provo.novell.com>
References: <20190115080439.GA3883@gao-cwp>
 <20190115081825.qh6vxvy6bvqwqflb@mac> <20190115091158.GA5672@gao-cwp>
 <a38197defe084f5683e65a365fd0db82@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjLlM-0000uo-Bu
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 10:16:04 +0000
In-Reply-To: <a38197defe084f5683e65a365fd0db82@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE5IGF0IDEwOjQ0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBbc25pcF0KPj4gPj4gKFhFTikgWGVu
IGNhbGwgdHJhY2U6Cj4+ID4+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDI1Y2NiYz5dIGlvbW11X21h
cCsweGJhLzB4MTc2Cj4+ID4+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDQxODJkOD5dIGlvbW11X2h3
ZG9tX2luaXQrMHhlZi8weDIyMAo+PiA+PiAoWEVOKSAgICBbPGZmZmY4MmQwODA0MzcxNmM+XSBk
b20wX2NvbnN0cnVjdF9wdmgrMHgxODkvMHgxMjllCj4+ID4+IChYRU4pICAgIFs8ZmZmZjgyZDA4
MDQzZTUzYz5dIGNvbnN0cnVjdF9kb20wKzB4ZDQvMHhiMTQKPj4gPj4gKFhFTikgICAgWzxmZmZm
ODJkMDgwNDJkOGVmPl0gX19zdGFydF94ZW4rMHgyNzEwLzB4MjgzMAo+PiA+PiAoWEVOKSAgICBb
PGZmZmY4MmQwODAyMDAwZjM+XSBfX2hpZ2hfc3RhcnQrMHg1My8weDU1Cj4+ID4+IChYRU4pCj4+
ID4+IChYRU4pCj4+ID4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioKPj4gPj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6Cj4+ID4+IChYRU4pIEFzc2VydGlvbiAn
SVNfQUxJR05FRChkZm5feChkZm4pLCAoMXVsIDw8IHBhZ2Vfb3JkZXIpKScgZmFpbGVkIGF0Cj4+
IGlvbW11LmM6MzIzCj4+ID4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPj4gPgo+PiA+T2gsIHRoaXMgd2FzIGFkZGVkIGJ5IFBhdWwgcXVpdGUgcmVjZW50
bHkuIFlvdSBzZWVtIHRvIGJlIHVzaW5nIGEKPj4gPnJhdGhlciBvbGQgY29tbWl0IChhNWIwZWIz
NjM2KSwgaXMgdGhlcmUgYW55IHJlYXNvbiBmb3IgdXNpbmcgc3VjaCBhbgo+PiA+b2xkIGJhc2Vs
aW5lPwo+PiAKPj4gSSB3YXMgdXNpbmcgdGhlIG1hc3RlciBicmFuY2guIFlvdXIgcGF0Y2ggYmVs
b3cgZGlkIGZpeCB0aGlzIGlzc3VlLgo+IAo+IEdpdmVuIHRoaXMgZmFpbHVyZSBhbmQgdGhlIGZh
Y3QgdGhhdCB2YWxpZCBvcmRlcnMgZGlmZmVyIGJldHdlZW4gZGlmZmVyZW50IAo+IGFyY2hpdGVj
dHVyZXMsIEkgcHJvcG9zZSB3ZSBjaGFuZ2UgdGhlIGFyZ3VtZW50IHRvIHRoZSBpb21tdV9tYXAv
dW5tYXAgCj4gd3JhcHBlciBmdW5jdGlvbnMgZnJvbSBhbiBvcmRlciB0byBhIGNvdW50LCB0aHVz
IG1ha2luZyBpdCBjbGVhciB0aGF0IHRoZXJlIAo+IGlzIG5vIGFsaWdubWVudCByZXN0cmljdGlv
bi4KCkJ1dCB0aGUgd2hvbGUgaWRlYSBpcyBmb3IgdGhlcmUgdG8gYmUgYW4gYWxpZ25tZW50IHJl
c3RyaWN0aW9uLCBzdWNoCnRoYXQgaXQgaXMgZWFzeSB0byBkZXRlcm1pbmUgd2hldGhlciBsYXJn
ZSBwYWdlIG1hcHBpbmdzIGNhbiBiZQp1c2VkIHRvIHNhdGlzZnkgdGhlIHJlcXVlc3QuIFdoYXQn
cyB0aGUgZXhhY3QgY2FzZSB3aGVyZSBhIGNhbGxlcgphYnNvbHV0ZWx5IGhhcyB0byBwYXNzIGlu
IGEgbWlzLWFsaWduZWQgKGRmbixzaXplKSB0dXBsZT8KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
