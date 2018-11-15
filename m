From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 5/5] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Thu, 15 Nov 2018 08:40:11 -0700
Message-ID: <5BED935B02000078001FC7A4@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNJkf-0000zw-Go
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:40:17 +0000
In-Reply-To: <20181114115740.1050-6-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEJyaWRnZXMgYXJlIG5vdCBiZWhpbmQgYW4gSU9NTVUsIGFuZCBhcmUgYWxyZWFkeSBzcGVjaWFs
IGNhc2VkIGFuZAo+IHNpbGVudGx5IHNraXBwZWQgaW4gYW1kX2lvbW11X2FkZF9kZXZpY2UuIEFw
cGx5IHRoZSBzYW1lIHNwZWNpYWwKPiBjYXNpbmcgd2hlbiB1cGRhdGluZyBwYWdlIHRhYmxlcy4K
CkJ1dCBicmlkZ2VzIGFsc28gZG9uJ3QgaXNzdWUgSS9PIG9uIHRoZWlyIG93biBpZiBJJ20gbm90
IG1pc3Rha2VuLiBTbwp3aGF0IEknbSBtaXNzaW5nIGhlcmUgaXMgYSB3b3JkIG9uIHRoZSBiZW5l
Zml0IG9mIHRoaXMgY2hhbmdlLiBJIGFsc28KcXVlc3Rpb24gdGhlICJzaWxlbnRseSIgaW4geW91
ciB3b3JkaW5nLCBzZWVpbmcgdGhlIEFNRF9JT01NVV9ERUJVRygpCnRoZXJlLgoKVGhlIGNvZGUg
Y2hhbmdlIGl0c2VsZiBsb29rcyBmaW5lIHRvIG1lLCBhbGJlaXQgcGVyc29uYWxseSBJJ2QgcHJl
ZmVyCmlmIGl0IGZ1bGx5IG1hdGNoZWQgdGhlIG90aGVyIGNvbmRpdGlvbmFsIChpLmUuIGlmIHlv
dSBmbGlwcGVkIHRoZQpvcGVyYW5kcyBvZiAmJiApLiBPZiBjb3Vyc2UgdGhlIHNwZWNpYWwgY2Fz
aW5nIG9mIHRoZSBoYXJkd2FyZQpkb21haW4gaGVyZSBpcyBzb21ld2hhdCBvZGQgYW55d2F5LgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
