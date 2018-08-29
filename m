From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Wed, 29 Aug 2018 11:29:30 +0200
Message-ID: <7afb803f-a2d2-73c8-f2d3-8b866dc89e87__44479.5969910503$1535534900$gmane$org@suse.com>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <1701ccef-3ebb-973b-de32-059a8816d31c@suse.com>
 <20180829082731.GX26705@gavran.carpriv.carnet.hr>
 <b67866fc-13b7-ef88-c8db-2745127e5f6a@suse.com>
 <20180829092329.GY26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cgjg=lm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fuwn8-0000tJ-FK
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 09:29:34 +0000
In-Reply-To: <20180829092329.GY26705@gavran.carpriv.carnet.hr>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTE6MjMsIFZhbGVudGluIFZpZGljIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDI5
LCAyMDE4IGF0IDEwOjQzOjQ4QU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEkgdGhp
bmsgdGhpcyBzaG91bGQgYmUgYW4gYWN0aW9uIHRyaWdnZXJlZCBieSB0aGUgZnJvbnRlbmQsIG5v
dCBieSBkb20wCj4+ICh4ZW4gdG9vbHMgd2lsbCBhbHdheXMgc2V0ICJvbmxpbmUiIHRvIDAgd2hl
biByZW1vdmluZyBhIGRldmljZSwgQUZBSUspLgo+Pgo+PiBJJ20gbm90IHN1cmUgdGhpcyBpcyBy
ZWxldmFudCwgYnV0IEkgcmVhbGl6ZWQgdGhpcyBiZWhhdmlvciBpcyBjaGFuZ2VkCj4+IGJ5IHlv
dXIgcGF0Y2guCj4gCj4gQ2FuJ3QgZmluZCBhbnkgcGxhY2UgaW4geGVuLWJsa2Zyb250LmMgKG9y
IHRoZSByZXN0IG9mIHRoZSBrZXJuZWwpIHdoZXJlCj4gdGhlICJvbmxpbmUiIHZhbHVlIGdldHMg
c2V0LCBzbyBpdCBzZWVtcyB4ZW4gdG9vbHMgaW4gZG9tMCBpcyB0aGUgb25seQo+IHRoaW5nIHRo
YXQgbW9kaWZpZXMgdGhpcyBYZW5idXMgbm9kZT8KPiAKCkkgdGhpbmsgc28sIHllcy4KCkl0IHdp
bGwgYmUgc2V0IHRvICIxIiBhdCBkZXZpY2UgY3JlYXRpb24gYW5kIHRvICIwIiB3aGVuIHJlbW92
aW5nIHRoZQpkZXZpY2UsIGJvdGggdGltZXMgYnkgWGVuIHRvb2xzLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
