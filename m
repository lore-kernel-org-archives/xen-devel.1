From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 01/18] xen: re-name XenDevice to
 XenLegacyDevice...
Date: Wed, 28 Nov 2018 16:06:16 +0000
Message-ID: <20181128160616.GB14786__3103.91404568708$1543421167$gmane$org@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9c/f=oh=citrix.com=prvs=8631c8a8c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gS2Mz-0003tX-VC
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:07:21 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, xen-devel@lists.xenproject.org, Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTE6NTRQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmFuZCB4ZW5fYmFja2VuZC5oIHRvIHhlbi1sZWdhY3ktYmFja2VuZC5oCj4gCj4g
UmF0aGVyIHRoYW4gYXR0ZW1wdGluZyB0byBjb252ZXJ0IHRoZSBleGlzdGluZyBiYWNrZW5kIGlu
ZnJhc3RydWN0dXJlIHRvCj4gYmUgUU9NIGNvbXBsaWFudCAod2hpY2ggd291bGQgYmUgaGFyZCB0
byBkbyBpbiBhbiBpbmNyZW1lbnRhbCBmYXNoaW9uKSwKPiBzdWJzZXF1ZW50IHBhdGNoZXMgd2ls
bCBpbnRyb2R1Y2UgYSBjb21wbGV0ZWx5IG5ldyBmcmFtZXdvcmsgZm9yIFhlbiBQVgo+IGJhY2tl
bmRzLiBIZW5jZSBpdCBpcyBuZWNlc3NhcnkgdG8gcmUtbmFtZSBwYXJ0cyBvZiBleGlzdGluZyBj
b2RlIHRvIGF2b2lkCj4gbmFtZSBjbGFzaGVzLiBUaGUgcmUtbmFtZWQgJ2xlZ2FjeScgaW5mcmFz
dHJ1Y3R1cmUgd2lsbCBiZSByZW1vdmVkIG9uY2UgYWxsCj4gYmFja2VuZHMgaGF2ZSBiZWVuIHBv
cnRlZCB0byB0aGUgbmV3IGZyYW1ld29yay4KPiAKPiBUaGlzIHBhdGNoIGlzIHB1cmVseSBjb3Nt
ZXRpYy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
