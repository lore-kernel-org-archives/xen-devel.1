From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH RFC 01/15] xen: allow console_io hypercalls from
 DomUs on ARM
Date: Wed, 13 Jun 2018 15:15:04 -0700
Message-ID: <1528928118-14960-1-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: artem_mygaiev@epam.com, Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, andrii_anisov@epam.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, tim@xen.org, jbeulich@suse.com, wei.liu2@citrix.com, dgdegra@tycho.nsa.gov
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB2ZXJ5IHVzZWZ1bCB3aGVuIHN0YXJ0aW5nIG11bHRpcGxlIGRvbWFpbnMgZnJvbSBY
ZW4gd2l0aG91dAp4ZW5zdG9yZSBhY2Nlc3MuIEl0IHdpbGwgYWxsb3cgdGhlbSB0byBwcmludCBv
dXQgdG8gdGhlIFhlbiBjb25zb2xlLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgpDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQpDQzog
R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCkNDOiBpYW4uamFja3NvbkBldS5jaXRyaXguY29t
CkNDOiBqYmV1bGljaEBzdXNlLmNvbQpDQzoga29ucmFkLndpbGtAb3JhY2xlLmNvbQpDQzogdGlt
QHhlbi5vcmcKQ0M6IHdlaS5saXUyQGNpdHJpeC5jb20KQ0M6IGRnZGVncmFAdHljaG8ubnNhLmdv
dgotLS0KSWYgdGhlcmUgaXMgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoaXMgd2l0aCBYU00sIHBsZWFz
ZSBhZHZpc2UuCgotLS0KIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKaW5kZXggMGYwNTM2OS4uZGM5
ZTBiYiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVuL2Ry
aXZlcnMvY2hhci9jb25zb2xlLmMKQEAgLTU1NSw5ICs1NTUsMTEgQEAgbG9uZyBkb19jb25zb2xl
X2lvKGludCBjbWQsIGludCBjb3VudCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjaGFyKSBidWZm
ZXIpCiAgICAgbG9uZyByYzsKICAgICB1bnNpZ25lZCBpbnQgaWR4LCBsZW47CiAKKyNpZm5kZWYg
Q09ORklHX0FSTQogICAgIHJjID0geHNtX2NvbnNvbGVfaW8oWFNNX09USEVSLCBjdXJyZW50LT5k
b21haW4sIGNtZCk7CiAgICAgaWYgKCByYyApCiAgICAgICAgIHJldHVybiByYzsKKyNlbmRpZgog
CiAgICAgc3dpdGNoICggY21kICkKICAgICB7Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
