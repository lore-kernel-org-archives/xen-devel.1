From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen-netback: fix xenvif_start_xmit()'s
 return type
Date: Tue, 24 Apr 2018 14:20:23 +0100
Message-ID: <20180424132023.pwncbjdzgqcpp7w6__26807.6975866736$1524575944$gmane$org@citrix.com>
References: <20180424131812.5014-1-luc.vanoostenryck@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y+rf=hn=citrix.com=prvs=645aa2f63=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAxrv-0006ck-84
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 13:20:27 +0000
Content-Disposition: inline
In-Reply-To: <20180424131812.5014-1-luc.vanoostenryck@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMDM6MTg6MTJQTSArMDIwMCwgTHVjIFZhbiBPb3N0ZW5y
eWNrIHdyb3RlOgo+IFRoZSBtZXRob2QgbmRvX3N0YXJ0X3htaXQoKSBpcyBkZWZpbmVkIGFzIHJl
dHVybmluZyBhbiAnbmV0ZGV2X3R4X3QnLAo+IHdoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51
bSB0eXBlLCBidXQgdGhlIGltcGxlbWVudGF0aW9uIGluIHRoaXMKPiBkcml2ZXIgcmV0dXJucyBh
biAnaW50Jy4KPiAKPiBGaXggdGhpcyBieSByZXR1cm5pbmcgJ25ldGRldl90eF90JyBpbiB0aGlz
IGRyaXZlciB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMu
dmFub29zdGVucnlja0BnbWFpbC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
