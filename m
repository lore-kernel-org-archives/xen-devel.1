From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4] xen-hvm: stop faking I/O to access PCI
 config space
Date: Fri, 18 May 2018 16:31:40 +0100
Message-ID: <20180518153140.GW2057@perard.uk.xensource.com>
References: <1526654310-20797-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ktro=if=citrix.com=prvs=6693598a1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJhM9-0008LJ-71
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 15:31:45 +0000
Content-Disposition: inline
In-Reply-To: <1526654310-20797-1-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Jan Beulich <JBeulich@suse.com>, Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>, xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTgsIDIwMTggYXQgMDM6Mzg6MzBQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgY3VycmVudCBoYWNrZXJ5IHdoZXJlIElPUkVR
X1RZUEVfUENJX0NPTkZJRwo+IHJlcXVlc3RzIGFyZSBoYW5kbGVkIGJ5IGZha2luZyBQSU8gdG8g
MHhjZjggYW5kIDB4Y2ZjIGFuZCByZXBsYWNlcyBpdAo+IHdpdGggZGlyZWN0IGNhbGxzIHRvIHBj
aV9ob3N0X2NvbmZpZ19yZWFkL3dyaXRlX2NvbW1vbigpLgo+IERvaW5nIHNvIG5lY2Vzc2l0YXRl
cyBtYXBwaW5nIEJERnMgdG8gUENJRGV2aWNlcyBidXQgbWFpbnRhaW5pbmcgYSBzaW1wbGUKPiBR
TElTVCBpbiB4ZW5fZGV2aWNlX3JlYWxpemUvdW5yZWFsaXplKCkgd2lsbCBzdWZmaWNlLgo+IAo+
IE5PVEU6IHdoaWxzdCBjb25maWcgc3BhY2UgYWNjZXNzZXMgYXJlIGN1cnJlbnRseSBsaW1pdGVk
IHRvCj4gICAgICAgUENJX0NPTkZJR19TUEFDRV9TSVpFLCB0aGlzIHBhdGNoIHBhdmVzIHRoZSB3
YXkgdG8gaW5jcmVhc2luZyB0aGUKPiAgICAgICBsaW1pdCB0byBQQ0lFX0NPTkZJR19TUEFDRV9T
SVpFIHdoZW4gWGVuIGdhaW5zIHRoZSBhYmlsaXR5IHRvCj4gICAgICAgZW11bGF0ZSBNQ0ZHIHRh
YmxlIGFjY2Vzc2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
