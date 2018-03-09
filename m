From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/traps: Put idt_table[] back into .bss
Date: Fri, 9 Mar 2018 15:03:47 +0000
Message-ID: <1520607827-30020-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Yy9zIGQxZDZmYzk3ZCAieDg2L3hwdGk6IHJlYWxseSBoaWRlIGFsbW9zdCBhbGwgb2YgWGVuIGlt
YWdlIiBhY2NpZGVudGlhbGx5Cm1vdmVkIGlkdF90YWJsZVtdIGZyb20gLmJzcyB0byAuZGF0YSBi
eSB2aXJ0dWUgb2YgdXNpbmcgdGhlIHBhZ2VfYWxpZ25lZApzZWN0aW9uLiAgV2UgYWxzbyBoYXZl
IC5ic3MucGFnZV9hbGlnbmVkLCBzbyB1c2UgdGhhdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni90
cmFwcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RyYXBzLmMgYi94ZW4vYXJjaC94ODYvdHJh
cHMuYwppbmRleCAxOWJjMTc0Li4wMTZhZjEyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdHJh
cHMuYworKysgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwpAQCAtMTAyLDcgKzEwMiw3IEBAIERFRklO
RV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBkZXNjX3N0cnVjdCAqLCBnZHRfdGFibGUpOwog
REVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IGRlc2Nfc3RydWN0ICosIGNvbXBhdF9n
ZHRfdGFibGUpOwogCiAvKiBNYXN0ZXIgdGFibGUsIHVzZWQgYnkgQ1BVMC4gKi8KLWlkdF9lbnRy
eV90IF9fc2VjdGlvbigiLmRhdGEucGFnZV9hbGlnbmVkIikgX19hbGlnbmVkKFBBR0VfU0laRSkK
K2lkdF9lbnRyeV90IF9fc2VjdGlvbigiLmJzcy5wYWdlX2FsaWduZWQiKSBfX2FsaWduZWQoUEFH
RV9TSVpFKQogICAgIGlkdF90YWJsZVtJRFRfRU5UUklFU107CiAKIC8qIFBvaW50ZXIgdG8gdGhl
IElEVCBvZiBldmVyeSBDUFUuICovCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
