From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 1/2] libxl: modify domain config when moving
 domain to another cpupool
Date: Wed, 3 Oct 2018 12:02:24 +0100
Message-ID: <CAFLBxZZr_9N9ngN9ScBFR_Twm3vhgW48PQ1ibwc2XZ=FxtEYWQ@mail.gmail.com>
References: <20181002141934.21503-1-jgross@suse.com>
 <20181002141934.21503-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=46gw=mp=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g7evN-0004is-EY
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 11:02:37 +0000
Received: by mail-qt1-x830.google.com with SMTP id z8-v6so5340355qto.9
 for <xen-devel@lists.xenproject.org>; Wed, 03 Oct 2018 04:02:36 -0700 (PDT)
In-Reply-To: <20181002141934.21503-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMiwgMjAxOCBhdCAzOjIwIFBNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBUb2RheSB0aGUgZG9tYWluIGNvbmZpZyBpbmZvIGNvbnRhaW5zIHRo
ZSBjcHVwb29sIG5hbWUgdGhlIGRvbWFpbiB3YXMKPiBzdGFydGVkIGluIG9ubHkgaWYgdGhlIGNw
dXBvb2wgd2FzIHNwZWNpZmllZCBhdCBkb21haW4gY3JlYXRpb24uIE1vdmluZwo+IHRoZSBkb21h
aW4gdG8gYW5vdGhlciBjcHVwb29sIGxhdGVyIHdvbid0IGNoYW5nZSB0aGF0IGluZm9ybWF0aW9u
Lgo+Cj4gQ29ycmVjdCB0aGF0IGJ5IG1vZGlmeWluZyB0aGUgZG9tYWluIGNvbmZpZyBhY2NvcmRp
bmdseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CldvdWxkIGl0IGJlIGJldHRlciB0byBkbyB0aGlzIHRoZSBzYW1lIHdheSB0aGUgc2NoZWR1bGlu
ZyBwYXJhbWV0ZXJzCndhcyBkb25lIC0tIGJ5IGFkZGluZyB0aGlzIHRvIGxpYnhsX3JldHJpZXZl
X2RvbWFpbl9jb25maWd1cmF0aW9uKCk/ClRoYXQgd2F5IHRoZSBjcHVwb29sIHdvdWxkIHNob3cg
dXAgaW4gYHhsIGxpc3QgLWxgIGFzIHdlbGwgKEkgdGhpbmspLgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
