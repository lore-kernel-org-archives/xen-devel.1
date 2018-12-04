From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 4/4] x86/mm/p2m: stop checking for IOMMU
 shared page tables in mmio_order()
Date: Tue, 4 Dec 2018 15:22:34 +0000
Message-ID: <dd9518307f2140d7bbae1ebd531d471e@AMSPEX02CL03.citrite.net>
References: <20181203174017.11956-1-paul.durrant@citrix.com>
 <20181203174017.11956-5-paul.durrant@citrix.com>
 <5C069B450200007800202C22@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jzt/=ON=citrix.com=prvs=869b801c3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gUCcp-0007hp-Qz
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 15:28:39 +0000
In-Reply-To: <5C069B450200007800202C22@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDQgRGVjZW1iZXIgMjAxOCAxNToyMQo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVy
IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lCj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5s
YXAKPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzRdIHg4Ni9tbS9w
Mm06IHN0b3AgY2hlY2tpbmcgZm9yIElPTU1VIHNoYXJlZAo+IHBhZ2UgdGFibGVzIGluIG1taW9f
b3JkZXIoKQo+IAo+ID4+PiBPbiAwMy4xMi4xOCBhdCAxODo0MCwgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPiB3cm90ZToKPiA+IE5vdyB0aGF0IHRoZSBpb21tdV9tYXAoKSBhbmQgaW9tbXVfdW5t
YXAoKSBvcGVyYXRpb25zIHRha2UgYW4gb3JkZXIKPiA+IHBhcmFtZXRlciBhbmQgZWxpZGUgZmx1
c2hpbmcgdGhlcmUncyBubyBzdHJvbmcgcmVhc29uIHdoeSBtb2RpZnlpbmcgTU1JTwo+ID4gcmFu
Z2VzIGluIHRoZSBwMm0gc2hvdWxkIGJlIHJlc3RyaWN0ZWQgdG8gYSA0ayBncmFudWxhcml0eSBz
aW1wbHkKPiBiZWNhdXNlCj4gPiB0aGUgSU9NTVUgaXMgZW5hYmxlZCBidXQgc2hhcmVkIHBhZ2Ug
dGFibGVzIGFyZSBub3QgaW4gb3BlcmF0aW9uLgo+IAo+IEknbSBhZnJhaWQgdGhlIHR3byBpbXBy
b3ZlbWVudHMgYXJlIG5vdCBlbm91Z2ggZm9yIHRoaXMgcmVzdHJpY3Rpb24KPiB0byBiZSBsaWZ0
ZWQ6IFRoZXJlJ3Mgc3RpbGwgbm8gcHJlZW1wdGlvbiBpbiB0aGUgcHJvY2Vzc2luZyBvZiB0aGUK
PiBoaWdoZXIgb3JkZXIgdmFsdWVzLgoKV2h5PyAxRyBvcmRlcnMgYXJlIGFscmVhZHkgcnVsZWQg
b3V0IGFuZCB0ZXN0aW5nIHNob3dzIHRoYXQgMk0gb3JkZXJzIGNhdXNlIG5vIHByb2JsZW1zIG9u
IEVQWUMgc3lzdGVtcy4KCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
