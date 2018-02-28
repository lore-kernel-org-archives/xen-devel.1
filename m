From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 1/2] README: require Python 2.4 or newer
Date: Wed, 28 Feb 2018 13:18:43 -0600
Message-ID: <20180228191844.29413-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mqb1=fw=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1er7FG-0006Ak-O7
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 19:18:30 +0000
Received: by mail-qt0-x244.google.com with SMTP id g60so4396055qtd.11
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2018 11:18:29 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5jcmVhc2UgdGhlIG1pbmltdW0gcmVxdWlyZWQgUHl0aG9uIHRvIDIuNCBvciBuZXdlci4KClNp
Z25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KLS0tCkNDOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkND
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpjaGFuZ2Ug
ZnJvbSB2MToKLSBjaGFuZ2VkIGZyb20gUHl0aG9uIDIuNiB0byBQeXRob24gMi40IGJhc2VkIG9u
CgpXaGlsZSB0aGUgdG9vbHMgYXJlIGJyb2tlIHdpdGggUHl0aG9uIDIuNCBjdXJyZW50bHkgdGhl
cmUgYXJlCnNvbWUgc2NyaXB0cyB0aGF0IHBlb3BsZSBoYXZlIGFuIGludGVyZXN0IGluIHN0aWxs
IGJlaW5nIGFibGUKdG8gcnVuIHdpdGggUHl0aG9uIDIuNCBzbyBjaGFuZ2VkIHRoZSBkb2N1bWVu
dGVkIGluZm9ybWF0aW9uIHRoZXJlLgpJJ20gd29ya2luZyBvbiBzb21lIHVwZGF0ZXMgdG8gdGhl
IFRyYXZpcyBDSSB0ZXN0IGxvb3AgKGFjdHVhbGx5CnN3aXRjaGluZyB0byBHaXRMYWIgQ0kpIHRv
IGdpdmUgdXMgbW9yZSBmbGV4aWJpbGl0eSBpbiB3aGF0IGlzCmJlaW5nIHRlc3RlZC4KClNlZQpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTct
MDkvbXNnMDIzODkuaHRtbApmb3IgY29udGV4dCBvbiB0aGUgYnVpbGQgZmFpbHVyZXMgaW4gdG9v
bHMgd2l0aCBQeXRob24gMi40Ci0tLQogUkVBRE1FIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvUkVBRE1FIGIvUkVBRE1F
CmluZGV4IGU5NmNkZDI4NjIuLjRlZDAzYjdmZTIgMTAwNjQ0Ci0tLSBhL1JFQURNRQorKysgYi9S
RUFETUUKQEAgLTQ2LDcgKzQ2LDcgQEAgcHJvdmlkZWQgYnkgeW91ciBPUyBkaXN0cmlidXRvcjoK
ICAgICAgICAgLSBHQ0MgNC44IG9yIGxhdGVyCiAgICAgICAgIC0gR05VIEJpbnV0aWxzIDIuMjQg
b3IgbGF0ZXIKICAgICAqIERldmVsb3BtZW50IGluc3RhbGwgb2YgemxpYiAoZS5nLiwgemxpYi1k
ZXYpCi0gICAgKiBEZXZlbG9wbWVudCBpbnN0YWxsIG9mIFB5dGhvbiB2Mi4zIG9yIGxhdGVyIChl
LmcuLCBweXRob24tZGV2KQorICAgICogRGV2ZWxvcG1lbnQgaW5zdGFsbCBvZiBQeXRob24gdjIu
NCBvciBsYXRlciAoZS5nLiwgcHl0aG9uLWRldikKICAgICAqIERldmVsb3BtZW50IGluc3RhbGwg
b2YgY3Vyc2VzIChlLmcuLCBsaWJuY3Vyc2VzLWRldikKICAgICAqIERldmVsb3BtZW50IGluc3Rh
bGwgb2Ygb3BlbnNzbCAoZS5nLiwgb3BlbnNzbC1kZXYpCiAgICAgKiBEZXZlbG9wbWVudCBpbnN0
YWxsIG9mIHgxMSAoZS5nLiB4b3JnLXgxMS1kZXYpCi0tIAoyLjE2LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
