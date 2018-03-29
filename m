From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] xl/libxl: add pvcalls support
Date: Thu, 29 Mar 2018 17:52:12 +0100
Message-ID: <23229.6588.733059.254392@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1802271323350.4239@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=odto=gt=citrix.com=prvs=619709e6e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f1anN-0004TF-Si
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 16:53:01 +0000
In-Reply-To: <alpine.DEB.2.10.1802271323350.4239@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSF0geGwvbGlieGw6IGFkZCBwdmNhbGxz
IHN1cHBvcnQiKToKPiBBZGQgcHZjYWxscyBzdXBwb3J0IHRvIGxpYnhsIGFuZCB4bC4gQ3JlYXRl
IHRoZSBhcHByb3ByaWF0ZSBwdmNhbGxzCj4gZW50cmllcyBpbiB4ZW5zdG9yZS4KLi4uCj4gKyMj
IyMgfi9kZXZpY2UvcHZjYWxscy8kREVWSUQvKiBbXQo+ICsKPiArUGFyYXZpcnR1YWxpemVkIFBP
U0lYIGZ1bmN0aW9uIGNhbGxzIGZyb250ZW5kLiBEZXNjcmliZWQgYnkKPiArW2RvY3MvbWlzYy9w
dmNhbGxzLm1hcmtkb3duXVtQVkNBTExTXQoKSXQncyBub3QgZW50aXJlbHkgY2xlYXIgd2hhdCB0
aGUgc2VtYW50aWNzIGFyZSBpZiBtdWx0aXBsZSBwdmNhbGxzCmRldmljZXMgYXJlIHByb3ZpZGVk
LiAgV2hpY2ggaXMgdGhlIGd1ZXN0IGV4cGVjdGVkIHRvIHVzZSA/CgpQZXJoYXBzIHRoZSBkb2Mg
c2hvdWxkIHN0YXRlIHNvbWUgY29udmVudGlvbiwgaWYgdGhlcmUgaXMgb25lLiAgSSBob3BlCnRo
ZXJlIGlzIHN1Y2ggYSBjb252ZW50aW9uICgkREVWSUQgdXN1YWxseSAwIG1heWJlPykKCj4gKyAg
ICBmb3IgKGkgPSAwOyBpIDwgZF9jb25maWctPm51bV9wdmNhbGxzczsgaSsrKQoKVGhlIG5hbWUg
YHB2Y2FsbHNzJyBpcyBjbHVtc3kuICBCdXQgSSdtIG5vdCBzdXJlIEkgaGF2ZSBhIG11Y2ggYmV0
dGVyCnN1Z2dlc3Rpb24uCgpPbmUgaWRlYSBtaWdodCBiZSB0byByZW5hbWUgeW91ciB3aG9sZSB0
aGluZyBgcHZycGMnIHNpbmNlIGl0J3MgYQpnZW5lcmFsIFJQQyBzY2hlbWUsIG1vcmUgb3IgbGVz
cy4gIEV4Y2VwdCB0aGF0IEkgZG9uJ3Qgd2FudCB0byBjb21lIGluCm5vdyBhbmQgc2F5IHlvdSBz
aG91bGQgcmVuYW1lIGl0LiAgQW5kIGFsc28gbW9zdCBycGMgc3lzdGVtcyBoYXZlIGFuCmlkbCBs
YW5ndWFnZSBhbmQgeW91IGhhdmUgYWQgaG9jIGJpbmFyeSBzdHJ1Y3RzLgoKSGF2ZSB5b3UgY29u
c2lkZXJlZCBjYWxsaW5nIHRoaXMgYHB2Y2FsbHNpZnMnID8gIFdoZXJlIGBpZicgaXMKYGludHJl
cmZhY2UnID8gIE9yIHNvbWV0aGluZyA/CgpBbnl3YXksIEkgd291bGQgbGlrZSB5b3UgdG8gdGhp
bmsgYWJvdXQgdGhpcyBhbmQgYW5zd2VyIG15IHF1ZXN0aW9ucwpidXQgSSBkb24ndCB0aGluayBp
dCdzIGEgYmxvY2tlci4gCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
