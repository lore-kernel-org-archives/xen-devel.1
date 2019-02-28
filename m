From: George Dunlap <dunlapg@umich.edu>
Subject: Re: bogus libxl error handling in
 domcreate_bootloader_done
Date: Thu, 28 Feb 2019 17:40:18 +0000
Message-ID: <CAFLBxZZr2ZA58HBUx0CiRHjJtYtMXRcAZ3avAcTr+92ihD04Sw@mail.gmail.com>
References: <20190228141718.7740e706.olaf@aepfle.de>
 <20190228172159.0f5d0e31.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UzwO=RD=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1gzPfb-0007Xg-1w
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 17:40:31 +0000
Received: by mail-qt1-x832.google.com with SMTP id p25so24497104qtb.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Feb 2019 09:40:29 -0800 (PST)
In-Reply-To: <20190228172159.0f5d0e31.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <Wei.Liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

WW91J2xsIGdldCBhIGJldHRlciByZXNwb25zZSByYXRlIGlmIHlvdSBhY3R1YWxseSBjYycgdGhl
IHRvb2xzIG1haW50YWluZXJzLgogLUcKCk9uIFRodSwgRmViIDI4LCAyMDE5IGF0IDQ6MjIgUE0g
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPiB3cm90ZToKPgo+IEFtIFRodSwgMjggRmViIDIw
MTkgMTQ6MTc6MTggKzAxMDAKPiBzY2hyaWViIE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT46
Cj4KPiA+IEluIGRvbWNyZWF0ZV9ib290bG9hZGVyX2RvbmUsIGxpYnhsX19idWlsZF9wcmUgaXMg
Y2FsbGVkLgo+ID4gSWYgdGhhdCBmdW5jdGlvbiBmYWlscywgdGhlIGxhYmVsICdvdXQ6JyBpcyBj
YWxsZWQsIHdoaWNoIGdvZXMgc3RyYWlnaHQgaW50bwo+ID4gZG9tY3JlYXRlX3N0cmVhbV9kb25l
LiBUaGlzIGZ1bmN0aW9uIHVzZXMgc3JzLT5kY3MgdG8gc2V0IGxpYnhsX19kb21haW5fY3JlYXRl
X3N0YXRlLgo+ID4gSW4gbXkgY2FzZSAtPmRjcyBpcyBOVUxMLiBUaGUgcmVzdWx0IGlzIGEgY3Jh
c2ggaW4gU1RBVEVfQU9fR0MoKS4KPgo+IFRoaXMgd29ya3MgZm9yIG1lIHdpdGggc3RhZ2luZy00
LjExOgo+Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiArKysgYi90b29scy9s
aWJ4bC9saWJ4bF9jcmVhdGUuYwo+IEBAIC0xMDk5LDYgKzEwOTksMTEgQEAgc3RhdGljIHZvaWQg
ZG9tY3JlYXRlX2Jvb3Rsb2FkZXJfZG9uZShsaWJ4bF9fZWdjICplZ2MsCj4gICAgICAgICAgcmV0
dXJuOwo+ICAgICAgfQo+Cj4gKyAgICAvKiBQcmVwYXJlIGVudmlyb25tZW50IGZvciBkb21jcmVh
dGVfc3RyZWFtX2RvbmUgKi8KPiArICAgIGRjcy0+c3JzLmFvID0gYW87Cj4gKyAgICBkY3MtPnNy
cy5kY3MgPSBkY3M7Cj4gKyAgICBkY3MtPnNycy5mZCA9IC0xOwo+ICsKPiAgICAgIC8qIFJlc3Rv
cmUgKi8KPiAgICAgIGNhbGxiYWNrcy0+cmVzdG9yZV9yZXN1bHRzID0gbGlieGxfX3NybV9jYWxs
b3V0X2NhbGxiYWNrX3Jlc3RvcmVfcmVzdWx0czsKPgo+IEBAIC0xMTIyLDggKzExMjcsNiBAQCBz
dGF0aWMgdm9pZCBkb21jcmVhdGVfYm9vdGxvYWRlcl9kb25lKGxpYnhsX19lZ2MgKmVnYywKPiAg
ICAgIGlmIChyYykKPiAgICAgICAgICBnb3RvIG91dDsKPgo+IC0gICAgZGNzLT5zcnMuYW8gPSBh
bzsKPiAtICAgIGRjcy0+c3JzLmRjcyA9IGRjczsKPiAgICAgIGRjcy0+c3JzLmZkID0gcmVzdG9y
ZV9mZDsKPiAgICAgIGRjcy0+c3JzLmxlZ2FjeSA9IChkY3MtPnJlc3RvcmVfcGFyYW1zLnN0cmVh
bV92ZXJzaW9uID09IDEpOwo+ICAgICAgZGNzLT5zcnMuYmFja19jaGFubmVsID0gZmFsc2U7Cj4K
PiBPbGFmCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
