From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 07/16] x86/shadow: fetch CPL just once in
 sh_page_fault()
Date: Wed, 11 Jul 2018 14:46:46 +0100
Message-ID: <20180711134646.GA2399@deinos.phlegethon.org>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46064302000078001D328C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l7kq=j3=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1fdFSD-0002Ui-O2
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 13:46:49 +0000
Content-Disposition: inline
In-Reply-To: <5B46064302000078001D328C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDc6MjkgLTA2MDAgb24gMTEgSnVsICgxNTMxMjk0MTc5KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gVGhpcyBpc24ndCBhcyBtdWNoIG9mIGFuIG9wdGltaXphdGlvbiB0aGFuIHRvIGF2b2lkIHRy
aWdnZXJpbmcgYSBnY2MgYnVnCj4gYWZmZWN0aW5nIDUueCAuLi4gNy54LCB0cmlnZ2VyZWQgYnkg
YW55IGFzbSgpIHB1dCBpbnNpZGUgdGhlIGFkIGhvYwo+ICJyZXdhbGsiIGxvb3AgYW5kIHRha2lu
ZyBhcyBhbiAob3V0cHV0Pykgb3BlcmFuZCBhIHJlZ2lzdGVyIHZhcmlhYmxlCj4gdGllZCB0byAl
cmR4IChhbiAicmR4IiBjbG9iYmVyIGlzIGZpbmUpLiBUaGUgaXNzdWUgaXMgZHVlIHRvIGFuIGFw
cGFyZW50Cj4gY29sbGlzaW9uIGluIHJlZ2lzdGVyIHVzZSB3aXRoIHRoZSBtb2R1bG8gb3BlcmF0
aW9uIGluIHZ0bGJfaGFzaCgpLAo+IHdoaWNoICh3aXRoIG9wdGltaXphdGlvbiBlbmFibGVkKSBp
bnZvbHZlcyBhIG11bHRpcGxpY2F0aW9uIG9mIHR3bwo+IDY0LWJpdCB2YWx1ZXMgd2l0aCB0aGUg
dXBwZXIgaGFsZiAoaW4gJXJkeCkgb2YgdGhlIDEyOC1iaXQgcmVzdWx0IGJlaW5nCj4gb2YgaW50
ZXJlc3QuCj4gCj4gU3VjaCBhbiBhc20oKSB3YXMgb3JpZ2luYWxseSBtZWFudCB0byBiZSBpbXBs
aWNpdGx5IGludHJvZHVjZWQgaW50byB0aGUKPiBjb2RlIHdoZW4gY29udmVydGluZyBtb3N0IGlu
ZGlyZWN0IGNhbGxzIHRocm91Z2ggdGhlIGh2bV9mdW5jcyB0YWJsZSB0bwo+IGRpcmVjdCBjYWxs
cyAodmlhIGFsdGVybmF0aXZlIGluc3RydWN0aW9uIHBhdGNoaW5nKTsgdGhhdCBtb2RlbCB3YXMK
PiBzd2l0Y2hlZCB0byBjbG9iYmVycyBkdWUgdG8gZnVydGhlciBjb21waWxlciBwcm9ibGVtcywg
YnV0IEkgdGhpbmsgdGhlCj4gY2hhbmdlIGhlcmUgaXMgd29ydGh3aGlsZSBuZXZlcnRoZWxlc3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSBk
b24ndCBxdWl0ZSBmb2xsb3cgd2hhdCB0aGUgY29tcGlsZXIgYnVnIGRvZXMgaGVyZSAtLSBpdCB3
b3VsZCBiZSBuaWNlCnRvIHNheSB3aGF0IGVmZmVjdCBpdCBoYXMgb24gdGhlIGZpbmFsIGNvZGUu
ICBJbiBhbnkgY2FzZSwgdGhlIGNvZGUKY2hhbmdlIGlzIGZpbmUuCgpSZXZpZXdlZC1ieTogVGlt
IERlZWdhbiA8dGltQHhlbi5vcmc+CgpDaGVlcnMsCgpUaW0uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
