From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu: include generated files
 with <> and not ""
Date: Tue, 20 Mar 2018 17:34:01 +0000
Message-ID: <20180320173401.GG4530__22695.3890327879$1521567243$gmane$org@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
 <20180320185130-mutt-send-email-mst@kernel.org>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iii=gk=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eyL9q-0008Hj-Pc
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 17:34:46 +0000
Content-Disposition: inline
In-Reply-To: <20180320185130-mutt-send-email-mst@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>, Eduardo Habkost <ehabkost@redhat.com>, Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.z>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDc6MTA6NDJQTSArMDIwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDIwLCAyMDE4IGF0IDA1OjMzOjQyUE0gKzAxMDAsIFN0
ZWZhbiBXZWlsIHdyb3RlOgo+ID4gVXNpbmcgPD4gZm9yIHN5c3RlbSBpbmNsdWRlIGZpbGVzIGFu
ZCAiIiBmb3IgbG9jYWwgaW5jbHVkZSBmaWxlcyBpcyBhCj4gPiBjb252ZW50aW9uLCBhbmQgYXMg
ZmFyIGFzIEkga25vdyBtb3N0IHByb2plY3RzIGFkaGVyZSB0byB0aGF0Cj4gPiBjb252ZW50aW9u
LiBTbyBkb2VzIFFFTVUgY3VycmVudGx5LiBTdWNoIGNvbnZlbnRpb25zIGFyZSBub3Qgb25seQo+
ID4gaW1wb3J0YW50IGZvciBodW1hbnMsIGJ1dCBhbHNvIGZvciB0b29scy4gVGhlcmUgYXJlIG1v
cmUgdG9vbHMgdGhhbiB0aGUKPiA+IEMgcHJlcHJvY2Vzc29yIHdoaWNoIGhhbmRsZSA8PiBhbmQg
IiIgZGlmZmVyZW50bHkuIEZvciBleGFtcGxlIHRoZSBHTlUKPiA+IGNvbXBpbGVyIHVzZXMgLU1E
IG9yIC1NTUQgdG8gYXV0b21hdGljYWxseSBnZW5lcmF0ZSBkZXBlbmRlbmN5IHJ1bGVzIGZvcgo+
ID4gbWFrZS4gV2hpbGUgLU1EIGdlbmVyYXRlcyBkZXBlbmRlbmNpZXMgdG8gYWxsIGluY2x1ZGUg
ZmlsZXMsIC1NTUQgZG9lcwo+ID4gc28gb25seSBmb3IgdXNlciBpbmNsdWRlIGZpbGVzLCBidXQg
bm90IGZvciBzeXN0ZW0gaW5jbHVkZSBmaWxlcy4gInVzZXIiCj4gPiBhbmQgInN5c3RlbSIgbWVh
bnMgdGhlIGRpZmZlcmVudCBmb3JtcyBob3cgaW5jbHVkZSBzdGF0ZW1lbnRzIGFyZQo+ID4gd3Jp
dHRlbi4gUUVNVSBzdGlsbCBzZWVtcyB0byB1c2UgLU1NRDoKPiA+IAo+ID4gcnVsZXMubWFrOlFF
TVVfREdGTEFHUyArPSAtTU1EIC1NUCAtTVQgJEAgLU1GICQoQEQpLyQoKkYpLmQKPiAKPiBUbyBt
eSBrbm93bGVkZ2UsIGFuZCBhY2NvcmRpbmcgdG8gbXkgbGltaXRlZCB0ZXN0aW5nLAo+IHN5c3Rl
bSBoZWFkZXJzIGluIHRoaXMgY29udGV4dCBtZWFucwo+IHRoZSBkZWZhdWx0IG9uZXMgbm90IHN1
cHBsaWVkIHdpdGggLUkuCgpHQ0MncyBkZWZpbml0aW9uIG9mIHN5c3RlbSBoZWFkZXIgaXMgaGVy
ZToKCiAgaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2NwcC9TeXN0ZW0tSGVhZGVycy5o
dG1sCgoKUmVnYXJkcywKRGFuaWVsCi0tIAp8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1v
LSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6
Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVy
cmFuZ2UuY29tIDp8Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRw
czovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
