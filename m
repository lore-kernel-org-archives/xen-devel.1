From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/3] xen-block: report error condition from
 vbd_name_to_disk()
Date: Mon, 18 Feb 2019 15:43:30 +0000
Message-ID: <20190218154330.GC1349__33417.4707809993$1550504690$gmane$org@perard.uk.xensource.com>
References: <20190215162533.19475-1-paul.durrant@citrix.com>
 <20190215162533.19475-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRWY=QZ=citrix.com=prvs=945ef7921=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gvl4y-0000Ws-Un
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 15:43:36 +0000
Content-Disposition: inline
In-Reply-To: <20190215162533.19475-4-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTUsIDIwMTkgYXQgMDQ6MjU6MzNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBmdW5jdGlvbiBuZWVkcyB0byBtYWtlIHN1cmUgaXQgaXMgcGFzc2VkIGEgdmFs
aWQgZGlzayBuYW1lLiBUaGlzIGlzCj4gZWFzaWx5IGRvbmUgYnkgbWFraW5nIHN1cmUgdGhhdCB0
aGUgcGFyc2luZyBsb29wIHJlc3VsdHMgaW4gYSBub24temVybwo+IHZhbHVlLgo+IAo+IFNwb3R0
ZWQgYnkgQ292ZXJpdHk6IENJRCAxMzk4NjQwCj4gCj4gUmVwb3J0ZWQtYnk6IFBldGVyIE1heWRl
bGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
