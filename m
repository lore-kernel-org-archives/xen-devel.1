From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Fri, 23 Nov 2018 12:09:41 +0200
Message-ID: <a9f3a72f-37cc-9097-e93e-df7d0d47aa01@gmail.com>
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
 <0c381f5d-59f8-fcee-4a25-8a29af3f2d73@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0c381f5d-59f8-fcee-4a25-8a29af3f2d73@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Julien Grall <julien.grall@gmail.com>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMTEuMTggMTk6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBN
eSBiaWdnZXN0IHdvcnJ5IGlzIHlvdSBhcmUgZG9pbmcgb3B0aW1pemF0aW9uIG9uIGEgdkdJQyB0
aGF0IGlzIG5vdCAKPiBmdWxseSBjb21wbGlhbnQgd2l0aCBob3cgYSBHSUMgc2hvdWxkIGJlaGF2
ZSAoZS5nIGVkZ2UgdnMgbGV2ZWwpIGFuZCAKPiB3aXRoIHZlcnkgZnJhZ2lsZSBsb2NraW5nLgpZ
ZXAsIG9sZCBWR0lDIGxvY2tpbmcgbG9va3MgcHJldHR5IHRlcnJpYmxlLgoKPiBJZiB5b3UgYXJl
IGludGVyZXN0ZWQsIEFuZHJlIGNhbiBwcm92aWRlcyBtb3JlIGRldGFpbHMuCkJlaW5nIGhvbmVz
dCwgSSdtIG5vdCBmdWxseSB1bmRlcnN0YW5kIGVkZ2UgdnMgbGV2ZWwgcHJvYmxlbSB0aGVyZS4g
SXQgCndvdWxkIGJlIGdvb2QgdG8gZ2V0IGJldHRlciB2aWV3IG9uIGl0LgoKPiBJIGNhbid0IGNv
bW1lbnQgd2l0aG91dCBhbnkgbnVtYmVycyBoZXJlLiBCZWFyIGluIG1pbmQgdGhhdCB3ZSBmaXhl
ZCAKPiBidWdzIGluIFhlbiA0LjEyIChpbmNsdWRpbmcgc3BlY3RyZS9tZWx0ZG93biBhbmQgbWlz
c2luZyBiYXJyaWVycykgdGhhdCAKPiB3YXNuJ3QgYmFja3BvcnRlZCB0byBYZW4gNC4xMC4gSXQg
aXMgZW50aXJlbHkgcG9zc2libGUgdGhhdCBpdCAKPiBpbnRyb2R1Y2VkIHNsb3duZXNzIGJ1dCBp
dCBhbHNvIGVuc3VyZSB0aGUgY29kZSBpcyBiZWhhdmluZyBjb3JyZWN0bHkuCkZvciBzdXJlLCBJ
IGtub3cgdGhhdC4gSXQgd2FzIHJhdGhlciBhIHBvbGl0aWNhbCBkZWNpc2lvbi4KCj4gQW55d2F5
LCBpZiB0aGVyZSBhcmUgcGVyZm9ybWFuY2UgcmVncmVzc2lvbiB3ZSBzaG91bGQgaW52ZXN0aWdh
dGUgdGhlbSAKPiBhbmQgZGlzY3VzcyBob3cgd2UgY2FuIGFkZHJlc3MvbGltaXQgdGhlbS4gU2lt
aWxhcmx5IGZvciB0aGUgbmV3IHZHSUMsIAo+IGlmIHlvdSB0aGluayBpdCBpcyB0b28gc2xvdywg
dGhlbiB3ZSBuZWVkIHRvIGtub3cgd2h5IGJlZm9yZSB3ZSBnZXQgcmlkIAo+IG9mIHRoZSBvbGQg
dkdJQy4KWWVwLgoKPiBUaGVyZSBhcmUgbm8gZ3Vlc3QgcHJpb3JpdGl6YXRpb24gYXQgdGhlIG1v
bWVudC4gSG93ZXZlciwgd2UgbWF5IHdhbnQgdG8gCj4gaW50cm9kdWNlIGl0IHRvIGdpdmUgcHJp
b3JpdHkgdG8gb25lIGd1ZXN0IG92ZXIuCkJ1dCBzdGlsbCwgcHJvY2Vzc2luZyBvZiBJUlFzIGJ5
IGEgaHlwZXJ2aXNvciAoZS5nLiBtb3ZpbmcgdGhlbSBmcm9tIGdpYyAKdG8gdmdpYyBmb3IgZ3Vl
c3RzIElSUXMpIGhhcyBhIGhpZ2hlciBwcmlvcml0eSBvdmVyIGFueSBndWVzdCBleGVjdXRpb24u
CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
