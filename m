From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Wed, 20 Feb 2019 18:57:08 +0000
Message-ID: <ebb27e07-10b5-70b3-f3ad-f1f7a1086ecb@citrix.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <e10e56f7-0da9-3e30-1f50-c1f9ab16dcb1@citrix.com>
 <5C6BB3920200007800217DAD@prv1-mh.provo.novell.com>
 <267c5ebf-7a72-8e65-966e-eefd2da2f2c0@citrix.com>
 <5C6D175702000078002183ED@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yUjJ=Q3=citrix.com=prvs=94737ca7f=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gwX4P-00079y-Jn
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 18:58:13 +0000
In-Reply-To: <5C6D175702000078002183ED@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMjAxOSAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQnV0IGlzbid0IGl0IGEg
dmFsaWQgcXVlc3Rpb24gd2hldGhlciBrZWVwaW5nIGludGVycnVwdCByZW1hcHBpbmcKPiBlbmFi
bGVkIGlzIGhlbHBmdWwgb3IgcG90ZW50aWFsbHkgbWFraW5nIHRoaW5ncyB3b3JzZT8gVGhlCj4g
ZGVzY3JpcHRpb24gb2YgdGhlIHBhdGNoIGRpc2N1c3NlcyB0aGUgRE1BIHRyYW5zbGF0aW9uIGFz
cGVjdHMKPiBvbmx5LiBVbmxlc3MgdGhlIGNyYXNoIGtlcm5lbCB3b3VsZCBhbHdheXMgb3BlcmF0
ZSBpbiBwb2xsaW5nCj4gbW9kZSBvbmx5LCBpdCBuZWVkcyB0byBoYXZlIGludGVycnVwdHMgcm91
dGVkIHRvIHRoZSByaWdodAo+IGhhbmRsZXIocykuIFdoZXRoZXIgdGhhdCdzIGd1YXJhbnRlZWQg
d2l0aCByZW1hcHBpbmcgbGVmdAo+IGVuYWJsZWQgaXMgbm90IHNvbWV0aGluZyB0aGF0IGdvZXMg
d2l0aG91dCBzYXlpbmcsIGltby4KPiAKCklSIGNvcHkgbG9naWMgd29ya3MgYXMgZm9sbG93cyAt
IElSVCBpcyBjb3BpZWQgYXMgaXMgYW5kIHN0aWxsIGluCmZ1bmN0aW9uaW5nIHN0YXRlIHdoaWxl
IHJlbWFwYWJsZSBpbnRlcnJ1cHRzIG1pZ2h0IGJlIGluLWZsaWdodC4gTmV3IElSVAplbnRyaWVz
IGFyZSBhbGxvY2F0ZWQgaW4gYWRkaXRpb24gdG8gZXhpc3Rpbmcgb25lcyB3aGljaCBtYWtlcyB0
aGUKdHJhbnNpdGlvbiB0cmFuc3BhcmVudCBmb3IgYSBkZXZpY2UuIEknbGwgbWVudGlvbiB0aGlz
IGFzcGVjdCBpbiB0aGUKY29tbWl0IG1lc3NhZ2Ugc2luY2UgaXQgZG9lc24ndCBzZWVtIG9idmlv
dXMgLSB5b3UncmUgcmlnaHQuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
