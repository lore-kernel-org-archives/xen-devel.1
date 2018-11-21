From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [Qemu-devel] [PATCH v5 12/24] hw: acpi: Export the
 MCFG getter
Date: Thu, 22 Nov 2018 00:21:06 +0100
Message-ID: <20181121232106.GB4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-13-sameo@linux.intel.com>
 <20181115133658.2cdbd918@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uxgW=OA=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gPboY-0006cg-T1
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 23:21:46 +0000
Content-Disposition: inline
In-Reply-To: <20181115133658.2cdbd918@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

SGkgSWdvciwKCk9uIFRodSwgTm92IDE1LCAyMDE4IGF0IDAxOjM2OjU4UE0gKzAxMDAsIElnb3Ig
TWFtbWVkb3Ygd3JvdGU6Cj4gT24gTW9uLCAgNSBOb3YgMjAxOCAwMjo0MDozNSArMDEwMAo+IFNh
bXVlbCBPcnRpeiA8c2FtZW9AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IEZyb206IFlh
bmcgWmhvbmcgPHlhbmcuemhvbmdAaW50ZWwuY29tPgo+ID4gCj4gPiBUaGUgQUNQSSBNQ0ZHIGdl
dHRlciBpcyBub3QgeDg2IHNwZWNpZmljIGFuZCBjb3VsZCBiZSBjYWxsZWQgZnJvbQo+ID4gYW55
d2hlcmUgd2l0aGluIGdlbmVyaWMgQUNQSSBBUEksIHNvIGxldCdzIGV4cG9ydCBpdC4KPiBTbyBm
YXIgaXQncyB4ODYgb3IgbW9yZSBleGFjdGx5IHEzNSBzcGVjaWZpYyB0aGluZywKSXQncyBwcm9w
ZXJ0eSBiYXNlZCwgYW5kIGl0J3MgdXNpbmcgYSBnZW5lcmljIFBDSUUgcHJvcGVydHkgYWZhaWN0
LgpTbyBpdCdzIHVwIHRvIGVhY2ggbWFjaGluZSB0eXBlIHRvIGRlZmluZSB0aG9zZSBwcm9wZXJ0
aWVzLgpJJ20gY3VyaW91cyBoZXJlOiBXaGF0J3MgdGhlIGlkaW9tYXRpYyB3YXkgdG8gZGVmaW5l
IGEgbWFjaGluZQpzZXR0aW5nL2F0dHJpYnV0ZS9wcm9wZXJ0eSwgbGV0IGVhY2ggaW5zdGFuY2Ug
ZGVmaW5lIGl0IG9yIG5vdCwgYW5kCm1ha2UgaXQgYXZhaWxhYmxlIGF0IHJ1biB0aW1lPwpXb3Vs
ZCB5b3UgYmUgZ2V0dGluZyB0aGUgUENJIGhvc3QgcG9pbnRlciBmcm9tIHRoZSBBQ1BJIGJ1aWxk
IHN0YXRlIGFuZApnZXR0aW5nIHRoYXQgaW5mb3JtYXRpb24gYmFjayBmcm9tIHRoZXJlPwoKQ2hl
ZXJzLApTYW11ZWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
