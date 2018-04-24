From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen-netfront: fix xennet_start_xmit()'s
 return type
Date: Tue, 24 Apr 2018 14:31:36 +0100
Message-ID: <20180424133135.l5kaeq7dewvytqpy__8711.23498441211$1524576626$gmane$org@citrix.com>
References: <20180424131815.5064-1-luc.vanoostenryck@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y+rf=hn=citrix.com=prvs=645aa2f63=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAy2m-0007Ym-2v
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 13:31:40 +0000
Content-Disposition: inline
In-Reply-To: <20180424131815.5064-1-luc.vanoostenryck@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMDM6MTg6MTRQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IFRoZSBtZXRob2QgbmRvX3N0YXJ0X3htaXQoKSBpcyBkZWZpbmVkIGFzIHJl
dHVybmluZyBhbiAnbmV0ZGV2X3R4X3QnLAo+IHdoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51
bSB0eXBlLCBidXQgdGhlIGltcGxlbWVudGF0aW9uIGluIHRoaXMKPiBkcml2ZXIgcmV0dXJucyBh
biAnaW50Jy4KPiAKPiBGaXggdGhpcyBieSByZXR1cm5pbmcgJ25ldGRldl90eF90JyBpbiB0aGlz
IGRyaXZlciB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMu
dmFub29zdGVucnlja0BnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
