From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] xen: events: free irqs in error
	condition
Date: Wed, 28 Feb 2018 09:27:12 +0100
Message-ID: <ea7f2264-08e4-d107-ac95-89488c144fa4__26450.8832282901$1519806370$gmane$org@suse.com>
References: <1519746958-52077-1-git-send-email-aams@amazon.com>
 <1519746958-52077-3-git-send-email-aams@amazon.com>
 <20180227170740.jcaxsvpepsn6eot2@MacBook-Pro-de-Roger.local>
 <1519752774.4965.23.camel@amazon.com>
 <20180228081623.umnyv4w67h2rsrwk@MacBook-Pro-de-Roger.local>
 <1519806324.4965.25.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=j4wv=fw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqx57-0003Wm-Lm
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 08:27:21 +0000
In-Reply-To: <1519806324.4965.25.camel@amazon.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Shah, Amit" <aams@amazon.de>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "anoob.soman@citrix.com" <anoob.soman@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "shuo.a.liu@intel.com" <shuo.a.liu@intel.com>, "Valentin,
 Eduardo" <eduval@lab126.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "kys@microsoft.com" <kys@microsoft.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMDk6MjUsIFNoYWgsIEFtaXQgd3JvdGU6Cj4gCj4gT24gTWksIDIwMTgtMDIt
