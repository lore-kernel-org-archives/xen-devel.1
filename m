From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v5 05/24] hw: acpi: Implement XSDT support
 for RSDP
Date: Thu, 8 Nov 2018 15:36:11 +0100
Message-ID: <20181108143611.GD32519@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-6-sameo@linux.intel.com>
 <20181108151623.4de26ecb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=izm2=nt=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gKlQa-0000C0-LY
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 14:37:00 +0000
Content-Disposition: inline
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

SGkgSWdvciwKCk9uIFRodSwgTm92IDA4LCAyMDE4IGF0IDAzOjE2OjIzUE0gKzAxMDAsIElnb3Ig
TWFtbWVkb3Ygd3JvdGU6Cj4gT24gTW9uLCAgNSBOb3YgMjAxOCAwMjo0MDoyOCArMDEwMAo+IFNh
bXVlbCBPcnRpeiA8c2FtZW9AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IFhTRFQgaXMg
dGhlIDY0LWJpdCB2ZXJzaW9uIG9mIHRoZSBsZWdhY3kgQUNQSSBSU0RUIChSb290IFN5c3RlbQo+
ID4gRGVzY3JpcHRpb24gVGFibGUpLiBSU0RUIG9ubHkgYWxsb3cgZm9yIDMyLWJpdCBhZGRyZXNz
c2VzIGFuZCBoYXZlIHRodXMKPiA+IGJlZW4gZGVwcmVjYXRlZC4gU2luY2UgQUNQSSB2ZXJzaW9u
IDIuMCwgUlNEUHMgc2hvdWxkIHBvaW50IGF0IFhTRFRzIGFuZAo+ID4gbm8gbG9uZ2VyIFJTRFRz
LCBhbHRob3VnaCBSU0RUcyBhcmUgc3RpbGwgc3VwcG9ydGVkIGZvciBiYWNrd2FyZAo+ID4gY29t
cGF0aWJpbGl0eS4KPiA+IAo+ID4gU2luY2UgdmVyc2lvbiAyLjAsIFJTRFBzIHNob3VsZCBhZGQg
YW4gZXh0ZW5kZWQgY2hlY2tzdW0sIGEgY29tcGxldGUgdGFibGUKPiA+IGxlbmd0aCBhbmQgYSB2
ZXJzaW9uIGZpZWxkIHRvIHRoZSB0YWJsZS4KPiAKPiBUaGlzIHBhdGNoIHJlLWltcGxlbWVudHMg
d2hhdCBhcm0vdmlydCBib2FyZCBhbHJlYWR5IGRvZXMKPiBhbmQgZml4ZXMgY2hlY2tzdW0gYnVn
IGluIHRoZSBsYXRlciBhbmQgYXQgdGhlIHNhbWUgdGltZQo+IHdpdGhvdXQgYSB1c2VyICh3aXRo
aW4gdGhlIHBhdGNoKS4KPiAKPiBJJ2Qgc3VnZ2VzdCByZWRvIGl0IGEgd2F5IHNpbWlsYXIgdG8g
RkFEVCByZWZhY3RvcmluZwo+ICAgcGF0Y2ggMTogZml4IGNoZWNrc3VtIGJ1ZyBpbiB2aXJ0L2Fy
bQo+ICAgcGF0Y2ggMjogdXBkYXRlIHJlZmVyZW5jZSB0YWJsZXMgaW4gdGVzdApJIG5vdyBzZWUg
d2hhdCB5b3UgbWVhbnQgd2l0aCB0aGUgQUNQSSByZWZlcmVuY2UgdGFibGVzLCB0aGFua3MuCkkn
bGwgZm9sbG93IHlvdXIgYWR2aWNlLgoKQ2hlZXJzLApTYW11ZWwuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
