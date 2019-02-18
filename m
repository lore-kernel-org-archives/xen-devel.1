From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] dataplane/xen-block:
 remove dead code
Date: Mon, 18 Feb 2019 14:27:31 +0000
Message-ID: <20190218142731.GA1349@perard.uk.xensource.com>
References: <20190215162533.19475-1-paul.durrant@citrix.com>
 <20190215162533.19475-2-paul.durrant@citrix.com>
 <9c6c6f2e-cac0-9e75-d5e2-baf613aad6b7@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRWY=QZ=citrix.com=prvs=945ef7921=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gvjtV-0001lC-CK
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 14:27:41 +0000
Content-Disposition: inline
In-Reply-To: <9c6c6f2e-cac0-9e75-d5e2-baf613aad6b7@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTUsIDIwMTkgYXQgMDk6Mzg6NTlQTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gT24gMi8xNS8xOSA1OjI1IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4gPiBUaGUgaWYoKSBzdGF0ZW1lbnQgaXMgY2xlYXJseSBib2d1cyAoZGVhZCBjb2RlIHdoaWNo
IHNob3VsZCBoYXZlIGJlZW4KPiA+IGNsZWFuZWQgdXAgd2hlbiBncmFudCBtYXBwaW5nIHdhcyBy
ZW1vdmVkKS4KPiAKPiAiLi4uIHdhcyByZW1vdmVkIGluIDA2NDU0YzI0YWQpLiIKCkFjdHVhbGx5
LCBpdCBsb29rcyBsaWtlIGM2MDI1YmQxOTcgc2hvdWxkIGhhdmUgcmVtb3ZlIHRoZSBpZiBzdGF0
ZW1lbnQuCgo+ID4gCj4gPiBTcG90dGVkIGJ5IENvdmVyaXR5OiBDSUQgMTM5ODYzNQo+ID4gCj4g
PiBXaGlsZSBpbiB0aGUgbmVpZ2hib3VyaG9vZCwgYWRkIGEgbWlzc2luZyAnZmFsbCB0aHJvdWdo
JyBhbm5vdGF0aW9uLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
