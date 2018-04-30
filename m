From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/4] block/xen_disk: remove use of grant
 map/unmap
Date: Mon, 30 Apr 2018 16:12:04 +0100
Message-ID: <20180430151145.iyou5pisaclvvn3v@MacBook-Pro-de-Roger.local>
References: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
 <1525089699-13411-3-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dhgf=ht=citrix.com=prvs=6518dd5c5=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fDATs-0004Vg-NA
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 15:12:44 +0000
Content-Disposition: inline
In-Reply-To: <1525089699-13411-3-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDE6MDE6MzdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBncmFudCBjb3B5IG9wZXJhdGlvbiB3YXMgYWRkZWQgdG8gbGlieGVuZ250dGFi
IGluIFhlbiA0LjguMC4gSWYgZ3JhbnQKPiBjb3B5IGlzIGF2YWlsYWJsZSB0aGVuIGRhdGEgZnJv
bSB0aGUgZ3Vlc3Qgd2lsbCBiZSBjb3BpZWQgcmF0aGVyIHRoYW4KPiBtYXBwZWQuCj4gVGhlIHhl
bl9kaXNrIHNvdXJjZSBjYW4gYmUgc2lnbmlmaWNhbnRseSBzaW1wbGlmaWVkIGJ5IHJlbW92aW5n
IHRoaXMgbm93Cj4gcmVkdW5kYW50IGNvZGUuCgpIbSwgSSBrbm93IHRoaXMgaXMgYSBQSVRBLCBi
dXQgRnJlZUJTRCBnbnRkZXYgaGFzbid0IGltcGxlbWVudGVkIHRoZQpncmFudC1jb3B5IG9wZXJh
dGlvbiB5ZXQuCgpJIGNvdWxkIHRyeSB0byBpbXBsZW1lbnQgaXQsIGJ1dCBJIGNhbid0IG1ha2Ug
YW55IHByb21pc2VzIG9uIHRoZSB0aW1lCkFUTSwgc2luY2UgSSdtIHF1aXRlIGJ1c3kuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
