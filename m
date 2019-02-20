From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 1/3] xen/arm: drivers: scif: Add support
 for SCIFA compatible UARTs
Date: Wed, 20 Feb 2019 19:11:07 +0200
Message-ID: <777e327c-d56c-1600-7049-c68fadac24f5@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-2-git-send-email-olekstysh@gmail.com>
 <d4ba8e5f-00c9-0773-15b3-4a5b4efcc3e6@arm.com>
 <bab8f746-b69e-35ae-a5ab-00dfd53bb737@gmail.com>
 <16bbe61b-753f-593d-a5d8-1b6662be9a8a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYg4=Q3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gwVOq-00062h-NE
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 17:11:12 +0000
Received: by mail-lj1-x244.google.com with SMTP id g80so21456978ljg.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Feb 2019 09:11:11 -0800 (PST)
In-Reply-To: <16bbe61b-753f-593d-a5d8-1b6662be9a8a@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDE5LjAyLjE5IDEyOjAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAo+
Cj4gT24gMi8xOC8xOSA4OjE0IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4+Cj4+IE9uIDE4LjAyLjE5
IDE2OjAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4KPj4gSGkKCkhpIEp1bGllbgoK
Cj4+Cj4+Cj4+Pgo+Pj4gT24gMDEvMDIvMjAxOSAxMjozNywgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+Pj4+Cj4+Pj4gRXh0ZW5kIGV4aXN0aW5nIGRyaXZlciB0byBiZSBhYmxl
IHRvIGhhbmRsZSBTQ0lGQSBpbnRlcmZhY2UgYXMgd2VsbC4KPj4+Cj4+PiBJbiBnZW5lcmFsIGEg
cGF0Y2ggc2hvdWxkIGRvIG9ubHkgb25lIHRoaW5nLiBJbiB0aGlzIGNhc2UsIHRoaXMgCj4+PiBz
aG91bGQgaGF2ZSBiZWVuIHNwbGl0IGluIDIgcGF0Y2hlczogb25lIHRvIGV4dGVuZCB0aGUgZHJp
dmVyLCB0aGUgCj4+PiBzZWNvbmQgdG8gYWRkIHN1cHBvcnQgZm9yIFNDSUZBLgo+Pj4KPj4+IFBs
ZWFzZSBzcGxpdCB0aGUgcGF0Y2ggYWNjb3JkaW5nbHkuCj4+Cj4+Cj4+IE5vdCBlbnRpcmVseSBj
bGVhciB0byBtZSBob3cgdGhlIGN1cnJlbnQgcGF0Y2ggc2hvdWxkIGJlIHNwbGl0Li4uCj4+Cj4+
IC0gVGhlIGZpcnN0IHBhdGNoIHdpbGwgYmUganVzdCBhIGNvcHkgb2YgdGhlIGN1cnJlbnQgcGF0
Y2gsIGJ1dCAKPj4gd2l0aG91dCBuZXcgY29tcGF0aWJsZSBzdHJpbmcgKFNDSUZBKS4KPgo+IFdp
dGhvdXQgYW55dGhpbmcgcmVsYXRlZCB0byBTQ0lGQS4gVGhpcyBwYXRjaCB3b3VsZCBvbmx5IGNv
bnRhaW4gdGhlIAo+IHJld29yayBvZiB0aGUgY29kZS4KPgo+Pgo+PiAtIFRoZSBzZWNvbmQgcGF0
Y2ggd2lsbCBhZGQgbmV3IGNvbXBhdGlibGUgc3RyaW5nLgo+Cj4gKyBhbnl0aGluZyByZWxhdGVk
IHRvIFNDSUZBIChNYWNyb3MgYW5kIHRoZSBTQ0lGQSBlbGVtZW50IGluIHRoZSBhcnJheSAKPiBw
b3J0X3BhcmFtcy4KCgpJdCBpcyBjbGVhciBub3cuIFdpbGwgZG8uCgoKPgo+IENoZWVycywKPgot
LSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
