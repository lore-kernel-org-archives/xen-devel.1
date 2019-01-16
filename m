From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 01/21] openrisc: prefer memblock APIs returning
 virtual address
Date: Wed, 16 Jan 2019 15:44:01 +0200
Message-ID: <1547646261-32535-2-git-send-email-rppt__33392.4173996367$1547646218$gmane$org@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjlUy-0006Im-Nd
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:44:52 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GDehOw127556
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:44:51 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q23ejpst3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 08:44:50 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 13:44:46 -0000
In-Reply-To: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xten
List-Id: xen-devel@lists.xenproject.org

VGhlIGFsbG9jYXRpb24gb2YgdGhlIHBhZ2UgdGFibGVzIG1lbW9yeSBpbiBvcGVucmljcyB1c2Vz
Cm1lbWJsb2NrX3BoeXNfYWxsb2MoKSBhbmQgdGhlbiBjb252ZXJ0cyB0aGUgcmV0dXJuZWQgcGh5
c2ljYWwgYWRkcmVzcyB0bwp2aXJ0dWFsIG9uZS4gVXNlIG1lbWJsb2NrX2FsbG9jX3JhdygpIGFu
ZCBhZGQgYSBwYW5pYygpIGlmIHRoZSBhbGxvY2F0aW9uCmZhaWxzLgoKU2lnbmVkLW9mZi1ieTog
TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvbW0v
aW5pdC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jIGIvYXJjaC9vcGVu
cmlzYy9tbS9pbml0LmMKaW5kZXggZDE1NzMxMC4uY2FlYjQxOCAxMDA2NDQKLS0tIGEvYXJjaC9v
cGVucmlzYy9tbS9pbml0LmMKKysrIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKQEAgLTEwNSw3
ICsxMDUsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IG1hcF9yYW0odm9pZCkKIAkJCX0KIAogCQkJ
LyogQWxsb2Mgb25lIHBhZ2UgZm9yIGhvbGRpbmcgUFRFJ3MuLi4gKi8KLQkJCXB0ZSA9IChwdGVf
dCAqKSBfX3ZhKG1lbWJsb2NrX3BoeXNfYWxsb2MoUEFHRV9TSVpFLCBQQUdFX1NJWkUpKTsKKwkJ
CXB0ZSA9IG1lbWJsb2NrX2FsbG9jX3JhdyhQQUdFX1NJWkUsIFBBR0VfU0laRSk7CisJCQlpZiAo
IXB0ZSkKKwkJCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSBwYWdlIGZvciBQVEVzXG4i
LAorCQkJCSAgICAgIF9fZnVuY19fKTsKIAkJCXNldF9wbWQocG1lLCBfX3BtZChfS0VSTlBHX1RB
QkxFICsgX19wYShwdGUpKSk7CiAKIAkJCS8qIEZpbGwgdGhlIG5ld2x5IGFsbG9jYXRlZCBwYWdl
IHdpdGggUFRFJ1MgKi8KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
