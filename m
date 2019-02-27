From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v4] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Wed, 27 Feb 2019 12:07:00 +0000
Message-ID: <f7fb7eb7-af10-7a7b-6206-7451884d5b2a@citrix.com>
References: <1551203046-15581-1-git-send-email-igor.druzhinin@citrix.com>
 <5C766019020000780021A9EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUA+=RC=citrix.com=prvs=954925935=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gyxzQ-0006hY-Fj
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 12:07:08 +0000
In-Reply-To: <5C766019020000780021A9EC@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMjAxOSAxMDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gCj4gUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBhbGJlaXQgLi4uCj4gCj4+IEBAIC0z
MjMsNiArMzI2LDE1IEBAIHN0YXRpYyB2b2lkIHNldHVwX3A2X3dhdGNoZG9nKHVuc2lnbmVkIGNv
dW50ZXIpCj4+ICAgICAgdW5zaWduZWQgaW50IGV2bnRzZWw7Cj4+ICAKPj4gICAgICBubWlfcGVy
ZmN0cl9tc3IgPSBNU1JfUDZfUEVSRkNUUigwKTsKPj4gKyAgICBpZiAoICFubWlfcDZfZXZlbnRf
d2lkdGggKQo+PiArICAgIAlubWlfcDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9jcHVfZGF0YS5j
cHVpZF9sZXZlbCA+PSAweGEpID8KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFT
S19FWFRSKGNwdWlkX2VheCgweGEpLCBQNl9FVkVOVF9XSURUSF9NQVNLKSA6Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFA2X0VWRU5UX1dJRFRIX01JTjsKPj4gKyAgICBpZiAoICFu
bWlfcDZfZXZlbnRfd2lkdGggKQo+PiArICAgICAgICBubWlfcDZfZXZlbnRfd2lkdGggPSBQNl9F
VkVOVF9XSURUSF9NSU47Cj4gCj4gLi4uIEkgdGhpbmsgdGhpcyB3b3VsZCBub3cgYmV0dGVyIGJl
Cj4gCj4gICAgIGlmICggIW5taV9wNl9ldmVudF93aWR0aCAmJiBjdXJyZW50X2NwdV9kYXRhLmNw
dWlkX2xldmVsID49IDB4YSApCj4gICAgICAgICBubWlfcDZfZXZlbnRfd2lkdGggPSBNQVNLX0VY
VFIoY3B1aWRfZWF4KDB4YSksIFA2X0VWRU5UX1dJRFRIX01BU0spOwo+ICAgICBpZiAoICFubWlf
cDZfZXZlbnRfd2lkdGggKQo+ICAgICAgICAgbm1pX3A2X2V2ZW50X3dpZHRoID0gUDZfRVZFTlRf
V0lEVEhfTUlOOwo+IAo+IFJlLXdyaXRpbmcgb2Ygd2hpY2ggYWxzbyBtYWQgbWUgbm90aWNlIGEg
aGFyZCB0YWIgaW4gdGhlcmUuIEknZCBiZQo+IGZpbmUgbWFraW5nIHRoZSBhZGp1c3RtZW50IHdo
aWxlIGNvbW1pdHRpbmcsIGFzIGxvbmcgYXMgeW91IGFncmVlLgoKVGhhbmtzLCBJIGFsc28gZGlk
bid0IGxpa2UgaG93IGl0IGxvb2tlZCBldmVudHVhbGx5LiBJJ2xsIG1ha2UgdGhlIHNhbWUKYWRq
dXN0bWVudCB0byBteSBjb3B5IG9mIHRoZSBwYXRjaCBhcyB3ZWxsIHRoZW4uCgo+IEJ0dywgY29u
c2lkZXJpbmcgdGhlIGNvbWJpbmF0aW9uIG9mIHN1YmplY3QgdGFnIGFuZCBDYyBsaXN0IEkgdGFr
ZSBpdAo+IHRoYXQgeW91IGRvbid0IGludGVuZCB0aGlzIHRvIGdvIGludG8gNC4xMj8gSSBhc2sg
YmVjYXVzZSBnZW5lcmFsbHkKPiBJJ2QgY29uc2lkZXIgdGhpcyBhIGJhY2twb3J0aW5nIGNhbmRp
ZGF0ZS4KClllcywgSSBkaWRuJ3QgaW50ZW5kIGl0IHRvIHRhcmdldCA0LjEyIGFzIEkgZG9uJ3Qg
Y29uc2lkZXIgaXQgYSBzZXJpb3VzCmlzc3VlIC0gd2UndmUgb25seSBzZWVuIGl0IG9uIG9uZSB0
eXBlIG9mIFN1cGVybWljcm8gbWFjaGluZXMKKHVuZm9ydHVuYXRlbHksIG91ciBsYWIgaXMgbm93
IGFsbW9zdCA1MCUgb2YgdGhlbSkgc28gZmFyIHdpdGggcG9vcgppbXBsZW1lbnRhdGlvbiBvZiBF
UlNULiBCdXQgSSB3b3VsZG4ndCBtaW5kIGlmIGl0IHdhcyBzZWxlY3RlZCBhcyBhCmNhbmRpZGF0
ZSBmb3IgNC4xMiBhbmQgcG90ZW50aWFsIGJhY2twb3J0aW5nLgoKSWdvcgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
