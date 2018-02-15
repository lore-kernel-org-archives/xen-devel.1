From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 0/4] Use INVPCID to flush global mappings
Date: Thu, 15 Feb 2018 16:38:42 +0100
Message-ID: <d0830e46-106d-29cb-aace-bfdfaa4c35d0@suse.com>
References: <20180215121040.20585-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nc0x=fj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1emLce-000768-7V
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 15:38:56 +0000
In-Reply-To: <20180215121040.20585-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMTggMTM6MTAsIFdlaSBMaXUgd3JvdGU6Cj4gSSB3cm90ZSB0aGVzZSBwYXRjaGVz
IHNvbWV0aW1lIGFnbyB0byBleHBsb3JlIFBDSUQgYW5kIElOVlBDSUQuIEkgaGF2ZW4ndAo+IHRo
b3VnaHQgdGhyb3VnaCB3aGV0aGVyIGhvdyB0byB1c2UgYm90aCBpbiBYZW4geWV0LiBCdXQgc2Vl
aW5nIEp1ZXJnZW4gbGFpZCBvdXQKPiBoaXMgdGhvdWdodCBvbiBQQ0lEIGFuZCBJTlZQQ0lEIEkg
dGhpbmsgc29tZSBvZiB0aGUgcGF0Y2hlcyBjYW4gYmUgdXNlZnVsLgo+IAo+IEkgaGFkIGRvbmUg
c29tZSBiZW5jaG1hcmsgb24gdGhlIHNwZWVkIGluIG9uZSBvZiBteSBvbGRlciBicmFuY2ggYnkg
aW5zZXJ0aW5nCj4gc29tZSB0cmFjZSBwb2ludHMgYmVmb3JlIGFuZCBhZnRlciB0aGUgZmx1c2gu
IEl0IHNob3dlZCB0aGF0IHR3aWRkbGluZyBDUjQuUEdFCj4gaXMgMyB0byA1IHRpbWVzIHNsb3dl
ciB0aGFuIGludnBjaWQuCj4gCj4gVGhpcyBzZXJpZXMgaXMgaW4gaW5jb21wbGV0ZSAtLSBvYnZp
b3VzbHkgd2UgaGF2ZSBDUjQuUEdFIHR3aWRkbGluZyBpbiBhIGZldwo+IG90aGVyIHBsYWNlcy4g
QnV0IGlmIHlvdSB0aGluayBpdCBpcyBiZW5lZmljaWFsIEkgY2FuIHRyeSB0byBjb252ZXJ0IHRo
b3NlCj4gcGxhY2VzIGFzIHdlbGwuCgpJIGp1c3QgZGlkIGEgbGl0dGxlIGV4cGVyaW1lbnQgYnkg
cmVwbGFjaW5nIHRoZSAlY3I0IGJhc2VkIFRMQiBmbHVzaCBpbgpKYW4ncyBYUFRJIHBhdGNoZXMg
YnkgaW52cGNpZCwgb24gdG9wIG9mIG15IGxhc3QgWFBUSSBzcGVlZHVwIHBhdGNoIChubwpmYW5j
eSBBTFRFUk5BVElWRSwganVzdCBhIHBsYWluIHJlcGxhY2VtZW50KS4KCkRvaW5nIGEgcGFyYWxs
ZWwgYnVpbGQgb2YgdGhlIGh5cGVydmlzb3IgaW4gZG9tMCBzaG93ZWQgZm9sbG93aW5nIGRhdGE6
CgogICAgICAgICAgICAgICAgcmVhbCAgICAgIHVzZXIgICAgICBzeXMKeHB0aT1ubyAgICAgICAg
IDYxLjIgICAgIDE2Ny43ICAgICA3MS45CnhwdGk9eWVzICAgICAgIDExMi4xICAgICAxNzAuMSAg
ICAxNDEuOAogKyBteSBzcGVlZHVwICAxMDMuMCAgICAgMTcxLjIgICAgMTMxLjIKICArIGludnBj
aWQgICAgIDk5LjAgICAgIDE3MC4yICAgIDEyMi4wCgpTbyBzeXN0ZW0gdGltZSByZWR1Y3Rpb24g
ZHVlIHRvIGludnBjaWQgaXMgcXVpdGUgbmljZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
