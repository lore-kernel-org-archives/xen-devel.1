From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v3a 14/39] ARM: new VGIC: Add GICv2 world
 switch backend
Date: Thu, 22 Mar 2018 15:12:50 +0000
Message-ID: <7557bce4-48dc-5fae-1530-ee4251a5b2ad@linaro.org>
References: <20180322115649.5283-1-andre.przywara@linaro.org>
 <20180322115649.5283-3-andre.przywara@linaro.org>
 <c26e3506-e1aa-11cb-3757-7c66b6cf69e2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sasr=gm=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ez1to-0000BT-0p
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 15:13:04 +0000
Received: by mail-wm0-x229.google.com with SMTP id v21so5436968wmc.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 08:13:02 -0700 (PDT)
In-Reply-To: <c26e3506-e1aa-11cb-3757-7c66b6cf69e2@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMi8wMy8xOCAxNDowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDAzLzIyLzIwMTggMTE6NTYgQU0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiArwqDC
oMKgwqDCoMKgwqAgLyogVGhlIGxvY2tpbmcgb3JkZXIgZm9yY2VzIHVzIHRvIGRyb3AgYW5kIHJl
LXRha2UgdGhlIGxvY2tzCj4+IGhlcmUuICovCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGlycS0+
aHcgKQo+PiArwqDCoMKgwqDCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGlu
X3VubG9jaygmaXJxLT5pcnFfbG9jayk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGVzYyA9IGlycV90b19kZXNjKGlycS0+aHdpbnRpZCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNw
aW5fbG9jaygmaXJxLT5pcnFfbG9jayk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogVGhpcyBoL3cgSVJRIHNob3VsZCBzdGlsbCBiZSBhc3NpZ25lZCB0byB0aGUgdmlydHVhbAo+
PiBJUlEuICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVChpcnEtPmh3ICYmIGRl
c2MtPmlycSA9PSBpcnEtPmh3aW50aWQpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGhhdmVfZGVzY19sb2NrID0gdHJ1ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPiAKPiBJIGFtIGEg
Yml0IGNvbmNlcm5lZCBvZiB0aGlzIGRhbmNlIGluIGZvbGRfbHJfc3RhdGUoKS4gVGhpcyBsb29r
cwo+IGF3ZnVsbHkgY29tcGxleCBidXQgSSBkb24ndCBoYXZlIGJldHRlciBzb2x1dGlvbiBoZXJl
LgoKSSBhZ3JlZS4KCj4gSSB3aWxsIGhhdmUgYSB0aGluayBkdXJpbmcgdGhlIG5pZ2h0Lgo+IAo+
IEhvd2V2ZXIsIHRoaXMgaXMgbm90IGdvaW5nIHRvIHNvbHZlIHRoZSByYWNlIGNvbmRpdGlvbiBJ
IG1lbnRpb25lZAo+IGJldHdlZW4gY2xlYXJpbmcgX0lSUV9JTlBST0dSRVNTIGhlcmUgYW5kIHNl
dHRpbmcgX0lSUV9JTlBST0dSRVNTIGluCj4gZG9fSVJRLiBUaGlzIGlzIGJlY2F1c2UgeW91IGRv
bid0IGtub3cgdGhlIG9yZGVyIHRoZXkgYXJlIGdvaW5nIHRvIGJlCj4gZXhlY3V0ZWQuCj4gCj4g
SSB3YW50ZWQgdG8gbWFrZSBzdXJlIHlvdSBkaWRuJ3QgaW50ZW5kIHRvIHNvbHZlIHRoYXQgb25l
LiBBbSBJIGNvcnJlY3Q/CgpUaGlzIGlzIHJpZ2h0LCB0aGlzIGlzIG9ydGhvZ29uYWwgYW5kIG5v
dCBhZGRyZXNzZWQgYnkgdGhpcyBwYXRjaC4gSQpoYXZlIGEgaHVuY2ggd2UgbmVlZCB0byBzb2x2
ZSB0aGlzIGluIGlycS5jIGluc3RlYWQuCgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
