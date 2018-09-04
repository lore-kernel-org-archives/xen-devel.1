From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/6] x86emul: support AVX512 opmask insns
Date: Tue, 04 Sep 2018 01:58:56 -0600
Message-ID: <5B8E3B4002000078001E4F87@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86AC8D02000078001E31F3@prv1-mh.provo.novell.com>
 <15822fa5-ed58-2621-35e5-0a2e1b3473af@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx6Eq-0002HP-2R
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 07:59:04 +0000
In-Reply-To: <15822fa5-ed58-2621-35e5-0a2e1b3473af@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE5OjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDgvMTggMTU6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGVzZSBhcmUg
YWxsIFZFWCBlbmNvZGVkLCBzbyB0aGUgRVZFWCBkZWNvZGluZyBsb2dpYyBjb250aW51ZXMgdG8K
Pj4gcmVtYWluIHVudXNlZCBhdCB0aGlzIHBvaW50Lgo+Pgo+PiBUaGUgbmV3IHRlc3RjYXNlIGlz
IGRlbGliZXJhdGVseSBjb2RlZCBpbiBhc3NlbWJseSwgYXMgYSBDIG9uZSB3b3VsZAo+PiBoYXZl
IGJlY29tZSBhbG1vc3QgdW5yZWFkYWJsZSBkdWUgdG8gdGhlIG92ZXJ3aGVsbWluZyBhbW91bnQg
b2YKPj4gX19idWlsdGluXy4uLigpIHRoYXQgd291bGQgbmVlZCB0byBiZSB1c2VkLiBBZnRlciBh
bGwgdGhlIGNvbXBpbGVyIGhhcwo+PiBubyB1bmRlcmx5aW5nIHR5cGUgKHlldCkgdGhhdCBjb3Vs
ZCBiZSBvcGVyYXRlZCBvbiB3aXRob3V0IGJ1aWx0aW5zLAo+PiBvdGhlciB0aGFuIHRoZSB2ZWN0
b3IgdHlwZXMgdXNlZCBmb3IgIm5vcm1hbCIgU0lNRCBpbnNucy4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiAtLS0gYS94ZW4vYXJjaC94
ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYwo+PiBAQCAtNjAwMiw2ICs2MDIzLDYwIEBAIHg4Nl9lbXVsYXRl
KAo+PiAgICAgICAgICAgICAgZHN0LnZhbCA9IHNyYy52YWw7Cj4+ICAgICAgICAgIGJyZWFrOwo+
PiAgCj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19WRVgoMHgwZiwgMHg0YSk6ICAgIC8qIGthZGR7
dyxxfSBrLGssayAqLwo+PiArICAgICAgICBpZiAoICF2ZXgudyApCj4+ICsgICAgICAgICAgICBo
b3N0X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJkcSk7Cj4gCj4gV2h5IGlzIHRoaXMga2FkZCBo
YW5kbGVkIGRpZmZlcmVudGx5PyAgQXMgZmFyIGFzIEkgY2FuIHRlbGwgZnJvbSB0aGUKPiBtYW51
YWwsIGl0cyBlbmNvZGluZyBsb29rcyB0byBiZSBjb25zaXN0ZW50LgoKSXQncyBub3QgdGhlIGVu
Y29kaW5nLCBidXQgdGhlIEFWWDUxMkRRIHByb3BlcnR5IG9mIGthZGR3CndoaWNoIG90aGVyIGs8
b3A+dyBpbnNucyBkb24ndCBoYXZlICh0aG9zZSBhbGwgYXJlIEFWWDUxMkYpLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
