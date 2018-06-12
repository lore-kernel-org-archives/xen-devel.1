From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 5/7] xen: Don't build libelf for Arm
Date: Tue, 12 Jun 2018 12:29:31 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806121227430.14695@sstabellini-ThinkPad-X260>
References: <20180605171237.30601-1-julien.grall@arm.com>
 <20180605171237.30601-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ywjr=i6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fSoyz-0000v4-Lr
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 19:29:33 +0000
In-Reply-To: <20180605171237.30601-6-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA1IEp1biAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gTm93IHRoYXQgRUxGIHN1
cHBvcnQgaGFzIGJlZW4gZHJvcHBlZCB0byBib290IERvbTAsIG5vLW9uZSBpcyB1c2luZwo+IGxp
YmVsZiB3aXRoaW4gdGhlIGh5cGVydmlzb3IuCj4gCj4gSW50cm9kdWNlIGEgY29uZmlnIG9wdGlv
biB0byBzZWxlY3QgbGliZWxmIG9uIHg4NiBhbmQga2VlcCB1bnNlbGVjdGVkCj4gZm9yIEFybS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoK
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Cgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvS2NvbmZpZyB8IDEgKwo+ICB4ZW4vY29tbW9uL0tjb25m
aWcgICB8IDMgKysrCj4gIHhlbi9jb21tb24vTWFrZWZpbGUgIHwgMiArLQo+ICAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4gaW5kZXggZjY0ZmM1
NjczOS4uM2QzODgxMzNlZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4gQEAgLTEyLDYgKzEyLDcgQEAgY29uZmlnIFg4Ngo+
ICAJc2VsZWN0IEhBU19DUFVGUkVRCj4gIAlzZWxlY3QgSEFTX0VIQ0kKPiAgCXNlbGVjdCBIQVNf
RVhfVEFCTEUKPiArCXNlbGVjdCBIQVNfRUxGCj4gIAlzZWxlY3QgSEFTX0dEQlNYCj4gIAlzZWxl
Y3QgSEFTX0lPUE9SVFMKPiAgCXNlbGVjdCBIQVNfS0VYRUMKPiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCj4gaW5kZXggOTA0M2RjZTkzNy4uM2Nm
NTUxYzczNiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPiArKysgYi94ZW4vY29t
bW9uL0tjb25maWcKPiBAQCAtMTcsNiArMTcsOSBAQCBjb25maWcgSEFTX0FMVEVSTkFUSVZFCj4g
IGNvbmZpZyBIQVNfREVWSUNFX1RSRUUKPiAgCWJvb2wKPiAgCj4gK2NvbmZpZyBIQVNfRUxGCj4g
KyAgICBib29sCj4gKwo+ICBjb25maWcgSEFTX0VYX1RBQkxFCj4gIAlib29sCj4gIAo+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL01ha2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+IGluZGV4
IDI0ZDQ3NTJjY2MuLjNjYzgwOGJkODMgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9NYWtlZmls
ZQo+ICsrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUKPiBAQCAtNzgsNSArNzgsNSBAQCBvYmotJChD
T05GSUdfVE1FTSkgKz0gJCh0bWVtLXkpCj4gIHN1YmRpci0kKENPTkZJR19DT1ZFUkFHRSkgKz0g
Y292ZXJhZ2UKPiAgc3ViZGlyLSQoQ09ORklHX1VCU0FOKSArPSB1YnNhbgo+ICAKPiAtc3ViZGly
LXkgKz0gbGliZWxmCj4gK3N1YmRpci0kKENPTkZJR19IQVNfRUxGKSArPSBsaWJlbGYKPiAgc3Vi
ZGlyLSQoQ09ORklHX0hBU19ERVZJQ0VfVFJFRSkgKz0gbGliZmR0Cj4gLS0gCj4gMi4xMS4wCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
