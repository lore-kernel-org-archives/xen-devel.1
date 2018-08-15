From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.7] arm: constify atomic_read parameter
Date: Wed, 15 Aug 2018 09:53:08 +0100
Message-ID: <20180815085308.zpeyusac4l4xmwgc@citrix.com>
References: <20180815082836.6046-1-wei.liu2@citrix.com>
 <cce88130-c26d-7b02-a31a-138b6077f3e5@citrix.com>
 <cf2b9d6d-7bd9-fce7-3961-fe20f5e3ff8a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fjet=k6=citrix.com=prvs=75862455f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fprYF-0006zv-QQ
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 08:53:11 +0000
Content-Disposition: inline
In-Reply-To: <cf2b9d6d-7bd9-fce7-3961-fe20f5e3ff8a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMTUsIDIwMTggYXQgMDk6NTE6MzVBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDA4LzE1LzIwMTggMDk6MjkgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4gPiBPbiAxNS8wOC8yMDE4IDA5OjI4LCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBkZWQyYTM3ZDYz
IGFkZGVkIGNvbnN0IHRvIGF0b21pY19yZWFkLiBEbyB0aGUgc2FtZSBmb3IgQXJtCj4gPiA+IGNv
dW50ZXJwYXJ0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiA+IAo+ID4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gPiAKPiA+IE1vc3QgbGlrZWx5IG5lZWRlZCBmb3IgNC42IGFzIHdl
bGwuCj4gCj4gRmVlbCBmcmVlIHRvIGFkZCBteSBhY2sgb24gNC42IHBhdGNoIGFzIHdlbGw6Cj4g
Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+LgoKVGhhbmtz
LiBJIHdpbGwgY29tbWl0IGJvdGggcGF0Y2hlcyBzaG9ydGx5LgoKPiAKPiA+IAo+ID4gfkFuZHJl
dwo+ID4gCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
