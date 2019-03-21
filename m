From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH v6 10/12] microcode/intel: Writeback and
 invalidate caches before updating microcode
Date: Thu, 21 Mar 2019 11:08:41 +0000
Message-ID: <34e381e9-afa6-25ea-0854-43732feab582@citrix.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-11-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CAnn=RY=citrix.com=prvs=976851173=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1h6vZ9-0003m7-V2
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 11:08:55 +0000
In-Reply-To: <1552291056-20286-11-git-send-email-chao.gao@intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>, xen-devel@lists.xenproject.org
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>, "Borislav, Petkov" <bp@suse.de>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDMvMjAxOSAwNzo1NywgQ2hhbyBHYW8gd3JvdGU6Cj4gVXBkYXRpbmcgbWljcm9jb2Rl
IGlzIGxlc3MgZXJyb3IgcHJvbmUgd2hlbiBjYWNoZXMgaGF2ZSBiZWVuIGZsdXNoZWQgYW5kCj4g
ZGVwZW5kaW5nIG9uIHdoYXQgZXhhY3RseSB0aGUgbWljcm9jb2RlIGlzIHVwZGF0aW5nLiBGb3Ig
ZXhhbXBsZSwgc29tZQo+IG9mIHRoZSBpc3N1ZXMgYXJvdW5kIGNlcnRhaW4gQnJvYWR3ZWxsIHBh
cnRzIGNhbiBiZSBhZGRyZXNzZWQgYnkgZG9pbmcgYQo+IGZ1bGwgY2FjaGUgZmx1c2guCj4gCj4g
W2xpbnV4IGNvbW1pdDogOTFkZjlmZGY1MTQ5MmFlYzlmZWQ2YjRjYmQzMzE2MDg4Njc0MGY0N10K
PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+IENjOiBBc2hv
ayBSYWogPGFzaG9rLnJhakBpbnRlbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NjoKPiAgLSBu
ZXcKPiAtLS0KPiAgeGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jIHwgNiArKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbWljcm9jb2RlX2ludGVsLmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMK
PiBpbmRleCBjOTIxZWE5Li5kNWVmMTQ1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNy
b2NvZGVfaW50ZWwuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+IEBA
IC0zNTEsNiArMzUxLDEyIEBAIHN0YXRpYyBpbnQgYXBwbHlfbWljcm9jb2RlKHZvaWQpCj4gICAg
ICAvKiBzZXJpYWxpemUgYWNjZXNzIHRvIHRoZSBwaHlzaWNhbCB3cml0ZSB0byBNU1IgMHg3OSAq
Lwo+ICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJm1pY3JvY29kZV91cGRhdGVfbG9jaywgZmxhZ3Mp
Owo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBXcml0ZWJhY2sgYW5kIGludmFsaWRhdGUgY2FjaGVz
IGJlZm9yZSB1cGRhdGluZyBtaWNyb2NvZGUgdG8gYXZvaWQKPiArICAgICAqIGludGVybmFsIGlz
c3VlcyBkZXBlbmRpbmcgb24gd2hhdCB0aGUgbWljcm9jb2RlIGlzIHVwZGF0aW5nLgo+ICsgICAg
ICovCj4gKyAgICB3YmludmQoKTsKCldoaWxlIHRoaXMgaXMgYSB3b3JrYXJvdW5kIGZvciBhIHNw
ZWNpZmljIEJyb2Fkd2VsbCBlcnJhdHVtLCBkb2VzIHdiaW52ZApuZWVkIHRvIGJlIHBlcmZvcm1l
ZCB1bmNvbmRpdGlvbmFsbHkgZXZlcnl3aGVyZT8gSGlnaC1lbmQgWGVvbnMgaGF2ZQp1cCB0byAz
OC41TSBMMyBhbmQgMjhNIEwyLiBXaGF0IGlzIHRoZSB1cHBlciBib3VuZCBvZiB3YmludmQgbGF0
ZW5jeSBvbgpzdWNoIHN5c3RlbXM/Cgo+ICsKPiAgICAgIC8qIHdyaXRlIG1pY3JvY29kZSB2aWEg
TVNSIDB4NzkgKi8KPiAgICAgIHdybXNybChNU1JfSUEzMl9VQ09ERV9XUklURSwgKHVuc2lnbmVk
IGxvbmcpbWNfaW50ZWwtPmJpdHMpOwo+ICAgICAgd3Jtc3JsKE1TUl9JQTMyX1VDT0RFX1JFViwg
MHgwVUxMKTsKPiAKClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
