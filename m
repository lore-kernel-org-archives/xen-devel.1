From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] drm/xen-front: Fix error code in
 xen_drm_front_gem_get_sg_table()
Date: Thu, 19 Jul 2018 12:25:17 +0300
Message-ID: <950fe063-3016-9e90-98a6-bfd26d25bbba__25158.7958810434$1531992247$gmane$org@gmail.com>
References: <20180719081133.k7asay4fl2qhhpjf@mwanda>
 <b8154096-3a43-cca1-316e-4d60d69ee9ab@gmail.com>
 <20180719092010.5uhakswjb76gpfr7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180719092010.5uhakswjb76gpfr7@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTkvMjAxOCAxMjoyMCBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBPbiBUaHUsIEp1
bCAxOSwgMjAxOCBhdCAxMjowNjozOFBNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToKPj4gSGksIERhbiEKPj4KPj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ggYW5kIHNvcnJ5
IEkgd2FzIGNsdW1zeSBzZW5kaW5nIHYzLgo+Pgo+PiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIHYz
IG5vdyB3aXRoIHRoZSBmaXhlcyBmb3IgYm90aCBYZW4gYW5kIENNQT8KPj4KPj4gVGhhbmsgeW91
LAo+IFNvcnJ5LCBJIGZvcmdvdCB0aGF0IHlvdSBoYWQgc2VudCB0aGVzZSBlYXJsaWVyLiAgQWZ0
ZXIgYSB3aGlsZSB0aGVzZQo+IHRoaW5ncyBhbGwgbG9vayB0aGUgc2FtZS4gIEkgb25jZSBhY2Np
ZGVudGFsbHkgd3JvdGUgYW5kIHNlbnQgdGhlIHNhbWUKPiBwYXRjaCB0aHJlZSB0aW1lcyB3aXRo
b3V0IHJlYWxpemluZy4KbnAKPiBZZWFoLiAgUGxlYXNlIHJlc2VuZCBhIHYzLgpzdXJlCj4gcmVn
YXJkcywKPiBkYW4gY2FycGVudGVyCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
