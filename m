From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 04/15] arch replumbing: Provide
 $ho->{Arch} and $gho->{Arch}
Date: Wed, 1 May 2019 11:48:28 +0100
Message-ID: <20190501104839.21621-5-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnA-0005U7-O4
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:48 +0000
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2l0aCBleGlzdGluZyBmbGlnaHRzIHRoZXNlIGFyZSAkcnthcmNofSBhbmQgR1VFU1RfYXJjaC4K
Tm90aGluZyB1c2VzIHRoZXNlIHlldC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgotLS0KdjI6IENvcnJlY3RseSBzZXQgJGdoby0+e0FyY2h9
IGluIHNlbGVjdGd1ZXN0LCBub3QgJGhvLT57QXJjaH0KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGJi
NTAzNTU5Li4xODU2NmQzMiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysg
Yi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0xMTc4LDYgKzExNzgsNyBAQCBzdWIgc2VsZWN0
aG9zdCAoJDskKSB7CiAgICAgICAgIE5lc3RpbmdMZXZlbCA9PiAwLAogICAgICAgICBJbmZvID0+
IFtdLAogICAgIH07CisgICAgJGhvLT57QXJjaH0gPSB0YXJnZXRfdmFyKCRobywgJ2FyY2gnKSBv
ciB3YXJuICJ1bmtub3duIGFyY2ggZm9yICRpZGVudCI7CiAgICAgaWYgKGRlZmluZWQgJGpvYikg
ewogCSRoby0+e1N1aXRlfSA9IHRhcmdldF92YXIoJGhvLCAic3VpdGUiKSAvLyAkY3tEZWJpYW5T
dWl0ZX07CiAJJGhvLT57RGlWZXJzaW9ufSA9IHRhcmdldF92YXIoJGhvLCAiZGlfdmVyc2lvbiIp
CkBAIC0xODA5LDYgKzE4MTAsNyBAQCBzdWIgc2VsZWN0Z3Vlc3QgKCQkKSB7CiAJSG9zdCA9PiAk
aG8sCiAJU3VpdGUgPT4gJHJ7IiR7Z259X3N1aXRlIn0sCiAgICAgfTsKKyAgICAkZ2hvLT57QXJj
aH0gPSB0YXJnZXRfdmFyKCRobywgJ2FyY2gnKSBvciB3YXJuICJ1bmtub3duIGFyY2ggZm9yICRn
biI7CiAgICAgZm9yZWFjaCBteSAkb3B0IChndWVzdF92YXJfY29tbWFsaXN0KCRnaG8sJ29wdGlv
bnMnKSkgewogICAgICAgICAkZ2hvLT57T3B0aW9uc317JG9wdH0rKzsKICAgICB9Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
