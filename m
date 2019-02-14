From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Thu, 14 Feb 2019 18:06:10 +0000
Message-ID: <2e0d34dc-62c9-363c-7698-cd619ef1b3df@citrix.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rmOa=QV=citrix.com=prvs=941a6a682=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1guLOz-0005Vu-5r
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 18:06:25 +0000
In-Reply-To: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: kevin.tian@intel.com, wei.liu2@citrix.com, jbeulich@suse.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, jun.nakajima@intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxMTo0MiBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IEhWTU9QX2FsdHAy
bV9zZXRfZG9tYWluX3N0YXRlIGRvZXMgbm90IGRvbWFpbl9wYXVzZSgpLCBwcmVzdW1hYmx5Cj4g
b24gcHVycG9zZSAoYXMgaXQgd2FzIG9yaWdpbmFsbHkgc3VwcG9zZWQgdG8gY2F0ZXIgdG8gYSBp
bi1ndWVzdAo+IGFnZW50LCBhbmQgYSBkb21haW4gcGF1c2luZyBpdHNlbGYgaXMgbm90IGEgZ29v
ZCBpZGVhKS4KPiAKPiBUaGlzIGNhbiBsZWFkIHRvIGRvbWFpbiBjcmFzaGVzIGluIHRoZSB2bXhf
dm1leGl0X2hhbmRsZXIoKSBjb2RlCj4gdGhhdCBjaGVja3MgaWYgdGhlIGd1ZXN0IGhhcyB0aGUg
YWJpbGl0eSB0byBzd2l0Y2ggRVBUUCB3aXRob3V0IGFuCj4gZXhpdC4gVGhhdCBjb2RlIGNhbiBf
X3ZtcmVhZCgpIHRoZSBob3N0IHAybSdzIEVQVF9QT0lOVEVSCj4gKGJlZm9yZSBIVk1PUF9hbHRw
Mm1fc2V0X2RvbWFpbl9zdGF0ZSAiZm9yX2VhY2hfdmNwdSgpIiBoYXMgYQo+IGNoYW5jZSB0byBy
dW4gYWx0cDJtX3ZjcHVfaW5pdGlhbGlzZSgpLCBidXQgYWZ0ZXIKPiBkLT5hcmNoLmFsdHAybV9h
Y3RpdmUgaXMgc2V0KS4KClNvcnJ5LCB3aGVyZSBleGFjdGx5IGRvZXMgdGhlIGNyYXNoIGhhcHBl
bj8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
