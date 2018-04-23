From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 07/10] passthrough/amd: split out hvm
 code from iommu_map.c
Date: Mon, 23 Apr 2018 09:43:21 -0600
Message-ID: <5ADDFF1902000078001BDA4C@prv1-mh.provo.novell.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAdck-0003wT-Gi
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 15:43:26 +0000
In-Reply-To: <20180221214701.1646-8-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDIyOjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
TW92ZSBhbmQgcmVuYW1lIHVwZGF0ZV9wYWdpbmdfbW9kZS4gQ3JlYXRlIGEgbG9jYWwgaGVhZGVy
IGZpbGUgZm9yCj4gdGhpcyBhbmQgb3RoZXIgZnVuY3Rpb25zIHRoYXQgbmVlZCBleHBvcnRpbmcu
CgpGdW5jdGlvbnMgeW91IG1vdmUgaW50byBnbG9iYWwgbmFtZSBzcGFjZSBuZWVkIHN1aXRhYmxl
IHByZWZpeGVzIC0gbmVpdGhlcgpodm1fdXBkYXRlX3BhZ2luZ19tb2RlKCkgbm9yIHNldF9pb21t
dV9wZGVfcHJlc2VudCgpIGNsYXJpZnkgdGhhdCB0aGlzCmlzIEFNRCBJT01NVSBzcGVjaWZpYyBj
b2RlLgoKQWxzbyBwbGVhc2UgZG9uJ3QgaGF2ZSBib29sX3Qgb3IgdGhpbmdzIGxpa2UgdTMyIGlu
IG5ldyBjb2RlIHlvdSBhZGQgKGhlcmU6CnRoZSBzZXRfaW9tbXVfcGRlX3ByZXNlbnQoKSBwcm90
b3R5cGUpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
