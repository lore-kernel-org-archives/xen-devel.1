From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Fri, 29 Mar 2019 03:36:06 -0600
Message-ID: <5C9DE7060200007800222BA1@prv1-mh.provo.novell.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
 <5C9DCC4A0200007800222AEA@prv1-mh.provo.novell.com>
 <0eaf98eb-3e30-0136-1c75-1deb7c8a3bbc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9nvl-00059k-VU
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 09:36:10 +0000
In-Reply-To: <0eaf98eb-3e30-0136-1c75-1deb7c8a3bbc@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDEwOjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDMvMjAxOSAwNzo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+IEBAIC0zNTExLDcgKzM1MTEsOCBAQCB4ODZf
ZW11bGF0ZSgKPj4gICAgICB9Cj4+ICAKPj4gICAgICAvKiBXaXRoIGEgbWVtb3J5IG9wZXJhbmQs
IGZldGNoIHRoZSBtYXNrIHJlZ2lzdGVyIGluIHVzZSAoaWYgYW55KS4gKi8KPj4gLSAgICBpZiAo
IGVhLnR5cGUgPT0gT1BfTUVNICYmIGV2ZXgub3Btc2sgKQo+PiArICAgIGlmICggZWEudHlwZSA9
PSBPUF9NRU0gJiYgY3B1X2hhc19hdng1MTJmICYmIGV2ZXgub3Btc2sgJiYKPj4gKyAgICAgICAg
IF9nZXRfZnB1KGZwdV90eXBlID0gWDg2RU1VTF9GUFVfb3BtYXNrLCBjdHh0LCBvcHMpID09IFg4
NkVNVUxfT0tBWSApCj4gCj4gVGhlIGNwdV9oYXNfYXZ4NTEyZiBjaGVjayBpcyBub3cgcmVkdW5k
YW50LiAgSXQgaXMgZnVsbHkgZW5jYXBzdWxhdGVkIGJ5Cj4gX2dldF9mcHUoKSBiZWluZyBoYXBw
eSB3aXRoIFg4NkVNVUxfRlBVX29wbWFzay4KCldlbGwsIHRoYXQnbGwgZW5kIHVwIGJlaW5nIGlu
Y29uc2lzdGVudCB3aXRoIHdoYXQgd2UgZG8gZWxzZXdoZXJlOgpJZiB3ZSBkaWQgYXMgeW91IHNh
eSwgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4NTEyZikgY291bGQKKGFuZCBmb3IgY29uc2lz
dGVuY3kgdGhlbiBzaG91bGQpIGFsbCBiZWNvbWUganVzdAp2Y3B1X211c3RfaGF2ZShhdng1MTJm
KS4gU2ltaWxhcmx5IGZvciBBVlguCgpJJ2QgbGlrZSB0byBwdXQgdXAgdGhlIG90aGVyIG9wdGlv
biB0aGVuOiBSYXRoZXIgdGhhbiB1c2luZwpfZ2V0X2ZwdSgpIChhbmQgaW4gcGFydGljdWxhciB0
aGUgcmVhZF94Y3IoKSBhbmQgcmVhZF9jcigpIGhvb2tzKQp3ZSBjb3VsZCByZWFkIHRoZSByZWFs
IFhDUjAgaGVyZS4gQWZ0ZXIgYWxsIHdlIGlzc3VlIHRoZSBLTU9WIG5vdApiZWNhdXNlIHRoZSBn
dWVzdCBoYXMgc3BlY2lmaWVkIGl0LCBidXQgYmVjYXVzZSB3ZSBuZWVkIHRoZSB2YWx1ZQpvZiB0
aGUgcmVnaXN0ZXIgZm9yIGNvcnJlY3QgZmF1bHQgc3VwcHJlc3Npb24gZW11bGF0aW9uLgoKPiBQ
cmVmZXJhYmx5IHdpdGggaXQgZHJvcHBlZCwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIKPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkxldCBtZSBrbm93IG9mIHRoZSBhcHBsaWNhYmls
aXR5IG9mIHRoaXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
