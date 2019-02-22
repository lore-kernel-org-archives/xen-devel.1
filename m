From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 05:34:06 -0700
Message-ID: <5C6FEC3E02000078002191F2@prv1-mh.provo.novell.com>
References: <1550786936-5925-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxA3l-0001rr-4k
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:36:09 +0000
In-Reply-To: <1550786936-5925-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDIzOjA4LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTW9kZXJuIExpbnV4IGtlcm5lbHMgdGF1Z2h0IHRvIGNvcHkgYWxsIHRoZSBuZWNlc3Nh
cnkgRE1BUi9JUiB0YWJsZXMKPiBmb2xsb3dpbmcga2V4ZWMgZnJvbSB0aGUgcHJldmlvdXMga2Vy
bmVsIChYZW4gaW4gb3VyIGNhc2UpIC0gc28gaXQncwo+IGN1cnJlbnRseSBub3JtYWwgdG8ga2Vl
cCBJT01NVSBlbmFibGVkLiBJdCBtaWdodCByZXF1aXJlIG1pbm9yIGNoYW5nZXMgdG8KPiBrZHVt
cCBjb21tYW5kIGxpbmUgdGhhdCBlbmFibGVzIElPTU1VIGRyaXZlcnMgKGUuZy4gaW50ZWxfaW9t
bXU9b24gLwo+IGludHJlbWFwPW9uKSBidXQgcmVjZW50IGtlcm5lbHMgZG9uJ3QgcmVxdWlyZSBh
bnkgYWRkaXRpb25hbCBjaGFuZ2VzIGZvcgo+IHRoZSB0cmFuc2l0aW9uIHRvIGJlIHRyYW5zcGFy
ZW50LgoKSW4geW91ciByZXBseSBvbiB0aGUgdjEgdGhyZWFkIGRpZG4ndCB5b3Ugc2F5IExpbnV4
IGRpc2FibGVzIHRyYW5zbGF0aW9uPwoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0zNSw2
ICszNSw3IEBAIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2lnZnggPSAxOwo+ICBib29sX3Qg
X19yZWFkX21vc3RseSBpb21tdV9zbm9vcCA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlv
bW11X3FpbnZhbCA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2ludHJlbWFwID0g
MTsKPiArYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfY3Jhc2hfZGlzYWJsZTsKPiAgCj4gIHN0
YXRpYyBib29sIF9faHdkb21faW5pdGRhdGEgaW9tbXVfaHdkb21fbm9uZTsKPiAgYm9vbCBfX2h3
ZG9tX2luaXRkYXRhIGlvbW11X2h3ZG9tX3N0cmljdDsKCldoaWxlIEkgY2FuIHNlZSB0aGF0IGFs
bCB1cHBlciBjb250ZXh0IHN0aWxsIHVzZXMgYm9vbF90LCBsb3dlciBjb250ZXh0CmFscmVhZHkg
c3VnZ2VzdHMgdG8gYmV0dGVyIHVzZSBib29sLiBBbiBlYXN5IHRvIG1ha2UgYWRqdXN0bWVudAp3
aGlsZSBjb21taXR0aW5nIGlmIG5vIG90aGVyIG5lZWQgYXJpc2VzIGZvciBhIHYzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
