From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] arm: add a small kconfig for Renesas
 RCar H3
Date: Thu, 19 Apr 2018 09:06:49 +0100
Message-ID: <6a80e2e4-4063-fb5a-36b5-8980344b38fd@citrix.com>
References: <alpine.DEB.2.10.1804181324400.17714@sstabellini-ThinkPad-X260>
 <1524089752-22174-4-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1524089752-22174-4-git-send-email-sstabellini@kernel.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, julien.grall@arm.com
Cc: artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMjAxOCAyMzoxNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ICB4ZW4vYXJj
aC9hcm0vY29uZmlncy9yZW5lc2FzLmNvbmZpZyB8IDgwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9jb25maWdzL3JlbmVzYXMuY29uZmlnCj4KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2NvbmZpZ3MvcmVuZXNhcy5jb25maWcgYi94ZW4vYXJj
aC9hcm0vY29uZmlncy9yZW5lc2FzLmNvbmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMC4uN2FkM2YxYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC9hcm0v
Y29uZmlncy9yZW5lc2FzLmNvbmZpZwo+IEBAIC0wLDAgKzEsODAgQEAKPiArIwo+ICsjIEF1dG9t
YXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgo+ICsjIFhlbi9hcm0gNC4xMS11
bnN0YWJsZSBDb25maWd1cmF0aW9uCj4gKyMKClRoaXMgaXMgbm93IHRoZSBzZWNvbmQgS2NvbmZp
ZyBmaWxlIHdlJ3ZlIGdvdCBhZGRlZCBpbnRvIHRoZSB0cmVlLsKgIEFzCndpdGggdGhlIFBWLXNo
aW0gY29uZmlnLCBrZWVwaW5nIGl0IHVwIHRvIGRhdGUgaXMgZ29pbmcgdG8gYmUgYSBsaXR0bGUK
dHJpY2t5LgoKSSB0aGluayB3ZSBlaXRoZXIgbmVlZCBhIHNjcmlwdCB0byBrZWVwIGFsbCBvZiB0
aGUgZW1iZWRkZWQgY29uZmlncyB1cAp0byBkYXRlLCBvciBzd2l0Y2ggdG8gYSBtb2RlbCAoc2lt
aWxhciB0byB0aGUgdHJhdmlzIHJhbmRjb25maWcgdGFyZ2V0KQp3aGVyZSBpdCBiZWNvbWVzIGEg
YG1ha2UgZGVmYXVsdGNvbmZpZ2Agd2l0aCBjZXJ0YWluIHNwZWNpZmljIG9wdGlvbnMKZm9yY2Vk
IG9uZSB3YXkgb3IgYW5vdGhlciAoc2ltaWxhciB0byBgbWFrZSB7dGlueSxrdm0seGVufWNvbmZp
Z2AgaW4KTGludXgpLsKgIFRoZSBsYXR0ZXIgbWVhbnMgdGhhdCB3ZSBvbmx5IHN0b3JlIHRoZSBz
cGVjaWZpYyBkZWx0YQphcHBsaWNhYmxlIGZvciBwdXJwb3NlLCBhbmQgaXQgd2lsbCBwcm9iYWJs
eSBjaGFuZ2UgbGVzcyBmcmVxdWVudGx5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
