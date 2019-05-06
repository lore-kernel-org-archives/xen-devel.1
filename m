From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
Date: Mon, 6 May 2019 16:28:42 +0100
Message-ID: <21412b8d-0288-e7cf-6d57-d4c6853827e1@citrix.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Pjh=TG=citrix.com=prvs=022dda640=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hNfXt-0007eT-ME
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:28:49 +0000
In-Reply-To: <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxNTo1MCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92aWRlby92ZXNhLmMgYi94ZW4vZHJpdmVycy92aWRl
by92ZXNhLmMKPiBpbmRleCBjOTI0OTdlLi5mMjJjZjdmIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2
ZXJzL3ZpZGVvL3Zlc2EuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3ZpZGVvL3Zlc2EuYwo+IEBAIC04
NCw2ICs4NCw3IEBAIHZvaWQgX19pbml0IHZlc2FfZWFybHlfaW5pdCh2b2lkKQo+ICB2b2lkIF9f
aW5pdCB2ZXNhX2luaXQodm9pZCkKPiAgewo+ICAgICAgc3RydWN0IGxmYl9wcm9wIGxmYnA7Cj4g
KyAgICB1bnNpZ25lZCBsb25nIGxmYl9iYXNlOwoKVGhpcyBpcyBjb21tb24gY29kZSwgd2hpY2gg
aXMgKGluIHByaW5jaXBsZSwgYWx0aG91Z2ggbm90IGN1cnJlbnRseSkKc2hhcmVkIHdpdGggYXJt
MzIsIHdoZXJlIHVuc2lnbmVkIGxvbmcgaXNuJ3Qgd2lkZSBlbm91Z2guCgpVc2UgcGFkZHJfdCBh
bmQgUFJJcGFkZHIsIHdoaWNoIHNob3VsZCBiZSB3aWRlIGVub3VnaCBpbiBhbnkgYnVpbGQuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
