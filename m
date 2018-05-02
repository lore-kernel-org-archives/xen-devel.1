From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: fix return value checks of
 set_guest_{machinecheck, nmi}_trapbounce
Date: Wed, 2 May 2018 10:37:55 +0100
Message-ID: <43f40313-5c79-49f9-a595-0f272f6827b8@citrix.com>
References: <5AE97E9C02000078001C00D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4tft=hv=citrix.com=prvs=653accde0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fDoD2-0007I4-IP
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 09:38:00 +0000
In-Reply-To: <5AE97E9C02000078001C00D5@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMTggMTA6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCAwMTQyMDY0NDIx
ICgieDg2L3RyYXBzOiBtb3ZlIHNldF9ndWVzdF97bWFjaGluZSxubWl9X3RyYXBib3VuY2UiKQo+
IGNvbnZlcnRlZCB0aGUgZnVuY3Rpb25zJyByZXR1cm4gdHlwZXMgZnJvbSBpbnQgdG8gYm9vbCB3
aXRob3V0IGFsc28KPiBjb3JyZWN0aW5nIHRoZSBjaGVja3MgaW4gYXNzZW1ibHkgY29kZTogVGhl
IEFCSSBkb2VzIG5vdCBndWFyYW50ZWUgc3ViLQo+IDMyLWJpdCByZXR1cm4gdmFsdWVzIHRvIGJl
IHByb21vdGVkIHRvIDMyIGJpdHMuCj4KPiBUYWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNvIGFkanVz
dCB0aGUgbnVtYmVyIG9mIHNwYWNlcyB1c2VkIGluIHRoZSBjb21wYXQKPiBjb2RlLCBzdWNoIHRo
YXQgYm90aCBjb2RlIHNlcXVlbmNlcyBlbmQgdXAgc2ltaWxhciAodGhleSBhbHJlYWR5IGFyZSBp
bgo+IHRoZSBub24tY29tcGF0IGNhc2UpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
