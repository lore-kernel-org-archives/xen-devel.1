From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Wed, 20 Feb 2019 18:19:28 +0000
Message-ID: <df8a00b2-2c53-307c-e459-d1180a2b785a@citrix.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <5C6BBAA50200007800217DCE@prv1-mh.provo.novell.com>
 <1df95f34-34c8-88cd-6971-748d565f34a8@citrix.com>
 <5C6D146602000078002183D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yUjJ=Q3=citrix.com=prvs=94737ca7f=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gwWUf-00045W-4e
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 18:21:17 +0000
In-Reply-To: <5C6D146602000078002183D2@prv1-mh.provo.novell.com>
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

T24gMjAvMDIvMjAxOSAwODo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gCj4gU29tZSBlbnRpdHkg
bmVlZHMgdG8gZGVjaWRlIHdoZXRoZXIgdG8gYWRkIHRoZSByZXNwZWN0aXZlIGNvbW1hbmQKPiBs
aW5lIG9wdGlvbiB0byB0aGUgY3Jhc2gga2VybmVsJ3MgY29tbWFuZCBsaW5lLiBJdCBzaG91bGQg
YmUgdGhpcyBzYW1lCj4gZW50aXR5IHRvIHRlbGwgWGVuIHdoZXRoZXIgdG8ga2VlcCB0aGUgSU9N
TVUgZW5hYmxlZCB3aGlsZSBpbnZva2luZwo+IHRoZSBjcmFzaCBrZXJuZWwuIEkgYW0gbWVyZWx5
IGd1ZXNzaW5nIHRoYXQgdGhpcyBlbnRpdHkgaXMgdGhlIGtleGVjCj4gdG9vbC4KPiAKCkkgd2Fz
IGp1c3QgZG91YmxlIGNoZWNraW5nIGFuZCBpdCBzZWVtcyAoYXNzdW1pbmcgdGhlIGRldmljZSBy
ZXNldApjb3JyZWN0bHkgaW4gdGhlIGNyYXNoIGtlcm5lbCkgZXZlcnl0aGluZyBzZWVtIHRvIHdv
cmsgZXZlbiB3aXRob3V0CmVuYWJsaW5nIGludGVsX2lvbW11IGluIHRoZSBjb21tYW5kIGxpbmUg
LSBuZXdlciBrZXJuZWxzIGhhbmRsZSB0aGlzCmNhc2UgYnkgZXhwbGljaXRseSBkaXNhYmxpbmcg
dHJhbnNsYXRpb24gaW4gYW55IGNhc2U6IHRoZXkgZXhwZWN0IGl0IHRvCmJlIGVuYWJsZWQgYnkg
dGhlIHByZXZpb3VzIGtlcm5lbC4KCkkgaW50ZW5kZWQgWGVuIGNvbW1hbmQgbGluZSBvcHRpb24g
YmUgbW9yZSBvZiBhIGZhbGxiYWNrIG1lY2hhbmlzbSBmb3IKdGhvc2Ugc3RpbGwgdXNpbmcgYW5j
aWVudCBrZHVtcCBrZXJuZWxzLiBGb3IgYWxsIHRoZSBvdGhlcnMgdGhlCnRyYW5zaXRpb24gc2hv
dWxkIGJlIHRyYW5zcGFyZW50LiBXaXRoIHRoZSBhYm92ZSBzYWlkLCBoYXZpbmcgYW4Kb3JjaGVz
dHJhdGlvbiB0b29sIG9uIHRvcCBvZiB0aGF0IHNlZW1zIGEgYml0IG9mIG92ZXJraWxsLgoKPj4g
SSdtIG5vdCBmb2xsb3dpbmcgeW91ciBsYXN0IHF1ZXN0aW9uLiBDb3VsZCB5b3UgZWxhYm9yYXRl
Pwo+IAo+IEknbSBzaW1wbHkgYXNraW5nIHdoYXQgdGhlIGJhcmUgbWV0YWwgZXF1aXZhbGVudCBi
ZWhhdmlvciBpcyBoZXJlLAo+IGkuZS4gaG93IGNvbW1hbmQgbGluZSBvcHRpb24gYWRkaXRpb24g
YW5kIElPTU1VIHN0YXRlIGFyZSBiZWluZwo+IGtlcHQgaW4gc3luYyBpbiB0aGF0IGNhc2UuIEp1
c3QgZm9yIHJlZmVyZW5jZSwgaW4gdGhlIGhvcGUgdGhhdCB3aGF0Cj4gdGhleSBkbyBpcyBzYW5l
LCBhbmQgaGVuY2Ugd2UgY291bGQgZm9sbG93IHRoYXQgbW9kZWwuCj4gCgpBcyBtZW50aW9uZWQg
YWJvdmUsIExpbnV4IChhcyB0aGUgbWFpbiBrZXJuZWwpIGN1cnJlbnRseSBvbmx5IHN1cHBvcnRz
CnNlY29uZGFyeSBrZXJuZWxzIHRoYXQgZXhwZWN0IElPTU1VIHRvIGJlIGVuYWJsZWQgYW5kIGhh
dmUgYmFzaWMgRE1BUgp1bmRlcnN0YW5kaW5nIHdoaWNoIG1lYW5zIGNyYXNoIGtlcm5lbCBpcyBz
dXBwb3NlZCB0byBiZSB1cCB0byBkYXRlIHdpdGgKdGhlIG1haW4gb25lLiBPbiB0aGUgb3RoZXIg
aGFuZCwgTGludXggKGFzIGEgY3Jhc2gga2VybmVsKSBleHBlY3RzIHRoZQptYWluIGtlcm5lbCAo
d2hpY2ggbWlnaHQgYmUgWGVuKSB0byBkbyBlaXRoZXIgb2YgdGhpbmdzOiBrZWVwIElPTU1VCmVu
YWJsZWQgb3IgZGlzYWJsZWQgLSBib3RoIGNhc2VzIGFyZSBoYW5kbGVkLgoKSWdvcgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
