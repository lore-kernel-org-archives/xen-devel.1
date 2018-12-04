From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 10/25] arm: introduce
 guest_handle_for_field()
Date: Tue, 4 Dec 2018 09:46:46 +0000
Message-ID: <707d57f9b3d4422aac668afcd1d85c7c@AMSPEX02CL03.citrite.net>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-11-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jzt/=on=citrix.com=prvs=869b801c3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gU7I0-0003IS-Td
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:46:48 +0000
In-Reply-To: <1543627984-21394-11-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Christopher Clark' <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, James McKenzie <voreekf@madingley.org>, Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IENocmlzdG9waGVyIENsYXJrIFtt
YWlsdG86Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb21dCj4gU2VudDogMDEgRGVjZW1iZXIg
MjAxOCAwMTozMwo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsCj4g
PGp1bGllbi5ncmFsbEBhcm0uY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IFJpY2gKPiBQZXJzYXVkIDxwZXJzYXVyQGdtYWlsLmNvbT47IFJvc3MgUGhpbGlwc29u
IDxyb3NzLnBoaWxpcHNvbkBnbWFpbC5jb20+Owo+IEVyaWMgQ2hhbnVkZXQgPGVyaWMuY2hhbnVk
ZXRAZ21haWwuY29tPjsgSmFtZXMgTWNLZW56aWUKPiA8dm9yZWVrZkBtYWRpbmdsZXkub3JnPjsg
SmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPjsgRGFuaWVsIFNtaXRoCj4gPGRwc21p
dGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+Cj4gU3ViamVjdDogW1BBVENIIDEwLzI1XSBhcm06IGlu
dHJvZHVjZSBndWVzdF9oYW5kbGVfZm9yX2ZpZWxkKCkKPiAKPiBhcm0gcG9ydCBvZiBjb21taXQg
YmI1NDQ1ODUxMzcyNTk1NDVkNGFkYzlhZmU2ZWVkOGRjN2M3Mzc2ZAoKQ2FwaXRhbGl6ZSAnYXJt
Jz8gQWxzbyBtYXliZSBzaG9ydGVuIHRoZSBxdW90ZWQgaGFzaCwgYW5kIHlvdSBzaG91bGQgaW5j
bHVkZSB0aGUgY29tbWl0IHRpdGxlIGhlcmUuCgo+IAo+IFRoaXMgaGVscGVyIHR1cm5zIGEgZmll
bGQgb2YgYSBHVUVTVF9IQU5ETEUgaW50byBhIEdVRVNUX0hBTkRMRS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29t
PgoKVGhlIGNvZGUgbG9va3MgZmluZSwgc28gd2l0aCBhIHJldmlzZWQgY29tbWVudC4uLgoKUmV2
aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cgo+IC0tLQo+
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oIHwgMyArKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2d1ZXN0X2FjY2Vzcy5oIGIveGVuL2luY2x1ZGUvYXNtLQo+IGFybS9ndWVzdF9hY2Nlc3Mu
aAo+IGluZGV4IDdiNmY4OWMuLjExMzdjNTQgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9ndWVzdF9hY2Nlc3MuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNj
ZXNzLmgKPiBAQCAtNjgsNiArNjgsOSBAQCBpbnQgYWNjZXNzX2d1ZXN0X21lbW9yeV9ieV9pcGEo
c3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdAo+IGlwYSwgdm9pZCAqYnVmLAo+ICAgICAgX3k7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gIH0p
Cj4gCj4gKyNkZWZpbmUgZ3Vlc3RfaGFuZGxlX2Zvcl9maWVsZChobmQsIHR5cGUsIGZsZCkgICAg
ICAgICAgXAo+ICsgICAgKChYRU5fR1VFU1RfSEFORExFKHR5cGUpKSB7ICYoaG5kKS5wLT5mbGQg
fSkKPiArCj4gICNkZWZpbmUgZ3Vlc3RfaGFuZGxlX2Zyb21fcHRyKHB0ciwgdHlwZSkgICAgICAg
IFwKPiAgICAgICgoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh0eXBlKSkgeyAodHlwZSAqKXB0ciB9
KQo+ICAjZGVmaW5lIGNvbnN0X2d1ZXN0X2hhbmRsZV9mcm9tX3B0cihwdHIsIHR5cGUpICBcCj4g
LS0KPiAyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
