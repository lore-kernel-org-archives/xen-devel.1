From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/emul: Assert the STI shadow when POPF
 sets the interrupt flag
Date: Tue, 06 Nov 2018 07:56:35 -0700
Message-ID: <5BE1ABA302000078001F8B44@prv1-mh.provo.novell.com>
References: <1541513355-1365-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541513355-1365-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjExLjE4IGF0IDE1OjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC00MDYxLDYgKzQw
NjEsMTIgQEAgeDg2X2VtdWxhdGUoCj4gICAgICAgICAgICAgIH0KPiAgICAgICAgICB9Cj4gICAg
ICAgICAgZHN0LnZhbCAmPSBFRkxBR1NfTU9ESUZJQUJMRTsKPiArCj4gKyAgICAgICAgLyogV2hl
biBJRiB0cmFuc2l0aW9ucyBmcm9tIDAgdG8gMSwgYXNzZXJ0IHRoZSBTVEkgc2hhZG93LiAqLwo+
ICsgICAgICAgIGlmICggIShfcmVncy5lZmxhZ3MgJiBYODZfRUZMQUdTX0lGKSAmJgo+ICsgICAg
ICAgICAgICAgKChkc3QudmFsICYgfm1hc2spICYgWDg2X0VGTEFHU19JRikgKQo+ICsgICAgICAg
ICAgICBjdHh0LT5yZXRpcmUuc3RpID0gdHJ1ZTsKCkknbSBlbnRpcmVseSB1bmF3YXJlIHRoYXQg
UE9QRiBiZWhhdmVzIHRoZSBzYW1lIHdheSBhcyBTVEkgaW4gdGhpcwpyZWdhcmQuIFRoZXJlZm9y
ZTogQXJlIHlvdSBzdXJlPyBDYW4geW91IHBvaW50IG1lIHRvIHdoZXJlIHRoaXMgaXMKc3BlbGxl
ZCBvdXQ/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
