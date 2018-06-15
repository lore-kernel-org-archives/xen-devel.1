From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] tools/libxc: retry hypercall in case of
 EFAULT
Date: Fri, 15 Jun 2018 15:54:36 +0100
Message-ID: <ca5cfa19-fb80-cc6f-77c0-45fb8a0bf5f7@citrix.com>
References: <20180615132641.5461-1-jgross@suse.com>
 <20180615132641.5461-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=stcz=jb=citrix.com=prvs=6971d5c5d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fTq7b-0002b1-ER
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 14:54:39 +0000
In-Reply-To: <20180615132641.5461-4-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDYvMTggMTQ6MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhjL3hjX3ByaXZhdGUuaCBiL3Rvb2xzL2xpYnhjL3hjX3ByaXZhdGUuaAo+IGluZGV4
IDAzYmM5YTc3NzYuLjE4YWRkODAyMzIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGMveGNfcHJp
dmF0ZS5oCj4gKysrIGIvdG9vbHMvbGlieGMveGNfcHJpdmF0ZS5oCj4gQEAgLTI1NCw5ICsyNTQs
MTIgQEAgb3V0MToKPiAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbmxpbmUg
aW50IGRvX2RvbWN0bCh4Y19pbnRlcmZhY2UgKnhjaCwgc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0
bCkKPiArc3RhdGljIGlubGluZSBpbnQgZG9fZG9tY3RsX21heWJlX3JldHJ5KHhjX2ludGVyZmFj
ZSAqeGNoLCBzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJldHJpZXMpCgpJIHJlY29tbWVuZCBy
ZW5hbWluZyB0aGlzIGRvX2RvbWN0bF9yZXRyeV9lZmF1bHQoKSB0byBtYWtlIGl0IGV4cGxpY2l0
CndoaWNoIGVycm9yIGNhdXNlcyBhIHJldHJ5LsKgIFdlJ3ZlIGdvdCBvdGhlciBhIGZldyBvdGhl
ciBhZGhvYyBwbGFjZXMKd2hpY2ggcmV0cnkgb24gb3RoZXIgZXJyb3JzLgoKPiBAQCAtMjgxLDYg
KzI4NywxOCBAQCBzdGF0aWMgaW5saW5lIGludCBkb19kb21jdGwoeGNfaW50ZXJmYWNlICp4Y2gs
IHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwpCj4gICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gIAo+
ICtzdGF0aWMgaW5saW5lIGludCBkb19kb21jdGwoeGNfaW50ZXJmYWNlICp4Y2gsIHN0cnVjdCB4
ZW5fZG9tY3RsICpkb21jdGwpCj4gK3sKPiArICAgIHJldHVybiBkb19kb21jdGxfbWF5YmVfcmV0
cnkoeGNoLCBkb21jdGwsIDApOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCBkb19kb21j
dGxfcmV0cnkoeGNfaW50ZXJmYWNlICp4Y2gsIHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwpCj4g
K3sKPiArICAgIHVuc2lnbmVkIGludCByZXRyaWVzID0geGVuY2FsbF9idWZmZXJzX25ldmVyX2Zh
dWx0KHhjaC0+eGNhbGwpID8gMCA6IDI7CgpQcm9iYWJseSBhIHZlcnkgbWlub3IgaXNzdWUsIGJ1
dCBpcyBpdCB3b3J0aCBjYWNoaW5nIG5ldmVyX2ZhdWx0IG9uY2UKd2hlbiBvcGVuaW5nIHRoZSB4
Y19pbnRlcmZhY2U/wqAgQ2FsbGluZyBpbnRvIGEgc2VwYXJhdGUgc2hhcmVkIG9iamVjdCBvbgpl
dmVyeSBkb21jdGwgaXNuJ3QgdGhlIGhlaWdodCBvZiBlZmZpY2llbmN5LgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
