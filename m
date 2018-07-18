From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Wed, 18 Jul 2018 10:36:35 +0100
Message-ID: <20180718093635.6xj53gmrpezy5p2t@citrix.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffisx-0003pa-F7
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:36:39 +0000
Content-Disposition: inline
In-Reply-To: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
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

T24gTW9uLCBKdWwgMTYsIDIwMTggYXQgMTA6NDY6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRm9yIGEgcmVhc29uIHRoYXQgSSBjYW4ndCBleHBsYWluLCBpdCBpcyBvbmx5IHRoZSBz
aGltIGJ1aWxkIHRoYXQgZmFpbHMKPiBmb3IgbWUgd2l0aCBhbiBvbGRlciBnY2MgZHVlIHRvIHRo
ZSBjb21waWxlciBub3QgcmVjb2duaXppbmcgdGhhdAo+IGFwcGFyZW50bHkgdW5pbml0aWFsaXpl
ZCB2YXJpYWJsZXMgYXJlbid0IHJlYWxseSB1bmluaXRpYWxpemVkLiBQdWxsIG91dAo+IHRoZSBh
c3NpZ25tZW50cyB1c2VkIGJ5IHR3byBvZiB0aGUgdGhyZWUgY2FzZSBibG9ja3MgYW5kIG1ha2Ug
dGhlbQo+IGluaXRpYWxpemVycyBvZiB0aGUgdmFyaWFibGVzLCBhcyBJIHRoaW5rIEkgaGFkIHN1
Z2dlc3RlZCBkdXJpbmcgcmV2aWV3Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkNvZGU6CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCkJ1dCBwbGVhc2UgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB0byBzYXkg
aXQgaXMgY2F1c2VkIGJ5IGNvbXBpbGVyCm9wdGltaXNhdGlvbiBsZXZlbC4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
