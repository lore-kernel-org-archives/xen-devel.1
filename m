From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 13:52:47 +0200
Message-ID: <20180320135057-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
 <20180320102719.GF4530@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyFpF-0008VW-Ei
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 11:53:09 +0000
Content-Disposition: inline
In-Reply-To: <20180320102719.GF4530@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU Developers <qemu-devel@nongnu.org>, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.co>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMTA6Mjc6MTlBTSArMDAwMCwgRGFuaWVsIFAuIEJlcnJh
bmfDqSB3cm90ZToKPiBPbiBUdWUsIE1hciAyMCwgMjAxOCBhdCAxMDowMToyNEFNICswMDAwLCBQ
ZXRlciBNYXlkZWxsIHdyb3RlOgo+ID4gT24gMjAgTWFyY2ggMjAxOCBhdCAwOTo0NCwgRGFuaWVs
IFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+IFdlIGNhbiBm
b2xsb3cgd2hhdCBhdXRvY29uZiBkb2VzLCBhbmQgYWRkIGEgY2hlY2sgdG8gY29uZmlndXJlIHRv
IHNlZSBpZgo+ID4gPiB0aGVyZSBhcmUgZ2VuZXJhdGVkIGZpbGVzIGxlZnQgaW4gdGhlIHNvdXJj
ZSBkaXIsIHdoZW4gY29uZmlndXJpbmcgd2l0aAo+ID4gPiBidWlsZGRpciAhPSBzcmNkaXIsIGFu
ZCBleGl0IHdpdGggZXJyb3IsIHRlbGxpbmcgdXNlciB0byBjbGVhbiB0aGVpcgo+ID4gPiBzcmMg
ZGlyIGZpcnN0Lgo+ID4gCj4gPiBXZSBhbHJlYWR5IGRvIHRoaXMgaW4gb3VyIG1ha2VmaWxlLi4u
aXQganVzdCBkb2Vzbid0IGNoZWNrIGV2ZXJ5Cj4gPiBzaW5nbGUgZ2VuZXJhdGVkIGZpbGUuCj4g
Cj4gQWggeWVzLCBpbmRlZWQ6Cj4gCj4gJCBtYWtlCj4gTWFrZWZpbGU6NTk6ICoqKiBUaGlzIGlz
IGFuIG91dCBvZiB0cmVlIGJ1aWxkIGJ1dCB5b3VyIHNvdXJjZSB0cmVlCj4gKC9ob21lL2JlcnJh
bmdlL3NyYy92aXJ0L3FlbXUpIHNlZW1zIHRvIGhhdmUgYmVlbiB1c2VkIGZvciBhbiBpbi10cmVl
Cj4gYnVpbGQuIFlvdSBjYW4gZml4IHRoaXMgYnkgcnVubmluZyAibWFrZSBkaXN0Y2xlYW4gJiYg
cm0gLXJmICotbGludXgtdXNlcgo+ICAqLXNvZnRtbXUiIGluIHlvdXIgc291cmNlIHRyZWUuICBT
dG9wLgo+IAo+IAo+IEl0IGlzIGNoZWNraW5nIGZvciBleGlzdGFuY2Ugb2YgY29uZmlnLWhvc3Qu
bWFrLgo+IAo+IFdlIGhhdmUgYSBjb252ZW5pZW50IGxpc3Qgb2YgZ2VuZXJhdGVkIGZpbGVzIGlu
ICQoR0VORVJBVEVEX0ZJTEVTKSwgc28KPiBJIHdvbmRlciBpZiB0aGVyZSdzIGEgcHJhY3RpY2Fs
IHdheSB0byBjaGVjayBhbGwgb2YgdGhvc2UgdG9vLgo+IAo+IFJlZ2FyZHMsCj4gRGFuaWVsCgpX
aXRoIG15IHBhdGNoIHByZXNlbmNlIG9mIHRoZXNlIGZpbGVzIG1vc3RseSBzdG9wcyBiZWluZyBh
biBpc3N1ZS4KCj4gLS0gCj4gfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0
cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cj4gfDogaHR0cHM6Ly9saWJ2
aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2Uu
Y29tIDp8Cj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8v
d3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
