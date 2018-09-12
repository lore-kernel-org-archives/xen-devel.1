From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add Amlogic S905 SoC early
 printk support
Date: Wed, 12 Sep 2018 12:13:55 +0530
Message-ID: <CABHD4K9T94iVVZHWPZaMEmNmhidQsGgpsJxd0W3c6+jpph+HuA@mail.gmail.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-2-git-send-email-amittomer25@gmail.com>
 <683b761d-ccf8-b46e-284f-1713ef856b8f@arm.com>
 <CABHD4K-K+XNYPZ4e2_kKa-PcAwKd-5OD5V72dTvb9qbr8qQeWA@mail.gmail.com>
 <122b7b82-af4e-66f7-d210-2b9e0842fbc7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vqnc=l2=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1fzysk-0000kj-1U
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 06:44:10 +0000
Received: by mail-oi0-x241.google.com with SMTP id k12-v6so1571143oiw.8
 for <xen-devel@lists.xenproject.org>; Tue, 11 Sep 2018 23:44:08 -0700 (PDT)
In-Reply-To: <122b7b82-af4e-66f7-d210-2b9e0842fbc7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George Dunlap <George.Dunlap@eu.citrix.com>, ian.jackson@eu.citrix.com, tim@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgo+IEkgYW0gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2h5IExpbnV4IGlzIGRvaW5nIGl0
LiBEbyB5b3UgZXhwZWN0IGFsbAo+IFUtQm9vdCB2ZXJzaW9uIHRvIGRvIGl0PwoKSXQncyBiZWNh
dXNlIExpbnV4IGRvZXNuJ3QgcmVhbGx5IHRydXN0IHUtYm9vdCBhbmQgaW5pdGlhbGl6ZXMgZXZl
cnkKdGhpbmcgYWdhaW4gPwpNYWlubGluZSBVLWJvb3QgZG9lcyBpdCBidXQgdGhhdCBtYXkgYWxz
byBub3QgcmVxdWlyZWQgc2luY2UgQVRGIGRvZXMgaXQgZm9yIHVzLgoKVGhhbmtzCi1BbWl0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
