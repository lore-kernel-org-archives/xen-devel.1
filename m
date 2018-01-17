From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.10.0-shim-comet] x86/guest: use the
 vcpu_info area from shared_info
Date: Wed, 17 Jan 2018 11:18:42 +0000
Message-ID: <8e5c21e2-7516-54cd-85ea-8416ce1dda02@citrix.com>
References: <20180117105702.33667-1-roger.pau@citrix.com>
 <47a0b922-7a9a-1afd-d869-c7dec0774c88@citrix.com>
 <23135.12424.419280.540031@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yrqs=em=citrix.com=prvs=548fec723=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eblk1-0006L1-LK
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 11:18:49 +0000
In-Reply-To: <23135.12424.419280.540031@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTcvMjAxOCAxMToxNiBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEwLjAtc2hpbS1jb21ldF0geDg2L2d1ZXN0OiB1
c2UgdGhlIHZjcHVfaW5mbyBhcmVhIGZyb20gc2hhcmVkX2luZm8iKToKPj4gV2l0aG91dCB0aGlz
IHBhdGNoLCBwZW9wbGUgbmVlZCB0byByZWJvb3QgdGhlaXIgTDAgaHlwZXJ2aXNvciBpbiBvcmRl
cgo+PiB0byB1c2UgQ29tZXQuCj4gCj4gUGVvcGxlIHJ1bm5pbmcgNC4xMC4gIE9uIDQuOCB0aGlz
IHByZXN1bWFibHkgaGFzIG5vIGJlbmVmaXQuCgpPbiB0aGUgY29udHJhcnkgLS0gZXhhY3RseSB0
aGUgc2FtZSBhcmd1bWVudHMgYXBwbHkuICBUaGVyZSB3ZXJlICpubyoKaHlwZXJ2aXNvciBwYXRj
aGVzIGFzIHBhcnQgb2YgdGhlIDQuOCBQVkggYmFja3BvcnQ7IHRoZSBvbmx5IHBhdGNoZXMKYmV0
d2VlbiBzdGFnaW5nLTQuOCBhbmQgdGhlIDQuOCBDb21ldCB0YWcgdGhhdCB0b3VjaCB0aGUgaHlw
ZXJ2aXNvciBhcmUKdGhlIHB2c2hpbS1zcGVjaWZpYyBwYXRjaGVzOyBzbyB0aGUgc2FtZSBhcmd1
bWVudHMgYXBwbHkgYm90aCB0byA0LjEwCmFuZCA0LjguCgogLUdlb3JnZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
