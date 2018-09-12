From: Joshua Perrett <jperrett256@gmail.com>
Subject: [PATCH v4 0/2] libxl: deterministic mac addresses
Date: Wed, 12 Sep 2018 17:40:35 +0000
Message-ID: <cover.1536772417.git.jperrett256@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=og7b=l2=gmail.com=jperrett256@srs-us1.protection.inumbo.net>)
 id 1g09BK-00066Y-0G
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 17:44:02 +0000
Received: by mail-ed1-x542.google.com with SMTP id d8-v6so2480348edv.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 10:44:00 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Joshua Perrett <jperrett256@gmail.com>, Marcus Granado <marcus.granado@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhdGNoIGhhcyBub3cgYmVlbiBzcGxpdCBpbnRvIHR3byBwYXJ0cy4gT25lIGFkZHMgdGhl
IE1ENSBmaWxlcyB0bwphIHNoYXJlZCBkaXJlY3RvcnkgaW4gdG9vbHMsIHNvIHRoYXQgaXQgY2Fu
IHBvdGVudGlhbGx5IGJlIHJldXNlZC4gVGhlCnNlY29uZCBwYXRjaCBtYWtlcyBtYWMgYWRkcmVz
c2VzIGRldGVybWluaXN0aWMuIEl0IHN0aWxsIHVzZXMgYSBob3N0IAptYWMgYWRkcmVzcywgc2Vl
aW5nIGFzIGdldGhvc3RpZCgpIHdvbid0IHdvcmsgKGFzIEdlb3JnZSBleHBsYWluZWQpLiAKVGhl
IGNvZGUgc2hvdWxkIG5vdyB3b3JrIHRoZSBzYW1lIG9uIGJvdGggbGl0dGxlIGVuZGlhbiBhbmQg
YmlnIGVuZGlhbiAKbWFjaGluZXMuCgpKb3NodWEgUGVycmV0dCAoMik6CiAgQ3JlYXRlZCB0b29s
cy9zaGFyZWQgZGlyZWN0b3J5IGNvbnRhaW5pbmcgTUQ1IGZpbGVzCiAgbGlieGw6IG1hZGUgdm0g
bWFjIGFkZHJlc3MgYXNzaWdubWVudCBkZXRlcm1pbmlzdGljCgogdG9vbHMvTWFrZWZpbGUgICAg
ICAgICAgICAgICB8ICAgMSArCiB0b29scy9SdWxlcy5tayAgICAgICAgICAgICAgIHwgICAxICsK
IHRvb2xzL2xpYnhsL01ha2VmaWxlICAgICAgICAgfCAgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhs
X2ZyZWVic2QuYyAgfCAgIDUgKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAgNSAr
CiB0b29scy9saWJ4bC9saWJ4bF9saW51eC5jICAgIHwgIDMxICsrKystCiB0b29scy9saWJ4bC9s
aWJ4bF9uZXRic2QuYyAgIHwgICA1ICsKIHRvb2xzL2xpYnhsL2xpYnhsX25pYy5jICAgICAgfCAg
MzEgKysrKy0KIHRvb2xzL3NoYXJlZC9NYWtlZmlsZSAgICAgICAgfCAgMjEgKysrKwogdG9vbHMv
c2hhcmVkL21kNS5jICAgICAgICAgICB8IDI2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB0b29scy9zaGFyZWQvbWQ1LmggICAgICAgICAgIHwgIDI2ICsrKysr
CiAxMSBmaWxlcyBjaGFuZ2VkLCAzODYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9zaGFyZWQvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy9zaGFyZWQvbWQ1LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9zaGFyZWQvbWQ1
LmgKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
