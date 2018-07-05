From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/8] Coccinelle cleanups
Date: Thu, 5 Jul 2018 16:47:07 +0300
Message-ID: <20180705164656-mutt-send-email-mst__254.27204459465$1530798358$gmane$org@kernel.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=htms=jv=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1fb4bJ-00028u-68
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 13:47:13 +0000
Content-Disposition: inline
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMTI6Mzk6MTFQTSAtMDMwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gTm90aGluZyBleGNpdGluZyBoZXJlLCBwYXRjaGVzIGNyZWF0ZWQg
bWVjaGFuaWNhbGx5Cj4gKGNvbW1vbiBhZnRlciBzb2Z0IGZyZWV6ZSkuCgpBY2tlZC1ieTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KCj4gUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgKDgpOgo+ICAgcW9iamVjdDogQ2F0Y2ggYW5vdGhlciBzdHJhZ2dsZXIgZm9yIHVzZSBvZiBx
ZGljdF9wdXRfc3RyKCkKPiAgIGVycm9yOiBSZW1vdmUgTlVMTCBjaGVja3Mgb24gZXJyb3JfcHJv
cGFnYXRlKCkgY2FsbHMKPiAgIGNyeXB0bzogUmVtb3ZlIHVzZWxlc3MgY2FzdHMKPiAgIHhlbjog
UmVtb3ZlIHVzZWxlc3MgY2FzdHMKPiAgIHRlc3RzL2Jpb3MtdGFibGVzLXRlc3Q6IFJlbW92ZSB1
c2VsZXNzIGNhc3RzCj4gICB1aS92bmM6IFJlbW92ZSB1c2VsZXNzIHBhcmVudGhlc2lzIGFyb3Vu
ZCBESVZfUk9VTkRfVVAgbWFjcm8KPiAgIGh3L3BjaS1ob3N0OiBSZW1vdmUgdXNlbGVzcyBwYXJl
bnRoZXNpcyBhcm91bmQgRElWX1JPVU5EX1VQIG1hY3JvCj4gICBody9pbnRjL2dpY3YzOiBSZW1v
dmUgdXNlbGVzcyBwYXJlbnRoZXNpcyBhcm91bmQgRElWX1JPVU5EX1VQIG1hY3JvCj4gCj4gIGlu
Y2x1ZGUvaHcvaW50Yy9hcm1fZ2ljdjNfY29tbW9uLmggfCAyICstCj4gIGNyeXB0by9jaXBoZXIt
YnVpbHRpbi5jICAgICAgICAgICAgfCA0ICsrLS0KPiAgaHcvcGNpLWhvc3QvcGlpeC5jICAgICAg
ICAgICAgICAgICB8IDIgKy0KPiAgaHcvcGNpLWhvc3QvcTM1LmMgICAgICAgICAgICAgICAgICB8
IDIgKy0KPiAgaHcvczM5MHgvdmlydGlvLWNjdy5jICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBo
dy94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgICAgICAgIHwgMiArLQo+ICBxb2JqZWN0L2Jsb2Nr
LXFkaWN0LmMgICAgICAgICAgICAgIHwgMiArLQo+ICB0ZXN0cy9iaW9zLXRhYmxlcy10ZXN0LmMg
ICAgICAgICAgIHwgMiArLQo+ICB1aS92bmMtZW5jLXRpZ2h0LmMgICAgICAgICAgICAgICAgIHwg
MiArLQo+ICB1aS92bmMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyArKy0KPiAgMTAg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gLS0g
Cj4gMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
