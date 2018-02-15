From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 1/2] pvcalls-front: introduce a per
 sock_mapping refcount
Date: Thu, 15 Feb 2018 10:49:26 +0100
Message-ID: <22b701d1-6ce1-2b15-f5da-9ad2545641ac__4790.36678229949$1518688128$gmane$org@suse.com>
References: <alpine.DEB.2.10.1802141023400.5392@sstabellini-ThinkPad-X260>
 <1518632904-20267-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nc0x=fj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1emGAU-0005uh-M6
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 09:49:30 +0000
In-Reply-To: <1518632904-20267-1-git-send-email-sstabellini@kernel.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: Stefano Stabellini <stefano@aporeto.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDIvMTggMTk6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBJbnRyb2R1Y2Ug
YSBwZXIgc29ja19tYXBwaW5nIHJlZmNvdW50LCBpbiBhZGRpdGlvbiB0byB0aGUgZXhpc3RpbmcK
PiBnbG9iYWwgcmVmY291bnQuIFRoYW5rcyB0byB0aGUgc29ja19tYXBwaW5nIHJlZmNvdW50LCB3
ZSBjYW4gc2FmZWx5IHdhaXQKPiBmb3IgaXQgdG8gYmUgMSBpbiBwdmNhbGxzX2Zyb250X3JlbGVh
c2UgYmVmb3JlIGZyZWVpbmcgYW4gYWN0aXZlIHNvY2tldCwKPiBpbnN0ZWFkIG9mIHdhaXRpbmcg
Zm9yIHRoZSBnbG9iYWwgcmVmY291bnQgdG8gYmUgMS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9AYXBvcmV0by5jb20+CgpBY2tlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
