From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 03/24] hw: acpi: The RSDP build API can
 return void
Date: Tue, 6 Nov 2018 11:23:39 +0100
Message-ID: <591c453a-977c-98a5-a23e-bd04b6dc9533@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-4-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mk++=nr=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gJyWS-0004bD-I7
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 10:23:48 +0000
In-Reply-To: <20181105014047.26447-4-sameo@linux.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTEvMjAxOCAwMjo0MCwgU2FtdWVsIE9ydGl6IHdyb3RlOgo+ICAvKiBSU0RQICovCj4g
LXN0YXRpYyBHQXJyYXkgKgo+ICtzdGF0aWMgdm9pZAo+ICBidWlsZF9yc2RwKEdBcnJheSAqcnNk
cF90YWJsZSwgQklPU0xpbmtlciAqbGlua2VyLCB1bnNpZ25lZCB4c2R0X3RibF9vZmZzZXQpCj4g
IHsKPiAgICAgIEFjcGlSc2RwRGVzY3JpcHRvciAqcnNkcCA9IGFjcGlfZGF0YV9wdXNoKHJzZHBf
dGFibGUsIHNpemVvZiAqcnNkcCk7Cj4gQEAgLTM5Miw4ICszOTIsNiBAQCBidWlsZF9yc2RwKEdB
cnJheSAqcnNkcF90YWJsZSwgQklPU0xpbmtlciAqbGlua2VyLCB1bnNpZ25lZCB4c2R0X3RibF9v
ZmZzZXQpCj4gICAgICBiaW9zX2xpbmtlcl9sb2FkZXJfYWRkX2NoZWNrc3VtKGxpbmtlciwgQUNQ
SV9CVUlMRF9SU0RQX0ZJTEUsCj4gICAgICAgICAgKGNoYXIgKilyc2RwIC0gcnNkcF90YWJsZS0+
ZGF0YSwgc2l6ZW9mICpyc2RwLAo+ICAgICAgICAgIChjaGFyICopJnJzZHAtPmNoZWNrc3VtIC0g
cnNkcF90YWJsZS0+ZGF0YSk7Cj4gLQo+IC0gICAgcmV0dXJuIHJzZHBfdGFibGU7Cj4gIH0KPiAg
CgpCZXR0ZXIgdGhhbiB2NC4gOikKClBhb2xvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
