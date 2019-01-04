From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: no need to set fault_suppression to
 false for VMOVNT*
Date: Fri, 04 Jan 2019 09:36:18 -0700
Message-ID: <5C2F8B82020000780020A511@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gfSSO-00017F-ID
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 16:36:24 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBldmV4Lm9wbXNrIGlzIHJlcXVpcmVkIHRvIGJlIHplcm8gdGhlcmUncyBubyBuZWVkIGZv
ciB0aGlzLCBhcyBpdAp3b24ndCBoYXZlIGJlZW4gc2V0IHRvIHRydWUgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
SSd2ZSBtYWRlIHNpbWlsYXIgY2hhbmdlcyB0byBwYXRjaGVzIDE2LCA0NSwgYW5kIDQ2IG9mIHY3
IG9mIHRoZSBtYWluCkFWWDUxMiBzZXJpZXMuCgotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxh
dGUuYwpAQCAtNTkxMSw3ICs1OTExLDYgQEAgeDg2X2VtdWxhdGUoCiAgICAgQ0FTRV9TSU1EX1BB
Q0tFRF9GUChfRVZFWCwgMHgwZiwgMHgyYik6IC8qIHZtb3ZudHB7cyxkfSBbeHl6XW1tLG1lbSAq
LwogICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZWEudHlwZSAhPSBPUF9NRU0gfHwgZXZl
eC5vcG1zaywgRVhDX1VEKTsKICAgICAgICAgc2ZlbmNlID0gdHJ1ZTsKLSAgICAgICAgZmF1bHRf
c3VwcHJlc3Npb24gPSBmYWxzZTsKICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCiAgICAgQ0FT
RV9TSU1EX1BBQ0tFRF9GUChfRVZFWCwgMHgwZiwgMHgxMCk6IC8qIHZtb3Z1cHtzLGR9IFt4eXpd
bW0vbWVtLFt4eXpdbW17a30gKi8KICAgICBDQVNFX1NJTURfU0NBTEFSX0ZQKF9FVkVYLCAweDBm
LCAweDEwKTogLyogdm1vdnN7cyxkfSBtZW0seG1te2t9ICovCkBAIC02NzkzLDcgKzY3OTIsNiBA
QCB4ODZfZW11bGF0ZSgKICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVhLnR5cGUgIT0g
T1BfTUVNIHx8IGV2ZXgub3Btc2sgfHwgZXZleC53LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRVhDX1VEKTsKICAgICAgICAgc2ZlbmNlID0gdHJ1ZTsKLSAgICAgICAgZmF1bHRfc3Vw
cHJlc3Npb24gPSBmYWxzZTsKICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCiAgICAgY2FzZSBY
ODZFTVVMX09QQ19FVkVYXzY2KDB4MGYsIDB4NmYpOiAvKiB2bW92ZHFhezMyLDY0fSBbeHl6XW1t
L21lbSxbeHl6XW1te2t9ICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYX0YzKDB4MGYsIDB4
NmYpOiAvKiB2bW92ZHF1ezMyLDY0fSBbeHl6XW1tL21lbSxbeHl6XW1te2t9ICovCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
