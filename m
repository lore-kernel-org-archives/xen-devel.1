From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] hvm/monitor: fix usage of the control
	register mask
Date: Fri, 16 Feb 2018 14:26:41 +0200
Message-ID: <25af8171-9294-bf1e-2603-af7bc17f0044@bitdefender.com>
References: <20180216121837.7317-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wjjn=fk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1emf6I-0004z0-0F
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 12:26:50 +0000
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 0D5A57FC05
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2018 14:26:42 +0200 (EET)
In-Reply-To: <20180216121837.7317-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTYvMjAxOCAwMjoxOCBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFByZXZpb3Vz
IHVzYWdlIGlzIG5vdCBjb3JyZWN0IGFuZCB3b3VsZCBwcmV2ZW50IGNlcnRhaW4gdXBkYXRlcyBm
cm9tCj4gYmVpbmcgbm90aWZpZWQgdG8gdGhlIG1vbml0b3IgY2xpZW50Lgo+IAo+IEZvciBleGFt
cGxlIGlmICh2YWx1ZSBeIG9sZCkgPT0gKFBHRSB8IFBTRSkgYW5kIG1hc2sgPT0gUEdFIHRoaXMK
PiB1cGRhdGUgd291bGQgbm90IGJlIG5vdGlmaWVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBSYXp2YW4gQ29q
b2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gQ2M6IFRhbWFzIEsgTGVuZ3llbCA8
dGFtYXNAdGtsZW5neWVsLmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+
ICB4ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vbW9uaXRvci5jIGIveGVuL2FyY2gveDg2L2h2bS9tb25pdG9yLmMKPiBpbmRleCAxMzFi
ODUyMDlmLi4wNDY2NWM1ZjZjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vbW9uaXRv
ci5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9tb25pdG9yLmMKPiBAQCAtMzksNyArMzksNyBA
QCBib29sIGh2bV9tb25pdG9yX2NyKHVuc2lnbmVkIGludCBpbmRleCwgdW5zaWduZWQgbG9uZyB2
YWx1ZSwgdW5zaWduZWQgbG9uZyBvbGQpCj4gICAgICBpZiAoIChhZC0+bW9uaXRvci53cml0ZV9j
dHJscmVnX2VuYWJsZWQgJiBjdHJscmVnX2JpdG1hc2spICYmCj4gICAgICAgICAgICghKGFkLT5t
b25pdG9yLndyaXRlX2N0cmxyZWdfb25jaGFuZ2Vvbmx5ICYgY3RybHJlZ19iaXRtYXNrKSB8fAo+
ICAgICAgICAgICAgdmFsdWUgIT0gb2xkKSAmJgo+IC0gICAgICAgICAoISgodmFsdWUgXiBvbGQp
ICYgYWQtPm1vbml0b3Iud3JpdGVfY3RybHJlZ19tYXNrW2luZGV4XSkpICkKPiArICAgICAgICAg
KCh2YWx1ZSBeIG9sZCkgJiB+YWQtPm1vbml0b3Iud3JpdGVfY3RybHJlZ19tYXNrW2luZGV4XSkg
KQo+ICAgICAgewo+ICAgICAgICAgIGJvb2wgc3luYyA9IGFkLT5tb25pdG9yLndyaXRlX2N0cmxy
ZWdfc3luYyAmIGN0cmxyZWdfYml0bWFzazsKCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
