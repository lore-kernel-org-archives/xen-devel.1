From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement
 XSDT support for RSDP
Date: Thu, 8 Nov 2018 15:53:48 +0100
Message-ID: <20181108155348.03d368db@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181105014047.26447-6-sameo@linux.intel.com>
 <20181108151623.4de26ecb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aooe=nt=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1gKlh1-00029j-9h
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 14:53:59 +0000
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCA4IE5vdiAyMDE4IDE1OjE2OjIzICswMTAwCklnb3IgTWFtbWVkb3YgPGltYW1tZWRv
QHJlZGhhdC5jb20+IHdyb3RlOgoKWy4uLl0KPiAgIHBhdGNoIDQ6IGNvbnZlcnQgYXJtJ3MgaW1w
bC4gdG8gYnVpbGRfYXBwZW5kX2ludF9ub3ByZWZpeCgpIEFQSSAoY29tbWl0IDVkN2EzMzRmNykK
Cj4gICAgICAgICAgICAuLi4gbW92ZSBvdXQgdG8gYW1sLWJ1aWxkLmMKbXkgbWlzdGFrZSwgZ2Vu
ZXJhbGx5IHdoZW4gd2UgbW92ZSBzb21ldGhpbmcgb3V0LAp3ZSBzaG91bGQgZG8gaXQgaW4gc2Vw
YXJhdGUgcGF0aCBwcmVmZXJhYmx5IHdpdGhvdXQgYW55IGNoYW5nZXMgdG8gdGhlIG1vdmVkIGNv
ZGUKc28gaXQgd291bGQgYmUgZWFzaWVyIHRvIHJldmlldy4gU28gaXQgc2hvdWxkIGJlIGEgc2Vw
YXJhdGUgcGF0Y2guCgpbLi4uXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
