From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH RFC] VMX: fix vmx_handle_eoi()
Date: Fri, 19 Oct 2018 22:30:15 +0800
Message-ID: <20181019143010.GA24016@gao-cwp>
References: <5BC06A4B02000078001F0EE0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=18go=m7=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1gDVjg-0002VF-Lv
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:26:44 +0000
Content-Disposition: inline
In-Reply-To: <5BC06A4B02000078001F0EE0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDM6MzI6NTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5JbiBjb21taXQgMzAzMDY2ZmRiMWUgKCJWTVg6IGZpeCBpbnRlcmFjdGlvbiBvZiBBUElD
LVYgYW5kIFZpcmlkaWFuCj5lbXVsYXRpb24iKSBJIHNjcmV3ZWQgdXAgcXVpdGUgaGVhdmlseTog
SW5zdGVhZCBvZiBjbGVhcmluZyBTVkksIFJWSSB3YXMKPmNsZWFyZWQuIEZ1cnRoZXJtb3JlLCB1
bmNvbmRpdGlvbmFsIGNsZWFyaW5nIG9mIFNWSSBpcyB3cm9uZyB0b28gLSBvdGhlcgo+SVNSIGJp
dHMgc2hvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPgo+SW50cm9kdWNlIGEgbmV3IGhlbHBl
ciBzZXRfc3ZpKCksIHNwbGl0IG91dCBvZiB2bXhfcHJvY2Vzc19pc3IoKSwgYW5kCj51c2UgaXQg
YWxzbyBmcm9tIHZteF9oYW5kbGVfZW9pKCkuCj4KPkZvbGxvd2luZyB0aGUgcHJvYmxlbXMgaW4g
dm14X2ludHJfYXNzaXN0KCkgKHNlZSB0aGUgc3RpbGwgcHJlc2VudCBiaWcKPmJsb2NrIG9mIGRl
YnVnZ2luZyBjb2RlIHRoZXJlKSBhbHNvIHdhcm4gKG9uY2UpIGlmIEVPSSdkIHZlY3RvciBhbmQK
Pm9yaWdpbmFsIFNWSSBkb24ndCBtYXRjaC4KPgo+U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKQWZ0ZXIgY29ycmVjdGluZyB0aGUgZGVzY3JpcHRpb24gaW4g
dGhlIGZpcnN0IHBhcmFncmFwaAoKUmV2aWV3ZWQtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRl
bC5jb20+CgpJIGFtIGN1cmlvdXMgYWJvdXQgaW4gd2hpY2ggY2FzZSwgdGhlIEVPSSdkIHZlY3Rv
ciBkaWZmZXJzIGZyb20gb3JpZ2luYWwgU1ZJLgpUaGUgc29sZSBjYWxsZXIgb2Ygdm14X2hhbmRs
ZV9lb2koKSBpcyB2bGFwaWNfRU9JX3NldCgpLCB3aGVyZSB0aGUgaGlnaGVzdCBiaXQKb2YgQVBJ
Q19JU1IgaXMgYXNzaWduZWQgdG8gRU9JJ2QgdmVjdG9yLiBTbyBpdCBtZWFucyB0aGUgU1ZJIGlz
bid0IGVxdWFsIHRvCnRoZSBoaWdoZXN0IGJpdCBpbiBBUElDX0lTUi4gQnV0IFNETSBzYXlzICJU
aGUgcHJvY2Vzc29yIHRyZWF0cyB0aGlzIHZhbHVlCihTVkkpIGFzIHRoZSBoaWdoZXN0IHByaW9y
aXR5IHZpcnR1YWwgaW50ZXJydXB0IHRoYXQgaXMgaW4gc2VydmljZSIuIE1heWJlIGluCnNvbWUg
cGxhY2VzLCBzb2Z0d2FyZSBvciBoYXJkd2FyZSAoZm9yIGluc3RhbmNlLCB3aGVuIHBlcmZvcm1p
bmcgdmlydHVhbAppbnRlcnJ1cHQgZGVsaXZlcnksIFNWSSBnb3QgdXBkYXRlZCB3aXRob3V0IGNv
bXBhcmluZyB3aXRoIHRoZSBjdXJyZW50IFNWSSkKZmFpbHMgdG8gbWFrZSBTVkkgYWx3YXlzIGVx
dWFsIHRvIHRoZSBoaWdoZXN0IGJpdCBvZiBBUElDX0lTUi4KClRoYW5rcwpDaGFvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
