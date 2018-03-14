From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc/arm: remove useless conditional in
	meminit
Date: Wed, 14 Mar 2018 11:03:28 +0000
Message-ID: <20180314110328.7icwjstxbyxagzfp@citrix.com>
References: <20180314105811.23809-1-wei.liu2@citrix.com>
 <a56e67f3-428e-ffce-293b-92575584997c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew4CX-00007P-Ht
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 11:04:09 +0000
Content-Disposition: inline
In-Reply-To: <a56e67f3-428e-ffce-293b-92575584997c@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTE6MDE6NDVBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDAzLzE0LzIwMTggMTA6NTggQU0sIFdlaSBMaXUgd3JvdGU6Cj4gPiBU
aGUgdmFyaWFibGUgbmFtZWQgcmFtc2l6ZSBpcyBhbHdheXMgbm9uLXplcm8gYXQgdGhhdCBwb2lu
dCBiZWNhdXNlCj4gPiB0aGVyZSBpcyBhIGNoZWNrIGZvciB6ZXJvIGEgZmV3IGxpbmVzIGJlZm9y
ZS4KPiAKPiBUaGUgYm9keSBvZiB0aGUgbG9vcCBoYXM6Cj4gCj4gcmFtc2l6ZSAtPSAuLi4KPiAK
PiBXZSB3YW50IHRvIGV4aXQgdGhlIGxvb3AgZWl0aGVyIHdoZW4gd2UgaGF2ZSBubyBtb3JlIGJh
bmtzIGxlZnQgb3Igd2UKPiBmdWxmaWxsZWQgYWxsIHRoZSBSQU0gcmVxdWVzdGVkLgoKUmlnaHQu
IFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4gLUVOT0NPRkZFRS4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
