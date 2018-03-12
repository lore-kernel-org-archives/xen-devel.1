From: Alexey Gerasimenko <x1917x@gmail.com>
Subject: [RFC PATCH 09/12] libxl: Xen Platform device support
	for Q35
Date: Tue, 13 Mar 2018 04:33:54 +1000
Message-ID: <f3594e1847b26d4792130acdffb2521098c8feee.1520867741.git.x1917x@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z5vn=gc=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1evSHq-0007JS-06
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 18:35:06 +0000
Received: by mail-pf0-x244.google.com with SMTP id f80so4726296pfa.8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Mar 2018 11:35:05 -0700 (PDT)
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
In-Reply-To: <cover.1520867740.git.x1917x@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Alexey Gerasimenko <x1917x@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudCBYZW4vUUVNVSBtZXRob2QgdG8gY29udHJvbCBYZW4gUGxhdGZvcm0gZGV2aWNlIGlz
IGEgYml0IG9kZCAtLQpjaGFuZ2luZyAneGVuX3BsYXRmb3JtX2RldmljZScgb3B0aW9uIHZhbHVl
IGFjdHVhbGx5IG1vZGlmaWVzIFFFTVUKZW11bGF0ZWQgbWFjaGluZSB0eXBlLCBuYW1lbHkgeGVu
ZnYgPC0tPiBwYy4KCkluIG9yZGVyIHRvIGF2b2lkIG11bHRpcGx5aW5nIG1hY2hpbmUgdHlwZXMs
IHVzZSB0aGUgbmV3IHdheSB0byBjb250cm9sClhlbiBQbGF0Zm9ybSBkZXZpY2UgZm9yIFFFTVUg
LS0geGVuLXBsYXRmb3JtLWRldiBwcm9wZXJ0eS4gVG8gbWFpbnRhaW4KYmFja3dhcmQgY29tcGF0
aWJpbGl0eSB3aXRoIGV4aXN0aW5nIFhlbi9RRU1VIHNldHVwcywgdGhpcyBpcyBvbmx5CmFwcGxp
Y2FibGUgdG8gcTM1IG1hY2hpbmUgY3VycmVudGx5LiBpNDQwIGVtdWxhdGlvbiB1c2VzIHRoZSBv
bGQgbWV0aG9kCih4ZW5mdi9wYyBtYWNoaW5lKSB0byBjb250cm9sIFhlbiBQbGF0Zm9ybSBkZXZp
Y2UsIHRoaXMgbWF5IGJlIGNoYW5nZWQKbGF0ZXIgdG8geGVuLXBsYXRmb3JtLWRldiBwcm9wZXJ0
eSBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogQWxleGV5IEdlcmFzaW1lbmtvIDx4MTkxN3hAZ21h
aWwuY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgfCA2ICsrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDdiNTMxMDUw
YzcuLjU4NjAzNWFhNzMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfZG0uYwpAQCAtMTQ0NCw3ICsxNDQ0LDExIEBAIHN0YXRpYyBpbnQg
bGlieGxfX2J1aWxkX2RldmljZV9tb2RlbF9hcmdzX25ldyhsaWJ4bF9fZ2MgKmdjLAogICAgICAg
ICBicmVhazsKICAgICBjYXNlIExJQlhMX0RPTUFJTl9UWVBFX0hWTToKICAgICAgICAgaWYgKGJf
aW5mby0+ZGV2aWNlX21vZGVsX21hY2hpbmUgPT0gTElCWExfREVWSUNFX01PREVMX01BQ0hJTkVf
UTM1KSB7Ci0gICAgICAgICAgICBtYWNoaW5lYXJnID0gbGlieGxfX3NwcmludGYoZ2MsICJxMzUs
YWNjZWw9eGVuIik7CisgICAgICAgICAgICBpZiAoIWxpYnhsX2RlZmJvb2xfdmFsKGJfaW5mby0+
dS5odm0ueGVuX3BsYXRmb3JtX3BjaSkpIHsKKyAgICAgICAgICAgICAgICBtYWNoaW5lYXJnID0g
bGlieGxfX3NwcmludGYoZ2MsICJxMzUsYWNjZWw9eGVuIik7CisgICAgICAgICAgICB9IGVsc2Ug
eworICAgICAgICAgICAgICAgIG1hY2hpbmVhcmcgPSBsaWJ4bF9fc3ByaW50ZihnYywgInEzNSxh
Y2NlbD14ZW4seGVuLXBsYXRmb3JtLWRldj1vbiIpOworICAgICAgICAgICAgfQogICAgICAgICB9
IGVsc2UgewogICAgICAgICAgICAgaWYgKCFsaWJ4bF9kZWZib29sX3ZhbChiX2luZm8tPnUuaHZt
Lnhlbl9wbGF0Zm9ybV9wY2kpKSB7CiAgICAgICAgICAgICAgICAgLyogU3dpdGNoaW5nIGhlcmUg
dG8gdGhlIG1hY2hpbmUgInBjIiB3aGljaCBkb2VzIG5vdCBhZGQKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
