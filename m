From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] SVM: re-work VMCB sync-ing
Date: Mon, 30 Apr 2018 18:07:49 +0100
Message-ID: <f2395d2e-8332-9d00-08e0-b25582f3a021@citrix.com>
References: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
 <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7czg=ht=citrix.com=prvs=6515eae1c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fDCHQ-0007Lo-Um
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 17:08:00 +0000
In-Reply-To: <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDQvMTggMTI6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIHRoZSBtYWluIHBy
b2JsZW0gdG8gYmUgYWRkcmVzc2VkIGhlcmUgaXMgdGhlIGlzc3VlIG9mIHdoYXQgc28gZmFyCj4g
d2FzIG5hbWVkICJ2bWNiX2luX3N5bmMiIHN0YXJ0aW5nIG91dCB3aXRoIHRoZSB3cm9uZyB2YWx1
ZSAoc2hvdWxkIGhhdmUKPiBiZWVuIHRydWUgaW5zdGVhZCBvZiBmYWxzZSwgdG8gcHJldmVudCBw
ZXJmb3JtaW5nIGEgVk1TQVZFIHdpdGhvdXQgZXZlcgo+IGhhdmluZyBWTUxPQURlZCB0aGUgdkNQ
VSdzIHN0YXRlKSwgZ28gYSBzdGVwIGZ1cnRoZXIgYW5kIG1ha2UgdGhlCj4gc3luYy1lZCBzdGF0
ZSBhIHRyaXN0YXRlOiBDUFUgYW5kIG1lbW9yeSBtYXkgYmUgaW4gc3luYyBvciBhbiB1cGRhdGUK
PiBtYXkgYmUgcmVxdWlyZWQgaW4gZWl0aGVyIGRpcmVjdGlvbi4gUmVuYW1lIHRoZSBmaWVsZCBh
bmQgaW50cm9kdWNlIGFuCj4gZW51bS4gQ2FsbGVycyBvZiBzdm1fc3luY192bWNiKCkgbm93IGlu
ZGljYXRlIHRoZSBpbnRlbmRlZCBuZXcgc3RhdGUKPiAod2l0aCBhIHNsaWdodCAiYW5vbWFseSIg
d2hlbiByZXF1ZXN0aW5nIFZNTE9BRDogd2UgY291bGQgc3RvcmUKPiB2bWNiX25lZWRzX3Ztc2F2
ZSBpbiB0aG9zZSBjYXNlcyBhcyB0aGUgY2FsbGVycyByZXF1ZXN0LCBidXQgdGhlIFZNQ0IKPiBy
ZWFsbHkgaXMgaW4gc3luYyBhdCB0aGF0IHBvaW50LCBhbmQgaGVuY2UgdGhlcmUncyBubyBuZWVk
IHRvIFZNU0FWRSBpbgo+IGNhc2Ugd2UgZG9uJ3QgbWFrZSBpdCBvdXQgdG8gZ3Vlc3QgY29udGV4
dCksIGFuZCBhbGwgc3luY2luZyBnb2VzCj4gdGhyb3VnaCB0aGF0IGZ1bmN0aW9uLgo+Cj4gV2l0
aCB0aGF0LCB0aGVyZSdzIG5vIG5lZWQgdG8gVk1MT0FEIHRoZSBzdGF0ZSBwZXJoYXBzIG11bHRp
cGxlIHRpbWVzOwo+IGFsbCB0aGF0J3MgbmVlZGVkIGlzIGxvYWRpbmcgaXQgb25jZSBiZWZvcmUg
Vk0gZW50cnkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gLS0tCj4gdjI6IEFsc28gaGFuZGxlIFZNTE9BRCBpbiBzdm1fc3luY192bWNiKCkuIEFk
ZCBjb21tZW50IHRvIGVudW0KPiAgICAgdm1jYl9zeW5jX3N0YXRlLgoKLTEgZnJvbSBtZS7CoCBU
aGlzIGlzIGV2ZW4gbW9yZSBjb25mdXNpbmcgdG8gdXNlIHRoYW4gdjEuCgpJdCBpcyBub3Qgb2J2
aW91cyBhdCBhbGwgdGhhdCB1c2luZyBzdm1fc3luY192bWNiKHYsIHZtY2JfbmVlZHNfdm1zYXZl
KTsKbWVhbnMgInZtbG9hZCIsIGFuZCBpdHMgYWN0aXZlbHkgd3JvbmcgdGhhdCB0aGUgc3RhdGUg
ZG9lc24ndCByZW1haW4KaW4tc3luYy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
