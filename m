From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] fix uninitialized variable error in do_poll()
Date: Fri, 05 Oct 2018 04:12:10 -0600
Message-ID: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8N5h-0007gc-B7
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 10:12:13 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHRoYXQgQ09ORklHX0hWTSBjYW4gKGFuZCBzaG91bGQpIGJlIHR1cm5lZCBvZmYgZm9yIHRo
ZSBzaGltLCBnY2MgOC4yCmFwcGFyZW50bHkgaXMgbm8gbG9uZ2VyIHN1cmUgdGhhdCAicG9ydCIg
aXMgaW5kZWVkIGluaXRpYWxpemVkIGF0CgogICAgaWYgKCBzY2hlZF9wb2xsLT5ucl9wb3J0cyA9
PSAxICkKICAgICAgICB2LT5wb2xsX2V2dGNobiA9IHBvcnQ7CgpJdCBkb2Vzbid0IGxvb2sgdG8g
YmUgaW1wb3NzaWJsZSBmb3IgdGhlIGNvbXBpbGVyIHRvIHByb3ZlIGl0IGlzIG5vdCwKYnV0IHdl
IGFsc28gY2FuJ3QgcmVseSBvbiB0aGF0IHRvIGJlIHRoZSBjYXNlLiBBZGQgYW4gaW5pdGlhbGl6
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0g
YS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0x
MDE0LDcgKzEwMTQsNyBAQCBzdGF0aWMgbG9uZyBkb19wb2xsKHN0cnVjdCBzY2hlZF9wb2xsICpz
CiB7CiAgICAgc3RydWN0IHZjcHUgICAqdiA9IGN1cnJlbnQ7CiAgICAgc3RydWN0IGRvbWFpbiAq
ZCA9IHYtPmRvbWFpbjsKLSAgICBldnRjaG5fcG9ydF90ICBwb3J0OworICAgIGV2dGNobl9wb3J0
X3QgIHBvcnQgPSAwOwogICAgIGxvbmcgICAgICAgICAgIHJjOwogICAgIHVuc2lnbmVkIGludCAg
IGk7CiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
