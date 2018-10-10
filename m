From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 1/3] x86/xen: fix boot loader version
 reported for pvh guests
Date: Wed, 10 Oct 2018 08:14:54 +0200
Message-ID: <20181010061456.22238-2-jgross__25942.1024624773$1539152038$gmane$org@suse.com>
References: <20181010061456.22238-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mkav=mw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gA7lv-0002lP-FA
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 06:15:03 +0000
In-Reply-To: <20181010061456.22238-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, corbet@lwn.net, stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

VGhlIGJvb3QgbG9hZGVyIHZlcnNpb24gcmVwb3J0ZWQgdmlhIHN5c2ZzIGlzIHdyb25nIGluIGNh
c2Ugb2YgdGhlCmtlcm5lbCBiZWluZyBib290ZWQgdmlhIHRoZSBYZW4gUFZIIGJvb3QgZW50cnku
IGl0IHNob3VsZCBiZSAyLjEyCigweDAyMGMpLCBidXQgaXQgaXMgcmVwb3J0ZWQgdG8gYmUgMi4x
OCAoMHgwMjEyKS4KCkFzIHRoZSBjdXJyZW50IHdheSB0byBzZXQgdGhlIHZlcnNpb24gaXMgZXJy
b3IgcHJvbmUgdXNlIHRoZSBtb3JlCnJlYWRhYmxlIHZhcmlhbnQgKDIgPDwgOCkgfCAxMi4KCkNj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA0LjEyClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYyBiL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHZoLmMKaW5kZXggYzg1ZDFhODhmNDc2Li5mN2Y3NzAyMzI4OGEgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKKysrIGIvYXJjaC94ODYveGVuL2VubGln
aHRlbl9wdmguYwpAQCAtNzUsNyArNzUsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9wdmhf
Ym9vdHBhcmFtcyh2b2lkKQogCSAqIFZlcnNpb24gMi4xMiBzdXBwb3J0cyBYZW4gZW50cnkgcG9p
bnQgYnV0IHdlIHdpbGwgdXNlIGRlZmF1bHQgeDg2L1BDCiAJICogZW52aXJvbm1lbnQgKGkuZS4g
aGFyZHdhcmVfc3ViYXJjaCAwKS4KIAkgKi8KLQlwdmhfYm9vdHBhcmFtcy5oZHIudmVyc2lvbiA9
IDB4MjEyOworCXB2aF9ib290cGFyYW1zLmhkci52ZXJzaW9uID0gKDIgPDwgOCkgfCAxMjsKIAlw
dmhfYm9vdHBhcmFtcy5oZHIudHlwZV9vZl9sb2FkZXIgPSAoOSA8PCA0KSB8IDA7IC8qIFhlbiBs
b2FkZXIgKi8KIAogCXg4Nl9pbml0LmFjcGkuZ2V0X3Jvb3RfcG9pbnRlciA9IHB2aF9nZXRfcm9v
dF9wb2ludGVyOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
