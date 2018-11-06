From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v5 03/24] hw: acpi: The RSDP build API can
 return void
Date: Tue, 6 Nov 2018 11:43:06 +0100
Message-ID: <20181106104306.GB27585@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-4-sameo@linux.intel.com>
 <591c453a-977c-98a5-a23e-bd04b6dc9533@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hj7k=nr=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gJyps-0006kv-Cg
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 10:43:52 +0000
Content-Disposition: inline
In-Reply-To: <591c453a-977c-98a5-a23e-bd04b6dc9533@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMDYsIDIwMTggYXQgMTE6MjM6MzlBTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiAwNS8xMS8yMDE4IDAyOjQwLCBTYW11ZWwgT3J0aXogd3JvdGU6Cj4gPiAgLyog
UlNEUCAqLwo+ID4gLXN0YXRpYyBHQXJyYXkgKgo+ID4gK3N0YXRpYyB2b2lkCj4gPiAgYnVpbGRf
cnNkcChHQXJyYXkgKnJzZHBfdGFibGUsIEJJT1NMaW5rZXIgKmxpbmtlciwgdW5zaWduZWQgeHNk
dF90Ymxfb2Zmc2V0KQo+ID4gIHsKPiA+ICAgICAgQWNwaVJzZHBEZXNjcmlwdG9yICpyc2RwID0g
YWNwaV9kYXRhX3B1c2gocnNkcF90YWJsZSwgc2l6ZW9mICpyc2RwKTsKPiA+IEBAIC0zOTIsOCAr
MzkyLDYgQEAgYnVpbGRfcnNkcChHQXJyYXkgKnJzZHBfdGFibGUsIEJJT1NMaW5rZXIgKmxpbmtl
ciwgdW5zaWduZWQgeHNkdF90Ymxfb2Zmc2V0KQo+ID4gICAgICBiaW9zX2xpbmtlcl9sb2FkZXJf
YWRkX2NoZWNrc3VtKGxpbmtlciwgQUNQSV9CVUlMRF9SU0RQX0ZJTEUsCj4gPiAgICAgICAgICAo
Y2hhciAqKXJzZHAgLSByc2RwX3RhYmxlLT5kYXRhLCBzaXplb2YgKnJzZHAsCj4gPiAgICAgICAg
ICAoY2hhciAqKSZyc2RwLT5jaGVja3N1bSAtIHJzZHBfdGFibGUtPmRhdGEpOwo+ID4gLQo+ID4g
LSAgICByZXR1cm4gcnNkcF90YWJsZTsKPiA+ICB9Cj4gPiAgCj4gCj4gQmV0dGVyIHRoYW4gdjQu
IDopClJpZ2h0LCBJIGZvbGxvd2VkIFBoaWxpcHBlJ3MgYWR2aWNlIGFuZCBpdCBkb2VzIG1ha2Ug
dGhpbmdzIGNsZWFyZXIgOikKCkNoZWVycywKU2FtdWVsLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
