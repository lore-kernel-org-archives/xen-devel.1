From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Date: Thu, 02 May 2019 08:24:54 -0600
Message-ID: <5CCAFDB6020000780022B4F4@prv1-mh.provo.novell.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
 <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
 <5CCAF70E020000780022B4A1@prv1-mh.provo.novell.com>
 <941b423b37074521af2e4559fd19c149@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMCe0-0002sS-3M
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:25:04 +0000
In-Reply-To: <941b423b37074521af2e4559fd19c149@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE5IGF0IDE2OjEyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFjdHVhbGx5LCBzaW5jZSBnbG9iYWxfbG9nZGlydHkgaXMgc29tZXdoYXQgdHJhbnNpZW50
IHNob3VsZCB3ZSBub3QgYWxzbyAKPiBoYXZlIGEgY2hlY2sgdG8gcHJldmVudCBwMm1fcmFtX2xv
Z2RpcnR5IGZyb20gYmVpbmcgc2V0IGZvciBhIGRvbWFpbiB3aXRoIAo+IGFzc2lnbmVkIGRldmlj
ZXMgYW5kIHNoYXJlZCBFUFQ/CgpQcm9iYWJseSAoaWYgd2UgaW5kZWVkIGRvbid0KSwgYnV0IGlt
byBub3QgaW4gdGhpcyBwYXRjaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
