From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 3/5] x86/cpuid: update signature of
 hvm_cr4_guest_valid_bits()
Date: Wed, 21 Mar 2018 20:49:17 +0000
Message-ID: <94c28999-03a1-bcc8-5f50-b3d35d05fe44@citrix.com>
References: <20180228160948.6313-1-sergey.dyasli@citrix.com>
 <20180228160948.6313-4-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180228160948.6313-4-sergey.dyasli@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOCAxNjowOSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+
IGluZGV4IGFhMDUwNTAzNmIuLjQ4NTZhZDdjMjQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+IEBAIC0x
Njk5LDcgKzE2OTksNyBAQCBzdGF0aWMgdm9pZCB2bXhfdXBkYXRlX2d1ZXN0X2NyKHN0cnVjdCB2
Y3B1ICp2LCB1bnNpZ25lZCBpbnQgY3IpCj4gICAgICAgICAgICAgICAqIGJpdHMgdGhhdCBhcmUg
Y29udHJvbGxlZCBieSB0aGUgaHlwZXJ2aXNvci4KPiAgICAgICAgICAgICAgICovCj4gICAgICAg
ICAgICAgIHYtPmFyY2guaHZtX3ZteC5jcjRfaG9zdF9tYXNrID0gSFZNX0NSNF9IT1NUX01BU0sg
fCBYODZfQ1I0X1BLRSB8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfmh2bV9jcjRfZ3Vlc3RfdmFsaWRfYml0cyh2LCAwKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH5odm1fY3I0X2d1ZXN0X3ZhbGlkX2JpdHModi0+ZG9t
YWluLCAwKTsKCkluZGVudGF0aW9uIGhlcmUgbG9va3MgZmlzaHkuwqAgUGxlYXNlIGFkZCBzb21l
IGJyYWNrZXRzIGFyb3VuZCB0aGUKZXhwcmVzc2lvbiwgYW5kIDAgPT4gZmFsc2UuwqAgQWx0ZXJu
YXRpdmVseSwgcmVmbG93IHRoZSBleHByZXNzaW9uIHRvCmhhdmUgYSBsaW5lYnJlYWsgYWZ0ZXIg
dGhlID0uCgpPdGhlcndpc2UsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKPiAgICAgICAgICAgICAgdi0+YXJjaC5odm1fdm14LmNyNF9ob3N0
X21hc2sgfD0gdi0+YXJjaC5odm1fdm14LnZteF9yZWFsbW9kZSA/Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9DUjRfVk1FIDogMDsKPiAgICAgICAg
ICAgICAgdi0+YXJjaC5odm1fdm14LmNyNF9ob3N0X21hc2sgfD0gIWh2bV9wYWdpbmdfZW5hYmxl
ZCh2KSA/Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
