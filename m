From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 15:13:25 +0000
Message-ID: <9ee23b2f-eded-537a-25a3-46a8a8118b06@citrix.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
 <5C755426020000780021A5AB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AghO=RB=citrix.com=prvs=9532012e5=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gyeVC-0000ZD-HE
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 15:18:38 +0000
In-Reply-To: <5C755426020000780021A5AB@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMjAxOSAxNDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDIuMTkg
YXQgMTQ6MjUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjYvMDIv
MjAxOSAxMzoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Cj4+PiBAQCAtMzIzLDYgKzMyNywx
MCBAQCBzdGF0aWMgdm9pZCBzZXR1cF9wNl93YXRjaGRvZyh1bnNpZ25lZCBjb3VudGVyKQo+Pj4g
ICAgICB1bnNpZ25lZCBpbnQgZXZudHNlbDsKPj4+ICAKPj4+ICAgICAgbm1pX3BlcmZjdHJfbXNy
ID0gTVNSX1A2X1BFUkZDVFIoMCk7Cj4+PiArICAgIGlmICggY3VycmVudF9jcHVfZGF0YS5jcHVp
ZF9sZXZlbCA+PSAweGEgKQo+Pj4gKyAgICAgICAgbm1pX3A2X2V2ZW50X3dpZHRoID0gTUFTS19F
WFRSKGNwdWlkX2VheCgweGEpLCBQNl9FVkVOVF9XSURUSF9NQVNLKTsKPj4+ICsgICAgaWYgKCAh
bm1pX3A2X2V2ZW50X3dpZHRoICkKPj4+ICsgICAgICAgIG5taV9wNl9ldmVudF93aWR0aCA9IFA2
X0VWRU5UX1dJRFRIX0RFRkFVTFQ7Cj4+Cj4+IFRoaXMgaXMgY2FsbGVkIG9uIGVhY2ggY3B1LCBi
dXQgd3JpdGVzIHRvIGEgc2hhcmVkIHZhcmlhYmxlLiAgVGhpcwo+PiBlbnRpcmUgYmxvY2sgd2Fu
dHMgdG8gYmUgc29tZXRoaW5nIGxpa2U6Cj4+Cj4+IGlmICggIW5taV9wNl9ldmVudF93aWR0aCAp
Cj4+ICAgICBubWlfcDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9jcHVfZGF0YS5jcHVpZF9sZXZl
bCA+PSAweGEpID8KPj4gTUFTS19FWFRSKGNwdWlkX2VheCgweGEpLCBQNl9FVkVOVF9XSURUSF9N
QVNLKSA6IFA2X0VWRU5UX1dJRFRIX0RFRkFVTFQ7Cj4+Cj4+IChzdWl0YWJseSB3cmFwcGVkKSBz
byBpdCBnZXRzIGZpbGxlZCBvbmx5IG9uY2UuCj4gCj4gUGx1cyB0aGUgbG93IGFuZCBoaWdoIGNh
cHBpbmcgb2YgdGhlIHZhbHVlIHJlYWQsIGFzIHJlcXVlc3RlZCBpbgo+IHJlcGx5IHRvIHYxLgoK
SXNuJ3QgaXQgdGhlIGNvdW50ZXIgY2xpcHBpbmcgeW91IHJlcXVlc3RlZCAod2hpY2ggd2FzIGlt
cGxlbWVudGVkIGluCnYyKT8gV2hhdCBpcyB0aGUgcG9pbnQgaW4gaGlnaCBjYXBwaW5nPyBJcyBp
dCBzYWZlIHRvIGNvbnRpbnVlIGlmIHRoZQp2YWx1ZSByZWFkIGlzIGxvd2VyIHRoYW4gUDZfRVZF
TlRfV0lEVEhfREVGQVVMVCBvciBzaG91bGQgSSBwYW5pYyBoZXJlPwpPYnZpb3VzbHksIEknZCBu
ZWVkIHRvIGNsaXAgdGhlIGNvdW50ZXIgaW4gdGhhdCBjYXNlIGFzIHRoZSByZXN0IG9mIHRoZQpj
b2RlIHdvdWxkbid0IHdvcmsgb3RoZXJ3aXNlLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
