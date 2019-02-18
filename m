From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 V5 2/2] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Mon, 18 Feb 2019 12:43:42 +0100
Message-ID: <d23a52e0-e6a2-7e5c-ffa6-6c6613b3de34@suse.com>
References: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
 <1550245284-9321-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gvhKr-0003sw-BM
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:43:45 +0000
In-Reply-To: <1550245284-9321-2-git-send-email-rcojocaru@bitdefender.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxNjo0MSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IEhWTU9QX2FsdHAy
bV9zZXRfZG9tYWluX3N0YXRlIGRvZXMgbm90IGRvbWFpbl9wYXVzZSgpLCBwcmVzdW1hYmx5Cj4g
b24gcHVycG9zZSAoYXMgaXQgd2FzIG9yaWdpbmFsbHkgc3VwcG9zZWQgdG8gY2F0ZXIgdG8gYSBp
bi1ndWVzdAo+IGFnZW50LCBhbmQgYSBkb21haW4gcGF1c2luZyBpdHNlbGYgaXMgbm90IGEgZ29v
ZCBpZGVhKS4KPiAKPiBUaGlzIGNhbiBsZWFkIHRvIGRvbWFpbiBjcmFzaGVzIGluIHRoZSB2bXhf
dm1leGl0X2hhbmRsZXIoKSBjb2RlCj4gdGhhdCBjaGVja3MgaWYgdGhlIGd1ZXN0IGhhcyB0aGUg
YWJpbGl0eSB0byBzd2l0Y2ggRVBUUCB3aXRob3V0IGFuCj4gZXhpdC4gVGhhdCBjb2RlIGNhbiBf
X3ZtcmVhZCgpIHRoZSBob3N0IHAybSdzIEVQVF9QT0lOVEVSCj4gKGJlZm9yZSBIVk1PUF9hbHRw
Mm1fc2V0X2RvbWFpbl9zdGF0ZSAiZm9yX2VhY2hfdmNwdSgpIiBoYXMgYQo+IGNoYW5jZSB0byBy
dW4gYWx0cDJtX3ZjcHVfaW5pdGlhbGlzZSgpLCBidXQgYWZ0ZXIKPiBkLT5hcmNoLmFsdHAybV9h
Y3RpdmUgaXMgc2V0KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
