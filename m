From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 29 Nov 2018 09:44:05 -0800
Message-ID: <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ__38190.7926909209$1543513392$gmane$org@mail.gmail.com>
References: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128180841.GM30658@n2100.armlinux.org.uk>
 <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com>
 <20181129162323.GA27068@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=owr6=oi=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gSQMV-0001O1-Qv
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 17:44:28 +0000
Received: by mail-lf1-x141.google.com with SMTP id p86so2100008lfg.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 09:44:26 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id b22sm403199lfg.32.2018.11.29.09.44.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Nov 2018 09:44:23 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id v5so2085508lfe.7
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 09:44:22 -0800 (PST)
In-Reply-To: <20181129162323.GA27068@lst.de>
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

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgODoyMyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBXZSBjYW4uICBBdCBsZWFzdCBpbiB0aGVvcnkuICBUaGUgcHJvYmxl
bSBpcyB0aGF0IGRlcGVuZGluZyBvbiB0aGUKPiBjcmF6eSBtYXBwaW5nIGZyb20gcGh5c2ljYWwg
YW5kIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MgdG8gZG1hIGFkZHJlc3Nlcwo+IHRoZXNlIG1pZ2h0
IGJlIHBhZ2VzIGF0IHByZXR0eSByYW5kb20gcGxhY2VzLiAgTG9vayBhdCBmdW4gbGlrZQo+IGFy
Y2gveDg2L3BjaS9zdGEyeDExLWZpeHVwLmMgZm9yIGhvdyB1Z2x5IHRoZXNlIG1hcHBpbmdzIGNv
dWxkIGxvb2suCj4KPiBJdCBhbHNvIG1lYW5zIHRoYXQgd2UgbWlnaHQgaGF2ZSBzZXR1cCBzd2lv
dGxiIG9uIGp1c3QgYWJvdXQgZXZlcnkKPiAzMi1iaXQgYXJjaGl0ZWN0dXJlLCBldmVuIGlmIGl0
IGhhcyBubyByZWFsIGFkZHJlc3NpbmcgbGltaXQgZXhjZXB0IGZvcgo+IHRoZSBvbmUgd2UgaW1w
b3NlZC4KCk5vLiBSZWFsbHkuIElmIHRoZXJlJ3Mgbm8gaW90bGIsIHRoZW4geW91IGp1c3QgbWFy
ayB0aGF0IG9uZSBwYWdlCnJlc2VydmVkLiBJdCBzaW1wbHkgZG9lc24ndCBnZXQgdXNlZC4gSXQg
ZG9lc24ndCBtZWFuIHlvdSBzdWRkZW5seQpuZWVkIGEgc3dpb3RsYi4KCklmIHRoZXJlICppcyog
YSBpb3RsYiwgbm9uZSBvZiB0aGlzIHNob3VsZCBtYXR0ZXIsIGJlY2F1c2UgeW91J2QganVzdApu
ZXZlciBtYXAgYW55dGhpbmcgaW50byB0aGF0IHBhZ2UuCgpCdXQgd2hhdGV2ZXIuIEl0J3MgaW5k
ZXBlbmRlbnQgZnJvbSB0aGUgcGF0Y2ggc2VyaWVzIHVuZGVyIGRpc2N1c3Npb24uCk1ha2UgZG1h
X21hcHBpbmdfZXJyb3IoKSBhdCBsZWFzdCByZXR1cm4gYSByZWFsIGVycm9yIChlZyAtRUlOVkFM
LCBvcgp3aGF0ZXZlciBpcyB0aGUgY29tbW9uIGVycm9yKSwgYW5kIHdlIGNhbiBtYXliZSBkbyB0
aGlzIGxhdGVyLgoKT3IsIGJldHRlciB5ZXQsIHBsYW4gb24gcmVtb3ZpbmcgdGhlIHNpbmdsZS1w
YWdlIGRtYSBtYXBwaWduIGVudGlyZWx5CmF0IGEgbGF0ZXIgZGF0ZSwgYW5kIG1ha2UgdGhlIGlz
c3VlIG1vb3QuCgogICAgICAgICAgICAgIExpbnVzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
