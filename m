From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Thu, 15 Nov 2018 22:40:49 -0800
Message-ID: <20181116064049.GA5320__11510.4616656483$1542350452$gmane$org@bombadil.infradead.org>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <9655a12e-bd3d-aca2-6155-38924028eb5d@infradead.org>
 <CAFqt6zbLjtDab3Bz67trbnQRQdutvgA=YvAFhoW4bxsg657mGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <CAFqt6zbLjtDab3Bz67trbnQRQdutvgA=YvAFhoW4bxsg657mGQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, Randy Dunlap <rdunlap@infradead.>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMTE6MDA6MzBBTSArMDUzMCwgU291cHRpY2sgSm9hcmRl
ciB3cm90ZToKPiBPbiBUaHUsIE5vdiAxNSwgMjAxOCBhdCAxMTo0NCBQTSBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiBPbiAxMS8xNS8xOCA3OjQ1IEFNLCBT
b3VwdGljayBKb2FyZGVyIHdyb3RlOgo+ID4gV2hhdCBpcyB0aGUgb3Bwb3NpdGUgb2Ygdm1faW5z
ZXJ0X3JhbmdlKCkgb3IgZXZlbiBvZiB2bV9pbnNlcnRfcGFnZSgpPwo+ID4gb3IgaXMgdGhlcmUg
bm8gbmVlZCBmb3IgdGhhdD8KPiAKPiBUaGVyZSBpcyBubyBvcHBvc2l0ZSBmdW5jdGlvbiBvZiB2
bV9pbnNlcnRfcmFuZ2UoKSAvIHZtX2luc2VydF9wYWdlKCkuCj4gTXkgdW5kZXJzdGFuZGluZyBp
cywgaW4gY2FzZSBvZiBhbnkgZXJyb3IsIG1tYXAgaGFuZGxlcnMgd2lsbCByZXR1cm4gdGhlCj4g
ZXJyIHRvIHVzZXIgcHJvY2VzcyBhbmQgdXNlciBzcGFjZSB3aWxsIGRlY2lkZSB0aGUgbmV4dCBh
Y3Rpb24uIFNvIG5leHQKPiB0aW1lIHdoZW4gbW1hcCBoYW5kbGVyIGlzIGdldHRpbmcgaW52b2tl
ZCBpdCB3aWxsIG1hcCBmcm9tIHRoZSBiZWdpbm5pbmcuCj4gQ29ycmVjdCBtZSBpZiBJIGFtIHdy
b25nLgoKVGhlIG9wcG9zaXRlIGZ1bmN0aW9uLCBJIHN1cHBvc2UsIGlzIHVubWFwX3JlZ2lvbigp
LgoKPiA+IHMvbm8uL251bWJlci8KPiAKPiBJIGRpZG4ndCBnZXQgaXQgPz8KClRoaXMgaXMgYSAn
c2VkJyBleHByZXNzaW9uLiAgJ3MnIGlzIHRoZSAnc3Vic3RpdHV0ZScgY29tbWFuZDsgdGhlIC8K
aXMgYSBzZXBhcmF0b3IsICduby4nIGlzIHdoYXQgeW91IHdyb3RlLCBhbmQgJ251bWJlcicgaXMg
d2hhdCBSYW5keQppcyByZWNvbW1lbmRpbmcgaW5zdGVhZC4KCj4gPiA+ICsgICAgIGZvciAoaSA9
IDA7IGkgPCBwYWdlX2NvdW50OyBpKyspIHsKPiA+ID4gKyAgICAgICAgICAgICByZXQgPSB2bV9p
bnNlcnRfcGFnZSh2bWEsIHVhZGRyLCBwYWdlc1tpXSk7Cj4gPiA+ICsgICAgICAgICAgICAgaWYg
KHJldCA8IDApCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4KPiA+
IEZvciBhIG5vbi10cml2aWFsIHZhbHVlIG9mIHBhZ2VfY291bnQ6Cj4gPiBJcyBpdCBhIHByb2Js
ZW0gaWYgdm1faW5zZXJ0X3BhZ2UoKSBzdWNjZWVkcyBmb3Igc2V2ZXJhbCBwYWdlcwo+ID4gYW5k
IHRoZW4gZmFpbHM/Cj4gCj4gTm8sIGl0IHdpbGwgYmUgY29uc2lkZXJlZCBhcyB0b3RhbCBmYWls
dXJlIGFuZCBtbWFwIGhhbmRsZXIgd2lsbCByZXR1cm4KPiB0aGUgZXJyIHRvIHVzZXIgc3BhY2Uu
CgpJIHRoaW5rIHdoYXQgUmFuZHkgbWVhbnMgaXMgIldoYXQgaGFwcGVucyB0byB0aGUgaW5zZXJ0
ZWQgcGFnZXM/IiBhbmQKdGhlIGFuc3dlciBpcyB0aGF0IG1tYXBfcmVnaW9uKCkganVtcHMgdG8g
dGhlICd1bm1hcF9hbmRfZnJlZV92bWEnCmxhYmVsLCB3aGljaCBpcyBhbiBhY2N1cmF0ZSBuYW1l
LgoKVGhhbmtzIGZvciBsb29raW5nLCBSYW5keS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
