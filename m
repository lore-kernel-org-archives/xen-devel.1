From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: correct AVX512BW write masking
 checks
Date: Wed, 30 Jan 2019 19:04:00 +0000
Message-ID: <486e3429-c9de-e609-10e8-36a55513cad8@citrix.com>
References: <5C3C7511020000780020D2BF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QFm2=QG=citrix.com=prvs=926d8012e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1govCF-0000XI-Bf
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 19:06:51 +0000
In-Reply-To: <5C3C7511020000780020D2BF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDEvMjAxOSAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRm9yIFZQU0FEQlcgdGhp
cyBsaWtlbHkgd2FzIGEgcmVzdWx0IG9mIGJhZCBjb3B5LWFuZC1wYXN0ZS4KPgo+IEZvciBWUFN7
TCxSfUxEUSBjb21tZW50IGFuZCBjb2RlIHdlcmUgbm90IGluIGxpbmUsIGJ1dCB0aGVuIGFnYWlu
IHRoZQo+IGNvbW1lbnQgYWxzbyB3YXNuJ3QgZnVsbHkgdXBkYXRlZCBmcm9tIHRoZSBBVlgyIG9y
aWdpbmFsIGl0IGdvdCBjbG9uZWQKPiBmcm9tLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSdtIGd1ZXNzaW5nIHRoYXQgdGhlc2UgYXJlIGNvdmVy
ZWQgYnkgdGhlIGZpcnN0IHJvdyBvZiB0YWJsZSAyLTQwLCBhbmQKdGhlIGFic2Vuc2Ugb2Yge2sx
fSBpbiB0aGUgaW5zdHJ1Y3Rpb24gc3BlY2lmaWNhdGlvbnM/Cgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
