From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH for-4.10.0-shim-comet] x86/guest: use the
 vcpu_info area from shared_info
Date: Wed, 17 Jan 2018 11:16:24 +0000
Message-ID: <23135.12424.419280.540031@mariner.uk.xensource.com>
References: <20180117105702.33667-1-roger.pau@citrix.com>
 <47a0b922-7a9a-1afd-d869-c7dec0774c88@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rlig=em=citrix.com=prvs=548fb5411=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eblho-00065g-5Y
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 11:16:32 +0000
In-Reply-To: <47a0b922-7a9a-1afd-d869-c7dec0774c88@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEwLjAtc2hpbS1jb21ldF0g
eDg2L2d1ZXN0OiB1c2UgdGhlIHZjcHVfaW5mbyBhcmVhIGZyb20gc2hhcmVkX2luZm8iKToKPiBX
aXRob3V0IHRoaXMgcGF0Y2gsIHBlb3BsZSBuZWVkIHRvIHJlYm9vdCB0aGVpciBMMCBoeXBlcnZp
c29yIGluIG9yZGVyCj4gdG8gdXNlIENvbWV0LgoKUGVvcGxlIHJ1bm5pbmcgNC4xMC4gIE9uIDQu
OCB0aGlzIHByZXN1bWFibHkgaGFzIG5vIGJlbmVmaXQuCgo+IFRoZSByaXNrIG9mIGNoZWNraW5n
IGl0IGludG8gdGhlIENvbWV0IGJyYW5jaGVzIGJ1dCBub3Qgc3RhZ2luZyBpcyB0aGF0Cj4gaWYg
cGVvcGxlIHVwZGF0ZSB0aGVpciBzaGltIHRvICJSdWRvbHBoIiAoNC4xMSkgd2l0aG91dCByZWJv
b3RpbmcgdGhlaXIKPiBob3N0LCB0aGluZ3MgbWF5IHVuZXhwZWN0ZWRseSBub3Qgd29yay4gIEkg
dGhpbmsgdGhhdCdzIHNvbWV0aGluZyB3ZSBjYW4KPiBsaXZlIHdpdGguCgpQZW9wbGUgd29uJ3Qg
ZXhwZWN0IHRvIGRvIHRoYXQgYmVjYXVzZSBvZiB0aGUgd2F5IHRoZSB0b29scyBhbmQKaHlwZXJ2
aXNvciBhbHJlYWR5IGhhdmUgdG8gYmUgaW4gbG9ja3N0ZXAuCgpJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
