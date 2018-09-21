From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 6/6] RFC: tools/dm_restrict: Enable QEMU
 sandboxing
Date: Fri, 21 Sep 2018 18:04:28 +0100
Message-ID: <20180921170428.13771-6-george.dunlap@citrix.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nmqt=md=citrix.com=prvs=795526837=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g3OrC-0003xh-QB
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 17:04:42 +0000
In-Reply-To: <20180921170428.13771-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UUVNVSBoYXMgYSBgc2FuZGJveGAgZmVhdHVyZSwgd2hlcmVpbiBpdCB3aWxsIHVzZSBzZWNjb21w
MiB0byByZXN0cmljdAp3aGF0IHN5c3RlbSBjYWxscyBpdCBpcyBhYmxlIHRvIG1ha2UuCgpTdWdn
ZXN0ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpU
aGlzIGNhbid0IGJlIGNoZWNrZWQgaW4gYXMtaXMsIGJlY2F1c2UgYC1zYW5kYm94YCBzdXBwb3J0
IG1heSBub3QgaGF2ZQpiZWVuIGNvbXBpbGVkIGluLiAgV2UgdGhlcmVmb3JlIG5lZWQgdG8gZWl0
aGVyOgogMS4gUmVxdWlyZSB0aGF0IHRoaXMgZmVhdHVyZSBiZSBlbmFibGVkIHRvIGJ1aWxkIHFl
bXUKIDIuIENoZWNrIGZvciBgLXNhbmRib3hgIHN1cHBvcnQgYXQgcnVudGltZSBiZWZvcmUKCkND
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CkNDOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2RtLmMKaW5kZXggNjczMzUxNDM3MC4uYjU0MWMxYTU1ZSAxMDA2NDQKLS0tIGEv
dG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCkBAIC0x
NDQ4LDYgKzE0NDgsMTAgQEAgc3RhdGljIGludCBsaWJ4bF9fYnVpbGRfZGV2aWNlX21vZGVsX2Fy
Z3NfbmV3KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIC8vIEFkZCAiLWNocm9vdCBbZGlyXSIgdG8g
Y29tbWFuZC1saW5lCiAgICAgICAgIGZsZXhhcnJheV9hcHBlbmQoZG1fYXJncywgIi1jaHJvb3Qi
KTsKICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCBjaHJvb3RfZGlyKTsKKworICAg
ICAgICAvLyBBZGQgc2FuZGJveGluZworICAgICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3Ms
ICItc2FuZGJveCIpOworICAgICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsICJvbixvYnNv
bGV0ZT1kZW55LGVsZXZhdGVwcml2aWxlZ2VzPWFsbG93LHNwYXduPWRlbnkscmVzb3VyY2Vjb250
cm9sPWRlbnkiKTsKICAgICB9CiAKICAgICBpZiAoc3RhdGUtPnNhdmVkX3N0YXRlKSB7Ci0tIAoy
LjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
