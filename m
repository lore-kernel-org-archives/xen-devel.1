From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxc: fix HVM core dump
Date: Wed, 20 Mar 2019 13:49:30 +0000
Message-ID: <23698.17642.853194.637427@mariner.uk.xensource.com>
References: <20190319160231.17120-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wjkm=RX=citrix.com=prvs=975c0df78=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h6bbc-0001Mw-ML
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 13:50:08 +0000
In-Reply-To: <20190319160231.17120-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhjOiBmaXggSFZNIGNvcmUgZHVtcCIpOgo+IGY5
NjliYzlmYzk2IGZvcmJpZCBnZXRfYWRkcmVzc19zaXplIGNhbGwgb24gSFZNIGd1ZXN0cywgYmVj
YXVzZSB0aGF0Cj4gZGlkbid0IG1ha2Ugc2Vuc2UuIEl0IGJyb2tlIGNvcmUgZHVtcCBmdW5jdGlv
bmFsaXR5IG9uIEhWTSBiZWNhdXNlCj4gbGlieGMgdW5jb25kaXRpb25hbGx5IGFza2VkIGZvciBn
dWVzdCB3aWR0aC4KLi4uCj4gKyAgICBpZiAoICFhdXRvX3RyYW5zbGF0ZWRfcGh5c21hcCAmJgo+
ICsgICAgICAgICB4Y19kb21haW5fZ2V0X2d1ZXN0X3dpZHRoKHhjaCwgZG9taWQsICZkaW5mby0+
Z3Vlc3Rfd2lkdGgpICE9IDAgKQo+ICsgICAgewo+ICsgICAgICAgIFBFUlJPUigiQ291bGQgbm90
IGdldCBhZGRyZXNzIHNpemUgZm9yIGRvbWFpbiIpOwo+ICsgICAgICAgIGdvdG8gb3V0Owo+ICsg
ICAgfQoKRGlkIHlvdSBjb25zaWRlciBhbmQgcmVqZWN0IHRoZSBvcHRpb24gb2Ygd3JpdGluZzoK
CiAgICBpZiAoIGF1dG9fdHJhbnNsYXRlZF9waHlzbWFwICkgewogICAgICAgICAuLi4geGNfZG9t
YWluX2dldF9ndWVzdF93aWR0aCgsLCZkaW5mby0+Z3Vlc3Rfd2lkdGgsLCkgLi4uCiAgICB9IGVs
c2UgewogICAgICAgICBkaW5mby0+Z3Vlc3Rfd2lkdGggPSBzaXplb2YodW5zaWduZWQgbG9uZykK
ICAgIH0KClRoaXMgaXMgcGVyaGFwcyBsZXNzIGxpa2VseSB0byBsZWF2ZSBkaW5mby0+Z3Vlc3Rf
d2lkdGggYXMgYW4KdW5pbml0aWFsaXNlZCBoYXphcmQuCgpJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
