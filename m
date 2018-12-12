From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 13/16] gic-vgic: skip irqs locking
Date: Wed, 12 Dec 2018 14:47:23 +0200
Message-ID: <f35d3dee-719c-73c2-9802-c2ba4fc3bd12@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-14-git-send-email-andrii.anisov@gmail.com>
 <445b8bb4-78fb-124a-647b-8e8d253b7ba1@arm.com>
 <1a3c781d-e514-2463-5319-6b3293bf2e92@gmail.com>
 <cb757f8c-efa4-1a99-7da8-83c89f6a5da1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX3vE-0003am-MZ
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:47:28 +0000
Received: by mail-lf1-x144.google.com with SMTP id i26so13446490lfc.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 04:47:27 -0800 (PST)
In-Reply-To: <cb757f8c-efa4-1a99-7da8-83c89f6a5da1@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi4xMi4xOCAxNDo0NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IEkgYW0gaGFwcHkgd2l0aCB0aGUgc2Vjb25kIGNodW5rIG9mIHRoaXMgcGF0Y2ggdG8gZ28uIEkg
YW0gc3RpbGwgdW5jb252aW5jZWQgIzEgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGdvLgpJIGdvdCBp
dC4gU28ga2VlcCB0aGUgcGF0Y2ggc3RpbGwgZm9yIG5vdy4KCj4+IEkgcGxhbiB0byBzZW5kIHNl
cGFyYXRlbHkgcGF0Y2hlcyB5b3UgaGF2ZSByZXZpZXdlZCBmaXJzdC4gVGhlbiBldmFsdWF0ZSB0
aGUgcmVzdCB3aXRoIFRCTS4gRG9lcyBpdCBmaXQgeW91ciB2aXNpb24/Cj4gQ2FuIHlvdSBzZW5k
IHNlcGFyYXRlbHkgcGF0Y2hlcyBJIHNhaWQgSSBhbSBoYXBweSB3aXRoIGZvciBYZW4gNC4xMj8g
V2UgY2FuIHRoZW4gY29udGludWUgdG8gZGlzY3VzcyB0aGUgb3RoZXJzIHdpdGggbnVtYmVycyBh
bmQgc2VlIGlmIHdlIGNhbiBtZXJnZSB0aGVtIGluIHRpbWUuClllcC4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
