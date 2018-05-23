From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH 0/6] arm: more kconfig configurability and
 small default configs
Date: Wed, 23 May 2018 20:48:34 +0300
Message-ID: <376944c3-8674-351e-1f01-da5520518cd9@epam.com>
References: <alpine.DEB.2.10.1804181324400.17714@sstabellini-ThinkPad-X260>
 <96ea4d9d-e1bb-c821-baf2-02a93e41e6a1@epam.com>
 <alpine.DEB.2.10.1805211642540.4520@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1805211642540.4520@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, julien.grall@arm.com, xen-devel@lists.xen.org, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCgpPbiAyMi4wNS4xOCAwMjo0NSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOgo+IEkgYW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgc3VnZ2VzdGlvbi4gQnV0IEkg
dGhpbmsgd2UgYXJlIGhlYWRpbmcKPiBpbiB0aGUgZGlyZWN0aW9uIHlvdSBhcmUgaGludGluZyB0
b3dhcmQgd2l0aCBKdWVyZ2VuJ3Mgc3VnZ2VzdGlvbiB0bwo+IG9ubHkga2VlcCBrY29uZmlnIG9w
dGlvbnMgdGhhdCBhcmUgbm90ICJkZWZhdWx0Ii4gSWYgeW91IGdpdmUgYSBsb29rIGF0Cj4gdjIs
IHRoZSByY2FyMy5jb25maWcgaXMgc21hbGxlciBhbmQgZG9lc24ndCBoYXZlIG11Y2ggbW9yZSB0
aGFuIHRoZQo+IGJhc2ljIGRyaXZlcnMgZm9yIHRoZSBwbGF0Zm9ybS4KCldoYXQgSSBkaWQgbWVh
biBpcyBjbG9zZXIgdG8gdjMuIFdpdGggb25lIG1vcmUgaGludCBhYm91dCBhIHNlbGVjdGluZyAK
cGxhdGZvcm0gY29kZSBvbmUgY2FuIGZpbmQgaW4geGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy4KU29t
ZXRoaW5nIGxpa2U6CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmls
ZSAKYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlCmluZGV4IDUzYTQ3ZTQuLmM0MjAz
MTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUKKysrIGIveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQpAQCAtNyw0ICs3LDQgQEAgb2JqLSQoQ09ORklH
X0FSTV8zMikgKz0gcmNhcjIubwogwqBvYmotJChDT05GSUdfQVJNXzY0KSArPSBzZWF0dGxlLm8K
IMKgb2JqLXkgKz0gc3VueGkubwogwqBvYmotJChDT05GSUdfQVJNXzY0KSArPSB4Z2VuZS1zdG9y
bS5vCi1vYmotJChDT05GSUdfQVJNXzY0KSArPSB4aWxpbngtenlucW1wLm8KK29iai0kKENPTkZJ
R19NUFNPQykgKz0geGlsaW54LXp5bnFtcC5vCgpUaG91Z2gsIFJDQVIgZ2VuMyBkb2VzIG5vdCBo
YXZlIHRoZSBwbGF0Zm9ybSBjb2RlIHlldC4gU28gbm90aGluZyB0byAKc2VsZWN0IGZvciBpdCBu
b3cgOykKCi0tIAoKKkFuZHJpaSBBbmlzb3YqCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
