From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/xstate: correct logging in handle_xsetbv()
Date: Tue, 31 Jul 2018 04:37:08 -0600
Message-ID: <5B603BD402000078001D9616@prv1-mh.provo.novell.com>
References: <1532000683-23429-1-git-send-email-andrew.cooper3@citrix.com>
 <1532000683-23429-3-git-send-email-andrew.cooper3@citrix.com>
 <5B5B1D2602000078001D879C@prv1-mh.provo.novell.com>
 <dfc9d085-c0ad-aa73-edd1-3fd161795442@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dfc9d085-c0ad-aa73-edd1-3fd161795442@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29ycmVjdCBhIGRpc2FncmVlbWVudCBiZXR3ZWVuIHRleHQgYW5kIGxvZ2dlZCB2YWx1ZS4KClNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCk5COiBJJ3Zl
IGFscmVhZHkgY29ycmVjdGVkIHRoaXMgaW4gdGhlIGJhY2twb3J0cy4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni94c3RhdGUuYworKysgYi94ZW4vYXJjaC94ODYveHN0YXRlLmMKQEAgLTcxNSw3ICs3MTUs
NyBAQCBpbnQgaGFuZGxlX3hzZXRidih1MzIgaW5kZXgsIHU2NCBuZXdfYnYpCiAgICAgewogICAg
ICAgICBncHJpbnRrKFhFTkxPR19FUlIsCiAgICAgICAgICAgICAgICAgInhjcjBfbWF4ICUwMTYi
IFBSSXg2NCAiIGV4Y2VlZHMgaGFyZHdhcmUgbWF4ICUwMTYiIFBSSXg2NCAiXG4iLAotICAgICAg
ICAgICAgICAgIG5ld19idiwgeGZlYXR1cmVfbWFzayk7CisgICAgICAgICAgICAgICAgeGNyMF9t
YXgsIHhmZWF0dXJlX21hc2spOwogICAgICAgICBkb21haW5fY3Jhc2goY3Vyci0+ZG9tYWluKTsK
IAogICAgICAgICByZXR1cm4gLUVJTlZBTDsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
