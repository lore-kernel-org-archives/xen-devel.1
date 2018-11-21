From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH 0/9] Use vm_insert_range
Date: Wed, 21 Nov 2018 11:54:52 +0530
Message-ID: <CAFqt6zZGP5DnAQd_19xKcLezOYaLsZpPr=FGxiTb7JRjTEJ4cA__6318.72656890682$1542781437$gmane$org@mail.gmail.com>
References: <20181115154314.GA27850@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181115154314.GA27850@jordon-HP-15-Notebook-PC>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, vbabka@suse.cz, Rik van Riel <riel@surriel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, rppt@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, robin.murphy@arm.com, iamjoonsoo.kim@lge.com, treding@nvidia.com, Kees Cook <keescook@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, stefanr@s5r6.in-berlin.de, hjc@rock-chips.com, Heiko Stuebner <heiko@sntech.de>, airlied@linux.ie, oleksandr_andrushchenko@epam.com, joro@8bytes.org, pawel@osciak.com, Kyungmin Park <kyungmin.park@samsung.com>, mchehab@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org, Linux-MM <linux-mm@kvack.org>, iommu@lists.linux-foundation.org, linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgOTowOSBQTSBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQcmV2aW91bHkgZHJpdmVycyBoYXZlIHRoZWlyIG93
biB3YXkgb2YgbWFwcGluZyByYW5nZSBvZgo+IGtlcm5lbCBwYWdlcy9tZW1vcnkgaW50byB1c2Vy
IHZtYSBhbmQgdGhpcyB3YXMgZG9uZSBieQo+IGludm9raW5nIHZtX2luc2VydF9wYWdlKCkgd2l0
aGluIGEgbG9vcC4KPgo+IEFzIHRoaXMgcGF0dGVybiBpcyBjb21tb24gYWNyb3NzIGRpZmZlcmVu
dCBkcml2ZXJzLCBpdCBjYW4KPiBiZSBnZW5lcmFsaXplZCBieSBjcmVhdGluZyBhIG5ldyBmdW5j
dGlvbiBhbmQgdXNlIGl0IGFjcm9zcwo+IHRoZSBkcml2ZXJzLgo+Cj4gdm1faW5zZXJ0X3Jhbmdl
IGlzIHRoZSBuZXcgQVBJIHdoaWNoIHdpbGwgYmUgdXNlZCB0byBtYXAgYQo+IHJhbmdlIG9mIGtl
cm5lbCBtZW1vcnkvcGFnZXMgdG8gdXNlciB2bWEuCj4KPiBBbGwgdGhlIGFwcGxpY2FibGUgcGxh
Y2VzIGFyZSBjb252ZXJ0ZWQgdG8gdXNlIG5ldyB2bV9pbnNlcnRfcmFuZ2UKPiBpbiB0aGlzIHBh
dGNoIHNlcmllcy4KPgo+IFNvdXB0aWNrIEpvYXJkZXIgKDkpOgo+ICAgbW06IEludHJvZHVjZSBu
ZXcgdm1faW5zZXJ0X3JhbmdlIEFQSQo+ICAgYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYzogQ29u
dmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlCj4gICBkcml2ZXJzL2ZpcmV3aXJlL2NvcmUtaXNv
LmM6IENvbnZlcnQgdG8gdXNlIHZtX2luc2VydF9yYW5nZQo+ICAgZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV9nZW0uYzogQ29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlCj4gICBkcm0veGVu
L3hlbl9kcm1fZnJvbnRfZ2VtLmM6IENvbnZlcnQgdG8gdXNlIHZtX2luc2VydF9yYW5nZQo+ICAg
aW9tbXUvZG1hLWlvbW11LmM6IENvbnZlcnQgdG8gdXNlIHZtX2luc2VydF9yYW5nZQo+ICAgdmlk
ZW9idWYyL3ZpZGVvYnVmMi1kbWEtc2cuYzogQ29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3Jhbmdl
Cj4gICB4ZW4vZ250ZGV2LmM6IENvbnZlcnQgdG8gdXNlIHZtX2luc2VydF9yYW5nZQo+ICAgeGVu
L3ByaXZjbWQtYnVmLmM6IENvbnZlcnQgdG8gdXNlIHZtX2luc2VydF9yYW5nZQoKQW55IGZ1cnRo
ZXIgY29tbWVudCBvbiBkcml2ZXIgY2hhbmdlcyA/Cj4KPiAgYXJjaC9hcm0vbW0vZG1hLW1hcHBp
bmcuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIxICsrKysrKy0tLS0tLS0tLS0tCj4gIGRy
aXZlcnMvZmlyZXdpcmUvY29yZS1pc28uYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNSArKy0t
LS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYyAg
ICAgICB8IDIwICsrLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250X2dlbS5jICAgICAgICAgICB8IDIwICsrKysrLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9p
b21tdS9kbWEtaW9tbXUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrLS0tLS0tLS0K
PiAgZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi1kbWEtc2cuYyB8IDIz
ICsrKysrKy0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy94ZW4vZ250ZGV2LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDExICsrKystLS0tLQo+ICBkcml2ZXJzL3hlbi9wcml2Y21kLWJ1
Zi5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKystLS0tLQo+ICBpbmNsdWRlL2xpbnV4
L21tX3R5cGVzLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCj4gIG1tL21lbW9y
eS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKwo+ICBtbS9ub21tdS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDcgKysrKysrCj4gIDExIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMo
KyksIDk4IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAxLjkuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
