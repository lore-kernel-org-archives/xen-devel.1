From: Peng Fan <peng.fan@nxp.com>
Subject: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Mon, 21 Jan 2019 04:51:57 +0000
Message-ID: <20190121050056.14325-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p111=P5=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1glRZK-0001y5-Rt
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 04:52:19 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "hch@infradead.org" <hch@infradead.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

b24gaS5NWDhRTSwgTTRfMSBpcyBjb21tdW5pY2F0aW5nIHdpdGggRG9tVSB1c2luZyBycG1zZyB3
aXRoIGEgZml4ZWQKYWRkcmVzcyBhcyB0aGUgZG1hIG1lbSBidWZmZXIgd2hpY2ggaXMgcHJlZGVm
aW5lZC4KCldpdGhvdXQgdGhpcyBwYXRjaCwgdGhlIGZsb3cgaXM6CnZyaW5nX21hcF9vbmVfc2cg
LT4gdnJpbmdfdXNlX2RtYV9hcGkKICAgICAgICAgICAgICAgICAtPiBkbWFfbWFwX3BhZ2UKCQkg
ICAgICAgLT4gX19zd2lvdGxiX21hcF9wYWdlCgkJICAgICAgICAgICAgICAgIC0+c3dpb3RsYl9t
YXBfcGFnZQoJCQkJLT5fX2RtYV9tYXBfYXJlYShwaHlzX3RvX3ZpcnQoZG1hX3RvX3BoeXMoZGV2
LCBkZXZfYWRkcikpLCBzaXplLCBkaXIpOwpIb3dldmVyIHdlIGFyZSB1c2luZyBwZXIgZGV2aWNl
IGRtYSBhcmVhIGZvciBycG1zZywgcGh5c190b192aXJ0CmNvdWxkIG5vdCByZXR1cm4gYSBjb3Jy
ZWN0IHZpcnR1YWwgYWRkcmVzcyBmb3IgdmlydHVhbCBhZGRyZXNzIGluCnZtYWxsb2MgYXJlYS4g
VGhlbiBrZXJuZWwgcGFuaWMuCgpXaXRoIHRoaXMgcGF0Y2gsIHZyaW5nX3VzZV9kbWFfYXBpIHdp
bGwgcmV0dXJuIGZhbHNlLCBhbmQKdnJpbmdfbWFwX29uZV9zZyB3aWxsIHJldHVybiBzZ19waHlz
KHNnKSB3aGljaCBpcyB0aGUgY29ycmVjdCBwaHlzCmFkZHJlc3MgaW4gdGhlIHByZWRlZmluZWQg
bWVtb3J5IHJlZ2lvbi4KdnJpbmdfbWFwX29uZV9zZyAtPiB2cmluZ191c2VfZG1hX2FwaQogICAg
ICAgICAgICAgICAgIC0+IHNnX3BoeXMoc2cpCgpTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVu
Zy5mYW5AbnhwLmNvbT4KLS0tCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19yaW5nLmMKaW5kZXggY2Q3ZTc1NTQ4NGUzLi44OTkzZDdjYjM1OTIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3Jp
bmcuYwpAQCAtMjQ4LDYgKzI0OCw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2aXJ0cXVldWVfdXNl
X2luZGlyZWN0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKIAogc3RhdGljIGJvb2wgdnJpbmdfdXNl
X2RtYV9hcGkoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCiB7CisJc3RydWN0IGRldmljZSAq
ZG1hX2RldiA9IHZkZXYtPmRldi5wYXJlbnQ7CisKIAlpZiAoIXZpcnRpb19oYXNfaW9tbXVfcXVp
cmsodmRldikpCiAJCXJldHVybiB0cnVlOwogCkBAIC0yNjAsNyArMjYyLDcgQEAgc3RhdGljIGJv
b2wgdnJpbmdfdXNlX2RtYV9hcGkoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCiAJICogdGhl
IERNQSBBUEkgaWYgd2UncmUgYSBYZW4gZ3Vlc3QsIHdoaWNoIGF0IGxlYXN0IGFsbG93cwogCSAq
IGFsbCBvZiB0aGUgc2Vuc2libGUgWGVuIGNvbmZpZ3VyYXRpb25zIHRvIHdvcmsgY29ycmVjdGx5
LgogCSAqLwotCWlmICh4ZW5fZG9tYWluKCkpCisJaWYgKHhlbl9kb21haW4oKSAmJiAhZG1hX2Rl
di0+ZG1hX21lbSkKIAkJcmV0dXJuIHRydWU7CiAKIAlyZXR1cm4gZmFsc2U7Ci0tIAoyLjE0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
