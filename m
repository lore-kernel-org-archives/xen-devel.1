From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 29 Nov 2018 10:53:32 -0800
Message-ID: <CAHk-=wjjmtZAAGvB8c6hyKvABPHNTfE+b+eHu7iktdogDfTgMw__4564.13433789766$1543517556$gmane$org@mail.gmail.com>
References: <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128180841.GM30658@n2100.armlinux.org.uk>
 <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com>
 <20181129162323.GA27068@lst.de>
 <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ@mail.gmail.com>
 <20181129183132.GA30281@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=owr6=oi=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gSRRi-0006i6-Jc
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 18:53:54 +0000
Received: by mail-lf1-x12c.google.com with SMTP id p17so2273332lfh.4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 10:53:53 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id d19-v6sm409334ljc.37.2018.11.29.10.53.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Nov 2018 10:53:49 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id u18so2240985lff.10
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 10:53:49 -0800 (PST)
In-Reply-To: <20181129183132.GA30281@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMTA6MzEgQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gPiBPciwgYmV0dGVyIHlldCwgcGxhbiBvbiByZW1vdmluZyB0aGUg
c2luZ2xlLXBhZ2UgZG1hIG1hcHBpZ24gZW50aXJlbHkKPiA+IGF0IGEgbGF0ZXIgZGF0ZSwgYW5k
IG1ha2UgdGhlIGlzc3VlIG1vb3QuCj4KPiBXaGF0IHdvdWxkIGJlIHRoZSByZXBsYWNlbWVudD8g
IEJ1aWxkIGEgUy9HIGxpc3QgZm9yIGV2ZXJ5IHNpbmdsZSBwYWdlCj4gbWFwcGluZz8gIE5vdCBz
dXJlIHRoYXQgd291bGQgY3JlYXRlIGEgbG90IG9mIGhhcHB5IGNhbXBlcnMuLgoKSXQncyB3aGF0
IHdlIGVuZGVkIHVwIGRvaW5nIHdpdGggc29tZSBvdGhlciBjYXNlcywgYW5kIGl0IGRpZG4ndApy
ZWFsbHkgZW5kIHVwIGh1cnRpbmcgYXMgbXVjaCBhcyBJIHRob3VnaHQgaXQgd291bGQuCgpJJ20g
dGhpbmtpbmcgb2YgdGhlIHZmcyBmdW5jdGlvbnMgdGhhdCBlbmQgdXAgdHVybmluZyAiYnVmLCBs
ZW4iIGludG8KCiAgICAgICAgc3RydWN0IGlvdmVjIGlvdiA9IHsgLmlvdl9iYXNlID0gKHZvaWQg
X191c2VyICopYnVmLCAuaW92X2xlbiA9IGxlbiB9OwoKYW5kIHRoZW4gcGFzc2luZyBpdCBhcm91
bmQgYXMgYSBzaW5nbGUtZW50cnkgaW92IGluc3RlYWQgKG5vdCBldmVuCnRoYXQgLSB0aGV5IGVu
ZCB1cCBiZWluZyBhbiBpb3ZfaXRlciwgd2hpY2ggaXMgbm90IGp1c3QgdGhlIGlvdiwgYnV0CnRo
ZSB3aG9sZSAid2hhdCBfa2luZF8gb2YgaW92IiBpbmRpcmVjdGlvbikKCk1heWJlIGEgdmVyeSBz
aW1pbGFyIG1vZGVsIGNvdWxkIGJlIHVzZWQgZm9yIGp1c3Qgc2ltcGxpZnlpbmcgdGhlIGNvcmUK
ZG1hIG1hcHBpbmcgc2V0dXA6IHN1cmUsIHBlb3BsZSB3aWxsIHdhbnQgdG8gZG8gc2luZ2xlLWFy
ZWEgZG1hLCBidXQKaG93IGJhZCB3b3VsZCBpdCBiZSB0byBqdXN0IHR1cm4gdGhlbSBpbnRvIHNp
bmdsZS1lbnRyeSBTRyBsaXN0cyBvbgpzdGFjaywgYW5kIHRoZW4gdGhlIGRtYS1tYXBpbmcgaW50
ZXJuYWxseSB3b3VsZCBqdXN0IGFsd2F5cyBzZWUgdGhhdD8KCk1vc3Qgb2YgdGhlIGhpZ2gtcGVy
Zm9ybWFuY2UgSU8gaXMgYWxyZWFkeSB1c2luZyBTRyBsaXN0cyBhbnl3YXksIG5vPwpEaXNrL25l
dHdvcmtpbmcvd2hhdGV2ZXIuCgpCdXQganVzdCBhbiBpZGVhLiBBbmQgdGhlICJtYXBfc2coKSIg
ZXJyb3IgaGFuZGxpbmcgaXNuJ3QgYWN0dWFsbHkgYW55CmJldHRlciwgSSB0aGluay4gSXQgcmV0
dXJucyB6ZXJvIG9uIGVycm9yLCBubz8gU28gaXQncyBub3QgaW1wcm92aW5nCnRoZSBlcnJvciBo
YW5kbGluZy4KClRoZSB3aG9sZSBkbWEtbWFwcGluZyBsYXllciBzZWVtcyBmdWxsIG9mIHRob3Nl
IGtpbmRzIG9mICJpbnNwaXJlZAplcnJvciBoYW5kbGluZyBjaG9pY2VzIiA7KQoKICAgICAgICAg
ICAgICAgICAgTGludXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
