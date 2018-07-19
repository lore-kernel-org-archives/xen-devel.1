From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/xen-front: Fix error code in
 xen_drm_front_gem_get_sg_table()
Date: Thu, 19 Jul 2018 12:20:10 +0300
Message-ID: <20180719092010.5uhakswjb76gpfr7__4446.33530355549$1531991940$gmane$org@mwanda>
References: <20180719081133.k7asay4fl2qhhpjf@mwanda>
 <b8154096-3a43-cca1-316e-4d60d69ee9ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <b8154096-3a43-cca1-316e-4d60d69ee9ab@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMTksIDIwMTggYXQgMTI6MDY6MzhQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gSGksIERhbiEKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCBh
bmQgc29ycnkgSSB3YXMgY2x1bXN5IHNlbmRpbmcgdjMuCj4gCj4gRG8geW91IHdhbnQgbWUgdG8g
c2VuZCB2MyBub3cgd2l0aCB0aGUgZml4ZXMgZm9yIGJvdGggWGVuIGFuZCBDTUE/Cj4gCj4gVGhh
bmsgeW91LAoKU29ycnksIEkgZm9yZ290IHRoYXQgeW91IGhhZCBzZW50IHRoZXNlIGVhcmxpZXIu
ICBBZnRlciBhIHdoaWxlIHRoZXNlCnRoaW5ncyBhbGwgbG9vayB0aGUgc2FtZS4gIEkgb25jZSBh
Y2NpZGVudGFsbHkgd3JvdGUgYW5kIHNlbnQgdGhlIHNhbWUKcGF0Y2ggdGhyZWUgdGltZXMgd2l0
aG91dCByZWFsaXppbmcuCgpZZWFoLiAgUGxlYXNlIHJlc2VuZCBhIHYzLgoKcmVnYXJkcywKZGFu
IGNhcnBlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