MjggYXQgMDg6MTYgKzAwMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFR1ZSwgRmVi
IDI3LCAyMDE4IGF0IDA1OjMyOjUzUE0gKzAwMDAsIFNoYWgsIEFtaXQgd3JvdGU6Cj4+Pgo+Pj4K
Pj4+IE9uIERpLCAyMDE4LTAyLTI3IGF0IDE3OjA3ICswMDAwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Cj4+Pj4gT24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDM6NTU6NThQTSArMDAwMCwg
QW1pdCBTaGFoIHdyb3RlOgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJbiBjYXNlIG9mIGVycm9ycyBpbiBp
cnEgc2V0dXAgZm9yIE1TSSwgZnJlZSB1cCB0aGUgYWxsb2NhdGVkCj4+Pj4+IGlycXMuCj4+Pj4+
Cj4+Pj4+IEZpeGVzOiA0ODkyYzliNGFkYTlmOSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBt
ZXNzYWdlCj4+Pj4+IGdyb3VwcyIpCj4+Pj4+IFJlcG9ydGVkLWJ5OiBIb29tYW4gTWlyaGFkaSA8
bWlyaGFkaWhAYW1hem9uLmNvbT4KPj4+Pj4gQ0M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+
Pj4+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pj4+IEND
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+Pj4+PiBDQzog
RWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+Cj4+Pj4+IENDOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+IENDOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KPj4+Pj4gQ0M6ICJLLiBZLiBTcmluaXZhc2FuIiA8a3lzQG1pY3Jvc29mdC5j
b20+Cj4+Pj4+IENDOiBMaXUgU2h1byA8c2h1by5hLmxpdUBpbnRlbC5jb20+Cj4+Pj4+IENDOiBB
bm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
QW1pdCBTaGFoIDxhYW1zQGFtYXpvbi5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoGRyaXZlcnMveGVu
L2V2ZW50cy9ldmVudHNfYmFzZS5jIHwgNSArKysrLQo+Pj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCj4+Pj4+IGIvZHJpdmVycy94ZW4vZXZlbnRz
L2V2ZW50c19iYXNlLmMKPj4+Pj4gaW5kZXggYzg2ZDEwZS4uYTI5OTU4NiAxMDA2NDQKPj4+Pj4g
LS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPj4+Pj4gKysrIGIvZHJpdmVy
cy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPj4+Pj4gQEAgLTc1MCwxMSArNzUwLDE0IEBAIGlu
dCB4ZW5fYmluZF9waXJxX21zaV90b19pcnEoc3RydWN0Cj4+Pj4+IHBjaV9kZXYKPj4+Pj4gKmRl
diwgc3RydWN0IG1zaV9kZXNjICptc2lkZXNjLAo+Pj4+PiDCoAo+Pj4+PiDCoAlyZXQgPSBpcnFf
c2V0X21zaV9kZXNjKGlycSwgbXNpZGVzYyk7Cj4+Pj4+IMKgCWlmIChyZXQgPCAwKQo+Pj4+PiAt
CQlnb3RvIGVycm9yX2lycTsKPj4+Pj4gKwkJZ290byBlcnJvcl9kZXNjOwo+Pj4+PiDCoG91dDoK
Pj4+Pj4gwqAJbXV0ZXhfdW5sb2NrKCZpcnFfbWFwcGluZ191cGRhdGVfbG9jayk7Cj4+Pj4+IMKg
CXJldHVybiBpcnE7Cj4+Pj4+IMKgZXJyb3JfaXJxOgo+Pj4+PiArCXdoaWxlICgtLW52ZWMgPj0g
aSkKPj4+Pj4gKwkJeGVuX2ZyZWVfaXJxKGlycSArIG52ZWMpOwo+Pj4+PiArZXJyb3JfZGVzYzoK
Pj4+Pj4gwqAJd2hpbGUgKGkgPiAwKSB7Cj4+Pj4+IMKgCQlpLS07Cj4+Pj4+IMKgCQlfX3VuYmlu
ZF9mcm9tX2lycShpcnEgKyBpKTsKPj4+PiBJdCBzZWVtcyBwb2ludGxlc3MgdG8gaW50cm9kdWNl
IGFub3RoZXIgbGFiZWwgYW5kIGFub3RoZXIgbG9vcCB0bwo+Pj4+IGZpeAo+Pj4+IHNvbWV0aGlu
ZyB0aGF0IGNhbiBiZSBmaXhlZCB3aXRoIGEgc2luZ2xlIGxhYmVsIGFuZCBhIHNpbmdsZQo+Pj4+
IGxvb3AsCj4+Pj4gdGhpcyBqdXN0IG1ha2VzIHRoZSBjb2RlIG1vcmUgY29tcGxleCBmb3Igbm8g
cmVhc29uLgo+Pj4gSSBkaXNhZ3JlZSwganVzdCBiZWNhdXNlIHRoZXJlIGFyZSB0d28gZGlmZmVy
ZW50IGNsZWFudXBzIHRvIGJlCj4+PiBtYWRlCj4+PiBmb3IgdHdvIGRpZmZlcmVudCBpc3N1ZXM7
IGl0J3Mgbm90IGFzIGlmIHRoZSBpZi4uIGFuZCBlbHNlCj4+PiBjb25kaXRpb25zCj4+PiBhcmUg
Z29pbmcgdG8gYmUgaW50ZXJsZWF2ZWQuCj4+IE9oLCBJIGRvbid0IG1pbmQgc28gbXVjaCB3aGV0
aGVyIGl0IGVuZHMgdXAgYmVpbmcgdHdvIHBhdGNoZXMgb3IgYQo+PiBzaW5nbGUgb25lLCBidXQg
SU1ITyB0aGUgY29kZSBzaG91bGQgZW5kIHVwIGxvb2tpbmcgc2ltaWxhciB0byB3aGF0IEkKPj4g
cHJvcG9zZWQsIEkgd291bGQgbGlrZSB0byBhdm9pZCBoYXZpbmcgdHdvIGxvb3BzIGFuZCB0d28g
bGFiZWxzLgo+Pgo+PiBDb3VsZCB5b3UgcmV3b3JrIHRoZSBzZXJpZXMgc28gdGhhdCB0aGUgZW5k
IHJlc3VsdCB1c2VzIGEgc2luZ2xlIGxvb3AKPj4gKGFuZCBsYWJlbCk/Cj4gCj4gVGhhdCB3YXMg
dGhlIHBhcnQgSSBkaWRuJ3QgbGlrZSBtdWNoLCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhl
Cj4gcGF0Y2ggY2FtZSBmcm9tIHlvdSA6KQoKSSdkIHByZWZlciBSb2dlcidzIHNvbHV0aW9uLCB0
b28uCgpSb2dlciwgaW4gY2FzZSB5b3UgZG9uJ3Qgd2FudCB0byB3cml0ZSB0aGUgcGF0Y2gsIEkg
Y2FuIGRvIGl0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
