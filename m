From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH RESEND 2/3] OvmfPkg/XenSupport: use a
 correct PCI host bridge aperture for BAR64
Date: Thu, 14 Mar 2019 17:44:24 +0000
Message-ID: <20190314174424.GC11621@perard.uk.xensource.com>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
 <1551876056-28223-3-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wnlz=RR=citrix.com=prvs=969ce9b1e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h4UP7-0006sS-Gf
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 17:44:29 +0000
Content-Disposition: inline
In-Reply-To: <1551876056-28223-3-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, edk2-devel@lists.01.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMTI6NDA6NTVQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gSW4gY2FzZSBCQVI2NCBpcyBwbGFjZWQgYmVsb3cgNEcgY2hvb3NlIHRoZSBjb3Jy
ZWN0IGFwZXJ0dXJlLgo+IFRoaXMgZml4ZXMgYSBmYWlsZWQgYXNzZXJ0aW9uIGRvd24gdGhlIGNv
ZGUgcGF0aC4KPiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBB
Z3JlZW1lbnQgMS4xCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhp
bmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gIE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGli
L1hlblN1cHBvcnQuYyB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhv
c3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VM
aWIvWGVuU3VwcG9ydC5jCj4gaW5kZXggYzIzYzQ2ZC4uNDA4ZmIyNCAxMDA2NDQKPiAtLS0gYS9P
dm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPiArKysgYi9Pdm1m
UGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPiBAQCAtMTQ1LDcgKzE0
NSwxMSBAQCBQY2F0UGNpUm9vdEJyaWRnZVBhcnNlQmFycyAoCj4gICAgICAgICAgICBMZW5ndGgg
PSBMZW5ndGggfCBMU2hpZnRVNjQgKChVSU5UNjQpIFVwcGVyVmFsdWUsIDMyKTsKPiAgICAgICAg
ICAgIExlbmd0aCA9ICh+TGVuZ3RoKSArIDE7Cj4gIAo+IC0gICAgICAgICAgTWVtQXBlcnR1cmUg
PSBNZW1BYm92ZTRHOwo+ICsgICAgICAgICAgaWYgKEJhc2UgPCAweDEwMDAwMDAwMCkgewoKWW91
IGNvdWxkIHVzZSB0aGUgbWFjcm8gQkFTRV80R0IgdG8gcmVwbGFjZSB0aGlzIDEgZm9sbG93ZWQg
YnkgYSBsb29vbmcKbGlzdCBvZiAwLgoKQW5kIHdpdGggdGhhdCBjaGFuZ2VkOgpBY2tlZC1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
