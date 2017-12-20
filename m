From: Juergen Gross <jgross@suse.com>
Subject: Re: Xen PV DomU running Kernel
 4.14.5-1.el7.elrepo.x86_64: xl -v vcpu-set <domU> <val> triggers domU
 kernel WARNING, then domU becomes unresponsive
Date: Wed, 20 Dec 2017 11:44:08 +0100
Message-ID: <33fb1ef0-1f38-4fbd-e9b2-4e4667a1d3ef@suse.com>
References: <a6b5ea989fca5a6833c159d89a6da71e@ddns.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=groa=dq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eRbrF-0008A4-FE
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 10:44:17 +0000
In-Reply-To: <a6b5ea989fca5a6833c159d89a6da71e@ddns.com.au>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adi Pircalabu <adi@ddns.com.au>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMTcgMDc6MzEsIEFkaSBQaXJjYWxhYnUgd3JvdGU6Cj4gUG9zdGVkIGluaXRpYWxs
eSB0byBjZW50b3MtdmlydCBtYWlsaW5nIGxpc3QuIFBsZWFzZSBub3RlIEknbSBub3QKPiBzdWJz
Y3JpYmVkIHRvIHhlbi1kZXZlbC4KPiAKPiBSdW5uaW5nICJ4bCAtdiB2Y3B1LXNldCA8ZG9tVT4g
PHZhbD4iIG9uIGJvdGggQ2VudE9TIDYgcnVubmluZwo+IDQuMTQuNS0xLmVsNi5lbHJlcG8ueDg2
XzY0IGFuZCBDZW50T1MgNyBydW5uaW5nCj4gNC4xNC41LTEuZWw3LmVscmVwby54ODZfNjQgSSdt
IGFibGUgdG8gdHJpZ2dlciB0aGlzIGJ1ZyB3aGVyZSBjZXJ0YWluCj4gY29tbWFuZHMgaW4gdGhl
IGRvbVUgc3RhbGw6CgpBcyBJIGNhbid0IHJlcHJvZHVjZSB0aGlzIHByb2JsZW0gd2l0aCBhIDQu
MTUtcmM0IHVwc3RyZWFtIGtlcm5lbApJIHN1c3BlY3QgdGhpcyBtaWdodCBiZSBhIENlbnRPUyBz
cGVjaWZpYyBwcm9ibGVtLgoKT3IgaXMgdGhlcmUgYW55dGhpbmcgc3BlY2lhbCB3aGljaCBtdXN0
IGJlIGRvbmUgdG8gc2VlIHRoZSBwcm9ibGVtPwpZb3UgYXJlIHF1aXRlIHZhZ3VlIGluIHRoaXMg
cmVzcGVjdCAobm8gY29uZmlnIGRldGFpbHMsIG5vIGNsdWUgd2hldGhlcgphZGRpbmcgb3IgcmVt
b3ZpbmcgdmNwdXMgaXMgYSBwcm9ibGVtLCBub3RoaW5nIG1lbnRpb25lZCBhYm91dCB0aGUKbG9h
ZCBvZiB0aGUgZG9tVXMuLi4pLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
