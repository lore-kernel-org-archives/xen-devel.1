From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] arch/arm/xen: Remove duplicate header
Date: Mon, 28 Jan 2019 12:04:25 +0530
Message-ID: <CAFqt6zb0cU3TjAs0LO-DL3Ut98-7=b7cP9+hZ+bUxDLD2EN2vA__9618.02703547932$1548657351$gmane$org@mail.gmail.com>
References: <20190107173719.GA30197@jordon-HP-15-Notebook-PC>
 <eab5c59d-cfb4-bd2a-de07-7db827830472@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3hwS=QE=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1go0VE-0005zM-Lb
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 06:34:40 +0000
Received: by mail-lj1-x241.google.com with SMTP id t18-v6so13199524ljd.4
 for <xen-devel@lists.xenproject.org>; Sun, 27 Jan 2019 22:34:38 -0800 (PST)
In-Reply-To: <eab5c59d-cfb4-bd2a-de07-7db827830472@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: sstabellini@kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Brajeswar Ghosh <brajeswar.linux@gmail.com>, xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgNDowOCBQTSBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbwo8
YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDEvNy8xOSA3OjM3IFBNLCBTb3VwdGlj
ayBKb2FyZGVyIHdyb3RlOgo+ID4gUmVtb3ZlIGR1cGxpY2F0ZSBoZWFkZXIgd2hpY2ggaXMgaW5j
bHVkZWQgdHdpY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJk
ci5saW51eEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KCkNhbiB3ZSBnZXQgdGhpcyBwYXRj
aCBpbiBxdWV1ZSBmb3IgNS4xID8KPiA+IC0tLQo+ID4gICBhcmNoL2FybS94ZW4vbW0uYyB8IDEg
LQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gPiBpbmRleCBjYjQ0YWEy
Li5lMWQ0NGI5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKPiA+ICsrKyBiL2Fy
Y2gvYXJtL3hlbi9tbS5jCj4gPiBAQCAtNyw3ICs3LDYgQEAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4
L29mX2FkZHJlc3MuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ICAgI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+Cj4g
PiAgICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9zd2lv
dGxiLmg+Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
