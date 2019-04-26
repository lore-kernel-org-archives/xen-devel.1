From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
Date: Fri, 26 Apr 2019 15:31:11 +0100
Message-ID: <7c231a06-bac3-1a76-2fc8-73042a900953@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
 <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
 <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK1si-0004zU-2g
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:31:16 +0000
In-Reply-To: <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNi8wNC8yMDE5IDE1OjE1LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEp1bGllbiwKPiAK
PiBTb3JyeSwgcmVwbHkgZm9ybWF0IGlzIGJyb2tlbi4gSXQgc2hvdWxkIGJlIGFzIGZvbGxvd2lu
ZzoKPiAKPiBPbiAyNi4wNC4xOSAxNjo1MCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+IFRvIGJl
IGhvbmVzdCwgSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGV0aGVyIHRoZSBpc2IoKSBpcyBuZWNl
c3NhcnkKPj4+IGhlcmUuIEF0IHdvcnN0LCBhbiBlbnRyeSBvZiBhbiBleGlzdGluZyBtYXBwaW5n
cyBpcyBub3QgY2FjaGVkIHdpdGggdGhlCj4+PiBTQ1RMUl9FTDIuV1hOIHNldC4gVGhpcyBtYXkg
b25seSBkZWZlciB0aGUgcHJvYmxlbSBpcyBhbiBlbnRyeSBpcwo+Pj4gaW5jb3JyZWN0bHkgY29u
ZmlndXJlZCBiZWZvcmUgdGhlIGZsdXNoLiBUaGlzIGlzIGRvbmUgZWFybHkgYXQgYm9vdCAoYW5k
Cj4+PiB3aWxsIGJlIGRvbmUgbXVjaCBlYXJsaWVyIGluIFsxXSkuCj4gCj4gCj4gV2VsbCwgZm9s
bG93aW5nIHRoaXMgbG9naWMgd2UgbWF5IGZpbmlzaCB3aXRoIFRMQiBmbHVzaCBpcyBub3QgbmVl
ZGVkIGhlcmUgYXQgCj4gYWxsLiBCZWNhdXNlIGVudHJpZXMsIGFscmVhZHkgcmVhY2hlZCBUTEIs
IHdlcmUgY29uZmlndXJlZCBiZWZvcmUsIGFuZCBhcmUgCj4gYmVsaWV2ZWQgdmFsaWQuIEFsbCB0
aGUgbmV4dCB3aWxsIGhhdmUgV1hOIHNldC4KPiBCdXQgaW4gdGhpcyBjYXNlLCBJU0IgaXMgbmVl
ZGVkIGFzIGFuIGV4YWN0IHBvaW50IGZyb20gd2hpY2ggYWxsIG5ldyBUTEIgZW50cmllcyAKPiB3
aWxsIGhhdmUgV1hOLgoKSSBhbSBub3Qgc3VyZSB0byBmb2xsb3cgeW91ciBwb2ludCBoZXJlLiBJ
dCB3YXNuJ3QgY2xlYXIgdG8gbWUgd2hldGhlciB0aGUgaXNiKCkgCmJldHdlZW4gc2V0dGluZyBT
Q1RMUl9FTDIuV1hOIGFuZCBUTEIgZmx1c2ggaXMgc3RyaWN0bHkgbmVjZXNzYXJ5LiBUaGUgVExC
IGZsdXNoIApjb250YWluIGFuIGlzYigpIHNvLCBpdCBtYXkgaGFzIHdlbGwgYmUgZW5vdWdoIGhl
cmUuCgpIb3dldmVyLCBzcGVha2luZyB3aXRoIE1hcmsgUnV0bGFuZCwgaXQgd291bGQgYmUgYmVz
dCB0byBrZWVwIHRoZSBzZXF1ZW5jZSAKc3VnZ2VzdCBpbiB0aGlzIHBhdGNoLiBTbyBTQ1RMUl9F
TDIuV1hOIGlzIHZpc2libGUgYmVmb3JlIHRoZSBmbHVzaCBhbmQgdGhlIApmbHVzaCB3aWxsIGVu
c3VyZSBhbGwgY3VycmVudCBlbnRyaWVzIGFyZSByZW1vdmVkLiBTbyBub25lIG9mIHRoZSBlbnRy
aWVzIHNob3VsZCAKaGF2ZSBXWE4gY2xlYXJlZC4KClNvIEkgd2lsbCBrZWVwIHRoaXMgcGF0Y2gg
YXMgaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
