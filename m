From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V4 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
Date: Tue, 30 Apr 2019 14:00:42 +0300
Message-ID: <30269399-069c-617f-991f-a37899ed2008@gmail.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-5-git-send-email-olekstysh@gmail.com>
 <0ca6089f-da23-a3a6-3b88-df2e99c0d5eb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SUxV=TA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hLQVC-0006B3-KZ
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 11:00:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id c6so5846546lji.11
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 04:00:45 -0700 (PDT)
In-Reply-To: <0ca6089f-da23-a3a6-3b88-df2e99c0d5eb@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDI5LjA0LjE5IDE3OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+PiAtLS0KPj4gwqAgZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0
wqDCoMKgIHzCoCA2ICsrKysrKwo+PiDCoCB4ZW4vYXJjaC9hcm0vUnVsZXMubWvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrKysrKwo+PiDCoCB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVi
dWctc2NpZi5pbmMgfCAxMyArKysrKysrKystLS0tCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlz
Yy9hcm0vZWFybHktcHJpbnRrLnR4dCAKPj4gYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50
eHQKPj4gaW5kZXggYjIzYzU0Zi4uYzA1NDY3NCAxMDA2NDQKPj4gLS0tIGEvZG9jcy9taXNjL2Fy
bS9lYXJseS1wcmludGsudHh0Cj4+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4
dAo+PiBAQCAtMjcsNiArMjcsMTIgQEAgCj4+IENPTkZJR19FQVJMWV9QUklOVEs9PElOQz4sPEJB
U0VfQUREUkVTUz4sPE9USEVSX09QVElPTlM+Cj4+IMKgwqDCoMKgwqDCoMKgIElmIDxCQVVEX1JB
VEU+IGlzIG5vdCBnaXZlbiB0aGVuIHRoZSBjb2RlIHdpbGwgbm90IHRyeSB0bwo+PiDCoMKgwqDC
oMKgwqDCoCBpbml0aWFsaXplIHRoZSBVQVJULCBzbyB0aGF0IGJvb3Rsb2FkZXIgb3IgZmlybXdh
cmUgc2V0dGluZ3MgY2FuCj4+IMKgwqDCoMKgwqDCoCBiZSB1c2VkIGZvciBtYXhpbXVtIGNvbXBh
dGliaWxpdHkuCj4+ICvCoCAtIHNjaWYsPEJBU0VfQUREUkVTUz4sPFZFUlNJT04+Cj4+ICvCoMKg
wqAgLSA8VkVSU0lPTj4gaXMgYSBvcHRpb24gdG8gY2hvb3NlIHdoaWNoIGludGVyZmFjZSB2ZXJz
aW9uIHNob3VsZCAKPj4gYmUgdXNlZAo+Cj4gQnkgImEgb3B0aW9uIiBkaWQgeW91IGludGVuZCB0
byBtZWFuIGl0IGlzIGFuIG9wdGlvbmFsIHBhcmFtZXRlcj8KPgo+IElmIHNvLCBob3cgYWJvdXQ6
Cj4KPiAiU0NJRjxWRVJTSU9OPiBpcywgb3B0aW9uYWxseSwgdGhlIGludGVyZmFjZSB2ZXJzaW9u
IG9mIHRoZSBVQVJULiIKCmFncmVlLiB3aWxsIGNoYW5nZS4KCgo+Cj4gU28geW91IHdvdWxkIGFs
c28gcHJvdmlkZSBhIHdheSBmb3IgdGhlIHVzZXIgdG8ga25vdyBob3cgdG8gc3BlY2lmeSAKPiBp
dC4gU3RlZmFubyBhbnkgb3Bpbmlvbj8KCkkgYW0gZ29pbmcgdG8gdXBkYXRlIFdpa2kgcGFnZSBy
ZWdhcmRpbmcgaG93IHRvIHJ1biBTdG91dCBib2FyZCBvbiBYZW4gCmFuZCBob3cgdG8gcHJvcGVy
bHkgZW5hYmxlIGVhcmx5cHJpbnRrIHN1cHBvcnQgb24gdGhhdCBib2FyZC4KCldvdWxkIGl0IGJl
IGVub3VnaD8gQWxzbyBJIGNhbiBhZGQgYSBub3RlIHRvIHBhdGNoIGRlc2NyaXB0aW9uLgoKSW4g
VjEgSSBhZGRlZCBjb252ZW5pZW50IGFsaWFzIEVBUkxZX1BSSU5US19zdG91dCwgYnV0IEFGQUlS
IGl0IHdhcyAKZGVjaWRlZCB0byBhdm9pZCBhZGRpbmcgbmV3IGFsaWFzZXMuCgoKPgo+PiArwqDC
oMKgwqDCoCBJZiA8VkVSU0lPTj4gaXMgbm90IGdpdmVuIHRoZW4gYSBkZWZhdWx0IGludGVyZmFj
ZSB2ZXJzaW9uIChTQ0lGKQo+Cj4gcy9hL3RoZS8KCm9rCgoKCi0tIApSZWdhcmRzLAoKT2xla3Nh
bmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
