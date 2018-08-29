From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: fix SMMU driver build
Date: Wed, 29 Aug 2018 14:36:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808291436240.14449@sstabellini-ThinkPad-X260>
References: <1535500060-13958-1-git-send-email-sstabellini@kernel.org>
 <5a763a13-fe1b-fd2d-925b-c8ade748f97e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5a763a13-fe1b-fd2d-925b-c8ade748f97e@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOSBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDgvMjkvMjAxOCAxMjo0NyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
QWRkIG1pc3NpbmcgIkNPTkZJR18iCj4gCj4gSSB3b3VsZCBhZGQgdGhlIGNvbW1pdCBpZCB3aGVy
ZSB0aGUgYnVnIHdhcyBpbnRyb2R1Y2VkLgo+IAo+IEkgd2lsbCBjb21taXQgYW5kIGFkZCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2U6Cj4gCj4gVGhpcyBidWlsZCBmYWlsdXJlIHdhcyBpbnRyb2R1Y2Vk
IGJ5IGNvbW1pdCAyNzdhYTM1MjNkICJhcm06IG1ha2UgaXQgcG9zc2libGUKPiB0byBkaXNhYmxl
IHRoZSBTTU1VIGRyaXZlciIuCgpUaGFuayB5b3UhCgoKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4gLS0tCj4gPiAgIHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZSB8IDIgKy0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKPiA+IGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCj4gPiBpbmRleCAwMTU2NDMxLi5iM2VmY2ZkIDEwMDY0
NAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCj4gPiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKPiA+IEBAIC0xLDIgKzEsMiBA
QAo+ID4gICBvYmoteSArPSBpb21tdS5vCj4gPiAtb2JqLSQoQVJNX1NNTVUpICs9IHNtbXUubwo+
ID4gK29iai0kKENPTkZJR19BUk1fU01NVSkgKz0gc21tdS5vCj4gPiAKPiAKPiAtLSAKPiBKdWxp
ZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
