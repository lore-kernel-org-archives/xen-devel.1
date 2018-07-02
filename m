From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.11 v2 1/3] x86/HVM: don't cause #NM to
 be raised in Xen
Date: Mon, 2 Jul 2018 05:57:02 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191235AC4@SHSMSX101.ccr.corp.intel.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
 <5B31DEE402000078001CDC11@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/r+i=js=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fZrps-0006Hf-Ep
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 05:57:16 +0000
In-Reply-To: <5B31DEE402000078001CDC11@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIEp1bmUgMjYsIDIwMTggMjozNiBQTQo+IAo+IFRoZSBjaGFuZ2VzIGZvciBYU0EtMjY3
IGRpZCBub3QgdG91Y2ggbWFuYWdlbWVudCBvZiBDUjAuVFMgZm9yIEhWTQo+IGd1ZXN0cy4gSW4g
ZnVsbHkgZWFnZXIgbW9kZSB0aGlzIGJpdCBzaG91bGQgbmV2ZXIgYmUgc2V0IHdoZW4KPiByZXNw
ZWN0aXZlIHZDUFUtcyBhcmUgYWN0aXZlLCBvciBlbHNlIGh2bWVtdWxfZ2V0X2ZwdSgpIG1pZ2h0
IGxlYXZlIGl0Cj4gd3JvbmdseSBzZXQsIGxlYWRpbmcgdG8gI05NIGluIGh5cGVydmlzb3IgY29u
dGV4dC4KPiAKPiB7c3ZtLHZteH1fZW50ZXIoKSBhbmQge3N2bSx2bXh9X2ZwdV9kaXJ0eV9pbnRl
cmNlcHQoKSBiZWNvbWUKPiB1bnJlYWNoYWJsZQo+IHRoaXMgd2F5LiBFeHBsaWNpdCB7c3ZtLHZt
eH1fZnB1X2xlYXZlKCkgaW52b2NhdGlvbnMgbmVlZCB0byBiZSBndWFyZGVkCj4gbm93Lgo+IAo+
IFdpdGggbm8gQ1IwLlRTIG1hbmFnZW1lbnQgbmVjZXNzYXJ5IGluIGZ1bGx5IGVhZ2VyIG1vZGUs
IHRoZXJlJ3MgYWxzbyBubwo+IG5lZWQgYW55bW9yZSB0byBpbnRlcmNlcHQgI05NLgo+IAo+IFJl
cG9ydGVkLWJ5OiBDaGFybGVzIEFybm9sZCA8Y2Fybm9sZEBzdXNlLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
