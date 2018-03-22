From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v3a 14/39] ARM: new VGIC: Add GICv2 world
 switch backend
Date: Thu, 22 Mar 2018 16:26:39 +0000
Message-ID: <93fc522c-6e86-ec95-a1fd-cde806ed6fbf@linaro.org>
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
 id 1ez33F-0006Pr-Ig
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 16:26:53 +0000
Received: by mail-wm0-x22e.google.com with SMTP id f125so17191409wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 09:26:52 -0700 (PDT)
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
ZGVzYyA9IGlycV90b19kZXNjKGlycS0+aHdpbnRpZCk7CgpBcmdoLCB0aG9zZSB0d28gbGluZXMg
c2hvdWxkIGJlIHN3YXBwZWQsIEkgZ3Vlc3MuCkkgZ3Vlc3MgdGhhdCBkb2Vzbid0IHJlYWxseSBt
YXR0ZXIgd2l0aCBvdXIgY3VycmVudCAic3RpY2sgd2l0aCB0aGF0CmhhcmR3YXJlIG1hcHBlZCBJ
UlEgZm9yZXZlciIgYXBwcm9hY2gsIGJ1dCBzaG91bGQgYmUgbW9yZSBmdXR1cmUgcHJvb2YKYW55
d2F5IGFuZCBpcyBtb3JlIGNvcnJlY3QuCgpDaGVlcnMsCkFuZHJlLgoKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZkZXNjLT5sb2NrKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl9sb2NrKCZpcnEtPmlycV9sb2NrKTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBUaGlzIGgvdyBJUlEgc2hvdWxkIHN0aWxsIGJlIGFzc2lnbmVkIHRvIHRoZSB2
aXJ0dWFsCj4+IElSUS4gKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKGlycS0+
aHcgJiYgZGVzYy0+aXJxID09IGlycS0+aHdpbnRpZCk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaGF2ZV9kZXNjX2xvY2sgPSB0cnVlOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+IAo+
IEkgYW0gYSBiaXQgY29uY2VybmVkIG9mIHRoaXMgZGFuY2UgaW4gZm9sZF9scl9zdGF0ZSgpLiBU
aGlzIGxvb2tzCj4gYXdmdWxseSBjb21wbGV4IGJ1dCBJIGRvbid0IGhhdmUgYmV0dGVyIHNvbHV0
aW9uIGhlcmUuIEkgd2lsbCBoYXZlIGEKPiB0aGluayBkdXJpbmcgdGhlIG5pZ2h0Lgo+IAo+IEhv
d2V2ZXIsIHRoaXMgaXMgbm90IGdvaW5nIHRvIHNvbHZlIHRoZSByYWNlIGNvbmRpdGlvbiBJIG1l
bnRpb25lZAo+IGJldHdlZW4gY2xlYXJpbmcgX0lSUV9JTlBST0dSRVNTIGhlcmUgYW5kIHNldHRp
bmcgX0lSUV9JTlBST0dSRVNTIGluCj4gZG9fSVJRLiBUaGlzIGlzIGJlY2F1c2UgeW91IGRvbid0
IGtub3cgdGhlIG9yZGVyIHRoZXkgYXJlIGdvaW5nIHRvIGJlCj4gZXhlY3V0ZWQuCj4gCj4gSSB3
YW50ZWQgdG8gbWFrZSBzdXJlIHlvdSBkaWRuJ3QgaW50ZW5kIHRvIHNvbHZlIHRoYXQgb25lLiBB
bSBJIGNvcnJlY3Q/Cj4gCj4gQ2hlZXJzLAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
