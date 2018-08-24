From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] rombios: work around clang's
 -Waddress-of-packed-member
Date: Fri, 24 Aug 2018 10:30:37 -0500
Message-ID: <20180824153037.pfxqfuxy4afezc6u@doug-macbook.localdomain>
References: <20180824152215.8823-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pgyi=lh=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ftE2s-0007HZ-Ls
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 15:30:42 +0000
Received: by mail-qt0-x242.google.com with SMTP id n6-v6so10564024qtl.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 08:30:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180824152215.8823-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDQ6MjI6MTVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBCdWlsZGluZyByb21iaW9zIHdpdGggY2xhbmcgWFhYIGZhaWxzIHdpdGg6Cj4gCj4gdGNnYmlv
cy5jOjE1MTk6MzQ6IGVycm9yOiB0YWtpbmcgYWRkcmVzcyBvZiBwYWNrZWQgbWVtYmVyICd1JyBv
ZiBjbGFzcyBvciBzdHJ1Y3R1cmUgJ3B1c2hhZF9yZWdzX3QnIG1heSByZXN1bHQgaW4gYW4gdW5h
bGlnbmVkIHBvaW50ZXIgdmFsdWUgWy1XZXJyb3IsLVdhZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXJd
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIMKucy0+dS5y
MzIuZWR4KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fgo+IAo+IFdvcmsgYXJvdW5kIHRoYXQgYnkgdXNpbmcgYW4gaW50ZXJt
ZWRpYXRlIHZhcmlhYmxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpSZXZpZXdlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
