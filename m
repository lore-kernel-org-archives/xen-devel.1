From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH RESEND v2 1/2] drm/xen-front: Add support
 for Xen PV display frontend
Date: Wed, 14 Mar 2018 08:09:32 +0800
Message-ID: <201803140807.NZ4rSrgW%fengguang.wu__38698.5230529264$1520986168$gmane$org@intel.com>
References: <1520958066-22875-2-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ozvj=ge=intel.com=fengguang.wu@srs-us1.protection.inumbo.net>)
 id 1evu0B-0004rN-In
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 00:10:43 +0000
Content-Disposition: inline
In-Reply-To: <1520958066-22875-2-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, andr2000@gmail.com, seanpaul@chromium.org, kbuild-all@01.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5n
IHRvIGltcHJvdmU6CgpbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbGludXMvbWFzdGVyXQpb
YWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gdjQuMTYtcmM1IG5leHQtMjAxODAzMTNdCltpZiB5
b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1
cyBhIG5vdGUgdG8gaGVscCBpbXByb3ZlIHRoZSBzeXN0ZW1dCgp1cmw6ICAgIGh0dHBzOi8vZ2l0
aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvT2xla3NhbmRyLUFuZHJ1c2hjaGVua28vZHJt
LXhlbi1mcm9udC1BZGQtc3VwcG9ydC1mb3ItWGVuLVBWLWRpc3BsYXktZnJvbnRlbmQvMjAxODAz
MTQtMDE0ODU2CnJlcHJvZHVjZToKICAgICAgICAjIGFwdC1nZXQgaW5zdGFsbCBzcGFyc2UKICAg
ICAgICBtYWtlIEFSQ0g9eDg2XzY0IGFsbG1vZGNvbmZpZwogICAgICAgIG1ha2UgQz0xIENGPS1E
X19DSEVDS19FTkRJQU5fXwoKCnNwYXJzZSB3YXJuaW5nczogKG5ldyBvbmVzIHByZWZpeGVkIGJ5
ID4+KQoKPj4gZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmM6NDIwOjI5OiBzcGFy
c2U6IHN5bWJvbCAneGVuX2RybV9mcm9udF9wbGF0Zm9ybV9pbmZvJyB3YXMgbm90IGRlY2xhcmVk
LiBTaG91bGQgaXQgYmUgc3RhdGljPwotLQo+PiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnRfZHJ2LmM6MTI1OjE5OiBzcGFyc2U6IHN5bWJvbCAneGVuX2RybV9kcml2ZXInIHdhcyBu
b3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpQbGVhc2UgcmV2aWV3IGFuZCBwb3Nz
aWJseSBmb2xkIHRoZSBmb2xsb3d1cCBwYXRjaC4KCi0tLQowLURBWSBrZXJuZWwgdGVzdCBpbmZy
YXN0cnVjdHVyZSAgICAgICAgICAgICAgICBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgpo
dHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwva2J1aWxkLWFsbCAgICAgICAgICAgICAgICAg
ICBJbnRlbCBDb3Jwb3JhdGlvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
