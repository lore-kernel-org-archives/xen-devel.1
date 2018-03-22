From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 2/5] x86/msr: add VMX MSRs into HVM_max
 domain policy
Date: Thu, 22 Mar 2018 10:22:47 +0000
Message-ID: <47ac5213-4fb6-ea4a-c422-9ae43081e602@citrix.com>
References: <20180228160948.6313-1-sergey.dyasli@citrix.com>
 <20180228160948.6313-3-sergey.dyasli@citrix.com>
 <37d4decd-1aa5-16e8-ba80-f2fb561bd124@citrix.com>
 <1521713698.3556.4.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521713698.3556.4.camel@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDMvMjAxOCAxMDoxNCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBPbiBXZWQsIDIwMTgt
MDMtMjEgYXQgMjA6NDYgKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDI4LzAyLzIw
MTggMTY6MDksIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+PiArCj4+PiArICAgIGRwLT52bXgucGlu
YmFzZWRfY3Rscy5hbGxvd2VkXzAucmF3ID0gVk1YX1BJTkJBU0VEX0NUTFNfREVGQVVMVDE7Cj4+
PiArICAgIGRwLT52bXgucGluYmFzZWRfY3Rscy5hbGxvd2VkXzEucmF3ID0gVk1YX1BJTkJBU0VE
X0NUTFNfREVGQVVMVDE7Cj4+PiArICAgIHN1cHBvcnRlZCA9IFBJTl9CQVNFRF9FWFRfSU5UUl9N
QVNLIHwKPj4+ICsgICAgICAgICAgICAgICAgUElOX0JBU0VEX05NSV9FWElUSU5HICAgfAo+Pj4g
KyAgICAgICAgICAgICAgICBQSU5fQkFTRURfUFJFRU1QVF9USU1FUjsKPj4gUGxlYXNlIGhhdmUg
YSBzaW5nbGUgc2V0IG9mIGJyYWNrZXRzIGFyb3VuZCB0aGUgZW50aXJlIG9yIHN0YXRlbWVudCwg
c28KPj4gZWRpdG9ycyB3aWxsIGluZGVudCBuZXcgY2hhbmdlcyBjb3JyZWN0bHkuCj4gV2hpY2gg
ZWRpdG9ycz8KCkFueSBlZGl0b3Igd2hpY2ggY2FuIHJlYWQgdGhlIGZpbGUgYW5ub3RhdGlvbiBz
dGF0aW5nIEJTRCBzdHlsZSwgd2hpY2gKcmVzdWx0cyBpbgoKc3VwcG9ydGVkID0gUElOX0JBU0VE
X0VYVF9JTlRSX01BU0sgfArCoMKgwqAgUElOX0JBU0VEX05NSV9FWElUSU5HIHwKCmJ5IGRlZmF1
bHQuCgo+ICBNeSBlZGl0b3IgaXMgZG9pbmcgaXQgZmluZS4gQW55d2F5LCBpcyB0aGlzIHdoYXQg
eW91IGFyZQo+IGFza2luZyBmb3I/Cj4KPiAgICAgc3VwcG9ydGVkID0gKFBJTl9CQVNFRF9FWFRf
SU5UUl9NQVNLIHwKPiAgICAgICAgICAgICAgICAgIFBJTl9CQVNFRF9OTUlfRVhJVElORyAgIHwK
PiAgICAgICAgICAgICAgICAgIFBJTl9CQVNFRF9QUkVFTVBUX1RJTUVSKTsKPgoKWWVzLsKgIFRo
YXQncyBncmVhdCB0aGFua3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
