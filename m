From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v8 01/50] x86emul: no need to set
 fault_suppression to false for VMOVNT*
Date: Fri, 15 Mar 2019 04:36:26 -0600
Message-ID: <5C8B802A020000780021F116@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4kCR-0002wP-9q
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 10:36:27 +0000
In-Reply-To: <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBldmV4Lm9wbXNrIGlzIHJlcXVpcmVkIHRvIGJlIHplcm8gdGhlcmUncyBubyBuZWVkIGZv
ciB0aGlzLCBhcyBpdAp3b24ndCBoYXZlIGJlZW4gc2V0IHRvIHRydWUgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
djg6IEFkZCB0aGlzIHByZXZpb3VzbHkgc3RhbmRhbG9uZSBwYXRjaCBpbnRvIHRoZSBzZXJpZXMu
CgotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwpAQCAtNTkxMSw3ICs1OTExLDYgQEAg
eDg2X2VtdWxhdGUoCiAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUChfRVZFWCwgMHgwZiwgMHgyYik6
IC8qIHZtb3ZudHB7cyxkfSBbeHl6XW1tLG1lbSAqLwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRp
b25faWYoZWEudHlwZSAhPSBPUF9NRU0gfHwgZXZleC5vcG1zaywgRVhDX1VEKTsKICAgICAgICAg
c2ZlbmNlID0gdHJ1ZTsKLSAgICAgICAgZmF1bHRfc3VwcHJlc3Npb24gPSBmYWxzZTsKICAgICAg
ICAgLyogZmFsbCB0aHJvdWdoICovCiAgICAgQ0FTRV9TSU1EX1BBQ0tFRF9GUChfRVZFWCwgMHgw
ZiwgMHgxMCk6IC8qIHZtb3Z1cHtzLGR9IFt4eXpdbW0vbWVtLFt4eXpdbW17a30gKi8KICAgICBD
QVNFX1NJTURfU0NBTEFSX0ZQKF9FVkVYLCAweDBmLCAweDEwKTogLyogdm1vdnN7cyxkfSBtZW0s
eG1te2t9ICovCkBAIC02Nzk1LDcgKzY3OTQsNiBAQCB4ODZfZW11bGF0ZSgKICAgICAgICAgZ2Vu
ZXJhdGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0gT1BfTUVNIHx8IGV2ZXgub3Btc2sgfHwgZXZl
eC53LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVhDX1VEKTsKICAgICAgICAgc2Zl
bmNlID0gdHJ1ZTsKLSAgICAgICAgZmF1bHRfc3VwcHJlc3Npb24gPSBmYWxzZTsKICAgICAgICAg
LyogZmFsbCB0aHJvdWdoICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4
NmYpOiAvKiB2bW92ZHFhezMyLDY0fSBbeHl6XW1tL21lbSxbeHl6XW1te2t9ICovCiAgICAgY2Fz
ZSBYODZFTVVMX09QQ19FVkVYX0YzKDB4MGYsIDB4NmYpOiAvKiB2bW92ZHF1ezMyLDY0fSBbeHl6
XW1tL21lbSxbeHl6XW1te2t9ICovCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
