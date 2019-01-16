From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 19/21] treewide: add checks for the return
 value of memblock_alloc*()
Date: Wed, 16 Jan 2019 15:27:35 +0100
Message-ID: <CAMuHMdWKPj-2Let44rmaVwh-b6kkGg+0cFPQ-+3k9LP86pB7NA__27956.6223537133$1547648863$gmane$org@mail.gmail.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebNQ=PY=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
 id 1gjmBX-0003x5-4J
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 14:28:51 +0000
Received: by mail-vk1-f195.google.com with SMTP id b18so1462214vke.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 06:28:49 -0800 (PST)
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>
List-Id: xen-devel@lists.xenproject.org

SGkgTWlrZSwKCk9uIFdlZCwgSmFuIDE2LCAyMDE5IGF0IDI6NDYgUE0gTWlrZSBSYXBvcG9ydCA8
cnBwdEBsaW51eC5pYm0uY29tPiB3cm90ZToKPiBBZGQgY2hlY2sgZm9yIHRoZSByZXR1cm4gdmFs
dWUgb2YgbWVtYmxvY2tfYWxsb2MqKCkgZnVuY3Rpb25zIGFuZCBjYWxsCj4gcGFuaWMoKSBpbiBj
YXNlIG9mIGVycm9yLgo+IFRoZSBwYW5pYyBtZXNzYWdlIHJlcGVhdHMgdGhlIG9uZSB1c2VkIGJ5
IHBhbmljaW5nIG1lbWJsb2NrIGFsbG9jYXRvcnMgd2l0aAo+IGFkanVzdG1lbnQgb2YgcGFyYW1l
dGVycyB0byBpbmNsdWRlIG9ubHkgcmVsZXZhbnQgb25lcy4KPgo+IFRoZSByZXBsYWNlbWVudCB3
YXMgbW9zdGx5IGF1dG9tYXRlZCB3aXRoIHNlbWFudGljIHBhdGNoZXMgbGlrZSB0aGUgb25lCj4g
YmVsb3cgd2l0aCBtYW51YWwgbWFzc2FnaW5nIG9mIGZvcm1hdCBzdHJpbmdzLgo+Cj4gQEAKPiBl
eHByZXNzaW9uIHB0ciwgc2l6ZSwgYWxpZ247Cj4gQEAKPiBwdHIgPSBtZW1ibG9ja19hbGxvYyhz
aXplLCBhbGlnbik7Cj4gKyBpZiAoIXB0cikKPiArICAgICAgIHBhbmljKCIlczogRmFpbGVkIHRv
IGFsbG9jYXRlICVsdSBieXRlcyBhbGlnbj0weCVseFxuIiwgX19mdW5jX18sCgpJbiBnZW5lcmFs
LCB5b3Ugd2FudCB0byB1c2UgJXp1IGZvciBzaXplX3QKCj4gc2l6ZSwgYWxpZ24pOwo+Cj4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQoKPiAgNzQgZmlsZXMgY2hhbmdlZCwgNDE1IGluc2VydGlvbnMoKyksIDI5
IGRlbGV0aW9ucygtKQoKSSdtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHJlYWxseSBhbiBpbXByb3Zl
bWVudD8KRm9yIHRoZSBub3JtYWwgbWVtb3J5IGFsbG9jYXRvciwgdGhlIHRyZW5kIGlzIHRvIHJl
bW92ZSBwcmludGluZyBvZiBlcnJvcnMKZnJvbSBhbGwgY2FsbGVycywgYXMgdGhlIGNvcmUgdGFr
ZXMgY2FyZSBvZiB0aGF0LgoKPiAtLS0gYS9hcmNoL2FscGhhL2tlcm5lbC9jb3JlX21hcnZlbC5j
Cj4gKysrIGIvYXJjaC9hbHBoYS9rZXJuZWwvY29yZV9tYXJ2ZWwuYwo+IEBAIC04Myw2ICs4Myw5
IEBAIG1rX3Jlc291cmNlX25hbWUoaW50IHBlLCBpbnQgcG9ydCwgY2hhciAqc3RyKQo+Cj4gICAg
ICAgICBzcHJpbnRmKHRtcCwgIlBDSSAlcyBQRSAlZCBQT1JUICVkIiwgc3RyLCBwZSwgcG9ydCk7
Cj4gICAgICAgICBuYW1lID0gbWVtYmxvY2tfYWxsb2Moc3RybGVuKHRtcCkgKyAxLCBTTVBfQ0FD
SEVfQllURVMpOwo+ICsgICAgICAgaWYgKCFuYW1lKQo+ICsgICAgICAgICAgICAgICBwYW5pYygi
JXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUgYnl0ZXNcbiIsIF9fZnVuY19fLAoKJXp1LCBhcyBz
dHJsZW4oKSByZXR1cm5zIHNpemVfdC4KCj4gKyAgICAgICAgICAgICAgICAgICAgIHN0cmxlbih0
bXApICsgMSk7Cj4gICAgICAgICBzdHJjcHkobmFtZSwgdG1wKTsKPgo+ICAgICAgICAgcmV0dXJu
IG5hbWU7Cj4gQEAgLTExOCw2ICsxMjEsOSBAQCBhbGxvY19pbzcodW5zaWduZWQgaW50IHBlKQo+
ICAgICAgICAgfQo+Cj4gICAgICAgICBpbzcgPSBtZW1ibG9ja19hbGxvYyhzaXplb2YoKmlvNyks
IFNNUF9DQUNIRV9CWVRFUyk7Cj4gKyAgICAgICBpZiAoIWlvNykKPiArICAgICAgICAgICAgICAg
cGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5dGVzXG4iLCBfX2Z1bmNfXywKCiV6
dSwgYXMgc2l6ZW9mKCkgcmV0dXJucyBzaXplX3QuClByb2JhYmx5IHRoZXJlIGFyZSBtb3JlLiBZ
ZXMsIGl0J3MgaGFyZCB0byBnZXQgdGhlbSByaWdodCBpbiBhbGwgY2FsbGVycy4KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
