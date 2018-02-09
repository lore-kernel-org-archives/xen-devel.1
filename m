From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/7] Port WARN_ON_ONCE() from Linux
Date: Fri, 9 Feb 2018 10:45:25 +0000
Message-ID: <6c94284e-f559-273d-021e-05ea35b9ec2e@arm.com>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-2-sameer.goel@linaro.org>
 <20180209102947.6dwuchlgkibx4okr@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8+q2=fd=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ek6BW-0003bY-IH
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 10:45:38 +0000
In-Reply-To: <20180209102947.6dwuchlgkibx4okr@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, jbeulich@suse.com, Ian.Jackson@citrix.com, xen-devel@lists.xenproject.org, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8wOS8yMDE4IDEwOjI5IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9u
IFRodSwgRmViIDA4LCAyMDE4IGF0IDA4OjEwOjQ5UE0gLTA3MDAsIFNhbWVlciBHb2VsIHdyb3Rl
Ogo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpYi5oIGIveGVuL2luY2x1ZGUveGVu
L2xpYi5oCj4+IGluZGV4IDFkOTc3MTM0MGMuLjY5NzIxMmEwNjEgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9saWIuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPj4gQEAg
LTExLDYgKzExLDE5IEBACj4+ICAgI2RlZmluZSBCVUdfT04ocCkgIGRvIHsgaWYgKHVubGlrZWx5
KHApKSBCVUcoKTsgIH0gd2hpbGUgKDApCj4+ICAgI2RlZmluZSBXQVJOX09OKHApIGRvIHsgaWYg
KHVubGlrZWx5KHApKSBXQVJOKCk7IH0gd2hpbGUgKDApCj4+ICAgCj4+ICsjZGVmaW5lIFdBUk5f
T05fT05DRShwKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArKHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICBzdGF0aWMg
Ym9vbCBfX3NlY3Rpb24oIi5kYXRhLnVubGlrZWx5IikgX193YXJuZWQ7IFwKPj4gKyAgICBpbnQg
X19yZXRfd2Fybl9vbmNlID0gISEocCk7ICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBe
IGJvb2wKPiAKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+ICsgICAgaWYgKCB1bmxpa2VseShfX3JldF93YXJuX29uY2UgJiYgIV9fd2Fy
bmVkKSApICAgICBcCj4+ICsgICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+PiArICAgICAgICBfX3dhcm5lZCA9IHRydWU7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgV0FSTigpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiArICAgIHVubGlrZWx5KF9fcmV0X3dhcm5fb25jZSk7ICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAKPiBEb2VzIHRoaXMgbWFjcm8gcmVhbGx5IG5lZWQgdG8gcmV0
dXJuIHNvbWV0aGluZz8gSXQgc2VlbXMgd2VpcmQgdG8gbWUKPiB0byBhbGxvdyB1c2FnZXMgbGlr
ZTogaWYgKCBXQVJOX09OX09OQ0UuLi4KClRoaXMgY29uc3RydWN0IGlzIHVzZWQgaW4gTGludXgg
KGluY2x1ZGVkIGluIHRoZSBkcml2ZXIgcG9ydGVkKToKCmlmIChXQVJOX09OX09OQ0UoZndzcGVj
LT5pb21tdV9wcml2KSkgewogICAgICBtYXN0ZXIgPSBmd3NwZWMtPmlvbW11X3ByaXY7CiAgICAg
IHNtbXUgPSBtYXN0ZXItPnNtbXU7Cn0gZWxzZSB7Ci4uLi4KfQoKSUhNTyB0aGUgbWFrZXMgdGhl
IGNvZGUgbmljZXIgdG8gcmVhZCBvdmVyOgoKV0FSTl9PTl9PTkNFKC4uLikKaWYgKCAuLi4gKSB7
Cn0gZWxzZSB7Cn0KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
