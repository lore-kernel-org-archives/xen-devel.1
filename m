From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 61/74] xen/pvshim: support vCPU
 hotplug
Date: Tue, 09 Jan 2018 03:16:38 -0700
Message-ID: <5A54A496020000780019C9B5@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-62-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYqxc-00043K-Nn
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 10:16:48 +0000
In-Reply-To: <20180104130625.28605-62-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTEzMDMsMjIgKzEzMjAsMjAgQEAgbG9uZyBkb192Y3B1X29wKGludCBjbWQsIHVuc2lnbmVk
IGludCB2Y3B1aWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQo+ICAKPiAgICAg
ICAgICBicmVhazsKPiAgCj4gLSAgICBjYXNlIFZDUFVPUF91cDogewo+IC0gICAgICAgIGJvb2xf
dCB3YWtlID0gMDsKPiAtICAgICAgICBkb21haW5fbG9jayhkKTsKPiAtICAgICAgICBpZiAoICF2
LT5pc19pbml0aWFsaXNlZCApCj4gLSAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKClNob3VsZG4n
dCB0aGlzIGNoZWNrIHJlbWFpbiBoZXJlPyBJIHJlYWxpemUgdGhpcyB3aWxsIGNvbXBsaWNhdGUK
bG9ja2luZyAobHVja2lseSB0aGUgZG9tYWluIGxvY2sgaXMgYSByZWN1cnNpdmUgb25lLCBzbyBp
dCBzaG91bGRuJ3QKYmUgdG9vIGJhZCksIGJ1dCBJIGRvbid0IHRoaW5rIHB2X3NoaW1fY3B1X3Vw
KCkgY2FuIHRvbGVyYXRlIGZhaWxpbmcKYmVjYXVzZSBvZiB2Y3B1X3VwKCkgZmFpbGluZy4KCkkg
YWxzbyB0aGluayB0aGF0IHRoZSB1c2Ugb2YgImxvbmciIGZvciByZXR1cm4gdHlwZXMgYW5kIHZh
bHVlcyBpc24ndApyZWFsbHkgd2FycmFudGVkIGhlcmUsIGFuZCB0aGVyZSdzIGFsc28gbm8gdmlz
aWJsZSB0byBtZSByZWFzb24gdG8Kc3BlY2lhbCBjYXNlIENQVTAgaGVyZS4gQnV0IGZvciBzaW1w
bGljaXR5IHJlYXNvbnMgSSBjYW4gc2VlIHdoeQp5b3UndmUgY2hvc2VuIHRoYXQgb3B0aW9uOyBv
dG9oIHRoZSBsb2NraW5nIGlzc3VlIGFib3ZlIHRoYXQgeW91J2xsCm5lZWQgdG8gc29sdmUgbWln
aHQgYmUgZWFzaWVyIHRvIGRlYWwgd2l0aCBpZiB5b3UgZGlkbid0IHN3aXRjaCBDUFVzCmZvciBo
eXBlcmNhbGwgcHJvY2Vzc2luZyAod2l0aG91dCBkcm9wcGluZyB0aGUgdXNlIG9mCmNvbnRpbnVl
X2h5cGVyY2FsbF9vbl9jcHUoKSkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
