From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF v9 2/7] nospec: introduce
 evaluate_nospec
Date: Thu, 28 Feb 2019 05:21:12 -0700
Message-ID: <5C77D238020000780021B0F6@prv1-mh.provo.novell.com>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
 <1551284020-7050-3-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gzKgi-0005qZ-BT
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 12:21:20 +0000
In-Reply-To: <1551284020-7050-3-git-send-email-nmanthey@amazon.de>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDE3OjEzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBT
aW5jZSB0aGUgTDFURiB2dWxuZXJhYmlsaXR5IG9mIEludGVsIENQVXMsIGxvYWRpbmcgaHlwZXJ2
aXNvciBkYXRhIGludG8KPiBMMSBjYWNoZSBpcyBwcm9ibGVtYXRpYywgYmVjYXVzZSB3aGVuIGh5
cGVydGhyZWFkaW5nIGlzIHVzZWQgYXMgd2VsbCwgYQo+IGd1ZXN0IHJ1bm5pbmcgb24gdGhlIHNp
YmxpbmcgY29yZSBjYW4gbGVhayB0aGlzIHBvdGVudGlhbGx5IHNlY3JldCBkYXRhLgo+IAo+IFRv
IHByZXZlbnQgdGhlc2Ugc3BlY3VsYXRpdmUgYWNjZXNzZXMsIHdlIGJsb2NrIHNwZWN1bGF0aW9u
IGFmdGVyCj4gYWNjZXNzaW5nIHRoZSBkb21haW4gcHJvcGVydHkgZmllbGQgYnkgYWRkaW5nIGxm
ZW5jZSBpbnN0cnVjdGlvbnMuIFRoaXMKPiB3YXksIHRoZSBDUFUgY29udGludWVzIGV4ZWN1dGlu
ZyBhbmQgbG9hZGluZyBkYXRhIG9ubHkgb25jZSB0aGUgY29uZGl0aW9uCj4gaXMgYWN0dWFsbHkg
ZXZhbHVhdGVkLgo+IAo+IEFzIHRoaXMgcHJvdGVjdGlvbiBpcyB0eXBpY2FsbHkgdXNlZCBpbiBp
ZiBzdGF0ZW1lbnRzLCB0aGUgbGZlbmNlIGhhcyB0bwo+IGNvbWUgaW4gYSBjb21wYXRpYmxlIHdh
eS4gVGhlcmVmb3JlLCBhIGZ1bmN0aW9uIHRoYXQgcmV0dXJucyB0cnVlIGFmdGVyIGFuCj4gbGZl
bmNlIGluc3RydWN0aW9uIGlzIGludHJvZHVjZWQuIFRvIHByb3RlY3QgYm90aCBicmFuY2hlcyBh
ZnRlciBhCj4gY29uZGl0aW9uYWwsIGFuIGxmZW5jZSBpbnN0cnVjdGlvbiBoYXMgdG8gYmUgYWRk
ZWQgZm9yIHRoZSB0d28gYnJhbmNoZXMuCj4gVG8gYmUgYWJsZSB0byBibG9jayBzcGVjdWxhdGlv
biBhZnRlciBzZXZlcmFsIGV2YWx1YXRpb25zLCB0aGUgZ2VuZXJpYwo+IGJhcnJpZXIgbWFjcm8g
YmxvY2tfc3BlY3VsYXRpb24gaXMgYWxzbyBpbnRyb2R1Y2VkLgo+IAo+IEFzIHRoZSBMMVRGIHZ1
bG5lcmFiaWxpdHkgaXMgb25seSBwcmVzZW50IG9uIHRoZSB4ODYgYXJjaGl0ZWN0dXJlLCB0aGVy
ZSBpcwo+IG5vIG5lZWQgdG8gYWRkIHByb3RlY3Rpb24gZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMu
IEhlbmNlLCB0aGUgaW50cm9kdWNlZAo+IGZ1bmN0aW9ucyBhcmUgZGVmaW5lZCBidXQgZW1wdHku
Cj4gCj4gT24gdGhlIHg4NiBhcmNoaXRlY3R1cmUsIGJ5IGRlZmF1bHQsIHRoZSBsZmVuY2UgaW5z
dHJ1Y3Rpb24gaXMgbm90IHByZXNlbnQKPiBlaXRoZXIuIE9ubHkgd2hlbiBhIEwxVEYgdnVsbmVy
YWJsZSBwbGF0Zm9ybSBpcyBkZXRlY3RlZCwgdGhlIGxmZW5jZQo+IGluc3RydWN0aW9uIGlzIHBh
dGNoZWQgaW4gdmlhIGFsdGVybmF0aXZlIHBhdGNoaW5nLiBTaW1pbGFybHksIFBWIGd1ZXN0cwo+
IGFyZSBwcm90ZWN0ZWQgd3J0IEwxVEYgYnkgZGVmYXVsdCwgc28gdGhhdCB0aGUgcHJvdGVjdGlv
biBpcyBmdXJ0aGVybW9yZQo+IGRpc2FibGVkIGluIGNhc2UgSFZNIGlzIGV4Y2x1ZWRlZCB2aWEg
dGhlIGJ1aWxkIGNvbmZpZ3VyYXRpb24uCj4gCj4gSW50cm9kdWNpbmcgdGhlIGxmZW5jZSBpbnN0
cnVjdGlvbnMgY2F0Y2hlcyBhIGxvdCBvZiBwb3RlbnRpYWwgbGVha3Mgd2l0aAo+IGEgc2ltcGxl
IHVuaW50cnVzaXZlIGNvZGUgY2hhbmdlLiBEdXJpbmcgcGVyZm9ybWFuY2UgdGVzdGluZywgd2Ug
ZGlkIG5vdAo+IG5vdGljZSBwZXJmb3JtYW5jZSBlZmZlY3RzLgo+IAo+IFRoaXMgaXMgcGFydCBv
ZiB0aGUgc3BlY3VsYXRpdmUgaGFyZGVuaW5nIGVmZm9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBO
b3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiBBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
