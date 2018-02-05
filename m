From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 1/3] Make credit2 the default scheduler
Date: Mon, 5 Feb 2018 11:36:40 +0000
Message-ID: <20180205113642.3174-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=invn=e7=citrix.com=prvs=567d2a528=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eif4v-0006Ju-Iu
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 11:36:53 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3JlZGl0MiB3YXMgZGVjbGFyZWQgInN1cHBvcnRlZCIgaW4gNC44LCBhbmQgYXMgb2YgNC4xMCBo
YWQgdHdvIG90aGVyCmNyaXRpY2FsIGZlYXR1cmVzIGltcGxlbWVudGVkIChzb2Z0IGFmZmluaXR5
IC8gTlVNQSBhbmQgY2FwcykuCgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJp
eC5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogS29ucmFkIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CkNDOiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0K
IHhlbi9jb21tb24vS2NvbmZpZyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94
ZW4vY29tbW9uL0tjb25maWcKaW5kZXggMTAzZWY0NGNiNS4uM2QyMGE5MjMxZiAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBiL3hlbi9jb21tb24vS2NvbmZpZwpAQCAtMjAwLDcg
KzIwMCw3IEBAIGNvbmZpZyBTQ0hFRF9OVUxMCiAKIGNob2ljZQogCXByb21wdCAiRGVmYXVsdCBT
Y2hlZHVsZXI/IgotCWRlZmF1bHQgU0NIRURfQ1JFRElUX0RFRkFVTFQKKwlkZWZhdWx0IFNDSEVE
X0NSRURJVDJfREVGQVVMVAogCiAJY29uZmlnIFNDSEVEX0NSRURJVF9ERUZBVUxUCiAJCWJvb2wg
IkNyZWRpdCBTY2hlZHVsZXIiIGlmIFNDSEVEX0NSRURJVApAQCAtMjIxLDcgKzIyMSw3IEBAIGNv
bmZpZyBTQ0hFRF9ERUZBVUxUCiAJZGVmYXVsdCAicnRkcyIgaWYgU0NIRURfUlREU19ERUZBVUxU
CiAJZGVmYXVsdCAiYXJpbmM2NTMiIGlmIFNDSEVEX0FSSU5DNjUzX0RFRkFVTFQKIAlkZWZhdWx0
ICJudWxsIiBpZiBTQ0hFRF9OVUxMX0RFRkFVTFQKLQlkZWZhdWx0ICJjcmVkaXQiCisJZGVmYXVs
dCAiY3JlZGl0MiIKIAogZW5kbWVudQogCi0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
