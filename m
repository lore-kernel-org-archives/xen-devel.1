From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
Date: Mon, 8 Apr 2019 12:58:56 +0100
Message-ID: <dd1d63dd-0eda-b66a-fa89-160220e65912@arm.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDSvV-0005Xx-Et
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:59:01 +0000
In-Reply-To: <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMy81LzE5IDE6MjggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0yOTgs
NyArMjk4LDcgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2FkZF90b19waHlzbQo+ICAg
Cj4gICAvKgo+ICAgICogVW5tYXBzIHRoZSBwYWdlIGFwcGVhcmluZyBhdCBhIHBhcnRpY3VsYXIg
R1BGTiBmcm9tIHRoZSBzcGVjaWZpZWQgZ3Vlc3Qncwo+IC0gKiBwc2V1ZG9waHlzaWNhbCBhZGRy
ZXNzIHNwYWNlLgo+ICsgKiBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlICh0cmFuc2xhdGVkIGd1ZXN0
cyBvbmx5KS4KCldoaWxlIHlvdSBtb2RpZnkgdGhlIGNvbW1lbnQsIGNhbiB5b3UgcmVwbGFjZSBH
UEZOIHdpdGggR0ZOPwoKT3RoZXIgdGhhbiB0aGF0OgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcixzCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
