From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Wed, 25 Apr 2018 08:12:08 +0200
Message-ID: <bdeeb76f-ea65-083b-dde4-450584edb068__14724.5193402798$1524636655$gmane$org@suse.com>
References: <41487acb-a67a-8933-d0c3-702c19b0938e@gmail.com>
 <20180418073508.ptvntwedczpvl7bx@MacBook-Pro-de-Roger.local>
 <ebcbf6ce-1d7a-5f3e-cff8-546d1c010e59@gmail.com>
 <20180418101058.hyqk3gr3b2ibxswu@MacBook-Pro-de-Roger.local>
 <20180420071914.GG31310@phenom.ffwll.local>
 <76cdc65a-7bb1-9377-7bc5-6164e32f7b5d@gmail.com>
 <20180423115242.ywdwqblj2aseu3fr@citrix.com>
 <61105351-8896-072b-abf0-757c7f6c0edf@gmail.com>
 <20180424115437.GT31310@phenom.ffwll.local>
 <18ab5f76-00b0-42a0-fcb8-e0cbf4cdd527@gmail.com>
 <20180424203514.GA26787@downor-Z87X-UD5H>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ddll=ho=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBDf3-00043l-QK
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 06:12:13 +0000
In-Reply-To: <20180424203514.GA26787@downor-Z87X-UD5H>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongwon Kim <dongwon.kim@intel.com>, Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Wei Liu <wei.liu2@citrix.com>, airlied@linux.ie, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>, xen-devel@lists.xenproject.org, daniel.vetter@intel.com, boris.ostrovsky@oracle.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDQvMTggMjI6MzUsIERvbmd3b24gS2ltIHdyb3RlOgo+IEhhZCBhIG1lZXRpbmcgd2l0
aCBEYW5pZWwgYW5kIHRhbGtlZCBhYm91dCBicmluZ2luZyBvdXQgZ2VuZXJpYwo+IHBhcnQgb2Yg
aHlwZXItZG1hYnVmIHRvIHRoZSB1c2Vyc3BhY2UsIHdoaWNoIG1lYW5zIHdlIG1vc3QgbGlrZWx5
Cj4gcmV1c2UgSU9DVExzIGRlZmluZWQgaW4geGVuLXpjb3B5IGZvciBvdXIgdXNlLWNhc2UgaWYg
d2UgZm9sbG93Cj4gaGlzIHN1Z2dlc3Rpb24uCj4gCj4gU28gYXNzdW1pbmcgd2UgdXNlIHRoZXNl
IElPQ1RMcyBhcyB0aGV5IGFyZSwKPiBTZXZlcmFsIHRoaW5ncyBJIHdvdWxkIGxpa2UgeW91IHRv
IGRvdWJsZS1jaGVjay4uCj4gCj4gMS4gcmV0dXJuaW5nIGdyZWYgYXMgaXMgdG8gdGhlIHVzZXIg
c3BhY2UgaXMgc3RpbGwgdW5zYWZlIGJlY2F1c2UKPiBpdCBpcyBhIGNvbnN0YW50LCBlYXN5IHRv
IGd1ZXNzIGFuZCBhbnkgcHJvY2VzcyB0aGF0IGhpamFja3MgaXQgY2FuIGVhc2lseQo+IGV4cGxv
aXQgdGhlIGJ1ZmZlci4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQncyBwb3NzaWJsZSB0byBrZWVw
IGRtYWJ1Zi10bwo+IC1ncmVmIG9yIGdyZWYtdG8tZG1hYnVmIGluIGtlcm5lbCBzcGFjZSBhbmQg
YWRkIG90aGVyIGxheWVycyBvbiB0b3AKPiBvZiB0aG9zZSBpbiBhY3R1YWwgSU9DVExzIHRvIGFk
ZCBzb21lIHNhZmV0eS4uIFdlIGludHJvZHVjZWQgZmxpbmsgbGlrZQo+IGh5cGVyX2RtYWJ1Zl9p
ZCBpbmNsdWRpbmcgcmFuZG9tIG51bWJlciBidXQgbWFueSBzYXlzIGV2ZW4gdGhhdCBpcyBzdGls
bAo+IG5vdCBzYWZlLgoKZ3JlZnMgYXJlIHVzYWJsZSBieSByb290IG9ubHkuIFdoZW4geW91IGhh
dmUgcm9vdCBhY2Nlc3MgaW4gZG9tMCB5b3UgY2FuCmRvIGV2aWwgdGhpbmdzIHRvIGFsbCBWTXMg
ZXZlbiB3aXRob3V0IHVzaW5nIGdyYW50cy4gVGhhdCBpcyBpbiBubyB3YXkKZGlmZmVyZW50IHRv
IHJvb3QgYmVpbmcgYWJsZSB0byBjb250cm9sIGFsbCBvdGhlciBwcm9jZXNzZXMgb24gdGhlCnN5
c3RlbS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
