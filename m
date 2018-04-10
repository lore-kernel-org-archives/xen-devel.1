From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/VT-x: Fix determination of
 EFER.LMA in vmcs_dump_vcpu()
Date: Tue, 10 Apr 2018 02:43:37 -0600
Message-ID: <5ACC955902000078001B9CD4@prv1-mh.provo.novell.com>
References: <1523296591-5414-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1523296591-5414-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE4IGF0IDE5OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm1jcy5jCj4gQEAgLTE3ODgsNyArMTc4OCwxMCBAQCB2b2lkIHZtY3NfZHVt
cF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgdm1lbnRyeV9jdGwgPSB2bXIzMihWTV9FTlRS
WV9DT05UUk9MUyksCj4gICAgICB2bWV4aXRfY3RsID0gdm1yMzIoVk1fRVhJVF9DT05UUk9MUyk7
Cj4gICAgICBjcjQgPSB2bXIoR1VFU1RfQ1I0KTsKPiAtICAgIGVmZXIgPSB2bXIoR1VFU1RfRUZF
Uik7Cj4gKwo+ICsgICAgLyogRUZFUi5MTUEgaXMgcmVhZCBhcyB6ZXJvLCBhbmQgaXMgbG9hZGVk
IGZyb20gdm1lbnRyeV9jdGwgb24gZW50cnkuICovCj4gKyAgICBCVUlMRF9CVUdfT04oVk1fRU5U
UllfSUEzMkVfTU9ERSA8PCAxICE9IEVGRVJfTE1BKTsKPiArICAgIGVmZXIgPSB2bXIoR1VFU1Rf
RUZFUikgfCAoKHZtZW50cnlfY3RsICYgVk1fRU5UUllfSUEzMkVfTU9ERSkgPDwgMSk7CgpJIGhh
dmUgdG8gYWRtaXQgdGhhdCAtIGRlc3BpdGUgdGhlIEJVSUxEX0JVR19PTigpIC0gSSBkaXNsaWtl
IHRoZQpsaXRlcmFsIDEgaGVyZSwgd2hpY2ggd291bGQgYmV0dGVyIGJlCihfRUZFUl9MTUEgLSBf
Vk1fRU5UUllfSUEzMkVfTU9ERSksIGFsYmVpdCB0aGUgbGF0dGVyIGRvZXNuJ3QKZXhpc3QsIHNv
IHBlcmhhcHMKCiAgICBlZmVyID0gdm1yKEdVRVNUX0VGRVIpIHwgKCh2bWVudHJ5X2N0bCAmIFZN
X0VOVFJZX0lBMzJFX01PREUpICogKEVGRVJfTE1BIC8gVk1fRU5UUllfSUEzMkVfTU9ERSkpOwoK
b3IgdGhlIHNhbWUgZXhwcmVzc2VkIHRocm91Z2ggTUFTS19FWFRSKCkgLyBNQVNLX0lOU1IoKT8g
QnV0Cml0J3MgdGhlIFZNWCBtYWludGFpbmVycyB0byBqdWRnZSBhbnl3YXkuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
