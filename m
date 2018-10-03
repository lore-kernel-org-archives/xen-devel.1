From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 1/2] libxl: modify domain config when moving
 domain to another cpupool
Date: Wed, 3 Oct 2018 12:45:39 +0100
Message-ID: <CAFLBxZbZuX1QWXaeRn8psBqbMWYS7GJfDKmjj--3+brRkwJz_w@mail.gmail.com>
References: <20181002141934.21503-1-jgross@suse.com>
 <20181002141934.21503-2-jgross@suse.com>
 <CAFLBxZZr_9N9ngN9ScBFR_Twm3vhgW48PQ1ibwc2XZ=FxtEYWQ@mail.gmail.com>
 <20181003112907.biz3otymaqyyl4kl@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=46gw=mp=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g7fbF-000887-8d
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:45:53 +0000
Received: by mail-qt1-x844.google.com with SMTP id z8-v6so5463899qto.9
 for <xen-devel@lists.xenproject.org>; Wed, 03 Oct 2018 04:45:51 -0700 (PDT)
In-Reply-To: <20181003112907.biz3otymaqyyl4kl@zion.uk.xensource.com>
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

T24gV2VkLCBPY3QgMywgMjAxOCBhdCAxMjoyOSBQTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDAzLCAyMDE4IGF0IDEyOjAyOjI0UE0gKzAxMDAs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAyLCAyMDE4IGF0IDM6MjAgUE0g
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVG9kYXkg
dGhlIGRvbWFpbiBjb25maWcgaW5mbyBjb250YWlucyB0aGUgY3B1cG9vbCBuYW1lIHRoZSBkb21h
aW4gd2FzCj4gPiA+IHN0YXJ0ZWQgaW4gb25seSBpZiB0aGUgY3B1cG9vbCB3YXMgc3BlY2lmaWVk
IGF0IGRvbWFpbiBjcmVhdGlvbi4gTW92aW5nCj4gPiA+IHRoZSBkb21haW4gdG8gYW5vdGhlciBj
cHVwb29sIGxhdGVyIHdvbid0IGNoYW5nZSB0aGF0IGluZm9ybWF0aW9uLgo+ID4gPgo+ID4gPiBD
b3JyZWN0IHRoYXQgYnkgbW9kaWZ5aW5nIHRoZSBkb21haW4gY29uZmlnIGFjY29yZGluZ2x5Lgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gPgo+ID4gV291bGQgaXQgYmUgYmV0dGVyIHRvIGRvIHRoaXMgdGhlIHNhbWUgd2F5IHRoZSBz
Y2hlZHVsaW5nIHBhcmFtZXRlcnMKPiA+IHdhcyBkb25lIC0tIGJ5IGFkZGluZyB0aGlzIHRvIGxp
YnhsX3JldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uKCk/Cj4gPiBUaGF0IHdheSB0aGUgY3B1
cG9vbCB3b3VsZCBzaG93IHVwIGluIGB4bCBsaXN0IC1sYCBhcyB3ZWxsIChJIHRoaW5rKS4KPgo+
IFRoaXMgYWxyZWFkeSBtb2RpZmllcyB0aGUgc2F2ZWQgc3RhdGUgZmlsZSwgdGhlcmUgd2lsbCBu
b3QgYmUgbWlzbWF0Y2gKPiBiZXR3ZWVuIHRoZSBzYXZlZCBzdGF0ZSBhbmQgdGhlIHN0YXRlIGlu
IGh5cGVydmlzb3IuIGB4bCBsaXN0IC1sYCBzaG91bGQKPiB3b3JrIGp1c3QgZmluZS4KCklmIHlv
dSBkbyBpdCBKdWVyZ2VucyB3YXksIGB4bCBsaXN0IC1sYCB3aWxsIHNob3cgdGhpbmdzIHlvdSBo
YXZlCipjaGFuZ2VkKiwgYnV0IG5vdCB0aGUgZGVmYXVsdHMuICBJZiB5b3UgZG8gaXQgdGhlIHdh
eSB0aGUgc2NoZWR1bGluZwpwYXJhbWV0ZXJzIHdhcyBkb25lLCB0aGUgcG9vbCBuYW1lIHdpbGwg
YmUgc2hvd24gZXZlbiBpZiB0aGVyZSB3YXMgbm8KcG9vbCBzcGVjaWZpZWQgaW4gdGhlIGNvbmZp
ZyBmaWxlLCBub3IgdGhlIHZtIG1pZ3JhdGVkIGZyb20gdGhlCmRlZmF1bHQgcG9vbCB0byBhIGRp
ZmZlcmVudCBvbmUuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
