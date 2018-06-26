From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11 v2 1/3] x86/HVM: don't cause #NM to
 be raised in Xen
Date: Tue, 26 Jun 2018 10:24:06 +0100
Message-ID: <ed73094a-5569-e95e-e2d1-80941669530b@citrix.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
 <5B31DEE402000078001CDC11@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a3a5=jm=citrix.com=prvs=7081fe03c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fXkCo-0006gI-3l
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 09:24:10 +0000
In-Reply-To: <5B31DEE402000078001CDC11@prv1-mh.provo.novell.com>
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMDc6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBjaGFuZ2VzIGZvciBY
U0EtMjY3IGRpZCBub3QgdG91Y2ggbWFuYWdlbWVudCBvZiBDUjAuVFMgZm9yIEhWTQo+IGd1ZXN0
cy4gSW4gZnVsbHkgZWFnZXIgbW9kZSB0aGlzIGJpdCBzaG91bGQgbmV2ZXIgYmUgc2V0IHdoZW4K
PiByZXNwZWN0aXZlIHZDUFUtcyBhcmUgYWN0aXZlLCBvciBlbHNlIGh2bWVtdWxfZ2V0X2ZwdSgp
IG1pZ2h0IGxlYXZlIGl0Cj4gd3JvbmdseSBzZXQsIGxlYWRpbmcgdG8gI05NIGluIGh5cGVydmlz
b3IgY29udGV4dC4KPgo+IHtzdm0sdm14fV9lbnRlcigpIGFuZCB7c3ZtLHZteH1fZnB1X2RpcnR5
X2ludGVyY2VwdCgpIGJlY29tZSB1bnJlYWNoYWJsZQo+IHRoaXMgd2F5LiBFeHBsaWNpdCB7c3Zt
LHZteH1fZnB1X2xlYXZlKCkgaW52b2NhdGlvbnMgbmVlZCB0byBiZSBndWFyZGVkCj4gbm93Lgo+
Cj4gV2l0aCBubyBDUjAuVFMgbWFuYWdlbWVudCBuZWNlc3NhcnkgaW4gZnVsbHkgZWFnZXIgbW9k
ZSwgdGhlcmUncyBhbHNvIG5vCj4gbmVlZCBhbnltb3JlIHRvIGludGVyY2VwdCAjTk0uCj4KPiBS
ZXBvcnRlZC1ieTogQ2hhcmxlcyBBcm5vbGQgPGNhcm5vbGRAc3VzZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
