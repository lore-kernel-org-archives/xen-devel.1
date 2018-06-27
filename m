From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/6] x86/msr: Clean up the
 MSR_FEATURE_CONTROL constants
Date: Wed, 27 Jun 2018 13:21:41 +0200
Message-ID: <20180627112141.teih5co7abnn4kig@mac.bytemobile.com>
References: <1530019098-7058-1-git-send-email-andrew.cooper3@citrix.com>
 <1530019098-7058-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1530019098-7058-5-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDI6MTg6MTZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgZXhpc3RpbmcgYml0IG5hbWVzIGFyZSBleGNlc3NpdmVseSBsb25nICg0NSBj
aGFycyEpLCBhbmQgY2FuIGJlIHRyaW1tZWQKPiBkb3duIHN1YnN0YW50aWFsbHkuICBEcm9wIHRo
ZSBJQTMyIHByZWZpeCBhbmQgYWJicmV2aWF0ZSBGRUFUVVJFX0NPTlRST0wgdG8KPiBGRUFUX0NU
TC4gIEZ1cnRoZXJtb3JlLCBhbGwgb2YgdGhlc2UgYXJlIGZlYXR1cmUgZW5hYmxlbWVudCBiaXRz
LCBzbyBkcm9wCj4gRU5BQkxFL09OIHBhcnRzIG9mIHRoZSBjb25zdGFudHMuCj4gCj4gV2hpbGUg
YWx0ZXJpbmcgYWxsIHRoZSB1c2VycywgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gaW50cm9kdWNl
IGNwdV9oYXNfc214Cj4gYW5kIGNsZWFuIHVwIF92bXhfY3B1X3VwKCkgd2l0aCByZXNwZWN0IHRv
IGl0cyBNU1JfRkVBVFVSRV9DT05UUk9MIGhhbmRsaW5nLgo+IAo+IFRoZSBTRU5URVIgY29uc3Rh
bnRzIGFyZSB1bnJlZmVyZW5jZWQgYW5kIGRyb3BwZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZtY3MuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwo+IGlu
ZGV4IDg4NGM2NzIuLjk1YTBlMzcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dm1jcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCj4gQEAgLTYxMCw5ICs2
MTAsOSBAQCB2b2lkIHZteF9jcHVfZGVhZCh1bnNpZ25lZCBpbnQgY3B1KQo+ICAKPiAgaW50IF92
bXhfY3B1X3VwKGJvb2wgYnNwKQo+ICB7Cj4gLSAgICB1MzIgZWF4LCBlZHg7Cj4gLSAgICBpbnQg
cmMsIGJpb3NfbG9ja2VkLCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gLSAgICB1NjQgY3Iw
LCB2bXhfY3IwX2ZpeGVkMCwgdm14X2NyMF9maXhlZDE7Cj4gKyAgICBpbnQgcmMsIGNwdSA9IHNt
cF9wcm9jZXNzb3JfaWQoKTsKCldoaWxlIHRoZXJlIHlvdSBjb3VsZCBzd2l0Y2ggY3B1IHRvIHVu
c2lnbmVkIGludC4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
