From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] SUPPORT: Correct the description of altp2m
Date: Tue, 23 Oct 2018 14:51:25 +0100
Message-ID: <1540302685-26829-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWx0cDJtIGFpZHMgbW9uaXRvcmluZyBndWVzdCBtZW1vcnksIG5vdCBoeXBlcnZpc29yIG1lbW9y
eS4gIEFsc28sIHB1dCBpdHMKY29tbW9uIG5hbWUgaW4gYnJhY2tldHMgdG8gYWlkIHNlYXJjaGlu
Zy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Ci0tLQpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpD
QzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogUmF6
dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgpDQzogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgotLS0KIFNVUFBPUlQubWQgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9TVVBQ
T1JULm1kIGIvU1VQUE9SVC5tZAppbmRleCAzNzI3NDQ2Li40ZjIwM2RhIDEwMDY0NAotLS0gYS9T
VVBQT1JULm1kCisrKyBiL1NVUFBPUlQubWQKQEAgLTI0NSw3ICsyNDUsNyBAQCBjYW4gYWxsb3cg
bW9yZSBlZmZpY2llbnQgYWdncmVnYXRlIHVzZSBvZiBtZW1vcnkgYWNyb3NzIFZNcy4KIAogIyMj
IEFsdGVybmF0aXZlIHAybQogCi1BbGxvd3MgZXh0ZXJuYWwgbW9uaXRvcmluZyBvZiBoeXBlcnZp
c29yIG1lbW9yeQorQWx0ZXJuYXRpdmUgcDJtIChhbHRwMm0pIGFsbG93cyBleHRlcm5hbCBtb25p
dG9yaW5nIG9mIGd1ZXN0IG1lbW9yeQogYnkgbWFpbnRhaW5pbmcgbXVsdGlwbGUgcGh5c2ljYWwg
dG8gbWFjaGluZSAocDJtKSBtZW1vcnkgbWFwcGluZ3MuCiAKICAgICBTdGF0dXMsIHg4NiBIVk06
IFRlY2ggUHJldmlldwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
