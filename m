From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] tools/libxc: retry hypercall in case of
 EFAULT
Date: Fri, 15 Jun 2018 17:53:42 +0200
Message-ID: <32b9faa9-c788-8c88-7de4-6e6bc79ac844@suse.com>
References: <20180615132641.5461-1-jgross@suse.com>
 <20180615132641.5461-4-jgross@suse.com>
 <ca5cfa19-fb80-cc6f-77c0-45fb8a0bf5f7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=56i5=jb=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fTr2o-0001OK-Ft
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 15:53:46 +0000
In-Reply-To: <ca5cfa19-fb80-cc6f-77c0-45fb8a0bf5f7@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDYvMTggMTY6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTUvMDYvMTggMTQ6
MjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19w
cml2YXRlLmggYi90b29scy9saWJ4Yy94Y19wcml2YXRlLmgKPj4gaW5kZXggMDNiYzlhNzc3Ni4u
MThhZGQ4MDIzMiAxMDA2NDQKPj4gLS0tIGEvdG9vbHMvbGlieGMveGNfcHJpdmF0ZS5oCj4+ICsr
KyBiL3Rvb2xzL2xpYnhjL3hjX3ByaXZhdGUuaAo+PiBAQCAtMjU0LDkgKzI1NCwxMiBAQCBvdXQx
Ogo+PiAgICAgIHJldHVybiByZXQ7Cj4+ICB9Cj4+ICAKPj4gLXN0YXRpYyBpbmxpbmUgaW50IGRv
X2RvbWN0bCh4Y19pbnRlcmZhY2UgKnhjaCwgc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCkKPj4g
K3N0YXRpYyBpbmxpbmUgaW50IGRvX2RvbWN0bF9tYXliZV9yZXRyeSh4Y19pbnRlcmZhY2UgKnhj
aCwgc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmV0cmllcykKPiAKPiBJIHJlY29tbWVuZCBy
ZW5hbWluZyB0aGlzIGRvX2RvbWN0bF9yZXRyeV9lZmF1bHQoKSB0byBtYWtlIGl0IGV4cGxpY2l0
Cj4gd2hpY2ggZXJyb3IgY2F1c2VzIGEgcmV0cnkuwqAgV2UndmUgZ290IG90aGVyIGEgZmV3IG90
aGVyIGFkaG9jIHBsYWNlcwo+IHdoaWNoIHJldHJ5IG9uIG90aGVyIGVycm9ycy4KCk9rYXkuCgo+
IAo+PiBAQCAtMjgxLDYgKzI4NywxOCBAQCBzdGF0aWMgaW5saW5lIGludCBkb19kb21jdGwoeGNf
aW50ZXJmYWNlICp4Y2gsIHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwpCj4+ICAgICAgcmV0dXJu
IHJldDsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGlubGluZSBpbnQgZG9fZG9tY3RsKHhjX2ludGVy
ZmFjZSAqeGNoLCBzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsKQo+PiArewo+PiArICAgIHJldHVy
biBkb19kb21jdGxfbWF5YmVfcmV0cnkoeGNoLCBkb21jdGwsIDApOwo+PiArfQo+PiArCj4+ICtz
dGF0aWMgaW5saW5lIGludCBkb19kb21jdGxfcmV0cnkoeGNfaW50ZXJmYWNlICp4Y2gsIHN0cnVj
dCB4ZW5fZG9tY3RsICpkb21jdGwpCj4+ICt7Cj4+ICsgICAgdW5zaWduZWQgaW50IHJldHJpZXMg
PSB4ZW5jYWxsX2J1ZmZlcnNfbmV2ZXJfZmF1bHQoeGNoLT54Y2FsbCkgPyAwIDogMjsKPiAKPiBQ
cm9iYWJseSBhIHZlcnkgbWlub3IgaXNzdWUsIGJ1dCBpcyBpdCB3b3J0aCBjYWNoaW5nIG5ldmVy
X2ZhdWx0IG9uY2UKPiB3aGVuIG9wZW5pbmcgdGhlIHhjX2ludGVyZmFjZT/CoCBDYWxsaW5nIGlu
dG8gYSBzZXBhcmF0ZSBzaGFyZWQgb2JqZWN0IG9uCj4gZXZlcnkgZG9tY3RsIGlzbid0IHRoZSBo
ZWlnaHQgb2YgZWZmaWNpZW5jeS4KClZpYSBhIGdsb2JhbCB2YXJpYWJsZSBvciBieSBleHRlbmRp
bmcgc3RydWN0IHhjX2ludGVyZmFjZV9jb3JlPyBJYW4/CgoKSnVlcmdlbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
