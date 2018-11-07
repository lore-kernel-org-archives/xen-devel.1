From: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-3.2 v3 13/14] hw/i386: add
 pc-i440fx-3.2 & pc-q35-3.2
Date: Wed, 7 Nov 2018 17:01:14 -0200
Message-ID: <20181107190114.GD12503@habkost.net>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
 <20181107123652.23417-14-marcandre.lureau@redhat.com>
 <CAJ+F1CLWy0xbb-Pc7yUNpHh70GsSTKJ=v+TeoTGJOThYO_xE2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vttz=ns=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1gKT4r-0007Z3-AG
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 19:01:21 +0000
Content-Disposition: inline
In-Reply-To: <CAJ+F1CLWy0xbb-Pc7yUNpHh70GsSTKJ=v+TeoTGJOThYO_xE2g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, amit@kernel.org, "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>, hpoussin@reactos.org, Igor Mammedov <imammedo@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, atar4qemu@gmail.com, stefanb@linux.ibm.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMDcsIDIwMTggYXQgMDc6NDk6NTRQTSArMDQwMCwgTWFyYy1BbmRyw6kgTHVy
ZWF1IHdyb3RlOgo+IEhpCj4gCj4gT24gV2VkLCBOb3YgNywgMjAxOCBhdCA0OjQ5IFBNIE1hcmMt
QW5kcsOpIEx1cmVhdQo+IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4K
PiA+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMgZ29pbmcgdG8gYWRkIGNvbXBhdGlibGl0eSBwYXJh
bWV0ZXJzIGZvcgo+ID4gcWVtdSA8PSAzLjEuCj4gPgo+IAo+IEkgcmVhbGl6ZSB0aGlzIG1heSBi
ZSBnb29kIGVub3VnaCBmb3IgeDg2IGk0NDAvcTM1IG1hY2hpbmVzLCBidXQgd2hhdAo+IGFib3V0
IG90aGVyIG1hY2hpbmVzICYgYXJjaGl0ZWN0dXJlcz8KPiAKPiBXaGF0IGRvIHdlIG9mZmljaWFs
bHkgc3VwcG9ydCwgZm9yIG1pZ3JhdGlvbiwgYWNyb3NzIGRpZmZlcmVudCB2ZXJzaW9ucz8KPiAK
PiBJdCBzZWVtcyB3ZSBoYXZlIHZlcnNpb25pemVkOgo+IC0gYXJtICJ2aXJ0IiBtYWNoaW5lcwo+
IC0gInMzOTAtY2N3LXZpcnRpbyIgbWFjaGluZXMKPiAtIHBwYyAicHNlcmllcyIgbWFjaGluZXMK
PiAtIHg4NiBwaWl4L3EzNSBtYWNoaW5lcwo+IAo+IEF0IGxlYXN0LCBJIHRoaW5rIEkgc2hvdWxk
IHVwZGF0ZSB0aGlzIHBhdGNoIHRvIGFkZCBuZXcgMy4yIG1hY2hpbmVzIGZvciB0aG9zZS4KClRo
aXMgUUVNVSByZWxlYXNlIHNlZW1zIHRvIGJlIHVudXN1YWw6IG5vcm1hbGx5IHdlIGFkZCBmZWF0
dXJlcwp0aGF0IHJlcXVpcmUgYWRkaW5nIG5ldyBtYWNoaW5lLXR5cGVzIGxvbmcgYmVmb3JlIHNv
ZnQgZnJlZXplLgpJZiB3ZSBkaWRuJ3QgYWRkIG5ldyBtYWNoaW5lLXR5cGVzIHVudGlsIG5vdywg
dGhpcyBtZWFucyB3ZQpkaWRuJ3QgaW50cm9kdWNlIGFueSBndWVzdCBBQkkgY2hhbmdlcyB0aGF0
IHJlcXVpcmUgdGhlbS4KCk5vdywgdGhpcyBpcyBhbiBpbnRlcmVzdGluZyBjYXNlOiB3ZSBwcm9i
YWJseSBkb24ndCBfbmVlZF8gdGhlCm5ldyBtYWNoaW5lLXR5cGVzLCBidXQgdXNlcnMgbWlnaHQg
YmUgY29uZnVzZWQgaWYgdGhleSBkb24ndCBzZWUKbmV3IG1hY2hpbmUtdHlwZXMuICBTaG91bGQg
d2UgYWRkIHRoZW0gYW55d2F5PwoKCj4gCj4gSXMgdGhlcmUgYW55IHdheSB0byBjaGVjayBjb21w
YXQgcHJvcGVydGllcyBhcmUgaGFuZGxlZCBwcm9wZXJseSBmb3IKPiB0aG9zZSB2YXJpb3VzIG1h
Y2hpbmVzPyBJdCBsb29rcyBsaWtlIGl0IGlzIGdlbmVyYWxseSBsYWNraW5nLiBGb3IKPiBleGFt
cGxlLCBpZiB0aGVyZSBpcyBhIG5ldyBIV19DT01QQVQsIGl0IHdvdWxkIGJlIG5pY2UgaWYgc29t
ZXRoaW5nCj4gZmFpbGVkIGlmIGEgY29ycmVzcG9uZGluZyBtYWNoaW5lIGhhc24ndCBiZWVuIGFk
ZGVkLgo+IAo+IEl0IGFsc28gbG9va3MgbGlrZSB0aGVyZSBpcyBhIGJpdCBvZiBjb2RlIGR1cGxp
Y2F0aW9uIGFuZCBhIGJpdCB0b28KPiBtdWNoIG1hY3JvcyA6KSB1bmZvcnR1bmF0ZWx5LCBJIGRv
bid0IHlldCBoYXZlIGEgZ29vZCBpZGVhIGhvdyB0bwo+IGltcHJvdmUgdGhpbmdzLi4uCgpJIGRy
ZWFtIHdpdGggdGhlIGRheSBhbGwgdGhpcyBjb21wYXRpYmlsaXR5IGRhdGEgd2lsbCBiZSB0cmVh
dGVkCmxpa2Ugd2hhdCBpdCBpczoganVzdCBkYXRhLiAgVGhlIHVnbHkgbWFjcm8gdHJpY2tlcnkg
bmVlZHMgdG8gZ28KYXdheSBldmVudHVhbGx5LCBidXQgdGhpcyByZXF1aXJlcyBtYWtpbmcgdGhl
IFFPTS9tYWNoaW5lLXR5cGUKQVBJcyBtb3JlIHByYWN0aWNhbC4KClJlbW92aW5nIHZlcnkgb2xk
IG1hY2hpbmUtdHlwZXMgd2lsbCBwcm9iYWJseSBtYWtlIHRoaXMgdGFzawplYXNpZXIsIGJlY2F1
c2UgdGhleSBhcmUgdGhlIG1haW4gc291cmNlIG9mIGNvbXBhdGliaWxpdHkgY29kZQp0aGF0IGlz
IG5vdCByZXByZXNlbnRlZCBhcyA8ZHJpdmVyLnByb3BlcnR5PXZhbHVlPiB0dXBsZXMgKGdyZXAK
Zm9yICJzdGF0aWMgdm9pZCBwY19jb21wYXRfIiBhbmQgeW91J2xsIHNlZSB0aGVtKS4KCi0tIApF
ZHVhcmRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
