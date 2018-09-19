From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 19 Sep 2018 17:09:38 +0300
Message-ID: <3c896de5-dafc-26ac-8829-b9ccbe2fd413@bitdefender.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pw+p=mb=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g2dAz-00017R-Oc
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 14:09:57 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 4A946305FFAF
 for <xen-devel@lists.xenproject.org>; Wed, 19 Sep 2018 17:09:56 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 1B2257FC62
 for <xen-devel@lists.xenproject.org>; Wed, 19 Sep 2018 17:09:56 +0300 (EEST)
In-Reply-To: <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, george.dunlap@eu.citrix.com
Cc: andrew.cooper3@citrix.com, kevin.tian@intel.com, wei.liu2@citrix.com, jbeulich@suse.com, jun.nakajima@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8xOS8xOCAzOjE1IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiAqIGhhcyBwMm1faW5p
dF9hbHRwMm1fZXB0KCkgY29weSBvdmVyIG1heF9tYXBwZWRfcGZuLAo+PiAgIGxvZ2RpcnR5X3Jh
bmdlcywgZ2xvYmFsX2xvZ2RpcnR5LCBlcHQuYWQgYW5kIGRlZmF1bHRfYWNjZXNzCj4+ICAgZnJv
bSB0aGUgaG9zdHAybSAodGhlIGxhdHRlciBtb3JlIGZvciBjb21wbGV0ZW5lc3MgdGhhbiBmb3Ig
YW55Cj4+ICAgb3RoZXIgcmVhc29uKS4KPiBJIHRoaW5rIHRoaXMgaXMgcHJvYmFibHkgdGhlIHJp
Z2h0IGFwcHJvYWNoLiAgVGhlc2UgdmFsdWVzIGNoYW5nZQo+IHJhcmVseSwgYnV0IGFmdGVyIGEg
bWlzY29uZmlnIGFyZSByZWFkIHJlcGVhdGVkbHkuICBTbyBpdCdzIHByb2JhYmx5IGEKPiBsb3Qg
bW9yZSBlZmZpY2llbnQgdG8gcHJvcGFnYXRlIGNoYW5nZXMgd2hlbiB0aGV5IGhhcHBlbiwgcmF0
aGVyIHRoYW4KPiB0cnlpbmcgdG8ga2VlcCBhIHNpbmdsZSBtYXN0ZXIgY29weS4gIEhvd2V2ZXIu
Li4KPiAKPj4gV2Ugc2hvdWxkIGRpc2N1c3MgaWYganVzdCBjb3B5aW5nIG92ZXIKPj4gICBsb2dk
aXJ0eV9yYW5nZXMgKHdoaWNoIGlzIGEgcG9pbnRlcikgaXMgc3VmZmljaWVudCwgb3IgaWYKPj4g
ICB0aGlzIGNvZGUgcmVxdWlyZXMgbW9yZSBzeW5jaHJvbml6YXRpb24pLgo+IEl0J3MgY2xlYXJs
eSBub3Qgc3VmZmljaWVudC4gOi0pICBUaGUgbG9nZGlydHlfcmFuZ2VzIHN0cnVjdCBpcwo+IHBy
b3RlY3RlZCBieSB0aGUgbG9jayBvZiB0aGUgcDJtIHN0cnVjdHVyZSB0aGF0IGNvbnRhaW5zIGl0
OyBpZiB5b3UKPiBwb2ludCB0byBpdCBmcm9tIGEgZGlmZmVyZW50IHAybSBzdHJ1Y3R1cmUsIHRo
ZW4geW91J2xsIGhhdmUKPiBpbmNvbnNpc3RlbnQgbG9nZ2luZywgYW5kIHlvdSdsbCBoYXZlIHBy
b2JsZW1zIGlmIG9uZSB2Y3B1IGlzIHJlYWRpbmcKPiB0aGUgc3RydWN0dXJlIHdoaWxlIGFub3Ro
ZXIgaXMgbW9kaWZ5aW5nIGl0Lgo+IAo+IEFub3RoZXIgaXNzdWUgaXMgdGhhdCBpdCBkb2Vzbid0
IGxvb2sgbGlrZSB5b3UncmUgcHJvcGFnYXRpbmcgdXBkYXRlcyB0bwo+IHRoaXMgc2hhcmVkIHN0
YXRlIGVpdGhlciAtLSBpZiBzb21lb25lIGVuYWJsZXMgb3IgZGlzYWJsZXMKPiBnbG9iYWxfbG9n
ZGlydHksIG9yIGNoYW5nZXMgZGVmYXVsdF9hY2Nlc3MsIHRoZSBhbHRwMm1zIHdpbGwgc3RpbGwg
aGF2ZQo+IHRoZSBvbGQgdmFsdWUuCj4gCj4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGNvbGxlY3Qg
dGhlIHZhcmlvdXMgYml0cyB0aGF0IG5lZWQgdG8gYmUga2VwdCBpbgo+IHN5bmMgYmV0d2VlbiBo
b3N0cDJtL2FsdHAybXMsIHB1dCB0aGVtIGFsbCBpbiBhICdzeW5jJyBzdWItc3RydWN0IHdpdGhp
bgo+IHRoZSBwMm0sIGFuZCBlbmZvcmNlIHVzaW5nIGEgZnVuY3Rpb24gLyBtYWNybyB0byBtb2Rp
ZnkgdGhlIHZhbHVlcyBpbnNpZGUuCgpJJ20gbm90IHN1cmUgaG93IHRvIHB1dCBlcHQuYWQgaW4g
dGhlIG5ldyBzeW5jIHN1Yi1zdHJ1Y3QgLSBwdXR0aW5nIHRoZQpmdWxsIGVwdCBpbiB0aGVyZSBm
ZWVscyBsaWtlIG92ZXJraWxsLCBhbmQganVzdCBwdXR0aW5nIGEgbmV3IHZhcmlhYmxlCnRvIHN5
bWJvbGl6ZSAuYWQgZmVlbHMgY29udm9sdXRlZC4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
