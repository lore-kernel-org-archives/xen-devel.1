From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Fri, 23 Nov 2018 13:27:05 +0000
Message-ID: <9a5c5731-50fe-76ca-354a-3eb05fba41e6@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
 <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
 <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
 <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
 <4ceea0f6-ede1-420a-d3b7-80c4584739ce@arm.com>
 <2199be43-ef12-28c3-4dcb-cac404be1e4d@gmail.com>
 <20181122180401.0f1d21a0@donnerap.cambridge.arm.com>
 <969c7156-162b-09b0-f328-03dadee06461@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <969c7156-162b-09b0-f328-03dadee06461@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy8xMS8yMDE4IDEyOjU4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEFuZHJl
LAo+IAo+IE9uIDIyLjExLjE4IDIwOjA0LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4KPj4gSXMg
dGhhdCBiZW5jaG1hcmsgY2hvc2VuIHRvIHB1dCBzb21lIGludGVycnVwdCBsb2FkIG9uIHRoZSBz
eXN0ZW0/IE9yCj4+IGlzIHRoYXQgd2hhdCB0aGUgY3VzdG9tZXIgYWN0dWFsbHkgdXNlcyBhbmQg
c2hlIGlzIHJlYWxseSBzdWZmZXJpbmcKPj4gZnJvbSBYZW4ncyBpbnRlcnJ1cHQgaGFuZGxpbmcg
YW5kIGVtdWxhdGlvbj8KPiBUaGF0IGl0IHRoZSAzRCBiZW5jaG1hcmsgdXNlZCBieSBjdXN0b21l
ciB0byBjb21wYXJlIHZpcnR1YWxpemF0aW9uIHNvbHV0aW9ucyAKPiBmcm9tIGRpZmZlcmVudCBw
cm92aWRlcnMuCj4gCj4+IElmIHlvdSBjaG9zZSB0aGlzIGJlbmNobWFyayBiZWNhdXNlIGl0IHRl
bmRzIHRvIHRyaWdnZXIgYSBsb3Qgb2YKPj4gaW50ZXJydXB0cyBhbmQgeW91IGhvcGUgdG8gZXN0
aW1hdGUgc29tZSBvdGhlciBpbnRlcnJ1cHQgcHJvcGVydHkgd2l0aAo+PiB0aGlzIChmb3IgaW5z
dGFuY2UgaW50ZXJydXB0IGxhdGVuY3kgb3IgdHlwaWNhbCBMUiB1dGlsaXNhdGlvbiksIHRoZW4K
Pj4geW91IG1pZ2h0IGJlIGRpc2FwcG9pbnRlZC4gVGhpcyBzZWVtcyB0byBnbyBpbnRvIHRoZSBk
aXJlY3Rpb24gb2YgYW4KPj4gaW50ZXJydXB0IHN0b3JtLCB3aGVyZSB3ZSByZWFsbHkgZG9uJ3Qg
Y2FyZSBhYm91dCBwZXJmb3JtYW5jZSwgYnV0IGp1c3QKPj4gd2FudCB0b8KgIG1ha2Ugc3VyZSB3
ZSBrZWVwIHJ1bm5pbmcgYW5kIGlkZWFsbHkgZG9uJ3QgcGVuYWxpc2Ugb3RoZXIKPj4gZ3Vlc3Rz
Lgo+IFdlbGwsIHRoYXQgYmVuY2htYXJrIGl0c2VsZiBpcyByYXRoZXIgaW50ZXJydXB0cyBvcmll
bnRlZCAob24gb3VyIEhXKS4gSXQgZW1pdHMgCj4gR1BVIGxvYWQsIHNvIGNhdXNlcyB2ZXJ5IGxv
dyBDUFUgbG9hZCwgYnV0IGxvdCBvZiBpbnRyZXJ1cHRzIGZyb20gR1BVLCB2aWRlbyAKPiBzdWJz
eXRlbSwgZGlzcGxheSBzdWJzeXN0ZW0uIEkga25vdyBhYm91dCB0aGUgV0ZJL1dGRSBwcm9ibGVt
IGFuZCBgdndmaT1uYXRpdmVgLiAKClRoZSBXRkkvV0ZFIHByb2JsZW0gaXMgbW9zdGx5IGJlY2F1
c2Ugb2YgdGhlIGNvbnRleHQgc3dpdGNoLiBJdCBsaWtlbHkgY2FuIGJlIApvcHRpbWl6ZWQgdG8g
cmVkdWNlIHRoZSBvdmVyaGVhZC4KCj4gQnV0IHdlIGNhbid0IHVzZSBpdCwgYmVjYXVzZSBvdXIg
c3lzdGVtIGlzIG92ZXJjb21taXR0ZWQuCgpDYW4geW91IGRlc2NyaWJlIGhvdyBvdmVyY29tbWl0
dGVkIHlvdXIgc3lzdGVtIGlzPwoKPj4gQWxzbyBrZWVwIGluIG1pbmQgdGhhdCBzb21lIGluc3Ry
dWN0aW9ucyBoZXJlIGFuZCB0aGVyZSBpbiB0aGUKPj4gaW50ZXJydXB0IGhhbmRsaW5nIHBhdGgg
aW4gWGVuIG1pZ2h0IG5vdCBiZSByZWxldmFudCBpZiB5b3UgZXhpdCB0aGUKPj4gZ3Vlc3QgZnJl
cXVlbnRseSAoZHVlIHRvIGludGVycnVwdHMsIGZvciBpbnN0YW5jZSkuIFRoZSBjb3N0IG9mIGFu
IGV4aXQKPj4gd2lsbCBwcm9iYWJseSBkd2FyZiB0aGUgY29zdCBvZiBhZGRpbmcgYSBzdHJ1Y3Qg
cGVuZGluZ19pcnEgdG8gYSBsaW5rZWQKPj4gbGlzdCBvciBzby4KPiBJdCBpcyBjbGVhci4gQXMg
d2UgZGlzY3Vzc2VkIGludGVybmFsbHksIGV2ZW4gbWFraW5nIElSUSBwYXRoIHNob3J0ZXIsIHdl
IG1heSAKPiBleHBlcmllbmNlIHRoZSBiZW5jaG1hcmsgcmVzdWx0cyBkcm9wIGR1ZSB0byB0aGUg
ZmFjdCB0aGF0IHdlIGFyZSBkb2luZyBtb3JlIAo+IGNvbnRleHQgc3dpdGNoZXMgZnJvbSBndWVz
dCBpbnN0ZWFkIG9mIGNvbGxlY3RpbmcgdGhvc2UgaW50ZXJydXB0cyBkaXJlY3RseSBmcm9tIAo+
IGh5cC4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLiBDYW4geW91IGRldGFpbHMg
aXQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
