From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/cmdline: Fix buggy strncmp(s, LITERAL,
 ss - s) construct
Date: Fri, 4 Jan 2019 16:25:16 +0000
Message-ID: <3b48ba9a-7271-b450-abe7-60294303f857@citrix.com>
References: <1546277721-20234-1-git-send-email-andrew.cooper3@citrix.com>
 <5C2F7C8D020000780020A422@prv1-mh.provo.novell.com>
 <bff3c33d-a244-362a-529c-32f91b5f3965@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <bff3c33d-a244-362a-529c-32f91b5f3965@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDEvMjAxOSAxNTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8wMS8yMDE5
IDE1OjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgaW50IHJl
cyA9ICgqZnJhZyAtICpuYW1lKTsKPj4gV2l0aCB0aGUgcmVzdWx0IG9mIHRoaXMgYmVpbmcgaW1w
bGVtZW50YXRpb24gZGVmaW5lZCAoZHVlIHRvIHBsYWluCj4+IGNoYXIncyBpbXBsZW1lbnRhdGlv
biBkZWZpbmVkIC0gb2Z0ZW4gY29tbWFuZCBsaW5lIGNvbnRyb2xsZWQKPj4gd2l0aCBhbiBpbXBs
ZW1lbnRhdGlvbiBkZWZpbmVkIGRlZmF1bHQgLSBzaWduZWRuZXNzKSBJIHdvbmRlciBpZgo+PiB0
aGlzIGZ1bmN0aW9uIGNhbiByZWFsbHkgdXNlZnVsbHkgcmV0dXJuICJpbnQiIHJhdGhlciB0aGFu
ICJib29sIi4KPiBNeSBDUFVJRCBjb21tYW5kIGxpbmUgcGFyc2luZyBuZWVkcyB0aGlzIHRvIHdv
cmsgcHJvcGVybHkgYXMgaW50LCBmb3IKPiBiaXNlY3RpbmcgYWNyb3NzIGEgc29ydGVkIGxpc3Qu
Cj4KPiBJJ2xsIGFkZCBhbiBleHBsaWNpdCBjYXN0IHRvIHNpZ25lZCBjaGFyLsKgIEknbGwgYWxz
byBmaXggb3V0IGxvY2FsIGxpYmMKPiBmdW5jdGlvbnMsIHdoaWNoIGFyZSBzaW1pbGFybHkgYnVn
Z3kuCgpBbmQgYnkgdGhpcywgSSBhY3R1YWxseSBtZWFuIGFuIGV4cGxpY2l0IHVuc2lnbmVkIGNh
c3QsIGhhdmluZyBqdXN0CmNyb3NzLWNoZWNrZWQgd2l0aCB0aGUgQyBzcGVjLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
