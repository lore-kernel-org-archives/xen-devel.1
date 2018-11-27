From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 08:50:11 -0700
Message-ID: <5BFD67B3020000780020070F@prv1-mh.provo.novell.com>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
 <5BFD415B02000078002005DF@prv1-mh.provo.novell.com>
 <9f0f7d36607243b4ae9884b6ce95a50a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRfcw-00014Z-EP
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 15:50:18 +0000
In-Reply-To: <9f0f7d36607243b4ae9884b6ce95a50a@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDE1OjIwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOCAxMzowNwo+
PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IEJyaWFu
IFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPjsgU3VyYXZlZSBTdXRoaWt1bHBhbml0Cj4+IDxz
dXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+PiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0g
YW1kLWlvbW11OiByZW1vdmUgcGFnZSBtZXJnaW5nIGNvZGUKPj4gCj4+ID4+PiBPbiAyNi4xMS4x
OCBhdCAxODozMCwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gPiBUaGUgcGFn
ZSBtZXJnaW5nIGxvZ2ljIG1ha2VzIHVzZSBvZiBiaXRzIDEtOCBhbmQgYml0IDYzIG9mIGEgUFRF
LCB3aGljaAo+PiB1c2VkCj4+ID4gdG8gYmUgc3BlY2lmaWVkIGFzIGlnbm9yZWQuIEhvd2V2ZXIs
IGJpdHMgNSBhbmQgNiBhcmUgbm93IHNwZWNpZmllZCBhcwo+PiA+ICdhY2Nlc3NlZCcgYW5kICdk
aXJ0eScgYml0cyBhbmQgdGhlaXIgdXNlIG9ubHkgcmVtYWlucyBzYWZlIGFzIGxvbmcgYXMKPj4g
PiB0aGUgRFRFICdIb3N0IEFjY2VzcyBEaXJ0eScgYml0cyByZW1haW4gY2xlYXIuCj4+IAo+PiBV
cG9uIHNlY29uZCB0aG91Z2h0IC0gaXMgdGhpcyBhY3R1YWxseSB0cnVlIHdpdGggdGhlIFhTQS0y
NzUKPj4gY2hhbmdlcyBpbiBwbGFjZT8gQXMgbG9uZyBhcyB0aGUgZG9tYWluIGlzIG5vdCBydW5u
aW5nIHlldCwKPj4gaG93IHdvdWxkIEEgYW5kL29yIEQgYml0cyBnZXQgc2V0Pwo+IAo+IE9rLCBJ
IGNhbiBhbWVuZCB0aGUgY29tbWVudC4gVGhlIHJpc2sgaXMsIGFzIEkgc2F5LCBwcmVkaWNhdGVk
IG9uIHRoZSBiaXRzIAo+IGluIHRoZSBEVEUgYW55d2F5IGJ1dCB0aGUgdGFibGVzIGFyZSB3aXJl
ZCBpbnRvIHRoZSBEVEUgKmJlZm9yZSogYmVpbmcgCj4gcG9wdWxhdGVkIHNvIEkgZG9uJ3QgdGhp
bmsgdGhlcmUgaXMgYW55dGhpbmcgdG8gc3RvcCBoL3cgRE1BaW5nIHdoaWxzdCB0aGV5IAo+IGFy
ZSBiZWluZyBjb25zdHJ1Y3RlZC4KClRoaXMgd2F5IG9mIHRoaW5raW5nIHJlY3VyczogV2hlbiB0
aGUgdGFibGVzIGdldCBjb25zdHJ1Y3RlZCwgdGhlCmRvbWFpbiBkb2Vzbid0IHJ1biB5ZXQsIG9y
IGhhcyBubyBkZXZpY2UgYXNzaWduZWQgeWV0LiBJbiBib3RoCmNhc2VzIEkgY2FuJ3Qgc2VlIHdo
by93aGF0IHdvdWxkIGluaXRpYXRlIERNQS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
