From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] xen/xsm: Cleanup in preparation for XSM
 SILO mode
Date: Tue, 26 Jun 2018 12:09:06 +0100
Message-ID: <1530011348-4852-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Xin Li <xin.li@citrix.com>, Ming Lu <ming.lu@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

RnV0dXJlIGNoYW5nZXMgd2lsbCBpbnRyb2R1Y2UgYSBuZXcgU0lMTyBtb2RlLCB3aGljaCBpcyBp
bnRlbmRlZCB0byBiZSB1c2VmdWwKZm9yIGNsb3VkIGFuZCBlbnRlcnByaXNlIHNldHVwcyB3aGVy
ZSBhbGwgZG9tVXMgYXJlIHVucHJpdmlsZWdlZCBhbmQgaGF2ZSBubwpidWlzbmVzcyBjb21tdW5p
Y2F0aW5nIGRpcmVjdGx5LgoKVGhpcyB3YXMgZGlzY3Vzc2VkIGF0IFhlblN1bW1pdCwgYnV0IEkn
bGwgbGVhdmUgZnVydGhlciBkZXRhaWxzIHRvIHRoZSBzZXJpZXMKd2hpY2ggaW50cm9kdWNlcyBp
dC4gIEhvd2V2ZXIsIHRvIGJlZ2luIHdpdGgsIGNsZWFuIHVwIHRoZSBYU00gbmFtZXNwYWNpbmcg
dG8KYmV0dGVyIHNlcGFyYXRlIFhTTSBhbmQgRkxBU0suCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4K
CkFuZHJldyBDb29wZXIgKDIpOgogIHhlbi94c206IFJlbmFtZSBDT05GSUdfRkxBU0tfKiB0byBD
T05GSUdfWFNNX0ZMQVNLXyoKICB4ZW4veHNtOiBSZW5hbWUgQ09OSUZJR19YU01fUE9MSUNZIHRv
IENPTkZJR19YU01fRkxBU0tfUE9MSUNZCgogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgIHwg
MTIgKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS9NYWtlZmlsZSAgICAgICAgfCAgMiArLQogeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hzbS94c20uaCAg
ICAgICB8IDEwICsrKysrLS0tLS0KIHhlbi94c20vTWFrZWZpbGUgICAgICAgICAgICB8ICAyICst
CiB4ZW4veHNtL2ZsYXNrL01ha2VmaWxlICAgICAgfCAgMiArLQogeGVuL3hzbS9mbGFzay9hdmMu
YyAgICAgICAgIHwgIDQgKystLQogeGVuL3hzbS9mbGFzay9mbGFza19vcC5jICAgIHwgIDQgKyst
LQogeGVuL3hzbS9mbGFzay9nZW4tcG9saWN5LnB5IHwgIDQgKystLQogeGVuL3hzbS9mbGFzay9p
bmNsdWRlL2F2Yy5oIHwgIDIgKy0KIHhlbi94c20veHNtX2NvcmUuYyAgICAgICAgICB8ICA2ICsr
Ky0tLQogMTEgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0p
CgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
