From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 1/9] mm: Introduce new vm_insert_range API
Date: Fri, 7 Dec 2018 09:11:16 -0800
Message-ID: <20181207171116.GA29923__14099.2561974146$1544202676$gmane$org@bombadil.infradead.org>
References: <20181206183945.GA20932@jordon-HP-15-Notebook-PC>
 <53bbc095-c9f5-5d6a-6e50-6e060d17eb68@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <53bbc095-c9f5-5d6a-6e50-6e060d17eb68@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mhocko@suse.com, heiko@sntech.de, peterz@infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net, m.szyprowski@samsung.com, sfr@canb.auug.org.au, oleksandr_andrushchenko@epam.com, joro@8bytes.org, linux@armlinux.org.uk, iommu@lists.linux-foundation.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, keescook@chromium.org, pawel@osciak.com, riel@surriel.com, rppt@linux.vnet.ibm.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, jgross@suse.com, hjc@rock-chips.com, xen-devel@lists.xen.org, kyungmin.park@samsung.com, stefanr@s5r6.in-berlin.de, Souptick Joarder <jrdr.linux@gmail.com>, akpm@linux-foundation.org, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMDcsIDIwMTggYXQgMDM6MzQ6NTZQTSArMDAwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+ID4gK2ludCB2bV9pbnNlcnRfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ICsJCQlzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1bnNpZ25l
ZCBsb25nIHBhZ2VfY291bnQpCj4gPiArewo+ID4gKwl1bnNpZ25lZCBsb25nIHVhZGRyID0gYWRk
cjsKPiA+ICsJaW50IHJldCA9IDAsIGk7Cj4gCj4gU29tZSBvZiB0aGUgc2l0ZXMgYmVpbmcgcmVw
bGFjZWQgd2VyZSBlZmZlY3RpdmVseSBlbnN1cmluZyB0aGF0IHZtYSBhbmQKPiBwYWdlcyB3ZXJl
IG11dHVhbGx5IGNvbXBhdGlibGUgYXMgYW4gaW5pdGlhbCBjb25kaXRpb24gLSB3b3VsZCBpdCBi
ZSB3b3J0aAo+IGFkZGluZyBzb21ldGhpbmcgaGVyZSBmb3Igcm9idXN0bmVzcywgZS5nLjoKPiAK
PiArCWlmIChwYWdlX2NvdW50ICE9IHZtYV9wYWdlcyh2bWEpKQo+ICsJCXJldHVybiAtRU5YSU87
CgpJIHRoaW5rIHdlIHdhbnQgdG8gYWxsb3cgdGhpcyB0byBiZSB1c2VkIHRvIHBvcHVsYXRlIHBh
cnQgb2YgYSBWTUEuClNvIHBlcmhhcHM6CgoJaWYgKHBhZ2VfY291bnQgPiB2bWFfcGFnZXModm1h
KSkKCQlyZXR1cm4gLUVOWElPOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
