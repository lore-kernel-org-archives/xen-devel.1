From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Mon, 16 Jul 2018 17:56:55 +0100
Message-ID: <8ac9748a-258c-a9e4-6d0d-b838b58466b5@citrix.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff6o2-0003iZ-75
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 16:57:02 +0000
In-Reply-To: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTc6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvciBhIHJlYXNvbiB0aGF0
IEkgY2FuJ3QgZXhwbGFpbiwgaXQgaXMgb25seSB0aGUgc2hpbSBidWlsZCB0aGF0IGZhaWxzCj4g
Zm9yIG1lIHdpdGggYW4gb2xkZXIgZ2NjIGR1ZSB0byB0aGUgY29tcGlsZXIgbm90IHJlY29nbml6
aW5nIHRoYXQKPiBhcHBhcmVudGx5IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGFyZW4ndCByZWFs
bHkgdW5pbml0aWFsaXplZC4KClRoZSBvbmx5IHRoaW5nIHRoYXQgY29tZXMgdG8gbWluZCBpcyBz
b21lIGRpZmZlcmVuY2VzIGluIENGTEFHUyBldCBhbC7CoApUaGVyZSBpcyBub3RoaW5nIGluIGtj
b25maWcgd2hpY2ggd291bGQgcGxhdXNpYmx5IGltcGFjdCB0aGF0IGNvZGUuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
