From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 3/6] tools/dm_restrict: Ask QEMU to chroot
Date: Mon, 24 Sep 2018 11:31:29 +0100
Message-ID: <23464.48385.515748.551467@mariner.uk.xensource.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-3-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i3mt=mg=citrix.com=prvs=798356c8e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g4O9N-0002vg-NK
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 10:31:33 +0000
In-Reply-To: <20180921170428.13771-3-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggdjIgMy82XSB0b29scy9kbV9yZXN0cmljdDog
QXNrIFFFTVUgdG8gY2hyb290Iik6Cj4gV2hlbiBkbV9yZXN0cmljdCBpcyBlbmFibGVkLCBhc2sg
UUVNVSB0byBjaHJvb3QgaW50byBhbiBlbXB0eSBkaXJlY3RvcnkuCgpUaGlzIGlzIGdyZWF0LiAg
SG93ZXZlciwKCjEuIENhbiB5b3UgcGxlYXNlIGFycmFuZ2UgdG8gaW5zdGFsbCBkZXByaXYtcHJv
Y2Vzcy1jaGVja2VyLnNoID8KICAgVGhhdCB3YXkgb3NzdGVzdCBjYW4gcnVuIGl0LgoKMi4gZGVw
cml2LXByb2Nlc3MtY2hlY2tlci5zaCBzaG91bGQgYmUgY2FsbGVkIGRlcHJpdi1wcm9jZXNzLWNo
ZWNrZXIKICAgc28gdGhhdCB3ZSBkbyBub3QgbmVlZCB0byByZW5hbWUgaXQgaWYgd2UgY2hhbmdl
IHRoZSBpbXBsZW1lbnRhdGlvbgogICBsYW5ndWFnZS4gIChJbiBnZW5lcmFsIGBmb28uc2gnIGBm
b28ucGwnIGFyZSBhIGJhZCBpZGVhLikKCjMuIElmIFhFTl9SVU5fRElSIGlzIG5vdCBzZXQsIHRo
YXQgc2hvdWxkIGJlIGEgdGVzdCBmYWlsdXJlLCBub3QgYQogICBzaWxlbnQgInBhc3MiIGFsdGhv
dWdoIHRoZSB0ZXN0IHdhcyBub3QgcnVuLCBzbyBJIHRoaW5rIGl0IHNob3VsZAogICBleGl0IG5v
bnplcm8uCgo0LiBTdHlsZToKCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gaW5kZXggYWJkMzFlZTZmMi4uZGY2ZmI2NGJlZSAx
MDA2NDQKPiAtICAgIGlmIChsaWJ4bF9kZWZib29sX3ZhbChiX2luZm8tPmRtX3Jlc3RyaWN0KSkK
PiArICAgIGlmIChsaWJ4bF9kZWZib29sX3ZhbChiX2luZm8tPmRtX3Jlc3RyaWN0KSkgewo+ICsg
ICAgICAgIGNoYXIgKiBjaHJvb3RfZGlyID0gR0NTUFJJTlRGKCIlcy9xZW11LXJvb3QtJWQiLAog
ICAgICAgICAgICAgICAgIF4KU3B1cmlvdXMgc3BhY2UuCgo+ICsgICAgICAgIGlmIChybWRpcihj
aHJvb3RfZGlyKSAhPSAwCj4gKyAgICAgICAgICAgICYmIGVycm5vICE9IEVOT0VOVCkgewoKVGhp
cyBlcnJvciBoYW5kbGluZyBzdHlsZSBpcyBjb250cmFyeSB0byB1c3VhbCBsaWJ4bCBwcmFjdGlj
ZS4gIE1vcmUKaWRpb21hdGljLCBhbmQgSU1PIG1vcmUgcmVhZGFibGUsIHdvdWxkIGJlIHNvbWV0
aGluZyBsaWtlIHRoaXM6CgogICAgICAgICAgIHIgPSBybWRpcihjaHJvb3RfZGlyKTsKICAgICAg
ICAgICBpZiAociAmJiBlcnJubyAhPSBFTk9FTlQpIHsKCj4gKyAgICAgICAgZm9yICg7Oykgewo+
ICsgICAgICAgICAgICBpZiAoIW1rZGlyKGNocm9vdF9kaXIsIDAwMDApKQo+ICsgICAgICAgICAg
ICAgICAgYnJlYWs7CgpTYW1lIGhlcmUuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
