From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 06/34] x86: fix two unused variable errors
 when !CONFIG_HVM
Date: Tue, 21 Aug 2018 10:09:16 +0200
Message-ID: <20180821080916.ipdwzgnckoaippf5@mac>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <cf5941eac4668c2b0979339614d549026179dbab.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=js+4=le=citrix.com=prvs=7646db883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fs1qS-00039P-D5
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:16:56 +0000
Content-Disposition: inline
In-Reply-To: <cf5941eac4668c2b0979339614d549026179dbab.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDQ6MTI6MjRQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgb25lIGluIGNvbnRleHRfc3dpdGNoIGlzIGZpeGVkIGJ5IGFubm90YXRpbmcgd2l0aCBf
X21heWJlX3VudXNlZAo+IGJlY2F1c2UgSSB3YW50IHRvIGtlZXAgcHJldmQgYXJvdW5kLgo+IAo+
IFRoZSBvdGhlciBpcyBmaXhlZCBieSBlbGltaW5hdGluZyB2Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZG9tYWlu
LmMgICAgICAgICAgIHwgMyArKy0KPiAgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyB8
IDMgKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYv
ZG9tYWluLmMKPiBpbmRleCA1YmI5MDBlLi41NzRiZGYwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBAIC0xNjcxLDcg
KzE2NzEsOCBAQCBzdGF0aWMgdm9pZCBfX2NvbnRleHRfc3dpdGNoKHZvaWQpCj4gIHZvaWQgY29u
dGV4dF9zd2l0Y2goc3RydWN0IHZjcHUgKnByZXYsIHN0cnVjdCB2Y3B1ICpuZXh0KQo+ICB7Cj4g
ICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+IC0gICAgY29uc3Qg
c3RydWN0IGRvbWFpbiAqcHJldmQgPSBwcmV2LT5kb21haW4sICpuZXh0ZCA9IG5leHQtPmRvbWFp
bjsKPiArICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKiBfX21heWJlX3VudXNlZCBwcmV2ZCA9IHBy
ZXYtPmRvbWFpbiwKPiArICAgICAgICAqbmV4dGQgPSBuZXh0LT5kb21haW47CgpDb3VsZCB5b3Ug
YWxpZ24gKm5leHRkIHRvIHByZXZkPwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
