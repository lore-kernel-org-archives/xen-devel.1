From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Fri, 11 Jan 2019 09:01:32 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901110858420.27759@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
 <5C37013C020000780020C17D@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
 <c35526c8589d49ba9f4200220e44581c@dornerworks.com>
 <5C387177020000780020C980@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhUh=PT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gi0Bb-00024s-FL
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 17:01:35 +0000
In-Reply-To: <5C387177020000780020C980@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMSBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBJZiBhbGwgd2UgcmVh
bGx5IGNhcmUgYWJvdXQgaXMgbWFraW5nIFBSUUEgaGFwcHksIEkgYmVsaWV2ZSBpdCBkb2VzIHN1
cHBvcnQKPiA+IHNvbWUgc29ydCBvZiBjb21tZW50LWJhc2VkIHN1cHByZXNzaW9uLiBJJ3ZlIHNl
ZW4gY29tbWVudHMgbGlrZQo+ID4gLyogUFJRQSBTIDA0ODcgKi8gb3IgLyogUFJRQSBTIDA0ODgg
Ki8gaW4gdmFyaW91cyBjb2RlYmFzZXMsIEknbSBndWVzc2luZwo+ID4gY29tbWVudHMgbGlrZSB0
aGlzIGhhdmUgc29tZXRoaW5nIHRvIGRvIHdpdGggc3VwcHJlc3NpbmcgdGhlc2UgdHlwZXMgb2YK
PiA+IHdhcm5pbmdzLgo+IAo+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEknbSBvcHBvc2VkIHRvIGNv
bW1lbnRzOiBXZSd2ZSBnb3Qgc29tZQo+IHRvIHBsZWFzZSBDb3Zlcml0eS4gV2UndmUgZ290IG90
aGVycyB0byBtYWtlIGNlcnRhaW4gZWRpdG9ycyB0bwo+IHdvcmsgZm9yIGNlcnRhaW4gcGVvcGxl
LiBIb3cgbWFueSBtb3JlIGFyZSB3ZSBnb2luZyB0byBnYWluPwoKWW91IGhhdmUgYSBnb29kIHBv
aW50LiBBbHNvLCBJIGFtIG5vdCBhIGZhbiBvZiB0b29scyBzcGVjaWZpYyB0YWdzCihDb3Zlcml0
eSwgRU1BQ1MsIGV0Yy4pIGluIHRoZSBjb2RlIGJhc2UuIEhvd2V2ZXIsIHdlIGNvdWxkIGNvbnNp
ZGVyCmFkZGluZyBvdXIgb3duIGNvbW1lbnQgbGFiZWxzLCBub3QgdG8gcGxlYXNlIFBSUUEsIGJ1
dCB0byBoaWdobGlnaHQKc2l0ZXMgdGhhdCB3ZSBrbm93IGFyZSB2aW9sYXRpbmcgTUlTUkEtQyBm
b3Igb25lIHJlYXNvbiBvciBhbm90aGVyLgpTb21ldGhpbmcgbGlrZToKCi8qIE0zQ006IFJ1bGUt
MTguMiB2aW9sYXRpb24gKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
