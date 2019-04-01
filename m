From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 01/49] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Mon, 1 Apr 2019 12:37:42 +0200
Message-ID: <adeb1d68-6c1b-56c1-19a3-b78b347e69ec@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-2-jgross@suse.com>
 <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
 <a2674c24-92bf-28bd-017c-fe250f7617c2@suse.com>
 <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAuK2-0000m5-8k
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:37:46 +0000
In-Reply-To: <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMjoyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MS8xOSAxMDo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDEvMDQvMjAxOSAxMToy
MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMy8yOS8xOSAzOjA4IFBN
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IGNwdV9kaXNhYmxlX3NjaGVkdWxlcigpIGlzIGJl
aW5nIGNhbGxlZCBmcm9tIF9fY3B1X2Rpc2FibGUoKSB0b2RheS4KPj4+PiBUaGVyZSBpcyBubyBu
ZWVkIHRvIGV4ZWN1dGUgaXQgb24gdGhlIGNwdSBqdXN0IGJlaW5nIGRpc2FibGVkLCBzbyB1c2UK
Pj4+PiB0aGUgQ1BVX0RFQUQgY2FzZSBvZiB0aGUgY3B1IG5vdGlmaWVyIGNoYWluLiBNb3Zpbmcg
dGhlIGNhbGwgb3V0IG9mCj4+Pj4gc3RvcF9tYWNoaW5lKCkgY29udGV4dCBpcyBmaW5lLCBhcyB3
ZSBqdXN0IG5lZWQgdG8gaG9sZCB0aGUgZG9tYWluIFJDVQo+Pj4+IGxvY2sgYW5kIG5lZWQgdGhl
IHNjaGVkdWxlciBwZXJjcHUgZGF0YSB0byBiZSBzdGlsbCBhbGxvY2F0ZWQuCj4+Pj4KPj4+PiBB
ZGQgYW5vdGhlciBob29rIGZvciBDUFVfRE9XTl9QUkVQQVJFIHRvIGJhaWwgb3V0IGVhcmx5IGlu
IGNhc2UKPj4+PiBjcHVfZGlzYWJsZV9zY2hlZHVsZXIoKSB3b3VsZCBmYWlsLiBUaGlzIHdpbGwg
YXZvaWQgY3Jhc2hlcyBpbiByYXJlCj4+Pj4gY2FzZXMgZm9yIGNwdSBob3RwbHVnIG9yIHN1c3Bl
bmQuCj4+Pj4KPj4+PiBXaGlsZSBhdCBpdCByZW1vdmUgYSBzdXBlcmZsdW91cyBzbXBfbWIoKSBp
biB0aGUgQVJNIF9fY3B1X2Rpc2FibGUoKQo+Pj4+IGluY2FybmF0aW9uLgo+Pj4KPj4+IFRoaXMg
aXMgbm90IG9idmlvdXMgd2h5IHRoZSBzbXBfbWIoKSBpcyBzdXBlcmZsdW91cy4gQ2FuIHlvdSBw
bGVhc2UKPj4+IHByb3ZpZGUgbW9yZSBkZXRhaWxzIG9uIHdoeSB0aGlzIGlzIG5vdCBuZWNlc3Nh
cnk/Cj4+Cj4+IGNwdW1hc2tfY2xlYXJfY3B1KCkgc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGUgbmVl
ZGVkIHNlbWFudGljcywgbm8/Cj4+IEl0IGlzIGJhc2VkIG9uIGNsZWFyX2JpdCgpIHdoaWNoIGlz
IGRlZmluZWQgdG8gYmUgYXRvbWljLgo+IAo+IGF0b21pY2l0eSBkb2VzIG5vdCBtZWFuIHRoZSBz
dG9yZS9sb2FkIGNhbm5vdCBiZSByZS1vcmRlcmVkIGJ5IHRoZSBDUFUuCj4gWW91IHdvdWxkIG5l
ZWQgYSBiYXJyaWVyIHRvIHByZXZlbnQgcmUtb3JkZXJpbmcuCj4gCj4gY3B1bWFza19jbGVhcl9j
cHUoKSBhbmQgY2xlYXJfYml0KCkgZG9lcyBub3QgY29udGFpbiBhbnkgYmFycmllciwgc28KPiBz
dG9yZS9sb2FkIGNhbiBiZSByZS1vcmRlcmVkLgoKVWgsIGNvdWxkbid0IHRoaXMgbGVhZCB0byBw
cm9ibGVtcywgZS5nLiBpbiB2Y3B1X2Jsb2NrKCk/IFRoZSBjb21tZW50CnRoZXJlIHN1Z2dlc3Rz
IHRoZSBzZXF1ZW5jZSBvZiBzZXR0aW5nIHRoZSBibG9ja2VkIGJpdCBhbmQgZG9pbmcgdGhlCnRl
c3QgaXMgaW1wb3J0YW50IGZvciBhdm9pZGluZyBhIHJhY2UuLi4KCgpKdWVyZ2VuCgo+IAo+IEkg
c2VlIHdlIGhhdmUgc2ltaWxhciBzbXBfbWIoKSBiYXJyaWVyIGluIF9fY3B1X2RpZSgpLiBTYWRs
eSwgdGhlcmUgYXJlCj4gbm8gZG9jdW1lbnRhdGlvbiBpbiB0aGUgY29kZSB3aHkgdGhlIGJhcnJp
ZXIgaXMgaGVyZS4gVGhlIGxvZ3MgZG9uJ3QKPiBoZWxwIGVpdGhlci4KPiAKPiBUaGUgYmFycmll
ciBoZXJlIHdpbGwgZW5zdXJlIHRoYXQgdGhlIGxvYWQvc3RvcmUgcmVsYXRlZCB0byBkaXNhYmxp
bmcKPiB0aGUgQ1BVIGFyZSBzZWVuIGJlZm9yZSBhbnkgbG9hZC9zdG9yZSBoYXBwZW5pbmcgYWZ0
ZXIgdGhlIHJldHVybi4KPiBBbHRob3VnaCwgSSBhbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBuZWNl
c3NhcnkuCj4gCj4gU3RlZmFubywgRG8geW91IHJlbWVtYmVyIHRoZSByYXRpb25hbGU/Cj4gCj4g
Q2hlZXJzLAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
