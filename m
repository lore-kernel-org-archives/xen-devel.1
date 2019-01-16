From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 13/21] arch: don't memset(0) memory returned
 by memblock_alloc()
Date: Wed, 16 Jan 2019 15:17:22 +0100
Message-ID: <CAMuHMdXt8fPgAGp3KPGM=qVT_QzU=FJS7f5XUbK2hGXYdE9Yeg__45512.1956569657$1547648192$gmane$org@mail.gmail.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-14-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebNQ=PY=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
 id 1gjm0k-00037C-Bt
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 14:17:42 +0000
Received: by mail-vk1-f196.google.com with SMTP id w72so1446557vkd.5
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 06:17:40 -0800 (PST)
In-Reply-To: <1547646261-32535-14-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Greg Ungerer <gerg@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>arcml <li>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMjo0NSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+IHdyb3RlOgo+IG1lbWJsb2NrX2FsbG9jKCkgYWxyZWFkeSBjbGVhcnMgdGhlIGFs
bG9jYXRlZCBtZW1vcnksIG5vIHBvaW50IGluIGRvaW5nIGl0Cj4gdHdpY2UuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cgo+ICBhcmNoL202OGsv
bW0vbWNmbW11LmMgICAgICAgfCAxIC0KCkZvciBtNjhrIHBhcnQ6CkFja2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKPiAtLS0gYS9hcmNoL202OGsvbW0v
bWNmbW11LmMKPiArKysgYi9hcmNoL202OGsvbW0vbWNmbW11LmMKPiBAQCAtNDQsNyArNDQsNiBA
QCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICAgICAgICAgaW50IGk7Cj4KPiAgICAg
ICAgIGVtcHR5X3plcm9fcGFnZSA9ICh2b2lkICopIG1lbWJsb2NrX2FsbG9jKFBBR0VfU0laRSwg
UEFHRV9TSVpFKTsKPiAtICAgICAgIG1lbXNldCgodm9pZCAqKSBlbXB0eV96ZXJvX3BhZ2UsIDAs
IFBBR0VfU0laRSk7Cj4KPiAgICAgICAgIHBnX2RpciA9IHN3YXBwZXJfcGdfZGlyOwo+ICAgICAg
ICAgbWVtc2V0KHN3YXBwZXJfcGdfZGlyLCAwLCBzaXplb2Yoc3dhcHBlcl9wZ19kaXIpKTsKCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
