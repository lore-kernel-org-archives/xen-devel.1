From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH RFC] CODING_STYLE: document intended usage of
	types
Date: Mon, 19 Feb 2018 01:44:57 -0700
Message-ID: <5A8A9C9902000078001A8E64@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udnn=fn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1enh4O-0006zH-CH
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 08:45:08 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEvQ09E
SU5HX1NUWUxFCisrKyBiL0NPRElOR19TVFlMRQpAQCAtODgsNiArODgsMjYgQEAgQnJhY2VzIHNo
b3VsZCBiZSBvbWl0dGVkIGZvciBibG9ja3Mgd2l0aAogaWYgKCBjb25kaXRpb24gKQogICAgIHNp
bmdsZV9zdGF0ZW1lbnQoKTsKIAorVHlwZXMKKy0tLS0tCisKK1VzZSBiYXNpYyBDIHR5cGVzIGFu
ZCBDIHN0YW5kYXJkIG1hbmRhdGVkIHR5cGVkZWYtcyB3aGVyZSBwb3NzaWJsZSAoYW5kCit3aXRo
IHByZWZlcmVuY2UgaW4gdGhpcyBvcmRlcikuICBUaGlzIGluIHBhcnRpY3VsYXIgbWVhbnMgdG8g
YXZvaWQgdTgsCit1MTYsIGV0YyBkZXNwaXRlIHRob3NlIHR5cGVzIGNvbnRpbnVpbmcgdG8gZXhp
c3QgaW4gb3VyIGNvZGUgYmFzZS4KK0ZpeGVkIHdpZHRoIHR5cGVzIHNob3VsZCBvbmx5IGJlIHVz
ZWQgd2hlbiBhIGZpeGVkIHdpZHRoIHF1YW50aXR5IGlzCittZWFudCAod2hpY2ggZm9yIGV4YW1w
bGUgbWF5IGJlIGEgdmFsdWUgcmVhZCBmcm9tIG9yIHRvIGJlIHdyaXR0ZW4gdG8gYQorcmVnaXN0
ZXIpLgorCitXaGVuIHNpZ25lZG5lc3MgbWF0dGVycywgcXVhbGlmeSBwbGFpbiBjaGFyLCBzaG9y
dCwgaW50LCBsb25nLCBhbmQKK2xvbmcgbG9uZyB3aXRoICJzaWduZWQiIG9yICJ1bnNpZ25lZCIu
ICBTaWduZWRuZXNzIGlzIHNwZWNpZmljYWxseQorY29uc2lkZXJlZCB0byBtYXR0ZXIgd2hlbiB0
aGUgdmFsaWQgdmFsdWUgcmFuZ2Ugb2YgYSB2YXJpYWJsZSBjb3ZlcnMKK29ubHkgbm9uLW5lZ2F0
aXZlIHZhbHVlcy4gIFRoZSBwcmltZSBleGFtcGxlIG9mIHN1Y2ggaXMgYSB2YXJpYWJsZSB1c2Vk
Cit0byBpbmRleCBhbiBhcnJheSAobmVnYXRpdmUgYXJyYXkgaW5kZXhlcywgd2hpbGUgdGhleSBt
YXkgb2NjdXIsIGFyZQorcmF0aGVyIHJhcmUpLgorCitFc3BlY2lhbGx5IHdpdGggcG9pbnRlciB0
eXBlcywgd2hlbmV2ZXIgdGhlIHBvaW50ZWQgdG8gb2JqZWN0IGlzIG5vdAorKHN1cHBvc2VkIHRv
IGJlKSBtb2RpZmllZCwgcXVhbGlmeSB0aGUgcG9pbnRlZCB0byB0eXBlIHdpdGggImNvbnN0Ii4K
KwogQ29tbWVudHMKIC0tLS0tLS0tCiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
