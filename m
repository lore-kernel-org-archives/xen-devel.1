From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 1/9] xen/arm: Use mfn_to_pdx
 instead of pfn_to_pdx when possible
Date: Thu, 25 Apr 2019 05:20:15 -0600
Message-ID: <5CC197EF0200007800229019@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
 <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
 <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
 <c3e5008c-7dd2-61b5-bec1-287b310a471c@arm.com>
 <02478ff8-d1e2-abe1-74a5-ca72ab87f154@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJcQT-0004A8-Ef
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:20:25 +0000
In-Reply-To: <02478ff8-d1e2-abe1-74a5-ca72ab87f154@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA0LjE5IGF0IDE5OjA3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFueXdheSwgaXQgaXMgbm90IHRoZSBmaXJzdCB0aW1lIEkgc2VlIGJ1aWxkIGVycm9yIHdoZW4g
dHJ5aW5nIHRvIG1ha2UgdGhlIGNvZGUgdXNpbmcKPiB0eXBlc2FmZSBnZm4vbWZuLiBUaGUgaGVh
ZGVycyBkZXBlbmRlbmN5IGFyZSBxdWl0ZSBtZXNzeSBpbiBnZW5lcmFsLgoKQmVjYXVzZSBvZiB0
aGlzLCAuLi4KCj4gQW5kcmV3LCBKYW4gZG8geW91IGhhdmUgYSBzdWdnZXN0aW9uIGhvdyB0byBw
cm9jZXNzIG9uIHRoZSB4ODYgc2lkZT8KCi4uLiBJIGRvbid0LCBJJ20gc29ycnksIHdpdGhvdXQg
YmVpbmcgYWJsZSB0byBpbnZlc3Qgc29tZSB0aW1lIHRvCnBsYXkgd2l0aCB0aGlzIG15c2VsZi4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
