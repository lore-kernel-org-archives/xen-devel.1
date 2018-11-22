From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 22 Nov 2018 09:09:47 -0800
Message-ID: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A__6899.36700878224$1542907022$gmane$org@mail.gmail.com>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g4n+=ob=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gPscN-0001cK-HN
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 17:18:19 +0000
Received: by mail-lj1-x243.google.com with SMTP id z80-v6so8560599ljb.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 09:18:17 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id l63sm7419606lfl.76.2018.11.22.09.18.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Nov 2018 09:18:15 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id n18so7005032lfh.6
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 09:18:15 -0800 (PST)
In-Reply-To: <20181122170715.GI30658@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux@armlinux.org.uk
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgOTowNyBBTSBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgK
PGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBJJ20gYWZyYWlkIHRoYXQgd29uJ3Qg
d29yayB2ZXJ5IHdlbGwgLSAzMiBiaXQgcGxhdGZvcm1zIHdpdGggNjQtYml0Cj4gYWRkcmVzc2Vz
IChMUEFFKSB3b3VsZCBoYXZlIGRtYV9hZGRyX3QgYXMgYSA2NC1iaXQgdmFsdWUsIHdoaWNoCj4g
d291bGRuJ3QgZml0IGludG8gYW4gdW5zaWduZWQgbG9uZy4KCkdvb2QgcG9pbnQuIFNvIHdlJ2Qg
aGF2ZSB0byBoYXZlIGEgc3BlY2lhbCBJU19ETUFfRVJSKCkgZnVuY3Rpb24gdGhhdAp0YWtlcyBh
IGRtYV9hZGRyX3QgYW5kIGNoZWNrcyB0aGUgc2FtZSAiaXMgaXQgdGhlIHRvcCA0MDk1IHZhbHVl
cyIuCgpCZWNhdXNlIEknZCBzdGlsbCBwcmVmZXIgdG8gYWxsb3cgcGVvcGxlIHRvIHJldHVybiB0
aGUgX2FjdHVhbF8gZXJyb3IsCmFuZCB0byBoYXZlICJyZXR1cm4gLUV4eXoiIGFzIHRoZSBlcnJv
ciBjYXNlLiBUaGF0IHBhcnQgc3RpbGwgRFRSVApldmVuIHdpdGggZG1hX2FkZHJfdC4KCiAgICAg
ICAgICAgICAgTGludXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
