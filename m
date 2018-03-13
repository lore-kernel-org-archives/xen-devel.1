From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/5] x86/hvm: Handle viridian MSRs via
 the new guest_{rd, wr}msr() infrastructure
Date: Tue, 13 Mar 2018 09:20:26 -0600
Message-ID: <5AA7FA4A02000078001B10D9@prv-mh.provo.novell.com>
References: <1520449116-15443-1-git-send-email-andrew.cooper3@citrix.com>
 <1520449116-15443-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1520449116-15443-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE4IGF0IDE5OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTE3NSwxMSArMTc3LDI2IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3Qg
dmNwdSAqdiwgdWludDMyX3QgbXNyLCB1aW50NjRfdCAqdmFsKQo+ICAgICAgICAgICAgICAgICBf
TVNSX01JU0NfRkVBVFVSRVNfQ1BVSURfRkFVTFRJTkc7Cj4gICAgICAgICAgYnJlYWs7Cj4gIAo+
ICsgICAgY2FzZSBNU1JfSFlQRVJWSVNPUl9TVEFSVCAuLi4gTVNSX0hZUEVSVklTT1JfU1RBUlQg
KyBOUl9WSVJJRElBTl9NU1JTIC0gCj4gMToKPiArICAgICAgICBpZiAoIGlzX3ZpcmlkaWFuX2Rv
bWFpbihkKSApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICByZXQgPSBndWVzdF9yZG1zcl92
aXJpZGlhbih2LCBtc3IsIHZhbCk7Cj4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAg
IH0KPiArCj4gKyAgICAgICAgLyogRmFsbHRocm91Z2guICovCj4gICAgICBkZWZhdWx0Ogo+ICAg
ICAgICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJMRTsKPiAgICAgIH0KPiAgCj4gLSAgICBy
ZXR1cm4gWDg2RU1VTF9PS0FZOwo+ICsgb3V0OgoKSSd2ZSBub3RpY2VkIHRoaXMgb25seSBpbiB0
aGUgY29udGV4dCBvZiBwYXRjaCA0LCBidXQgd2h5IGlzIHRoaXMgbGFiZWwKYW5kIHlldCBhbm90
aGVyIHVubmVjZXNzYXJ5ICJnb3RvIiBoZXJlPyBUaGF0ICJnb3RvIiBjb3VsZCBzaW1wbHkKYmUg
ImJyZWFrIiBhZmFpY3MuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
