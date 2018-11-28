From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Wed, 28 Nov 2018 16:21:05 +0100
Message-ID: <3555131.qyOKUBSTPx__40043.6745294884$1543418748$gmane$org@diego>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: mhocko@suse.com, peterz@infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net, m.szyprowski@samsung.com, sfr@canb.auug.org.au, oleksandr_andrushchenko@epam.com, joro@8bytes.org, linux@armlinux.org.uk, willy@infradead.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, keescook@chromium.org, pawel@osciak.com, riel@surriel.com, iommu@lists.linux-foundation.org, rppt@linux.vnet.ibm.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, jgross@suse.com, hjc@rock-chips.com, xen-devel@lists.xen.org, kyungmin.park@samsung.com, stefanr@s5r6.in-berlin.de, akpm@linux-foundation.org, robin.murphy@arm.com, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

QW0gRG9ubmVyc3RhZywgMTUuIE5vdmVtYmVyIDIwMTgsIDE2OjQ1OjMwIENFVCBzY2hyaWViIFNv
dXB0aWNrIEpvYXJkZXI6Cj4gUHJldmlvdWx5IGRyaXZlcnMgaGF2ZSB0aGVpciBvd24gd2F5IG9m
IG1hcHBpbmcgcmFuZ2Ugb2YKPiBrZXJuZWwgcGFnZXMvbWVtb3J5IGludG8gdXNlciB2bWEgYW5k
IHRoaXMgd2FzIGRvbmUgYnkKPiBpbnZva2luZyB2bV9pbnNlcnRfcGFnZSgpIHdpdGhpbiBhIGxv
b3AuCj4gCj4gQXMgdGhpcyBwYXR0ZXJuIGlzIGNvbW1vbiBhY3Jvc3MgZGlmZmVyZW50IGRyaXZl
cnMsIGl0IGNhbgo+IGJlIGdlbmVyYWxpemVkIGJ5IGNyZWF0aW5nIGEgbmV3IGZ1bmN0aW9uIGFu
ZCB1c2UgaXQgYWNyb3NzCj4gdGhlIGRyaXZlcnMuCj4gCj4gdm1faW5zZXJ0X3JhbmdlIGlzIHRo
ZSBuZXcgQVBJIHdoaWNoIHdpbGwgYmUgdXNlZCB0byBtYXAgYQo+IHJhbmdlIG9mIGtlcm5lbCBt
ZW1vcnkvcGFnZXMgdG8gdXNlciB2bWEuCj4gCj4gU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9h
cmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgV2lsY294
IDx3aWxseUBpbmZyYWRlYWQub3JnPgoKRXhjZXB0IHRoZSBtaXNzaW5nIEVYUE9SVF9TWU1CT0wg
Zm9yIG1vZHVsZSBidWlsZHMgdGhpcyBuZXcKQVBJIGlzIHN1cHBvc2VkIHRvIHJ1biBhbHNvIHdp
dGhpbiB0aGUgUm9ja2NoaXAgZHJtIGRyaXZlciwgc28Kb24gcmszMTg4LCByazMyODgsIHJrMzMy
OCBhbmQgcmszMzk5IHdpdGggZ3JhcGhpY3MKVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVp
a29Ac250ZWNoLmRlPgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
