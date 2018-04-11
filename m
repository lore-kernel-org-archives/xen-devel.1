From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.11] x86/VT-x: Fix determination of
 EFER.LMA in vmcs_dump_vcpu()
Date: Wed, 11 Apr 2018 02:15:47 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1910E3666@SHSMSX101.ccr.corp.intel.com>
References: <1523296591-5414-1-git-send-email-andrew.cooper3@citrix.com>
 <5ACC955902000078001B9CD4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ACC955902000078001B9CD4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDEwLCAyMDE4IDQ6NDQgUE0KPiAKPiA+Pj4gT24gMDkuMDQuMTggYXQgMTk6
NTYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3ZtY3MuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5j
Cj4gPiBAQCAtMTc4OCw3ICsxNzg4LDEwIEBAIHZvaWQgdm1jc19kdW1wX3ZjcHUoc3RydWN0IHZj
cHUgKnYpCj4gPiAgICAgIHZtZW50cnlfY3RsID0gdm1yMzIoVk1fRU5UUllfQ09OVFJPTFMpLAo+
ID4gICAgICB2bWV4aXRfY3RsID0gdm1yMzIoVk1fRVhJVF9DT05UUk9MUyk7Cj4gPiAgICAgIGNy
NCA9IHZtcihHVUVTVF9DUjQpOwo+ID4gLSAgICBlZmVyID0gdm1yKEdVRVNUX0VGRVIpOwo+ID4g
Kwo+ID4gKyAgICAvKiBFRkVSLkxNQSBpcyByZWFkIGFzIHplcm8sIGFuZCBpcyBsb2FkZWQgZnJv
bSB2bWVudHJ5X2N0bCBvbiBlbnRyeS4KPiAqLwo+ID4gKyAgICBCVUlMRF9CVUdfT04oVk1fRU5U
UllfSUEzMkVfTU9ERSA8PCAxICE9IEVGRVJfTE1BKTsKPiA+ICsgICAgZWZlciA9IHZtcihHVUVT
VF9FRkVSKSB8ICgodm1lbnRyeV9jdGwgJiBWTV9FTlRSWV9JQTMyRV9NT0RFKQo+IDw8IDEpOwo+
IAo+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IC0gZGVzcGl0ZSB0aGUgQlVJTERfQlVHX09OKCkgLSBJ
IGRpc2xpa2UgdGhlCj4gbGl0ZXJhbCAxIGhlcmUsIHdoaWNoIHdvdWxkIGJldHRlciBiZQo+IChf
RUZFUl9MTUEgLSBfVk1fRU5UUllfSUEzMkVfTU9ERSksIGFsYmVpdCB0aGUgbGF0dGVyIGRvZXNu
J3QKPiBleGlzdCwgc28gcGVyaGFwcwo+IAo+ICAgICBlZmVyID0gdm1yKEdVRVNUX0VGRVIpIHwg
KCh2bWVudHJ5X2N0bCAmIFZNX0VOVFJZX0lBMzJFX01PREUpICoKPiAoRUZFUl9MTUEgLyBWTV9F
TlRSWV9JQTMyRV9NT0RFKSk7Cj4gCj4gb3IgdGhlIHNhbWUgZXhwcmVzc2VkIHRocm91Z2ggTUFT
S19FWFRSKCkgLyBNQVNLX0lOU1IoKT8gQnV0Cj4gaXQncyB0aGUgVk1YIG1haW50YWluZXJzIHRv
IGp1ZGdlIGFueXdheS4KPiAKCnVzaW5nIDEgaXMgZmluZSB0byBtZSwgd2l0aCBpbnRlbnRpb24g
d2VsbCBleHBsYWluZWQgd2l0aCBCVUlMRF9CVUdfT04uCmFzIGxvbmcgYXMgQlVJTERfQlVHX09O
IGlzIHN0aWxsIGEgdmFsaWQgdXNhZ2UsIEknbSBPSyB3aXRoIGN1cnJlbnQgb25lOgoKQWNrZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKVGhhbmtzCmtldmluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
