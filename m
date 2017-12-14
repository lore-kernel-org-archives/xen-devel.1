From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Thu, 14 Dec 2017 06:46:12 -0700
Message-ID: <5A328EB40200007800197573@prv-mh.provo.novell.com>
References: <20171128150853.1927-1-paul.durrant@citrix.com>
 <20171128150853.1927-7-paul.durrant@citrix.com>
 <0ba2e22fae3b424cb63a3743b0a59c63@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vj35=dk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ePTq7-0001bA-6f
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2017 13:46:19 +0000
In-Reply-To: <0ba2e22fae3b424cb63a3743b0a59c63@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjEyLjE3IGF0IDEwOjUxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0K
Pj4gU2VudDogMjggTm92ZW1iZXIgMjAxNyAxNTowOQo+PiArc3RhdGljIGludCBodm1fYWxsb2Nf
aW9yZXFfbWZuKHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzLCBib29sIGJ1ZikKPj4gK3sKPj4g
KyAgICBzdHJ1Y3QgZG9tYWluICpjdXJyZCA9IGN1cnJlbnQtPmRvbWFpbjsKPj4gKyAgICBzdHJ1
Y3QgaHZtX2lvcmVxX3BhZ2UgKmlvcnAgPSBidWYgPyAmcy0+YnVmaW9yZXEgOiAmcy0+aW9yZXE7
Cj4+ICsKPj4gKyAgICBpZiAoIGlvcnAtPnBhZ2UgKQo+PiArICAgIHsKPj4gKyAgICAgICAgLyoK
Pj4gKyAgICAgICAgICogSWYgYSBndWVzdCBmcmFtZSBoYXMgYWxyZWFkeSBiZWVuIG1hcHBlZCAo
d2hpY2ggbWF5IGhhcHBlbgo+PiArICAgICAgICAgKiBvbiBkZW1hbmQgaWYgaHZtX2dldF9pb3Jl
cV9zZXJ2ZXJfaW5mbygpIGlzIGNhbGxlZCksIHRoZW4KPj4gKyAgICAgICAgICogYWxsb2NhdGlu
ZyBhIHBhZ2UgaXMgbm90IHBlcm1pdHRlZC4KPj4gKyAgICAgICAgICovCj4+ICsgICAgICAgIGlm
ICggIWdmbl9lcShpb3JwLT5nZm4sIElOVkFMSURfR0ZOKSApCj4+ICsgICAgICAgICAgICByZXR1
cm4gLUVQRVJNOwo+PiArCj4+ICsgICAgICAgIHJldHVybiAwOwo+PiArICAgIH0KPj4gKwo+PiAr
ICAgIC8qCj4+ICsgICAgICogQWxsb2NhdGVkIElPUkVRIHNlcnZlciBwYWdlcyBhcmUgYXNzaWdu
ZWQgdG8gdGhlIGVtdWxhdGluZwo+PiArICAgICAqIGRvbWFpbiwgbm90IHRoZSB0YXJnZXQgZG9t
YWluLiBUaGlzIGlzIGJlY2F1c2UgdGhlIGVtdWxhdG9yIGlzCj4+ICsgICAgICogbGlrZWx5IHRv
IGJlIGRlc3Ryb3llZCBhZnRlciB0aGUgdGFyZ2V0IGRvbWFpbiBoYXMgYmVlbiB0b3JuCj4+ICsg
ICAgICogZG93biwgYW5kIHdlIG11c3QgdXNlIE1FTUZfbm9fcmVmY291bnQgb3RoZXJ3aXNlIHBh
Z2UgYWxsb2NhdGlvbgo+PiArICAgICAqIGNvdWxkIGZhaWwgaWYgdGhlIGVtdWxhdGluZyBkb21h
aW4gaGFzIGFscmVhZHkgcmVhY2hlZCBpdHMKPj4gKyAgICAgKiBtYXhpbXVtIGFsbG9jYXRpb24u
Cj4+ICsgICAgICovCj4+ICsgICAgaW9ycC0+cGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShjdXJy
ZCwgTUVNRl9ub19yZWZjb3VudCk7Cj4gCj4gVGhpcyBpcyBubyBsb25nZXIgZ29pbmcgdG8gd29y
ayBhcyBpdCBpcyBwcmVkaWNhdGVkIG9uIG15IG9yaWdpbmFsIAo+IG1vZGlmaWNhdGlvbiB0byBI
WVBFUlZJU09SX21tdV91cGRhdGUgKHdoaWNoIGFsbG93ZWQgYSBQViBkb21haW4gdG8gbWFwIGEg
Cj4gZm9yZWlnbiBNRk4gZnJvbSBhIGRvbWFpbiBvdmVyIHdoaWNoIGl0IGhhZCBwcml2aWxlZ2Ug
YXMgaWYgdGhlIE1GTiB3YXMgCj4gbG9jYWwpLiBCZWNhdXNlIHRoYXQgbWVjaGFuaXNtIHdhcyBk
ZWNpZGVkIGFnYWluc3QsIHRoaXMgY29kZSBuZWVkcyB0byBjaGFuZ2UgCj4gdG8gdXNlIHRoZSB0
YXJnZXQgZG9tYWluIG9mIHRoZSBpb3JlcSBzZXJ2ZXIgcmF0aGVyIHRoYW4gdGhlIGNhbGxpbmcg
ZG9tYWluLiAKPiBJIHdpbGwgdmVyZnkgdGhpcyBtb2RpZmljYXRpb24gYW5kIHN1Ym1pdCB2MTUg
b2YgdGhlIHNlcmllcy4KPiAKPiBKYW4sIGFyZSB5b3Ugb2sgZm9yIG1lIHRvIGtlZXAgeW91ciBS
LWI/CgpUaGlzIGlzIGFsbCBwcmV0dHkgZnJhZ2lsZSAtIGJldHRlciBkcm9wIGl0IGFuZCBJJ2xs
IHRoZW4gdGFrZSBhIGxvb2sKb25jZSB5b3UndmUgc2VudCB0aGUgbmV3IHZlcnNpb24uCgpKYW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
