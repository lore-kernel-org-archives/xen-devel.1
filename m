From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xen-front: Add support for Xen
 PV display frontend
Date: Thu, 29 Mar 2018 15:39:36 +0800
Message-ID: <201803291558.HKHwOnSd%fengguang.wu__25863.809468183$1522309185$gmane$org@intel.com>
References: <1522219661-26827-3-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dud5=gt=intel.com=fengguang.wu@srs-us1.protection.inumbo.net>)
 id 1f1SAp-000822-N9
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 07:40:39 +0000
Content-Disposition: inline
In-Reply-To: <1522219661-26827-3-git-send-email-andr2000@gmail.com>
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
IHRvIGltcHJvdmU6CgpbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gZHJtL2RybS1uZXh0XQpb
YWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbmV4dC0yMDE4MDMyOF0KW2Nhbm5vdCBhcHBseSB0
byB2NC4xNi1yYzddCltpZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0
cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscCBpbXByb3ZlIHRoZSBzeXN0ZW1dCgp1
cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvT2xla3NhbmRy
LUFuZHJ1c2hjaGVua28vZHJtLXhlbi1mcm9udC1BZGQtc3VwcG9ydC1mb3ItWGVuLVBWLWRpc3Bs
YXktZnJvbnRlbmQvMjAxODAzMjktMDkwNzQ0CmJhc2U6ICAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNr
dG9wLm9yZy9+YWlybGllZC9saW51eC5naXQgZHJtLW5leHQKcmVwcm9kdWNlOgogICAgICAgICMg
YXB0LWdldCBpbnN0YWxsIHNwYXJzZQogICAgICAgIG1ha2UgQVJDSD14ODZfNjQgYWxsbW9kY29u
ZmlnCiAgICAgICAgbWFrZSBDPTEgQ0Y9LURfX0NIRUNLX0VORElBTl9fCgoKc3BhcnNlIHdhcm5p
bmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCgo+PiBkcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnRfa21zLmM6Mjc2OjIyOiBzcGFyc2U6IHN5bWJvbCAnZGlzcGxheV9tb2RlX3Zh
bGlkJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKUGxlYXNlIHJldmll
dyBhbmQgcG9zc2libHkgZm9sZCB0aGUgZm9sbG93dXAgcGF0Y2guCgotLS0KMC1EQVkga2VybmVs
IHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVjaG5vbG9n
eSBDZW50ZXIKaHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAgICAg
ICAgICAgICAgICAgSW50ZWwgQ29ycG9yYXRpb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
