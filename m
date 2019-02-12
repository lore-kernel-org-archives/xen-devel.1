From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 2/9] x86/vioapic: block
 speculative out-of-bound accesses
Date: Tue, 12 Feb 2019 06:16:38 -0700
Message-ID: <5C62C7360200007800215E87@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-3-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CC2AAF02000039B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtXvZ-0007qp-T0
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 13:16:45 +0000
In-Reply-To: <01CC2AAF02000039B1E090C7@prv1-mh.provo.novell.com>
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

Pj4+IE9uIDA4LjAyLjE5IGF0IDE0OjQ0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBX
aGVuIGludGVyYWN0aW5nIHdpdGggaW8gYXBpYywgYSBndWVzdCBjYW4gc3BlY2lmeSB2YWx1ZXMg
dGhhdCBhcmUgdXNlZAo+IGFzIGluZGV4IHRvIHN0cnVjdHVyZXMsIGFuZCB3aG9zZSB2YWx1ZXMg
YXJlIG5vdCBjb21wYXJlZCBhZ2FpbnN0Cj4gdXBwZXIgYm91bmRzIHRvIHByZXZlbnQgc3BlY3Vs
YXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLiBUaGlzIGNoYW5nZQo+IHByZXZlbnRzIHRoZXNl
IHNwZWN1bGF0aXZlIGFjY2Vzc2VzLgo+IAo+IEZ1cnRoZXJtb3JlLCB2YXJpYWJsZXMgYXJlIGlu
aXRpYWxpemVkIGFuZCB0aGUgY29tcGlsZXIgaXMgYXNrZWQgdG8gbm90Cj4gb3B0aW1pemVkIHRo
ZXNlIGluaXRpYWxpemF0aW9ucywgYXMgdGhlIHVuaW5pdGlhbGl6ZWQsIHBvdGVudGlhbGx5IGd1
ZXN0Cj4gY29udHJvbGxlZCwgdmFyaWFibGVzIG1pZ2h0IGJlIHVzZWQgaW4gYSBzcGVjdWxhdGl2
ZSBvdXQtb2YtYm91bmQgYWNjZXNzLgoKVW5pbml0aWFsaXplZCB2YXJpYWJsZXMgY2FuJ3QgYmUg
Z3Vlc3QgY29udHJvbGxlZCwgbm90IGV2ZW4gcG90ZW50aWFsbHkuCldoYXQgd2Ugd2FudCB0byBh
dm9pZCBoZXJlIGlzIHNwZWN1bGF0aW9uIHdpdGggdW5pbml0aWFsaXplZCB2YWx1ZXMKKG9yIHJl
YWxseSBzdGFsZSBkYXRhIHN0aWxsIG9uIHRoZSBzdGFjayBmcm9tIHVzZSBieSBvdGhlciBjb2Rl
KSwKcmVnYXJkbGVzcyBvZiBkaXJlY3QgZ3Vlc3QgY29udHJvbC4KCj4gT3V0IG9mIHRoZSBmb3Vy
IGluaXRpYWxpemVkIHZhcmlhYmxlcywgdHdvIGFyZSBwb3RlbnRpYWxseSBwcm9ibGVtYXRpYywK
PiBuYW1lbHkgb25lcyBpbiB0aGUgZnVuY3Rpb25zIHZpb2FwaWNfaXJxX3Bvc2l0aXZlX2VkZ2Ug
YW5kCj4gdmlvYXBpY19nZXRfdHJpZ2dlcl9tb2RlLgo+IAo+IEFzIHRoZSB0d28gcHJvYmxlbWF0
aWMgdmFyaWFibGVzIGFyZSBib3RoIHVzZWQgaW4gdGhlIGNvbW1vbiBmdW5jdGlvbgo+IGdzaV92
aW9hcGljLCB0aGUgbWl0aWdhdGlvbiBpcyBpbXBsZW1lbnRlZCB0aGVyZS4gQXMgdGhlIGFjY2Vz
cyBwYXR0ZXJuCj4gb2YgdGhlIGN1cnJlbnRseSBub24tZ3Vlc3QtY29udHJvbGxlZCBmdW5jdGlv
bnMgbWlnaHQgY2hhbmdlIGluIHRoZQo+IGZ1dHVyZSBhcyB3ZWxsLCB0aGUgb3RoZXIgdmFyaWFi
bGVzIGFyZSBpbml0aWFsaXplZCBhcyB3ZWxsLgo+IAo+IFRoaXMgY29tbWl0IGlzIHBhcnQgb2Yg
dGhlIFNwZWN0cmVWMStMMVRGIG1pdGlnYXRpb24gcGF0Y2ggc2VyaWVzLgoKT2gsIEkgZGlkbid0
IHBheSBhdHRlbnRpb24gaW4gcGF0Y2ggMTogWW91IGhhZCBtZWFudCB0byBjaGFuZ2UgdGhpcwp3
b3JkaW5nIHRvIHNvbWV0aGluZyBpbmNsdWRpbmcgInNwZWN1bGF0aXZlIGhhcmRlbmluZyIgKHRo
cm91Z2hvdXQKdGhlIHNlcmllcykuCgo+IEBAIC0yMTIsNyArMjIwLDE1IEBAIHN0YXRpYyB2b2lk
IHZpb2FwaWNfd3JpdGVfcmVkaXJlbnQoCj4gICAgICBzdHJ1Y3QgaHZtX2lycSAqaHZtX2lycSA9
IGh2bV9kb21haW5faXJxKGQpOwo+ICAgICAgdW5pb24gdmlvYXBpY19yZWRpcl9lbnRyeSAqcGVu
dCwgZW50Owo+ICAgICAgaW50IHVubWFza2VkID0gMDsKPiAtICAgIHVuc2lnbmVkIGludCBnc2kg
PSB2aW9hcGljLT5iYXNlX2dzaSArIGlkeDsKPiArICAgIHVuc2lnbmVkIGludCBnc2k7Cj4gKwo+
ICsgICAgLyogQ2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uIHNob3VsZCBtYWtlIHN1cmUgaWR4IGlz
IGJvdW5kZWQgYXBwcm9wcmlhdGVseSAqLwo+ICsgICAgQVNTRVJUKGlkeCA8IHZpb2FwaWMtPm5y
X3BpbnMpOwo+ICsKPiArICAgIC8qIE1ha2Ugc3VyZSBubyBvdXQtb2YtYm91bmQgdmFsdWUgZm9y
IGlkeCBjYW4gYmUgdXNlZCAqLwoKb3V0LW9mLWJvdW5kcwoKSSdtIGZpbmUgbm93IHdpdGggYWxs
IHRoZSBjb2RlIGNoYW5nZXMgaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
