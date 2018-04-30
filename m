From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/4] block/xen_disk: legacy code removal and
 cleanup
Date: Mon, 30 Apr 2018 13:01:35 +0100
Message-ID: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdck=ht=citrix.com=prvs=65150b487=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fD7V2-00041I-JS
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 12:01:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGdyYW50IGNvcHkgb3BlcmF0aW9uIHdhcyBhZGRlZCB0byBsaWJ4ZW5nbnR0YWIgaW4gWGVu
IDQuOC4wIChyZWxlYXNlZApuZWFybHkgMTggbW9udGhzIGFnbykgYnV0IHRoZSB4ZW5fZGlzayBQ
ViBiYWNrZW5kIFFFTVUgaXMgc3RpbGwgY2FycnlpbmcKYSBzaWduaWZpY2FudCBhbW91bnQgb2Yg
Y29kZSBwdXJlbHkgdG8gcmVtYWluIGNvbXBhdGlibGUgd2l0aCBvbGRlcgp2ZXJzaW9ucyBvZiBY
ZW4uCgpBcyBjYW4gYmUgaW5mZXJyZWQgZnJvbSB0aGUgZGlmZiBzdGF0cyBiZWxvdywgcmVtb3Zp
bmcgdGhpcyBzdXBwb3J0IGZvcgpvbGRlciB2ZXJzaW9ucyBvZiBYZW4gZnJvbSBRRU1VIHJlZHVj
ZXMgdGhlIHNpemUgb2YgdGhlIHhlbl9kaXNrIHNvdXJjZSBieQptb3JlIHRoYW4gMzUwIGxpbmVz
ICh+MjUlKS4gVGhlIG1ham9yaXR5IG9mIHRoaXMgaXMgZG9uZSBpbiBwYXRjaGVzICMxCmFuZCAj
Mi4gRnVydGhlciBzaW1wbGlmaWNhdGlvbnMgYXJlIG1hZGUgaW4gcGF0Y2ggIzMgYW5kIHRoZW4g
c29tZSBjb3NtZXRpYwp3b3JrIGlzIGRvbmUgaW4gcGF0Y2ggIzQuCgpQYXVsIER1cnJhbnQgKDQp
OgogIGJsb2NrL3hlbl9kaXNrOiByZW1vdmUgcGVyc2lzdGVudCBncmFudCBjb2RlCiAgYmxvY2sv
eGVuX2Rpc2s6IHJlbW92ZSB1c2Ugb2YgZ3JhbnQgbWFwL3VubWFwCiAgYmxvY2sveGVuX2Rpc2s6
IHVzZSBhIHNpbmdsZSBlbnRyeSBpb3ZlYwogIGJsb2NrL3hlbl9kaXNrOiBiZSBjb25zaXN0ZW50
IHdpdGggdXNlIG9mIHhlbmRldiBhbmQgYmxrZGV2LT54ZW5kZXYKCiBody9ibG9jay94ZW5fZGlz
ay5jIHwgNTkwICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKSwgNDgxIGRlbGV0aW9ucygt
KQotLS0KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6
IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogS2V2aW4gV29s
ZiA8a3dvbGZAcmVkaGF0LmNvbT4KQ2M6IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+Cgot
LSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
