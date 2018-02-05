From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/3] xen: Disable ARINC653 scheduler by
 default for non-DEBUG builds
Date: Mon, 5 Feb 2018 14:11:34 +0000
Message-ID: <9ce47ac9-95e0-f395-f67b-16e39685a773@citrix.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <20180205113642.3174-3-george.dunlap@citrix.com>
 <5A786BD402000078001A53CA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=invn=e7=citrix.com=prvs=567d2a528=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eihUh-0004l8-Gb
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 14:11:39 +0000
In-Reply-To: <5A786BD402000078001A53CA@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMjAxOCAwMTozNiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMDIu
MTggYXQgMTI6MzYsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGUgQVJJ
TkM2NTMgc2NoZWR1bGVyIGlzIHRhcmdldGVkIGF0IGEgdmVyeSBzcGVjaWZpYyBuaWNoZTsgdHlw
aWNhbAo+PiB1c2VycyBjYW5ub3QgYmVuZWZpdCBmcm9tIHVzaW5nIGl0LiAgRGlzYWJsZSBpdCBi
eSBkZWZhdWx0IGZvcgo+PiBub24tREVCVUcgYnVpbGRzLgo+IAo+IFRoZSBtb3JlIHRoYXQgaXRz
IHByb21wdCBzYXlzICIoRVhQRVJJTUVOVEFMKSIuCgpXZWxsIEkgbGVmdCBSVERTIG9uIGJ5IGRl
ZmF1bHQsIHNpbmNlIHRoZXJlIHdvdWxkIGJlIGEgc21hbGwgY2hhbmNlCnNvbWVvbmUgbWlnaHQg
d2FudCB0byBwbGF5IHdpdGggaXQuICBCdXQgQUZBSUNUIEFSSU5DNjUzIGlzbid0IHJlYWxseQpz
b21ldGhpbmcgZGVzaWduZWQgdG8gYmUgdXNlZCBieSBhbnlvbmUgb3V0c2lkZSBhIHZlcnkgc3Bl
Y2lmaWMgc2V0IG9mCnVzZXJzLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
