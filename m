From: Juergen Gross <jgross@suse.com>
Subject: Re: BUG: jumbo frames broken after commit xen-netfront:
 Fix race between device setup and open
Date: Thu, 21 Jun 2018 11:05:41 +0200
Message-ID: <df12769e-429f-7afb-9cdd-20955f8d6549__27529.0275727913$1529571877$gmane$org@suse.com>
References: <CAK=Wzwcjz5JKzfrdGpWNXhb6ZmTrpbNjSJxiivZt3HF8cKYi3Q@mail.gmail.com>
 <CABxcv=mKA=Ueu6PmPs5OQgpU_jkG4BhDxNLwEpiiOSV5t8xzrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cai1=jh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fVvXH-0004kL-CI
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 09:05:47 +0000
In-Reply-To: <CABxcv=mKA=Ueu6PmPs5OQgpU_jkG4BhDxNLwEpiiOSV5t8xzrg@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Jeddeloh <andrew.jeddeloh@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dustymabe@redhat.com, stable@vger.kernel.org, netdev <netdev@vger.kernel.org>, xen-devel@lists.xenproject.org, Javier Martinez Canillas <javier@dowhile0.org>, Laura Abbott <labbott@redhat.com>, "David S. Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDYvMTggMTc6NDMsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToKPiBIaSBB
bmRyZXcsCj4gCj4gT24gV2VkLCBKdW4gNiwgMjAxOCBhdCA2OjI5IFBNLCBBbmRyZXcgSmVkZGVs
b2gKPiA8YW5kcmV3LmplZGRlbG9oQHJlZGhhdC5jb20+IHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+
IFRoZSBwYXRjaCAieGVuLW5ldGZyb250OiBGaXggcmFjZSBiZXR3ZWVuIGRldmljZSBzZXR1cCBh
bmQgb3BlbiIgc2VlbXMKPj4gdG8gaGF2ZSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBwcmV2ZW50
aW5nIHNldHRpbmcgTVRVJ3MgbGFyZ2VyIHRoYW4KPj4gMTUwMC4gV2UgZXhwZXJpZW5jZWQgdGhp
cyBkb3duc3RyZWFtIHdpdGggQ29udGFpbmVyIExpbnV4IGFuZAo+PiBjb25maXJtZWQgd2l0aCBG
ZWRvcmEgMjggYXMgd2VsbC4KPj4KPj4gSXQncyBjb21taXQgZjU5OWM2NGZkZjdkOWMxMDhlODcx
N2ZiMDRiYzQxYzY4MDEyMGRhNCBpbiB0aGUgbGludXgtc3RhYmxlIHRyZWUuCj4+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFi
bGUuZ2l0L2NvbW1pdC8/aWQ9ZjU5OWM2NGZkZjdkOWMxMDhlODcxN2ZiMDRiYzQxYzY4MDEyMGRh
NAo+Pgo+PiBEb3duc3RyZWFtIGJ1Z3M6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jb3Jlb3MvYnVn
cy9pc3N1ZXMvMjQ0Mwo+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dp
P2lkPTE1ODQyMTYKPj4KPj4gV2UndmUgY29uZmlybWVkIHRoYXQgcmV2ZXJ0aW5nIHRoYXQgY29t
bWl0IGZpeGVzIHRoZSBidWcuIEl0IGJlCj4+IHJlbGlhYmx5IGNhbiBiZSByZXByb2R1Y2VkIG9u
IEFXUyB3aXRoIHQyLm1pY3JvIGluc3RhbmNlcyAoYW5kCj4+IHByZXN1bWFibHkgb3RoZXIgc3lz
dGVtcyB1c2luZyB0aGUgc2FtZSBkcml2ZXIpLiBCb3RoIHVzaW5nCj4+IHN5c3RlbWQtbmV0d29y
a2QgdG8gc2V0IHRoZSBtdHUgYW5kIG1hbnVhbCBpcCBsaW5rIGNvbW1hbmRzIGNhdXNlIHRoZQo+
PiBsaW5rIHRvIHJlcHNvbmQgd2l0aCAiSW52YWxpZCBhcmd1bWVudCIgd2hlbiB0cnlpbmcgdG8g
c2V0IHRoZSBNVFUgPgo+PiAxNTAwLgo+Pgo+PiBJJ20gbm90IHN1cmUgd2h5IHRoYXQgY29tbWl0
IGludHJvZHVjZWQgdGhlIHJlZ3Jlc3Npb24uCj4+Cj4+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0
aGVyZSdzIGFueSBtb3JlIGluZm9ybWF0aW9uIHRoYXQgd291bGQgYmUgaGVscGZ1bC4KPj4KPj4g
LSBBbmRyZXcKPiAKPiBJJ20gYWRkaW5nIHNvbWUgcmVsZXZhbnQgcGVvcGxlIHRvIHRoZSBDQyBs
aXN0IHRvIGJyaW5nIG1vcmUgYXR0ZW50aW9uCj4gb24gdGhpcyByZWdyZXNzaW9uLgo+IAo+IFRo
ZSBnZXRfbWFpbnRhaW5lci5wbCBzY3JpcHQgaXMgdmVyeSB1c2VmdWwgdG8gZ2V0IHNvbWUgaGlu
dHMgb24gd2hvCj4gc2hvdWxkIGJlIGNvcGllZCwgaS5lOgo+IAo+ICQgLi9zY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsIC1mIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCgpSb3NzLCBoYXZlIHlv
dSBtYWRlIGFueSBwcm9ncmVzcyBoZXJlPyBJZiBub3QgSSdtIHRoaW5raW5nIG9mIHJldmVydGlu
Zwp5b3VyIHBhdGNoIGFzIEkgdGhpbmsgdGhlIGN1cnJlbnQgcHJvYmxlbSBpcyBtb3JlIHNldmVy
ZSB0aGFuIHRoZSBvbmUKeW91ciBwYXRjaCBkaWQgYWRkcmVzcy4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
