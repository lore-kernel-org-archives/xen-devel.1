From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86emul: fix vector-length check for
 AVX512F scalar fused-multiply-add insns
Date: Tue, 18 Dec 2018 13:48:26 +0000
Message-ID: <f803344a-6657-7c53-79e0-45393782dbc8@citrix.com>
References: <5C0F79E50200007800204F55@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=snIL=O3=citrix.com=prvs=883e14dc5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZFjc-0007Ua-2B
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 13:48:32 +0000
In-Reply-To: <5C0F79E50200007800204F55@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTIvMjAxOCAwODo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGNoZWNrIG5lZWRz
IHRvIGhhcHBlbiB3aGVuZXZlciBFVkVYLmIgKFNETSBub21lbmNsYXR1cmUpIGlzIGNsZWFyLAo+
IG5vdCBqdXN0IGluIHRoZSBtZW1vcnkgb3BlcmFuZCBjYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IHYyOiBDbGFyaWZ5IG5hbWlu
ZyAodG8gYWRkcmVzcyBhcHBhcmVudCBkaXNjb25uZWN0IGJldHdlZW4gZGVzY3JpcHRpb24KPiAg
ICAgYW5kIGNvZGUgY2hhbmdlKS4KClRoYW5rcyAtIHRoaXMgaXMgbXVjaCBlYXNpZXIgdG8gZm9s
bG93LgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
