From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Tue, 7 Aug 2018 15:49:34 +0200
Message-ID: <20180807134934.GA16837@kroah.com>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
 <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
 <nycvar.YFH.7.76.1807242351500.997@cbobk.fhfr.pm>
 <CAGXu5jJvTF0KXs+3J32u5v1Ba5gZd0Umgib6D6++ie+LzqnuWA@mail.gmail.com>
 <c616c38b-52cc-2f88-7ea3-00f3a572255a@csail.mit.edu>
 <CAGXu5j+Y5TNBY1WCz=4E8B5nFo2jzyswg6iaQja_92GZB+hE0w@mail.gmail.com>
 <8a87a705-97c0-eb3d-8878-8ffe052f065d@csail.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kyc7=kw=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fn2Mo-00029b-9Y
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 13:49:42 +0000
Content-Disposition: inline
In-Reply-To: <8a87a705-97c0-eb3d-8878-8ffe052f065d@csail.mit.edu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Dave Hansen <dave@sr71.net>, catalin.marinas@arm.com, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?iso-8859-1?Q?Micka=EBlSala=FCn?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>, srinidhir@vmware.com, KarimAllah Ahmed <karahmed>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMDMsIDIwMTggYXQgMDQ6MjA6MzFQTSAtMDcwMCwgU3JpdmF0c2EgUy4gQmhh
dCB3cm90ZToKPiBPbiA4LzIvMTggMzoyMiBQTSwgS2VlcyBDb29rIHdyb3RlOgo+ID4gT24gVGh1
LCBBdWcgMiwgMjAxOCBhdCAxMjoyMiBQTSwgU3JpdmF0c2EgUy4gQmhhdAo+ID4gPHNyaXZhdHNh
QGNzYWlsLm1pdC5lZHU+IHdyb3RlOgo+ID4+IE9uIDcvMjYvMTggNDowOSBQTSwgS2VlcyBDb29r
IHdyb3RlOgo+ID4+PiBPbiBUdWUsIEp1bCAyNCwgMjAxOCBhdCAzOjAyIFBNLCBKaXJpIEtvc2lu
YSA8amlrb3NAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+PiBPbiBUdWUsIDI0IEp1bCAyMDE4LCBT
cml2YXRzYSBTLiBCaGF0IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+PiBIb3dldmVyLCBpZiB5b3UgYXJl
IHByb3Bvc2luZyB0aGF0IHlvdSdkIGxpa2UgdG8gY29udHJpYnV0ZSB0aGUgZW5oYW5jZWQKPiA+
Pj4+PiBQVEkvU3BlY3RyZSAodXBzdHJlYW0pIHBhdGNoZXMgZnJvbSB0aGUgU0xFUyA0LjQgdHJl
ZSB0byA0LjQgc3RhYmxlLCBhbmQKPiA+Pj4+PiBoYXZlIHRoZW0gbWVyZ2VkIGluc3RlYWQgb2Yg
dGhpcyBwYXRjaCBzZXJpZXMsIHRoZW4gSSB3b3VsZCBjZXJ0YWlubHkKPiA+Pj4+PiB3ZWxjb21l
IGl0IQo+ID4+Pj4KPiA+Pj4+IEknZCBpbiBwcmluY2lwbGUgbG92ZSB1cyB0byBwdXNoIGV2ZXJ5
dGhpbmcgYmFjayB0byA0LjQsIGJ1dCB0aGVyZSBhcmUgYQo+ID4+Pj4gZmV3IHJlYXNvbnMgKCop
IHdoeSB0aGF0J3Mgbm90IGhhcHBlbmluZyBzaG9ydGx5Lgo+ID4+Pj4KPiA+Pj4+IEFueXdheSwg
dG8gcG9pbnQgb3V0IGV4cGxpY2l0bHkgd2hhdCdzIHJlYWxseSBuZWVkZWQgZm9yIHRob3NlIGZv
bGtzCj4gPj4+PiBydW5uaW5nIDQuNC1zdGFibGUgYW5kIHJlbHlpbmcgb24gUFRJIHByb3ZpZGlu
ZyBUaGUgUmVhbCBUaGluZyhUTSksIGl0J3MKPiA+Pj4+IGVpdGhlciBhIDQuNC1zdGFibGUgcG9y
dCBvZgo+ID4+Pj4KPiA+Pj4+ICAgICAgICAgaHR0cDovL2tlcm5lbC5zdXNlLmNvbS9jZ2l0L2tl
cm5lbC1zb3VyY2UvcGxhaW4vcGF0Y2hlcy5zdXNlL3g4Ni1lbnRyeS02NC11c2UtYS1wZXItY3B1
LXRyYW1wb2xpbmUtc3RhY2sucGF0Y2g/aWQ9MzQyOGE3N2IwMmIxYmEwM2U0NWQ4ZmMzNTJlYzM1
MDQyOWY1N2ZjNwo+ID4+Pj4KPiA+Pj4+IG9yIG1ha2luZyBUSFJFQURJTkZPX0dGUCBpbXBseSBf
X0dGUF9aRVJPLgo+ID4+Pgo+ID4+PiBUaGlzIGlzIHRydWUgaW4gTGludXMncyB0cmVlIG5vdy4g
U2hvdWxkIGJlIHRyaXZpYWwgdG8gYmFja3BvcnQ6Cj4gPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvbGludXMvZTAxZTgwNjM0ZWNkZAo+ID4+Pgo+ID4+Cj4gPj4gSGkgSmlyaSwgS2VlcywKPiA+
Pgo+ID4+IFRoYW5rIHlvdSBmb3Igc3VnZ2VzdGluZyB0aGUgcGF0Y2ghIEkgaGF2ZSBhdHRhY2hl
ZCB0aGUgKGxvY2FsbHkKPiA+PiB0ZXN0ZWQpIDQuNCBhbmQgNC45IGJhY2twb3J0cyBvZiB0aGF0
IHBhdGNoIHdpdGggdGhpcyBtYWlsLiAoVGhlCj4gPj4gbWFpbmxpbmUgY29tbWl0IGFwcGxpZXMg
Y2xlYW5seSBvbiA0LjE0KS4KPiA+Pgo+ID4+IEdyZWcsIGNvdWxkIHlvdSBwbGVhc2UgY29uc2lk
ZXIgaW5jbHVkaW5nIHRoZW0gaW4gc3RhYmxlIDQuNCwgNC45Cj4gPj4gYW5kIDQuMTQ/Cj4gPiAK
PiA+IEkgZG9uJ3QgdGhpbmsgeW91ciB2NC45IGlzIHN1ZmZpY2llbnQ6IGl0IGxlYXZlcyB0aGUg
dm1hcHBlZCBzdGFjawo+ID4gdW5jbGVhcmVkLiB2NC45IG5lZWRzIGNhMTgyNTUxODU3ICgia21l
bWxlYWs6IGNsZWFyIHN0YWxlIHBvaW50ZXJzCj4gPiBmcm9tIHRhc2sgc3RhY2tzIikgaW5jbHVk
ZWQgaW4gdGhlIGJhY2twb3J0IChyZWFsbHksIGp1c3QgYWRkaW5nIHRoZQo+ID4gbWVtc2V0KCkp
Lgo+ID4gCj4gCj4gQWgsIEkgc2VlLCB0aGFuayB5b3UhIEkgaGF2ZSBhdHRhY2hlZCB0aGUgdXBk
YXRlZCBwYXRjaHNldCBmb3IgNC45Cj4gd2l0aCB0aGlzIG1haWwuCj4gCj4gPiBPdGhlcndpc2Us
IHl1cCwgbG9va3MgZ29vZC4KPiA+IAo+IFRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIHRoZSBwYXRj
aGVzIQo+ICAKPiBSZWdhcmRzLAo+IFNyaXZhdHNhCj4gVk13YXJlIFBob3RvbiBPUwoKVGhlc2Ug
d29yayBmb3IgNC45LCBkbyB5b3UgYWxzbyBoYXZlIGEgc2V0IGZvciA0LjQ/Cgp0aGFua3MsCgpn
cmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
