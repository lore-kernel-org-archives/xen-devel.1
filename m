From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
Date: Fri, 18 Jan 2019 09:43:02 +0100
Message-ID: <20190118084302.GA4160__14396.1895992563$1547800986$gmane$org@osiris>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EKBf=P2=de.ibm.com=heiko.carstens@srs-us1.protection.inumbo.net>)
 id 1gkPlH-000560-O5
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 08:44:23 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0I8cvEK139922
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jan 2019 03:43:21 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q38s1p357-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jan 2019 03:43:21 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <heiko.carstens@de.ibm.com>;
 Fri, 18 Jan 2019 08:43:18 -0000
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@li
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6NDQ6MTlQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBBZGQgY2hlY2sgZm9yIHRoZSByZXR1cm4gdmFsdWUgb2YgbWVtYmxvY2tfYWxsb2Mq
KCkgZnVuY3Rpb25zIGFuZCBjYWxsCj4gcGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+IFRoZSBw
YW5pYyBtZXNzYWdlIHJlcGVhdHMgdGhlIG9uZSB1c2VkIGJ5IHBhbmljaW5nIG1lbWJsb2NrIGFs
bG9jYXRvcnMgd2l0aAo+IGFkanVzdG1lbnQgb2YgcGFyYW1ldGVycyB0byBpbmNsdWRlIG9ubHkg
cmVsZXZhbnQgb25lcy4KPiAKPiBUaGUgcmVwbGFjZW1lbnQgd2FzIG1vc3RseSBhdXRvbWF0ZWQg
d2l0aCBzZW1hbnRpYyBwYXRjaGVzIGxpa2UgdGhlIG9uZQo+IGJlbG93IHdpdGggbWFudWFsIG1h
c3NhZ2luZyBvZiBmb3JtYXQgc3RyaW5ncy4KPiAKPiBAQAo+IGV4cHJlc3Npb24gcHRyLCBzaXpl
LCBhbGlnbjsKPiBAQAo+IHB0ciA9IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiArIGlm
ICghcHRyKQo+ICsgCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlcyBhbGln
bj0weCVseFxuIiwgX19mdW5jX18sCj4gc2l6ZSwgYWxpZ24pOwo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KLi4uCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvczM5MC9udW1hL3RvcHRyZWUuYyBiL2FyY2gvczM5MC9udW1hL3RvcHRyZWUuYwo+IGluZGV4
IDcxYTYwOGMuLjAxMThjNzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL251bWEvdG9wdHJlZS5j
Cj4gKysrIGIvYXJjaC9zMzkwL251bWEvdG9wdHJlZS5jCj4gQEAgLTMxLDEwICszMSwxNCBAQCBz
dHJ1Y3QgdG9wdHJlZSBfX3JlZiAqdG9wdHJlZV9hbGxvYyhpbnQgbGV2ZWwsIGludCBpZCkKPiAg
ewo+ICAJc3RydWN0IHRvcHRyZWUgKnJlczsKPiAKPiAtCWlmIChzbGFiX2lzX2F2YWlsYWJsZSgp
KQo+ICsJaWYgKHNsYWJfaXNfYXZhaWxhYmxlKCkpIHsKPiAgCQlyZXMgPSBremFsbG9jKHNpemVv
ZigqcmVzKSwgR0ZQX0tFUk5FTCk7Cj4gLQllbHNlCj4gKwl9IGVsc2Ugewo+ICAJCXJlcyA9IG1l
bWJsb2NrX2FsbG9jKHNpemVvZigqcmVzKSwgOCk7Cj4gKwkJaWYgKCFyZXMpCj4gKwkJCXBhbmlj
KCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlcyBhbGlnbj0weCV4XG4iLAo+ICsJCQkg
ICAgICBfX2Z1bmNfXywgc2l6ZW9mKCpyZXMpLCA4KTsKPiArCX0KPiAgCWlmICghcmVzKQo+ICAJ
CXJldHVybiByZXM7CgpQbGVhc2UgcmVtb3ZlIHRoaXMgaHVuaywgc2luY2UgdGhlIGNvZGUgX3No
b3VsZF8gYmUgYWJsZSB0byBoYW5kbGUKYWxsb2NhdGlvbiBmYWlsdXJlcyBhbnl3YXkgKHNlZSBl
bmQgb2YgcXVvdGVkIGNvZGUpLgoKT3RoZXJ3aXNlIGZvciB0aGUgczM5MCBiaXRzOgpBY2tlZC1i
eTogSGVpa28gQ2Fyc3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
