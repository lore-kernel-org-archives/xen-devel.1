From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Fri, 6 Apr 2018 12:21:32 +0100
Message-ID: <5b3c515d-ff2e-4159-8760-2ea5c87aa5aa@citrix.com>
References: <20180406075256.8427-1-jgross@suse.com>
 <20180406075256.8427-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dv9u=g3=citrix.com=prvs=62756feec=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f4PR2-0004Kj-RT
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 11:21:36 +0000
In-Reply-To: <20180406075256.8427-3-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDQvMTggMDg6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gV2hlbiBzd2l0Y2hpbmcg
dG8gYSA2NC1iaXQgcHYgY29udGV4dCB0aGUgVExCIGlzIGZsdXNoZWQgdHdpY2UgdG9kYXk6Cj4g
dGhlIGZpcnN0IHRpbWUgd2hlbiBzd2l0Y2hpbmcgdG8gdGhlIG5ldyBhZGRyZXNzIHNwYWNlIGlu
Cj4gd3JpdGVfcHRiYXNlKCksIHRoZSBzZWNvbmQgdGltZSB3aGVuIHN3aXRjaGluZyB0byBndWVz
dCBtb2RlIGluCj4gcmVzdG9yZV90b19ndWVzdC4KPgo+IExpbWl0IHRoZSBmaXJzdCBmbHVzaCB0
byBub24tZ2xvYmFsIGVudHJpZXMgaW4gdGhhdCBjYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpUaGlzIGlzbid0IHNhZmUuwqAgSWYgYW55IHNwZWN1bGF0aW9u
L3ByZWZldGNoaW5nIGhhcHBlbnMgaW50byB0aGUgbmV3Cmd1ZXN0IG1hcHBpbmdzLCB3ZSB3aWxs
IGdldCBtYWNoaW5lIGNoZWNrIGV4Y2VwdGlvbnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
