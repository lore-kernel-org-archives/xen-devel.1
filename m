From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] xenforeignmemory: work around bug in older
 privcmd
Date: Fri, 24 Aug 2018 16:16:38 +0100
Message-ID: <23424.8534.736419.663043@mariner.uk.xensource.com>
References: <20180824121626.27261-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+yjm=lh=citrix.com=prvs=76705ec17=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ftDpK-0005Tn-La
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 15:16:42 +0000
In-Reply-To: <20180824121626.27261-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSF0geGVuZm9yZWlnbm1lbW9yeTogd29yayBhcm91
bmQgYnVnIGluIG9sZGVyIHByaXZjbWQiKToKPiBWZXJzaW9ucyBvZiBsaW51eCBwcml2Y21kIHBy
aW9yIHRvIGNvbW1pdCBkYzllYWI2ZmQ5NGQgKCJyZXR1cm4gLUVOT1RUWQo+IGZvciB1bmltcGxl
bWVudGVkIElPQ1RMcyIpIHdpbGwgcmV0dXJuIC1FSU5WQUwgcmF0aGVyIHRoYW4gdGhlIGNvbnZl
bnRpb25hbAo+IC1FTk9UVFkgZm9yIHVuaW1wbGVtZW50ZWQgY29kZXMuIFRoaXMgYnJlYWtzIHRo
ZSBlcnJvciBwYXRoIGluCj4gbGlieGVuZm9yZWlnbm1lbW9yeSByZXNvdXJjZSBtYXBwaW5nLCB3
aGljaCBvbmx5IHRyYW5zbGF0ZXMgRU5PVFRZIGludG8KPiBFT1BOT1RTVVBQIHRvIGluZm9ybSBj
YWxsZXJzIG9mIHRoZSBuZWVkIHRvIHVzZSBhbiBhbHRlcm5hdGl2ZSAobGVnYWN5KQo+IG1lY2hh
bmlzbS4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgJ3VuaW1wbGVtZW50ZWQnIFsxXSBpb2N0
bCBjb2RlIGludG8gdGhlIGxvY2FsCj4gcHJpdmNtZCBoZWFkZXIgd2hpY2ggaXMgdGhlbiB1c2Vk
IHRvIHByb2JlIGZvciB0aGUgYXBwcm9wcmlhdGUgZXJybm8gdG8KPiB0cmFuc2xhdGUgaW4gdGhl
IHJlc291cmNlIG1hcHBpbmcgZXJyb3IgcGF0aAo+IAo+IFsxXSB0aGlzIGlzIGEgY29kZSB0aGF0
IGhhcywgc28gZmFyLCBuZXZlciBiZWVuIHVzZWQgaW4gYW55IHZlcnNpb24gb2YKPiAgICAgcHJp
dmNtZCBhbmQgd2lsbCBiZSBhZGRlZCB0byBmdXR1cmUgdmVyc2lvbnMgb2YgdGhlIGhlYWRlciBp
biB0aGUKPiAgICAgbGludXggc291cmNlLCB0byBtYWtlIHN1cmUgaXQgc3RheXMgdW5pbXBsZW1l
bnRlZC4KCkhvdyBpcnJpdGF0aW5nISAgVGhhbmtzIGZvciBmaXhpbmcgaXQuCgpBY2tlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
