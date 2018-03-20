From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 13:58:32 +0000
Message-ID: <20180320135832.GT4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
 <20180320134117.GS4530@redhat.com>
 <20180320154703-mutt-send-email-mst@kernel.org>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iii=gk=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eyHmv-0003HJ-Cu
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:58:53 +0000
Content-Disposition: inline
In-Reply-To: <20180320154703-mutt-send-email-mst@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDM6NTA6MDJQTSArMDIwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDIwLCAyMDE4IGF0IDAxOjQxOjE3UE0gKzAwMDAsIERh
bmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAyMCwgMjAxOCBhdCAwMjoz
MjoxNlBNICswMTAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+ID4gPiAgIEhpLAo+ID4gPiAKPiA+
ID4gPiA+IFNvIGZvciB0aGVzZSwgd2Ugc2hvdWxkIHVzZSAiIi4gIE5vbmUgb2YgdGhlc2UgYXJl
IGdlbmVyYXRlZCBmaWxlcyB0aG91Z2guCj4gPiA+ID4gCj4gPiA+ID4gVGhhdCBsZWFkcyB0byBj
cmF6eSBpbmNvbnNpc3RlbnQgbWVzc2FnZSBmb3IgZGV2ZWxvcGVycyB3aGVyZSA1MCUgb2YgUUVN
VQo+ID4gPiA+IGhlYWRlciBmaWxlcyBtdXN0IHVzZSA8PiBhbmQgdGhlIG90aGVyIDUwJSBvZiBo
ZWFkZXIgZmlsZXMgbXVzdCB1c2UgIiIuCj4gPiA+IAo+ID4gPiBUaGUgcnVsZXMgYXJlIHByZXR0
eSBzaW1wbGUgdGhvdWdoOgo+ID4gPiAKPiA+ID4gICAgKDEpIEhlYWRlcnMgd2hpY2ggYXJlIGdl
bmVyYXRlZCB1c2UgPD4uCj4gPiA+ICAgICgyKSBIZWFkZXJzIHdoaWNoIGFyZSBpbiBpbmNsdWRl
LyB1c2UgPD4uCj4gPiA+ICAgICgzKSBIZWFkZXJzIHNpdHRpbmcgaW4gdGhlIHNhbWUgZGlyZWN0
b3J5IGFzIHRoZSBzb3VyY2UgZmlsZXMgdXNlICIiLgo+ID4gCj4gPiBXZSBoYXZlIDEyMDAgaGVh
ZGVyIGZpbGVzIGluIFFFTVUgLSBhIGRldmVsb3BlciBtaWdodCBqdXN0IHJlYXNvbmFibHkgcmVt
ZW1iZXIKPiA+IHdoaWNoIGhlYWRlciBmaWxlIGlzIGEgUUVNVSBoZWFkZXIsIHZzIHdoaWNoIGlz
IGEgM3JkIHBhcnR5IHN5c3RlbSBoZWFkZXIuCj4gPiBFeHBlY3RpbmcgZGV2cyB0byByZW1lbWJl
ciB3aGljaCBvZiB0aG9zZSAzIGJ1Y2tldHMgZWFjaCBRRU1VIGhlYWRlciBmYWxscwo+ID4gdW5k
ZXIgaXMgdW5yZWFzb25hYmxlIElNSE8uIAo+IAo+IFRoYXQncyB0aGUgQyBsYW5ndWFnZSBmb3Ig
eW91IHRob3VnaC4gIEZvciBiZXR0ZXIgb3Igd29yc2UsIHRoZXNlIGFyZQo+IHRoZSBydWxlcyB0
aGF0IEsmUiBjYW1lIHVwIHdpdGguCgpObyBvbmUgc2VyaW91c2x5IHRyaWVzIHRvIGtlZXAgY29t
cGxpYW5jZSB3aXRoIG9yaWdpbmFsIEsmUiBDIHRoZXNlIGRheXMsCnRoaW5ncyBoYXZlIG1vdmVk
IG9uIG1hc3NpdmVseSBzaW5jZSB0aGVuLgoKUmVnYXJkcywKRGFuaWVsCi0tIAp8OiBodHRwczov
L2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9k
YmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAg
IGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhv
dG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
