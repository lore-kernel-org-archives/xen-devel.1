From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 08/11] libxl: QEMU startup sync based on
 QMP
Date: Thu, 22 Nov 2018 14:37:55 +0000
Message-ID: <20181122143755.GG2448@perard.uk.xensource.com>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-9-anthony.perard@citrix.com>
 <23534.46259.473785.159824@mariner.uk.xensource.com>
 <20181121164906.GC2448@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a1fs=ob=citrix.com=prvs=8577a9259=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gPq7D-0008Km-Hc
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 14:37:59 +0000
Content-Disposition: inline
In-Reply-To: <20181121164906.GC2448@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDQ6NDk6MDZQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMTI6MTQ6NDNQTSArMDAwMCwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUEFUQ0ggdjYgMDgvMTFd
IGxpYnhsOiBRRU1VIHN0YXJ0dXAgc3luYyBiYXNlZCBvbiBRTVAiKToKPiA+ID4gKyAgICAgICAg
TE9HRChERUJVRywgZXYtPmRvbWlkLCAiLi4gaW5zdGVhZCwgZ290OiAlcyIsCj4gPiA+ICsgICAg
ICAgICAgICAgbGlieGxfX2pzb25fb2JqZWN0X3RvX2pzb24oZ2MsIHJlc3BvbnNlKSk7Cj4gPiAK
PiA+IFRoZSBkb2MgY29tbWVudHMgZm9yIGxpYnhsX19qc29uX29iamVjdF90b19qc29uIGRvbid0
IHNheSB3aGV0aGVyIGl0Cj4gPiBjYW4gZmFpbC4gIFNvIEkgYXNzdW1lIGl0IGNhbiwgaW4gd2hp
Y2ggY2FzZSB5b3Ugd2lsbCBwYXNzIE5VTEwgdG8gJXMKPiA+IHdoaWNoIGlzIChzYWRseSkgbm93
YWRheXMgaWxsZWdhbCAoYWx0aG91Z2ggaW4gcHJhY3RpY2UgcHJvYmFibHkKPiA+IHNhZmUpLgo+
IAo+IEkgd291bmRlciB3aGF0IHRvIGRvIGZvciB0aGlzLgo+IE1heWJlIGludmVudCBhIEpTT04g
bWFjcm8gd2hpY2ggd291bGQgYmU6Cj4gICAgIEpTT04obykgKGxpYnhsX19qc29uX29iamVjdF90
b19qc29uKGdjLCAobykpIDogPyAiXCJudWxsXCIiKQo+ICAgICAoIm51bGwiIHdvdWxkIGFjdHVh
bGx5IGJlIHZhbGlkIGpzb24pCj4gT3IgZG8gaXQgd2l0aG91dCB0aGUgbWFjcm8sIGJ1dCB0aGVy
ZSBhcmUgcGxlbnR5IG9mIG90aGVyIGNhbGxlcidzIG9mCj4gbGlieGxfX2pzb25fb2JqZWN0X3Rv
X2pzb24gaW4gbGlieGxfX2V2X3FtcCBpbXBsZW1lbnRhdGlvbi4KCk9yIHNpbXBseSBjaGFuZ2Ug
bGlieGxfX2pzb25fb2JqZWN0X3RvX2pzb24gdG8gYWx3YXlzIHJldHVybiBhIHZhbGlkCmpzb24g
c3RyaW5nLiBUaGVyZSBhcmUgbm8gdXNlciB5ZXQsIHNvIGl0IGlzIHByb2JhYmx5IGZpbmUgdG8g
bWFrZSB0aGF0CmNoYW5nZS4KCldoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzLAoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
