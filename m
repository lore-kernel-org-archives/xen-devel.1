From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 2/9] x86/vioapic: block
 speculative out-of-bound accesses
Date: Thu, 31 Jan 2019 09:05:10 -0700
Message-ID: <5C531CB60200007800212DC6@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-3-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <00FA27AF020000F8B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpEq2-0004mh-9Q
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 16:05:14 +0000
In-Reply-To: <00FA27AF020000F8B1E090C7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE5IGF0IDE1OjQzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBX
aGVuIGludGVyYWN0aW5nIHdpdGggaW8gYXBpYywgYSBndWVzdCBjYW4gc3BlY2lmeSB2YWx1ZXMg
dGhhdCBhcmUgdXNlZAo+IGFzIGluZGV4IHRvIHN0cnVjdHVyZXMsIGFuZCB3aG9zZSB2YWx1ZXMg
YXJlIG5vdCBjb21wYXJlZCBhZ2FpbnN0Cj4gdXBwZXIgYm91bmRzIHRvIHByZXZlbnQgc3BlY3Vs
YXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLiBUaGlzIGNoYW5nZQo+IHByZXZlbnRzIHRoZXNl
IHNwZWN1bGF0aXZlIGFjY2Vzc2VzLgo+IAo+IEZ1cnRoZXJtb3JlLCB0d28gdmFyaWFibGVzIGFy
ZSBpbml0aWFsaXplZCBhbmQgdGhlIGNvbXBpbGVyIGlzIGFza2VkIHRvCj4gbm90IG9wdGltaXpl
ZCB0aGVzZSBpbml0aWFsaXphdGlvbnMsIGFzIHRoZSB1bmluaXRpYWxpemVkLCBwb3RlbnRpYWxs
eQo+IGd1ZXN0IGNvbnRyb2xsZWQsIHZhcmlhYmxlcyBtaWdodCBiZSB1c2VkIGluIGEgc3BlY3Vs
YXRpdmUgb3V0LW9mLWJvdW5kCj4gYWNjZXNzLiBBcyB0aGUgdHdvIHByb2JsZW1hdGljIHZhcmlh
YmxlcyBhcmUgYm90aCB1c2VkIGluIHRoZSBjb21tb24KPiBmdW5jdGlvbiBnc2lfdmlvYXBpYywg
dGhlIG1pdGlnYXRpb24gaXMgaW1wbGVtZW50ZWQgdGhlcmUuIEN1cnJlbnRseSwKPiB0aGUgcHJv
YmxlbWF0aWMgY2FsbGVycyBhcmUgdGhlIGZ1bmN0aW9ucyB2aW9hcGljX2lycV9wb3NpdGl2ZV9l
ZGdlIGFuZAo+IHZpb2FwaWNfZ2V0X3RyaWdnZXJfbW9kZS4KCkkgd291bGQgaGF2ZSB3aXNoZWQg
Zm9yIHlvdSB0byBzYXkgd2h5IHRoZSBvdGhlciB0d28gYXJlIF9ub3RfCmEgcHJvYmxlbS4gQWZh
aWN0IGluIGJvdGggY2FzZXMgdGhlIGZ1bmN0aW9ucyBvbmx5IGV2ZXIgZ2V0CmludGVybmFsIGRh
dGEgcGFzc2VkLgoKVGhlbiBhZ2FpbiBJJ20gbm90IGNvbnZpbmNlZCBpdCdzIHdvcnRoIHRha2lu
ZyB0aGUgcmlzayB0aGF0IGEKcHJvYmxlbWF0aWMgY2FsbGVyIGdldHMgYWRkZWQgZG93biB0aGUg
cm9hZC4gSG93IGFib3V0IHlvdSBhZGQKaW5pdGlhbGl6ZXJzIGV2ZXJ5d2hlcmUsIGNsYXJpZnlp
bmcgaW4gdGhlIGRlc2NyaXB0aW9uIHRoYXQgaXQncyAianVzdAppbiBjYXNlIiBmb3IgdGhlIHR3
byBjdXJyZW50bHkgc2FmZSBvbmVzPwoKPiBUaGlzIGNvbW1pdCBpcyBwYXJ0IG9mIHRoZSBTcGVj
dHJlVjErTDFURiBtaXRpZ2F0aW9uIHBhdGNoIHNlcmllcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBO
b3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiAKPiAtLS0KCkJ0dy4sIGNvdWxk
IHlvdSBwbGVhc2UgZ2V0IHVzZWQgdG8gdGhlIGhhYml0IG9mIGFkZGluZyBhIGJyaWVmCnN1bW1h
cnkgb2YgY2hhbmdlcyBmb3IgYXQgbGVhc3QgdGhlIG1vc3QgcmVjZW50IHZlcnNpb24gaGVyZSwK
d2hpY2ggYWlkcyByZXZpZXcgcXVpdGUgYSBiaXQ/Cgo+IEBAIC0yMTIsNyArMjIwLDE1IEBAIHN0
YXRpYyB2b2lkIHZpb2FwaWNfd3JpdGVfcmVkaXJlbnQoCj4gICAgICBzdHJ1Y3QgaHZtX2lycSAq
aHZtX2lycSA9IGh2bV9kb21haW5faXJxKGQpOwo+ICAgICAgdW5pb24gdmlvYXBpY19yZWRpcl9l
bnRyeSAqcGVudCwgZW50Owo+ICAgICAgaW50IHVubWFza2VkID0gMDsKPiAtICAgIHVuc2lnbmVk
IGludCBnc2kgPSB2aW9hcGljLT5iYXNlX2dzaSArIGlkeDsKPiArICAgIHVuc2lnbmVkIGludCBn
c2k7Cj4gKwo+ICsgICAgLyogQ2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uIHNob3VsZCBtYWtlIHN1
cmUgaWR4IGlzIGJvdW5kZWQgYXBwcm9wcmlhdGVseSovCgpNaXNzaW5nIGJsYW5rIGF0IHRoZSBl
bmQgb2YgdGhlIGNvbW1lbnQgKHdoaWNoLCBpZiB0aGlzIHdhcyB0aGUKb25seSBvcGVuIHBvaW50
LCB3b3VsZCBiZSBlYXN5IGVub3VnaCB0byBhZGp1c3Qgd2hpbGUgY29tbWl0dGluZykuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
