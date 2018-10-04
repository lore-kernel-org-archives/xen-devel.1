From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86: fix !CONFIG_HVM build for clang 3.8
Date: Thu, 4 Oct 2018 19:52:25 +0300
Message-ID: <a847dc3d-f8cc-6490-1c18-0f4734b30fe3@bitdefender.com>
References: <20181004164237.8776-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uicy=mq=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g86rl-0005QF-J5
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 16:52:45 +0000
In-Reply-To: <20181004164237.8776-1-wei.liu2@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvNC8xOCA3OjQyIFBNLCBXZWkgTGl1IHdyb3RlOgo+IEl0IGlzIGRpc2NvdmVyZWQgdGhh
dCBodm1fZnVuY3MgbWFkZSBpdCBpbnRvIG1vbml0b3IubyBldmVuIHdoZW4gSFZNCj4gaXMgZGlz
YWJsZWQuIFRoaXMgdmVyc2lvbiBvZiBjbGFuZyBkb2Vzbid0IHNlZW0gdG8gY29tcGxldGVseQo+
IGVsaW1pbmF0ZSB0aGUgY29kZSBhZnRlciBpc19odm1fZG9tYWluKCkgaW4KPiBhcmNoX21vbml0
b3JfZ2V0X2NhcGFiaWxpdGllcygpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
