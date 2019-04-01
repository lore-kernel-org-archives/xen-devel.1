From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 01/49] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Mon, 1 Apr 2019 11:40:02 +0200
Message-ID: <a2674c24-92bf-28bd-017c-fe250f7617c2@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-2-jgross@suse.com>
 <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAtQE-0002lp-Sl
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 09:40:06 +0000
In-Reply-To: <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
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

T24gMDEvMDQvMjAxOSAxMToyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDMv
MjkvMTkgMzowOCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gY3B1X2Rpc2FibGVfc2NoZWR1
bGVyKCkgaXMgYmVpbmcgY2FsbGVkIGZyb20gX19jcHVfZGlzYWJsZSgpIHRvZGF5Lgo+PiBUaGVy
ZSBpcyBubyBuZWVkIHRvIGV4ZWN1dGUgaXQgb24gdGhlIGNwdSBqdXN0IGJlaW5nIGRpc2FibGVk
LCBzbyB1c2UKPj4gdGhlIENQVV9ERUFEIGNhc2Ugb2YgdGhlIGNwdSBub3RpZmllciBjaGFpbi4g
TW92aW5nIHRoZSBjYWxsIG91dCBvZgo+PiBzdG9wX21hY2hpbmUoKSBjb250ZXh0IGlzIGZpbmUs
IGFzIHdlIGp1c3QgbmVlZCB0byBob2xkIHRoZSBkb21haW4gUkNVCj4+IGxvY2sgYW5kIG5lZWQg
dGhlIHNjaGVkdWxlciBwZXJjcHUgZGF0YSB0byBiZSBzdGlsbCBhbGxvY2F0ZWQuCj4+Cj4+IEFk
ZCBhbm90aGVyIGhvb2sgZm9yIENQVV9ET1dOX1BSRVBBUkUgdG8gYmFpbCBvdXQgZWFybHkgaW4g
Y2FzZQo+PiBjcHVfZGlzYWJsZV9zY2hlZHVsZXIoKSB3b3VsZCBmYWlsLiBUaGlzIHdpbGwgYXZv
aWQgY3Jhc2hlcyBpbiByYXJlCj4+IGNhc2VzIGZvciBjcHUgaG90cGx1ZyBvciBzdXNwZW5kLgo+
Pgo+PiBXaGlsZSBhdCBpdCByZW1vdmUgYSBzdXBlcmZsdW91cyBzbXBfbWIoKSBpbiB0aGUgQVJN
IF9fY3B1X2Rpc2FibGUoKQo+PiBpbmNhcm5hdGlvbi4KPiAKPiBUaGlzIGlzIG5vdCBvYnZpb3Vz
IHdoeSB0aGUgc21wX21iKCkgaXMgc3VwZXJmbHVvdXMuIENhbiB5b3UgcGxlYXNlCj4gcHJvdmlk
ZSBtb3JlIGRldGFpbHMgb24gd2h5IHRoaXMgaXMgbm90IG5lY2Vzc2FyeT8KCmNwdW1hc2tfY2xl
YXJfY3B1KCkgc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGUgbmVlZGVkIHNlbWFudGljcywgbm8/Ckl0
IGlzIGJhc2VkIG9uIGNsZWFyX2JpdCgpIHdoaWNoIGlzIGRlZmluZWQgdG8gYmUgYXRvbWljLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
