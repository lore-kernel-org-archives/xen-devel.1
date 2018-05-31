From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Thu, 31 May 2018 09:57:11 -0600
Message-ID: <01d3fad8-cf88-9167-c984-286db0c15daf@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <d08fe9e3-3f32-8342-00c1-3a457fe14098@caviumnetworks.com>
 <1df9c9aa-bb75-94db-d88f-53229e740e18@linaro.org>
 <9900a2ad-65d4-357f-b54d-01ba76476d1a@caviumnetworks.com>
 <8da742f2-6ba8-327a-6a54-147d1b06d547@linaro.org>
 <365f599b-f976-9e3f-5ca8-3e3ef7f69c10@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=amwc=is=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fOPwy-0005fq-46
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 15:57:16 +0000
Received: by mail-pg0-x243.google.com with SMTP id k2-v6so9917949pgc.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 May 2018 08:57:14 -0700 (PDT)
In-Reply-To: <365f599b-f976-9e3f-5ca8-3e3ef7f69c10@caviumnetworks.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <mjaggi@caviumnetworks.com>, xen-devel@lists.xenproject.org, julien.grall@arm.com
Cc: sstabellini@kernel.org, shankerd@codeaurora.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiA1LzMwLzIwMTggMTA6MTMgUE0sIE1hbmlzaCBKYWdnaSB3cm90ZToKPgo+Cj4gT24gMDUv
MzEvMjAxOCAwNDozMSBBTSwgU2FtZWVyIEdvZWwgd3JvdGU6Cj4+Pj4+PiArCj4+Pj4+PiArc3Rh
dGljIGludCBhcm1fc21tdV9pb21tdV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4+
PiBXaGVyZSBpcyBpb21tdV9kb21haW4gaW5pdGlhbGl6ZWQ/Cj4+Pj4+IFRoZSBmdW5jdGlvbiBk
b2VzIG5vdCB1c2UgYSBpb21tdV9kb21haW4gKiB2YXJpYWJsZQo+PiBQbGVhc2UgY2hlY2sgaW9t
bXUuYyAyIGxldmVscyB1cC4KPiBJbiB0aGlzIGZ1bmN0aW9uIGRvIHlvdSBzZWUgaW9tbXVfZG9t
YWluIGdldHRpbmcgYWxsb2NhdGVkIG9yIGluaXRpYWxpemVkPwo+IEFzIHBlciB0aGUgbmFtZSBv
ZiBmdW5jdGlvbiBhcm1fc21tdSBpb21tdV9kb21haW5faW5pdC4KPiBXaGVyZSBpcyBpbml0IG9m
IGlvbW11X2RvbWFpbiBpbiB0aGlzIGZ1bmN0aW9uPwpXZWxsIHdpdGhvdXQgdGhlIHhlbl9kb21h
aW4gdGhlIGlvbW11X2RvbWFpbiBpcyBub3QgaW5pdGlhbGl6ZWQuIEl0IGlzIGp1c3QgdGhlIGRl
ZmF1bHQgdmFsdWUuIFRoaXMgZ2VuZXJpYyBpb21tdSBjb2RlIG1ha2VzIGFuIC5pbml0IGNhbGwg
dG8gb3VyIGNvZGUgZm9yIHdoYXRldmVyIGluaXRpYWxpemF0aW9uIGlzIG5lZWRlZC4gU28gdGhl
IG5hbWUgaGVyZSBzZWVtZWQgYWJzb2x1dGVseSBmaW5lIHRvIG1lLgoKSW5pdGlhbGl6YXRpb24g
ZG9lcyBub3QgYWx3YXlzIHJlZmVyIHRvIGFsbG9jYXRpb24uIEluIHRoaXMgY2FzZSB0aGlzIGlz
IGRyaXZlciBzcGVjaWZpYyBpbml0aWFsaXphdGlvbi4gU2luY2UsIHRoZSBpb21tdSBjb2RlIGlz
IG1ha2luZyBhbiBpbml0IGNhbGwgdG8gdGhlIHNtbXUgY29kZSBoZW5jZSB0aGUgbmFtZSBhcm1f
c21tdV9pb21tdV9kb21haW5faW5pdC4gU28sIGFnYWluIEkgYWdyZWUgd2l0aCB5b3VyIGNvbW1l
bnRzIG9uIHRoZSBkb21haW4gdmFyaWFibGUgbmFtZXMgYW5kIEknbSBtYWtpbmcgdGhlc2UgY2hh
bmdlcyBhcyB0aGV5IHdvdWxkIG1ha2UgdGhlIGNvZGUgY2xlYW5lci4gVGhpcyBmdW5jdGlvbiBu
YW1lIGNoYW5nZSBwcm9iYWJseSB3aWxsIG5vdCBkbyBtdWNoIGJ1dCB0aGUgbW92ZSBhbG9uZyB0
aGUgZGlzY3Vzc2lvbiwgbGV0IG1lIGtub3cgd2hhdCB5b3Ugd2VyZSB0aGlua2luZy4KPgo+ICtz
dGF0aWMgaW50IGFybV9zbW11X2lvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4g
K3sKPiArwqDCoMKgIHN0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWluICp4ZW5fZG9tYWluOwo+ICsK
PiArwqDCoMKgIHhlbl9kb21haW4gPSB4emFsbG9jKHN0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWlu
KTsKPiArwqDCoMKgIGlmICgheGVuX2RvbWFpbikKPiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
Tk9NRU07Cj4gKwo+ICvCoMKgwqAgc3Bpbl9sb2NrX2luaXQoJnhlbl9kb21haW4tPmxvY2spOwo+
ICvCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJnhlbl9kb21haW4tPmNvbnRleHRzKTsKPiArCj4gK8Kg
wqDCoCBkb21faW9tbXUoZCktPmFyY2gucHJpdiA9IHhlbl9kb21haW47Cj4gKwo+ICvCoMKgwqAg
cmV0dXJuIDA7Cj4gK30KPiArCj4KPgo+Cj4+IFRoYW5rcywKPj4gU2FtZWVyCj4+Pgo+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IFhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAo+Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
