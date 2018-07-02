From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/4] firmware/seabios: fix build on systems
 with non GNU toolchains
Date: Mon, 2 Jul 2018 10:32:15 +0100
Message-ID: <20180702093215.mkhacckcanrct5xg@citrix.com>
References: <20180702082826.90272-1-roger.pau@citrix.com>
 <20180702082826.90272-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b8wo=js=citrix.com=prvs=71436c00c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fZvBy-0004Js-TE
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 09:32:18 +0000
Content-Disposition: inline
In-Reply-To: <20180702082826.90272-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMTA6Mjg6MjNBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgpbLi4uXQo+ICAKPiAgc3VidHJlZS1mb3JjZS11cGRhdGU6Cj4gQEAgLTEyOCwzICsx
MjgsNiBAQCBlbmRpZgo+ICBzdWJ0cmVlLWZvcmNlLXVwZGF0ZS1hbGw6Cj4gIAkkKE1BS0UpIHNl
YWJpb3MtZGlyLWZvcmNlLXVwZGF0ZQo+ICAJJChNQUtFKSBvdm1mLWRpci1mb3JjZS11cGRhdGUK
PiArCj4gK3N1YmRpci1hbGwtc2VhYmlvcy1kaXI6IHNlYWJpb3MtZGlyCj4gKwkkKE1BS0UpIC1D
ICQ8IENDPSQoU0VBQklPU0NDKSBMRD0kKFNFQUJJT1NMRCkgUFlUSE9OPSQoUFlUSE9OKSBhbGw7
CgpUaGVyZSBpcyBhIHBhdHRlcm4gcnVsZSBpbiBSdWxlcy5taywgc28gSSB3b3VsZCB2ZXJ5IG11
Y2ggYXZvaWQgaGF2aW5nCml0IHJlZGVmaW5lZC4KCk9uIHRoZSBvdGhlciBoYW5kLCB5b3UncmUg
bm90IHRoZSBmaXJzdCBvbmUgdG8gYWRkIHN1Y2ggcnVsZXMsIHNvIEkKd29uJ3Qgb2JqZWN0IHRv
IHRoaXMgcGF0Y2ggZWl0aGVyLgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
