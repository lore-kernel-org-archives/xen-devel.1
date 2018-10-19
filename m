From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 11/16] x86: don't set sysenter_entry in
 vmcs when !CONFIG_PV
Date: Fri, 19 Oct 2018 17:16:24 +0100
Message-ID: <0ec0672b-07e2-2112-0811-4a5a86d5998e@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
 <fc4a7924-ebbf-8b42-5f64-eca84185b0e7@citrix.com>
 <20181019160052.hicouiiiamffndrs@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDXRs-0008Ok-8R
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 16:16:28 +0000
In-Reply-To: <20181019160052.hicouiiiamffndrs@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTc6MDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTksIDIwMTgg
YXQgMDQ6NDI6MjRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMTAvMTgg
MTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4+PiBUaGUgc3ltYm9sIHdpbGwgbm90IGJlIGF2YWlsYWJs
ZSB3aGVuIFBWIGlzIGRpc2FibGVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+IHYyOiBuZXcKPj4+IC0tLQo+Pj4gIHhlbi9h
cmNoL3g4Ni9odm0vdm14L3ZtY3MuYyB8IDcgKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dm1jcy5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCj4+PiBpbmRleCBkOTc0N2I0Li4y
ODI2NzdhIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMKPj4+IEBAIC0xMTU5LDkgKzExNTksMTYg
QEAgc3RhdGljIGludCBjb25zdHJ1Y3Rfdm1jcyhzdHJ1Y3QgdmNwdSAqdikKPj4+ICAgICAgX192
bXdyaXRlKEhPU1RfQ1NfU0VMRUNUT1IsIF9fSFlQRVJWSVNPUl9DUyk7Cj4+PiAgICAgIF9fdm13
cml0ZShIT1NUX1JJUCwgKHVuc2lnbmVkIGxvbmcpdm14X2FzbV92bWV4aXRfaGFuZGxlcik7Cj4+
PiAgCj4+PiArI2lmZGVmIENPTkZJR19QVgo+Pj4gICAgICAvKiBIb3N0IFNZU0VOVEVSIENTOlJJ
UC4gKi8KPj4+ICAgICAgX192bXdyaXRlKEhPU1RfU1lTRU5URVJfQ1MsIF9fSFlQRVJWSVNPUl9D
Uyk7Cj4+PiAgICAgIF9fdm13cml0ZShIT1NUX1NZU0VOVEVSX0VJUCwgKHVuc2lnbmVkIGxvbmcp
c3lzZW50ZXJfZW50cnkpOwo+Pj4gKyNlbHNlCj4+PiArICAgIC8qCj4+PiArICAgICAqIFNob3Vs
ZCBzb21ldGhpbmcgYmUgcHV0IGhlcmUgZm9yIGRlYnVnZ2luZyBwdXJwb3NlPyBXZSBuZXZlcgo+
Pj4gKyAgICAgKiBzZXQgaXQgdXAgaW4gdGhlIGZpcnN0IHBsYWNlLgo+PiBXaXRoIE1TUl9TWVNF
TlRFUl9DUyBzZXQgdG8gMCwgU1lTRU5URVIvU1lTRVhJVCBpbnN0cnVjdGlvbnMKPj4gYXV0b21h
dGljYWxseSAjR1BbMF0uCj4gT0suIFNvIHdlIHNob3VsZCBpbml0aWFsaXNlIE1TUl9TWVNFTlRF
Ul9DUyB0byAwIGluIGEgcHJldmlvdXMgcGF0Y2guCgpZZXMsIGJ1dCBub3QgZm9yIHRoaXMgcmVh
c29uLsKgIHZtZXhpdCBvbiBJbnRlbCBzeXN0ZW1zIHVuaWxhdGVyYWxseQpsb2FkcyB0aGUgdHdv
IEhPU1QgU1lTRU5URVIgTVNScywgc28gd2lsbCBjbG9iYmVyIHdoYXRldmVyIHdhcwpwcmV2aW91
c2x5IHRoZXJlLsKgIChUaGVyZSBpc24ndCBldmVuIGFuIG9wdGlvbiB0byB0dXJuIHRoaXMgb2Zm
IHRvIHNwZWVkCnVwIHZtZW50cnkvdm1leGl0KS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
