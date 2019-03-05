From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] Revert "swiotlb: remove SWIOTLB_MAP_ERROR"
Date: Tue, 5 Mar 2019 09:41:46 +0000
Message-ID: <957e168a-2589-89c7-3a72-5071a7b6c65a__44194.3582425424$1551778968$gmane$org@arm.com>
References: <20190304195951.1118807-1-arnd@arndb.de>
 <b0b995a1-3211-870f-01af-ce837c18e8f9@arm.com>
 <CAK8P3a2KQKTDQCQcFR7ZTFJ+_XhfKpy9W27r+YV=iD6hLVu2xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6IM3=RI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h16aA-00005G-AX
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 09:41:54 +0000
In-Reply-To: <CAK8P3a2KQKTDQCQcFR7ZTFJ+_XhfKpy9W27r+YV=iD6hLVu2xg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQXJuZCwKCk9uIDMvNS8xOSA4OjE2IEFNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIFR1
ZSwgTWFyIDUsIDIwMTkgYXQgMTI6NTYgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4gd3JvdGU6Cj4+IE9uIDIwMTktMDMtMDQgNzo1OSBwbSwgQXJuZCBCZXJnbWFubiB3cm90
ZToKPj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYjkwN2UyMDUwOGQwICgic3dpb3RsYjogcmVtb3Zl
IFNXSU9UTEJfTUFQX0VSUk9SIiksIHdoaWNoCj4+PiBpbnRyb2R1Y2VkIGFuIG92ZXJmbG93IHdh
cm5pbmcgaW4gY29uZmlndXJhdGlvbnMgdGhhdCBoYXZlIGEgbGFyZ2VyCj4+PiBkbWFfYWRkcl90
IHRoYW4gcGh5c19hZGRyX3Q6Cj4+Pgo+Pj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUv
bGludXgvZG1hLWRpcmVjdC5oOjUsCj4+PiAgICAgICAgICAgICAgICAgICAgZnJvbSBrZXJuZWwv
ZG1hL3N3aW90bGIuYzoyMzoKPj4+IGtlcm5lbC9kbWEvc3dpb3RsYi5jOiBJbiBmdW5jdGlvbiAn
c3dpb3RsYl90YmxfbWFwX3NpbmdsZSc6Cj4+PiBpbmNsdWRlL2xpbnV4L2RtYS1tYXBwaW5nLmg6
MTM2OjI4OiBlcnJvcjogY29udmVyc2lvbiBmcm9tICdsb25nIGxvbmcgdW5zaWduZWQgaW50JyB0
byAncGh5c19hZGRyX3QnIHtha2EgJ3Vuc2lnbmVkIGludCd9IGNoYW5nZXMgdmFsdWUgZnJvbSAn
MTg0NDY3NDQwNzM3MDk1NTE2MTUnIHRvICc0Mjk0OTY3Mjk1JyBbLVdlcnJvcj1vdmVyZmxvd10K
Pj4+ICAgICNkZWZpbmUgRE1BX01BUFBJTkdfRVJST1IgICh+KGRtYV9hZGRyX3QpMCkKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4+IGtlcm5lbC9kbWEvc3dpb3RsYi5jOjU0
NDo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ0RNQV9NQVBQSU5HX0VSUk9SJwo+Pj4g
ICAgIHJldHVybiBETUFfTUFQUElOR19FUlJPUjsKPj4+Cj4+PiBUaGUgY29uZmlndXJhdGlvbiB0
aGF0IGNhdXNlZCB0aGlzIGlzIG9uIDMyLWJpdCBBUk0sIHdoZXJlIHRoZSBETUEgYWRkcmVzcwo+
Pj4gc3BhY2UgZGVwZW5kcyBvbiB0aGUgZW5hYmxlZCBoYXJkd2FyZSBwbGF0Zm9ybXMsIHdoaWxl
IHRoZSBwaHlzaWNhbAo+Pj4gYWRkcmVzcyBzcGFjZSBkZXBlbmRzIG9uIHRoZSB0eXBlIG9mIE1N
VSBjaG9zZW4gKGNsYXNzaWMgdnMgTFBBRSkuCj4+Cj4+IEFyZSB0aGVzZSByZWFsIHBsYXRmb3Jt
cywgb3IgcmFuZG9tIGNvbmZpZ3M/IFJlYWxpc3RpY2FsbHkgSSBkb24ndCBzZWUgYQo+PiBncmVh
dCBkZWFsIG9mIG5lZWQgdG8gc3VwcG9ydCBETUFfQUREUl9UXzY0QklUIGZvciBub24tTFBBRS4K
Pj4gUGFydGljdWxhcmx5IGluIHRoaXMgY2FzZSBzaW5jZSBBRkFJSyB0aGUgb25seSBzZWxlY3Rv
ciBvZiBTV0lPVExCIG9uCj4+IEFybSBpcyBYZW4sIGFuZCB0aGF0IGJ5IGRlZmluaXRpb24gaXMg
bmV2ZXIgZ29pbmcgdG8gYmUgdXNlZnVsIG9uCj4+IG5vbi1MUEFFIGhhcmR3YXJlLgo+IC4uLgo+
IE9uIE1vbiwgTWFyIDQsIDIwMTkgYXQgMTE6MDAgUE0gS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4g
PGtvbnJhZC53aWxrQG9yYWNsZS5jb20+IHdyb3RlOgo+PiBXaGF0IGFib3V0IG1ha2luZyB0aGUg
cGh5c19hZGRyX3QgYW5kIGRtYV9hZGRyX3QgaGF2ZSB0aGUgc2FtZQo+PiB3aWR0aCB3aXRoIHNv
bWUgbWFnaWMgI2lmZGVmIGhhY2tlcnk/Cj4gCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIG9ubHkg
cmFuZGNvbmZpZyBidWlsZHMgc2VlIHRoaXMgcHJvYmxlbSwgaW4KPiByZWFsIHN5c3RlbXMgcGh5
c19hZGRyX3QgaXMgbm9ybWFsbHkgdGhlIHNhbWUgYXMgZG1hX2FkZHJfdCwKPiBhbmQgeW91IGNv
dWxkIHJlYXNvbmFibHkgaGF2ZSBhIG1hY2hpbmUgd2l0aCBhIGxhcmdlciBwaHlzX2FkZHJfdAo+
IHRoYW4gZG1hX2FkZHJfdCBidXQgd291bGRuJ3QgbmVlZCB0byBib3RoZXIuCgpPbiBYZW4sIGRt
YV9hZGRyX3Qgd2lsbCBhbHdheXMgYmUgNjQtYml0IHdoaWxlIHRoZSBwaHlzX2FkZHJfdCB3aWxs
IApkZXBlbmQgb24gdGhlIE1NVSB0eXBlLiBTbyB3ZSBtYXkgaGF2ZSBwaHlzX2FkZHJfdCBzbWFs
bGVyIHRoYW4gCmRtYV9hZGRyX3QgZnJvbSB0aGUga2VybmVsIHBvaW50IG9mIHZpZXcuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
