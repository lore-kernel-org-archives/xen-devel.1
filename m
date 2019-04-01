From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 01/49] xen/sched: call
 cpu_disable_scheduler() via cpu notifier
Date: Mon, 1 Apr 2019 11:29:10 +0100
Message-ID: <fce58921-fdab-bb6c-092d-3f9b8a9b1e56@arm.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-2-jgross@suse.com>
 <dd8a9092-f175-b490-3820-d9aa100031fb@arm.com>
 <a2674c24-92bf-28bd-017c-fe250f7617c2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ypO=SD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hAuBn-0007Zg-9M
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:29:15 +0000
In-Reply-To: <a2674c24-92bf-28bd-017c-fe250f7617c2@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzEvMTkgMTA6NDAgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDEvMDQv
MjAxOSAxMToyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMy8yOS8xOSAz
OjA4IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gY3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkg
aXMgYmVpbmcgY2FsbGVkIGZyb20gX19jcHVfZGlzYWJsZSgpIHRvZGF5Lgo+Pj4gVGhlcmUgaXMg
bm8gbmVlZCB0byBleGVjdXRlIGl0IG9uIHRoZSBjcHUganVzdCBiZWluZyBkaXNhYmxlZCwgc28g
dXNlCj4+PiB0aGUgQ1BVX0RFQUQgY2FzZSBvZiB0aGUgY3B1IG5vdGlmaWVyIGNoYWluLiBNb3Zp
bmcgdGhlIGNhbGwgb3V0IG9mCj4+PiBzdG9wX21hY2hpbmUoKSBjb250ZXh0IGlzIGZpbmUsIGFz
IHdlIGp1c3QgbmVlZCB0byBob2xkIHRoZSBkb21haW4gUkNVCj4+PiBsb2NrIGFuZCBuZWVkIHRo
ZSBzY2hlZHVsZXIgcGVyY3B1IGRhdGEgdG8gYmUgc3RpbGwgYWxsb2NhdGVkLgo+Pj4KPj4+IEFk
ZCBhbm90aGVyIGhvb2sgZm9yIENQVV9ET1dOX1BSRVBBUkUgdG8gYmFpbCBvdXQgZWFybHkgaW4g
Y2FzZQo+Pj4gY3B1X2Rpc2FibGVfc2NoZWR1bGVyKCkgd291bGQgZmFpbC4gVGhpcyB3aWxsIGF2
b2lkIGNyYXNoZXMgaW4gcmFyZQo+Pj4gY2FzZXMgZm9yIGNwdSBob3RwbHVnIG9yIHN1c3BlbmQu
Cj4+Pgo+Pj4gV2hpbGUgYXQgaXQgcmVtb3ZlIGEgc3VwZXJmbHVvdXMgc21wX21iKCkgaW4gdGhl
IEFSTSBfX2NwdV9kaXNhYmxlKCkKPj4+IGluY2FybmF0aW9uLgo+Pgo+PiBUaGlzIGlzIG5vdCBv
YnZpb3VzIHdoeSB0aGUgc21wX21iKCkgaXMgc3VwZXJmbHVvdXMuIENhbiB5b3UgcGxlYXNlCj4+
IHByb3ZpZGUgbW9yZSBkZXRhaWxzIG9uIHdoeSB0aGlzIGlzIG5vdCBuZWNlc3Nhcnk/Cj4gCj4g
Y3B1bWFza19jbGVhcl9jcHUoKSBzaG91bGQgYWxyZWFkeSBoYXZlIHRoZSBuZWVkZWQgc2VtYW50
aWNzLCBubz8KPiBJdCBpcyBiYXNlZCBvbiBjbGVhcl9iaXQoKSB3aGljaCBpcyBkZWZpbmVkIHRv
IGJlIGF0b21pYy4KCmF0b21pY2l0eSBkb2VzIG5vdCBtZWFuIHRoZSBzdG9yZS9sb2FkIGNhbm5v
dCBiZSByZS1vcmRlcmVkIGJ5IHRoZSBDUFUuIApZb3Ugd291bGQgbmVlZCBhIGJhcnJpZXIgdG8g
cHJldmVudCByZS1vcmRlcmluZy4KCmNwdW1hc2tfY2xlYXJfY3B1KCkgYW5kIGNsZWFyX2JpdCgp
IGRvZXMgbm90IGNvbnRhaW4gYW55IGJhcnJpZXIsIHNvIApzdG9yZS9sb2FkIGNhbiBiZSByZS1v
cmRlcmVkLgoKSSBzZWUgd2UgaGF2ZSBzaW1pbGFyIHNtcF9tYigpIGJhcnJpZXIgaW4gX19jcHVf
ZGllKCkuIFNhZGx5LCB0aGVyZSBhcmUgCm5vIGRvY3VtZW50YXRpb24gaW4gdGhlIGNvZGUgd2h5
IHRoZSBiYXJyaWVyIGlzIGhlcmUuIFRoZSBsb2dzIGRvbid0IApoZWxwIGVpdGhlci4KClRoZSBi
YXJyaWVyIGhlcmUgd2lsbCBlbnN1cmUgdGhhdCB0aGUgbG9hZC9zdG9yZSByZWxhdGVkIHRvIGRp
c2FibGluZyAKdGhlIENQVSBhcmUgc2VlbiBiZWZvcmUgYW55IGxvYWQvc3RvcmUgaGFwcGVuaW5n
IGFmdGVyIHRoZSByZXR1cm4uIApBbHRob3VnaCwgSSBhbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBu
ZWNlc3NhcnkuCgpTdGVmYW5vLCBEbyB5b3UgcmVtZW1iZXIgdGhlIHJhdGlvbmFsZT8KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
