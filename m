From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/9] Use vm_insert_range
Date: Wed, 21 Nov 2018 15:04:27 -0500
Message-ID: <fcaff67b-5ce0-d981-5820-9e587b98abee__13812.9423060038$1542830676$gmane$org@oracle.com>
References: <20181115154314.GA27850@jordon-HP-15-Notebook-PC>
 <CAFqt6zZGP5DnAQd_19xKcLezOYaLsZpPr=FGxiTb7JRjTEJ4cA@mail.gmail.com>
 <0c6f1144-6ee0-29df-5e1f-d35d2264e06e@oracle.com>
 <CAFqt6zavi-S9ySZJTKG9zChacSD+ZCOVyyW71B1DfjggTH=Jkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFqt6zavi-S9ySZJTKG9zChacSD+ZCOVyyW71B1DfjggTH=Jkg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, iommu@lists.linux-foundation.org, rppt@linux.vnet.ibm.com, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chips.com, xen-devel@lists.xen.
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMjo1NiBQTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiBPbiBUaHUsIE5v
diAyMiwgMjAxOCBhdCAxOjA4IEFNIEJvcmlzIE9zdHJvdnNreQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDExLzIxLzE4IDE6MjQgQU0sIFNvdXB0aWNrIEpvYXJk
ZXIgd3JvdGU6Cj4+PiBPbiBUaHUsIE5vdiAxNSwgMjAxOCBhdCA5OjA5IFBNIFNvdXB0aWNrIEpv
YXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPiB3cm90ZToKPj4+PiBQcmV2aW91bHkgZHJpdmVy
cyBoYXZlIHRoZWlyIG93biB3YXkgb2YgbWFwcGluZyByYW5nZSBvZgo+Pj4+IGtlcm5lbCBwYWdl
cy9tZW1vcnkgaW50byB1c2VyIHZtYSBhbmQgdGhpcyB3YXMgZG9uZSBieQo+Pj4+IGludm9raW5n
IHZtX2luc2VydF9wYWdlKCkgd2l0aGluIGEgbG9vcC4KPj4+Pgo+Pj4+IEFzIHRoaXMgcGF0dGVy
biBpcyBjb21tb24gYWNyb3NzIGRpZmZlcmVudCBkcml2ZXJzLCBpdCBjYW4KPj4+PiBiZSBnZW5l
cmFsaXplZCBieSBjcmVhdGluZyBhIG5ldyBmdW5jdGlvbiBhbmQgdXNlIGl0IGFjcm9zcwo+Pj4+
IHRoZSBkcml2ZXJzLgo+Pj4+Cj4+Pj4gdm1faW5zZXJ0X3JhbmdlIGlzIHRoZSBuZXcgQVBJIHdo
aWNoIHdpbGwgYmUgdXNlZCB0byBtYXAgYQo+Pj4+IHJhbmdlIG9mIGtlcm5lbCBtZW1vcnkvcGFn
ZXMgdG8gdXNlciB2bWEuCj4+Pj4KPj4+PiBBbGwgdGhlIGFwcGxpY2FibGUgcGxhY2VzIGFyZSBj
b252ZXJ0ZWQgdG8gdXNlIG5ldyB2bV9pbnNlcnRfcmFuZ2UKPj4+PiBpbiB0aGlzIHBhdGNoIHNl
cmllcy4KPj4+Pgo+Pj4+IFNvdXB0aWNrIEpvYXJkZXIgKDkpOgo+Pj4+ICAgbW06IEludHJvZHVj
ZSBuZXcgdm1faW5zZXJ0X3JhbmdlIEFQSQo+Pj4+ICAgYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcu
YzogQ29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlCj4+Pj4gICBkcml2ZXJzL2ZpcmV3aXJl
L2NvcmUtaXNvLmM6IENvbnZlcnQgdG8gdXNlIHZtX2luc2VydF9yYW5nZQo+Pj4+ICAgZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYzogQ29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3Jhbmdl
Cj4+Pj4gICBkcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmM6IENvbnZlcnQgdG8gdXNlIHZtX2lu
c2VydF9yYW5nZQo+Pj4+ICAgaW9tbXUvZG1hLWlvbW11LmM6IENvbnZlcnQgdG8gdXNlIHZtX2lu
c2VydF9yYW5nZQo+Pj4+ICAgdmlkZW9idWYyL3ZpZGVvYnVmMi1kbWEtc2cuYzogQ29udmVydCB0
byB1c2Ugdm1faW5zZXJ0X3JhbmdlCj4+Pj4gICB4ZW4vZ250ZGV2LmM6IENvbnZlcnQgdG8gdXNl
IHZtX2luc2VydF9yYW5nZQo+Pj4+ICAgeGVuL3ByaXZjbWQtYnVmLmM6IENvbnZlcnQgdG8gdXNl
IHZtX2luc2VydF9yYW5nZQo+Pj4gQW55IGZ1cnRoZXIgY29tbWVudCBvbiBkcml2ZXIgY2hhbmdl
cyA/Cj4+IFhlbiBkcml2ZXJzICh0aGUgbGFzdCB0d28gcGF0Y2hlcykgbG9vayBmaW5lIHRvIG1l
Lgo+IFRoYW5rcywgY2FuIEkgY29uc2lkZXJlZCB0aGlzIGFzIFJldmlld2VkLWJ5ID8KCgpSZXZp
ZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
