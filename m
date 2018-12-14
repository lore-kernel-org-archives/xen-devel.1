From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix paging_log_dirty_op to work with
 paging guests
Date: Fri, 14 Dec 2018 04:52:00 -0700
Message-ID: <5C1399600200007800206255@prv1-mh.provo.novell.com>
References: <20181212145438.47175-1-roger.pau@citrix.com>
 <5C11323202000078002058EF@prv1-mh.provo.novell.com>
 <20181213113944.7wvomlbry7toziia@mac>
 <5C1255E70200007800205D20@prv1-mh.provo.novell.com>
 <20181213141406.ue2epvsgd25wmtlg@mac>
 <5C1272200200007800205E78@prv1-mh.provo.novell.com>
 <20181213153423.in2kdsy7jppvy4tq@mac>
 <5C1280720200007800205EF7@prv1-mh.provo.novell.com>
 <20181214100328.55k45mpmoroe4ntz@mac>
 <5C1389C102000078002061C6@prv1-mh.provo.novell.com>
 <20181214114550.7oedt2msu35vp3rb@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXm0i-00010o-Au
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 11:52:04 +0000
In-Reply-To: <20181214114550.7oedt2msu35vp3rb@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjEyLjE4IGF0IDEyOjQ1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgRGVjIDE0LCAyMDE4IGF0IDAzOjQ1OjIxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMTIuMTggYXQgMTE6MDMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSSBleHBlY3QgdGhlIGludGVyZG9tYWluIGxvY2tpbmcgYXMgYSByZXN1bHQg
b2YgdXNpbmcgYSBwYWdpbmcgY2FsbGVyCj4+ID4gZG9tYWluIGlzIGdvaW5nIHRvIGJlIHJlc3Ry
aWN0ZWQgdG8gdGhlIHAybSBsb2NrIG9mIHRoZSBjYWxsZXIgZG9tYWluLAo+PiA+IGFzIGEgcmVz
dWx0IG9mIHRoZSB1c2FnZSBvZiBjb3B5IHRvL2Zyb20gaGVscGVycy4KPj4gPiAKPj4gPiBNYXli
ZSB0aGUgbGVzcyBpbnRydXNpdmUgY2hhbmdlIHdvdWxkIGJlIHRvIGp1c3QgYWxsb3cgbG9ja2lu
ZyB0aGUKPj4gPiBjYWxsZXIgcDJtIGxvY2sgKHRoYXQgb25seSBsb2NrKSByZWdhcmRsZXNzIG9m
IHRoZSBzdWJqZWN0IGRvbWFpbiBsb2NrCj4+ID4gbGV2ZWw/Cj4+IAo+PiBXaXRoIGNhbGxlciAh
PSBzdWJqZWN0LCBhbmQgd2l0aCB0aGUgbG9jayBsZXZlbCB0aGVuIGJlaW5nIGhpZ2hlcgo+PiB0
aGFuIGFsbCAibm9ybWFsIiBvbmVzLCB0aGlzIG1pZ2h0IGJlIGFuIG9wdGlvbi4gQnV0IGZyb20g
dGhlCj4+IHZlcnkgYmVnaW5uaW5nIHdlIHNob3VsZCBrZWVwIHRoZSB0cmFuc2l0aXZlIGFzcGVj
dCBoZXJlIGluCj4+IG1pbmQ6IElmIERvbTAgY29udHJvbHMgYSBQVkggZG9tYWluIHdoaWNoIGNv
bnRyb2xzIGEgSFZNIG9uZSwKPj4gdGhlIERvbTAgcDJtIGxvY2sgbWF5IGFsc28gbmVlZCBhbGxv
d2luZyB0byBuZXN0IGluc2lkZSB0aGUgUFZICj4+IERvbVUncyBvbmUsIHNvIGl0J2xsIGJlIGEg
dG90YWwgb2YgdHdvIGV4dHJhIG5ldyBsb2NrIGxldmVscyBldmVuCj4+IGlmIHdlIHJlc3RyaWN0
IHRoaXMgdG8gdGhlIHAybSBsb2Nrcy4KPiAKPiBJJ20gbm90IHN1cmUgSSBmb2xsb3cgaGVyZSwg
c28gZmFyIHdlIGhhdmUgc3Bva2VuIGFib3V0IGEgc3ViamVjdCBhbmQKPiBhIGNhbGxlciBkb21h
aW4gKHN1YmplY3QgYmVpbmcgdGhlIHRhcmdldCBvZiB0aGUgb3BlcmF0aW9uKS4gSW4gdGhlCj4g
YWJvdmUgc2NlbmFyaW8gSSBzZWUgYSByZWxhdGlvbiBiZXR3ZWVuIERvbTAgYW5kIHRoZSBQVkgg
ZG9tYWluLCBhbmQKPiBiZXR3ZWVuIHRoZSBQVkggZG9tYWluIGFuZCB0aGUgSFZNIG9uZSwgYnV0
IG5vdCBhIHJlbGF0aW9uIHRoYXQKPiBlbmNvbXBhc3NlcyB0aGUgdGhyZWUgZG9tYWlucyBpbiB0
ZXJtcyBvZiBtbSBsb2NraW5nLgo+IAo+IERvbTAgKGNhbGxlcikgbW0gbG9jayBjb3VsZCBiZSBu
ZXN0ZWQgaW5zaWRlIHRoZSBQVkggRG9tVSAoc3ViamVjdCkgbW0KPiBsb2NrcywgYW5kIHRoZSBQ
VkggRG9tVSAoY2FsbGVyKSBsb2NrcyBjb3VsZCBiZSBuZXN0ZWQgaW5zaWRlIHRoZSBIVk0KPiBk
b21haW4gKHN1YmplY3QpIGxvY2tzLCBidXQgSSBkb24ndCBzZWUgYW4gb3BlcmF0aW9uIHdoZXJl
IERvbTAgbW0KPiBsb2NrIGNvdWxkIGJlIG5lc3RlZCBpbnNpZGUgb2YgYSBQVkggRG9tVSBsb2Nr
IHRoYXQncyBhbHJlYWR5IG5lc3RlZAo+IGluc2lkZSBvZiB0aGUgSFZNIERvbVUgbG9jay4KCldl
bGwsIGlmIHdlJ3JlIF9zdXJlXyB0aGlzIGNhbid0IGhhcHBlbiwgdGhlbiBvZiBjb3Vyc2Ugd2Ug
YWxzbwpkb24ndCBuZWVkIHRvIGRlYWwgd2l0aCBpdC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
