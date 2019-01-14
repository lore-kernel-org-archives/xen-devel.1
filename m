From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Mon, 14 Jan 2019 17:44:57 +0000
Message-ID: <20190114174457.mlrzxcjtyklim5gc@zion.uk.xensource.com>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20190113201744.GA11328@aepfle.de>
 <20190114112857.dxmlt7noy53asro5@zion.uk.xensource.com>
 <20190114124852.3d91d25f.olaf@aepfle.de>
 <20190114171156.GB1271@perard.uk.xensource.com>
 <20190114182744.42296177.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zeoe=PW=citrix.com=prvs=910b68455=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gj6Tx-0007Yl-Li
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 17:57:05 +0000
Content-Disposition: inline
In-Reply-To: <20190114182744.42296177.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMDY6Mjc6NDRQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gTW9uLCAxNCBKYW4gMjAxOSAxNzoxMTo1NiArMDAwMAo+IHNjaHJpZWIgQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ogo+IAo+ID4gSSB0aGluayBpdCdz
IGZpbmUgdG8ga2VlcCB0aGUgY3VycmVudCBgc3VibW9kdWxlIHVwZGF0ZWAgY2FsbCB3aGVyZSBp
dAo+ID4gaXMuIFdlIGNvdWxkIGp1c3QgbWFrZSBpdCBjaGVjayB0aGF0IGl0J3MgYW4gYWN0dWFs
IGdpdCB3b3JrdHJlZSBieQo+ID4gY2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiAiLmdpdCIg
KGZpbGUgb3IgZGlyZWN0b3J5KSBiZWZvcmUgZXhlY3V0aW5nCj4gPiBnaXQuCj4gPiAKPiA+IFdv
dWxkIHRoYXQgYmUgZ29vZCBlbm91Z2g/Cj4gCj4gTWF5YmUuIFdoYXRldmVyIHdvcmtzIHdpdGgg
ZW52IFdHRVQvR0lUPS9iaW4vZmFsc2UgLi9jb25maWd1cmUgJG9wdGlvbnMuCj4gCgpDYW4geW91
IHRyeSB0aGlzPwoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUgYi90
b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCmluZGV4IDNkZTJmYzAzMDAuLjY0OTQ4MmJjYTgg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKKysrIGIvdG9vbHMvZmly
bXdhcmUvb3ZtZi1tYWtlZmlsZQpAQCAtMTYsNyArMTYsNyBAQCBhbGw6IGJ1aWxkCgogLlBIT05Z
OiBidWlsZAogIGJ1aWxkOgogIC0gICAgICAgJChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0
IC0tcmVjdXJzaXZlCiAgKyAgICAgICBbIC1kIC5naXQgXSAmJiAkKEdJVCkgc3VibW9kdWxlIHVw
ZGF0ZSAtLWluaXQgLS1yZWN1cnNpdmUKICAgICAgICAgIE92bWZQa2cvYnVpbGQuc2ggLWEgWDY0
IC1iICQoVEFSR0VUKSAtbiA0CgkgICAgICAgICAgY3AgQnVpbGQvT3ZtZlg2NC8kKFRBUkdFVClf
R0NDKi9GVi9PVk1GLmZkIG92bWYuYmluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
