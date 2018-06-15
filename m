From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: add new hypercall buffer mapping device
Date: Fri, 15 Jun 2018 10:43:03 -0400
Message-ID: <ca081371-7b21-85d2-edcc-8b7273c09cb2__22061.2403042198$1529073717$gmane$org@oracle.com>
References: <20180615131740.5037-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=if9m=jb=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fTpwf-0000sq-Ay
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 14:43:21 +0000
In-Reply-To: <20180615131740.5037-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTUvMjAxOCAwOToxNyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiArc3RhdGljIGlu
dCBwcml2Y21kX2J1Zl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPiArewo+ICsJc3RydWN0IHByaXZjbWRfYnVmX3ByaXZhdGUgKmZpbGVfcHJpdiA9
IGZpbGUtPnByaXZhdGVfZGF0YTsKPiArCXN0cnVjdCBwcml2Y21kX2J1Zl92bWFfcHJpdmF0ZSAq
dm1hX3ByaXY7Cj4gKwl1bnNpZ25lZCBpbnQgY291bnQgPSB2bWFfcGFnZXModm1hKTsKPiArCXVu
c2lnbmVkIGludCBpOwo+ICsJaW50IHJldCA9IDA7Cj4gKwo+ICsJaWYgKCEodm1hLT52bV9mbGFn
cyAmIFZNX1NIQVJFRCkpIHsKPiArCQlwcl9lcnIoIk1hcHBpbmcgbXVzdCBiZSBzaGFyZWRcbiIp
Owo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsKPiArCWlmIChmaWxlX3ByaXYtPmFsbG9j
YXRlZCArIGNvdW50ID4gbGltaXQpIHsKPiArCQlwcl9lcnIoIk1hcHBpbmcgbGltaXQgcmVhY2hl
ZCFcbiIpOwo+ICsJCXJldHVybiAtRU5PU1BDOwoKClRoaXMgZXJyb3IgKHdoaWNoIEkgdGhvdWdo
dCBzaG91bGQgaGF2ZSBiZWVuIEUyQklHKSBpcyBub3QgaW4gdGhlIGxpc3QKb2YgYWxsb3dlZCBl
cnJvciBjb2RlcyAocGVyIG1hbiBwYWdlKS4gSSB0aGluayBpdCBpdCdzIGVpdGhlciBFSU5WQUwg
b3IKRU5PTUVNIChFSU5WQUwgc2VlbXMgbW9yZSBhcHByb3ByaWF0ZSB0byBtZSkuCgpJIGFtIGFs
c28gbm90IHN1cmUgYWJvdXQgcHJfZXJyIGFzIHRoZSBjYWxsZXIgY2FuIGZvcmNlIGl0IChhbHRo
b3VnaApwcmVzdW1hYmx5IHRoZSBmaWxlIGlzIG9ubHkgYWNjZXNzaWJsZSB0byBzdXBlcnVzZXIp
LgoKLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
