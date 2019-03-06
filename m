From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH RESEND 3/3] OvmfPkg/XenSupport: turn off
 address decoding before BAR sizing
Date: Wed, 6 Mar 2019 18:39:34 +0100
Message-ID: <92d242f1-5f46-d4ba-dc0d-a298557bf6ea@redhat.com>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
 <1551876056-28223-4-git-send-email-igor.druzhinin@citrix.com>
 <e8cdf4a2-b02b-daa7-4301-803fb1e0086d@redhat.com>
 <9b193263-06b1-b344-2ef3-5bd42e856c63@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mlj6=RJ=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1h1aW4-0007fm-36
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 17:39:40 +0000
In-Reply-To: <9b193263-06b1-b344-2ef3-5bd42e856c63@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, edk2-devel@lists.01.org
Cc: anthony.perard@citrix.com, jordan.l.justen@intel.com, julien.grall@arm.com, xen-devel@lists.xenproject.org, ard.biesheuvel@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDYvMTkgMTU6MjYsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDA2LzAzLzIwMTkg
MTM6MjIsIExhc3psbyBFcnNlayB3cm90ZToKPj4gT24gMDMvMDYvMTkgMTM6NDAsIElnb3IgRHJ1
emhpbmluIHdyb3RlOgo+Pj4gT24gWGVuLCBodm1sb2FkZXIgZmlybXdhcmUgbGVhdmVzIGFkZHJl
c3MgZGVjb2RpbmcgZW5hYmxlZCBmb3IKPj4+IGVudW1lcmF0ZWQgUENJIGRldmljZSBiZWZvcmUg
anVtcGluZyBpbnRvIE9WTUYuIE9WTUYgc2VlbXMgdG8KPj4+IGV4cGVjdCBpdCB0byBiZSBkaXNh
YmxlZCBhbmQgdHJpZXMgdG8gc2l6ZSBQQ0kgQkFScyBpbiBzZXZlcmFsIHBsYWNlcwo+Pj4gd2l0
aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2VzIEJBUjY0LCBmb3IgZXhhbXBsZSwgYmVpbmcK
Pj4+IGluY29ycmVjdGx5IHBsYWNlZCBieSBRRU1VLgo+Pj4KPj4+IEZpeCBpdCBieSBkaXNhYmxp
bmcgUENJIGFkZHJlc3MgZGVjb2RpbmcgZXhwbGljaXRseSBiZWZvcmUgdGhlCj4+PiBmaXJzdCBh
dHRlbXB0IHRvIHNpemUgQkFScyBvbiBYZW4uCj4+Pgo+Pj4gQ29udHJpYnV0ZWQtdW5kZXI6IFRp
YW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQo+Pj4gU2lnbmVkLW9mZi1ieTogSWdv
ciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+ICBPdm1m
UGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMgfCAzNCArKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5T
dXBwb3J0LmMgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMK
Pj4+IGluZGV4IDQwOGZiMjQuLjk5NDAzMzUgMTAwNjQ0Cj4+PiAtLS0gYS9Pdm1mUGtnL0xpYnJh
cnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPj4+ICsrKyBiL092bWZQa2cvTGlicmFy
eS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYwo+Pj4gQEAgLTU1LDYgKzU1LDMzIEBAIFBj
YXRQY2lSb290QnJpZGdlQmFyRXhpc3RlZCAoCj4+PiAgICBFbmFibGVJbnRlcnJ1cHRzICgpOwo+
Pj4gIH0KPj4+ICAKPj4+ICsjZGVmaW5lIEVGSV9QQ0lfQ09NTUFORF9ERUNPREUgKChVSU5UMTYp
KEVGSV9QQ0lfQ09NTUFORF9JT19TUEFDRSB8IFwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEVGSV9QQ0lfQ09NTUFORF9NRU1PUllfU1BBQ0UpKQo+Pgo+PiBJ
IHRob3VnaHQgSSBhc2tlZCB5b3Ugbm90IHRvIGRlZmluZSBhIG1hY3JvIGhlcmUgdGhhdCBzdGFy
dGVkIHdpdGggdGhlCj4+ICJFRklfIiBwcmVmaXggOi8KPj4KPj4gaHR0cDovL21pZC5tYWlsLWFy
Y2hpdmUuY29tL2RkOGUzYzllLWNiNzYtZDNmZS02YTEwLWMwYTQxYzcxNGI1NkByZWRoYXQuY29t
Cj4+Cj4gCj4gVGhpcyBpcyBhIHJlc2VuZCBvZiB2MSBwYXRjaCBzZXJpZXMgdG8gZ2V0IFhlbiBm
b2xrcyBpbnRvIENDIGFuZCBnYXRoZXIKPiBjb21tZW50cy4gSSBleHBlY3QgdjIuCgpNeSBiYWQs
IHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIE9uIGVkazItZGV2ZWwgd2UgdmVyeSByYXJl
bHkgcG9zdApSRVNFTkRzIHdpdGhvdXQgdXBkYXRlcywgYW5kIHNvIEkgbWlzc2VkIHRoZSBpbXBs
aWNhdGlvbnMgbm93LgoKVGhhbmtzCkxhc3psbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
