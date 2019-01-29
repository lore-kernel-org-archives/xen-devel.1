From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen-block: handle resize callback
Date: Tue, 29 Jan 2019 12:25:14 +0000
Message-ID: <20190129122514.GB2306__13399.9476021685$1548764784$gmane$org@perard.uk.xensource.com>
References: <20190123090849.7758-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ppmk=QF=citrix.com=prvs=925720a60=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1goSSD-0003ri-8o
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 12:25:25 +0000
Content-Disposition: inline
In-Reply-To: <20190123090849.7758-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDk6MDg6NDlBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFNvbWUgZnJvbnRlbmQgZHJpdmVycyB3aWxsIGhhbmRsZSBkeW5hbWljIHJlc2l6aW5n
IG9mIFBWIGRpc2tzLCBzbyBzZXQgdXAKPiB0aGUgQmxvY2tEZXZPcHMgcmVzaXplX2NiKCkgbWV0
aG9kIGR1cmluZyB4ZW5fYmxvY2tfcmVhbGl6ZSgpIHRvIGFsbG93Cj4gdGhpcyB0byBiZSBkb25l
LgoKIndpbGwiOiB3aGljaCBkcml2ZXJzIGFyZSB5b3UgdGhpbmtpbmcgYWJvdXQ/IFRoZSBMaW51
eCBvbmUgc2VlbXMgdG8gYmUKYWJsZSB0byBoYW5kbGUgcmVzaXplIGFscmVhZHkuCgpBYm91dCB0
aGUgTGludXggb25lLCBpdCBjaGVjayB0aGUgbmV3IHNpemUgb25seSB3aGVuIHRoZSBiYWNrZW5k
IHNldAppdHMgInN0YXRlIiB0byAiY29ubmVjdGVkIiBhZ2Fpbi4KSXQncyBmcm9udGVuZCBzZWVt
cyB0byBpbXBsZW1lbnQgcmVzaXplIHdpdGgKMWZhNzNiZTZiZTY1MDI4YTc1NDNiYmE4ZjE0NDc0
YjQyZTA2NGExYi4KVGhlcmUgaXMgdGhpcyBpcyB0aGUgc291cmNlIGNvZGU6CiAgICBzdGF0aWMg
dm9pZCBibGtmcm9udF9jb25uZWN0KHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKQogICAgewog
ICAgICAgIC8vIC4uLgogICAgICAgIHN3aXRjaCAoaW5mby0+Y29ubmVjdGVkKSB7CiAgICAgICAg
Y2FzZSBCTEtJRl9TVEFURV9DT05ORUNURUQ6CiAgICAgICAgICAgICAgICAvKgogICAgICAgICAg
ICAgICAgICogUG90ZW50aWFsbHksIHRoZSBiYWNrLWVuZCBtYXkgYmUgc2lnbmFsbGluZwogICAg
ICAgICAgICAgICAgICogYSBjYXBhY2l0eSBjaGFuZ2U7IHVwZGF0ZSB0aGUgY2FwYWNpdHkuCiAg
ICAgICAgICAgICAgICAgKi8KCkluIHRoZSBiYWNrZW5kLCBMaW51eCBkb2VzIHRoaXM6CiAgICB4
ZW5idXNfcHJpbnRmKHhidCwgZGV2LT5ub2RlbmFtZSwgInNlY3RvcnMiLCAiJWxsdSIsIC4uLgog
ICAgLyoKICAgICAqIFdyaXRlIHRoZSBjdXJyZW50IHN0YXRlOyB3ZSB3aWxsIHVzZSB0aGlzIHRv
IHN5bmNocm9uaXplCiAgICAgKiB0aGUgZnJvbnQtZW5kLiBJZiB0aGUgY3VycmVudCBzdGF0ZSBp
cyAiY29ubmVjdGVkIiB0aGUKICAgICAqIGZyb250LWVuZCB3aWxsIGdldCB0aGUgbmV3IHNpemUg
aW5mb3JtYXRpb24gb25saW5lLgogICAgICovCiAgICAgeGVuYnVzX3ByaW50Zih4YnQsIGRldi0+
bm9kZW5hbWUsICJzdGF0ZSIsICIlZCIsIGRldi0+c3RhdGUpOwoKTWF5YmUgdGhlIFFFTVUgYmFj
a2VuZCBuZWVkcyBkbyB0byB0aGUgc2FtZSB0aGluZywgYW5kIHdyaXRlIGl0cyBjdXJyZW50CnN0
YXRlIGFnYWluPwoKRnJlZUJTRCBkb2Vzbid0IHNlZW1zIHRvIGNhcmUgYWJvdXQgcmVzaXplLgoK
QW5kIHRoZXJlIGlzIG5vdGhpbmcgaW4gYmxraWYuaCBhYm91dCByZXNpemluZyA6KC4KClRoYW5r
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
