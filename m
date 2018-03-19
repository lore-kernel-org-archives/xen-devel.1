From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH 11/20] xen/domctl: Merge set_gnttab_limits
 into createdomain
Date: Mon, 19 Mar 2018 21:43:20 +0000
Message-ID: <E432D9F5-6C9D-44F5-AD7C-6F3635FB5933@citrix.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-12-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-12-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <7951C9008C89F14AAC6ADE4568DDE643@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Jonathan Ludlam <Jonathan.Ludlam@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMTkuIE1hciAyMDE4LCBhdCAxOToxMywgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiArCW1heF9ncmFudF9mcmFtZXM6IGludDMy
Ow0KPiArCW1heF9tYXB0cmFja19mcmFtZXM6IGludDMyOw0KDQpBcyBwYXJ0IG9mOg0KDQo+ICt0
eXBlIGRvbWN0bF9jcmVhdGVfY29uZmlnID0NCj4gK3sNCj4gKyAgICAgICBzc2lkcmVmOiBpbnQz
MjsNCj4gKyAgICAgICBoYW5kbGU6IHN0cmluZzsNCj4gKyAgICAgICBmbGFnczogZG9tYWluX2Ny
ZWF0ZV9mbGFnIGxpc3Q7DQo+ICsgICAgICAgbWF4X3ZjcHVzOiBpbnQzMjsNCj4gKyAgICAgICBt
YXhfZXZ0Y2huX3BvcnQ6IGludDMyOw0KPiArICAgICAgIG1heF9ncmFudF9mcmFtZXM6IGludDMy
Ow0KPiArICAgICAgIG1heF9tYXB0cmFja19mcmFtZXM6IGludDMyOw0KPiArICAgICAgIGFyY2g6
IGFyY2hfZG9tYWluY29uZmlnOw0KPiArfQ0KDQpUaGlzIGlzIGEgbWlub3IgcG9pbnQ6IGluIE9D
YW1sLCB2YWx1ZXMgb2YgdHlwZSBpbnQzMiBhbmQgaW50NjQgYXJlIHJlcHJlc2VudGVkIGFzIHBv
aW50ZXJzIHRvIGEgbWVtb3J5IGJsb2NrIGNvbnRhaW5pbmcgdGhlIHZhbHVlLiBUaGlzIGlzIHVu
bGlrZSBhbiBpbnQsIHdoaWNoIGlzIHJlcHJlc2VudGVkIHNpbXBseSBhcyBwYXJ0IG9mIGEgbWVt
b3J5IGJsb2NrIHRoYXQgcmVwcmVzZW50cyB0aGUgcmVjb3JkIHZhbHVlLiBCZWNhdXNlIE9DYW1s
IHVzZXMgb25lIGJpdCBhcyBhIHRhZywgdGhlIHJhbmdlIG9mIGludCBhbmQgaW50MzIgKG9uIGEg
MzItYml0IHN5c3RlbSkgaXMgZGlmZmVyZW50LiBNb3N0IG9mIHRoZSB0aW1lIHRoZSByYW5nZSBp
cyBsYXJnZSBlbm91Z2ggYW5kIHBlb3BsZSB1c2UgaW50IHJhdGhlciB0aGFuIGludDMyIG9yIGlu
dDY0IGZvciB0aGF0IHJlYXNvbi4gSSB3b3VsZCBleHBlY3QgdGhhdCBhbiBpbnQgaXMgbGFyZ2Ug
ZW5vdWdoLCBlc3BlY2lhbGx5IG9uIGEgNjQtYml0IHN5c3RlbS4gSG93ZXZlciwgaWYgaW50MzIg
bWFrZXMgaXQgZWFzaWVyIHRvIGFsaWduIHRoaXMgd2l0aCB0aGUgQyBjb2RlLCB0aGlzIGlzIGZp
bmUsIGVzcGVjaWFsbHkgYmVjYXVzZSB0aGVyZSBhcmUgbm90IG1hbnkgdmFsdWVzIG9mIG9tY3Rs
X2NyZWF0ZV9jb25maWcgdG8gYmUgZXhwZWN0ZWQuDQoNCuKAlCBDaHJpc3RpYW4NCg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
