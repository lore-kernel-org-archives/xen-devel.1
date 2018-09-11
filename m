From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 1/4] x86/mm: add optional cache to
 GLA->GFN translation
Date: Tue, 11 Sep 2018 16:40:42 +0300
Message-ID: <6bff29ee-6a57-1a47-e06c-bbc6cf13e7a7@bitdefender.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97BF9102000078001E740A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gjsj=lz=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fziub-0001xC-BC
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 13:41:01 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 5F908305FFAB
 for <xen-devel@lists.xenproject.org>; Tue, 11 Sep 2018 16:40:59 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 49A917FC09
 for <xen-devel@lists.xenproject.org>; Tue, 11 Sep 2018 16:40:59 +0300 (EEST)
In-Reply-To: <5B97BF9102000078001E740A@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gOS8xMS8xOCA0OjEzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGUgY2FjaGluZyBpc24n
dCBhY3R1YWxseSBpbXBsZW1lbnRlZCBoZXJlLCB0aGlzIGlzIGp1c3Qgc2V0dGluZyB0aGUKPiBz
dGFnZS4KPiAKPiBUb3VjaGluZyB0aGVzZSBhbnl3YXkgYWxzbwo+IC0gbWFrZSB0aGVpciByZXR1
cm4gdmFsdWVzIGdmbl90Cj4gLSBndmEgLT4gZ2xhIGluIHRoZWlyIG5hbWVzCj4gLSBuYW1lIHRo
ZWlyIGlucHV0IGFyZ3VtZW50cyBnbGEKPiAKPiBBdCB0aGUgdXNlIHNpdGVzIGRvIHRoZSBjb252
ZXJzaW9uIHRvIGdmbl90IGFzIHN1aXRhYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
