From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 11/16] x86: don't set sysenter_entry in
 vmcs when !CONFIG_PV
Date: Fri, 19 Oct 2018 17:00:52 +0100
Message-ID: <20181019160052.hicouiiiamffndrs@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
 <fc4a7924-ebbf-8b42-5f64-eca84185b0e7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDXCq-000749-CR
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 16:00:56 +0000
Content-Disposition: inline
In-Reply-To: <fc4a7924-ebbf-8b42-5f64-eca84185b0e7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDQ6NDI6MjRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8xMC8xOCAxNToyOCwgV2VpIExpdSB3cm90ZToKPiA+IFRoZSBzeW1ib2wg
d2lsbCBub3QgYmUgYXZhaWxhYmxlIHdoZW4gUFYgaXMgZGlzYWJsZWQuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gdjI6IG5l
dwo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jIHwgNyArKysrKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMK
PiA+IGluZGV4IGQ5NzQ3YjQuLjI4MjY3N2EgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bWNzLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwo+ID4g
QEAgLTExNTksOSArMTE1OSwxNiBAQCBzdGF0aWMgaW50IGNvbnN0cnVjdF92bWNzKHN0cnVjdCB2
Y3B1ICp2KQo+ID4gICAgICBfX3Ztd3JpdGUoSE9TVF9DU19TRUxFQ1RPUiwgX19IWVBFUlZJU09S
X0NTKTsKPiA+ICAgICAgX192bXdyaXRlKEhPU1RfUklQLCAodW5zaWduZWQgbG9uZyl2bXhfYXNt
X3ZtZXhpdF9oYW5kbGVyKTsKPiA+ICAKPiA+ICsjaWZkZWYgQ09ORklHX1BWCj4gPiAgICAgIC8q
IEhvc3QgU1lTRU5URVIgQ1M6UklQLiAqLwo+ID4gICAgICBfX3Ztd3JpdGUoSE9TVF9TWVNFTlRF
Ul9DUywgX19IWVBFUlZJU09SX0NTKTsKPiA+ICAgICAgX192bXdyaXRlKEhPU1RfU1lTRU5URVJf
RUlQLCAodW5zaWduZWQgbG9uZylzeXNlbnRlcl9lbnRyeSk7Cj4gPiArI2Vsc2UKPiA+ICsgICAg
LyoKPiA+ICsgICAgICogU2hvdWxkIHNvbWV0aGluZyBiZSBwdXQgaGVyZSBmb3IgZGVidWdnaW5n
IHB1cnBvc2U/IFdlIG5ldmVyCj4gPiArICAgICAqIHNldCBpdCB1cCBpbiB0aGUgZmlyc3QgcGxh
Y2UuCj4gCj4gV2l0aCBNU1JfU1lTRU5URVJfQ1Mgc2V0IHRvIDAsIFNZU0VOVEVSL1NZU0VYSVQg
aW5zdHJ1Y3Rpb25zCj4gYXV0b21hdGljYWxseSAjR1BbMF0uCgpPSy4gU28gd2Ugc2hvdWxkIGlu
aXRpYWxpc2UgTVNSX1NZU0VOVEVSX0NTIHRvIDAgaW4gYSBwcmV2aW91cyBwYXRjaC4KCldlaS4K
Cj4gCj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIGFueXRoaW5nIGhlcmUgaW4gdGhlICFQViBjYXNl
Lgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
