From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] pvcalls-front: read all data before closing
 the connection
Date: Fri, 21 Dec 2018 15:06:29 -0800
Message-ID: <1545433593-18874-1-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gaTsK-00006F-9t
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 23:06:36 +0000
In-Reply-To: <alpine.DEB.2.10.1812211501280.15901@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Stefano Stabellini <stefanos@xilinx.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiBhIGNvbm5lY3Rpb24gaXMgY2xvc2luZyBpbl9lcnJvciBpcyBzZXQgdG8gRU5PVENPTk4u
IFRoZXJlIGNvdWxkCnN0aWxsIGJlIG91dHN0YW5kaW5nIGRhdGEgb24gdGhlIHJpbmcgbGVmdCBi
eSB0aGUgYmFja2VuZC4gQmVmb3JlCmNsb3NpbmcgdGhlIGNvbm5lY3Rpb24gb24gdGhlIGZyb250
ZW5kIHNpZGUsIGRyYWluIHRoZSByaW5nLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgotLS0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQu
YyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2RyaXZlcnMveGVu
L3B2Y2FsbHMtZnJvbnQuYwppbmRleCA3NzIyNGQ4Li5lNWQ5NWFhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMKKysrIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5j
CkBAIC01NjAsMTUgKzU2MCwxMyBAQCBzdGF0aWMgaW50IF9fcmVhZF9yaW5nKHN0cnVjdCBwdmNh
bGxzX2RhdGFfaW50ZiAqaW50ZiwKIAllcnJvciA9IGludGYtPmluX2Vycm9yOwogCS8qIGdldCBw
b2ludGVycyBiZWZvcmUgcmVhZGluZyBmcm9tIHRoZSByaW5nICovCiAJdmlydF9ybWIoKTsKLQlp
ZiAoZXJyb3IgPCAwKQotCQlyZXR1cm4gZXJyb3I7CiAKIAlzaXplID0gcHZjYWxsc19xdWV1ZWQo
cHJvZCwgY29ucywgYXJyYXlfc2l6ZSk7CiAJbWFza2VkX3Byb2QgPSBwdmNhbGxzX21hc2socHJv
ZCwgYXJyYXlfc2l6ZSk7CiAJbWFza2VkX2NvbnMgPSBwdmNhbGxzX21hc2soY29ucywgYXJyYXlf
c2l6ZSk7CiAKIAlpZiAoc2l6ZSA9PSAwKQotCQlyZXR1cm4gMDsKKwkJcmV0dXJuIGVycm9yID86
IHNpemU7CiAKIAlpZiAobGVuID4gc2l6ZSkKIAkJbGVuID0gc2l6ZTsKLS0gCjEuOS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
