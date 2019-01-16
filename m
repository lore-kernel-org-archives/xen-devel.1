From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
Date: Wed, 16 Jan 2019 17:13:49 +0200
Message-ID: <20190116151348.GD6643__12188.1391075023$1547651638$gmane$org@rapoport-lnx>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
 <CAMuHMdWKPj-2Let44rmaVwh-b6kkGg+0cFPQ-+3k9LP86pB7NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kth2=PY=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gjmuP-0000SR-5r
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 15:15:13 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0GFAck1067498
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 10:14:11 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q240wgpw5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 10:14:11 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Wed, 16 Jan 2019 15:14:07 -0000
Content-Disposition: inline
In-Reply-To: <CAMuHMdWKPj-2Let44rmaVwh-b6kkGg+0cFPQ-+3k9LP86pB7NA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6Mjc6MzVQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIE1pa2UsCj4gCj4gT24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMjo0NiBQ
TSBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4gQWRkIGNoZWNr
IGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIG1lbWJsb2NrX2FsbG9jKigpIGZ1bmN0aW9ucyBhbmQg
Y2FsbAo+ID4gcGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+ID4gVGhlIHBhbmljIG1lc3NhZ2Ug
cmVwZWF0cyB0aGUgb25lIHVzZWQgYnkgcGFuaWNpbmcgbWVtYmxvY2sgYWxsb2NhdG9ycyB3aXRo
Cj4gPiBhZGp1c3RtZW50IG9mIHBhcmFtZXRlcnMgdG8gaW5jbHVkZSBvbmx5IHJlbGV2YW50IG9u
ZXMuCj4gPgo+ID4gVGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0bHkgYXV0b21hdGVkIHdpdGggc2Vt
YW50aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiA+IGJlbG93IHdpdGggbWFudWFsIG1hc3NhZ2lu
ZyBvZiBmb3JtYXQgc3RyaW5ncy4KPiA+Cj4gPiBAQAo+ID4gZXhwcmVzc2lvbiBwdHIsIHNpemUs
IGFsaWduOwo+ID4gQEAKPiA+IHB0ciA9IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiA+
ICsgaWYgKCFwdHIpCj4gPiArICAgICAgIHBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVs
dSBieXRlcyBhbGlnbj0weCVseFxuIiwgX19mdW5jX18sCj4gCj4gSW4gZ2VuZXJhbCwgeW91IHdh
bnQgdG8gdXNlICV6dSBmb3Igc2l6ZV90Cj4gCj4gPiBzaXplLCBhbGlnbik7Cj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCEKPiAKPiA+ICA3NCBmaWxlcyBjaGFuZ2VkLCA0MTUgaW5zZXJ0aW9u
cygrKSwgMjkgZGVsZXRpb25zKC0pCj4gCj4gSSdtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHJlYWxs
eSBhbiBpbXByb3ZlbWVudD8KCkZyb20gbWVtYmxvY2sgcGVyc3BlY3RpdmUgaXQncyBkZWZpbml0
ZWx5IGFuIGltcHJvdmVtZW50IDopCgpnaXQgZGlmZiAtLXN0YXQgbW1vdG0vbWFzdGVyIGluY2x1
ZGUvbGludXgvbWVtYmxvY2suaCBtbS9tZW1ibG9jay5jCiBpbmNsdWRlL2xpbnV4L21lbWJsb2Nr
LmggfCAgNTkgKystLS0tLS0tLS0KIG1tL21lbWJsb2NrLmMgICAgICAgICAgICB8IDI0OSArKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCA5MCBpbnNlcnRpb25zKCspLCAyMTggZGVsZXRpb25zKC0pCgo+IEZvciB0aGUgbm9ybWFs
IG1lbW9yeSBhbGxvY2F0b3IsIHRoZSB0cmVuZCBpcyB0byByZW1vdmUgcHJpbnRpbmcgb2YgZXJy
b3JzCj4gZnJvbSBhbGwgY2FsbGVycywgYXMgdGhlIGNvcmUgdGFrZXMgY2FyZSBvZiB0aGF0LgoK
SXQncyBtb3JlIGFib3V0IGFsbG9jYXRpb24gZXJyb3JzIGhhbmRsaW5nIHRoYW4gcHJpbnRpbmcg
b2YgdGhlIGVycm9ycy4KSW5kZWVkLCB0aGVyZSBpcyBub3QgbXVjaCB0aGF0IGNhbiBiZSBkb25l
IGlmIGFuIGVhcmx5IGFsbG9jYXRpb24gZmFpbHMsCmJ1dCBJIGJlbGlldmUgaGF2aW5nIGFuIGV4
cGxpY2l0IHBhdHRlcm4KCglwdHIgPSBhbGxvYygpOwoJaWYgKCFwdHIpCgkJZG9fc29tZXRoaW5n
X2Fib3V0X2l0KCk7CgppcyBjbGVhcmVyIHRoYW4gcmVseWluZyBvbiB0aGUgYWxsb2NhdG9yIHRv
IHBhbmljKCkuCgpCZXNpZGVzLCB0aGUgZGl2ZXJzaXR5IG9mIHBhbmljIGFuZCBub3BhbmljIHZh
cmlhbnRzIGNyZWF0ZXMgYSBjb25mdXNpb24KYW5kIEkndmUgY2F1Z2h0IHNldmVyYWwgcGxhY2Vz
IHRoYXQgY2FsbCBub3BhbmljIHZhcmlhbnQgYW5kIGRvIG5vdCBjaGVjawppdHMgcmV0dXJuIHZh
bHVlLgogCj4gPiAtLS0gYS9hcmNoL2FscGhhL2tlcm5lbC9jb3JlX21hcnZlbC5jCj4gPiArKysg
Yi9hcmNoL2FscGhhL2tlcm5lbC9jb3JlX21hcnZlbC5jCj4gPiBAQCAtODMsNiArODMsOSBAQCBt
a19yZXNvdXJjZV9uYW1lKGludCBwZSwgaW50IHBvcnQsIGNoYXIgKnN0cikKPiA+Cj4gPiAgICAg
ICAgIHNwcmludGYodG1wLCAiUENJICVzIFBFICVkIFBPUlQgJWQiLCBzdHIsIHBlLCBwb3J0KTsK
PiA+ICAgICAgICAgbmFtZSA9IG1lbWJsb2NrX2FsbG9jKHN0cmxlbih0bXApICsgMSwgU01QX0NB
Q0hFX0JZVEVTKTsKPiA+ICsgICAgICAgaWYgKCFuYW1lKQo+ID4gKyAgICAgICAgICAgICAgIHBh
bmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlc1xuIiwgX19mdW5jX18sCj4gCj4g
JXp1LCBhcyBzdHJsZW4oKSByZXR1cm5zIHNpemVfdC4KClRoYW5rcyBmb3Igc3BvdHRpbmcgaXQs
IHdpbGwgZml4LgoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdHJsZW4odG1wKSArIDEpOwo+
ID4gICAgICAgICBzdHJjcHkobmFtZSwgdG1wKTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiBuYW1l
Owo+ID4gQEAgLTExOCw2ICsxMjEsOSBAQCBhbGxvY19pbzcodW5zaWduZWQgaW50IHBlKQo+ID4g
ICAgICAgICB9Cj4gPgo+ID4gICAgICAgICBpbzcgPSBtZW1ibG9ja19hbGxvYyhzaXplb2YoKmlv
NyksIFNNUF9DQUNIRV9CWVRFUyk7Cj4gPiArICAgICAgIGlmICghaW83KQo+ID4gKyAgICAgICAg
ICAgICAgIHBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlc1xuIiwgX19mdW5j
X18sCj4gCj4gJXp1LCBhcyBzaXplb2YoKSByZXR1cm5zIHNpemVfdC4KPiBQcm9iYWJseSB0aGVy
ZSBhcmUgbW9yZS4gWWVzLCBpdCdzIGhhcmQgdG8gZ2V0IHRoZW0gcmlnaHQgaW4gYWxsIGNhbGxl
cnMuCgpZZWFoIDopCiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAo+IAo+IC0tIAo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKPiAKPiBJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKPiAKCi0tIApTaW5jZXJlbHkgeW91
cnMsCk1pa2UuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
