From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 1/2] x86/hvm: introduce cr{0,
 4}_host_mask to store trapped bits of CR accesses
Date: Tue, 20 Feb 2018 19:23:44 -0500
Message-ID: <9e4a1ca2-c855-8132-825c-f0efbd66d99a@oracle.com>
References: <20180220085647.25459-1-roger.pau@citrix.com>
 <20180220085647.25459-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=caxp=fp=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eoIBs-0002XT-Tl
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 00:23:20 +0000
In-Reply-To: <20180220085647.25459-2-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjAvMjAxOCAwMzo1NiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEF0IHRoZSBt
b21lbnQgdGhpcyBpcyBjdXJyZW50bHkgc2V0IGF0IFZNQ3tTL0J9IGNyZWF0aW9uIGFuZCBub3Qg
Y2hhbmdlZCwKPiBidXQgZnVydGhlciBwYXRjaGVzIGFyZSBnb2luZyB0byBjaGFuZ2UgdGhlIENS
NCBtYXNrIGF0IHJ1bnRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVl
LnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENj
OiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ2M6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gSW50
cm9kdWNlIG1hc2tzIG9ubHkgZm9yIENSNCBhbmQgQ1IwLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToK
PiAgLSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS92
bWNiLmMgICAgfCAxICsKPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jICAgIHwgMSArCj4g
IHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaCB8IDQgKysrKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L3ZtY2IuYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3ZtY2IuYwo+IGluZGV4IDBlNmNiYTViN2Iu
LmJlZWFmYWQyMzUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jCj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jCj4gQEAgLTE2OSw2ICsxNjksNyBAQCBz
dGF0aWMgaW50IGNvbnN0cnVjdF92bWNiKHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgdm1jYi0+dHIu
YmFzZSA9IDA7Cj4gICAgICB2bWNiLT50ci5saW1pdCA9IDB4ZmY7Cj4gIAo+ICsgICAgdi0+YXJj
aC5odm1fdmNwdS5jcjBfaG9zdF9tYXNrID0gdi0+YXJjaC5odm1fdmNwdS5jcjRfaG9zdF9tYXNr
ID0gfjBVTDsKPiAgICAgIHYtPmFyY2guaHZtX3ZjcHUuZ3Vlc3RfY3JbMF0gPSBYODZfQ1IwX1BF
IHwgWDg2X0NSMF9FVDsKPiAgICAgIGh2bV91cGRhdGVfZ3Vlc3RfY3IodiwgMCk7CgoKSXMgdGhl
cmUgYSByZWFzb24gZm9yIHNldHRpbmcgdGhvc2UgZmllbGRzPyBTVk0gd29uJ3QgdXNlIHRoZW0s
IHdpbGwgaXQ/CgoKLWJvcmlzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
