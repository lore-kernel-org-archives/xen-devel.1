From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 02/47] x86emul: support basic AVX512 moves
Date: Mon, 19 Nov 2018 18:35:27 +0000
Message-ID: <e5cc0969-ec88-b82d-3609-3c40872f6860@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28CDE02000078001FD402@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnyi=N6=citrix.com=prvs=8544ffb4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gOoR4-0001eq-Pp
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 18:38:14 +0000
In-Reply-To: <5BF28CDE02000078001FD402@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZTogU0RNIFZvbCAy
IHJldiAwNjcgaXMgbm90IHJlYWxseSBjb25zaXN0ZW50IGFib3V0IEVWRVguTCdMIGZvciBMSUcK
PiAgICAgICBpbnNucyAtIHRoZSBvbmx5IHBsYWNlIHdoZXJlIHRoaXMgaXMgbWFkZSBleHBsaWNp
dCBpcyBhIHRhYmxlIGluCj4gICAgICAgdGhlIHNlY3Rpb24gdGl0bGVkICJWZWN0b3IgTGVuZ3Ro
IE9ydGhvZ29uYWxpdHkiOiBXaGlsZSB0aGV5Cj4gICAgICAgdG9sZXJhdGUgMCwgMSwgYW5kIDIs
IGEgdmFsdWUgb2YgMyB1bmlmb3JtbHkgbGVhZHMgdG8gI1VELgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
