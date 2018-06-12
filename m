From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 8/9] x86/vmx: Support removing MSRs from
 the host/guest load/save lists
Date: Tue, 12 Jun 2018 19:23:13 +0100
Message-ID: <e07908e9-aa7b-5ff8-696b-1a96b495c93e@citrix.com>
References: <1528483723-4128-1-git-send-email-andrew.cooper3@citrix.com>
 <1528483723-4128-9-git-send-email-andrew.cooper3@citrix.com>
 <5B1F83F802000078001CA440@prv1-mh.provo.novell.com>
 <ba237035-ce91-f068-238f-f37c4d12820b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ba237035-ce91-f068-238f-f37c4d12820b@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDYvMTggMTg6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTIvMDYvMTggMDk6
MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gKyAgICBlbmQgPSBzdGFydCArIHRvdGFsOwo+Pj4g
KyAgICBlbnQgPSBsb2NhdGVfbXNyX2VudHJ5KHN0YXJ0ICsgc3Vic3RhcnQsIHN0YXJ0ICsgc3Vi
ZW5kLCBtc3IpOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIChlbnQgPT0gZW5kKSB8fCAoZW50LT5pbmRl
eCAhPSBtc3IpICkKPj4+ICsgICAgICAgIHJldHVybiAtRVNSQ0g7Cj4+PiArCj4+PiArICAgIG1l
bW1vdmUoZW50LCBlbnQgKyAxLCBzaXplb2YoKmVudCkgKiAoZW5kIC0gZW50KSk7Cj4+IEFyZW4n
dCB5b3UgcnVubmluZyBvdmVyIHRoZSBlbmQgb2YgdGhlIGFycmF5IGJ5IDEgZW50cnkgaGVyZT8K
PiBlbnQgPT0gZW5kIGlzIGFuIGVycm9yIGNvbmRpdGlvbiBhYm92ZS7CoCBCeSB0aGlzIHBvaW50
LCBlbnQgaXMKPiBndWFyYW50ZWVkIHRvIGJlIDwgZW5kLgoKQWx0aG91Z2ggb24gZnVydGhlciBj
b25zaWRlcmF0aW9uLCB0aGUgc2l6ZSBwYXJhbWV0ZXIgc2hvdWxkIGJlIChlbmQgLQplbnQgLSAx
KSB0byBhdm9pZCBtb3ZpbmcgdGhlIGVudHJ5IGJleW9uZCB0aGUgZW5kIG9mIHRoZSBhcnJheS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
