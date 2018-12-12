From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 6/7] drm/xen: Don't set the dpms hook
Date: Wed, 12 Dec 2018 11:56:55 +0100
Message-ID: <20181212105655.GY21184__20614.5966462374$1544612147$gmane$org@phenom.ffwll.local>
References: <20181210100359.22507-1-daniel.vetter@ffwll.ch>
 <20181210100359.22507-7-daniel.vetter@ffwll.ch>
 <ea26da4d-6940-1f47-1e96-cccf1b4d4f4e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <ea26da4d-6940-1f47-1e96-cccf1b4d4f4e@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, xen-devel@lists.xen.org, Daniel Vetter <daniel.vetter@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTAsIDIwMTggYXQgMTI6MTI6MDVQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMTIvMTAvMTggMTI6MDMgUE0sIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4gPiBEb2Vzbid0IGRvIGFueXRoaW5nIGZvciBhdG9taWMuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4K
PiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZwo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmMgfCAxIC0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9jb25uLmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRf
Y29ubi5jCj4gPiBpbmRleCBjOTFhZTUzMmZhNTUuLjU0YWYyNjY5YjFiMyAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmMKPiA+IEBAIC04OSw3ICs4OSw2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgY29ubmVj
dG9yX2hlbHBlcl9mdW5jcyA9IHsKPiA+ICAgfTsKPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fY29ubmVjdG9yX2Z1bmNzIGNvbm5lY3Rvcl9mdW5jcyA9IHsKPiA+IC0JLmRwbXMgPSBkcm1f
aGVscGVyX2Nvbm5lY3Rvcl9kcG1zLAo+ID4gICAJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsCj4gPiAgIAkuZGVzdHJveSA9IGRybV9jb25uZWN0
b3JfY2xlYW51cCwKPiA+ICAgCS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9y
ZXNldCwKPiAKPiBSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKVGhpcyBhbmQgdGhlIHByZXZpb3VzIHBhdGNoIG1l
cmdlZCwgdGhhbmtzIGZvciByZXZpZXdpbmcuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
