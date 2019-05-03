From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
Date: Fri, 3 May 2019 18:09:06 +0100
Message-ID: <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
 <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMbgL-0001LS-T7
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:09:09 +0000
In-Reply-To: <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8wNS8yMDE5IDE2OjU4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDIy
LjA0LjE5IDE5OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdlIGN1cnJlbnRseSB1c2UgdGhl
IHZlcnkgbG9uZyB2ZXJzaW9uIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZCg0MDk2KSkpCj4+IHRv
IGFsaWduIHBhZ2UtdGFibGVzLiBUaGFua2Z1bGx5IHRoZXJlIGlzIGEgc2hvcnRlciB2ZXJzaW9u
IHRvIG1ha2UKPiAKPiBJTU8gaXQgaXMgYmV0dGVyIHRvIGNoYW5nZSBgdmVyc2lvbmAgdG8gYG1h
Y3JvYC4gSW4gb3JkZXIgdG8gc3BlY2lmeSBpdCBpcyBub3QgYSAKPiBjb21waWxlciBzcGVjaWZp
YyBidXQgc3BlY2lmaWMgdG8gWEVOLgoKSSB3aWxsIHJld29yZCB0byAiVGhhbmtmdWxseSBYZW4g
cHJvdmlkZXMgYW4gaGFuZHkgbWFjcm8gdGhhdCB3aWxsIG1ha2UgdGhlIGNvZGUgCm1vcmUgcmVh
ZGFibGUiLgoKPiAKPj4gdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPj4KPj4gV2hpbGUgbW9kaWZ5
aW5nIHRoZSBhdHRyaWJ1dGU6Cj4+IMKgwqDCoMKgIDEpIE1vdmUgaXQgYmVmb3JlIHRoZSB2YXJp
YWJsZSBuYW1lIGFzIHdlIGRvIGluIG90aGVyIHBhcnQgb2YgWGVuCj4+IMKgwqDCoMKgIDIpIFN3
aXRjaCB0byBQQUdFX1NJWkUgaW5zdGVhZCBvZiA0MDk2IHRvIG1ha2UgbW9yZSBmdXR1cmUtcHJv
b2YKPj4gwqDCoMKgwqAgMykgTWFyayBzdGF0aWMgcGFnZS10YWJsZXMgbm90IHVzZWQgb3V0c2lk
ZSB0aGUgZmlsZSAoaS5lIGFueQo+PiDCoMKgwqDCoMKgwqDCoCBwYWdlLXRhYmxlcyBvdGhlciB0
aGFuIGJvb3RfKiBhbmQgeGVuX2ZpeG1hcCkuCj4+Cj4+IExhc3RseSwgc29tZSBvZiB0aGUgdmFy
aWFibGVzIHVzZSBfX2F0dHJpYnV0ZV9fKF9fYWxpZ25lZChYICogNDA5NikpLgo+PiBIb3dldmVy
IHRoaXMgaXMgbm90IG5lY2Vzc2FyeSBhcyBwYWdlLXRhYmxlcyBhcmUgb25seSByZXF1aXJlZCB0
byBiZQo+PiB0byBiZSBhbGlnbmVkIHRvIGEgcGFnZS1zaXplLiBTbyB1c2UgX19hbGlnbmVkKFBB
R0VfU0laRSkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gVGhvdWdoOgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRy
aWlfYW5pc292QGVwYW0uY29tPgo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
