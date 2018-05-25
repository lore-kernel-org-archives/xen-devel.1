From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/5] x86: move definition of struct
 cpuid_leaf to cpuid.h
Date: Fri, 25 May 2018 13:03:09 +0100
Message-ID: <20180525120309.6j743pvgwucldvxp@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-2-wei.liu2@citrix.com>
 <5B07F87402000078001C5E96@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=alxt=im=citrix.com=prvs=6765399a5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fMBRB-0008M7-Vw
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 12:03:14 +0000
Content-Disposition: inline
In-Reply-To: <5B07F87402000078001C5E96@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMDU6NTA6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjA1LjE4IGF0IDE4OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGlzIGlzIGEgc3RlcCB0b3dhcmRzIGNvbnNvbGlkYXRpbmcgcmVsZXZhbnQgZGF0
YSBzdHJ1Y3R1cmVzIGFuZAo+ID4gZGVmaW5lcyB0byBvbmUgbG9jYXRpb24uCj4gCj4gU29ydCBv
ZiBjb250cmFyeSB0byB3aGF0IHRoZSBwYXRjaCBkb2VzIC0gaXQgY29udmVydHMgb25lIGluc3Rh
bmNlIG9mIHRoZQo+IHN0cnVjdHVyZSB0byB0d28gb2YgdGhlbS4KCkJ1dCBpc24ndCB0aGlzIHRl
c3QgaGFybmVzcyBhbiBleGNlcHRpb24gdG8gaG93IHRoaW5ncyBhcmUgbm9ybWFsbHkKZG9uZT8g
SSBkb24ndCB0aGluayB4ODYgaW5zbiBlbXVsYXRvciBpcyBhcyBzdGFuZGFsb25lIGFzIG90aGVy
CmNvbXBvbmVudHMuCgpJIG5ldmVyIHVuZGVyc3Rvb2Qgd2h5IGNwdWlkX2xlYWYgd2FzIHB1dCBp
bnRvIHg4Nl9lbXVsYXRlLmggaW4gdGhlCmZpcnN0IHBsYWNlLiBJIHRyaWVkIHRvIGNvbnZlcnQg
aXQgdG8gdXNlIGNwdWlkLmggYnV0IHRoYXQgb3BlbmVkIGFuCmV2ZW4gYmlnZ2VyIGNhbiBvZiB3
b3Jtcy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
