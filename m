From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 4/8] xen_backend: add an emulation of
 grant copy
Date: Wed, 16 May 2018 15:30:32 +0100
Message-ID: <20180516143032.GI2057@perard.uk.xensource.com>
References: <1525461967-32174-1-git-send-email-paul.durrant@citrix.com>
 <1525461967-32174-5-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dhrn=id=citrix.com=prvs=667e0e3bc=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fIxRt-0007II-ML
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 14:30:37 +0000
Content-Disposition: inline
In-Reply-To: <1525461967-32174-5-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, qemu-block@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMDQsIDIwMTggYXQgMDg6MjY6MDNQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE5vdCBhbGwgWGVuIGVudmlyb25tZW50cyBzdXBwb3J0IHRoZSB4ZW5nbnR0YWJfZ3Jh
bnRfY29weSgpIG9wZXJhdGlvbi4KPiBFLmcuIHdoZXJlIHRoZSBPUyBpcyBGcmVlQlNEIG9yIFhl
biBpcyBvbGRlciB0aGFuIDQuOC4wLgo+IAo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhbiBlbXVs
YXRpb24gb2YgdGhhdCBvcGVyYXRpb24gdXNpbmcKPiB4ZW5nbnR0YWJfbWFwX2RvbWFpbl9ncmFu
dF9yZWZzKCkgYW5kIG1lbWNweSgpIGZvciB0aG9zZSBlbnZpcm9ubWVudHMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAtLS0KClRo
ZSBwYXRjaCBsb29rcyBvaywgYnV0IHNpbmNlIHBhdGNoIDEgaXMgZ29pbmcgdG8gYmUgY2hhbmdl
LCB0aGlzIG9uZSBpcwpnb2luZyB0byBuZWVkIHRvIGJlIGNoYW5nZSBhcyB3ZWxsLgoKLS0gCkFu
dGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
