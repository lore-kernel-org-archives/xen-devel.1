From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 1/2] libxl: modify domain config when moving
 domain to another cpupool
Date: Wed, 3 Oct 2018 14:32:18 +0100
Message-ID: <CAFLBxZYKqXf5FcfOpdW4mJwVptO=w_tAXuVv3mfUuyLLhw--vQ@mail.gmail.com>
References: <20181002141934.21503-1-jgross@suse.com>
 <20181002141934.21503-2-jgross@suse.com>
 <CAFLBxZZr_9N9ngN9ScBFR_Twm3vhgW48PQ1ibwc2XZ=FxtEYWQ@mail.gmail.com>
 <20181003112907.biz3otymaqyyl4kl@zion.uk.xensource.com>
 <CAFLBxZbZuX1QWXaeRn8psBqbMWYS7GJfDKmjj--3+brRkwJz_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=46gw=mp=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g7hGR-0007d2-Jd
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 13:32:31 +0000
Received: by mail-qt1-x844.google.com with SMTP id l2-v6so5835854qtr.12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Oct 2018 06:32:30 -0700 (PDT)
In-Reply-To: <CAFLBxZbZuX1QWXaeRn8psBqbMWYS7GJfDKmjj--3+brRkwJz_w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMywgMjAxOCBhdCAxMjo0NSBQTSBHZW9yZ2UgRHVubGFwIDxkdW5sYXBnQHVt
aWNoLmVkdT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAzLCAyMDE4IGF0IDEyOjI5IFBNIFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgT2N0IDAzLCAy
MDE4IGF0IDEyOjAyOjI0UE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiA+IE9uIFR1
ZSwgT2N0IDIsIDIwMTggYXQgMzoyMCBQTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gVG9kYXkgdGhlIGRvbWFpbiBjb25maWcgaW5mbyBjb250
YWlucyB0aGUgY3B1cG9vbCBuYW1lIHRoZSBkb21haW4gd2FzCj4gPiA+ID4gc3RhcnRlZCBpbiBv
bmx5IGlmIHRoZSBjcHVwb29sIHdhcyBzcGVjaWZpZWQgYXQgZG9tYWluIGNyZWF0aW9uLiBNb3Zp
bmcKPiA+ID4gPiB0aGUgZG9tYWluIHRvIGFub3RoZXIgY3B1cG9vbCBsYXRlciB3b24ndCBjaGFu
Z2UgdGhhdCBpbmZvcm1hdGlvbi4KPiA+ID4gPgo+ID4gPiA+IENvcnJlY3QgdGhhdCBieSBtb2Rp
ZnlpbmcgdGhlIGRvbWFpbiBjb25maWcgYWNjb3JkaW5nbHkuCj4gPiA+ID4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiA+Cj4gPiA+IFdv
dWxkIGl0IGJlIGJldHRlciB0byBkbyB0aGlzIHRoZSBzYW1lIHdheSB0aGUgc2NoZWR1bGluZyBw
YXJhbWV0ZXJzCj4gPiA+IHdhcyBkb25lIC0tIGJ5IGFkZGluZyB0aGlzIHRvIGxpYnhsX3JldHJp
ZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uKCk/Cj4gPiA+IFRoYXQgd2F5IHRoZSBjcHVwb29sIHdv
dWxkIHNob3cgdXAgaW4gYHhsIGxpc3QgLWxgIGFzIHdlbGwgKEkgdGhpbmspLgo+ID4KPiA+IFRo
aXMgYWxyZWFkeSBtb2RpZmllcyB0aGUgc2F2ZWQgc3RhdGUgZmlsZSwgdGhlcmUgd2lsbCBub3Qg
YmUgbWlzbWF0Y2gKPiA+IGJldHdlZW4gdGhlIHNhdmVkIHN0YXRlIGFuZCB0aGUgc3RhdGUgaW4g
aHlwZXJ2aXNvci4gYHhsIGxpc3QgLWxgIHNob3VsZAo+ID4gd29yayBqdXN0IGZpbmUuCj4KPiBJ
ZiB5b3UgZG8gaXQgSnVlcmdlbnMgd2F5LCBgeGwgbGlzdCAtbGAgd2lsbCBzaG93IHRoaW5ncyB5
b3UgaGF2ZQo+ICpjaGFuZ2VkKiwgYnV0IG5vdCB0aGUgZGVmYXVsdHMuICBJZiB5b3UgZG8gaXQg
dGhlIHdheSB0aGUgc2NoZWR1bGluZwo+IHBhcmFtZXRlcnMgd2FzIGRvbmUsIHRoZSBwb29sIG5h
bWUgd2lsbCBiZSBzaG93biBldmVuIGlmIHRoZXJlIHdhcyBubwo+IHBvb2wgc3BlY2lmaWVkIGlu
IHRoZSBjb25maWcgZmlsZSwgbm9yIHRoZSB2bSBtaWdyYXRlZCBmcm9tIHRoZQo+IGRlZmF1bHQg
cG9vbCB0byBhIGRpZmZlcmVudCBvbmUuCgpCdXQgb2YgY291cnNlLCB3ZSBoYXZlIHRoZSBzYW1l
IHByb2JsZW0gdGhhdCBpZiB0aGUgY3B1cG9vbCBkb2Vzbid0CmV4aXN0IG9uIHRoZSBmYXIgc2lk
ZSwgdGhlIG1pZ3JhdGlvbiB3aWxsIGZhaWwgKEknbSBndWVzc2luZz8pLiAgSQp0aGluayB0aGlz
IGlzIHN1cnByaXNpbmcsIGFuZCBhdCB2ZXJ5IGxlYXN0IHVuZG9jdW1lbnRlZC4gIElzIGl0IHdv
cnRoCmNvbnNpZGVyaW5nIGhhdmluZyBpdCBmYWxsIGJhY2sgdG8gdGhlIGRlZmF1bHQgY3B1cG9v
bCBpbnN0ZWFkPwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
