From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/7] xen/x86: use invpcid for flushing
 the TLB
Date: Thu, 29 Mar 2018 07:44:44 -0600
Message-ID: <5ABD09EC02000078001B737F@prv1-mh.provo.novell.com>
References: <20180327090704.28646-1-jgross@suse.com>
 <20180327090704.28646-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fhp7=gt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1XrF-0004x2-AF
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 13:44:49 +0000
In-Reply-To: <20180327090704.28646-5-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE4IGF0IDExOjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAg
LTYzLDYgKzYzLDEwIEBAIGJvb2xlYW5fcGFyYW0oIm5vc21wIiwgb3B0X25vc21wKTsKPiAgc3Rh
dGljIHVuc2lnbmVkIGludCBfX2luaXRkYXRhIG1heF9jcHVzOwo+ICBpbnRlZ2VyX3BhcmFtKCJt
YXhjcHVzIiwgbWF4X2NwdXMpOwo+ICAKPiArLyogb3B0X2ludnBjaWQ6IElmIGZhbHNlLCBkb24n
dCB1c2UgSU5WUENJRCBpbnN0cnVjdGlvbiBldmVuIGlmIGF2YWlsYWJsZS4gKi8KPiArc3RhdGlj
IGJvb2wgX19pbml0ZGF0YSBvcHRfaW52cGNpZCA9IHRydWU7Cj4gK2Jvb2xlYW5fcGFyYW0oImlu
dnBjaWQiLCBvcHRfaW52cGNpZCk7CgpIbW0sIEknbSBzb3JyeSBmb3Igbm90aWNpbmcgb25seSBu
b3cgKHdoaWxlIHNlZWluZyB0aGUgcXVlc3Rpb25hYmxlCnVzZXMgb2YgY3B1X2hhc19pbnZwY2lk
IGluIHBhdGNoIDcpLCBidXQgdGhpcyBiZWluZyBhbiBpbml0LW9ubHkKdmFyaWFibGUgYW5kIGhh
dmluZyAuLi4KCj4gQEAgLTE1NDksNiArMTU1Myw5IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9f
c3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICBpZiAoIGNwdV9oYXNfZnNnc2Jh
c2UgKQo+ICAgICAgICAgIHNldF9pbl9jcjQoWDg2X0NSNF9GU0dTQkFTRSk7Cj4gIAo+ICsgICAg
aWYgKCAhb3B0X2ludnBjaWQgKQo+ICsgICAgICAgIHNldHVwX2NsZWFyX2NwdV9jYXAoWDg2X0ZF
QVRVUkVfSU5WUENJRCk7CgouLi4gdGhpcyBlZmZlY3QgaGFzIHR3byBpc3N1ZXM6IEZvciBvbmUs
IGluIHN1Y2ggYSBjYXNlIHRoaXMgc2hvdWxkCmJlIGEgc3ViLW9wdGlvbiB0byAiY3B1aWQ9Ii4g
QW5kIHRoZW4gYWZhaWN0IGl0IGFsc28gZGlzYWJsZXMgdXNlIG9mCklOVlBDSUQgaW4gSFZNIGd1
ZXN0cy4gSU9XIEkgdGhpbmsgeW91IHdhbnQgdG8gcmV0YWluIHRoZSBvcHRpb24KYnV0IG1ha2Ug
dGhlIHZhcmlhYmxlIG5vbi1pbml0IGFuZCBub24tc3RhdGljLiBPYnZpb3VzbHkgZm9yIGVhcmx5
CmJvb3QgdXNlIGl0IG1heSB0aGVuIG5vIGxvbmdlciBiZSBwb3NzaWJsZSB0byBzZXQgaXQgdG8g
dHJ1ZSBhdCBidWlsZAp0aW1lICh5b3UgbWF5IGVuZCB1cCBuZWVkaW5nIHR3byB2YXJpYWJsZXMp
LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
