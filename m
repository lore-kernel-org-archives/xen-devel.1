From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 1 May 2018 13:52:11 +0100
Message-ID: <23272.25339.521207.449205@mariner.uk.xensource.com>
References: <cover.1525005313.git.lars.kurth@citrix.com>
 <1935c3cc282228c806081ab47653215ca0080a3c.1525005313.git.lars.kurth@citrix.com>
 <23271.10702.618476.183954@mariner.uk.xensource.com>
 <96ED0EFF-C77D-4946-97FE-31731D9DE2AB@citrix.com>
 <23271.17046.529514.36171@mariner.uk.xensource.com>
 <2C272866-A075-4B32-9471-9B709BF90F89@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0l9=hu=citrix.com=prvs=652255aa1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fDUlU-0007TE-3X
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 12:52:16 +0000
In-Reply-To: <2C272866-A075-4B32-9471-9B709BF90F89@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjExIHYyIDIvMl0gQWRkIG5ldyBh
ZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0IHRvIG9wdGltaXNlIHRoZSB3b3JrZmxvdyB3aGVuIHVz
aW5nIGdpdCBmb3JtYXQtcGF0Y2ggd2l0aCBnZXRfbWFpbnRhaW5lci5wbCIpOgo+IO+7v09uIDMw
LzA0LzIwMTgsIDE3OjIxLCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3
cm90ZToKPiAKPiAgICAgV2hlbiBJIGRvIHRoaXMsIHRoZXJlIGlzIG5vdGhpbmcgdGhhdCBnZXRz
IHRoZSBDQyBmb3IgdGhlIGNvdmVyIGxldHRlcgo+ICAgICByaWdodC4gIChJIHNvbWV0aW1lcyBi
b2RnZSBpdC4pICBZb3VyIHRvb2wgYWxyZWFkeSBrbm93cyBob3cgdG8KPiAgICAgZXh0cmFjdCBD
Q3MgZnJvbSB0aGUgaW5kaXZpZHVhbCBub24tY292ZXItbGV0dGVyIHBhdGNoZXMgYW5kIGFkZCB0
aGVtCj4gICAgIHRvIHRoZSBjb3ZlciBsZXR0ZXIuICBUaGF0IGlzIHRoZSBmdW5jdGlvbiBJIHdh
bnQgLSB0byBkbyB0aGF0LCBidXQKPiAgICAgbm90IHJ1biBnZXRfbWFpbnRhaW5lci4KPiAKPiBU
aGF0IG1ha2VzIHNlbnNlIGFuZCBjYW4gYmUgZWFzaWx5IGRvbmUgdmlhIGFuIG9wdGlvbjogZS5n
Lgo+IC0taW5zZXJ0IGNvdmVyfC1pIGNvdmVyIG9yIGEgc2VwYXJhdGUgb3B0aW9uLiBMZXQgbWUg
a25vdyB3aGV0aGVyCj4geW91IGhhdmUgYSBwcmVmZXJlbmNlIHJlZ2FyZGluZyBuYW1pbmcvb3B0
aW9ucy4KCkkgdGhpbmsgdGhpcyBpcyBvcnRob2dvbmFsIHRvIC1pLiAgVGhhdCBpcywgYSB1c2Vy
IHdobyB3YW50cyB5b3VyIHRvb2wKdG8gb25seSBlZGl0IHRoZSBjb3ZlciBsZXR0ZXIgbWlnaHQg
d2FudCBlaXRoZXIgdG8gaGF2ZSBpdCBhZGQgdGhlIENDcwpvbmx5IHRvIHRoZSBtYWlsIGhlYWRl
ciwgb3IgaW50byB0aGUgYm9keSBhcyB3ZWxsLgoKUGVyaGFwcyAtLXRyYW5zZmVyLW9ubHkgYWth
IC1UID8gIE5vdCBzdXJlIEkgY2FuIHRoaW5rIG9mIGEgZ29vZCBuYW1lLgoKQXMgYW4gYXNpZGUs
IEkgZ3Vlc3Mgd2l0aCBgLWkgY2Nib2R5JyB5b3VyIHRvb2wgc3RpbGwgcHV0cyB0aGUgQ0NzIGlu
CnRoZSBtYWlsIGhlYWRlcnMgb2YgdGhlIGNvdmVyIGxldHRlciA/ICBPciB3aWxsIGdpdC1zZW5k
LWVtYWlsIGRvIHRoYXQgPwoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
