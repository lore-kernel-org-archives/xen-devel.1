From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/svm: Improve diagnostics when
 svm_get_insn_len() fails
Date: Mon, 17 Dec 2018 15:43:30 +0000
Message-ID: <023754c3-f2e5-b7ef-9c94-7998524d8d21@citrix.com>
References: <1544732572-29794-1-git-send-email-andrew.cooper3@citrix.com>
 <1544732572-29794-3-git-send-email-andrew.cooper3@citrix.com>
 <5C13831A0200007800206190@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C13831A0200007800206190@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTIvMjAxOCAxMDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTMuMTIuMTgg
YXQgMjE6MjIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L2VtdWxhdGUuYwo+PiBAQCAtMTQzLDggKzE0MywxNyBAQCBpbnQgc3ZtX2dldF9pbnNuX2xlbihz
dHJ1Y3QgdmNwdSAqdiwgZW51bSBpbnN0cnVjdGlvbl9pbmRleCBpbnNuKQo+PiAgICAgIH0KPj4g
IAo+PiAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLAo+PiAtICAgICAgICAgICAgICIlczog
TWlzbWF0Y2ggYmV0d2VlbiBleHBlY3RlZCBhbmQgYWN0dWFsIGluc3RydWN0aW9uOiAiCj4+IC0g
ICAgICAgICAgICAgImVpcCA9ICVseFxuIiwgIF9fZnVuY19fLCAodW5zaWduZWQgbG9uZyl2bWNi
LT5yaXApOwo+PiArICAgICAgICAgICAgICIlczogTWlzbWF0Y2ggYmV0d2VlbiBleHBlY3RlZCBh
bmQgYWN0dWFsIGluc3RydWN0aW9uOlxuIiwKPj4gKyAgICAgICAgICAgICBfX2Z1bmNfXyk7Cj4g
SXMgX19mdW5jX18gcmVhbGx5IHVzZWZ1bCBpbiBhIGdkcHJpbnRrKCk/CgpXZWxsIC0geW91IGFy
ZSB0aGUgYXV0aG9yIG9mIHRoYXQgY29kZS4uLgoKPgo+PiArICAgIGdkcHJpbnRrKFhFTkxPR19X
QVJOSU5HLAo+PiArICAgICAgICAgICAgICIgIGluc25faW5kZXggJWQsIG9wY29kZSAlI3ggbW9k
cm0gJSN4XG4iLAo+PiArICAgICAgICAgICAgIGluc24sIG9wY190YWJbaW5zbl0ub3Bjb2RlLCAo
KG9wY190YWJbaW5zbl0ubW9kcm0ucm0gIDw8IDYpIHwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChvcGNfdGFiW2luc25dLm1vZHJtLnJlZyA8PCAzKSB8Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAob3BjX3RhYltpbnNu
XS5tb2RybS5tb2QpKSk7Cj4gVGhpcyBpcyBnb2luZyB0byBiZSBtaXNsZWFkaW5nIHdoZW4gYml0
IDMgb2YgbW9kcm0ucmVnIG9yIG1vZHJtLnJtCj4gYXJlIHNldC4KCkknbGwgc3dpdGNoIHRvIDB4
JTAyeAoKPgo+PiArICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiICByaXAgJSNseCwgbmV4
dHJpcCAlI2x4LCBsZW4gJWx1XG4iLAo+PiArICAgICAgICAgICAgIHZtY2ItPnJpcCwgdm1jYi0+
bmV4dHJpcCwgdm1jYi0+bmV4dHJpcCAtIHZtY2ItPnJpcCk7Cj4gSWYgeW91IGZpbmQgaXQgbmVj
ZXNzYXJ5IHRvIGxvZyB0aGUgbGVuZ3RoIGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLCBpcwo+IHRo
ZXJlIGFueSByZWFzb24gbm90IHRvIHVzZSBucmlwX2xlbiBoZXJlPwoKTm8gLSBhIHJlYmFzaW5n
IG92ZXJzaWdodC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
