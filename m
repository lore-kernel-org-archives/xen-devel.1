From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/5] xen: Fixes and improvements to HVM_PARAM
 handling
Date: Wed, 5 Sep 2018 19:11:59 +0100
Message-ID: <1536171124-27053-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzdGFydGVkIHdpdGggdGhlIG9ic2VydmF0aW9uIGluIHBhdGNoIDUsIGFuZCBleHBhbmRl
ZCBmcm9tIHRoZXJlLiAgVGhlCmVuZCByZXN1bHQgc2hvdWxkIGJlIHJhdGhlciBtb3JlIHByZWRp
Y3RhYmxlIGFuZCBlYXN5IHRvIGRlcHJlY2F0ZSBwYXJhbWV0ZXJzCmZyb20uCgpBbiBvYnNlcnZh
dGlvbiB3aGljaCBJIGhhdmVuJ3QgYWRkcmVzc2VkIChhbmQgZG9uJ3QgaGF2ZSB0aW1lIGluIHRo
ZSBuZWFyCmZ1dHVyZSkgaXMgdGhhdCB0aGUgaHZtIHBhcmFtcyBhcnJheSBpcyBtb2RlcmF0ZWx5
IHdhc3RlZnVsIG9uIHg4NiBhbmQgdmVyeQp3YXN0ZWZ1bCBvbiBBUk0uICBBbiBvcHRpb24gd291
bGQgYmUgdG8gc3dpdGNoIHRvIHVzaW5nIGEgbmFtZWQgc3RydWN0dXJlLAp3aGljaCB3b3VsZCBh
bHNvIGZpeCB0aGUgcHJvYmxlbSB0aGF0IGJvdGggYXJjaCdzIGh5cGVyY2FsbCBoYW5kZXJzIGFy
ZSBCQ0JTCmdhZGdldHMuCgpBbmRyZXcgQ29vcGVyICg1KToKICB4ODYvaHZtOiBTd2l0Y2ggaHZt
X2FsbG93X2dldF9wYXJhbSgpIHRvIHVzZSBhIHdoaXRlbGlzdAogIHg4Ni9odm06IFN3aXRjaCBo
dm1fYWxsb3dfc2V0X3BhcmFtKCkgdG8gdXNlIGEgd2hpdGVsaXN0CiAgeDg2L2h2bTogTWFrZSBI
Vk1fUEFSQU1fe1NUT1JFLENPTlNPTEV9X0VWVENITiByZWFkLW9ubHkgdG8gdGhlIGd1ZXN0CiAg
eDg2L2h2bTogTWlzYyBub24tZnVuY3Rpb25hbCBjbGVhbnVwIHRvIHRoZSBIVk1fUEFSQU0gaW5m
cmFzdHJ1Y3R1cmUKICB4ZW4vQVJNOiBSZXN0cmljdCBhY2Nlc3MgdG8gbW9zdCBIVk1fUEFSQU0n
cwoKIHhlbi9hcmNoL2FybS9odm0uYyAgICAgfCAgNjIgKysrKysrKysrLQogeGVuL2FyY2gveDg2
L2h2bS9odm0uYyB8IDMxMiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIyMSBpbnNlcnRpb25zKCspLCAxNTMgZGVsZXRp
b25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
