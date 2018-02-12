From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [RFC PATCH 00/49] New VGIC(-v2) implementation
Date: Mon, 12 Feb 2018 11:53:32 +0000
Message-ID: <ceeb8ba9-6f92-6da4-d197-4ea2ee50004d@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <8633696d-3e53-310e-5cdf-94ec9af2264c@linaro.org>
 <c08a547f-e75f-c5ad-2744-aad2e756d421@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kmxx=fg=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1elCg1-00034V-Mz
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 11:53:41 +0000
Received: by mail-wm0-x22f.google.com with SMTP id f71so9099875wmf.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2018 03:53:39 -0800 (PST)
In-Reply-To: <c08a547f-e75f-c5ad-2744-aad2e756d421@arm.com>
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

SGksCgpPbiAxMi8wMi8xOCAxMTo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDA5
LzAyLzE4IDE1OjA2LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4gSGksCj4gCj4gSGkgQW5kcmUs
Cj4gCj4+IE9uIDA5LzAyLzE4IDE0OjM4LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4+IHRsO2Ry
OiBNb3JlIHByZXBhcmF0b3J5IHBhdGNoZXMgZnJvbSBwYXRjaCAwNywgYWN0dWFsIG5ldyBWR0lD
IHN0YXJ0aW5nCj4+PiBhdCBwYXRjaCAyMC4KPj4+ID09PT09PT09PT09PT0KPj4+Cj4+PiBEdXJp
bmcgZGV2ZWxvcG1lbnQgb2YgdGhlIERvbTAgSVRTIE1TSSBzdXBwb3J0IGxhc3QgeWVhciB3ZSBy
ZWFsaXNlZAo+Pj4gdGhhdCB0aGUgZXhpc3RpbmcgR0lDIGludGVycnVwdCBjb250cm9sbGVyIGVt
dWxhdGlvbiBoYXMgc29tZQo+Pj4gc2hvcnRjb21pbmdzLgo+Pj4gQWZ0ZXIgc29tZSB0cmllcyB0
byBmaXggdGhvc2UgaW4gdGhlIGV4aXN0aW5nIGNvZGUsIGl0IHdhcyBhZ3JlZWQgdXBvbgo+Pj4g
dGhhdCB0aGUgcHJvYmxlbXMgYXJlIGZ1bmRhbWVudGFsIGFuZCBhIG5ldyBpbXBsZW1lbnRhdGlv
biBiYXNlZCBvbiB0aGUKPj4+ICJuZXcgVkdJQyIgaW4gS1ZNIGlzIHRoZSBiZXN0IGNob2ljZS4K
Pj4+IFRoaXMgaXMgdGhlIGZpcnN0IGRyb3Agb2YgdGhpcyBuZXcgVkdJQyBpbXBsZW1lbnRhdGlv
bi4KPj4KPj4gSnVzdCBpbiBjYXNlIHlvdSBhcmUgKnJlYWxseSogaW50ZXJlc3RlZDoKPj4gVGhl
IGNvZGUgY2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHZnaWMtbmV3L3JmYyBicmFuY2ggaGVyZToK
Pj4gZ2l0Oi8vbGludXgtYXJtLm9yZy94ZW4tYXAuZ2l0Cj4+IGh0dHA6Ly93d3cubGludXgtYXJt
Lm9yZy9naXQ/cD14ZW4tYXAuZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3ZnaWMtbmV3L3Jm
Ywo+Pgo+IAo+IFRoaXMgYnJhbmNoIHNlZW1zIHRvIGNvbnRhaW4gbW9yZSB0aGFuIHRoaXMgc2Vy
aWVzLiBBbnl0aGluZyB3ZSBzaG91bGQKPiBjYXJlIGluIGl0PwoKT2ggZGVhciwgdGhpcyB3YXMg
bXkgZGV2ZWxvcG1lbnQgYnJhbmNoLiBUaGFua3MgZm9yIHRoZSBoZWFkcyB1cCEgSSBqdXN0CnRy
aW1tZWQgaXQgdG8gbWF0Y2ggdGhlIHNlcmllcyBJIHBvc3RlZC4KUGxlYXNlLCByZS1mZXRjaCBp
dCBub3cgYW5kIHRoZW4gZ28gd2FzaCB5b3VyIGhhbmRzIGluIGNhc2UgeW91IGxvb2tlZAphdCBh
bnkgb2YgdGhlIHRvcCBwYXRjaGVzIDstKQoKQ2hlZXJzLApBbmRyZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
