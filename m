From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] AMD/IOMMU: disable previously enabled
 IOMMUs upon init failure
Date: Wed, 10 Apr 2019 13:57:44 +0100
Message-ID: <034134a7-0a06-26a7-b77f-55b43b690b1a@citrix.com>
References: <5CAB2E5F02000078002254F6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HBqT=SM=citrix.com=prvs=996c6fe0e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hECoc-0006aP-5V
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:58:58 +0000
In-Reply-To: <5CAB2E5F02000078002254F6@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMjAxOSAxMjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSWYgYW55IElPTU1VcyB3
ZXJlIHN1Y2Nlc3NmdWxseSBpbml0aWFsaXplZCBiZWZvcmUgZW5jb3VudGVyaW5nIGZhaWx1cmUs
Cj4gdGhlIHN1Y2Nlc3NmdWxseSBlbmFibGVkIG9uZXMgc2hvdWxkIGJlIGRpc2FibGVkIGFnYWlu
IGJlZm9yZSBjbGVhbmluZwo+IHVwIHRoZWlyIHJlc291cmNlcy4KPgo+IE1vdmUgZGlzYWJsZV9p
b21tdSgpIG5leHQgdG8gZW5hYmxlX2lvbW11KCkgdG8gYXZvaWQgYSBmb3J3YXJkCj4gZGVjbGFy
YXRpb24sIGFuZCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byByZW1vdmUgc3RyYXkgYmxhbmsgbGlu
ZXMgYWhlYWQKPiBvZiBib3RoIGZ1bmN0aW9ucycgZmluYWwgY2xvc2luZyBicmFjZXMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
