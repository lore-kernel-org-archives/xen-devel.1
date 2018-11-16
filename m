From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6 4/4] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Fri, 16 Nov 2018 12:21:32 +0200
Message-ID: <885ca18c-48eb-deae-462d-ea38c68cb51f@bitdefender.com>
References: <1542228002-21075-1-git-send-email-rcojocaru@bitdefender.com>
 <1542228002-21075-5-git-send-email-rcojocaru@bitdefender.com>
 <3603CF64-3679-43F6-A389-E88DAA0BF503@citrix.com>
 <482be5fb-0406-c203-2664-070a77e329e9@bitdefender.com>
 <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4z4h=N3=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gNbFs-0000K1-01
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 10:21:40 +0000
In-Reply-To: <5BEE972D02000078001FCB0D@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTYvMTggMTI6MDggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IEkndmUgc2VlbiB5b3Ug
bWVudGlvbiBzdWNoIG9yIGFsaWtlIGEgY291cGxlIG9mIHRpbWVzIG5vdyB3aGlsZQo+IGRpc2N1
c3NpbmcgdGhpcyBzZXJpZXMsIGFuZCBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJJ20gYSBsaXR0bGUg
ZnJpZ2h0ZW5lZDoKPiBNYWtpbmcgYSBjaGFuZ2UganVzdCBiYXNlZCBvbiB0aGUgb2JzZXJ2YXRp
b24gdGhhdCBub3RoaW5nIGJyZWFrcwo+IGlzIHNldHRpbmcgdXMgdXAgZm9yIGJyZWFrYWdlIGlu
IHNvbWUgY29ybmVyIGNhc2UuIFRoYXQgaXMgLSBzZWVpbmcKPiBzb21ldGhpbmcgYnJlYWsgaXMg
YSBnb29kIGluZGljYXRpb24gdGhhdCBhIGNoYW5nZSB3YXMgd3JvbmcsIGJ1dAo+IG5vdCBzZWVp
bmcgYW55IGJyZWFrYWdlIGRvZXNuJ3QgYWxvbmUganVzdGlmeSBhIGNoYW5nZS4KPiAKPiBJbiB0
aGUgcGFydGljdWxhciBjYXNlIGhlcmUgSSB0aGluayB3aGV0aGVyIHRoZSBjb3B5aW5nIG9mIHRo
ZSBmaWVsZAo+IGlzIG5lZWRlZCBkZXBlbmRzIG9uIHdoYXQgZWxzZSBpcyBiZWluZyBjb3BpZWQg
KEknbSBzb3JyeSwgSSdtIG5vdAo+IHRoYXQgZmFtaWxpYXIgd2l0aCBhbHRwMm0pOiBJZiBtYXBw
aW5ncyBnZXQgY2xvbmVkIGZyb20gdGhlIGhvc3QgcDJtLAo+IHRoZW4gdGhpcyB2YWx1ZSBvdWdo
dCB0byBiZSBjbG9uZWQgdG9vLiBGb3IgYW55IG1hcHBpbmdzIHRoYXQKPiBtaWdodCBiZSBrZXB0
IGluIHN5bmMgYmV0d2VlbiBwMm0tcywgSSB0aGluayB0aGlzIGZpZWxkIGFsc28gd291bGQKPiBu
ZWVkIHRvIGJlIHVwZGF0ZWQgaW4gc3luYy4KCkkgYWdyZWUsIEkgd2FzIG1lcmVseSBvZmZlcmlu
ZyB0byB0ZXN0IHdoZXRoZXIgYW55IGJyZWFrYWdlIG9jY3VycyBpZgpub3Qgc3luY2luZyB0aGUg
ZmllbGQsIG5vdCBzdWdnZXN0aW5nIHRoYXQgdGhhdCdzIGEgY29tcHJlaGVuc2l2ZQphbmFseXNp
cyBvciBhIGp1c3RpZmljYXRpb24gZm9yIGNoYW5nZSwgaW4gY2FzZSB0aGF0IG9mZmVycyB1cyBt
b3JlIGluc2lnaHQuCgpBRkFJSywgRVBUIHJlc3RyaWN0aW9ucyBhcmUgYWx3YXlzIHByb3BhZ2F0
ZWQgZnJvbSB0aGUgaG9zdHAybSB0byBhbGwKYWN0aXZlIGFsdHAybXMuIEkndmUgdGVzdGVkIHRo
aXMgYXQgc29tZSBwb2ludCBpbiB0aGUgcGFzdCBhbmQgaXQgaGFzCnByb3ZlbiB0cnVlIC0gaXQn
cyBzdXBwb3NlZGx5IGFuIGFsdHAybSBmZWF0dXJlIGFsdGhvdWdoIGl0IGNhbiBhbHNvIGJlCmEg
Yml0IG9mIGEgaGVhZGFjaGU6IGlmIHdlIHdvdWxkIGhhdmUgYmVlbiBhYmxlIHRvIHVzZSB0aGUg
aG9zdHAybQppbmRlcGVuZGVudGx5IHRoZW4gd2Ugd291bGRuJ3QgaGF2ZSBoYWQgdGhpcyBkaXNw
bGF5IGZyZWV6ZSBwcm9ibGVtLApzaW5jZSB3ZSBjb3VsZCBoYXZlIHVzZWQgdGhlIGhvc3RwMm0g
YXMgdGhlIGRlZmF1bHQgKHJlc3RyaWN0ZWQpIEVQVAp2aWV3LiBBcyB0aGluZ3Mgc3RhbmQgbm93
LCB3ZSBuZWVkIHRvIGNyZWF0ZSBhIG5ldyB2aWV3IHdoZW4gc3RhcnRpbmcKaW50cm9zcGVjdGlv
biBhbmQgc3dpdGNoIHRvIHRoYXQgaW1tZWRpYXRlbHksIHNvIGNoYW5nZXMgdG8gaXQgd2lsbCBu
b3QKcHJvcGFnYXRlIGludG8gb3RoZXIgdmlld3MgKGluIG90aGVyIHdvcmRzLCBzbyB3ZSBjYW4g
dXNlIGl0CmluZGVwZW5kZW50bHkgb2YgYWxsIG90aGVyIGFsdHAybXMpLgoKClRoYW5rcywKUmF6
dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
