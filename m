From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [Minios-devel] [PATCH RFC 09/16] Save/Restore
 Support: Disable/enable IRQs during suspend/restore
Date: Wed, 20 Dec 2017 01:25:10 +0100
Message-ID: <20171220002510.x2t5aqxwymsnlk4i@var.youpi.perso.aquilenet.fr>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
 <1513726931-7516-10-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=drp2=dq=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1eRSCE-00020K-9b
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 00:25:18 +0000
Content-Disposition: inline
In-Reply-To: <1513726931-7516-10-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jgross@suse.com
List-Id: xen-devel@lists.xenproject.org

QnJ1bm8gQWx2aXNpbywgb24gbWFyLiAxOSBkw6ljLiAyMDE3IDE1OjQyOjA0IC0wODAwLCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBCcnVubyBBbHZpc2lvIDxicnVuby5hbHZpc2lvQGdtYWlsLmNv
bT4KClJldmlld2VkLWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlv
bi5vcmc+Cgo+IC0tLQo+ICBrZXJuZWwuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwuYyBi
L2tlcm5lbC5jCj4gaW5kZXggMWNkNDBlOC4uNzgyZWI3OSAxMDA2NDQKPiAtLS0gYS9rZXJuZWwu
Ywo+ICsrKyBiL2tlcm5lbC5jCj4gQEAgLTExOSwxMiArMTE5LDEyIEBAIHZvaWQgc3RhcnRfa2Vy
bmVsKHZvaWQqIHBhcikKPiAgCj4gIHZvaWQgcHJlX3N1c3BlbmQodm9pZCkKPiAgewo+IC0KPiAr
ICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gIH0KPiAgCj4gIHZvaWQgcG9zdF9zdXNwZW5kKGlu
dCBjYW5jZWxlZCkKPiAgewo+IC0KPiArICAgIGxvY2FsX2lycV9lbmFibGUoKTsKPiAgfQo+ICAK
PiAgdm9pZCBzdG9wX2tlcm5lbCh2b2lkKQo+IC0tIAo+IDIuMy4yIChBcHBsZSBHaXQtNTUpCj4g
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBN
aW5pb3MtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTWluaW9zLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL21pbmlv
cy1kZXZlbAoKLS0gClNhbXVlbApROglIb3cgZG8geW91IHBsYXkgcmVsaWdpb3VzIHJvdWxldHRl
PwpBOglZb3Ugc3RhbmQgYXJvdW5kIGluIGEgY2lyY2xlIGFuZCBibGFzcGhlbWUgYW5kIHNlZSB3
aG8gZ2V0cyBzdHJ1Y2sgYnkgbGlnaHRuaW5nIGZpcnN0LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
