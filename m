From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 11/16] x86: don't set sysenter_entry in
 vmcs when !CONFIG_PV
Date: Fri, 19 Oct 2018 16:42:24 +0100
Message-ID: <fc4a7924-ebbf-8b42-5f64-eca84185b0e7@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDWux-00047B-D4
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:42:27 +0000
In-Reply-To: <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gVGhlIHN5bWJvbCB3aWxsIG5vdCBi
ZSBhdmFpbGFibGUgd2hlbiBQViBpcyBkaXNhYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6IG5ldwo+IC0tLQo+ICB4ZW4vYXJj
aC94ODYvaHZtL3ZteC92bWNzLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYyBi
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwo+IGluZGV4IGQ5NzQ3YjQuLjI4MjY3N2EgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm1jcy5jCj4gQEAgLTExNTksOSArMTE1OSwxNiBAQCBzdGF0aWMgaW50IGNv
bnN0cnVjdF92bWNzKHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgX192bXdyaXRlKEhPU1RfQ1NfU0VM
RUNUT1IsIF9fSFlQRVJWSVNPUl9DUyk7Cj4gICAgICBfX3Ztd3JpdGUoSE9TVF9SSVAsICh1bnNp
Z25lZCBsb25nKXZteF9hc21fdm1leGl0X2hhbmRsZXIpOwo+ICAKPiArI2lmZGVmIENPTkZJR19Q
Vgo+ICAgICAgLyogSG9zdCBTWVNFTlRFUiBDUzpSSVAuICovCj4gICAgICBfX3Ztd3JpdGUoSE9T
VF9TWVNFTlRFUl9DUywgX19IWVBFUlZJU09SX0NTKTsKPiAgICAgIF9fdm13cml0ZShIT1NUX1NZ
U0VOVEVSX0VJUCwgKHVuc2lnbmVkIGxvbmcpc3lzZW50ZXJfZW50cnkpOwo+ICsjZWxzZQo+ICsg
ICAgLyoKPiArICAgICAqIFNob3VsZCBzb21ldGhpbmcgYmUgcHV0IGhlcmUgZm9yIGRlYnVnZ2lu
ZyBwdXJwb3NlPyBXZSBuZXZlcgo+ICsgICAgICogc2V0IGl0IHVwIGluIHRoZSBmaXJzdCBwbGFj
ZS4KCldpdGggTVNSX1NZU0VOVEVSX0NTIHNldCB0byAwLCBTWVNFTlRFUi9TWVNFWElUIGluc3Ry
dWN0aW9ucwphdXRvbWF0aWNhbGx5ICNHUFswXS4KCkkgZG9uJ3QgdGhpbmsgd2UgbmVlZCBhbnl0
aGluZyBoZXJlIGluIHRoZSAhUFYgY2FzZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
