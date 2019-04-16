From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC 01/49] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Tue, 16 Apr 2019 12:34:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904161232570.1370@sstabellini-ThinkPad-X260>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-2-jgross@suse.com>
 <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
 <a2674c24-92bf-28bd-017c-fe250f7617c2@suse.com>
 <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGTqz-0003s2-HF
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 19:34:49 +0000
In-Reply-To: <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gNC8x
LzE5IDEwOjQwIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gT24gMDEvMDQvMjAxOSAxMToy
MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IE9uIDMvMjkvMTkg
MzowOCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+ID4gPiBjcHVfZGlzYWJsZV9zY2hlZHVs
ZXIoKSBpcyBiZWluZyBjYWxsZWQgZnJvbSBfX2NwdV9kaXNhYmxlKCkgdG9kYXkuCj4gPiA+ID4g
VGhlcmUgaXMgbm8gbmVlZCB0byBleGVjdXRlIGl0IG9uIHRoZSBjcHUganVzdCBiZWluZyBkaXNh
YmxlZCwgc28gdXNlCj4gPiA+ID4gdGhlIENQVV9ERUFEIGNhc2Ugb2YgdGhlIGNwdSBub3RpZmll
ciBjaGFpbi4gTW92aW5nIHRoZSBjYWxsIG91dCBvZgo+ID4gPiA+IHN0b3BfbWFjaGluZSgpIGNv
bnRleHQgaXMgZmluZSwgYXMgd2UganVzdCBuZWVkIHRvIGhvbGQgdGhlIGRvbWFpbiBSQ1UKPiA+
ID4gPiBsb2NrIGFuZCBuZWVkIHRoZSBzY2hlZHVsZXIgcGVyY3B1IGRhdGEgdG8gYmUgc3RpbGwg
YWxsb2NhdGVkLgo+ID4gPiA+IAo+ID4gPiA+IEFkZCBhbm90aGVyIGhvb2sgZm9yIENQVV9ET1dO
X1BSRVBBUkUgdG8gYmFpbCBvdXQgZWFybHkgaW4gY2FzZQo+ID4gPiA+IGNwdV9kaXNhYmxlX3Nj
aGVkdWxlcigpIHdvdWxkIGZhaWwuIFRoaXMgd2lsbCBhdm9pZCBjcmFzaGVzIGluIHJhcmUKPiA+
ID4gPiBjYXNlcyBmb3IgY3B1IGhvdHBsdWcgb3Igc3VzcGVuZC4KPiA+ID4gPiAKPiA+ID4gPiBX
aGlsZSBhdCBpdCByZW1vdmUgYSBzdXBlcmZsdW91cyBzbXBfbWIoKSBpbiB0aGUgQVJNIF9fY3B1
X2Rpc2FibGUoKQo+ID4gPiA+IGluY2FybmF0aW9uLgo+ID4gPiAKPiA+ID4gVGhpcyBpcyBub3Qg
b2J2aW91cyB3aHkgdGhlIHNtcF9tYigpIGlzIHN1cGVyZmx1b3VzLiBDYW4geW91IHBsZWFzZQo+
ID4gPiBwcm92aWRlIG1vcmUgZGV0YWlscyBvbiB3aHkgdGhpcyBpcyBub3QgbmVjZXNzYXJ5Pwo+
ID4gCj4gPiBjcHVtYXNrX2NsZWFyX2NwdSgpIHNob3VsZCBhbHJlYWR5IGhhdmUgdGhlIG5lZWRl
ZCBzZW1hbnRpY3MsIG5vPwo+ID4gSXQgaXMgYmFzZWQgb24gY2xlYXJfYml0KCkgd2hpY2ggaXMg
ZGVmaW5lZCB0byBiZSBhdG9taWMuCj4gCj4gYXRvbWljaXR5IGRvZXMgbm90IG1lYW4gdGhlIHN0
b3JlL2xvYWQgY2Fubm90IGJlIHJlLW9yZGVyZWQgYnkgdGhlIENQVS4gWW91Cj4gd291bGQgbmVl
ZCBhIGJhcnJpZXIgdG8gcHJldmVudCByZS1vcmRlcmluZy4KPiAKPiBjcHVtYXNrX2NsZWFyX2Nw
dSgpIGFuZCBjbGVhcl9iaXQoKSBkb2VzIG5vdCBjb250YWluIGFueSBiYXJyaWVyLCBzbwo+IHN0
b3JlL2xvYWQgY2FuIGJlIHJlLW9yZGVyZWQuCj4gCj4gSSBzZWUgd2UgaGF2ZSBzaW1pbGFyIHNt
cF9tYigpIGJhcnJpZXIgaW4gX19jcHVfZGllKCkuIFNhZGx5LCB0aGVyZSBhcmUgbm8KPiBkb2N1
bWVudGF0aW9uIGluIHRoZSBjb2RlIHdoeSB0aGUgYmFycmllciBpcyBoZXJlLiBUaGUgbG9ncyBk
b24ndCBoZWxwIGVpdGhlci4KPiAKPiBUaGUgYmFycmllciBoZXJlIHdpbGwgZW5zdXJlIHRoYXQg
dGhlIGxvYWQvc3RvcmUgcmVsYXRlZCB0byBkaXNhYmxpbmcgdGhlIENQVQo+IGFyZSBzZWVuIGJl
Zm9yZSBhbnkgbG9hZC9zdG9yZSBoYXBwZW5pbmcgYWZ0ZXIgdGhlIHJldHVybi4gQWx0aG91Z2gs
IEkgYW0gbm90Cj4gc3VyZSB3aHkgdGhpcyBpcyBuZWNlc3NhcnkuCj4gCj4gU3RlZmFubywgRG8g
eW91IHJlbWVtYmVyIHRoZSByYXRpb25hbGU/CgovbWUgZG9pbmcgc29tZSBhcmNoZW9sb2d5CgpJ
IGFtIHByZXR0eSBzdXJlIGl0IHdhcyBtZWFudCB0byBhY2NvbXBhbnkgdGhlIGNwdW1hc2tfY2xl
YXJfY3B1IGNhbGwuIEkKdGhpbmsgd2Ugc2hvdWxkIGtlZXAgaXQgaW4gX19jcHVfZGlzYWJsZSBy
aWdodCBhZnRlciBjcHVtYXNrX2NsZWFyX2NwdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
