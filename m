From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] shim: allow building of just the shim with
 build-ID-incapable linker
Date: Mon, 19 Feb 2018 14:56:07 +0000
Message-ID: <20180219145213.2ehbtrvwlj2xsqor@MacBook-Pro-de-Roger.local>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1enmrq-0004EX-Jl
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 14:56:34 +0000
Content-Disposition: inline
In-Reply-To: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTksIDIwMTggYXQgMDY6MjM6MDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIEVMRiBub3RlIHRoZSBzaGltIGJ1aWxkIGluc2VydHMgY2F1c2VzIG1rZWxmMzIg
dG8gY2hva2Ugb24gdGhlCj4gc2Vjb25kIHByb2dyYW0gaGVhZGVyLiBIb3dldmVyLCB0aGUgb3V0
cHV0IG9mIG1rZWxmMzIgaXNuJ3QgcmVhbGx5Cj4gbmVlZGVkIHdoZW4gYnVpbGRpbmcgaW5zaWRl
IHRvb2xzL2Zpcm13YXJlLyAtIGFuIGF0dGVtcHQgdG8gYnVpbGQgaXQgaXMKPiBtYWRlIHNvbGVs
eSBiZWNhdXNlIG9mIGEgd3JvbmcgZGVwZW5kZW5jeS4KPiAKPiBGdXJ0aGVyIGNoYW5nZXMgdG8g
dGhlIG1ha2UgbG9naWMgd2lsbCBiZSBuZWVkZWQgdG8gYWxzbyBhbGxvdyBidWlsZGluZwo+IGEg
c2hpbS1lbmFibGVkICJub3JtYWwiIHhlbiB3aXRoIHN1Y2ggYSBsaW5rZXIgKGFzIGl0IGxvb2tz
IHRoZSAtLW5vdGVzCj4gb3B0aW9uIHdpbGwgbmVlZCBwYXNzaW5nIG5vdCBqdXN0IHdoZW4gdGhl
IGxpbmtlciBzdXBwb3J0IGJ1aWxkIElECj4gZ2VuZXJhdGlvbikuCj4gCj4gQWxzbyBkcm9wIGEg
c3RyYXkgdmFyaWFibGUgc2V0dGluZyBmcm9tIHRoZSB4ODYgTWFrZWZpbGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCB0aGVyZSBjZXJ0
YWlubHkgbm8gbmVlZCB0byBidWlsZCB0aGUgcmVndWxhciB4ZW4gdGFyZ2V0IEFGQUlDVAppZiBv
bmx5IHhlbi1zaGltIGlzIGRlc2lyZWQuCgpJIGFsc28gYXNzdW1lIHRoYXQgcGFzc2luZyAtLW5v
dGVzIHRvIG1rZWxmMzIgd2hlbiBidWlsZGluZyB0aGUgc2hpbQoocmVnYXJkbGVzcyBvZiB3aGV0
aGVyIHRoZSBsaW5rZXIgc3VwcG9ydHMgYnVpbGQgSUQgb3Igbm90KSBzaG91bGQKYWxzbyBmaXgg
dGhlIGlzc3VlPwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
