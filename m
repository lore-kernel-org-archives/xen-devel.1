From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 13/30] pc/xen: Xen Q35 support: provide
 IRQ handling for PCI devices
Date: Wed, 14 Mar 2018 11:48:46 +0100
Message-ID: <406abf99-4311-f08d-9f61-df72a9a3ef05__12370.7001017921$1521024483$gmane$org@redhat.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <6067bc3c91c9ee629a35723dfb474ef168ff4ebf.1520867955.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bdh3=ge=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ew3xu-0006JR-4T
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 10:49:02 +0000
In-Reply-To: <6067bc3c91c9ee629a35723dfb474ef168ff4ebf.1520867955.git.x1917x@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, Marcel Apfelbaum <marcel@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDMvMjAxOCAxOTozMywgQWxleGV5IEdlcmFzaW1lbmtvIHdyb3RlOgo+IHhlbl9wY2lf
c2xvdF9nZXRfcGlycSAtLT4geGVuX2Ntbl9wY2lfc2xvdF9nZXRfcGlycQo+IHhlbl9waWl4M19z
ZXRfaXJxICAgICAtLT4geGVuX2Ntbl9zZXRfaXJxCgpEb24ndCBhYmJydnQgbmFtZXMsIHhlbl9o
dm1fIGlzIGEgYmV0dGVyIHByZWZpeC4KCj4gCj4gKyAgICAgICAgICAgICAgICAgICAgZnByaW50
ZihzdGRlcnIsICJXQVJOSU5HOiBndWVzdCBkb21haW4gYXR0ZW1wdGVkIHRvIHVzZSBQSVJRJWMg
Igo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJvdXRpbmcgd2hpY2ggaXMgbm90IHN1
cHBvcnRlZCBmb3IgWGVuL1EzNSBjdXJyZW50bHlcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoY2hhcikoYWRkcmVzcyAtIElDSDlfTFBDX1BJUlFFX1JPVVQgKyAnRScpKTsKClVz
ZSBlcnJvcl9yZXBvcnQgaW5zdGVhZC4KClBhb2xvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
