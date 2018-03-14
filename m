From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 13/30] pc/xen: Xen Q35 support: provide
 IRQ handling for PCI devices
Date: Wed, 14 Mar 2018 21:28:00 +1000
Message-ID: <20180314212800.000022dc@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <6067bc3c91c9ee629a35723dfb474ef168ff4ebf.1520867955.git.x1917x@gmail.com>
 <406abf99-4311-f08d-9f61-df72a9a3ef05@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dmrx=ge=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1ew4Zp-0002ae-V3
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 11:28:14 +0000
Received: by mail-lf0-x244.google.com with SMTP id m69-v6so4209280lfe.8
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 04:28:11 -0700 (PDT)
In-Reply-To: <406abf99-4311-f08d-9f61-df72a9a3ef05@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Anthony Perard <anthony.perard@citrix.com>, Marcel Apfelbaum <marcel@redhat.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNCBNYXIgMjAxOCAxMTo0ODo0NiArMDEwMApQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKCj5PbiAxMi8wMy8yMDE4IDE5OjMzLCBBbGV4ZXkgR2VyYXNp
bWVua28gd3JvdGU6Cj4+IHhlbl9wY2lfc2xvdF9nZXRfcGlycSAtLT4geGVuX2Ntbl9wY2lfc2xv
dF9nZXRfcGlycQo+PiB4ZW5fcGlpeDNfc2V0X2lycSAgICAgLS0+IHhlbl9jbW5fc2V0X2lycSAg
Cj4KPkRvbid0IGFiYnJ2dCBuYW1lcywgeGVuX2h2bV8gaXMgYSBiZXR0ZXIgcHJlZml4LgoKQWdy
ZWUsIHdpbGwgcmVuYW1lIHhlbl9jbW5fKiB0byB4ZW5faHZtXyoKCj4+ICsgICAgICAgICAgICAg
ICAgICAgIGZwcmludGYoc3RkZXJyLCAiV0FSTklORzogZ3Vlc3QgZG9tYWluCj4+IGF0dGVtcHRl
ZCB0byB1c2UgUElSUSVjICIKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAicm91dGlu
ZyB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGZvcgo+PiBYZW4vUTM1IGN1cnJlbnRseVxuIiwKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoY2hhcikoYWRkcmVzcyAtIElDSDlfTFBDX1BJ
UlFFX1JPVVQgKwo+PiAnRScpKTsgIAo+Cj5Vc2UgZXJyb3JfcmVwb3J0IGluc3RlYWQuCgpPSywg
d2lsbCBjaGFuZ2UgdG8gZXJyb3JfcmVwb3J0KCkuClRoZXJlIGFyZSBtdWx0aXBsZSBmcHJpbnRm
KHN0ZGVyciwuLi4pJ3Mgc3RpbGwgbGVmdCBpbiB0aGUgZmlsZSB0aG91Z2gsCmFuIGFkZGl0aW9u
YWwgY2xlYW51cCBwYXRjaCB0byByZXBsYWNlIGFsbCBzdWNoIGluc3RhbmNlcyB0bwplcnJvcl9y
ZXBvcnQoKSBjYWxscyBtaWdodCBiZSBuZWVkZWQgbGF0ZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
