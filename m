From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add Amlogic S905 SoC early
 printk support
Date: Wed, 12 Sep 2018 10:12:06 +0100
Message-ID: <c16a9f12-2a1e-0124-a282-d2874aaf4e8e@arm.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-2-git-send-email-amittomer25@gmail.com>
 <683b761d-ccf8-b46e-284f-1713ef856b8f@arm.com>
 <CABHD4K-K+XNYPZ4e2_kKa-PcAwKd-5OD5V72dTvb9qbr8qQeWA@mail.gmail.com>
 <122b7b82-af4e-66f7-d210-2b9e0842fbc7@arm.com>
 <CABHD4K9T94iVVZHWPZaMEmNmhidQsGgpsJxd0W3c6+jpph+HuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hc24=l2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g01C1-0000JI-6e
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 09:12:13 +0000
In-Reply-To: <CABHD4K9T94iVVZHWPZaMEmNmhidQsGgpsJxd0W3c6+jpph+HuA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George Dunlap <George.Dunlap@eu.citrix.com>, ian.jackson@eu.citrix.com, tim@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8xMi8yMDE4IDA3OjQzIEFNLCBBbWl0IFRvbWVyIHdyb3RlOgo+IEhlbGxvLAo+IAo+
PiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoeSBMaW51eCBpcyBkb2luZyBpdC4gRG8geW91
IGV4cGVjdCBhbGwKPj4gVS1Cb290IHZlcnNpb24gdG8gZG8gaXQ/Cj4gCj4gSXQncyBiZWNhdXNl
IExpbnV4IGRvZXNuJ3QgcmVhbGx5IHRydXN0IHUtYm9vdCBhbmQgaW5pdGlhbGl6ZXMgZXZlcnkK
PiB0aGluZyBhZ2FpbiA/CgpZb3UgZG9uJ3Qga25vdyB0aGUgc3RhdGUgb2YgdGhlIFVBUlQgb25j
ZSB5b3UgbGVmdCBVLWJvb3QuIEZvciAKZWFybHlwcmludGsgdGhpcyBtYXkgbm90IGJlIGEgYmln
IGRlYWwgKHRoZXkgYXJlIGZvciBkZWJ1Z2dpbmcgb25seSkuCgo+IE1haW5saW5lIFUtYm9vdCBk
b2VzIGl0IGJ1dCB0aGF0IG1heSBhbHNvIG5vdCByZXF1aXJlZCBzaW5jZSBBVEYgZG9lcyBpdCBm
b3IgdXMuCgpXaGF0IEkgd2FudGVkIHRvIGNoZWNrIGlzIHdoZXRoZXIgdGhlcmUgYXJlIFUtYm9v
dCBvdXQgY29uZmlndXJpbmcgCiJpbmNvcnJlY3RseSIgdGhlIFVBUlQgZm9yIGVhcmx5cHJpbnRr
LiBCdXQgSSBndWVzcyB3ZSBjYW4gbGVhdmUgdGhhdCAKYXNpZGUgZm9yIG5vdy4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
