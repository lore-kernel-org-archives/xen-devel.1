From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 45/45] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Tue, 20 Mar 2018 03:13:06 +0000
Message-ID: <95219304-383b-5c41-a842-1d8068b016a4@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-46-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kdcq=gk=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ey7iA-0003ZL-EZ
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 03:13:18 +0000
In-Reply-To: <20180315203050.19791-46-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0v
dmdpYy9NYWtlZmlsZQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
ODA2ODI2OTQ4ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy9NYWtl
ZmlsZQo+IEBAIC0wLDAgKzEsNSBAQAo+ICtvYmoteSArPSB2Z2ljLm8KPiArb2JqLXkgKz0gdmdp
Yy12Mi5vCj4gK29iai15ICs9IHZnaWMtbW1pby5vCj4gK29iai15ICs9IHZnaWMtbW1pby12Mi5v
Cj4gK29iai15ICs9IHZnaWMtaW5pdC5vCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2lj
L3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwo+IGluZGV4IDRiOTY2NGYzMTMuLjM0
MmI5NWJlMzEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4gKysrIGIv
eGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4gQEAgLTk2OCw2ICs5NjgsMTYgQEAgdW5zaWduZWQg
aW50IHZnaWNfbWF4X3ZjcHVzKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgcmV0dXJu
IG1pbl90KHVuc2lnbmVkIGludCwgTUFYX1ZJUlRfQ1BVUywgdmdpY192Y3B1X2xpbWl0KTsKPiAg
IH0KPiAgIAo+ICsjaWZkZWYgQ09ORklHX0hBU19HSUNWMwo+ICt2b2lkIHZnaWNfdjNfc2V0dXBf
aHcocGFkZHJfdCBkYmFzZSwKPiArICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBu
cl9yZGlzdF9yZWdpb25zLAo+ICsgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHJk
aXN0X3JlZ2lvbiAqcmVnaW9ucywKPiArICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBpbnRpZF9iaXRzKQo+ICt7Cj4gKyAgICAvKiBEdW1teSBpbXBsZW1lbnRhdGlvbiB0byBhbGxv
dyBidWlsZGluZyB3aXRob3V0IGFjdHVhbCB2R0lDdjMgc3VwcG9ydC4gKi8KPiArfQo+ICsjZW5k
aWYKCldoeSBub3QganVzdCBhdm9pZCBzZWxlY3RpbmcgSEFTX0dJQ1YzPwoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
