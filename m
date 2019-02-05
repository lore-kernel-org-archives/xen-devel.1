From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Tue, 5 Feb 2019 11:07:31 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902051107120.22962@sstabellini-ThinkPad-X260>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <1548355642.9022.23.camel@amazon.de>
 <CAC1WxdjgOg1Qg4=2Me0nwdEO+CMS4C1WMr7E=pxpi74-ME9uTw@mail.gmail.com>
 <c6cb57ce-3447-67ee-5629-322ee6207362@gmail.com>
 <alpine.DEB.2.10.1902041701470.22962@sstabellini-ThinkPad-X260>
 <7c3f413e-826c-d937-54df-f2272bb09c40@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gr64E-0005YS-3K
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 19:07:34 +0000
In-Reply-To: <7c3f413e-826c-d937-54df-f2272bb09c40@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "Nuernberger,
 Stefan" <snu@amazon.de>, "julien.grall@arm.com" <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA1IEZlYiAyMDE5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIFN0ZWZhbm8s
Cj4gCj4gT24gMDUuMDIuMTkgMDM6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IFBs
ZWFzZSBzZW5kIGFuIHVwZGF0ZSBzb29uIGFzIEkgd291bGQgbGlrZSB0byBnZXQgaXQgaW4gNC4x
Mi4KPiAKPiBJdCBpcyBhbHJlYWR5IHRoZXJlIFsxXSBbMl0uCj4gCj4gWzFdIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wMS9tc2cwMjA0
OC5odG1sCj4gWzJdCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7
YT1jb21taXQ7aD04NjM1NDkxNTgxMjlkMzI2YjJlNTg1MGY3MjJiZmRhNjQzMjY0ZjJiCgpPcHMs
IEkgbWlzc2VkIGl0IDotKSAgRXZlbiBiZXR0ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
