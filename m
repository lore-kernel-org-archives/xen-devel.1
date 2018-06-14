From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: BUG: jumbo frames broken after commit xen-netfront:
 Fix race between device setup and open
Date: Thu, 14 Jun 2018 17:43:49 +0200
Message-ID: <CABxcv=mKA=Ueu6PmPs5OQgpU_jkG4BhDxNLwEpiiOSV5t8xzrg__23803.8654825234$1529040637$gmane$org@mail.gmail.com>
References: <CAK=Wzwcjz5JKzfrdGpWNXhb6ZmTrpbNjSJxiivZt3HF8cKYi3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvvp=ja=dowhile0.org=javier@srs-us1.protection.inumbo.net>)
 id 1fTUPf-0005Uj-Qc
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 15:43:51 +0000
Received: by mail-io0-x242.google.com with SMTP id u4-v6so7589154iof.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 08:43:50 -0700 (PDT)
In-Reply-To: <CAK=Wzwcjz5JKzfrdGpWNXhb6ZmTrpbNjSJxiivZt3HF8cKYi3Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Jeddeloh <andrew.jeddeloh@redhat.com>, Laura Abbott <labbott@redhat.com>, dustymabe@redhat.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, netdev <netdev@vger.kernel.org>, xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gV2VkLCBKdW4gNiwgMjAxOCBhdCA2OjI5IFBNLCBBbmRyZXcgSmVkZGVs
b2gKPGFuZHJldy5qZWRkZWxvaEByZWRoYXQuY29tPiB3cm90ZToKPiBIaSBhbGwsCj4KPiBUaGUg
cGF0Y2ggInhlbi1uZXRmcm9udDogRml4IHJhY2UgYmV0d2VlbiBkZXZpY2Ugc2V0dXAgYW5kIG9w
ZW4iIHNlZW1zCj4gdG8gaGF2ZSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBwcmV2ZW50aW5nIHNl
dHRpbmcgTVRVJ3MgbGFyZ2VyIHRoYW4KPiAxNTAwLiBXZSBleHBlcmllbmNlZCB0aGlzIGRvd25z
dHJlYW0gd2l0aCBDb250YWluZXIgTGludXggYW5kCj4gY29uZmlybWVkIHdpdGggRmVkb3JhIDI4
IGFzIHdlbGwuCj4KPiBJdCdzIGNvbW1pdCBmNTk5YzY0ZmRmN2Q5YzEwOGU4NzE3ZmIwNGJjNDFj
NjgwMTIwZGE0IGluIHRoZSBsaW51eC1zdGFibGUgdHJlZS4KPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLmdpdC9jb21t
aXQvP2lkPWY1OTljNjRmZGY3ZDljMTA4ZTg3MTdmYjA0YmM0MWM2ODAxMjBkYTQKPgo+IERvd25z
dHJlYW0gYnVnczoKPiBodHRwczovL2dpdGh1Yi5jb20vY29yZW9zL2J1Z3MvaXNzdWVzLzI0NDMK
PiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE1ODQyMTYKPgo+
IFdlJ3ZlIGNvbmZpcm1lZCB0aGF0IHJldmVydGluZyB0aGF0IGNvbW1pdCBmaXhlcyB0aGUgYnVn
LiBJdCBiZQo+IHJlbGlhYmx5IGNhbiBiZSByZXByb2R1Y2VkIG9uIEFXUyB3aXRoIHQyLm1pY3Jv
IGluc3RhbmNlcyAoYW5kCj4gcHJlc3VtYWJseSBvdGhlciBzeXN0ZW1zIHVzaW5nIHRoZSBzYW1l
IGRyaXZlcikuIEJvdGggdXNpbmcKPiBzeXN0ZW1kLW5ldHdvcmtkIHRvIHNldCB0aGUgbXR1IGFu
ZCBtYW51YWwgaXAgbGluayBjb21tYW5kcyBjYXVzZSB0aGUKPiBsaW5rIHRvIHJlcHNvbmQgd2l0
aCAiSW52YWxpZCBhcmd1bWVudCIgd2hlbiB0cnlpbmcgdG8gc2V0IHRoZSBNVFUgPgo+IDE1MDAu
Cj4KPiBJJ20gbm90IHN1cmUgd2h5IHRoYXQgY29tbWl0IGludHJvZHVjZWQgdGhlIHJlZ3Jlc3Np
b24uCj4KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUncyBhbnkgbW9yZSBpbmZvcm1hdGlv
biB0aGF0IHdvdWxkIGJlIGhlbHBmdWwuCj4KPiAtIEFuZHJldwoKSSdtIGFkZGluZyBzb21lIHJl
bGV2YW50IHBlb3BsZSB0byB0aGUgQ0MgbGlzdCB0byBicmluZyBtb3JlIGF0dGVudGlvbgpvbiB0
aGlzIHJlZ3Jlc3Npb24uCgpUaGUgZ2V0X21haW50YWluZXIucGwgc2NyaXB0IGlzIHZlcnkgdXNl
ZnVsIHRvIGdldCBzb21lIGhpbnRzIG9uIHdobwpzaG91bGQgYmUgY29waWVkLCBpLmU6CgokIC4v
c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtZiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwoK
QmVzdCByZWdhcmRzLApKYXZpZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
