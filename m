From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH svm v2] svm: fix xentrace p2mt access
Date: Tue, 5 Feb 2019 12:29:11 -0500
Message-ID: <98077072-8d93-f304-4732-d73f3d95aab3@oracle.com>
References: <5C5958700200007800213E09@prv1-mh.provo.novell.com>
 <1549379346-17883-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67yb=QM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gr4XJ-0005JR-HT
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 17:29:29 +0000
In-Reply-To: <1549379346-17883-1-git-send-email-nmanthey@amazon.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Michael Tautschnig <tautschn@amazon.co.uk>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi81LzE5IDEwOjA5IEFNLCBOb3JiZXJ0IE1hbnRoZXkgd3JvdGU6Cj4gQSBwb2ludGVyIG1p
c21hdGNoIGhhcyBiZWVuIHJlcG9ydGVkIHdoZW4gY29tcGlsaW5nIHdpdGggdGhlCj4gY29tcGls
ZXIgZ290by1nY2Mgb2YgdGhlIGJvdW5kZWQgbW9kZWwgY2hlY2tlciBDQk1DLgo+IFRvIGtlZXAg
dHJhY2UgZW50cnkgc2l6ZSBpbmRlcGVuZGVudCBvZiB0aGUgY29tcGlsZXIgaW1wbGVtZW50YXRp
b24sCj4gdXNlIHRoZSBhdmFpbGFibGUgcDJtdCB2YXJpYWJsZSBmb3IgdGhlIGFjY2VzcywgYW5k
IHVwZGF0ZSB0aGUKPiB0cmFjZSByZWNvcmQgaW5kZXBlbmRlbmx5Lgo+Cj4gRml4ZXM6IDlhNzc5
ZTRmIChJbXBsZW1lbnQgU1ZNIHNwZWNpZmljIHBhcnQgZm9yIE5lc3RlZCBWaXJ0dWFsaXphdGlv
bikKPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRl
PgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+Cgo+Cj4gLS0tCj4KPiBOb3RlczoKPiAgICAgdjI6IGtlZXAgdHlwZSwgdXNlIGxvY2FsIHZh
cmlhYmxlIGluIGZ1bmN0aW9uIGNhbGwgYW5kCj4KPiAgeGVuL2FyY2gveDg2L2h2bS9zdm0vc3Zt
LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJj
aC94ODYvaHZtL3N2bS9zdm0uYwo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPiBAQCAtMTgwMCw4ICsxODAwLDkgQEAg
c3RhdGljIHZvaWQgc3ZtX2RvX25lc3RlZF9wZ2ZhdWx0KHN0cnVjdCB2Y3B1ICp2LAo+ICAgICAg
ICAgIHAybSA9IHAybV9nZXRfcDJtKHYpOwo+ICAgICAgICAgIF9kLmdwYSA9IGdwYTsKPiAgICAg
ICAgICBfZC5xdWFsaWZpY2F0aW9uID0gMDsKPiAtICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlw
ZV9hY2Nlc3MocDJtLCBnZm4sICZfZC5wMm10LCAmcDJtYSwgMCwgTlVMTCwgMCk7Cj4gKyAgICAg
ICAgbWZuID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHAybSwgZ2ZuLCAmcDJtdCwgJnAybWEsIDAs
IE5VTEwsIDApOwo+ICAgICAgICAgIF9kLm1mbiA9IG1mbl94KG1mbik7Cj4gKyAgICAgICAgX2Qu
cDJtdCA9IHAybXQ7Cj4gICAgICAgICAgCj4gICAgICAgICAgX190cmFjZV92YXIoVFJDX0hWTV9O
UEYsIDAsIHNpemVvZihfZCksICZfZCk7Cj4gICAgICB9CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
