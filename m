From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: export device state to sysfs
Date: Tue, 28 Aug 2018 08:30:38 +0200
Message-ID: <9a908520-0c53-075a-947d-de7741a8e29c__3826.35560022226$1535437774$gmane$org@suse.com>
References: <030d112d-991f-4591-7eeb-94432a277c71@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bffi=ll=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fuXWV-0002fl-IY
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 06:30:43 +0000
In-Reply-To: <030d112d-991f-4591-7eeb-94432a277c71@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDgvMTggMjA6NDQsIEpvZSBKaW4gd3JvdGU6Cj4gRXhwb3J0IGRldmljZSBzdGF0ZSB0
byBzeXNmcyB0byBhbGxvdyBmb3IgZWFzaWVyIGdldCBkZXZpY2Ugc3RhdGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgo+IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKUGxlYXNlIGFkZCB0aGUgcmVsYXRlZCBkb2N1bWVudGF0aW9uIHRvCgpEb2N1bWVudGF0
aW9uL0FCSS9zdGFibGUvc3lzZnMtYnVzLXhlbi1iYWNrZW5kCgoKSnVlcmdlbgoKPiAtLS0KPiAg
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIHwgOSArKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMK
PiBpbmRleCA3NDg4OGNhY2QwYjAuLjUyZjk5YjgwYTFjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlLmMKPiBAQCAtNDAyLDEwICs0MDIsMTkgQEAgc3RhdGljIHNzaXplX3QgbW9kYWxp
YXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIH0KPiAgc3RhdGljIERFVklDRV9BVFRSX1JP
KG1vZGFsaWFzKTsKPiAgCj4gK3N0YXRpYyBzc2l6ZV90IHN0YXRlX3Nob3coc3RydWN0IGRldmlj
ZSAqZGV2LAo+ICsJCQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1
ZikKPiArewo+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJXNcbiIsCj4gKwkJCXhlbmJ1c19zdHJz
dGF0ZSh0b194ZW5idXNfZGV2aWNlKGRldiktPnN0YXRlKSk7Cj4gK30KPiArc3RhdGljIERFVklD
RV9BVFRSX1JPKHN0YXRlKTsKPiArCj4gIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICp4ZW5idXNf
ZGV2X2F0dHJzW10gPSB7Cj4gIAkmZGV2X2F0dHJfbm9kZW5hbWUuYXR0ciwKPiAgCSZkZXZfYXR0
cl9kZXZ0eXBlLmF0dHIsCj4gIAkmZGV2X2F0dHJfbW9kYWxpYXMuYXR0ciwKPiArCSZkZXZfYXR0
cl9zdGF0ZS5hdHRyLAo+ICAJTlVMTCwKPiAgfTsKPiAgCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
