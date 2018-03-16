From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v2 45/45] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Fri, 16 Mar 2018 15:13:49 +0000
Message-ID: <7e9c1373-302a-0f7e-d47d-a9cf448caf1a@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-46-andre.przywara@linaro.org>
 <5AABAF2A02000078001B2A6C@prv-mh.provo.novell.com>
 <ff913871-5d38-30c0-11d5-3321fa494e96@linaro.org>
 <5AABB94702000078001B2B61@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bf7q=gg=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ewr3X-0005U4-I6
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 15:14:07 +0000
Received: by mail-wm0-x241.google.com with SMTP id z9so3664001wmb.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Mar 2018 08:14:05 -0700 (PDT)
In-Reply-To: <5AABB94702000078001B2B61@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNi8wMy8xOCAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDMu
MTggYXQgMTI6MTAsIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPiB3cm90ZToKPj4gT24gMTYv
MDMvMTggMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTUuMDMuMTggYXQgMjE6
MzAsIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vY29t
bW9uL01ha2VmaWxlCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+Pj4+IEBAIC0xOSw2
ICsxOSw3IEBAIG9iai15ICs9IGtleWhhbmRsZXIubwo+Pj4+ICBvYmotJChDT05GSUdfS0VYRUMp
ICs9IGtleGVjLm8KPj4+PiAgb2JqLSQoQ09ORklHX0tFWEVDKSArPSBraW1hZ2Uubwo+Pj4+ICBv
YmoteSArPSBsaWIubwo+Pj4+ICtvYmoteSArPSBsaXN0X3NvcnQubwo+Pj4KPj4+IFdoeSBoZXJl
IHJhdGhlciB0aGFuIGluIHBhdGNoIDE3PyBBbmQgd2h5IGFsc28gZm9yIHg4Nj8gSSB0aGluayB5
b3UKPj4+IHdhbnQgYSBwcm9tcHRsZXNzIEtjb25maWcgb3B0aW9uIHRoYXQgYW4gYXJjaCBjYW4g
c2VsZWN0IGlmIGl0IG5lZWRzCj4+PiB0aGlzIGNvZGUsIHVubGVzcyBvciB1bnRpbCBjb21tb24g
Y29kZSBtYWtlcyB1c2Ugb2YgaXQuCj4+Cj4+IFllYWgsIEkgaGFkIG9iai0kKENPTkZJR19ORVdf
VkdJQykgYmVmb3JlLCBidXQgSnVsaWVuIGRpc2xpa2VkIGl0Lgo+PiBQcm9tcHRsZXNzIEtjb25m
aWcgc291bmRzIGdvb2QgdG8gbWUuCj4gCj4gQW5kIG5vdGUgSSdtIG5vdCBhc2tpbmcgZm9yIGEg
VkdJQyBvcHRpb24sIGJ1dCBmb3IgYSBMSVNUX1NPUlQgb25lLgoKWWVhaCwgSSBnb3QgdGhhdCA7
LSkKQ09ORklHX0xJU1RfU09SVCBvciBDT05GSUdfSEFTX0xJU1RfU09SVD8KCkNoZWVycywKQW5k
cmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
