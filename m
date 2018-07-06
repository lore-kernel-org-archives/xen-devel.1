From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86/spec-ctrl: "no-xen" should not imply
 "no-eager-fpu"
Date: Fri, 06 Jul 2018 04:27:38 -0600
Message-ID: <5B3F441A02000078001D1CDC@prv1-mh.provo.novell.com>
References: <5B362B7002000078001CF218@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w/jz=jw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fbNxm-0003nb-CC
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 10:27:42 +0000
In-Reply-To: <5B362B7002000078001CF218@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

UGluZz8KCj4+PiBPbiAyOS4wNi4xOCBhdCAxNDo1MiwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPiAiRWFnZXIgRlBVIiBtb2RlIGlzIHRvIGd1YXJkIGd1ZXN0cywgbm90IFhlbiBpdHNlbGYs
IGFzIGlzIGFsc28KPiBleHByZXNzZWQgYnkgcHJpbnRfZGV0YWlscygpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94ZW4vYXJj
aC94ODYvc3BlY19jdHJsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKPiBAQCAt
MTI0LDYgKzEyNCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3NwZWNfY3RybChjb25zdAo+
ICAgICAgICAgICAgICBvcHRfbXNyX3NjX3B2ID0gZmFsc2U7Cj4gICAgICAgICAgICAgIG9wdF9t
c3Jfc2NfaHZtID0gZmFsc2U7Cj4gIAo+ICsgICAgICAgICAgICBvcHRfZWFnZXJfZnB1ID0gMDsK
PiArCj4gICAgICAgICAgZGlzYWJsZV9jb21tb246Cj4gICAgICAgICAgICAgIG9wdF9yc2JfcHYg
PSBmYWxzZTsKPiAgICAgICAgICAgICAgb3B0X3JzYl9odm0gPSBmYWxzZTsKPiBAQCAtMTMxLDcg
KzEzMyw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3NwZWNfY3RybChjb25zdAo+ICAgICAg
ICAgICAgICBvcHRfdGh1bmsgPSBUSFVOS19KTVA7Cj4gICAgICAgICAgICAgIG9wdF9pYnJzID0g
MDsKPiAgICAgICAgICAgICAgb3B0X2licGIgPSBmYWxzZTsKPiAtICAgICAgICAgICAgb3B0X2Vh
Z2VyX2ZwdSA9IDA7Cj4gICAgICAgICAgfQo+ICAgICAgICAgIGVsc2UgaWYgKCB2YWwgPiAwICkK
PiAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
