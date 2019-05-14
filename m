From: Filippo Sironi <sironi@amazon.de>
Subject: KVM: Start populating /sys/hypervisor with KVM entries
Date: Tue, 14 May 2019 17:16:40 +0200
Message-ID: <1557847002-23519-1-git-send-email-sironi__8854.4800107897$1557847888$gmane$org@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jxAo=TO=amazon.com=prvs=030dd7525=sironi@srs-us1.protection.inumbo.net>)
 id 1hQZAo-0004Oe-86
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:16:58 +0000
In-Reply-To: <1539078879-4372-1-git-send-email-sironi@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, borntraeger@de.ibm.com, boris.ostrovsky@oracle.com, cohuck@redhat.com, konrad.wilk@oracle.com, xen-devel@lists.xenproject.org, vasu.srinivasan@oracle.com
List-Id: xen-devel@lists.xenproject.org

TG9uZy10aW1lIFhlbiBIVk0gYW5kIFhlbiBQViB1c2VycyBhcmUgbWlzc2luZyAvc3lzL2h5cGVy
dmlzb3IgZW50cmllcyB3aGVuCm1vdmluZyB0byBLVk0uICBPbmUgcmVwb3J0IGlzIGFib3V0IGdl
dHRpbmcgdGhlIFZNIFVVSUQuICBUaGUgVk0gVVVJRCBjYW4KYWxyZWFkeSBiZSByZXRyaWV2ZWQg
dXNpbmcgL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZG1pL2lkL3Byb2R1Y3RfdXVpZC4gIFRoaXMgaGFz
CnR3byBkb3duc2lkZXM6ICgxKSBpdCByZXF1aXJlcyByb290IHByaXZpbGVnZXMgYW5kICgyKSBp
dCBpcyBvbmx5IGF2YWlsYWJsZSBvbgpLVk0gYW5kIFhlbiBIVk0uCgpCeSBleHBvc2luZyAvc3lz
L2h5cGVydmlzb3IvdXVpZCB3aGVuIHJ1bm5pbmcgb24gS1ZNIGFzIHdlbGwsIHdlIHByb3ZpZGUg
YW4KaW50ZXJmYWNlIHRoYXQncyBmdW5jdGlvbmFsIGZvciBLVk0sIFhlbiBIVk0sIGFuZCBYZW4g
UFYuICBMZXQncyBkbyBzbyBieQpwcm92aWRpbmcgYXJjaC1zcGVjaWZpYyBob29rcyBzbyB0aGF0
IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzIGNhbiBpbXBsZW1lbnQgdGhlCmhvb2tzIGluIGRpZmZl
cmVudCB3YXlzLgoKRnVydGhlciB3b3JrIGNhbiBiZSBkb25lIGJ5IGNvbnNvbGlkYXRpbmcgdGhl
IGNyZWF0aW9uIG9mIHRoZSBiYXNpYwovc3lzL2h5cGVydmlzb3IgYWNyb3NzIGh5cGVydmlzb3Jz
LgoKRmlsaXBwbyBTaXJvbmkgKDIpOgogICAgICBLVk06IFN0YXJ0IHBvcHVsYXRpbmcgL3N5cy9o
eXBlcnZpc29yIHdpdGggS1ZNIGVudHJpZXMKICAgICAgS1ZNOiB4ODY6IEltcGxlbWVudCB0aGUg
YXJjaC1zcGVjaWZpYyBob29rIHRvIHJlcG9ydCB0aGUgVk0gVVVJRAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
