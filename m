From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Wed, 21 Nov 2018 04:35:13 -0800
Message-ID: <20181121123513.GF3065__29578.1923378401$1542803689$gmane$org@bombadil.infradead.org>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <20181116182836.GB17088@rapoport-lnx>
 <CAFqt6zYp0j999WXw9Jus0oZMjADQQkPfso8btv6du6L9CE3PXA@mail.gmail.com>
 <20181117143742.GB7861@bombadil.infradead.org>
 <CAFqt6zbOWX5LUTWwoGDJsGdf+pTR6N1yTPVxyr1W3-6Fte39ww@mail.gmail.com>
 <833B5050-DEF6-44A0-9832-276F86671212@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <833B5050-DEF6-44A0-9832-276F86671212@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: William Kucharski <william.kucharski@oracle.com>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, rppt@linux.ibm.com, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chi
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDQ6MTk6MTFBTSAtMDcwMCwgV2lsbGlhbSBLdWNoYXJz
a2kgd3JvdGU6Cj4gQ291bGQgeW91IGFkZCBhIGxpbmUgdG8gdGhlIGRlc2NyaXB0aW9uIGV4cGxp
Y2l0bHkgc3RhdGluZyB0aGF0IGEgZmFpbHVyZQo+IHRvIGluc2VydCBhbnkgcGFnZSBpbiB0aGUg
cmFuZ2Ugd2lsbCBmYWlsIHRoZSBlbnRpcmUgcm91dGluZSwgc29tZXRoaW5nCj4gbGlrZToKPiAK
PiA+ICogVGhpcyBhbGxvd3MgZHJpdmVycyB0byBpbnNlcnQgcmFuZ2Ugb2Yga2VybmVsIHBhZ2Vz
IHRoZXkndmUgYWxsb2NhdGVkCj4gPiAqIGludG8gYSB1c2VyIHZtYS4gVGhpcyBpcyBhIGdlbmVy
aWMgZnVuY3Rpb24gd2hpY2ggZHJpdmVycyBjYW4gdXNlCj4gPiAqIHJhdGhlciB0aGFuIHVzaW5n
IHRoZWlyIG93biB3YXkgb2YgbWFwcGluZyByYW5nZSBvZiBrZXJuZWwgcGFnZXMgaW50bwo+ID4g
KiB1c2VyIHZtYS4KPiA+ICoKPiA+ICogQSBmYWlsdXJlIHRvIGluc2VydCBhbnkgcGFnZSBpbiB0
aGUgcmFuZ2Ugd2lsbCBmYWlsIHRoZSBjYWxsIGFzIGEgd2hvbGUuCj4gCj4gSXQncyBvYnZpb3Vz
IHdoZW4gcmVhZGluZyB0aGUgY29kZSwgYnV0IGl0IHdvdWxkIGJlIHNlbGYtZG9jdW1lbnRpbmcg
dG8KPiBzdGF0ZSBpdCBvdXRyaWdodC4KCkl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIGJlIG1vcmUg
ZXhwbGljaXQgYW5kIGFuc3dlciBSYW5keSdzIHF1ZXN0aW9uOgoKICogSWYgd2UgZmFpbCB0byBp
bnNlcnQgYW55IHBhZ2UgaW50byB0aGUgdm1hLCB0aGUgZnVuY3Rpb24gd2lsbCByZXR1cm4KICog
aW1tZWRpYXRlbHkgbGVhdmluZyBhbnkgcHJldmlvdXNseS1pbnNlcnRlZCBwYWdlcyBwcmVzZW50
LiAgQ2FsbGVycwogKiBmcm9tIHRoZSBtbWFwIGhhbmRsZXIgbWF5IGltbWVkaWF0ZWx5IHJldHVy
biB0aGUgZXJyb3IgYXMgdGhlaXIKICogY2FsbGVyIHdpbGwgZGVzdHJveSB0aGUgdm1hLCByZW1v
dmluZyBhbnkgc3VjY2Vzc2Z1bGx5LWluc2VydGVkIHBhZ2VzLgogKiBPdGhlciBjYWxsZXJzIHNo
b3VsZCBtYWtlIHRoZWlyIG93biBhcnJhbmdlbWVudHMgZm9yIGNhbGxpbmcgdW5tYXBfcmVnaW9u
KCkuCgpBbHRob3VnaCB1bm1hcF9yZWdpb24oKSBpcyBzdGF0aWMgc28gdGhlcmUgY2xlYXJseSBp
c24ndCBhbnkgY29kZSBpbiB0aGUKa2VybmVsIHRvZGF5IG90aGVyIHRoYW4gaW4gbW1hcCBoYW5k
bGVycyAob3IgZmF1bHQgaGFuZGxlcnMpIHRoYXQgbmVlZHMgdG8KaW5zZXJ0IHBhZ2VzIGludG8g
YSBWTUEuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
