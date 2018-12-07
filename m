From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/pv: Code improvements to
 do_update_descriptor()
Date: Fri, 7 Dec 2018 12:59:30 +0000
Message-ID: <242fb0c0-cad7-91a7-beae-e4c4448e2e9c@citrix.com>
References: <1544119435-15037-1-git-send-email-andrew.cooper3@citrix.com>
 <1544119435-15037-3-git-send-email-andrew.cooper3@citrix.com>
 <5C0A639102000078002040B9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C0A639102000078002040B9@prv1-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxMjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0yNDQsMTkgKzI0
MCwyMCBAQCBsb25nIGRvX3VwZGF0ZV9kZXNjcmlwdG9yKHVpbnQ2NF90IHBhLCB1aW50NjRfdCBk
ZXNjKQo+PiAgICAgICAgICBicmVhazsKPj4gICAgICB9Cj4+ICAKPj4gLSAgICBwYWdpbmdfbWFy
a19kaXJ0eShjdXJyZCwgX21mbihtZm4pKTsKPj4gKyAgICBwYWdpbmdfbWFya19kaXJ0eShjdXJy
ZCwgbWZuKTsKPj4gIAo+PiAgICAgIC8qIEFsbCBpcyBnb29kIHNvIG1ha2UgdGhlIHVwZGF0ZS4g
Ki8KPj4gLSAgICBnZHRfcGVudCA9IG1hcF9kb21haW5fcGFnZShfbWZuKG1mbikpOwo+PiAtICAg
IHdyaXRlX2F0b21pYygodWludDY0X3QgKikmZ2R0X3BlbnRbb2Zmc2V0XSwgKih1aW50NjRfdCAq
KSZkKTsKPj4gLSAgICB1bm1hcF9kb21haW5fcGFnZShnZHRfcGVudCk7Cj4+ICsgICAgZW50cnkg
PSBtYXBfZG9tYWluX3BhZ2UobWZuKSArIChnYWRkciAmIH5QQUdFX01BU0spOwo+PiArICAgIEFD
Q0VTU19PTkNFKGVudHJ5LT5yYXcpID0gZC5yYXc7Cj4gV2h5IG5vdCAiQUNDRVNTX09OQ0UoKmVu
dHJ5KSA9IGQ7Ij8gSSdtIGhhdmluZyB0cm91YmxlIHRvCj4gdW5kZXJzdGFuZCB3aHkgdGhlIG1h
Y3JvIGluc2lzdHMgb24gdXNpbmcgc2NhbGFyIHR5cGVzICh0aGVyZSdzCj4gbm8gY29tbWVudCB0
aGVyZSBleHBsYWluaW5nIHRoZSBuZWVkKS4KCkdDQyA0LnggKDYgYW5kIDcgaWlyYykgaGF2ZSBh
IGJ1ZyB3aGVyZSB0aGUgdm9sYXRpbGUgY2FzdCBkb2Vzbid0IGdldAphcHBsaWVkIHRvIHN0cnVj
dHVyZSBtZW1iZXJzLsKgIFRoaXMgY2FzZSBJIHRoaW5rIGl0IHdvdWxkIGJlIHNhZmUgYXMgdGhl
CndyaXRlIGNhbid0IGJlIGhvaXN0ZWQgYmVmb3JlIHRoZSBtYXBfZG9tYWluX3BhZ2UoKSwgYnV0
IHRoaXMgYnVnIGRpZApyZXN1bHQgaW4gaW5jb3JyZWN0IGNvbXBpbGVkIGNvZGUgaW4gTGludXgu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
