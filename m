From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 5/5] x86: Reorganise and rename debug
 register fields in struct vcpu
Date: Mon, 15 Oct 2018 16:17:28 +0200
Message-ID: <20181015141728.ycsmywdfrayvi56u@mac.bytemobile.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-6-git-send-email-andrew.cooper3@citrix.com>
 <20181015135614.3n6i7mik6iqignjr@mac.bytemobile.com>
 <2a42589f-d210-ba84-cbfd-3c3b9d1cb2e1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <2a42589f-d210-ba84-cbfd-3c3b9d1cb2e1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMDM6MDc6MjFQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8xMC8xOCAxNDo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgT2N0IDE1LCAyMDE4IGF0IDExOjM2OjIwQU0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNoL3g4
Ni9kb21jdGwuYwo+ID4+ICsKPiA+PiAgICAgIC8qIGRhdGEgYnJlYWtwb2ludCBleHRlbnNpb24g
TVNScyAqLwo+ID4+ICAgICAgdWludDMyX3QgZHJfbWFza1s0XTsKPiA+PiAgCj4gPj4gQEAgLTU2
Nyw3ICs1NzMsMTAgQEAgc3RydWN0IGFyY2hfdmNwdQo+ID4+ICAgICAgdm9pZCAgICAgICAgICAg
ICAgKmZwdV9jdHh0Owo+ID4+ICAgICAgdW5zaWduZWQgbG9uZyAgICAgIHZnY19mbGFnczsKPiA+
PiAgICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzIHVzZXJfcmVnczsKPiA+PiAtICAgIHVuc2lnbmVk
IGxvbmcgICAgICBkZWJ1Z3JlZ1s4XTsKPiA+PiArCj4gPj4gKyAgICAvKiBEZWJ1ZyByZWdpc3Rl
cnMuICovCj4gPj4gKyAgICB1bnNpZ25lZCBsb25nIGRyWzRdLCBkcjc7Cj4gPj4gKyAgICB1bnNp
Z25lZCBpbnQgZHI2Owo+ID4gSSdtIGxpa2VseSBtaXNzaW5nIHNvbWUgaW5mb3JtYXRpb24gaGVy
ZSBiZWNhdXNlIEkgZG9uJ3QgZ2V0IHdoeSBkcjYKPiA+IGlzIDMyYml0cyB3aGlsZSBkcjcgaXMg
NjRiaXRzIHdpZGUuIEFjY29yZGluZyB0byB0aGUgc3BlYyB0aGUgaGlnaAo+ID4gcGFydCAoYml0
cyA2My0zMikgb24gYm90aCByZWdpc3RlcnMgaXMgcmVzZXJ2ZWQsIHNvIEkgdGhpbmsgaXQgd291
bGQKPiA+IG1ha2UgbW9yZSBzZW5zZSB0byB1c2UgdGhlIHNhbWUgdHlwZSBmb3IgYm90aC4KPiAK
PiBkcjcgd291bGQgaWRlYWxseSBiZSAzMiBiaXRzIHdpZGUsIGJ1dCBfX3ZtcmVhZCgpIHVzZXMg
dW5zaWduZWQgbG9uZyAqLgoKSnVzdCBzYXcgeW91ciByZXBseSB0byBCb3JpcywgbWFrZXMgc2Vu
c2UuCgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
