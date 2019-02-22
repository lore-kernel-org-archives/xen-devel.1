From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 12:43:17 +0000
Message-ID: <a3d1097a-04fb-9f19-3421-9463842dcb19@citrix.com>
References: <1550786936-5925-1-git-send-email-igor.druzhinin@citrix.com>
 <5C6FEC3E02000078002191F2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3YMO=Q5=citrix.com=prvs=949a3c8b6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gxAB1-000313-K1
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:43:39 +0000
In-Reply-To: <5C6FEC3E02000078002191F2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMjAxOSAxMjozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMTkg
YXQgMjM6MDgsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gTW9kZXJuIExp
bnV4IGtlcm5lbHMgdGF1Z2h0IHRvIGNvcHkgYWxsIHRoZSBuZWNlc3NhcnkgRE1BUi9JUiB0YWJs
ZXMKPj4gZm9sbG93aW5nIGtleGVjIGZyb20gdGhlIHByZXZpb3VzIGtlcm5lbCAoWGVuIGluIG91
ciBjYXNlKSAtIHNvIGl0J3MKPj4gY3VycmVudGx5IG5vcm1hbCB0byBrZWVwIElPTU1VIGVuYWJs
ZWQuIEl0IG1pZ2h0IHJlcXVpcmUgbWlub3IgY2hhbmdlcyB0bwo+PiBrZHVtcCBjb21tYW5kIGxp
bmUgdGhhdCBlbmFibGVzIElPTU1VIGRyaXZlcnMgKGUuZy4gaW50ZWxfaW9tbXU9b24gLwo+PiBp
bnRyZW1hcD1vbikgYnV0IHJlY2VudCBrZXJuZWxzIGRvbid0IHJlcXVpcmUgYW55IGFkZGl0aW9u
YWwgY2hhbmdlcyBmb3IKPj4gdGhlIHRyYW5zaXRpb24gdG8gYmUgdHJhbnNwYXJlbnQuCj4gCj4g
SW4geW91ciByZXBseSBvbiB0aGUgdjEgdGhyZWFkIGRpZG4ndCB5b3Ugc2F5IExpbnV4IGRpc2Fi
bGVzIHRyYW5zbGF0aW9uPwoKSSBkaWRuJ3QgcnVsZSBvdXQgYSBwb3NzaWJpbGl0eSB0aGF0IHRo
ZXJlIHdlcmUgdmVyc2lvbnMgb2YgTGludXggdGhhdApkaWQgaXQgaW4gYSB3cm9uZyBvcmRlciBv
ciBkaWRuJ3QgZG8gaXQgYXQgYWxsIGFzIGN1cnJlbnQgdmVyc2lvbnMgZG8uCgpJZ29yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
